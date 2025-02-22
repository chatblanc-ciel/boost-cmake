_add_boost_lib(
  NAME atomic
  SOURCES
    ${boost_SOURCE_DIR}/libs/atomic/src/lock_pool.cpp
  DEFINE_PRIVATE
    BOOST_ATOMIC_STATIC_LINK=1
    BOOST_ATOMIC_SOURCE
)

_add_boost_test(
  NAME atomic_test
  LINK
    Boost::atomic
    Boost::thread
  DEFINE
    # The tests expect APIs deprecated in Thread v4, so enable them
    BOOST_THREAD_PROVIDES_NESTED_LOCKS=1
    BOOST_THREAD_USES_DATETIME=1
  TESTS
    RUN ${boost_SOURCE_DIR}/libs/atomic/test/atomic_api.cpp
    RUN ${boost_SOURCE_DIR}/libs/atomic/test/fallback_api.cpp
    RUN ${boost_SOURCE_DIR}/libs/atomic/test/atomicity.cpp
    RUN ${boost_SOURCE_DIR}/libs/atomic/test/ordering.cpp
    RUN ${boost_SOURCE_DIR}/libs/atomic/test/lockfree.cpp
)
