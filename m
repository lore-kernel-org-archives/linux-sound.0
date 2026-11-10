Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794288205;
	b=TanQTg+v2u6X/B5gMgq6Ds7nkM3kuf2DiZwdw1aEnumZDYX85jyHeEfiO+e38pk7pAUV
	 Z+Eh0oybyN59EsWC8DJOeh005zTLKaH0Su9FzDzI10tY654ZUrxQjphp+Rxt+otXRsegt
	 1SlkloLaOuSa9n4wqR1hPNMQMHhl5yi303048C125yr/tuPZF0ISCU+XBsnTquGLUi1om
	 nfPMWsP9GMdABNr/YUj3v5jDN/O1Ry3H2cH4oP8n5sWwqmwCXfcv68JXBppzpzZsni4TP
	 5emPlK77fj9iQ0Ws5SW55zF0W2Fk/5fGsUqJQjaMMkyL0VvnekKlfGS+1pbOSCvL/6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288205;
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
	bh=tP+ozszGrxQHPQXHIr9S6AGOsKgRQzxX615yopVVMp4=;
	b=Rrm0qjIambkrO4ieJGSDruxyBKyv0u6gR27wH1aW+7T1m1y4hX8RqVopA6KMAQa/4Mbs
	 md6IcibtZi+pbjcrZrJIFW3qHIUcs6Rub1ZwR9IC9g0tqyD+WmVoRLYatVFMGn80OFv0a
	 DgEln9tCOo4M6c4EevrfDn2yldin+OkTnjufLICuv7sbEr/oe64esCWRvEksMxbHFr74J
	 aFhwenmurWpLbTfTiXxMqSCPDPhh0GJdcOH/kQnwThrvH7tWTVlmA18r9N4YKwObDybZB
	 /9wc/JL7JaUcgfQRktIXgw1EV5ouV3Ayxq8DK+PW4D1T3FAryWIUx3nAj722pdFgoXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=UB2UheVP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.57
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010057.outbound.protection.outlook.com [52.101.229.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47CF606A321
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B47CF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=UB2UheVP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vxAriIFtnOjHOxLG+j+uQx4aJ+Z57Z9d1vKvczoM2G2dh1G7NChdYwjIZWxKKAYGQVZJkr3YMNelmkSdk3fJCcBOkeNJJD2nUjzRSXkbMb2tmtzCq6WFhs6sCJGhQY6RraZDZtJIbaQSa+WKQlYb5lG700noNwUEhoSY/BdJd/GL3I/fnwELrh8Cf6A2lFNTMXPYwZTuinaMTCjqwPZY1l50FqClPeXH0kBhMOua6yTlbPWA1SfUdlcqjm8cSUN9O5taGIzy2efTYbfwKe9F+NmGb23312dywKFaPV+fPGzqfqwfVo6xMJh4YdrgMyJcrilMR5sUyWpSlD/XojwboQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tP+ozszGrxQHPQXHIr9S6AGOsKgRQzxX615yopVVMp4=;
 b=v5q42I3BcU5wbXZDH75VTHGihsCLM03upL7l+cR4H6SKvHLeSqEeJeH01Xug2JyppzPmC8NiaIg5iWrmHBVc/XTXNtx0AdvdO+V5BIXQ7qz55GMVxHnoqpht77oGuu5812yOpHeBOLFZVMfq6fhhO7gpU7baF6NEMxqNrPfb9KNBypKHgPrf4yT5gzcPZJJm76uKs/7cqiXHjSoFJDup5HZPVwBo3P6UG5IF35/zk6aipEYUHl/x7lJZRBUid8PXR+BaexOvAz3WntCBdg+zvZDEQ9/P1Aygv5B4zjjkXztfN02vnHjxzq/sIaVw8PCRxkHcJorxoohQC4GYo3KCaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tP+ozszGrxQHPQXHIr9S6AGOsKgRQzxX615yopVVMp4=;
 b=UB2UheVPSD2UOOUHLGRNCaAsiJFVK31XIWFFsJri3gmBt6FWay+YOKavqgGrks8/OydIa7vtrcShP2QsEptZ8Kp2rjBWA6Hu1lX6SH3JpXCJ/LdpQeMz4yRHJO+7K8Z1dmsJl7tjOJmzLt+mftR+vg1QDKn85j+nv8ATepm8Yl8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by OSCPR01MB12483.jpnprd01.prod.outlook.com (2603:1096:604:32b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 05:23:21 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 05:23:21 +0000
Message-ID: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/20] ASoC: add new Component functions
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Nov 2026 05:23:20 +0000
X-ClientProxiedBy: OS3PR01CA0082.jpnprd01.prod.outlook.com
 (2603:1096:604:da::15) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|OSCPR01MB12483:EE_
X-MS-Office365-Filtering-Correlation-Id: 00644b0c-6111-46e6-7705-08df3eeabc08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|52116014|366016|18002099003|6133799003|10067099003|11063799006|261022105027099003|261102123227099003|261028144727099003|261026121527099003|261009223027099003|261026140227099003|56012099006|261021123027099003|261021121427099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	bSjxjZlvkZC1v5PA62++wwiqQrZWeIgoB4jXlzaNbF3hGnoQbbrroz7YUmsdozOPkLWVS7HGO8MIU/6ezpK9+wDZB9OXpQojmvGDHLaRGFzefTgjDj7W795bLLds5tTJuKM3nCVQGSUk/q+zzbRtIE+3FUBRDaw1XoWRljG6RGRbbMngWiDNOagAoNYpkQQ6eeBtb5b/5W36jAVqEjfBVSKmBQWxVJo3Ph5WyOMn5jltBbvxRpo4dto7IBhzXcMNXbyzaKgj8sH9853bdsq/EcPizkC1jBoWkPrnRMNhEgB99iSOPLGX4hfPejvh+FPI5/GOCJardiJUia6/z9P+CMnWucJxb/aABWp3TpY18uRpfSrktrq/6Iz+Nm0ox8Ke2WbMbKwBZuafqSvbMxkAG8zw/7NpEowA+6f1w2k2Vnh+G0BoalL7D9zkQnq6H0ztm17l/0/ur1P1U5+ANIJVZMTAnvwramJHPH8Y0BOyA+dmIUOT14ZGZiJkm6NgBQgxLS20SZyUMDK6yAq0KJxYNisVKdMXKLLZ51wJAMUhjqWXus9djExjzoo0t/aeEtyXg0EQsBZnfZlA7pgzhaSUkyz6qnkR62R/gORrqQnEoG3yLQtWUaJFvSwz8/5r9kX0BIAKK7A4rlW3uBXdmOPU5Zi96G5ixt2GT1vswBkMEWSdEQ4zO2dtchEhox2KcV0iCY/C2av1RxBfIwFup1pynA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(52116014)(366016)(18002099003)(6133799003)(10067099003)(11063799006)(261022105027099003)(261102123227099003)(261028144727099003)(261026121527099003)(261009223027099003)(261026140227099003)(56012099006)(261021123027099003)(261021121427099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?41gN9rSJ4w6XV9HBlZGkatCuEb3kU75lz1sDMdPmSD1O9CSwJaftQmOOl9zx?=
 =?us-ascii?Q?vCsD5zroyHAFjdVSz96+kBskJUQH52xeQ76DkcC7lFSKfSWLTJPVDZSidOQF?=
 =?us-ascii?Q?ynPnhrKpZz1Me+v4C6KbR3o/YgfG3iXNRbSEoi1pctKvhPACdFPhlMIGPtWK?=
 =?us-ascii?Q?Pxb6hWZMUaa/g9HO5kTtquREA0QuCLdsn3ckaCsJEgpI7YhaXAPUg7mVq9O/?=
 =?us-ascii?Q?XE7HdgsSg8oqQ2VisacKzsqaiN+JcX4T0wl/HcGDqjy5ajSqVarCSxjtAAkD?=
 =?us-ascii?Q?puP44cwhgZez2iyMuA972jGPKwhdFj+v+3vwUQswcq3gw50paTlvUvKkU46F?=
 =?us-ascii?Q?L7QXDoyzN/C43XssOiruKX2CWJpOm8N9Jf5AR/rsz5kplApBIspsaUsdTEro?=
 =?us-ascii?Q?jHai9zZ2DnxGsvVxTr6bt7KP3nMjRYHIhg5aasX9fn/D1PApza/ULorpCXM8?=
 =?us-ascii?Q?MP7KN7Sik0+q9VGntj/hLLzdXNYc9TPNXfpG4XBcqOPIZA+T1oxXLWJ0xZlJ?=
 =?us-ascii?Q?KT+oV67GX+G3yJwFvLWfyagnbrjLnvIuhJ08p4xzo4LV+MsSuU0DXXU1n8j3?=
 =?us-ascii?Q?4Z0M95wF/2ZLO+XTsp3ILi8cF76x2c2XMR1K0qJKTML73aZmzfCQ7/34Q8MT?=
 =?us-ascii?Q?o6ofq5YllLnz7KyyJUSYxur6iqLDXke3KPzi9WKejdCUQqkX1zreoMrPDGTy?=
 =?us-ascii?Q?4RKZ4sRg8KOVJUlANSV5xvhKFV1h/wtsR6HNVrGiM64op2jsMCgc6LL7yh77?=
 =?us-ascii?Q?D64+YsB8YCpPfM91dMTLDASDNNDfCo701CwuX7mrfAfT0Sz8bt6nTtOCBuNc?=
 =?us-ascii?Q?X6uwLEzCVsTjeByLrIG7pTlmK8B0c9RI3R8fUpgGoPK4N0OeDsrwCSDVoWft?=
 =?us-ascii?Q?HtoHBl4YgxEPngNLRycFi9azVYamQb+FMYsQttXxgmWf7qJg/8atZzFheIXJ?=
 =?us-ascii?Q?dZDbhRRMVJobXumr30hvZ0CeCHwYGPixtTlYxNRt9ntAm0wN8q6K6Y8VBOIv?=
 =?us-ascii?Q?BpZ4Kw2tLXDxYANUtOWFXm7IBY4rlL1qi+zH1Yyb01OyjbjyocAw7CUeocHj?=
 =?us-ascii?Q?CHKtoO/4g0vdPguWq+warBlm10wiJIKxM6z0Wei4LUIPA4WM5W5raXJ5jMg0?=
 =?us-ascii?Q?lqGolCBhN5ydcvVTboU4fML1ddfy9/i3jaj8bEiY4uJvplwdWbqMbcVkjVxr?=
 =?us-ascii?Q?6S45gupb34e2xWiSVP1rxckcl0CuhdIS5pPfT8LtX8tvCOi6EzA5fk89oaBF?=
 =?us-ascii?Q?TDPqNsQux/73H4KwUi7RkuErsBH1njqLkpBelKzXkbb2nwYtxFMepFUfqwT6?=
 =?us-ascii?Q?jHkP8yYF04mFaoWZ8NNaDheu8FKjEf3coBW5PEkePeKGEYy3g+dVKHimi22T?=
 =?us-ascii?Q?UEOjDOgokZX1qfaEDGTc9nphrVvIePZmX5+ZF/Pvxn4yx67RJAEvb0cYAVzj?=
 =?us-ascii?Q?SodQRC2CFdqFNkm3cBJsuhVb3uMlArV7d2x6S/HKhHThwh1cZmMkEvafiKil?=
 =?us-ascii?Q?kGZtVb8DpQmxblf42h38uFRiy/kaSwJxYsmgIGocphsDGP2PDCBWYougDYcP?=
 =?us-ascii?Q?sK89FiqVAXGqhNNU1jw9bMkMrILKBNu17ObXeyyDhwW0QRQAJcIqJBdeR0/B?=
 =?us-ascii?Q?KhV86B9qfhucsqFn79D8ocgepEaaJO55tDIcjiQqCo8Ifs/a/FTRerPEb16E?=
 =?us-ascii?Q?L4WeeIVSB5PACra+VbWQEecvHQYjDM4HneK4cjjqx7XYR2zx4Aykdh5fbzw/?=
 =?us-ascii?Q?Fm8Vv58jazmJISeXo56dPNMVZ1h2hYE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00644b0c-6111-46e6-7705-08df3eeabc08
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:23:21.0157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZIALd2Lr8aUc6PmgSG8nQqUGjYG33xZLVZCQGVtTr+mXdXzatqgB73NYA4KFrY/5imnX/xfu/xbeu6DRXZYObZfZeKDDHGr6lNzeedCeagS1fQihZQQob0pXbOEPM8xm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12483


Hi Mark

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


Kuninori Morimoto (20):
  ASoC: soc-generic-dmaengine-pcm: move devm_snd_dmaengine_pcm_register()
  ASoC: soc-component: rename snd_soc_component_{init/exit}_regmap() to snd_soc_component_regmap_{init/exit}()
  ASoC: soc-component: move snd_soc_register_[un]component() to soc-component.c
  ASoC: soc-component: move devm_snd_soc_component_register()
  ASoC: soc-component: move snd_soc_of_xlate_dai_name() to soc-component.c
  ASoC: soc-component: makes regmap function to inline macro
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

 include/sound/soc-component.h         | 118 ++++++-
 include/sound/soc.h                   |  14 -
 sound/soc/soc-card.c                  |  22 +-
 sound/soc/soc-component.c             | 432 ++++++++++++++++++++++----
 sound/soc/soc-core.c                  | 245 ---------------
 sound/soc/soc-dai.c                   |   5 +-
 sound/soc/soc-devres.c                |  80 -----
 sound/soc/soc-generic-dmaengine-pcm.c |  36 +++
 sound/soc/soc-internal.h              |   4 +
 sound/soc/soc-pcm.c                   |   2 +-
 10 files changed, 530 insertions(+), 428 deletions(-)

-- 
2.53.0

