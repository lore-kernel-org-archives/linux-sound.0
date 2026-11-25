Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795570921;
	b=WE0UNsE2e7IJUWyRI+ChnF/lFKX/mIDFolHu2kb5XlprQQidVMvJ/Zlv0TkF1LnPHeik
	 4Nt7h/gicmkWJvPdDqwmNgUrnbzDjlV/wzompDQBiWVy6QLhsKeePW1C3otUzkxQrZRGr
	 YmJE+3j3M12vdKb2y204Z1fluhGq4jxMZMFTfm511dgBcDS/RxzlNO6m+yNRIWcRAH5Qz
	 IU7yzS8+44Zckx2HlJAY55R2c5T1O5O0BT/Ij4XRTVZGBFJ2/tyjVj2qa8KfwgjiluSzn
	 QaibNPKH1FfJWfTzpAgXnRlDJR/I2i+RO/QyJQw58gV7IYQURKDc54PSr6k99a9Clrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570921;
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
	bh=Qs0zUsnBq+yYmFJalVqfrjc5fCeZ9F5Lb/YWivgctNs=;
	b=OhKKk25XAfY4qFfZVq/x/4PndZ674+7ki4lP3oi0CADzm/uf1iJuOUNcdoSv4bP3H5d/
	 PHJI1+s6kB5EhyYJOMcv7X5A2OXY200AQgBp69rOBJzuwdH2AxIPQGDG0BQngpTDoeJKp
	 1dLArewsChArh3jdyxH8b36NjJPI2rPqTW8znOpnsjXu86gzQrZ0OGieMzxKIewuWLH9P
	 uD12bhvZUKdoat/+d3Jgw7x6YI7WrIwSNyXa5jclYWrZ5XlSfBRTS1ty1PD4T96jqTClf
	 pZbNS4eo4ixmIvsrkUtrAObzaxiMnGUZjk/0+O/A4vvILriOq3PiJ69xEUcFnmhuFSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=fSakfh1P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.35
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011035.outbound.protection.outlook.com [52.101.125.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D8C606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70D8C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=fSakfh1P
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrx+fotiN+spv3tzIWokDEkvMi12qtamnLGq60L4Jnie9r9fxKqtTaE0XtBvsNkQHu5lK7Sz8ReEDwtWNOu23ntAg+gxRNuac9xbnTGYuT/zusHmi4eqwSdy7UKAfQigVjEg50Su/DSyM4huYfEGsLO8AaJDt9EzLA5DKHevDTIkGVf83IC+39tz8FMc6grpuFZZzpcmWdog225Zs8sCJCwY4wdqtdwGMOYEqg0lo737XaZ/YxiKoyx8uiLVPfCMHFXulpTsAyYK9KGObVIx6x1EdETAGWmqGxjC/B1LI6MmAzCm4YW8vhqz9Rk4iO/7yTbka7YqLGlJNsTVjYxD7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qs0zUsnBq+yYmFJalVqfrjc5fCeZ9F5Lb/YWivgctNs=;
 b=REf9TS4N26CNhNzh8FLFiKu8pwq6oH9inrBmh6MA3/9wxJMA8+28Lin9jCDVhov1HRxEipsaaSCRc/OrjD5UzvSGRGbaev6KlOvsKDlwpULQPCpNsL9V14ALzvKrTcg9JNefrlAXE3OW87eU+FOchFkCEl3UUbKQcUge+0y6CoE1WEMs4OTkMndwQ80oZFlYW/8zuD/UXUE18phN5WtsSB+fnrKGK0T2CYmhtziRNFbYKDsN4KIVvh9WAm8V2GNeYiDiDB9N5OEVgHaACwPmrcc9XcZZzbFDL8JOVNqbchdaTcoXb6X9dTllIFTop3aL5/wD/ioSUXu336xT6A32Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qs0zUsnBq+yYmFJalVqfrjc5fCeZ9F5Lb/YWivgctNs=;
 b=fSakfh1Pa47wUAzJOvngnxyPkofKQORWrQUE1NBHrZerDfW+nCuZQbGXnK0b12+3jkRkUha9JK64Ty9beRqfjl2btZiF8hHZtCvthL1bLdWauCqzCw6ZvJpdy95tPmhrEVhWMFhcfwjdqav5ZhSr6aEy423TepsyoM2kUCMYMME=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TYWPR01MB9838.jpnprd01.prod.outlook.com
 (2603:1096:400:234::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 01:41:59 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:41:59 +0000
Message-ID: <877bi1g00q.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 02/27] ASoC: soc-component: rename snd_soc_component_{init/exit}_regmap() to snd_soc_component_regmap_{init/exit}()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 01:41:58 +0000
X-ClientProxiedBy: OSTPR01CA0029.jpnprd01.prod.outlook.com
 (2603:1096:604:221::20) To OSOPR01MB749128.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 59c1c25b-6826-47dc-9c46-08df4a954b55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|22082099003|18002099003|6133799003|261009223027099003|56012099006|11063799006|261021121427099003|261102123227099003|261102130727099003|261026121527099003|261021123027099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	rs7XjRblOKI6/6Thdw7ONAU1XzODoQNS8TPPlAHRuWvuVWS7aTTy0oKJkFs+KrhKIQESr//oNPnWo/87h8QuAaRupk5KQj45cL/yHDfn0k9YB7tqDPNvYKT6/dZs/ShHHBgt32T+g3+uDNTEb8984FfKsxc4OqTlRFpmSxI0wqCtwx4q4RANinOlIQOgSYPSFrEgdppe+HIV16OE49NpHjzJfY8w2VGxnPY9MQI3GkomuoZb4D1D31WazPNQCdNJQ54jMLzPUy1jmbqGH+8zzh5yfi6gPS3/GEDbrOumrBbqcLAKILTv+BUTbjV6JhIXdXi/i4PaX3nkzfHD3fwpAdHUnrn+a/G8QSSSWQsy93S8Ir3zp9Qr/rQOE53JGaOCjwj9PKH0wZ+6fJz/zOadipdUxYU9nyyKCPrTIVvTJcOI84UXM/84qpL03D+dGap0Iryj3WG4LXPd6iXJA7k2A7vtEvGm0pI0oD+Wb3ECsFXyesgHKA8S7Rlrb9KwsjAZHi/bSHCXfeByixdZ76kPAxNk3aRLopkU2wAIxRhrPoEdWjLaeoyJm0YsrsB2GRXT1EWC1CZQtq7wVqrkkpw0J5QL1id5ZXdEV+IC+iARgcUhatp9oBmuxPC54ZO8KpbcYLzlc/f3Ztae6LPuvLseKFBWqMKkaoN06iangHb64qENCC1bGAgou9KoIle9e/QtSdUWZw/WQonulHDzn7tdiA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(22082099003)(18002099003)(6133799003)(261009223027099003)(56012099006)(11063799006)(261021121427099003)(261102123227099003)(261102130727099003)(261026121527099003)(261021123027099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?1/1kRqT+dQnb1DrcqiznAySdFzmseJRhTiTRtpOYvymIJcC9aPR9iWGbwN?=
 =?iso-8859-2?Q?k6GjAsFQof/WL+jPQL3o5g0DpPmMtCYDID0OEM0fNllZqpYqyEttK/1Viq?=
 =?iso-8859-2?Q?h08FABYLu9eaZuCeUh7prXIaxPpVH/V6WUBatrtQYLfKFKnreZXh0y/Oze?=
 =?iso-8859-2?Q?WiZErtcd/jlkSGtvbYm6Bhu1HzXrN8YGYRk3rskU7phnmhuJTvl7qBLvI5?=
 =?iso-8859-2?Q?XiggBJcKsFZiDYPWemenj4cRdXOnFk8RzaxTQnfe7djOek1hwGu3ULIJNT?=
 =?iso-8859-2?Q?PyrkAmJDAvcBQE56ISwOnfyZnGY1M/Uot39WSO0pP3I8FutXM7KIPQN/uI?=
 =?iso-8859-2?Q?mRgO2nuM80bMaDPybUGGtmY6yTfcH2ZdoDF7/VYTFtZQO9yUhR8WuaqmBg?=
 =?iso-8859-2?Q?xyCIdLztSfnap6tDab2tEGf057pldqNrKH87Ltc1eHHLIYeL/2GH7LThBG?=
 =?iso-8859-2?Q?GvR3msYjy6Tj59u/do0wyyrdKYY42Gble9Wnye+LZDqJFSaxZi2zI/rtou?=
 =?iso-8859-2?Q?pXuPjoXG2bb6xPKa5F3VegegsZUKaMAnKQ+lRRA2Pp6eMiKDJ4YeRyAT8K?=
 =?iso-8859-2?Q?kCMsnSQBMiPNnxTn1TsdY+KC1N5JZHMA3tVdnqagmQlX0Pp7sx136dM8PP?=
 =?iso-8859-2?Q?o/NxX1wCG5nEK82Lf1Q5xM8yHMq1NLkAjVMqg0DbhNMUZC7LhI4Cs6H3sp?=
 =?iso-8859-2?Q?1JPZaNJPrl2MmckcwiQ6vs6ebcQN9EIa52uMzX7wXuWp5KXGy07LT2P+46?=
 =?iso-8859-2?Q?ZQ4PUdMTn+dUJaMLo65H45N6PP3Mk81GQqngBdSvzZCE6HBVMgExyAwK4d?=
 =?iso-8859-2?Q?3oqmVawxVwP92Nl/Xkk9z4MOB6eh9YYCuXrlp8By5bkUq198+U4T9iEh57?=
 =?iso-8859-2?Q?ObCBZqAMiM/ueDj/5yBa7jXtx25DWep5IarDLGMYpCMtPYXlXD302xKge+?=
 =?iso-8859-2?Q?tcHQ5aarurqA1FonxxZoZyI5ieP3JprnuNYYYc/rwCpjyJLjPIst1tsa70?=
 =?iso-8859-2?Q?A4Y/WNfoVXX0OKa1NnN++GZYsas4kQ1USyx9TQTMKwnlFyIiOudlM0KUoV?=
 =?iso-8859-2?Q?mjU0/sdZcdksdks0FIjJ6km1D6K2ZnyF9WC3hb0EZRUn91UF9fa1eVUdAC?=
 =?iso-8859-2?Q?H9Cn2Y0Rpw25Mlu/YbHRmwLFwybGsdTCVeU57pTq6p82VHnDxmL5/xjpMR?=
 =?iso-8859-2?Q?Hxf3C4rw5Z/mHVQYyJis/6hvwhFzZAF5wPbVVw71dkc2gzEyrVQKLCm5lR?=
 =?iso-8859-2?Q?tNXimjWPl/fl/I6fylGkRp8H3F8ZgiNTEdNPMuFv2gBpHNyXhvMTQWoe5b?=
 =?iso-8859-2?Q?OH1Hq19qF9DNOnBZD2zMrMGvBGu8EdEiCI9fmGga3BSToHyKiEibXpELaH?=
 =?iso-8859-2?Q?5rfR4s3+RbemXAug4M089lH1t3uQVisvScNsEF+skHH8ByDO9Y0HXEeiuw?=
 =?iso-8859-2?Q?JbH9GydVe/kmU9eFIvdj8nvLE69Zv8ukAkxFTfJ/13B5e2FfAbVtJxvIYL?=
 =?iso-8859-2?Q?gSbzgg9XNpqC12bfFvBVS+bKDdAkSPhfqWRxd7pOtlrKTsHA21ceeofqkh?=
 =?iso-8859-2?Q?rsrg8LSKAWm+/fI7YPAUt3DvB5ed/RVkJHDyGXTnZoyuEzA1y0S/fmu212?=
 =?iso-8859-2?Q?fxd1CLRBwLEb5lI9YJkBixYDDGz15RjPgX8wzK4mhZxYHrlP4KF3VPevYg?=
 =?iso-8859-2?Q?P1YViu8nvoBPsToErhCaDTMK9TPYx+joHpDkgCFgg/XL9tecp/iNaGO4Q5?=
 =?iso-8859-2?Q?+N+gBX4R+BTFE/6knaV3cu9L2DY/NB86iEjofsqcReCvuoIncXNjc/Tie0?=
 =?iso-8859-2?Q?YaGdjawDyN0zo/xGyC7+kxtezvz/9rU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c1c25b-6826-47dc-9c46-08df4a954b55
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:41:58.5317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vidmz6lVtEPnW82y9C5DBqSQGtuTijVEW+wef0g2KCzEu+TX9uAeyHK+hcpxQqKY/cvn+LzEK8anmldwcotchGr49HP0srYTy7rSWBqDHzS12cMvt4J31Am4IF0qDtzF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9838

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

We already have snd_soc_component_regmap_xxx() functions.
Let's standardize the function names.
	- snd_soc_component_{init/exit}_regmap()
	+ snd_soc_component_regmap_{init/exit}()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h |  6 ++++--
 sound/soc/soc-component.c     | 14 +++++++-------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 73d66c9766944..4e30a22a767e2 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -337,9 +337,9 @@ int snd_soc_component_regmap_val_bytes(struct snd_soc_c=
omponent *component);
 int snd_soc_component_regmap_cache_sync(struct snd_soc_component *componen=
t);
 void snd_soc_component_regmap_async_complete(struct snd_soc_component *com=
ponent);
 #ifdef CONFIG_REGMAP
-void snd_soc_component_init_regmap(struct snd_soc_component *component,
+void snd_soc_component_regmap_init(struct snd_soc_component *component,
 				   struct regmap *regmap);
-void snd_soc_component_exit_regmap(struct snd_soc_component *component);
+void snd_soc_component_regmap_exit(struct snd_soc_component *component);
 #endif
=20
 int snd_soc_component_fixup_controls(struct snd_soc_component *component);
@@ -445,6 +445,8 @@ void snd_soc_pcm_component_delay(struct snd_pcm_substre=
am *substream,
 				 snd_pcm_sframes_t *cpu_delay, snd_pcm_sframes_t *codec_delay);
=20
 /* REMOVE ME */
+#define snd_soc_component_init_regmap			snd_soc_component_regmap_init
+#define snd_soc_component_exit_regmap			snd_soc_component_regmap_exit
 #define snd_soc_component_cache_sync			snd_soc_component_regmap_cache_sync
 #define snd_soc_component_async_complete		snd_soc_component_regmap_async_c=
omplete
 #define snd_soc_lookup_component_nolocked		snd_soc_component_lookup_nolock
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index a6e280c798f3d..1f40caefee8f1 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -435,7 +435,7 @@ EXPORT_SYMBOL_GPL(snd_soc_component_regmap_async_comple=
te);
 #ifdef CONFIG_REGMAP
=20
 /**
- * snd_soc_component_init_regmap() - Initialize regmap instance for the
+ * snd_soc_component_regmap_init() - Initialize regmap instance for the
  *                                   component
  * @component: The component for which to initialize the regmap instance
  * @regmap: The regmap instance that should be used by the component
@@ -445,30 +445,30 @@ EXPORT_SYMBOL_GPL(snd_soc_component_regmap_async_comp=
lete);
  * yet ready when the component is registered. The function must also be c=
alled
  * before the first IO attempt of the component.
  */
-void snd_soc_component_init_regmap(struct snd_soc_component *component,
+void snd_soc_component_regmap_init(struct snd_soc_component *component,
 				   struct regmap *regmap)
 {
 	component->regmap =3D regmap;
 }
-EXPORT_SYMBOL_GPL(snd_soc_component_init_regmap);
+EXPORT_SYMBOL_GPL(snd_soc_component_regmap_init);
=20
 /**
- * snd_soc_component_exit_regmap() - De-initialize regmap instance for the
+ * snd_soc_component_regmap_exit() - De-initialize regmap instance for the
  *                                   component
  * @component: The component for which to de-initialize the regmap instanc=
e
  *
  * Calls regmap_exit() on the regmap instance associated to the component =
and
  * removes the regmap instance from the component.
  *
- * This function should only be used if snd_soc_component_init_regmap() wa=
s used
+ * This function should only be used if snd_soc_component_regmap_init() wa=
s used
  * to initialize the regmap instance.
  */
-void snd_soc_component_exit_regmap(struct snd_soc_component *component)
+void snd_soc_component_regmap_exit(struct snd_soc_component *component)
 {
 	regmap_exit(component->regmap);
 	component->regmap =3D NULL;
 }
-EXPORT_SYMBOL_GPL(snd_soc_component_exit_regmap);
+EXPORT_SYMBOL_GPL(snd_soc_component_regmap_exit);
=20
 #endif
=20
--=20
2.53.0

