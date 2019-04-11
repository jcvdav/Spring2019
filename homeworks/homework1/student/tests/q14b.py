test = {   'name': 'q14b',
    'points': 2,
    'suites': [   {   'cases': [   {   'code': '>>> \n'
                                               '>>> '
                                               'all(bootstrap_election_agg.columns '
                                               "== ['mean', 'err_low', "
                                               "'err_high'])\n"
                                               'True',
                                       'hidden': False,
                                       'locked': False},
                                   {   'code': '>>> \n'
                                               '>>> '
                                               'np.shape(bootstrap_election_agg) '
                                               '== (len(election_agg), 3)\n'
                                               'True',
                                       'hidden': False,
                                       'locked': False}],
                      'scored': True,
                      'setup': '',
                      'teardown': '',
                      'type': 'doctest'}]}
