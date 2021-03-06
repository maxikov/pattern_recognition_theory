function [mus, sigmas, posprior] = train_independent_gauss(features, labels)
    positive_samples = features(labels == 1, :);
    negative_samples = features(labels == -1, :);
    posprior = size(positive_samples, 1) / size(features, 1);
    neg_mus = mean(negative_samples);
    neg_sigmas = std(negative_samples);
    pos_mus = mean(positive_samples);
    pos_sigmas = std(positive_samples);
    mus = [neg_mus; pos_mus];
    sigmas = [neg_sigmas; pos_sigmas];
end