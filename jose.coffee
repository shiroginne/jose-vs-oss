commentForm = document.querySelector '.js-new-comment-form'

if commentForm
  actions     = commentForm.querySelector '.form-actions'
  close       = actions.querySelector '.js-comment-and-button'
  comment     = actions.querySelector '.primary'
  textarea    = commentForm.querySelector 'textarea'
  tip         = actions.querySelector '.tip'

  actions.removeChild(tip) if tip

  button = (text, innerHtml, closable = true) ->
    btn = document.createElement 'button'
    text = document.createTextNode text

    btn.appendChild text
    btn.className = 'classy'
    btn.setAttribute 'tabindex', '1'
    btn.setAttribute 'type', 'submit'
    btn.setAttribute 'style', 'margin-right: 4px;'

    btn.addEventListener 'click', (event) ->
      do event.preventDefault
      textarea.innerHTML = innerHtml

      if closable then do close.click else do comment.click

      textarea.innerHTML = ''

    btn

  insertButtons = ->
    div = document.createElement 'div'
    div.setAttribute 'style', 'float: left'

    # Sample application
    btn = button 'Sample app', 'Can you please provide a sample application that reproduces the error?', false
    div.appendChild btn

    # Wiki
    btn = button "Wiki", "The wiki is maintained by the community. So if there aren't any up to date instructions, we recommend you to explore the solution yourself and hopefully contribute your findings back!"
    div.appendChild btn

    # Mailing list
    btn = button "Mailing list", "Please use the mailing list or StackOverflow for questions"
    div.appendChild btn

    # Bug report
    btn = button "Bad bug report", "You need to give us more information on how to reproduce this issue, otherwise there is nothing we can do. Please read CONTRIBUTING.md file for more information about creating bug reports. Thanks!"
    div.appendChild btn

    actions.appendChild div

  do insertButtons if commentForm && close
