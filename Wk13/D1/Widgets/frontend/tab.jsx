import ReactDOM from "react-dom";
import React from "react";


class Tab extends React.Component {
    constructor(props) {
        super(props);
        // debugger
        
    }
    
    render() {
        return (
            
            <ul>
                <li>    
                    <h1>{this.props.a[0].title}</h1>
                    <article>
                        {this.props.a[0].content}
                    </article>
                </li>
                <li>
                    <h1>{this.props.a[1].title}</h1>
                    <article>
                        {this.props.a[1].content}
                    </article>
                </li>
            </ul>
            
            
        )
    }
    
    
}



export default {Tab, Header};
// export default Header;



// return (
//     <div>
//         <h1>Tabs</h1>
//         <div className='tabs'>
//             <Headers
//                 selectedPane={this.state.selectedPane}
//                 onTabChosen={this.selectTab}
//                 panes={this.props.panes}>
//             </Headers>
//             <div className='tab-content'>
//                 <article>
//                     {pane.content}
//                 </article>
//             </div>
//         </div>
//     </div>
