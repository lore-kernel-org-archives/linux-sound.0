Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011057.outbound.protection.outlook.com [52.101.125.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62DC30C160
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 02:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790909452; cv=fail; b=ihqO+c12QkTboDEFonwLteW6okJccRDbQDE95Ns/p7xGNQXsNc/3gSz//YJAOLADGd/MxFtyJfquUzPF9mrtmo0kyMWHSwdg74QZwrxVEFUGuJ9zMrSsNeIu6IpTex3e0ylLY6DOFX82bsw+PQB6E9pcyWT6xbH6N5APjOywocM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790909452; c=relaxed/simple;
	bh=x2a18RjvVbglX5VQPac4mfB8g2yJNHLfkQwh2oObv3Y=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=tYYsOlOmkTrBdQsa2Z1c2rLwdFUaPlMAiiL2pqid5wZTUHbz77vCyv2ZESktF5R6rgxoOJhrSGvVl5qt6qunw67Psmi5aHDYHFp2gi10OWoTOy1OQjsKtGYEeYWbwsghzUqIkVquZYJeeYDPAJtdO5GcY2r4wkyQUnTIyNKj6XM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=F+LsX/qa; arc=fail smtp.client-ip=52.101.125.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="F+LsX/qa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMuzntcrdWTEVVcjqCcCtJ9bXUGFHMqzvxLtxhc9WPb+MdjgHCMFxqcihyWf7KFmDolRlKPO8MbsBThgzUKXcN+M4WKl6V6yIer0LNTADUYaJYSEhyQ/oGPuSLOa3IXQz8+svNb46N/sgmqnq5ay6YEQqDoFpylDKpIF95hnNe3OJlQl6nEso2QNtIm/N4BKztPnF0fFofKloN/u+VmsefbvRkWjxbfeSWXTfNyzZeEAbCpSEGqGNqsJCVuOOiy84vkYxlGp51FF2jtqNB5k7Xn4DWK4lr/5q7e/rdGX2/jt7LjOmAWcCQtev/KyY3iN9nsOIdKVzUMFVVvmPO/OCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnnSrz4/C5VnuUCmKAlt2YYhDoIBnbnuHNPXoj62kGE=;
 b=Wbei64KMjeiCNIHfQb5+Phoc9wXJ5dFBhe5tNXeD7A0JWLQsK0WaWJF0zRnsU0WdPHnEByGqYkl8Z/NgxuMzUuqv64BE0QCKCJQL9X19g+6wRNNvbFUG01vizkrxJekg7poHikxLAjSDCvfFv6y/ZuNJD7iIMbvddu1w2TCbmQBptaSk7BaCTGhPk/ajBB9NvjiDQSYo7ES7gY7fsjdvIt565xN3eGz101RGsfNL/8yDZD3yMlD9blx08a2W3nRgBc92SNp7/L2h3kN8PKp4jniVZa7MuuZlVPm2ZZD30XvlHha9aoUs5Ke163XDosnyMaGGJjcaz3z4hYkmxYLHUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnnSrz4/C5VnuUCmKAlt2YYhDoIBnbnuHNPXoj62kGE=;
 b=F+LsX/qa6zqTkENnE+WTbUNgfNmqmMQxuEwAfOieSfcScZcisjIfbA4KYVCjMAAOkz0pZXg3duTr5V49cVedFjcCNNkXNJxYXwK87YOTTHQaLeMxpDfYuK9PNZc71EPVFvCK1bN1qxFZJccVls9KIiGdEM0QwqNITwfgFhLZKvE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OSZPR01MB6725.jpnprd01.prod.outlook.com
 (2603:1096:604:f9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 02:50:46 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 02:50:46 +0000
Message-ID: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 00/13] ASoC: soc-component: move snd_soc_component_xxx() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 2 Oct 2026 02:50:45 +0000
X-ClientProxiedBy: TYCP286CA0366.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::6) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OSZPR01MB6725:EE_
X-MS-Office365-Filtering-Correlation-Id: b351471a-4d43-4d25-bdb3-08df202ff527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|52116014|18002099003|38350700014|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ZBkol2jjo89WPlMARQ1uZ9Y9ePKMC9V2Vpk7WO7KTFwIK8lzrXNMbCy0R1Fr+whRxN9VLg/+5dXkyFYyMVHJzq/EwOdD+xc4xPY8ItiobzEv7RjrlYKsLZAMDKWHERbn+fQoUFdfxjNgbchm9S1nhAVmtKt0L4JN17pckwLt2MeCsOt71ouN4hZr/mkBEyptWaN1v1ZI+iKUB/5iCXuDdD0i0rEZiPKOlG0ElhQh/syQ+TnZt6NhtP/ex0WOZVXWl/NWR2lNqB6dTgai2UKoPaTNCC63wkw2sLckShwwLTWlV+vdlNwW6larQfFrLWsOEXpxoOiSgRoZ9nCLcS2bmUyGfxfizmKlq1FVz36JnPRFiezJ8CvWowfJqKt40vdOfJtYgD8bPY9uuFM3UqWHWHdLbZHwIIcR0luYp+CQalCDUn0IFJnuHlKWos4etSRdfXZKEt/KWVDH8zYvdaN1V+pxf56rPUnzHHp6YYkSzVYMPyVYCQRoo1kWiJ6lILLiCZyQ+VJKf+rb+lTwBgsoUlWN4YEU9gOGAiqMi4GN+rCUsxVrYAAJl8YASgX1TBisyNAYMbPho4T5pMc+gR27pmi5LW+tSefcw+aRk0ZWgegCZdzxBLxyBZCZbvKkncBCOtkqWcv4/41Kxt4/wYV60CzK5Al/xkff7SYhn1nJAco8/F7ZFssO2am/+ILi7d/k/4U59ZFvmhpXXoKO3EaG0WwPf1Ne4M9n6goODHz0uyM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(52116014)(18002099003)(38350700014)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7h09lS/X31391oc5zWzWXzYsYEQvElNo1vw/6aybt3m02Vl60jWRIRuyMtMl?=
 =?us-ascii?Q?I6jZKKt3C3mM/cgxn/RbO1FAR0IcF7K78+rodl2d3cJqSHWEt2gYBui1Y0hI?=
 =?us-ascii?Q?Dxl5cRY56Ur80931M5bHs0mEqY1Y6dE6ZVgYORy/vvrgHc1jYjf/bmV0gvlA?=
 =?us-ascii?Q?heA2BCmn1Els3O1W3EpLIYf7Gtl/k9ACLHx79LlReiAiMpDSUJ02r3rwmZ3b?=
 =?us-ascii?Q?Az3TrRLBOi/vU8Sb4XCWcERpBhOb0tyF8ucEHMXd/Xc0nuzM18KbPa5UFYP4?=
 =?us-ascii?Q?5E1QbbG1XVc9F44Mr06U7W5sCydd31VtAOCiLKQ9I9lwf1c68Avf5kwpsbtP?=
 =?us-ascii?Q?kPArQ5J6yjv2PP2kij1taJeMk+2FTqT8BNVXHVNU0TPTu8reunMUT9K49LY+?=
 =?us-ascii?Q?6XXVmQrWNaZQppOerJ6lht18zC+ElXSEgJxP/YSEnIvCWmLiQFM+bUDJMlwk?=
 =?us-ascii?Q?1oXFlnhNBZZvgWDMOTRA27XTDnnRc5dtNNUKQ6KMHSsuZ+h45Q4W7nvoUjZ4?=
 =?us-ascii?Q?6Tk3aJNXj2sftgQfXSfCZA3wpPFBMsGGDKQT+vfV37XorvvD7vWPSUeBTWp9?=
 =?us-ascii?Q?nP/oBJ/NbgELR2qyOrSdXNE+0xIg5/qGN8Zmmq8vEwgM16+kuc/reTomE7I9?=
 =?us-ascii?Q?xpq2KCLfPrAwm4cKAB/qf0FGK3iN7JdYEi4E9nxryc2/mD+m8G3LkiilkD/g?=
 =?us-ascii?Q?VeU0KTWUCEANprgGjkdi2NtqX9XI8bF+jnGLJmhzxQekDieRvwfb8DGoW/V7?=
 =?us-ascii?Q?Fzrp7yFcTxaA3Q4ONbHovyXvdBnoVavYzu1w2gKm61GzWqPICGlSzaYsVwdb?=
 =?us-ascii?Q?8GE/HTVBsvb30pbIHl8N5m66Mgz3U5WQONLfslDrBRtNMgmcxAj8VoI6ZZ4m?=
 =?us-ascii?Q?IiJ+tvyBVwIkeAUOxgnuhTbJnsJVBVwf3J+60z8QLDrDrjfqzHPRkoyrX3+U?=
 =?us-ascii?Q?Vv+ppqC3Ned2M1BpOxWRNhVizCHPkCCv5xOiLKbJlf0b6j5Dtq+QA5YRSf6u?=
 =?us-ascii?Q?uQOJE8gHeELeFcRKMTUZ8x/QgN+UspQ4dUFSveHKbcGArRphp+SgMVpjgY6M?=
 =?us-ascii?Q?y2eDiGNG0jTaM2MXjRSalh+W/OB0VtzixcqNj5cLQn8juwDiUMMfU94zW7M+?=
 =?us-ascii?Q?Xgcq0imasI8Pg+MNdzh5XZSF0Ra96MNvyHAlwEPVaFYvvrEC+oOvOELpVMjg?=
 =?us-ascii?Q?BOOHK42ODYrl+aG8+ZlPJfHD3cqfYnowuTZzLLVoJdYCxnM5Aw6F6nYNGAkS?=
 =?us-ascii?Q?mUIg9/Hp7GloC5kv2o5foWAJI7AEJSI1NbwGscFWSf8/S2JxS5wtmiuGuQ/z?=
 =?us-ascii?Q?Vru87+3JE39GyBUJcx2gRgy57rFiiPe3Hb5n5LA2aaxCh1ejVHkZfQaf3OSY?=
 =?us-ascii?Q?Rp6sd8L8g8S+rdjREO255zIEJ/mBCRb8oC8P4+Ng8zYHh37dyEVm2e+23xAA?=
 =?us-ascii?Q?gqAPZSSJuC1UyZ7rWvEVb0LHDFPJS5jrEscIwj2LzR3hJIpA7dKeVrAmA6OT?=
 =?us-ascii?Q?zDkfjJsINa5EjdCinUh+X+GE143a1ArpI0/ms4qSRf6WV68868dtXIb4NYZV?=
 =?us-ascii?Q?DU/zEV550mzqpA++7mTgAitGT5NVsq6CUStBrEkv9mBmhtJFJkcjWASNL39W?=
 =?us-ascii?Q?U+GNieqPsX0wS33OVD9abudBqatXfuXAVQ4bs5H3s/BMuebiH/8oSJn79XxF?=
 =?us-ascii?Q?pMp/3Rmk0jwgw8bCK8Os+KswrMKP+9WYrditPtuvMloLewJ7nz30AngCDTLf?=
 =?us-ascii?Q?BS6vXVch9KuXkCNfaTFJtlvwGHwDWEkveAPOznMAlCsYew5P8skK?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b351471a-4d43-4d25-bdb3-08df202ff527
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 02:50:46.0751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Afak3gIx9vXFAmtbYcKqpBn5bjuoWm1X2VncqlvqXmZNTp0qIiCgLaCLNOJUZLZL/YRAcbgD7CQVk++0b3dCZ/G+teWmEvjRzPzhcQUtI3NN0i2Abqk3vdxG90EC9ASa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6725


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

 include/sound/soc-component.h |  60 +++---
 include/sound/soc.h           |   8 +-
 sound/soc/soc-component.c     | 351 +++++++++++++++++++++++++++++++---
 sound/soc/soc-core.c          | 301 +----------------------------
 sound/soc/soc-internal.h      |  13 ++
 5 files changed, 374 insertions(+), 359 deletions(-)

-- 
2.53.0

