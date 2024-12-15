use crate::routes::*;
use std::net::TcpListener;

use actix_web::{
    dev::Server,
    middleware::Logger,
    web::{self},
    App, HttpServer,
};
use sqlx::PgPool;

/// The entry point to for the web server
///
/// * `listener`: The listener to use for the server
/// * `db_pool`: A database connection pool
pub fn run(listener: TcpListener, db_pool: PgPool) -> Result<Server, std::io::Error> {
    let db_pool = web::Data::new(db_pool);
    let server = HttpServer::new(move || {
        App::new()
            .wrap(Logger::default())
            .route("/health_check", web::get().to(health_check))
            .route("/subscriptions", web::post().to(subscribe))
            .app_data(db_pool.clone())
    })
    .listen(listener)?
    .run();

    Ok(server)
}
