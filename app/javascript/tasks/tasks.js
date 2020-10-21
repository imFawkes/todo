export {toggleSubtasksButton}

const toggleSubtasksButton = () => {
  const handler = () => {
    document.querySelector(".column-right").classList.toggle('hide')
  }

  const btns = document.querySelectorAll('.toggle_subtasks')

  for (let btn of btns) {
    btn.addEventListener( "click" , handler)
  }
} 