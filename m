Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795570937;
	b=fMUTJLZ+1epHtx+VjgZ9FjRywV7PVrAxTuRR4aBpHzPhFhELhjYF3sWqm2/L2tIc1Jqd
	 jH/9l7OwDa+lrA96TU2CHWxYaFOjN03FKVAg6lqCKGzgfMZuT0R07nTH+z6BWKNLlYVFm
	 MTLDYJ8i4sSQJ9M4UmEtqSMcqYvNvR/1YqwZ6jfTBMWwVyYiHYKO5reBGFaMh4qnv3bck
	 2tqHHn4pXBvQOrtM/xmgUOH7/Q+ueQWuOWSV2ZCd2Gh6So6J+OFGdGQwpBpKKQQdouC7w
	 9CWq47j84Re0RHqhN4MuBnUR+7+MI7UZL7CBka5ymLkQgpYFRnpTx6k/eCD35nLby+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570937;
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
	bh=45RDRYov5V6/6ziJlwIFOM3t2Lh2oIifaRDMIiSGc84=;
	b=AM36EJQSNH/h9WuqzDebmLzkp0nPQLIWkelbWvIkGmg7oWi/5cTNbyKxlY2A3mXBMbKi
	 srAjH6s7TD+5fOZekcKY+dEafxoYlYvppJzWCDe1g3L/Qxvhn2IAtceKkW/oKkiC4LYTv
	 7zqlN5IadTVhYgl5nmu3K7SEOtINuRcH/Y/vr3jScbWuPESf5ydyMckJ7q5EBC7ZlM3Nx
	 /63YtUzbQdmV08CoCeHgYrGj79qjTVKtsjUsJSmw8zv5kJrQx22687VDzi0iMPhAkUYKS
	 57t88quseUA7q+ExUMqUPgpoqQVvc/OQHFJKZSJZQxNbuJr9NsWz1odScaeqJ1b82Sg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=J2IELkLW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.5
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011005.outbound.protection.outlook.com [52.101.125.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062F5606A321
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 062F5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=J2IELkLW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJImu32OiqKacSLbUwUjh2hkTidRxQwC4JflkeAHwn8Jnk2W5DGGBV3CSULXOoYFztRQ9UNNY1k+THEHw+YfxOUzH+Dzti4NhQfxhiP2I+kQaR6eLegaqE793sk6Tlme7X+mgwinfxE7/e6c+dOCDcuTP/7x9twrp+4OeEetH72Aoq8P/nWj/tTCM28kWaGkwE4Hr/a84B2zTCM8LXxeoIXATMnNLth6BJzi7p7zWLz1plHO7uLksNWuaOH75iXNinNwdzAnkBuLnuJGS2AzrhYvdKQCfzB9Wwv2swlP2UG/9cjvf6063xADbmgpra1ciCrFPUZ+wXkP011H9E3xMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45RDRYov5V6/6ziJlwIFOM3t2Lh2oIifaRDMIiSGc84=;
 b=dQTe9p6227AWfCjDz87lBgHZg6h3tWkOXd9r7nyMJ7zmwY6OfHKFkL5d8uNg6iKVx7OJAr87tF/Zkvr+uGaXdbNxjuqhVRy4ENDvBjamUYbBk1K4hB3lysscPSCXYdkgbVy5sKdBcGnsSkhHx9Qm6rR+x2s9qC7vMWNxupr7+TbVeEKa9mOvqRQzYSw3JMC5R0c2KmwdTjwZYzEZKFY+ezk/ClcsWOpQJQdKMLb0osUVfQxetHi0jBWWSCMhJNsrRuSKrCoc7Vfg5/0Ok7yx00NCA5so0wVimkCI9IPFDAHkYZg7fBiKuKwF3354tw/h2F+qO6TZEcdzuRRkQQmOoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45RDRYov5V6/6ziJlwIFOM3t2Lh2oIifaRDMIiSGc84=;
 b=J2IELkLWRRAECUc8YCa15e537s63njJgjO+KFBsDLUqxG2E+AYfaeAdwbfS4oMDTG/R3vfs0HGEmUEg9IpspRWhByGduBpRLt+gaukp6RrCAwN2pbnFruKrxTLzuZPx3p3NMnC2Y01q8xDREtSWpySF04SfN5DMFgLI6L2Icom8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TYWPR01MB9838.jpnprd01.prod.outlook.com
 (2603:1096:400:234::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 01:42:14 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:42:14 +0000
Message-ID: <874id5g00e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 04/27] ASoC: soc-component: rename snd_soc_component_regmap_cache_sync()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 01:42:09 +0000
X-ClientProxiedBy: OS7P301CA0021.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:26b::16) To OSOPR01MB749128.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: ec6bd352-2039-493b-cefc-08df4a955227
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|22082099003|18002099003|6133799003|261009223027099003|56012099006|11063799006|261021121427099003|261102123227099003|261102130727099003|261026121527099003|261021123027099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	4WK6zAV7FzCwBdTNAkE2m3MCPWD1K5wCv1O60dxRD9t1phF0J05VxdCIXrLGgxLW20Cps6zYaAQxYLW+/4tQx3TB+UWs7dZtYKcgr3A9Sk2pTpcGlHkkOwBwu3PpEhP3mZtWDn2Y91S3kX+3tx7EBK/hrwXdkw+aj3YhF/6Mdl8AyWO0WgttRe7z0LaqSkwqvFT6bjChdmpo+vYDAHxO+l6OWOWsMCw/56sDGe71t1MFd6wp7ZJDK8JmN24uVS1YbqAhp0i2TJmeSGpvxB1u1LAl/MGN5bhNMV8wOyKXFkBgu4Qk/RVhPm6mEkKJ/ScQ6HDkfrnPozLRbii1wdZDyTrLi/lL6khegm4k78Ev9vNFa2HH/Z7bJOouJ4iYYX1ewpbt+1AyitQTL869DpJg/tICtpm/2Fi1odRIAz8PyQ2uVPwQdMbO4uFewSHOMVDK0pSPigUgF6RbZvyDzsJfseVe5CyEfGCv9gHXWygI8a1WgUc3f32Kt/qh+3DXtkiR7YFWs8EwKU3B1iiSJt1gVa5iSBIWB4wUTk09JqQuJLrQfr5UCEs8bpZbBguX2I1dEyBJmZ1C/pthCudqgt/SkrfRy/wa6lPvVeeHcPjRLZ6WaZqcNcLCUR/2tJnFBC8KhCDDdfwnSYsxm5vYSayNwPGjvD/ffGIwvxCRMY4uExg/x8oN4gIg1Xhh6ZBO153NlbO/pyLXs9CRUEmDAnL2J8wqgOYcaKOBbTjCXPj9Wuc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(22082099003)(18002099003)(6133799003)(261009223027099003)(56012099006)(11063799006)(261021121427099003)(261102123227099003)(261102130727099003)(261026121527099003)(261021123027099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?s+zpzD9Cr2YWyUSi/mZirn0z01LrdUBGP7NpJiPHjVU707IptkFAz3OFEA?=
 =?iso-8859-2?Q?4tZ7OMGkLzxd4R8yYe9H45CxS795S3BOCWVFcnNKnqbO4hmJ9qAYKGwlWk?=
 =?iso-8859-2?Q?5LJXYn6/wQzuCNfh1nOBphvS0+f8w+B5xWaoUcM4MsXiqQYpAF01pBSn1R?=
 =?iso-8859-2?Q?YveU3PZt14h6fSP1k9aEY8DOIbHhwfrcVd7Cl/oGmWRt9hinbl1nN1ywG/?=
 =?iso-8859-2?Q?9BUOwplfaj8rMzq6NzVD2JIzeq948lTrr0NB/0zTXd/XJ7ko9Sd7Ho/Bsd?=
 =?iso-8859-2?Q?KdSQzUnOrr2+MIO0QtwjLdgyiBbs4+Pxysf0r2lpjBUDyTcQyF5X9qE0cz?=
 =?iso-8859-2?Q?9hD0w0y8hT0IO7oZ9RLaKdYiB7dQaVMCi4VHPXG1Hiv8bKUJEvDQ+Mhy9H?=
 =?iso-8859-2?Q?5XREWUzfM+LXj4kwlR7C7kDaxXeSSAxeaSzRgAAV6UCawrmpydvSta6+9L?=
 =?iso-8859-2?Q?9iLs/X6Z+Ob4ysXWG1Ilv63e/MLW4liBdAcrCSvdaxGTbi049JQ2YA9dxW?=
 =?iso-8859-2?Q?adYZzoUVf3SMFYD6pn3QDl/QTCSqWLiz0id3Qc0xBRVGPjDxG1x8t/bsy+?=
 =?iso-8859-2?Q?xrxOl3B7J5gPv8xhHqSumdR4OtGm0elrj4AD83ldazymASTLRQECO/Srl2?=
 =?iso-8859-2?Q?XgKw/HZOakFejCnZ1osc+I5B8puu7EBsSGcWIsEfeQIqDKCKhlsZRd/kUk?=
 =?iso-8859-2?Q?D4wU6CYf/kceaxyyygGRNEZZ1hG/UP0n15J+MjO5rhndr0OekHkLDH0p+6?=
 =?iso-8859-2?Q?qNU1kFW7dB0W+JOsD9kiztaohRR9/Zn8vOX2pRmquHdr+U82ppROn+FKb+?=
 =?iso-8859-2?Q?LP0ktbG3twK+8RsBGyvixeDYcShfANzQIhWsSUtdhK22YUo9QjfXQdIvYn?=
 =?iso-8859-2?Q?ylZjv4stxxpWi/fNj29F/cO3HU0FfgEccTi/TgLnSDYpHFwUbhK57eWQOg?=
 =?iso-8859-2?Q?rQK00uUcTpRutIQvSJVavOW2NvJBXtJYBlwOqe9/bJ72MqAVJDaV/rkUf2?=
 =?iso-8859-2?Q?l+3jCbeKWGZ6O2ekCcvfafYJumVfCb1CJsjuVOg4XKKS7Tn/Jy5kmNHAGH?=
 =?iso-8859-2?Q?uuZYoekyoXqP5ZdAhPpxSfGfRYHqNwBmPN0Kjzhn8uMw6QOr38Sld352hq?=
 =?iso-8859-2?Q?q6qSomfsKctcSE8nO2QRBpfHUEW8o0ocKHANmvIppxClUiX9eZkY/5Ej4X?=
 =?iso-8859-2?Q?9rkDr7/UPhM3aSvvZUjiZjV0wBsQwEhjs74WLlysgqTojdCpKgqDAvPI1x?=
 =?iso-8859-2?Q?6m172JHgtxHbQ1faxavKvgYCF05n5dwAgsjh+XBgzo6n9KL8qCa5ATmb9/?=
 =?iso-8859-2?Q?qHlROLO8O2zr6XAuSQEJiNzhf7wMwpMLCwJpPu1inly+GhkfwRC/8JLmVB?=
 =?iso-8859-2?Q?OxeBX75epw6MJLID/MQk9Skc2JOPYFZS7wRS+ltmojurgOXF+MeTweq5Ne?=
 =?iso-8859-2?Q?UaVoeOPkuxtR0P1TQK98j1weZJSDlBLw11StQnwgKItaDL5rzp3Y7EF28C?=
 =?iso-8859-2?Q?sPrSkJ6Y1eEIU5nyjD6zLMhBs+IrAy67/OkSlKT401ibMd0vMNpDiVLcBW?=
 =?iso-8859-2?Q?eoKen7EznY1MlV5I814RcgKLx+xbVSTndJ6Ig56K09zBUiQVHdXR8MBuRv?=
 =?iso-8859-2?Q?OHEPZlW3XZM4+uYSzXrNluBtX7TscfaK/ppYHLsKkIvUqylPrJdN6hr9xv?=
 =?iso-8859-2?Q?Hwn/uMFyd+Jl9L8fmYmTPbxx236pnqd9Vl2kCWc4ceUGy29lw/9BAY6N6D?=
 =?iso-8859-2?Q?yazkafrQRb6ViQ/uRBJlJjisas2f4mt0KXCd9f1Ww92CmIwykC4KpdFE+t?=
 =?iso-8859-2?Q?WJy9GlQBSejzoz/HkEE7OK3N9DkHOqM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec6bd352-2039-493b-cefc-08df4a955227
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:42:10.0191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nNAhfL3a1f3dA4Bxx+ogVPqPH+9CJCFAxgGu9+uvEmRMVlfPeVDQj1Zicst/c7kVSQbfaxlYoOsrTS/Su9F65AJ1eR7wamp/bvQOxiPGTHCGplRp+/h0GUxVJBbSDvkh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9838

snd_soc_component_regmap_cache_sync() (A) calls regcache_sync() (B)

(A)	snd_soc_component_regmap_cache_sync()
(B)			  reg    cache_sync()

Let's align the function name to original function.

There is no snd_soc_component_regmap_cache_sync() user yet
(function name change will be happen later when all new functions were
ready to use). Don't need to care re-rename the function name in macro.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 4 ++--
 sound/soc/soc-component.c     | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index fd2db8992b248..d4fe3e02347eb 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -334,8 +334,8 @@ int snd_soc_component_set_bias_level(struct snd_soc_com=
ponent *component,
 				     enum snd_soc_bias_level level);
=20
 int snd_soc_component_regmap_get_val_bytes(struct snd_soc_component *compo=
nent);
-int snd_soc_component_regmap_cache_sync(struct snd_soc_component *componen=
t);
 void snd_soc_component_regmap_async_complete(struct snd_soc_component *com=
ponent);
+int snd_soc_component_regcache_sync(struct snd_soc_component *component);
 #ifdef CONFIG_REGMAP
 void snd_soc_component_regmap_init(struct snd_soc_component *component,
 				   struct regmap *regmap);
@@ -447,7 +447,7 @@ void snd_soc_pcm_component_delay(struct snd_pcm_substre=
am *substream,
 /* REMOVE ME */
 #define snd_soc_component_init_regmap			snd_soc_component_regmap_init
 #define snd_soc_component_exit_regmap			snd_soc_component_regmap_exit
-#define snd_soc_component_cache_sync			snd_soc_component_regmap_cache_sync
+#define snd_soc_component_cache_sync			snd_soc_component_regcache_sync
 #define snd_soc_component_regmap_val_bytes		snd_soc_component_regmap_get_v=
al_bytes
 #define snd_soc_component_async_complete		snd_soc_component_regmap_async_c=
omplete
 #define snd_soc_lookup_component_nolocked		snd_soc_component_lookup_nolock
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 41fa459d954be..2979d2b79ed13 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -404,19 +404,19 @@ int snd_soc_component_regmap_get_val_bytes(struct snd=
_soc_component *component)
 EXPORT_SYMBOL_GPL(snd_soc_component_regmap_get_val_bytes);
=20
 /**
- * snd_soc_component_regmap_cache_sync() - Sync the register cache with th=
e hardware
+ * snd_soc_component_regcache_sync() - Sync the register cache with the ha=
rdware
  * @component: COMPONENT to sync
  *
  * Note: This function will call regcache_sync()
  */
-int snd_soc_component_regmap_cache_sync(struct snd_soc_component *componen=
t)
+int snd_soc_component_regcache_sync(struct snd_soc_component *component)
 {
 	if (!component->regmap)
 		return 0;
=20
 	return regcache_sync(component->regmap);
 }
-EXPORT_SYMBOL_GPL(snd_soc_component_regmap_cache_sync);
+EXPORT_SYMBOL_GPL(snd_soc_component_regcache_sync);
=20
 /**
  * snd_soc_component_regmap_async_complete() - Ensure asynchronous I/O has=
 completed
--=20
2.53.0

