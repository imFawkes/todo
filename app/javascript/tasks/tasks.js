export {toggleSubtasksButton}

const toggleSubtasksButton = () => {
  const handler = () => {
    document.querySelector(".columnRight").classList.toggle('hide')
  }

  const btns = document.querySelectorAll('.toggle_subtasks')

  for (let btn of btns) {
    btn.addEventListener( "click" , handler)
  }
} 