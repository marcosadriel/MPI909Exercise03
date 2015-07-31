/*
	Autor: Marcos Adriel Sampaio Rost
	Data: 20/07/2015
	Referência: CAMERON, Dane. A software engineer learns: HTML5, JavaScript e jQuery. Cover Design Studio: 2013.
 */
tasksController = function() {
	function errorLogger(errorCode, errorMessage) {
		console.log(errorCode +':'+ errorMessage);
	}
	var taskPage;
	var initialised = false;
	// Conta as atividades inseridas
	function taskCountChanged() {
		var count = $(taskPage).find( '#tblTasks tbody tr').length;
		var completadas = $(taskPage).find('.taskCompleted').parents('tr').length;
		$('footer').find('#taskCount').text(count - completadas);
	}
	// Verifica se as tarefas estão dentro do prazo
	function renderTable() {
		$.each($(taskPage).find('#tblTasks tbody tr'), function(idx, row) {
			var due = Date.parse($(row).find('[datetime]').text());
			if (due.compareTo(Date.today()) < 0) {
				$(row).addClass("overdue");
			} else if (due.compareTo((2).days().fromNow()) <= 0) {
				$(row).addClass("warning");
			}
		});
	}
	return {
		init : function(page) {
			// Inicializa o webstorage
			storageEngine.init(function() {
					storageEngine.initObjectStore('task', function() {}, errorLogger) 
			}, errorLogger);

			if (!initialised) {
				taskPage = page;
				$(taskPage).find( '[required="required"]' ).prev('label').append( '<span>*</span>').children( 'span').addClass('required');
				$(taskPage).find('tbody tr:even').addClass('even');
				
				$(taskPage).find( '#btnAddTask' ).click( function(evt) {
					evt.preventDefault();
					$(taskPage ).find('#taskCreation' ).removeClass( 'not');
				});
				/* Versão inicial do listener para destacar linhas clicadas na tabela

				$(taskPage).find('tbody tr' ).click(function(evt) {
					$(evt.target ).closest('td').siblings().andSelf().toggleClass( 'rowHighlight');
				});
				*/
				
				/* Versão funcional do listener para destacar as linhas clicadas na tabela
				 * após as diversas atualizações da tabela realizadas pelas demais funções criadas.
				 */
				$(taskPage).find('#tblTasks tbody').on('click', 'tr', function(evt) {
					$(evt.target).closest('td').siblings().andSelf().toggleClass('rowHighlight');
				});

				$(taskPage).find('#tblTasks tbody').on('click', '.deleteRow', function(evt) { 
					storageEngine.delete('task', $(evt.target).data().taskId,
						function() {
							$(evt.target).parents('tr').remove();
							//Atualiza o número de tarefas no rodapé
							taskCountChanged() 
						}, errorLogger);
				});
				/* Versão inicial da função de salvamento
				$(taskPage).find( '#saveTask' ).click(function(evt) {
					evt.preventDefault();
					var task = $('form').toObject();
					if ($(taskPage).find('form').valid()){
						$('#taskRow').tmpl( task).appendTo($(taskPage ).find( '#tblTasks tbody'));
					}
				});*/
				/* Versão secundária da função de salvamento (sem atualização da tabela)
				$(taskPage).find( '#saveTask' ).click(function(evt) {
					evt.preventDefault();
					if ($(taskPage).find('form').valid()) {
						var task = $('form').toObject();
						storageEngine.save(
							'task', 
							task,
							function(savedTask) {
								$('#taskRow').tmpl(savedTask).appendTo($(taskPage).find('#tblTasks tbody'));
							}, 
							errorLogger
							);
					}
				});*/
				$(taskPage).find('#saveTask').click(function(evt) {
					evt.preventDefault();
					if ($(taskPage).find('form').valid()) {
						var task = $(taskPage).find('form').toObject();
						storageEngine.save('task', task, function() {
							$(taskPage).find('#tblTasks tbody').empty();
							tasksController.loadTasks();
							$(':input').val('');
							$(taskPage).find('#taskCreation').addClass('not');
						}, errorLogger);
					}
				});
				$(taskPage).find('#tblTasks tbody').on('click', '.editRow', function(evt) { 
					$(taskPage).find('#taskCreation').removeClass('not');
					storageEngine.findById('task', $(evt.target).data().taskId, function(task) {
						$(taskPage).find('form').fromObject(task);
					}, errorLogger);
				});

				// Listener para o evento click do botão limpar
				// insere '' nos valores de cada input
				$(taskPage).find('#clearTask').click(function(evt) {
					evt.preventDefault();
					var task = $(taskPage).find('form').toObject();
					$(':input').val('');
				});
				/* Versão inicial do código para marcar tarefas como completadas
				$(taskPage).find('.completeRow').click(function(evt) {
					$(evt.target ).closest('td').siblings( ).toggleClass( 'taskCompleted');
				})*/
				$(taskPage).find('#tblTasks tbody').on('click', '.completeRow', function(evt) {
					storageEngine.findById('task', $(evt.target).data().taskId, function(task) {
						task.complete = true;
						storageEngine.save('task', task, function() {
							tasksController.loadTasks();
						},errorLogger);
					}, errorLogger);
				});

				initialised = true;
			}
    	},
		loadTasks : function() {
			// Limpa a tabela de tarefas pré-existente
			$(taskPage).find('#tblTasks tbody').empty();
			storageEngine.findAll('task', 
				function(tasks) {
					// Organiza a tabela de tarefas conforme a data para realização
					tasks.sort(function(o1, o2) {
						return Date.parse(o1.requiredBy).compareTo( Date.parse(o2.requiredBy));
					});
					$.each(tasks, function(index, task) {
						if (!task.complete) {
							task.complete = false;
						}
						$('#taskRow').tmpl(task ).appendTo( $(taskPage ).find( '#tblTasks tbody'));
					});
					// Invoca a contagem de tarefas inseridas na tabela
					taskCountChanged();
					// Invoca a verificação do prazo para realização das tabelas
					renderTable();
				}, 
				errorLogger);
		},
		}
}();