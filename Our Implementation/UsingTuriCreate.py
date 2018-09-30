import turicreate as tc
import os

# CREATE THE TURICREATE mlmodel
# train_data = tc.image_analysis.load_images('Data', with_path=True)
#
# train_data["label"] = train_data["path"].apply(lambda path: os.path.basename(os.path.split(path)[0]))
#
# train_data, test_data = train_data.random_split(0.8)
#
# model = tc.image_classifier.create(train_data, target='label')
#
# predictions = model.predict(test_data)
#
# metrics = model.evaluate(test_data)
# print(metrics['accuracy'])
#
# model.save('animal.model')
#
# model.export_coreml('AnimalClassifier.mlmodel')

#CREATE SIMILAR IMAGE FINDER

reference_data = tc.image_analysis.load_images('./SimilarityData')
reference_data = reference_data.add_row_number()


model = tc.image_similarity.create(reference_data)

query_results = model.query(reference_data[0:10], k=10)

query_results.head()

reference_data[9]['image'].show()
similar_rows = query_results[query_results['query_label'] == 9]['reference_label']
reference_data.filter_by(similar_rows, 'id').explore()
model.export_coreml('SimilarAnimals.mlmodel')
