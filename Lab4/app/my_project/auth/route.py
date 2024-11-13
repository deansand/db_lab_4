from flask import Blueprint, request
from controller import FilmController, DirectorController

api_bp = Blueprint('api', __name__)

@api_bp.route('/films', methods=['GET'])
def get_all_films():
    return FilmController.get_all_films()

@api_bp.route('/films/<int:film_id>', methods=['GET'])
def get_film(film_id):
    return FilmController.get_film(film_id)

@api_bp.route('/films', methods=['POST'])
def add_film():
    data = request.get_json()
    return FilmController.add_film(data)

@api_bp.route('/films/<int:film_id>', methods=['PUT'])
def update_film(film_id):
    data = request.get_json()
    return FilmController.update_film(film_id, data)

@api_bp.route('/films/<int:film_id>', methods=['DELETE'])
def delete_film(film_id):
    return FilmController.delete_film(film_id)

@api_bp.route('/directors', methods=['GET'])
def get_all_directors():
    return DirectorController.get_all_directors()

@api_bp.route('/directors/<int:director_id>', methods=['GET'])
def get_director(director_id):
    return DirectorController.get_director(director_id)

@api_bp.route('/directors/<int:director_id>/movies', methods=['GET'])
def get_movies_by_director(director_id):
    return DirectorController.get_movies_by_director(director_id)