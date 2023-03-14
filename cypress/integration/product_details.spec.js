describe("products on homepage", () => {
  beforeEach(() => {
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test
    cy.visit("/");
  });

  it("Visit an indivisual product page", () => {
    cy.get(".products article").should("be.visible");
    cy.get('[alt="Scented Blade"]').click();
    cy.get(".products-show").should("be.visible");
  });

  
});
