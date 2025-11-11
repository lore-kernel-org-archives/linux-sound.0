Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011053.outbound.protection.outlook.com [40.107.74.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F3622A4F6
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821282; cv=fail; b=WLwbfaEtn540ExTEko25/y/xsx7inn2jsItIKOyWhYZs4rGmUnOSKZMTxLNApbn6BvoyNJhxj38Eu0AsnVCnfKlQbB4Ucm0CDrXGJ1VvBY1F7kVoeHEub3RGMCp3lpLIhhPyQGqtuKm/2w+rHhsrBqsd1UFoqgB1Idgy3dqJy94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821282; c=relaxed/simple;
	bh=KVWwi+2lTzFNsDjo2LgPQtku+erq4RvYCQp1Th8OPlU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HLVgRzJtfasQwtZ8Zz7IWZ1OPaGuGbY+UkHweU3vTCw4tQEnJ17m9cF6Xd0m/wy/ruENb7+D+iNeRp59PsU7k2grlm45DnDytCHqZdBc+xWiWPqR70oZRSKDWwJBSZWpzsN87xbg3pvMQ5BqzNhpJwU14+qFlJz91ZuVL2pvg4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JHcE7Tq4; arc=fail smtp.client-ip=40.107.74.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JHcE7Tq4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LXgo55gHSkC7VqNu3PX1lHSpjPmWj1cHNzWvEOlgYa+xw1TdKC2o/ZNMjsYiDl/htWmnRYf6ry5GxlUgEXy8rrhp3z08Gyjt/ugrKe02ZZ+N8H4JHAhk6/iI7Yr3juzi6sL63UJy7hZTKQwGMcaX1I1O3WDTYEKx0YfxaX6TjptwUqudBPmQ0TAhkpJRHqTLHL8W1GeIKv0fvvFuNeURPy2PbvULSlcOAcdoWVgs87towk82pIBFL287RZ1WE37569cMpUR9TjDHeuzgzfZh0Vu7P9iO0TMdcj78p2g/n0fkRXr25w6R8kKtf3yzZCmGamOYShneLDJ5x7Z0XDl6rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQ2q9+TfYB963toQiE034JoQpgGuTaSjdDEnnYbKOA8=;
 b=iEQsxcMcRd5ye12uvUffhpHZBzb7gYStBv31sbyaeubzosNqu32DzsIQZg26td01HPISPZNxEqi6kwOKpzBPj2aN48EqX1BbZ7GHVCyqY9gR+5y6TZ83/V+IVrNAqA0LYAxx2tbmy1x7eojn/FD9mTBZxMRnvvt6incf9mU+unnlBkGaBDWwdEbdkBzgzY7amdCaFGDLlxd77h6bnLUUDjAX/ds7f1ow6WDFI0Ev4HDMTAl3tf42Bo8ojMFWBlqvXLMryLQTL2a06IWhlxAGpP4YTAj5a3kn9s0bvipEdIDeqwQQjXlvKFgO0IRbzoX4a2jjgIPOpVdZqYP45/L+Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQ2q9+TfYB963toQiE034JoQpgGuTaSjdDEnnYbKOA8=;
 b=JHcE7Tq471HwQoO5Pl0K4ff3U1gj3zeft0EUHZx5IhOXqkC9v5tn1mS8t7XYBEywAGcgCRHwnEGyg4/I32JY6pMnGnglxv4lycogRQ2R2LymcSv+B4qysjJb1FKcbo7NRQ0eLq4K+Tg7ktHB7mpRWpLmzZidGstWwL9PYaZKl2o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12531.jpnprd01.prod.outlook.com
 (2603:1096:405:19c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Tue, 11 Nov
 2025 00:34:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:34:38 +0000
Message-ID: <87fralv23l.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 247/292] ASoC: samsung: aries_wm8994: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:34:38 +0000
X-ClientProxiedBy: TY4P286CA0099.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12531:EE_
X-MS-Office365-Filtering-Correlation-Id: 0be95e1b-7cb9-4db6-f3d0-08de20ba18c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SBb2LSdGjuYY03Cu5iEuMCt+D8M5J5dogY1II7fTb2basV8bOhUPeDWQSlw0?=
 =?us-ascii?Q?OVL1k7KoBXCnOFeDYlO+BgICuwaP8zQ9BJMTHcmfp5MPuHal+y+df12S+FPD?=
 =?us-ascii?Q?5yVdm/Uzx3vlwwwu39qMy/q8Zc+z9nV2+D7S3dtb5F5X4x2rSLaoPwYqjdiq?=
 =?us-ascii?Q?q1Bv856C6rgN7y9z2nT5Qub7Jtdogn5J0rq8OCFXke00voPe9vozM4Swzowh?=
 =?us-ascii?Q?t6KDJLHHSAombfEiibcMugSONYe+iW4LjcsnoUdkEtSzeVE1FISIwrRI0Nmo?=
 =?us-ascii?Q?S3HFMWa0tlmaJUoAwjlIk2RwDbVZHqNeJAejE1aKwoTmJ18UZS1gi6MKVfo9?=
 =?us-ascii?Q?nM4ykD+yoLvCEjebOfmdLZCONWkZR3obYE7SO/38qI8+a7PIIzWNgBu97sLZ?=
 =?us-ascii?Q?h+FmLtn0PQyudDQ4LUBPcpWAiXpf/gqCT2q8gydFXc94v/EaXraLmgY3fi00?=
 =?us-ascii?Q?EzBdWlE9Y6h6bkXrJ5kZKJvS2QLOuOhaaE3n5jRm73kFf7bO2QL3ps0j8Z8E?=
 =?us-ascii?Q?tou8TMzWvD8vUMAT2BB3yYOdHCwj5a/m0Rho/9E+KqZZ+J+hz1zrv2apNr/o?=
 =?us-ascii?Q?BX84RQHaYkEPfL3z/IfA5SsjU59gB9dooX74F9193OOqDx11NJkSZS8alQN0?=
 =?us-ascii?Q?Rs4JlpYPbjZ3c8CnIp0CuVDBhaRyiLXSn5K4YdLZcIRSa+kUiCnefByVXGKu?=
 =?us-ascii?Q?x0sexcYfR9O1yzh+NsXkyw+rra+K+vBQWywBqT3pvQL7V5ClvWI6IB3A3jk4?=
 =?us-ascii?Q?1UYJzEmFmLQL3zq9ZgWfWaSKyUK1MoB0KfWKTcD3YRlf8u96nO7QLDBqyQcs?=
 =?us-ascii?Q?/O8T13dCq6JvOW9Bwp5owA/tAm3Wd+reJG2UtBANdCWZeUgCvWDfO0E38/+Z?=
 =?us-ascii?Q?kg1/dU84yl3d1kEmxpPF+uGK3ab1I+44GbxIO9qEWiGn4TWzmDKVWTlokELh?=
 =?us-ascii?Q?iC9eaP5g4RbFQ5g4iyXsJGNo9gBn809kPxTjejBHpk8pfJ9c7fVGd7v6gvLe?=
 =?us-ascii?Q?86Wsw9liZI+Gr9lR34kCnTUktz1Hb57Vdbsmxg5WZR1NpDj/rU6c9pQtLUjW?=
 =?us-ascii?Q?BMPwgDIf/oxKHASRJfd+OkZZe8lBks88xmVi2cLKg0fZrDtyxTydjdFopa0+?=
 =?us-ascii?Q?Sw9o11H9ieOtJL5vnmCdmHEVQ4JwQPlllv7R94f5x8kAPUDdix7JbgpHfZgK?=
 =?us-ascii?Q?oLu8FhQpDbOh8kBZDTTi8tq8gyJIcutISlshaVRd2fhJR4QC0fNb86nD0TTb?=
 =?us-ascii?Q?hK2OZJvyVYLMBODybarqu99MAe/yYZy6SrDiOwXs22FUs0uINl/Ur8CICrVC?=
 =?us-ascii?Q?HDWCGhow4KhwagBKcylleyt+V1zCXGz/qhMKgwNeRzuKoQWTP7hmG3cKyX7Z?=
 =?us-ascii?Q?7lE58Tti/RILcf1eJuE4CXcXUzRW4mDhomgFuzXgWoJVnTJ2pm2IC+ttvZF/?=
 =?us-ascii?Q?MhBRyWSDRb1VT49U28HJnsWHznqhPTJtJ/e835xR5MbKBJKOeoyqmOAGS4Qs?=
 =?us-ascii?Q?MGT60mH6tYCGF5+eyeUm7ajNFzRK7aUfylI0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?knmbUrgUyEHxvPuuUNj51ccQlfGBWv44VkmorCz+erj0zaG2MhIyTzCuSljY?=
 =?us-ascii?Q?b5IF+uJ8yIzSsTag0Q/tYxsrtjfvWGDHmbeynW99ZOUt7cA89PtJ4UvrG2T7?=
 =?us-ascii?Q?JDSrv5GSarUYoOhiNIA5bRjIHSw8iinJGz3rUFuGEOk5qAiNu7mTbWsyPVYt?=
 =?us-ascii?Q?WAzBFVJu1iJkEcRH35mx8wclKBiFo00l0g2NdTtf7Qsnk9fXhrG1IyFUDv+P?=
 =?us-ascii?Q?xlTpeI9+qZgvIvzx3DqHJ6PO/kKEatIZDI2krEtUp+Q4j3y1rUOxlI8slh2w?=
 =?us-ascii?Q?WxcV7TKuePHcADFbdQKoD62SrGQtVqvQDHAUPP1WFpgi67gQs/SPLvZrV2kH?=
 =?us-ascii?Q?zRT3Twl+ReB5W3HNKy1JJ1xBBXbFgmDegPxisOy5A3FLCfvd2c3X8BlUKVmh?=
 =?us-ascii?Q?5etoqMI+tTG11hoaetB+FCM1SplvgfrlYUwxItpsme3UbC/U0MuRvGuVLFnG?=
 =?us-ascii?Q?lvknxHwoF8seFdkTRpwZgkuFPHsoe7TsY57Unuf24g535rIdY8H7AsRo7OA3?=
 =?us-ascii?Q?V2LzJQi5ChR39/WgVtS5pAe7JUlwtysNETmzK3KNBNRCUAGUhmmxYcXbZ0EI?=
 =?us-ascii?Q?f2tiFY3X+mNpw3ao2GIyuyD/ZmkaOqlN+14DpqnqivseOCu2ZMf3pSUL7hL/?=
 =?us-ascii?Q?1RZ5eAo8fCSuIMOpZ9TXjWDQMukMNGAjydJaDkozY4ny7QddtrlGZVo1++IH?=
 =?us-ascii?Q?x9fFJa15E6VIzB+3CWa+KOi2WNPue9nQFMgoH1iv2TKKqiJHN6ssXPcpm8hY?=
 =?us-ascii?Q?jEiZ+6an9x+XXzeaSyDWVbOYE1TmdiLE5ykrQIb7jzncydXja6NzDUqKQbQM?=
 =?us-ascii?Q?rdfzGCK8HF8Gc3x+XsrePVq5jR+RfVO1/yGuURp2xIEmHypdpe7cIax8NnqZ?=
 =?us-ascii?Q?u0O5nbh3AmBg7jJashkW552wkzBc6hb6X4KNbrL8lQDbonRls3urFelhNwKk?=
 =?us-ascii?Q?Nfky3ljPtnZMpgd5xaLV/4jRn8liWD7LvsQx+/fP71e/8GtUOXscJcRChYQ3?=
 =?us-ascii?Q?ECViIzF6ZWjoflFpX6i7mOONZbmGtXYNfZuHVvsYr+MMAuV+ZbArfDJwOrHI?=
 =?us-ascii?Q?Nky9mIjR9GyWss0coyDuNHCt9JI4ydv11IqQt0louOeeuGQdHLwhcj0K4/5j?=
 =?us-ascii?Q?fFHE4e6JNy0t9q2OZliGg7W2LTuVoWubQiy8zYghgOFv7xUqpMkJMP0fj7Vd?=
 =?us-ascii?Q?YekDWwcNWocHR6MiRFwChL+8hx3vh5xE/ZxCR8eRtNlLTLEF0p2Xj9K+cksq?=
 =?us-ascii?Q?fNwbyMJuJmpbn8VJMff4jRZbsxpg5ZxJULPApxyb7GzIOwAV+XOSqPS4p79o?=
 =?us-ascii?Q?oRvO9+Y3dm+3zAssnjmg5tv+6Lk9IvNcqxv/c5u1iEFiXtb13SyuXsKC6UH/?=
 =?us-ascii?Q?SvLfBcdshSFrtk/SgnLrbLfn0fZMu4Oly8HLZmJli6CM5qwsRNH+mOSBdPGL?=
 =?us-ascii?Q?6yThFkwHvdyvmP0Y+kV2jjxYhnbHZXKEORNZ2OidroDZN6nurQQqU/IJ2u/g?=
 =?us-ascii?Q?E1T7Ve311DZ9cyaamXNMJ6lQN0jj+OaTWf6No/dlIUXabHxWNQqdiDffPYDE?=
 =?us-ascii?Q?Ji+RSLeNA2KtE/NKh0wVBowUu9yefuWFuro2ZANOZ5SKGDBYHRMn0c1SXyhl?=
 =?us-ascii?Q?76G7LscmgKVVphi+W+uVRRE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be95e1b-7cb9-4db6-f3d0-08de20ba18c3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:34:38.5797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WToaGuSUvsPl7kjhxiFJ/BPE5KAOOgksZ5hdN7FDIxjpFCDRsqDXL9zOCJ6I87cG4Ir0lDjGgvkqpttK4eQ/ItUbdWdT3oNuYjUnfRwjVuwiPFm1rUD3km0hzwswtnam
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12531

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/aries_wm8994.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
index 3723329b266dd..48ccc1d1854bc 100644
--- a/sound/soc/samsung/aries_wm8994.c
+++ b/sound/soc/samsung/aries_wm8994.c
@@ -159,7 +159,7 @@ static struct snd_soc_jack_gpio headset_button_gpio[] = {
 static int aries_spk_cfg(struct snd_soc_dapm_widget *w,
 			struct snd_kcontrol *kcontrol, int event)
 {
-	struct snd_soc_card *card = w->dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_component *component;
 	int ret = 0;
@@ -194,7 +194,7 @@ static int aries_spk_cfg(struct snd_soc_dapm_widget *w,
 static int aries_main_bias(struct snd_soc_dapm_widget *w,
 			  struct snd_kcontrol *kcontrol, int event)
 {
-	struct snd_soc_card *card = w->dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
 	struct aries_wm8994_data *priv = snd_soc_card_get_drvdata(card);
 	int ret = 0;
 
@@ -213,7 +213,7 @@ static int aries_main_bias(struct snd_soc_dapm_widget *w,
 static int aries_headset_bias(struct snd_soc_dapm_widget *w,
 			  struct snd_kcontrol *kcontrol, int event)
 {
-	struct snd_soc_card *card = w->dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
 	struct aries_wm8994_data *priv = snd_soc_card_get_drvdata(card);
 	int ret = 0;
 
-- 
2.43.0

