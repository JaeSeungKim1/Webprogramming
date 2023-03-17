const item=document.querySelector('.item');
item.addEventListener('dragstart',dragStartHandler);
function dragStartHandler(e){
    console.log('Drag Start');
    console.log(e.target,e.target.id);
    e.dataTransfer.setData('text/plain',e.target.id);
    console.log(e.dataTransfer);
    console.log(e.dataTransfer.getData('text/plain'));
    setTimeout(()=>{
        e.target.classList.add('hide');
    },1);
}

const boxes = document.querySelectorAll('.box');
console.log(boxes);
boxes.forEach(box=>{
    box.addEventListener('dragover',dragOverHandler);
    box.addEventListener('drop',dropHandler);
    box.addEventListener('dragleave',dragLeaveHandler);
});
function dragOverHandler(e) {
    console.log('Drag over');
    e.preventDefault();
    e.target.classList.add('drag-over')
}
function dropHandler(e){
    console.log('Drop!');
    e.preventDefault();
    const id = e.dataTransfer.getData('text/plain');
    console.log(id);
    const dragItem=document.getElementById(id);
    e.target.appendChild(dragItem);
    e.target.classList.remove('drag-over');
    dragItem.classList.remove('hide');
}
function dragLeaveHandler(e){
    console.log('Drag Leave');
    e.target.classList.remove('drag-over');
}

