Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011031.outbound.protection.outlook.com [40.107.74.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D627D309DCF
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415824; cv=fail; b=jS8xef6S9Mj073o0a4KH2qWYR/ndCIaxNEBUo0hiOiGFUHYCwMR/uizhcgypQ6Aq3YjY/fqzdwlRIrg6y2P3/FOCBlglYWMx9LYyVicEGtbMiT4sx08mIh3co+icBIaBdvAqcAwQxV3Dqrad16E0jnGRi84raQIbAuGS9mCQQpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415824; c=relaxed/simple;
	bh=lnRPrf8f1u06dgBdryFKA+gQZZfqzxm+yx4FfX4avGU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NvLB8UHtSirBSAE6g0unbVWqf+a7T/vQR2fXuINdZgyMuKzLlPa21peSy6YwTGUkMLCpsSw/Bg2SUrCTySezf/sj7pTnz+MzHt/63pqJUIDbiBFqH7B8FcLjc28d6kn5KRIMH1nLF2hdg7PefnmCk2IOfIUyBRXfNyqoJGDG8yY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nGdL5wWD; arc=fail smtp.client-ip=40.107.74.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nGdL5wWD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zIsENHdkMT3DKywMAVoH1ECPfgmNvBSVuwZygfK74p7hixysNINGdxfT34HQkjw3p2YvGkrKWVG2A2lVr1Sa//qFQtp2863t03b2pjNIdInWGnxgg8Y1HDY8dsTsbtstllVFRI0InQ326WOB+P0jtipZrVjPYIBy6uT9scHi4Ib3XL8Y3u6djjS++vioKq5MZ7i9V34lzBpifTwZcfEHqAGt8ThVFDw+QJ53jdlKuW9OYu3ZO5JV1VjulWkwucVmRHz40asV0a+T6PZlKTQo+ncbu5bWB7p8xl14Oj4B9e2GC58i9w1c0pFW7oipMP6iDfRsCmb2dTY+GgVZSLsg8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlYo9aS6JaBzT8XG95A9PieRFj/o5R5sg8HrBjr3TCo=;
 b=fyy22d0G99UrJRI+EnWixCD38hgEbT4Fbjfbb8fQXWBW9ChWn2t9pMAR0+KuBkXo8MwJdVlaM+uMohwem0+l28kq6S+b5VW2ijmPlA56kWnu2dLjH2XwSnJyaiueKWFqWIFWLAL8ZTdOcrza46FpnfpfGPuJC3vzyWpdbBB4m7jAToTF/QWt5dPCLph80W7U36Q1EUNNmIQ1otapIc3CTUhRSYqub+BR3EYcPkiccrtHiA8q0K36TMLjxl6DTwyF3/vU0eBX1Pi1OLd0yK2KeYbje7hDFnJHErAXAp4LbnmDWLCjTsKA8Mi52HlZVoYf05plrkGrccwacgPOGW1WlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlYo9aS6JaBzT8XG95A9PieRFj/o5R5sg8HrBjr3TCo=;
 b=nGdL5wWDsm18/PlXMTgH2H4da7P5oopN48abUSg0dK90ennsNQ7FuOjsghkDs/U/+8Xx595js1BQQ1+CNThAmhZivnmVdpPpxuSVIv5lGO327uqvE/XTIONa1CCgy/Wmgd3KorV/km8VvuZPxKErdeCJsw8Ab4G2eDzE81HSMH4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8810.jpnprd01.prod.outlook.com
 (2603:1096:604:17f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:23:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:23:40 +0000
Message-ID: <878qheqfg3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 066/139] ASoC: codecs: rt1015: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:23:40 +0000
X-ClientProxiedBy: TYCP286CA0278.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: b207b769-df8f-4dbf-9b61-08de0ad97425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4kVh4ZRqOmRu8M3WyYawlk5k1oxpOmWKZPiDrjA60VOMIQ0M6RveCOam2/Fx?=
 =?us-ascii?Q?RSzrddAT8JNSoXSC6/1BRXQ3Epu+J7gTR6/T7+mFnl2E1WwfR1DgXz6A7R5Q?=
 =?us-ascii?Q?bDqXWOYNLvxztA5c5ueLI0XG6pKay+5VonoL+t5hG5jLi3H4e2K4jizsK/oe?=
 =?us-ascii?Q?vYogqf+1aFiSxi7x941ladw6N9xhcPtImi2SiNSAnIS0aFe0amM8bYN+qkA/?=
 =?us-ascii?Q?EP9qyEeago9LDqUbc5+HskMMR02HeqrYTqnG1zYgqoO+yP0eANT/TnZJ/bli?=
 =?us-ascii?Q?UAYOFhyGzwPsl0Q2X71QlejmjUfKjyAbCWczedPIlEgUUPd3mcWtBjF5jVJp?=
 =?us-ascii?Q?gZj3lNhOnLliC9PiXt+Z+m8QJhTGVtUPRWjAMFQa5lYd60NzeOUmcYFM3iZR?=
 =?us-ascii?Q?NSB1nza+42Mx3+2ghhHi9qa7RQJZf5QtZ3UIkSbwSQ7O2ii68APOl4fDyLZ/?=
 =?us-ascii?Q?+H5V1rF/gApkvmkCdVULYD1ciL6FcRBh115Zl/x1MZtXh9tAQ6ZJglFjXSwN?=
 =?us-ascii?Q?pAdIJSyM5F2EZZFL7LfjQLEoVsKvvW5VkLrCzTjwyTYGXXdjAE5WXPrHchsB?=
 =?us-ascii?Q?oOSs2Sl7NAC6mEpgSLy7ZFauDDYY2/OUObEziqRYLt45WKqDj2VT2o2yzkWs?=
 =?us-ascii?Q?GtCuOaGOriv/mC8S1p7x/NpQ3/sPszvCRFTnLK5Y7t0zoaEDDtpqVhQQVLEU?=
 =?us-ascii?Q?h6bHosezQ6dLbMYr3bqQftuk58vGMkdRgTUF2u+WyKwZ7f9Jza30vKbhUW30?=
 =?us-ascii?Q?Kyh54leQIrYygy28PdtYX4JdCIF72/QJbc96p0gAvr91duJkpuPkJtmqS5of?=
 =?us-ascii?Q?RD0FztHZnzkua33fpOULKNrgENrP5nth+K25Ycsy/+tKLwlT8+c+LIBgOYER?=
 =?us-ascii?Q?yopyRjkHHdapIV+3AHGkii/jdmIp3MUf8yR/bLE9IynuTW1QD2MGMquSSwbM?=
 =?us-ascii?Q?HJZovLzBIIiJ2ldVjFnv/lql4YRN3eZkrObyivSkxK/JF+Xw5sJJq20xooUl?=
 =?us-ascii?Q?KrcfbUjE/XYecOTIPOf0u4WOAR3HCIPVis1jm6DJS7VOsZU/Q42Q4LtL5Q+n?=
 =?us-ascii?Q?a7rBUhXIp7BoV2aZ5Zig7/s6t1/b0qXZRXgEjhH9EJIw933nznxQgbT8ejIQ?=
 =?us-ascii?Q?J2T565axVFZNJr0luJg3L9GEUhqs0B8M5XVH9fIu+CeTva8UfAAVKIXIRa0s?=
 =?us-ascii?Q?/fKqUXFOBQldrPeshLxhx53PugC9L75HmXbbp6J7WRQUeZj3aZqUkTzarIX/?=
 =?us-ascii?Q?jrWS344kHndODuiUG6l0dcxI08N5cQVTdeqC7OXUNMTmhzfRALkqTho5v/4o?=
 =?us-ascii?Q?WIAMvUGc64bIKPKz5l+xHvJtiGzagk2N3RqO7R1EIQcZAaS4bFHbj8WT02A/?=
 =?us-ascii?Q?qq7YxDVb6AAFyysNFsg5+GiUl4paPHeKkYASn1uILMlkHQu2AiQgiT90IVnY?=
 =?us-ascii?Q?3RA3jwOqs26qOcgtnz5E9smsfjpk6GoVnD6COJ0Rct0knjXXct1n+DDPiEkY?=
 =?us-ascii?Q?7KGhDmkZLlOmeWYJAb2bA8mHw4/YS00Almij?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nx5hNrJmVXytYYeWnY2oD+RdAiCbYvEDBRhf4v8XIF7u73IC2a3bLZsNyTXK?=
 =?us-ascii?Q?eSVx5tvPvMLgeUXQMKqDQqmMBaE6c0IGWh5P7IOBFpKsL1NGZFcVwnX7bAaG?=
 =?us-ascii?Q?9e7z3v5QCGr/uuq5BKJl+VqanDBR6wLWBWHXP50lqc2mhxPgE9fG6Vq70b9N?=
 =?us-ascii?Q?PujXHQ77irwPuHc44ngGkcM9s5igumbx9NfRKpZ3Wp9KStMkGfaDvngg6xTM?=
 =?us-ascii?Q?buADqeYSxCOGpowKBdKB8ovArzlJ6yyipYTo78cDyeEhxIxG14/MbO4O8if1?=
 =?us-ascii?Q?SpSBlZKAc/E3aOGFhPbS5TVCJ1Qy7wlv6Z1HWp7MMIg1VcZkx5Bbv5gB4POT?=
 =?us-ascii?Q?7Jknzf7CHAbjzVyHeXETPR+tywEeFkIW+P1K8ksjUcG6xcmCqLXWG6bx3ycG?=
 =?us-ascii?Q?jeGIGrtIqItIDRPOdhPUBg7SLlOZATJ05GNpOIKoqK8OQjf850Y3DDBW5Rkq?=
 =?us-ascii?Q?IsSphtBPuLxeOmeKjkyFiili0CRDQm5RkVRokCZFXuCEmqoeT6LDmqU6sss+?=
 =?us-ascii?Q?f6f1b8snaknMhQRmlQe9C3S/V840UJjRATpU2ALTaRg9Sqpde2zd7g0ppfGs?=
 =?us-ascii?Q?yZzOHeHbUWRfDf9JYrSUbbDTyVHetru1ktyxaEkCLNHx5dw25KseMBlV2EtF?=
 =?us-ascii?Q?lGKxnw7ME53lxbkDLI4uZr2jvv19Q8JyUpo54d1mUQtRAUpd69w7U3CKUfFz?=
 =?us-ascii?Q?pw+BtfmGpt+Ifc8GIkoVkpkv93j8T63pZcYihg/hKXtjTrZGRvUnsiKQ2lA5?=
 =?us-ascii?Q?tqnY2mvjFoHUoRwLUZ34v4CbaBgDG58qdmc6aUIrS9DNhSKCpkUyusldiOr+?=
 =?us-ascii?Q?5RotW1azqyFiIdY3jumJNZYmOf1hCcRJbq/1wIh1KH0CNEiIwTi40SLS6CfC?=
 =?us-ascii?Q?W3OGh1//iyQYyB7sb137NMxmDrF/mM0BAwektU9a8cVtvKyCgY+IsjK5OOGI?=
 =?us-ascii?Q?jx5kElimsAD5dbL7rKL17RsW7hbXzp38Er3ia0RllV5nfK9gau9bvXFegUDc?=
 =?us-ascii?Q?N0PItFqbpCvTv546jSLDTaw+NJw8ORBQfifmehIIhqdU+8csW9m2h7ZaeHaB?=
 =?us-ascii?Q?8M2/qJsduQf15z1f3GWl6DomH3k9BAbgtd3yzb5T+8P5gyw4IG7s06zflCCl?=
 =?us-ascii?Q?tOTcJoh5I7D9fRCd6Mf5LK7r84xWowvhywY2IFpRAC4dG1QYTYHT1bKsteRl?=
 =?us-ascii?Q?q+kn3fCaO28LVs6aPhEYyYrdJptnTMjZH6Q9ZEn2bV+/dEyaFePJGEqbeiCS?=
 =?us-ascii?Q?Dn95mgw1Luk/nGZiiYEq+pJLRVFCWnW2/edrz4yPIo1c+1xul/rO2QSfGFOZ?=
 =?us-ascii?Q?AS1kMy2tK3Tw4DxJA9CAbt20UqZkxxMxrvwh1VqNWx+pF1cO7WDW34paTDBD?=
 =?us-ascii?Q?giTMJJ0gn5UB+CPiPFOrz73icU3ifez4XdslIGlAOGNbRgLUUCAtUpmtTrzX?=
 =?us-ascii?Q?JKgUHreCZ9XVBJ6inPFf8Qrr4BY8GGN9V15yue1vAnYVkvUBgO2V551pad6L?=
 =?us-ascii?Q?GsDJLaDUy32j6nI+W0A2bempmNRG8b3J1IjNFtQ8dfeo7yq19U3R5hRATHk4?=
 =?us-ascii?Q?ZiWsI2NMrjDbuqCp5TMdbgAXlh++nAAxFTVBfSiZ5dhADXR1tXXBbNdLmI8g?=
 =?us-ascii?Q?831dO+k9GZK0sJL6ONLMuqY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b207b769-df8f-4dbf-9b61-08de0ad97425
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:23:40.7181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ukzuBIpBjayRxA768W54TNslPIu9/y8M0ubp+RRbphdGP4nUPJlWKU83z4SJt44vSkWUocM5+meNSaCnXiNWy8grAiCtiV6cOmXbNkLQA4FwwRg8T52qnzOcdStOaSQj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8810

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt1015.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index 818b45226b728..033a196cb5c73 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -427,8 +427,7 @@ static SOC_ENUM_SINGLE_DECL(rt1015_boost_mode_enum, 0, 0,
 static int rt1015_boost_mode_get(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt1015_priv *rt1015 =
 		snd_soc_component_get_drvdata(component);
 
@@ -440,8 +439,7 @@ static int rt1015_boost_mode_get(struct snd_kcontrol *kcontrol,
 static int rt1015_boost_mode_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt1015_priv *rt1015 =
 		snd_soc_component_get_drvdata(component);
 	int boost_mode = ucontrol->value.integer.value[0];
@@ -481,8 +479,7 @@ static int rt1015_boost_mode_put(struct snd_kcontrol *kcontrol,
 static int rt1015_bypass_boost_get(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt1015_priv *rt1015 =
 		snd_soc_component_get_drvdata(component);
 
@@ -524,8 +521,7 @@ static void rt1015_calibrate(struct rt1015_priv *rt1015)
 static int rt1015_bypass_boost_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt1015_priv *rt1015 =
 		snd_soc_component_get_drvdata(component);
 
-- 
2.43.0

