
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/73f9db3b3cde41b49bd9ac576c1ed66d)](https://www.codacy.com/gh/marshki/guest_wifi/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=marshki/guest_wifi&amp;utm_campaign=Badge_Grade)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/Naereen/StrapDown.js/graphs/commit-activity)
![Perl](https://img.shields.io/badge/perl-%2339457E.svg?style=for-the-badge&logo=perl&logoColor=white)
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/hyperium/hyper/master/LICENSE)
[![Open Source Love svg3](https://badges.frapsoft.com/os/v3/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badges/)

## NAME

**guest_wifi** - Extract weekly "nyuguest" WiFi credentials.

### SYNOPSIS

Extract weekly "[nyuguest](https://nyu.service-now.com/sp?sys_kb_id=2a8496910f5a8a044d20348ce1050e13&id=kb_article_view&sysparm_rank=12&sysparm_tsqueryId=0bd7a2721b537810839598651a4bcbda)" WiFi credentials using Perl. Requires access to NYU-NET (campus wide area network (*WAN*)), and a valid NetID.

Credentials are valid for one (1) week from 12:00:01 Eastern Standard Time (EST) Monday.

### SAMPLE OUTPUT

    Current time: Thu Jan 12 15:50:27 EST 2023
    Enter your NetID: lilcuckoo0211 
    Enter your password: 
    Scraping HTML from NYUROAM page... 
    Parsing region of interest (ROI) from HTML... 

    |Guest Username |Password       | 
    |-------------- |-------------- |
    |guest160       |ataichme       |

#### AUTHOR

M. Krinitz <mjk235 [at] nyu [dot] edu>

#### LICENSE

Copyright <2021> <M. Krinitz>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#### NOTES

NYU will be sunsetting the guest WiFi credentials mechanism as described [here](https://www.nyu.edu/life/information-technology/about-nyu-it/nyu-it-news/the-download/the-download-features/nyuguest-wifi-portal.html). The replacement portal allows users with a valid NetID to self-generate credentials [here](https://guestwifi.nyu.edu/).
