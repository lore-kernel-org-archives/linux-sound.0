Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010038.outbound.protection.outlook.com [52.101.229.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF458377A96
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 02:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946711; cv=fail; b=orDX/eEfrcKHy3ZYCYH3IF5CQV77EKJyKZnDSvw+LBu3du++NU1t1jk+6I88VZfSS6LxcuPzwHcQMwA5RnsnkD97LT9NRyFt53WUSbg1QOBN/x6RJb8JF+ZLodbBMIye0tCtiq6HPNW04jWbNS1k4F1FMYHvqoNXB3HlMPixhfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946711; c=relaxed/simple;
	bh=FBalF7NIT5V4dc1R5R2rTWFOrNNKEY9wjNMur01VcYM=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=hULvwo0gyldSslSZ5QF4aqmBIdHaGdTyvxz9P1uetcHLyTD1s664pKXqfJmx9H3ISjnR1ma+bV6RI6pzJlj+QydDqohoIXSBLRxqdWv/rAfEftnJ2xcj1DoFEM2IgRuu5CCEmKTATQie3fE9bKHKz4ZGyLoPXT+Ug+Q1C/bjZhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZYscwOW1; arc=fail smtp.client-ip=52.101.229.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZYscwOW1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHgyg2L684F78d6K53QqganmyscburDIJXa3uk65JCcovRzFoUeGgojq5ng8FtS51wzZZXP5GaZYYez5btaRQv2S/AR9dMCHD7sGQDSPTIINaVqo2WMog2/EOxzqpsdQFjMAdIWZ6u9wrg3772Q9zPe7OuhY8Q99z+LzhRwr+WzJnyzfHBiEZf9poIPJKvID6tHGVyKG25BjIZmZlGMnes0E3FKUshxp4Td4pus12z3FEDdTXA9Z5K0iViyXGWvQ4VZtcaHgI2c4JqbEAmQjRVsRWzFPNI+xIICEguYO8PAo+Gge9nGD7+g9hz0JYK9uEPHUk+kRooBvjb7DwJXVpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F88yI7I+HdR87aOrq1g6ucT4AgoCGfdJgoUsrzRCHnE=;
 b=xttAkLNuSkULZ38h+MC97zcKF+0E9sSFDWQZyaZz5hJxYOfI4ojDeCK0ENTTt7ptdCAgRcDBjTWaostMXS7DydlXD0Fl2X5v82y9gwy3/rNgoQ3UeX1xieTkRTMfyMG9qD6bg5np+Nm97d0Ug8BJuR5bCuf9AQhKzGuQeu9sZpyvUAk8ZiX455YLM3wYZmRxUwiARXe4dGnJ2DaCKsmbYH6/K4YSF5N4qqlLoPV9P4Bmc6xNKPMrJdshuDVA2kUBiCbZZNgZPVlhw8AT9i0jqwf6nzJ5Wu3Z0DpqGOTle0bsdy3KAOwf5cCJtg+03cenwIIQB+dNqGM3wTcE/HHHGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F88yI7I+HdR87aOrq1g6ucT4AgoCGfdJgoUsrzRCHnE=;
 b=ZYscwOW1/FIRs4Fie8ysHN2Pq+Q9tLLzrhn5NWJhthR4PQA2lRrUTCBEW8CgewDQY+fwiyoPVJ1K0ldY0rMzoHQe34lG28xJuYIV73MK+aiZz1+syysD0NX04rug7gZMGGPFmTN9k+mqNO3pFp9/2oGkzxK+R5HeHSXRZTbHd7U=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14) by OSCPR01MB14695.jpnprd01.prod.outlook.com
 (2603:1096:604:3b0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 02:58:27 +0000
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294]) by OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294%6]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 02:58:27 +0000
Message-ID: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 00/13] ASoC: soc-component: move snd_soc_component_xxx() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 14 Oct 2026 02:58:27 +0000
X-ClientProxiedBy: TY4P301CA0048.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::19) To OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB820914:EE_|OSCPR01MB14695:EE_
X-MS-Office365-Filtering-Correlation-Id: a6b2eb4a-3f1f-48d3-cb42-08df299f0505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|56012099006|11063799006|261009223027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Ga2w5Au7NxY6krderxypF8mgbbXBuGEgCdjkTVfLh6KIUmLaFCBHVkju/LWyg6VO75/lM79UsP4O8Qn9tL+ubZqbJLUAVI6guMVRy3jKakDN6WhaN8ESzkU0M7vD/4chOCnSuixyP96zXdfkguscrALBRBvz1oDGB5AYLV6Y7QIzq9WNqML++LXodrjDeNXrVud6V+MyjUhd8IDoHyGjqPXdsN6gdWOMHVkX/6Yine/Es3zSJ/Jzo2QoWLcc4jeBxyf7oyUctlMhMK+oK04SL2H8LrE6qaIZuqIIO9pPS47M7TJK0jLzCsCpMVhzV1n9mcNF/XYdR5zwS+wdRQ4Csg5yOnTcdC1yA/0S8Fqeor3WpICrr2xohawQhlx5w55g82oQMtjXUG3PAnynWH39xlo7z5iFsjO4dmGytqCKs89VxYnePwz1wL8gi6aWeYom3mw7iAmSZmaiI4dLMRlnbt2NGwCg9garqouGYKocgqgaYZ5t9gZyZ6ZjFkrJp/FHAN8WpeU0h93UU1bnyFKhfss4oUcfOgXk2xeMF615X3ZPtAxnyHWXESvttPDMZQuVeQUWp7ILXKHXFwNVfQ7SQy4vZrlc8rl/0P/D48e+5Ug+SeO6dUb4qflWTsIIOc8W0fe7LzTVqAaCabvRuKKiC9aBizSIlyb/VwC53Zukk7IHbjedAa9y7ZH3ob0FVeIGXTU1Eq37NNlyMgulCsEoqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB820914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TdeiHtOWmfaKyGRAlhXtOgLNW2i7WHvaJUxCelH3H9stKdOOkLyZcONbTFUH?=
 =?us-ascii?Q?0nYY8MM3W2cEa1bcpIUwTTVj1KgWd/W55fsZRA7gniENbTbvGS9QTdl+MaBg?=
 =?us-ascii?Q?tMV65zZV20+z00sJK3y39j6RLU+3vv2MU+wnFuogY5qKfXjG6Cfgbgn46Jvf?=
 =?us-ascii?Q?ETXdzl/Jhnp3hvIrhcpCNZfXzha2k/GmW4pQjymrcgXuHClU7W/PlG0jQWIS?=
 =?us-ascii?Q?GA0K5WpCt3vhKipvw8AnGPJS/hUZDCjwyJkN3A10Et3k30DUTZm+DY497C1O?=
 =?us-ascii?Q?xTzPNZ0ho0J++H9Msk4feg8+HCzSGfG3Nt78BthHK4UzU2xKnWv9xFbAcRgy?=
 =?us-ascii?Q?JLXbbUSJTGkdjYtoGuS53fgzw/AZZnZrPEyx7YdY6qZ0VYOmGJIIAFFP9OVa?=
 =?us-ascii?Q?KoGlBEfQ24FPhD5OrtgD9+pjnVagk1JfqWAeyjNwNUOefpOpmDFBh3OMGoIV?=
 =?us-ascii?Q?bFDlL6uLLTNNcvHO28NnDEK8mfqONvmKA2IPeBLu3eSwesRPwWP7+CozpmD2?=
 =?us-ascii?Q?P7NyEdOmpJ2QxrQTQNTMmIYLq0U9piCOsbUpPbsdHBW9jWSxg/pZ6dmspaNB?=
 =?us-ascii?Q?3oidS/Q7d1CXMDb+YdiaqBKkvbgwv1hpy9BN2aEGMC6rz8J5DLeNQ3pK3Gsw?=
 =?us-ascii?Q?HaGobDAxFY4p0XW9l+usiwHYUdyw2scqdz0gZOXC4zEMP0NTQ0W4BGd4kg7h?=
 =?us-ascii?Q?AxSbWxdLuJpe4XKePK2SAF7EjUai6Y0hs7oGvpNTikYUTIdgJIdBXipOdLf3?=
 =?us-ascii?Q?dDOYhntKyiWpWu1oDBoTu2sxBsZbr/Ho17Bhak+4XkTvu6nf7McPmdUADEF9?=
 =?us-ascii?Q?4XnXwQTDnC6lOlvIJ6mSrk5t8J9I53RF7H4fTsGaPYDpaJ/NdduwZjes1uH5?=
 =?us-ascii?Q?B2VPbRWTc5/PZAF71KAtpuM3GRQv+2DfNnzjZqBtbRVC5ga3Euvkk1XfQywH?=
 =?us-ascii?Q?WSE+6bp7HxDwyDJ97c2doR+UKOn9M1JodzkmeNz3yy9Kyfir7g4vWxaJ+Urp?=
 =?us-ascii?Q?iCBby8nXj+Iu3BdynhL6l6y2JUulvH37tEeRl/OMTwxJSGrbVFYlDuxFfNLM?=
 =?us-ascii?Q?6zg+X1U2RiuZr35Yedu9kzg2lOdz4ka0QhuRZrmVXd5dDvZ3oWHqP2Nz3+cJ?=
 =?us-ascii?Q?8/hVBYeRzp6TkMDgrbH1npSYKerocfduf72Rt8uaVcEg8JonHa9ST0pmFY5E?=
 =?us-ascii?Q?vFrPsoGIIIqkdU51J4HUiUu/twoXnoaFNXWqlDze2P4BUHVofQ5uMNiKqKAN?=
 =?us-ascii?Q?JK1qB8B4mVA0RtMGvzzvW5/KJzTvjJfzTgTjmLDQ09gKuameZBQgFBsEWi6g?=
 =?us-ascii?Q?hi1kYWCgpVb4JL0CEL3mLlSjlDS84d0G+nUBWFjsSf8UG0bEl/ZzX4L/hHTd?=
 =?us-ascii?Q?jOyUUKVccFjye+/FASV9KggtuUKOG4k4H+FQB2C6S8LLs0Gylh/zZiUXj60e?=
 =?us-ascii?Q?/C76CN7WB4A4vY5lcelZsesRujgWJNlnxep9ECESQIS5UrAaSIs4clrp4HvV?=
 =?us-ascii?Q?NUBOtTkOdUyYAT5hqrfUwQ9m8cTHpuDQWkjJfZ1tB4gZlfOyg8S+xlR/KC5K?=
 =?us-ascii?Q?aOzt0AYYZ/TcC4UgSA9toG00BGfgffblFoh+JSPCFlJPNO+4ZzS+flfijx8x?=
 =?us-ascii?Q?+CmFZOfUR4Sb/jc6OzSSSyhLMelZbBdlPOO4MayLZ/6v3zs3sqjc4HEJvUZF?=
 =?us-ascii?Q?SoPWUgdvC21VV6vuB3vzdH3txJcv1+noh73l/IFcGJPEAeMl7HD3MrWFtGW9?=
 =?us-ascii?Q?CH/jg22KM2k3wu6ms3SJUNrUyUPne8jkNzT8avf9UyAG3PDdJ1d4?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b2eb4a-3f1f-48d3-cb42-08df299f0505
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB820914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 02:58:27.1599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: md0XKGOLRpQTUnypkDTdkhfYaIesdEVlM2XXMi2gELwZ7jpVHFBQQ/3jmODXBUjqc6SNKywf7Cfjo7fk3duBeF5d499M7FfeI0MtBIg5x+p5w4XLWgmof5iZ278AO9IG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14695


