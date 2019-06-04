# Final Project

The final project is an opportunity to use the ideas from this course for exploring interesting data science problems.
You will work on the project in a group of four. 

## Logistics

__Project group__: Please work in a group of four. If you cannot find a group of three or four. Feel free to use [Search for Teammates!](https://piazza.com/class/jttf1pa8is5eb?cid=5) feature on Piazza.

__Progress report (Due May 17 at 10 pm on GauchoSpace)__: A one page document containing your group members, proposed data set, and project outline. Project goals can change.

__Poster presentation (June 11, 8-11 am)__: Being able to communicate your project is important. There will be a "[poster session](https://www.youtube.com/watch?v=AwMFhyH7_5g)" during the class final exam time. You will be graded on your poster as well as get feedback from the teaching staff and your classmates.

__Report (Due June 13 at 10 pm on GauchoSpace)__: You need to provide a Jupyter notebook report of your project. You may use multiple notebooks to separate material into parts (also, in order to avoid any large notebook issues). If your project is not accepted by GauchoSpace due to space limitation (100 MB), prepare a shared zip-archive of complete set of files needed to run your project on Box: https://ucsb.account.box.com/login. Everyone at UCSB has an unlimited storage using this service. Indicate the URL location of your shared zip-archive on your Jupyter notebooks on GauchoSpace, and indicate the shared link on your notebook. Note that any file that needs to be downloaded using API keys, etc, need to be pickled into a separate file(s) and made available in the zipped-archive.

## Possible Project Ideas

### Basketball

NBA website provides many different types of data. Some project ideas are:

Exploring feature engineering for basketball data:   
NBA website [glossary](http://stats.nba.com/help/glossary/) offers many engineered features. For example, search for `DEFRTG`. Are these useful for discrimination or prediction?
What features seem to discriminate a class label? e.g., wins vs. losses, home game vs. away game, defensive player vs. offensive player, etc.
Can you design your useful features? Can you show that your features are useful qualitatively? quantitatively?
You also build classification models using your new features
  
### Portfolio Optimization

Minimum variance portfolio selection problem was discussed in a naive setting to illustrate the theory. 
Using the theory in practice, however, requires a more sophisticated approach. 
For example, since real financial market is not stationary, portfolio weights needs to be recomputed periodically (called rebalancing).
Costs associated with trades need to be included in the calculation: borrowing cost, transaction cost, etc.
For reference, you can refer to Appendix J in [this paper](https://arxiv.org/abs/1307.5381) for details. 
A pre-built package that powers a quantitative trading strategy site is [Quantopian](https://www.quantopian.com/home).
They release a package that powers [their site](http://www.zipline.io/). The package takes care of the details. 
Refer to some examples [here](http://www.zipline.io/beginner-tutorial.html).  
A project idea is to tackle minimum variance portfolio investment strategy with Zipline.

### Health data 

[NHANES dataset](https://www.cdc.gov/nchs/nhanes/nhanes_questionnaires.htm) is a vast resource of open health datasets.
You can extend the health data module for your project. Many papers have been published using NHANES dataset, so web search will give you some ideas. You can extend the ideas from health module in ways you think are interesting.

### Yelp 

In later part of the course, we will use Yelp reviews to work with text data. 
You can consider doing a project using text data. Python has a wealth of packages for working with text data. 
Even with simple tools, one can do a lot with text. Here is the link to a good [online resource](https://ucsb-primo.hosted.exlibrisgroup.com/primo-explore/fulldisplay?docid=01UCSB_ALMA51279011670003776&context=L&vid=UCSB&search_scope=default_scope&tab=default_tab&lang=en_US).

### Your project

You can work on your a project of your choosing. I would be glad to discuss your project topic.
