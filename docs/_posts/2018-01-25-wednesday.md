# How to approach NLP problems
[Medium article](https://blog.insightdatascience.com/how-to-solve-90-of-nlp-problems-a-step-by-step-guide-fda605278e4e)
- Gather dataset & label data - any model can be only as good as the data
- Cleanup - remove numbers & urls, lowercase, tokenize, spelling correction, [lemmatization](https://nlp.stanford.edu/IR-book/html/htmledition/stemming-and-lemmatization-1.html) (is, are, am -> be)
- Encoding - one-hot, aka bag of words - convert to (mostly empty) vector, loose the information on order of words.
- Classification - logistic regression
- Inspection - confusion matrix and plot most important words
- [TF-IDF](https://en.wikipedia.org/wiki/Tf%E2%80%93idf) - discount the most popular words & see results
- Semantic meaning of words - [Word2Vec](https://arxiv.org/abs/1301.3781) - encode words as 300-dimension vector, so words like 'good' and 'positive' have similar representation. Helps with generalization and model works on new words, unseen during training.
Usage - represent each word in a sentence as word2vec, then average them to one vector o.O.
[GloVe](https://nlp.stanford.edu/projects/glove/) is a newer alternative.
- Explain becomes harder - one can use [LIME](https://arxiv.org/abs/1602.04938) - a black box explainer that works based on perturbing the model by removing single words. Works only on a single examples.
Can just run it on a bigger sample and identify the words coming up most often.
- Syntax - so far order of words didn't matter. To keep information about order, use [convolutional neural networks](https://arxiv.org/abs/1408.5882) - usually faster to train than more complex NLP approaches.
- More modern approach - [fasttext](https://github.com/facebookresearch/fastText) - for text representation and classification. It's implemented in Python's [gensim](https://radimrehurek.com/gensim/models/fasttext.html)
