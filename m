Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443409;
	b=wfAYaA2Kv15BNMPLoN4516UmykhL/HtUH9NKGY1UWnSAkkYm8DkbUdlGGHsSjr4u1dB/
	 K1akrsT7oTnPWDcDnsuA9ffWC9SgBlYX/Q7oPkF/RW/q8PGU/s7FXa+mEqmwadGH5On8M
	 2SmRVikCDk3MoDP+JzSakFvKkKU9+sZKotDd7zQ3bVl7brO+Ho8Cj21MYqHz8qxh99MEw
	 g/xXK2+0D0VldLjkM+IoRKxynTuQ0+TkjQgC9fY1MiDQ3dQ19bGnPlqy+L2Zt5odRqwEM
	 qb1Ham+udRwurrLP7x2dSCuEcins0sc5CgB+Si95U/6l1ffA9TmHQvGejj0OVbKMMBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443409;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:Content-Type:Date:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=gruRMddbZn5Kbh9GSYC+Z+gJpi8z6QIcUoNeO3pxTPU=;
	b=ScifVqBWR9c6BKFOHJF0fGgNYzFT67qZ48XRHOwAYgnxqISIHw5VWt9bWVyXdM55YluB
	 9l7AO7rF1c5lMWjS6Er08VjJu3FwBveEKrJkF2MfWxqMPOp/IDJntwS9TmuObzoP7Q40q
	 uMwsdBIszlcgH2t/JygzdqLTQj5oB/blsODLa1ExK55YO+RJcs9dCc5pU+Qu1KkfhP+yh
	 bvTsgw6X1OGqIyWZQVYE0LKdX2DPRjdIJwNBf20hxLLI29zeM8mRw6/0eJHhHWlZ5PeZ/
	 kkh5MXVHGIkM5TH5fnEPikfz1WlVtmCB+HnJ/66nghZp9zWBScui5Mb9qjIT7/iGMtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=TXWiHs2H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.51
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011051.outbound.protection.outlook.com [52.101.125.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF948606A32D
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF948606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=TXWiHs2H
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ExEGzk3zGLT0R4s2UdjZtmiF/OgkhFSnBHgOOP1jY2lrp2BN2G3l/OzdYJhKBYFLqFaMRwkjTHYKPtDMlQQpSEuadAqerw+rtcoQzBE46XjUA4FKnVAgPkUPCtVkfh66J1LhY0SiJj1unzToME+UAzMxgVWgfZElyX/k5K0VkT1L0ktE3sOmcSuPCJxKttpy9ijvTi5XlwO8nSeENgfpU/rFvsYc86wmf4rsNuYYLBwooRAdcrRYqD5B2eV0TvvOquNRh/GlFoRgz0mbNB8OzRXXasKMUlEgsIvuWXVO+tisxfELa94/wETGwYMQ8dKkhhjoQ5xp59VzqKYj1k81ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gruRMddbZn5Kbh9GSYC+Z+gJpi8z6QIcUoNeO3pxTPU=;
 b=g9U521PMB989QAiHzApV1wssG5QSz33/81G/r1NsgXV+3EC2wyFTMlVwXHT9F9Joba64+pPDknkhlBSHq5z/4tt+YS1NfbY+yIqN/0Mbie4ujvfd+g/q0MmyNLdTPubxLbHMgcSlSzeo0tbEmypY4hQyqAMPbqRiGL9Tqi+1qmAe/U5uAPwXheiYinDNgDkQTaabO8h2LEZ7y44i0mAex17YOnkIJISKdAgLNwzIniVXkWa1fSZTH4Xwg00WI0R83Cho6cNPBzBudwdp3JECCjEMeGRvpIDEbP+api9E8r9XxQ9LgIy7CDbn5xW+yxOc2FoHKX4lL7Rs2FT/fAFSbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gruRMddbZn5Kbh9GSYC+Z+gJpi8z6QIcUoNeO3pxTPU=;
 b=TXWiHs2HnMgfxvj6Z2YXkQ+9GqGl3OQT86+3pZTjcDrPKPPIYiwnwgGzgFq6WkCqxn+V6BUHJzM7BM8zo1BHZRrWcoESEUrSl24Z7Ir9NZz3m3fr/pDWXuHc20OpXZhxJlVSf5xF7CMzIIM2wk5opREF1n3rwtwcATve6sojjRs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by OS7PR01MB13650.jpnprd01.prod.outlook.com (2603:1096:604:359::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 00:30:03 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:30:03 +0000
Message-ID: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 00/27] ASoC: add new Component functions
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Nov 2026 00:30:02 +0000
X-ClientProxiedBy: OS0P286CA0060.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9f::11) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|OS7PR01MB13650:EE_
X-MS-Office365-Filtering-Correlation-Id: e420b335-b86e-4ee2-89be-08df4054179e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|376014|1800799024|366016|261026121527099003|261009223027099003|10067099003|261028144727099003|261026140227099003|261021123027099003|261102123227099003|261021121427099003|261022105027099003|38350700014|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NI6AyihWdmFV6Ighrrn8I5WrcgS6sZ6is7/7QZkOd8M7OobslF01fhQiYJFfX9xgpZZEKecE+W4hJiRY7Oa6fZ1MOdbcCIvhJJyY8aV8hc0AY2TGfu+7nKsvZ1NyjTMThhyB7GbZ7X1PJ45W2CLd5C6ZoV4IfNmFmYqSK72jwND4yON9A43NvaCCvXLrJN7B5Vk88topeRw93YWoMle1PYuuAt+KRe+/4yT+BJqP8fmFsAjrlBLgDdQusq27GXYhOUOWwem01xTJbB/iNpEuBCNjmCR+t8cCOQ+8vPPb/avuvCyWBLgZOQ3Nk8rZWOX+qpdQEnzuMOtiQm5rbLOs93RqTwa8WP0fGfBoO1wMIwBDwSHD/lrNKN0IuqpwQMtSSYWcW97EYvCnnq/NoSUhcmKn2h7j5dyc2MjIWU5Mdq3rhWbYDzh78T9XzU9130VWFXao5wQ338yHXW7YEPVlCxvlUlFDBhX+L8FcFvhkGCTQZ+R82eUCBytQa+B+/0gFPIeZCNEZRsKJ+uxDz9lQHwvXisVHKv9eh0vUaeyujmwCsUliea8GX3F2ezqEBZ3XRIyUJAe7aXSLwthIEq2LP2nJHeOD2vH0jUnq9QlWy2qXz0mSSdOjzKnwY0GBXDte4Z43Wa2NfcCbKSLe9D9V8nJ4DLNzDQpFHjhnl9HGiroUrX/zBh7f9KW1/OVIcSPGCe5PABRAf+O2Uq/l8uoEBQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(1800799024)(366016)(261026121527099003)(261009223027099003)(10067099003)(261028144727099003)(261026140227099003)(261021123027099003)(261102123227099003)(261021121427099003)(261022105027099003)(38350700014)(56012099006)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qE91hQ3k2cBwxWzYYZA+WvTNFjM9DzWKDFxX+N1liEhA9F21K2z8+uC3xDO7?=
 =?us-ascii?Q?X+IQFq4ZN6IkaCS3wh7KIvjxT2IZ4O90yyFYAFUho+gP4YTTr17MuxkdKEjg?=
 =?us-ascii?Q?nJ46Df1zQ0J93bFtR9riZzEkGVqICvYf1h/GYLeBoh0y0fsL4neVQM42Drln?=
 =?us-ascii?Q?1G1l7Bo5dBkkAOy/MDaGOeKfaTXIssYxcMBAYut/wlwXEfk0DfwljuGn7n3M?=
 =?us-ascii?Q?Hlw/Zz2LjB7RRTxzntQ8vRxQbHObVecWW6TvGUMKTur6kYjytDURFMA3RQ3O?=
 =?us-ascii?Q?RMQpBOlk9992+9oEnGJx4s3mwQucKlsU7nU+NXdS0raVanc1cZvFKQFOpBAw?=
 =?us-ascii?Q?05V2SfJAGW8M9LkND7Ih6jbnFtQB2Q78w5N7lzBBzEjVS6hSClnQaUG0IXLW?=
 =?us-ascii?Q?TPiKPA9a4kxviCyxm4hdaPaZBNKCBox9sYe657BuUWTfhPfobVbssax8218/?=
 =?us-ascii?Q?zKd0vhfvp/w/zZmiHG5XtKhXPUK35f0mQDMKHDFzakMZXo302qa9YLjHzvsf?=
 =?us-ascii?Q?4MDzVmJr1bw1fA+0m73dxI2R62TfKNv754eKa40wzxUISOmpV9aDdOflCMeC?=
 =?us-ascii?Q?U4UL/818yK2ABNlZEgCsrl+i8xfybO6OlPXj/j3agg0e8nrrlO4urZLcHDBR?=
 =?us-ascii?Q?bSm5mwECrY0RYuSmPA0rTZtBnmo87FVSS+wGdjn2q53KSJ4bIc2nE+2qpmry?=
 =?us-ascii?Q?rmAlxutNOb6B7niWctkI5/z3CkfLwNIuWd+Y+jLF9U8fSy3sIJ4LhKdAi29C?=
 =?us-ascii?Q?9q/TKckqY4YeGbjrQ0itnXvjily4b9ZbCEEZcGp7IsIGwysOQWGkT9EgYart?=
 =?us-ascii?Q?GueK7KOlkjcMgOGV3XyOGJIX6j4P60cmqRhnDWV7kLU/f/yp8amybhm09wV+?=
 =?us-ascii?Q?AciQBHLEcmxxk/3qmRir1GJPNqGrngO3HeH8iz6kW6gZukUhvMuWSIBmTt8T?=
 =?us-ascii?Q?kbh1SDeVnl9oz/aRJEZoi6gxSnd5e299Tg2YQ1G7+R+vIBhEmF5opK/O1SfT?=
 =?us-ascii?Q?95Qo4XHxeEC+onRx6fTmbPr6/sLnwwLCXB+umq/PKo1AWKCH0a1EX4wHbpmW?=
 =?us-ascii?Q?OUI52gR4gTozWJR8E3hsq/7f6+pY9eaXHUvfeKkytQ/DbWHCiH065KjKZbOH?=
 =?us-ascii?Q?zRsSUAWoFzr/kX1l71HnxfXcziXavkY5dv6VW9/y9aQ4g7EMCSaGo6s33A3B?=
 =?us-ascii?Q?RhnhOsAhtlZ2SCKb09v6dnZ9PvVinwkqk/YJaN2gPW5KzUoiMmh7ZuYgIcCh?=
 =?us-ascii?Q?32dQKk9WsjPMjkJ7oTYiTrOzGZOfrh8xdoEbNxa2EH2i25PR4oFcOaSavN2F?=
 =?us-ascii?Q?PNpRzmG5gsRVxA6qMzbMMrf/h9d97c2DI7AnSsC3Niy5jerL2YfUHXSa58Dc?=
 =?us-ascii?Q?OPoPdqtKaR9UdSnuwFvI53rsgcRNk5q+ZORT7i1j4uZ3f0EvF+136Y8LItSr?=
 =?us-ascii?Q?F/q8EZZX+xi/G8CDBVym8mFJ41DOm7hd0NCqMmYYzl7wiWjmQvvMQbD/RdgQ?=
 =?us-ascii?Q?imBLD04Vr2m8nSVUBhb8usg7cR+MCpyJWhh8vehE6lNyrQUD19V+faRxCnSA?=
 =?us-ascii?Q?Z3YaMV0QpTdPEZ+XjnKD2xF2UCTn0iW9tYgYEtTPjGqXk26NGccP51DAg3F/?=
 =?us-ascii?Q?MDRXyD8bh9oZLoxJDTWvXYWT6wQLG7aWlzHm0l8uj0qED38/IH3+JQk5EwpK?=
 =?us-ascii?Q?luGB+R4zkjVLwAJezrME5NxBs47m6KcVRe2RLh0BQxg8n7yqESO2PFBErbdl?=
 =?us-ascii?Q?yzIRh0mRN4dm5WEogcICkNwKrKEDyvY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e420b335-b86e-4ee2-89be-08df4054179e
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:30:02.9507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MiadiqWvd0isTKaF3X7hm5Hbbw8HmECoLQnOnAd+TmAnsa6Z2QHoAyo7EssDsyum/0TXClu4QQ775aW20BO0J9vrNZWGbH/EeF1NuhHB7+LFcG6y5NrkgtJoZ7rPL13e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13650


Hi Mark

This is v2 patch-set

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
 sound/soc/soc-component.c             | 515 +++++++++++++++++++++++---
 sound/soc/soc-core.c                  | 245 ------------
 sound/soc/soc-dai.c                   |   5 +-
 sound/soc/soc-devres.c                |  80 ----
 sound/soc/soc-generic-dmaengine-pcm.c |  38 +-
 sound/soc/soc-internal.h              |   4 +
 sound/soc/soc-pcm.c                   |   2 +-
 10 files changed, 552 insertions(+), 415 deletions(-)

-- 
2.53.0

