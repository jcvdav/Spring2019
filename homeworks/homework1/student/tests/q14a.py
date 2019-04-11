test = {   'name': 'q14a',
    'points': 2,
    'suites': [   {   'cases': [   {   'code': '>>> \n'
                                               '>>> '
                                               'len(bootstrap_data_means(election_sub))\n'
                                               '19',
                                       'hidden': False,
                                       'locked': False},
                                   {   'code': '>>> \n'
                                               '>>> all(election_agg.index == '
                                               'bootstrap_data_means(election_sub).index)\n'
                                               'True',
                                       'hidden': False,
                                       'locked': False},
                                   {   'code': '>>> \n'
                                               ">>> 'mean' in "
                                               'bootstrap_data_means(election_sub).columns\n'
                                               'True',
                                       'hidden': False,
                                       'locked': False},
                                   {   'code': '>>> \n'
                                               '>>> '
                                               'np.shape(bootstrap_election_100_agg)\n'
                                               '(19, 100)',
                                       'hidden': False,
                                       'locked': False}],
                      'scored': True,
                      'setup': '',
                      'teardown': '',
                      'type': 'doctest'}]}
