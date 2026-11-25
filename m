Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795570901;
	b=qDiNoOqm81zSfKtpX7EqpGeNGSg+tXOaPFRu+cE64bX61keaKs5Pa2ai0pr6EMGHgvb+
	 UCclB8CKRWfjQnnnRStt/RY7R62EukLrSTLOXpKtRwYJkig7M4HxWOQ3yMyr9qSeTZhE1
	 UVmURjQpmgJAR07UNQ0ZBod7KcRNCNkINw6e1ZFK25FpJopMBLKoa6hJ8cgo17VG6KATq
	 8lfNq5m0uxiio0gyziffBCoeNuesV5uEs/Dn+aOadJMkwVQlDxwOcEl+Y0jw1zV9nlFKL
	 aX39ipNuMd76nW3DADYRQpcGXGeelPW2KCPI8eKumeEoE278YCBnQq2aYyjyE09YWuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570901;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:To:Cc:
	 Subject:User-Agent:Content-Type:Date:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=KAE+OeGuWn64jXzqlemmImbah+4iH9eoBYetuvY9nnE=;
	b=P0sK/4vTF4FR8mqGfbBi4oFSGgZczLoOl9f4ErL4vPVjfZVI8haFainT7m+GPI3CFOMg
	 tfJ4kaz7pVVMmWfU/RVWwcICs71SDOoTF772bgQ+SkzhDYnAD+tAXwWxBcgfZTqUXWg3h
	 c0xQWrs9CeZ0/ef/jHWQSlMbBJC4TVHLtMACqOLZk4/0kmi1v07qjKF+CrvXx++If1svy
	 inMyU1GbRluA2DCwUKWeiSo9xKcsY8eALIhlXN/s3PVop9giA61q4CB5SDzICe787kYqA
	 A1iL60EVgGf9ipn9u3Gfq8vSPZEDc9vqHnuTbdLuxpRpn2bHhzxipkVrHV3EN91k1Fg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=oG0IKdqN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.25
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011025.outbound.protection.outlook.com [52.101.125.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9035B606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9035B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=oG0IKdqN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQ4O3XIPKpgs/KD8cfJRej4WhG3L0GIc0lBJuIysG6+I1frUg3ru4qBfqaNZHbHy0Z0Dq344MpkvCmWJEaFAnkREXpQu+P3Rm7TEYiwGduupSdGkFcdS7vzEMsMyULSBWPiMvuiN+4p5Wq4AAVxoIkq+IzPZLNSBHeq8qrH/93vln5O4VMhu7rjfUme1EQ8ctNMrMeHE2R6rnw4jVOZU7Bx7xkWlWsqTVBFSxUYMIdRpGZwbZalEHZPjhgiQBX0kofU4MVY4pETenv8/fx3JbyF9yJNVLYeeakgIcCmpDDrH8zoiZ9ZQk8P7V7kA9/KVd0MAvLNGtVP559E683vw7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAE+OeGuWn64jXzqlemmImbah+4iH9eoBYetuvY9nnE=;
 b=EU9/h4WcW7C9ZcWYeFsGc0nhOMqAcE3JXcmKoqf24o9Nuj3MvGqKGHSwsOlAy7jWKC2/3DzpuJiR08wX1rF2QLPPMSHjUFrStW8QoPF6BW1hkRlCxCTACkTN1WHNMtvVA9dMFVrCEDfo563bt915/jtEmZpaxjDLbNEZdtSodX0zfpr4RdicmWZ+Mu3DrBWWvk+Zz9KBAC/2xwpxC1GWtfjc96u5Y/CqnrFEtWACWBkTp4bdL7QMpXwAG3WJWNbLa/gjoiYP37edbjy60sLL3p6uiEKYJb8SnaXmu0OOg9sDi6u7/tjpxWTZwKM0FVeSCr2BMqiUNpU7m9oOBUKJ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAE+OeGuWn64jXzqlemmImbah+4iH9eoBYetuvY9nnE=;
 b=oG0IKdqNp3zn4QGu4xNvNiMSxdV1vF0SXXtXWQT82KCis7j/WI0TTmx275HtY7pPNR64mlhZb+xd9BX7bRfV+xq/uIADDlR+5Gka/ZJjCR/Afkd6QPPoYZHjrK/1cfTAxgRvFAi7bX4k86GM+YbN1db2UVw0Qn7NgODFmfkp1T8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TYWPR01MB9838.jpnprd01.prod.outlook.com
 (2603:1096:400:234::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 01:41:37 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:41:37 +0000
Message-ID: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Subject: [PATCH v3 00/27] ASoC: add new Component functions
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 25 Nov 2026 01:41:31 +0000
X-ClientProxiedBy: OS3P286CA0102.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1a4::9) To OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSOPR01MB749128:EE_|TYWPR01MB9838:EE_
X-MS-Office365-Filtering-Correlation-Id: 395c77d2-89f0-416a-c35c-08df4a953ba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|18002099003|6133799003|261009223027099003|56012099006|261028144727099003|11063799006|261021121427099003|261022105027099003|261102123227099003|261026121527099003|261021123027099003|261026140227099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	dGv9nxP+o4H6sUb/LiUHREohTCRrktOOiY28LY3p6+2eijNDp2lwk42XyBhFoS8Qz7AEs5g/7KuwD8ojdxgGwh5mXCvAO4TRUzIvKES8LbqQ+80FUemsr3hUNBUXsiwoL0vgOy14yFOA3c9SlnHjhETOpOMkER8fwFleMeJbcm7eE+eDd3EiSaOOVVVkqDINvPxeukvGotkmB1SIGZob+EA9WiAyItozvD0SdG+mR5wnmd4XPGRtnY/3KvPVvR5mdBzWqLYLHOdx9qaz/PkCclJRc9pphHqx9HTWuLEze4GVqtNyM7uB+5I0BQpTXrriycG66c67Ecl73p2gf3jhHT0w4n2ltqkfCS5GAnHdvAKbtIgR0Z+5SXel4rB69lCEiWuPr8JvwtokgnwuXn9Unn99x88At/AoJjod1aIAHGWnQJ23V/dU7lTO1FhP8xzyoCLnoebXXSDkwTH5yF7nH1CMVuxCaamNiH3KqGs3OVdp3RUQZ32HmxRdacEIpMMUgI423TbmUFLDiH5IVy8y3cFTZKi3xDYD0YTN+yu1Qp/IHRYifNGjW4jOWpk353txzUMIm6zl99/6DZ4HZW1LNyPUCVkZ5JnNE7dJFtdj23AmbOFu7PETB4b6k59VGTQ3E2VSxmP/SjviRyz5+m/MAIMLOcDGbBFyua+ka2ltuu9d3Sl9YA2o0oL1wiGXbcx8JruiCsRRj78iSTUYM+02ew==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(18002099003)(6133799003)(261009223027099003)(56012099006)(261028144727099003)(11063799006)(261021121427099003)(261022105027099003)(261102123227099003)(261026121527099003)(261021123027099003)(261026140227099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PwmZKmQEGQExyuG1X7MMMouTuIutpQrfX4Tb7rDO+Glsg8eIPaV/Ef/v24rb?=
 =?us-ascii?Q?XePW5W/dgzw2apGiCrW5b5QYvAcY77qsLw3zsPGP4vlPMuWhs3GYM3l9kvxs?=
 =?us-ascii?Q?wyyakpcq2MzchFqeThPBUg5juTy/+hD35vzL/1Itl1F6tDgflEOF8CWmLN99?=
 =?us-ascii?Q?O2DFKctsMTjfe8hVF+rFB+qe9obYtr+Mbcuahh1IgIuowCm4C4stn18hPQmA?=
 =?us-ascii?Q?HAPCIA1cdIy5bOB3mEtI5uAJQliP0tpMjBSJNM/WWg3GeDLVhBmF9Mzxo0MT?=
 =?us-ascii?Q?Yse644t/sAk6OZsxkkU2szKZulf8Oj6N6Jbfj2q41o43Shxp3/exQD8We4fx?=
 =?us-ascii?Q?gAMEwR3hJZlxMQuhejia+nz6duWu0+q2+ZttGDBTMBRMOyzacXI/MTVrpPq9?=
 =?us-ascii?Q?8Q332oU2p9Js0WS2slLF/YW2OYrtcgzIVfUP/U50GDWHYHLscG59yTyofcAL?=
 =?us-ascii?Q?6IKKIbjQOsuoeLZDC1i/CoW2cpb8qp6rCejmMQwOuzuZBZVoP8MpR3WLwNxv?=
 =?us-ascii?Q?vTO/98eAJyysqk6NHvqWemgHpz+Pf87KM1ZJgvzBt0L+jEEsXgBTEUaw8tNv?=
 =?us-ascii?Q?+BUk8o7of9FxixalEyRlGYqCB/5/xFUFnH0Q7nn0v0DYgMtj+yd10x+YwRBH?=
 =?us-ascii?Q?QlQkZvu+ijamcKiTBYPpM6H+RWWwihG8O2iCkGgKUkOScJulYC1VMkvDosyO?=
 =?us-ascii?Q?8kE6oHIP6Z3VueYp1b+05vF0Z2HwYMqBQseSuYt5ZC25d4+FQPE/+KrlpasN?=
 =?us-ascii?Q?5ikWgZY3/jZGzYC4dNpuDoQOS7ZvtPMmOiv942UnZWXM4iWsaP7pVHVR53bd?=
 =?us-ascii?Q?XFmpUk5YAOxsBkxzySCa5e08JVWrJEygi03wH5xsnfW7GladU67W0/WxkxQt?=
 =?us-ascii?Q?FqlKbYBZD8qMt8RY2CaKJNwx+lTupJ1FqyLdc4/fiKVk9M6lMmxoABEFzj4X?=
 =?us-ascii?Q?OJujICZ7E7zUfiGorGi3QBE0RoAc4GoXK+vI7cEYlqtg36dSGhmPor7oLy0x?=
 =?us-ascii?Q?x5mZ4rpVNpAC/b+rKYsnbs4l0qYczOfbqTJIiAeOtbR+pRT7V2JAzgENSfXr?=
 =?us-ascii?Q?BflT/EmmhTrHA9gwWu7uwhBWEDMAJNN0/RfvhI9S6vrEaIvXz1cFyvZVnCRv?=
 =?us-ascii?Q?zFx+ao4dLtkW+0wuLFba052rBxk/wTFaAKtHdSoYCZ+Pld5atzpYiAWmhkLE?=
 =?us-ascii?Q?TMGH8NM3ebNCpoH9xS2BkgcEEplIYrx6dxalT5yfbpHswootSaoVv3P/IJ8p?=
 =?us-ascii?Q?Bs72I1Oof2PckvH0CxRQHjg5xoH5ydi4E0I1eNRY2aYqtrxlf2FTl+lzAhlw?=
 =?us-ascii?Q?lD1ryr9W8nar3lU1ti80pgTWfR9MeGgneHvPhtU9EUNgtWeHJfB6N9ItMCQi?=
 =?us-ascii?Q?XqYEn5W9RjQNtRjKHlXjksIuQ3fS/EAMwS/IxdMVg5Geo0EQ5JAyctGfCEPW?=
 =?us-ascii?Q?xzCFfl0wXhJo9RcrXF8fWQlAkEX1vB3Ak0WJMbq4VxIUzjKeAhl3T6GrmMYZ?=
 =?us-ascii?Q?gWWOAYG31FE6mMq/a728Hgeci/p+TKVqcy6nTxKKwlQs005jjofrU6qV/m4X?=
 =?us-ascii?Q?loEDzF0s1IlX4xovyB7/cWfzh/8ssDwVN/PQmw580YxW4CvHNGNSHC6Uwxgw?=
 =?us-ascii?Q?1iJV2qFuF8dAr5gOttlg2fuYXC8HV8cZwXu7kV4PM+ReR8/5VUbj8pyXsiy7?=
 =?us-ascii?Q?z/bIs2m8N/Jyp7WOX70dWy0+V+UQPOuceFyYFISIKH4bnVhG6claBa8VC/tt?=
 =?us-ascii?Q?NZDQO0NiyxAJEy+DGMysnf5rCx7UQEA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 395c77d2-89f0-416a-c35c-08df4a953ba5
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:41:32.3399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AwRR5bJYh+QL/R31N2HUabpZWGsUlyQoH2STExh75UMcHaLaNphL9pTiZSgZ2IKAW9zaykAGdHEe0KvKxwnquKMghvyjWLiIvccW4+MncESTBRgkemcpk9PebJ0uuSGw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9838


Hi Mark

This is v3 patch-set

I'm now posting ASoC Capsuling patches.
Current status, and this patch-set postion is below.
This patch-set moves Card related functions to soc-card.c

x: done
o: This patch-set

[x] move DAI functions
[x] add new DAI functions
[x] move Component functions
[x] move Card functions
[o] add new Component functions
[ ] rename DAI/Component list
[ ] move Card functions v2
[ ] add new Card functions
[ ] adjust Test
[ ] use new Card register
[ ] use new functions on all drivers
[ ] Capsule DAI/Component/Card

v2 -> v3
	- based on latest asoc/for-7.5

v1 -> v2
	- Care CONFIG_REGMAP
	- Add new snd_soc_component_unregister() and fixup
	  soc-generic-dmaengine-pcm.c issue
	- keep snd_soc_component_regmap_xxx() in soc-component.c
	- tidyup function doc
	- tidyup git-log
	- add Reviewed-by from Alvin


Kuninori Morimoto (27):
  ASoC: soc-generic-dmaengine-pcm: move devm_snd_dmaengine_pcm_register()
  ASoC: soc-component: rename snd_soc_component_{init/exit}_regmap() to snd_soc_component_regmap_{init/exit}()
  ASoC: soc-component: rename snd_soc_component_regmap_val_bytes()
  ASoC: soc-component: rename snd_soc_component_regmap_cache_sync()
  ASoC: soc-component: align snd_soc_component_{regmap/regcache}_xxx() functions
  ASoC: soc-core: move snd_soc_del_component_unlocked()
  ASoC: soc-core: add missing snd_soc_component_unregister()
  ASoC: soc-generic-dmaengine-pcm: use snd_soc_component_unregister()
  ASoC: soc-devres: use snd_soc_component_unregister() for devm_snd_soc_register_component()
  ASoC: soc-core: remove snd_soc_unregister_component_by_driver()
  ASoC: soc-component: move snd_soc_register_[un]component() to soc-component.c
  ASoC: soc-component: move devm_snd_soc_component_register()
  ASoC: soc-component: move snd_soc_of_xlate_dai_name() to soc-component.c
  ASoC: soc-component: add snd_soc_component_name_prefix()
  ASoC: soc-component: add snd_soc_component_to_dev()
  ASoC: soc-component: add snd_soc_component_to_driver()
  ASoC: soc-component: add snd_soc_component_to_card()
  ASoC: soc-component: add snd_soc_component_to_debugfs_root()
  ASoC: soc-component: add snd_soc_component_to_regmap()
  ASoC: soc-component: add snd_soc_component_regcache_mark_dirty()
  ASoC: soc-component: add snd_soc_component_regcache_cache_only()
  ASoC: soc-component: add snd_soc_component_regcache_cache_bypass()
  ASoC: soc-component: add snd_soc_component_regmap_multi_reg_write_bypassed()
  ASoC: soc-component: add snd_soc_component_num_dai()
  ASoC: soc-component: add snd_soc_component_connect_dai()
  ASoC: soc-component: add snd_soc_component_active_update()
  ASoC: soc-component: add snd_soc_component_device_link_{add/del}()

 include/sound/soc-component.h         |  42 ++-
 include/sound/soc.h                   |  14 -
 sound/soc/soc-card.c                  |  22 +-
 sound/soc/soc-component.c             | 514 +++++++++++++++++++++++---
 sound/soc/soc-core.c                  | 245 ------------
 sound/soc/soc-dai.c                   |   5 +-
 sound/soc/soc-devres.c                |  80 ----
 sound/soc/soc-generic-dmaengine-pcm.c |  38 +-
 sound/soc/soc-internal.h              |   4 +
 sound/soc/soc-pcm.c                   |   2 +-
 10 files changed, 551 insertions(+), 415 deletions(-)

-- 
2.53.0

