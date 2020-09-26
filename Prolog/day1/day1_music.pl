% Make a knowledge base representing musicians and instruments. Also
% represent musicians and their genre of music.
instrument(dimebag, guitar).
instrument(slash, guitar).
instrument(anselmo, vocal).
instrument(ulrich, drums).
instrument(travisscott, vocal).
instrument(buckethead, guitar).

genre(ulrich, metal).
genre(anselmo, metal).
genre(slash, rock).
genre(dimebag, metal).
genre(travisscott, hiphop).
genre(buckethead, funk).

% Find all musicians who play the guitar.
instrument(X, guitar).