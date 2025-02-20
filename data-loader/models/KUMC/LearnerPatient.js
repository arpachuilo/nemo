/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('LearnerPatient', {
    patient_num: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    }
  }, {
    tableName: 'LearnerPatient',
    freezeTableName: true
  });
};
