// // applying an onfocus command on the button div having id buttonBox



const target=document.getElementById("main");
const effect=(entries, observer)=>{
    entries.forEach(entry=>{
       
        const imgDiv = entry.target.querySelector(".content2");
        if (entry.isIntersecting) {
            imgDiv.style.display="inline-block"
            // Element is in view, apply the "in" animation
            imgDiv.classList.add("animateIn");
            imgDiv.classList.remove("animateOut");
        } else {
            // Element is out of view, apply the "out" animation
          
            imgDiv.classList.add("animateOut");
            imgDiv.classList.remove("animateIn");
             
        }
         
    })
}

const target2= document.getElementById("buttonContainer");
const effect2=(entries, observer)=>{
    entries.forEach(entry=>{
       
        const ele = entry.target.querySelector(".UserRegister");
        const ele2= entry.target.querySelector(".retailerRegister");
  
        if (entry.isIntersecting) {
            ele.style.display="inline-block"
            ele2.style.display="inline-block"
            // Element is in view, apply the "in" animation
            ele.classList.add("Bounce")
            ele2.classList.add("Bounce")
           
        } else {
            // Element is out of view, apply the "out" animation
           ele.style.display="none"
            ele2.style.display="none"
            ele.classList.remove("Bounce");
            ele2.classList.remove("Bounce");
            
        }
    })
}

// we have to create the object for the IntersectionObserver(callback,option)

const observer= new IntersectionObserver(effect,{
    threshold:0.8
})

const observer2= new IntersectionObserver(effect2,{
    threshold:0.8
})
observer2.observe(target2);
observer.observe(target);