Hi Mark

I'm now posting ASoC Capsuling patches.
Current status, and this patch-set postion is below.
This patch-set moves Component related functions to soc-component.c

x: done
o: This patch-set

[x] move DAI functions
[x] add new DAI functions
[o] move Component functions
[ ] move Card functions
[ ] add new Component functions
[ ] rename DAI/Component list
[ ] move Card functions
[ ] add new Card functions
[ ] adjust Test
[ ] use new Card register
[ ] use new functions on all drivers
[ ] Capsule DAI/Component/Card

v2 -> v3
	- use long error message as-is

v1 -> v2
	- Remove this patch, because it is not related to component
		ASoC: soc-component: move __snd_soc_of_put_component() to soc-component.c
	- Remove "card" from snd_soc_component_set_name_prefix() [07/13]
	- Add Reviewed-by: from Alvin

Kuninori Morimoto (13):
  ASoC: soc-component: tidyup be_hw_params_fixup() define position
  ASoC: soc-component: replace bool member to bit field
  ASoC: soc-component: move snd_soc_add_component_controls()
  ASoC: soc-component: move snd_soc_component_fixup_controls()
  ASoC: soc-component: move soc_component_to_node() to soc-component.c
  ASoC: soc-component: move snd_soc_is_matching_component() to soc-component.c
  ASoC: soc-component: move soc_{probe/remove}_component() to soc-component.c
  ASoC: soc-component: move snd_soc_component_to_dapm() to soc-component.c
  ASoC: soc-component: move snd_soc_component_cache_sync() to soc-component.c
  ASoC: soc-component: move snd_soc_component_active() to soc-component.c
  ASoC: soc-component: move component_list to soc-component.c
  ASoC: soc-component: move snd_soc_lookup_component() to soc-component.c
  ASoC: soc-component: rename snd_soc_component_async_complete()

 include/sound/soc-component.h |  61 +++---
 include/sound/soc.h           |   8 +-
 sound/soc/soc-component.c     | 350 +++++++++++++++++++++++++++++++---
 sound/soc/soc-core.c          | 301 +----------------------------
 sound/soc/soc-internal.h      |  13 ++
 5 files changed, 373 insertions(+), 360 deletions(-)

-- 
2.53.0

