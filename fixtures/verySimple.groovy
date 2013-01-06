import exp.*

fixture {
	q1(Question,text:'What is your gender?',options:['Male', 'Female'],defaultValue:'Male')
	q2(Question,text:'What is your name?',type:'short', defaultValue:'anonymous')
	q3(Question,text:'What is your comment?',options:[], defaultValue:'N/A')
	survey1(Survey,name:'A Very Simple Survey',questions:[q1,q2,q3])
}
