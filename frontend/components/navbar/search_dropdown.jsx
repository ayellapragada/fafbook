import React from 'react';
import { Link } from 'react-router';

import SearchResultItem from './search_result_item';

class SearchDropDown extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const resultsArray = Object.values(this.props.results);

    let searchResults;

    if (resultsArray.length > 0) {
      searchResults = resultsArray.map((res) => {
        return(
          <li key={res.id}>
            <SearchResultItem res={res} key={res.id}/>
          </li>
        ) ;
      });

    } else {
      searchResults = [
        <li 
        className="empty-search" 
        key="what">No results found.
        </li>];
    }

    return (
      <div 
        onClick={this.props.handleClickOutside}
        className="search-dropdown">
        <div className="search-header">
          SEARCHES
        </div>
        <ul>
          { searchResults } 
        </ul>
      </div>
    );
  }
}


export default SearchDropDown;
