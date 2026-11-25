Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795571002;
	b=2mYs0Yink19VeGN2jhj/XTzvc1FinkyrjJVf/1xabW/51PHC5XL5o1k/LZ4EQSQpEy1h
	 m0hjhcsV6jVsbm2wlL4cqwEAE13j4f0W7yHhgHcrpvu4tEbouIcqta2TPLF5zZurjztgc
	 qjyNh5/JmE/8RzuyI8wfRm2YqNKHo1TTillPwhEruvdNeHiZDoEyRi81zMCDFKZekjbPm
	 2nNYvbxQgN2vyDsIGTS7X4QFmPgrZ4nBMIEYWyA+/SuHcRYY+xmP+pvyKhm0COXFiqCto
	 0a0Ab3vhUIOhN277sPMuJjh3LC2S0qJoYLKKSwrgiaMObrjCZGF+QRP1XLmKEtzYTvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571002;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date:X-ClientProxiedBy:MIME-Version:
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
	bh=T8CWax6HZk3/RKzJhupZJTrnBWBN91zx7sZhxqdauQs=;
	b=Dz4MxOWTlwM58x1v9DNU/CJQZxJEqclKX6vjun278mAUnbSoF8dNoYmbWldb9TeyBWDU
	 Hv2PjOH23TYmR/KvSwyx1aX5NDVzqgTSXkAkEIfx+E0oW10phyADx9O4ANGXH0uVPUjvb
	 w8VsXy8Ji0WsrnkIR0mxVXbnVfFPSx3mj1GTDtg2ufNww3FxZ98xTieBwIHaCp2LVF8bF
	 1MBr5h7busQJe2j0JG0v+BxQuOQUuO1etj5x4kW1C+IZRcChyNGqj6dD5gSkYJj1ZiJ00
	 WLGcK0hX8vR4/AfkOmwxm0IP5drQG5Yr68vK594IHNUJu0oRj4G59rcOkexKaxLNXHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=dOp3pIvi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.11
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010011.outbound.protection.outlook.com [52.101.228.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A54E606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A54E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=dOp3pIvi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ix2UL3wBKJRaIsulBQ1dc/WmXBOdRXRBR4iZtr2P19fDwUjxyCHzaZNXNDH1rp20yQ75M5qt3njrVgGRz1rIZo4gYZSFeLVwvT4kVvR9emFbjCP6Pd+MR03NuTyfeyDm8GSeoYf+0tJw71hKPYUrCAiZvLEFYUeSVXnOYJ7IwoBHHSwb3kr34XhcXJlr381qM2wVEnEqZJgVMYOkjTrbyXX1riGzWxmLeda48Wdsw5nmBoxv060XKYqEue7/0AccGBNyB4qBiteqZj++nzLaGGe+8r3s/26yWk5lzzdCmeSODvLhRu+VcNNmzVijRtfBQ8o92q0KXSC5/T3Jyp3kOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8CWax6HZk3/RKzJhupZJTrnBWBN91zx7sZhxqdauQs=;
 b=y1IDy50UeKevg4gYxMIZ3IcTxc3oE9J1I/bUb5XTy/n31BjaMM1HRDA7Po3ua9tBhtosfhuZ02jgz5fWVmbqilFK+12eVgoRWt9awSeclto54pDZ1LQlo0WxTfth67N+OJt1dheIM4xC7RHsqU+WxiJoe2Hr40v0noH2Hc5CeF92vCphUJxKLSbIqeNtImNmZPSx24ektvFV27AUoUL03EMt17fUePhKGoHwzg0EzN7zDFvA+Ld/mgG/5yrqSveQrcf/urRwmZ85qQ90q+CYucu/mPyHsKh04Wc0l5SX8lxHm80DPOGFwLKWUx3skBd16OPC0mgMGyXM9a+HlVxDCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8CWax6HZk3/RKzJhupZJTrnBWBN91zx7sZhxqdauQs=;
 b=dOp3pIviS6k2VlZdL0mL2cx2MiCxqFenQwZmXa0oDu4H651suT6ULk9dk52txHxmN9QOwYdnuzgATtrlOL5IDl6GhkWZBBBcx+R8uwI1napQlnFPvMywYCo5+3xe+aTS7C/BKx56tXcEaZGum7n6Qow7aE7x/ypHBhWc3TemvZY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TYCPR01MB10476.jpnprd01.prod.outlook.com
 (2603:1096:400:304::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 01:43:20 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:43:20 +0000
Message-ID: <87qzg9ele0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 13/27] ASoC: soc-component: move snd_soc_of_xlate_dai_name() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 01:43:20 +0000
X-ClientProxiedBy: TY4P286CA0044.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::15) To OSOPR01MB749128.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: OSOPR01MB749128:EE_|TYCPR01MB10476:EE_
X-MS-Office365-Filtering-Correlation-Id: 250ecd10-210c-48fe-2fe8-08df4a957c04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|376014|1800799024|10067099003|38350700014|56012099006|11063799006|261022105027099003|261021123027099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|261102130727099003|261102123227099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	kRAuhBL82dN74p4wHgop0odHRM6uEfjEJwhv4sNuxjaXlaMghewnVx3i1hpCDiI+0TlqptfmlwiDwMc2k6fyz6jU/uu8nYfJ4tFpv6zi3JwzDGVdTGGJl5PAAYqNqBfAKJUcxGF0gn+V6CzGM0XUjzivcMENDNHtNzYw/7jIAuWUJGwR986IKuM5Yh2XCbJB39pRLWOcBJLlYn4nnQmiy2apKzSnBgzVgFkVgJMosM4ukbAyeWb6vliI9syUPnz1NBe43bmSK2hjosaivHmKwq5/ATqLiSVggFjiGkahG+bBZ/HUzHMZzkdz9b9J53Gbe980ZQnsitXMsVx0IDBszwalYoQ8V+0Lsm0AE4M0PQAs/h5wpPICCNvTwx6n4KI8Po3ZemKmMVWJ0gILD+YWDQ9E1LS1woPE5xQHN+bGsgaT1ZHM0rUDw19O2bFmuGnyKHIBtzFsoCTLyAUuxfufo4KmkER/XF7/5MaayQa9KyVFbqrlEA2fvxVstXEhs2WPRtTEO5z+Z2qbGgJbZ7B4l4BGvNXXEojWKLbzVS7l8/wbobbdyNYlWK0Vg1JKwUiZZWdP4Hp4ZXRZ6/TjfSPrUaxmFgKKtjgXNCYEGhEF3F3AAozCMT6RkJzEXkZY+oRzlnHXzfEz+2DnzcCAU/a8+NOMIPqHEGJ2qex0rZeQONARLWm4Q5yTYh+XAFplMtdLt29SpN4+B/iruhXahdaNcT9NGruUm1n0iGP5w5VeROE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(376014)(1800799024)(10067099003)(38350700014)(56012099006)(11063799006)(261022105027099003)(261021123027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102130727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?EulwFye6LDJkxRJVDAlcp4pHV/mYiJOoejRVc1fJSwhI9+bACr/PSyokjR?=
 =?iso-8859-2?Q?w6VTx+sWbHKuRS8oH4N9aGzQVRuVxdt0SYe9epG7NY8uo9Ez5zKnRo8zkS?=
 =?iso-8859-2?Q?C1nRVBTqza55zLpvQapOghbnx82VPTw7rlhD+Epp1ZHIG1/wj2WsXj46f/?=
 =?iso-8859-2?Q?WbgNLp8I1QAW2qWyp9dx8YxuAByLyn3hYPNCly1qt3MovDF5gILwT1GH1x?=
 =?iso-8859-2?Q?z8y2jFXFa9Na8PdjBnEBT87kHn8Z5LX3nDBK1HSc15oxWNkOWDec+p21Y7?=
 =?iso-8859-2?Q?/P9CKb74i+kmRKXgCfDUHH8kU+x66dqcLPwaTGqEW7OKt81gEb96//hX+z?=
 =?iso-8859-2?Q?411i97x1d5jZKh8uvWJwJNUNOPkjpgjXdz1QT9bKVwfZ7IKYDj5EBTVjn+?=
 =?iso-8859-2?Q?FYIQT5TUWwSW22ewY8zwzmwfrdZvbHPadr05aW+rKVMpWfuLD5W+iOso6y?=
 =?iso-8859-2?Q?JMtwbmPdJhcz8Aj2qd83nCIm/ATclqlNNiOIgxoQPIJpKnQdsrq9hd38Mj?=
 =?iso-8859-2?Q?AxGsguFgzd/RlXLxfsfvbcYXVPaj3tEDjMMIsT4jMClRMtO/NPU8hQkobU?=
 =?iso-8859-2?Q?fPLxUwiJtiCd+zsxdkVsoMCjD677wB2dP7/7pViuCAZxtqJj4cSRHPNzh2?=
 =?iso-8859-2?Q?rJIBJ4WlpRIy301AfnKd/X0sSntGjm9VP4B2th+icHI/TnNU73sHzVxhZR?=
 =?iso-8859-2?Q?DxlmkQtkvRouTIII4JyVnij7T0a6nqPPZwS23YK7wSWsem9DNzE16GLuKh?=
 =?iso-8859-2?Q?eLYhkdUpghKoPnCYubCaE2oAutmTGUp5YuRGefG5awpycKaOIgHcvI73tB?=
 =?iso-8859-2?Q?qGjTkpVZGem/VR6weypnyju+WM+NpLyX+vTRf7B40ICBpXRz6xKEhoifBk?=
 =?iso-8859-2?Q?RUzT0vIDk8+O5zvpgIwktIsgiH9rPNHP+l9h8CTr9T0bOxEtueFMT3ERUr?=
 =?iso-8859-2?Q?fgjEPyeBpPIlLpnLeNZp1Aonv+nx3RjwK5U90UWgrFXPPteXJ4aGNdf3oj?=
 =?iso-8859-2?Q?nQdpifDDJGsovO37q2mJY7N9Ja6Pc4vxXEMCGLoHM/r4C5FRq9xhqFEsmX?=
 =?iso-8859-2?Q?KmrgCB0T6RIRqfXAHYIWsLx1QKFDhcbLAcc9Yoc0nMlPByD7CazT0a9YlA?=
 =?iso-8859-2?Q?4ux2lGG/lFP5QQP9hri3NEcw1UlrnfFj62L8fzKZ80MCBWE0tz6xhFH7L1?=
 =?iso-8859-2?Q?f8/6lg/8RF9826ll6ypOIjMpYE295q8CD+Cl27Y05FJYE0I+PNJIfoLmqG?=
 =?iso-8859-2?Q?VUt4GNw1kNIzSQzh9E9SvK6bb9Y2sUseygvQhVBkiImiX5KI8raFzGhdCR?=
 =?iso-8859-2?Q?yITRtLPluuHNV4mOfzXYvCrim1nu0kVJHK5MOJgV6JTMyj60+jLdKnqn6q?=
 =?iso-8859-2?Q?y/7z5bTIC0ajUPeiWUQWK3l0WgU/2U27sQTyLi7ZfYeAvTTcMVOv1BeLLt?=
 =?iso-8859-2?Q?VOLFG9hBWzUaP0NHROdDxVoop8Oj0Le+5BF6X4yHDqrPG5AGHqINZ+Yfla?=
 =?iso-8859-2?Q?UC6fQLLBiBhv4trUBDIV+j4bJzYtgvxZIJJ4GQOl/Z6Vt/JS8FiOvxUU/5?=
 =?iso-8859-2?Q?zG09UouYzMzxztjAP0Abmilf88pLk65PWTUWYc54FF27kyDeNTERx7CEd9?=
 =?iso-8859-2?Q?5ekuZP8FmkfwyYSkoWgwAZoReHUyz4wWcI8yivhOPcLY/NhhYKp40syNUZ?=
 =?iso-8859-2?Q?vSKJYz6r31YjojCVBcoro3N8GQAnxLipl8ipyeXmt2wveAuX6zcL/tzQlw?=
 =?iso-8859-2?Q?qBKsZLTbnLyhLCZYL4fL1tYBmb9DsiuTIj638+qczx7KY9mD5C3IUNWTZr?=
 =?iso-8859-2?Q?I1Zt1bNQn5GOHSsiQbfdJrCYS5tmdx9JAVP/e3ChdFbQgxKUszcC?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 250ecd10-210c-48fe-2fe8-08df4a957c04
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:43:20.2614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/8brPVTrGjnjjcXnUTH7b0TjpnU8e9pqUJRPfEFLreiHU4zmw6ZQFb9KrPPhpuvZRouKwAIbf67JAdngf9CwCxGaITNEmhXWwKAD+8fIQGYp/A5y0JV+FVhrn+1IdpQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10476

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

move snd_soc_of_xlate_dai_name() to soc-component.c

This renames function name
	- snd_soc_of_xlate_dai_name()
	+ snd_soc_component_of_simple_xlate_dai_name().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h |  4 ++++
 include/sound/soc.h           |  3 ---
 sound/soc/soc-component.c     | 33 +++++++++++++++++++++++++++++++++
 sound/soc/soc-core.c          | 33 ---------------------------------
 4 files changed, 37 insertions(+), 36 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 965c2555010c7..caed32327daca 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -401,6 +401,9 @@ int snd_soc_component_of_xlate_dai_id(struct snd_soc_co=
mponent *component,
 int snd_soc_component_of_xlate_dai_name(struct snd_soc_component *componen=
t,
 					const struct of_phandle_args *args,
 					const char **dai_name);
+int snd_soc_component_of_simple_xlate_dai_name(struct snd_soc_component *c=
omponent,
+					       const struct of_phandle_args *args,
+					       const char **dai_name);
 int snd_soc_component_compr_open(struct snd_soc_component *component,
 				 struct snd_compr_stream *cstream);
 void snd_soc_component_compr_free(struct snd_soc_component *component,
@@ -462,5 +465,6 @@ void snd_soc_pcm_component_delay(struct snd_pcm_substre=
am *substream,
 #define snd_soc_lookup_component_nolocked		snd_soc_component_lookup_nolock
 #define snd_soc_lookup_component			snd_soc_component_lookup
 #define snd_soc_lookup_component_by_name		snd_soc_component_lookup_by_name
+#define snd_soc_of_xlate_dai_name			snd_soc_component_of_simple_xlate_dai_=
name
=20
 #endif /* __SOC_COMPONENT_H */
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 338ba5cf85fb3..5abebfa329b52 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1303,9 +1303,6 @@ int snd_soc_of_parse_tdm_slot(struct device_node *np,
 			      unsigned int *rx_mask,
 			      unsigned int *slots,
 			      unsigned int *slot_width);
-int snd_soc_of_xlate_dai_name(struct snd_soc_component *component,
-			      const struct of_phandle_args *args,
-			      const char **dai_name);
 void snd_soc_of_parse_node_prefix(struct device_node *np,
 				   struct snd_soc_codec_conf *codec_conf,
 				   struct device_node *of_node,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index ea8ed0a662dc6..c1f90a47e182b 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1817,3 +1817,36 @@ int devm_snd_soc_register_component(struct device *d=
ev,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(devm_snd_soc_register_component);
+
+/**
+ * snd_soc_component_of_simple_xlate_dai_name - Resolve a sound-dai phandl=
e argument to a
+ *                             DAI name by searching the component DAI lis=
t.
+ * @component: ASoC component to search.
+ * @args:      Phandle arguments from the sound-dai property; args[0] is t=
he
+ *             DAI ID.
+ * @dai_name:  Output pointer set to the matched DAI name on success.
+ *
+ * Return: 0 on success, -EINVAL if args_count !=3D 1 or no match is found=
.
+ */
+int snd_soc_component_of_simple_xlate_dai_name(struct snd_soc_component *c=
omponent,
+					       const struct of_phandle_args *args,
+					       const char **dai_name)
+{
+	struct snd_soc_dai *dai;
+	int id;
+
+	if (args->args_count !=3D 1)
+		return -EINVAL;
+
+	id =3D args->args[0];
+
+	for_each_component_dais(component, dai) {
+		if (dai->driver->id =3D=3D id) {
+			*dai_name =3D snd_soc_dai_name(dai);
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_of_simple_xlate_dai_name);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 3663227adda68..894a81b2d9836 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1591,39 +1591,6 @@ int snd_soc_of_parse_tdm_slot(struct device_node *np=
,
 }
 EXPORT_SYMBOL_GPL(snd_soc_of_parse_tdm_slot);
=20
-/**
- * snd_soc_of_xlate_dai_name - Resolve a sound-dai phandle argument to a
- *                             DAI name by searching the component DAI lis=
t.
- * @component: ASoC component to search.
- * @args:      Phandle arguments from the sound-dai property; args[0] is t=
he
- *             DAI ID.
- * @dai_name:  Output pointer set to the matched DAI name on success.
- *
- * Return: 0 on success, -EINVAL if args_count !=3D 1 or no match is found=
.
- */
-int snd_soc_of_xlate_dai_name(struct snd_soc_component *component,
-			      const struct of_phandle_args *args,
-			      const char **dai_name)
-{
-	struct snd_soc_dai *dai;
-	int id;
-
-	if (args->args_count !=3D 1)
-		return -EINVAL;
-
-	id =3D args->args[0];
-
-	for_each_component_dais(component, dai) {
-		if (dai->driver->id =3D=3D id) {
-			*dai_name =3D snd_soc_dai_name(dai);
-			return 0;
-		}
-	}
-
-	return -EINVAL;
-}
-EXPORT_SYMBOL_GPL(snd_soc_of_xlate_dai_name);
-
 void snd_soc_dlc_use_cpu_as_platform(struct snd_soc_dai_link_component *pl=
atforms,
 				     struct snd_soc_dai_link_component *cpus)
 {
--=20
2.53.0

