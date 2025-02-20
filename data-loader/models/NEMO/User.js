var Sequelize = require('sequelize');

module.exports = function(sequelize) {
  return sequelize.define('User', {
    ID: {
      type: Sequelize.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    UserTypeID: {
      type: Sequelize.INTEGER(11),
      allowNull: false,
      references: {
        model: 'UserType',
        key: 'ID'
      }
    },
    Email: {
      type: Sequelize.STRING,
      allowNull: false
    },
    Hash: {
      type: Sequelize.STRING,
      allowNull: false
    },
    First: {
      type: Sequelize.STRING,
      allowNull: false
    },
    Last: {
      type: Sequelize.STRING,
      allowNull: false
    },
    Affiliation: {
      type: Sequelize.STRING,
      allowNull: false
    },
    Confirmed: {
      type: Sequelize.BOOLEAN,
      allowNull: false
    },
    ConfirmationHash: {
      type: Sequelize.STRING,
      allowNull: false
    },
  }, {
    tableName: 'User',
    freezeTableName: true,
    timestamps: false
  });
};
