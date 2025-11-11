Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011005.outbound.protection.outlook.com [40.107.74.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AF319F135
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820611; cv=fail; b=RKX+pWGzgmJkk0zRrViqUQVqnTH55wpTE6auunv+jNAoyerozLymbQ8HeaeVTRUtJ/e6jhFAQldlZErMPLyY6iYdFiXFI6RSbypStGk09GPvVCPJG3nAweZwx8J3DblsJUo2NqPOF90WZXBxikyKY0AcPoPRKCphSWz2JFFC9RY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820611; c=relaxed/simple;
	bh=KfaqTDgJhL8S+031WE7kR1s/nAo0joPb1cedZh7S8jw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BGEhiB6Di9CjIgbF81ugqHcWy+DD7GwMLInZTirkXE4/WtvxyadfLa2d8um+DZ9bWPHs3Z64trEQCu7cVfPeP8B7U5sDzPyVZwb6kACbTE+MgxD9kc1jUxNYsFecpclO/8AyuQpl4UPpEFgykNyvxGakS7tDwYWV5kQmGFtArBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AZbkfooY; arc=fail smtp.client-ip=40.107.74.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AZbkfooY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWNfX5nMa3ICj4d+WkMlB6YHQwJIJB49SqM0ZBHfQGMIk1dgoRGQEoenXU7ywqLEggg265OHvsoDXmQD5fNwkJyI8MvX1Jf71+xAnfFnS/0jnIbqyC6IvHDxIcTUXObDgEb+LKIwCrmuAHrW2qJwW7WPhzXgzia4XWbbXmIvT1/yN4QVJH2uk9zrpOxOVbmk0xd7u1rD6rxrIvbkXKgYcAUKHYnNZdbPiNatpgWWGn1PSp6/ZVZwWUnacdOCOL2iyimcCc6f5fW2xwbPvXCXF/YilueYi1WesL2YCzNlzUNb7hiy0RroEp8rZHXLw5Bd/FEIyew7B8A17IqqA4xnZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHm7XtVuqCDvgFqlj/mOsuPjwGpGcS/yngXt0Gnh+Ho=;
 b=FVLd+BCpcPnBOZH+RiaBwULZPQv8r3rsfbakVfVO3qIXcE1XjSa7j+CE/9s1y6jG/Ru3Uv8owmKIt4BXfrH2pTzUWaUFQx2STTmqthHk7StZ43lMtIWWmmuJQYJb5YU1oq86ejuPs6dwuQkY87X6rfg93MSy9TrTgPpFXweuw4WrLTzxVStrUuatKNOpjuxO4LfoFRLoPaduSAPSV8M2CYZu7S9NjULpsemBdY3ZlEkszxK9KC70QsGlv9Dsy1Ij/0RE1ukwL4vAHlIN/1R7+J/3W6bL3/sGh7LZgIUsmR0rpwCQEu2Ox0JjwSJHzERhy1ezuK6ktoTfyLZGzdGSSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHm7XtVuqCDvgFqlj/mOsuPjwGpGcS/yngXt0Gnh+Ho=;
 b=AZbkfooYfcoM7wO/Io8kK6WEl2udlBbOjkGvgxH1sOb7Qk8ssyAXIbdM8Nyumr+bLswZp37LykNOd8/Rigp8DgiSjvXsyrPKiPKYPWcCPbwnq2BIrHui8u/oXRLD7nvbSUyLBPxjR3dVRGARF3BCufexwpkASWx1XKWt481O4uA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB16404.jpnprd01.prod.outlook.com
 (2603:1096:604:2be::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:23:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:23:25 +0000
Message-ID: <871pm55sea.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 082/292] ASoC: codecs: max98373: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:23:25 +0000
X-ClientProxiedBy: TYCP286CA0144.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB16404:EE_
X-MS-Office365-Filtering-Correlation-Id: 5da0d3a3-2fd7-4d4b-55c0-08de20b887c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BVJytS0okHN1vBW5oZqIRAJ0fP9kNM6Wpt5CmibbI9o1gPX0E+HtJ4AqDZ4F?=
 =?us-ascii?Q?5/1pDS/uzjK0qKGruBuz78JhUFu3eXofTiCLlUxJhR+/Jlit1O2h8pWCR7mH?=
 =?us-ascii?Q?D63+EghsWwegfM39Jw+fz1oa+UQPBr7IfX/X+hx2/A/pF9sBAldCGhycnE4g?=
 =?us-ascii?Q?i5UpRNY7hFSzaY8pHUayHi1fFRXotc7MVk6ET2mRwvJKTN5j8w6Q3heTVzRY?=
 =?us-ascii?Q?V+ybidcmAEMoeeN3kW0hgmLNE1RuQQ00iT1bjzmaoZDm2qgixIIzhSRlkSkG?=
 =?us-ascii?Q?XqEZQTjCu3q8Drm6YSwyHqYMztseiNU+WVTRKhNc8XxzM+zph+v6wE0aq9r/?=
 =?us-ascii?Q?8Av1oIXzgIK65Mo/aC6dWr5OZh3MlbcWHnqOwzd8e7qKHcwtR7e/J/F1jf9h?=
 =?us-ascii?Q?hrVMjju/y2SqOpqACBZwsPmU9bc0WJvKi3w60JNcrpsaa4b+WCXzVXHipRLd?=
 =?us-ascii?Q?7cKReg1nOIBnatIVVyGdvOzBYhVl1N90gVScjBb6EeKas/8U0OJ3v8wJ+eQQ?=
 =?us-ascii?Q?wvM+QdbwW0u/vbC31U0F9dq044mqLcU0tKrd5LsF7T+5pNHkwl5pG0t4t0Tg?=
 =?us-ascii?Q?dYLARW+taddnZz3JBmB7qdjy3fuMFFKysHpI0Zy1o63QAeS+J8X8KWqgSRBh?=
 =?us-ascii?Q?phObegedu5exHSeAPecMlIRV4Ho7G3Ndp91WAenyiTBc9KcMhpY5VLe8b2cV?=
 =?us-ascii?Q?+3TTS9Ho9uPN7+qn+NABZin3bi67OJjCcSE2YdLRFAXSrmcSMzUgdF+2nEQ0?=
 =?us-ascii?Q?pAWEtq2cZGHt4xzwQpneqoa698+FK2lyiNfYFwe534+NWzvxKEXXuDBGKPTU?=
 =?us-ascii?Q?7CqCq1kY1bmqA2whNyAP5kDHyJLOAJPsIilWxV2eL0g4wXbyaOnSnD51P8a6?=
 =?us-ascii?Q?2cnSFEsCi9Xq5lvCsKNVc1+rtcQe3cC9x/o3QwT9ppvvKsl1R/GqoxK+rUYX?=
 =?us-ascii?Q?p0ET9bpRZx2yVM+0m3NhVYIQLvwioM4EhCGQbN+SOQvrpPJfDKK0mmNBCCRN?=
 =?us-ascii?Q?dmOieSyeEQoaIB97oNxMC0zJw62Eq+UnFOSC9dCPKmaP7crd5PerieNBCShr?=
 =?us-ascii?Q?S8CZZL/3ZBpRfwyzcEOykThLSg6nLhIZ6iOZlyBW7VGgqgLHYTU76wZKl5Wa?=
 =?us-ascii?Q?cdi/GuoY4WBcNNo01++Tmn9AYuZmZLj1N8H+n5x8JeAWX+Kqa4u/VqiToP7f?=
 =?us-ascii?Q?U7FUy+nxNoAzd+ubroLEUkFl13u72GWNl8ByiKTBfv4vUbip49SXyJhquatK?=
 =?us-ascii?Q?bzgRxGuTWqt/AuFIIzd2ibGvd7pXj1Keidy4geyjqf+FwUVElVVcdcgzxSgb?=
 =?us-ascii?Q?JstK/v8HxLQOZkYrdEhG2Nqnjc1HD2G5OcU2unpLhu/wQ7Pu5u5M1WnZMjUs?=
 =?us-ascii?Q?QR4Tx+Z2FqWYijOarlJDozS9pJwWY/X5mT1bJqdAQkAIFBVMz2tk/tN/gAiA?=
 =?us-ascii?Q?QAcAMEs4di8oThUhEztDHr1PZoWW6QclwWblmNwP/m0B5+AQIwd/zhkn0Jbb?=
 =?us-ascii?Q?i5Inq7HRAmUf7LhbIBXAPdZZWpsn7JGQSs5a?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qr7USf97YyUaLLQYQoInjwO40lFPVZ6Aqne5YE+SLn3dcoydUHv/xWuoSxnX?=
 =?us-ascii?Q?xufJq/CeIEG13q3+b6iIQutja4wIvdNBKUj7O+4+oYoOBvbkMRYJ9BiY7nc3?=
 =?us-ascii?Q?pcXopd2+tBqdM77kc8yxdEY3dQql6E2fuBxnJeClZq8zHdXsgbDbCxCfXFJt?=
 =?us-ascii?Q?wg0TXWRO9FCeGxLhAIEcGfEk5ZURheCRW8ouwuO+DCS5BfBjJVE57/i/SZl8?=
 =?us-ascii?Q?PchBaQhA0/DMbNYuJ80d49zb4+5TcuNtguuEoA7w+gefRC5B3/KDCx/LAmeS?=
 =?us-ascii?Q?xD6NE/hxMM5aKWwHcyH6zNdpTlkjcWM37zvuGSTZQJZW9u1rlPom9KZix1iX?=
 =?us-ascii?Q?OsyQ9rs69O8rA9cIGuG+JgvF6m2j1IJ+Ebn53TnZHH1+nc7g/UAJTP5NHr8Z?=
 =?us-ascii?Q?6jrG1/fpGnYBduqbIGfHcgnElCx7YtdGvsT389tFJ6qPkgvcjJ5F22bDFOXJ?=
 =?us-ascii?Q?p/JqPODGUHG29Kgu6t5IYrKooPiiWGlFLtxoi/0R+4OmoNXl6qWsLLfT3TZZ?=
 =?us-ascii?Q?KEbANtHgJD37VFbppwbmUrr0A8T8jH+xM0gdedq87ANmkX2vBurU5wETury4?=
 =?us-ascii?Q?Jum1xiBYbgyPiyuyP9gSVjLTAe82jp7YklKntU9PrcmITZO6fnj6he4t7sGo?=
 =?us-ascii?Q?C5lT9yF3xTkVpO1S6/C2ht6mzaSHETAKGJ+ceTw/+pnTfGPYDoAYcQWu/awU?=
 =?us-ascii?Q?hp6y2specOCNPUVt2e5WN9CXlIVLNpPPe6ev/+Xt7PwDX2J4a5QdVm+iq+92?=
 =?us-ascii?Q?kkAkkVpbLVNcufKdfi9/uI8jpfZLzfUoFGdXRELdD7Cd9Xgf6TXFb4FF2hq2?=
 =?us-ascii?Q?D89QViK1yEc77+z/RaKNaix5ti/tQPP7mB8x42gQQxpK0A8m8To3dZL61zB6?=
 =?us-ascii?Q?Oe2B6bH3QBEP+n7lZfFj5lS4QV3sxjzinedjRF15nYhV6XKi7+vNnJ98mdXm?=
 =?us-ascii?Q?gNsUAM/1mSa5A+buLPjiUdBrQO9CLvrhYDVjTKiEG3wxwWVeBqsAuIRmFXCq?=
 =?us-ascii?Q?DQ07k6I2BUXItyYWY85u2ysjuBceIdVr04zYSbYf3Q1S08kJAGqUp2UddHxq?=
 =?us-ascii?Q?PaimdgCeD3PUFFOG+z85Rdae6lbPERqDkhkrVz1VBEcWJjomKu4uAtWWKkwo?=
 =?us-ascii?Q?n/oTSBqfqRuwO5cgqzV/Y7PEbmwzOWSj9Qtknh61CYxbLdrqvghI03HvJSFJ?=
 =?us-ascii?Q?NI3S967RjVbouiEVFxcPnxcoekckx8omBJ0VYl1qT1BgahI+tfN7ELAT6Gcx?=
 =?us-ascii?Q?VMJu+njyI/6kiMbYfa6AiZ+STTk3qLYXsKGEP224Ws4vNJEW3wgvoRZJC6zT?=
 =?us-ascii?Q?dC7hZsqdReaWc3hc4qqJNyhAvAKpyVkeJZYqJP7DHKnnAfBBmBxXKwJKT4K1?=
 =?us-ascii?Q?K8ED+7Kf/fUaKTrITu7C768vNoBIT3SnTT/WxotAi9XNNBciiGeLxHYk8wSR?=
 =?us-ascii?Q?tfHEz9labxF+3wR5DLFgpO24TdFMOn8x/VbzT7SwOBXNsEJnw4EbEEN3ZrgW?=
 =?us-ascii?Q?KE8B/GEXpejEUoHcbTTSgYK9QXngxcTrfsp9XPaNjOxzR4as7S4w/6HjGeA6?=
 =?us-ascii?Q?/1Ul3I2PSFX/f1KYNDgoOCFj5whYJLgpCMHLcu+zsE8LCDsexfiqtEKN8a7r?=
 =?us-ascii?Q?JfchZd2vkSR/dWfponw7B8k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da0d3a3-2fd7-4d4b-55c0-08de20b887c6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:23:25.8398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KWVvjxQ61naq0MrgXGIBM9nvgkrEEkfFfS5L7I/onea0/gcIxRifFZc6vyxVLxhqUrvyToWa//z4IhATW+oEYu82/L6jnFqi0QYS0QgF4zyDgbfpSTEgLQz3ZHpLEBkB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16404

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
 sound/soc/codecs/max98373.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98373.c b/sound/soc/codecs/max98373.c
index 33eb4576da234..cfb95fd4f85ec 100644
--- a/sound/soc/codecs/max98373.c
+++ b/sound/soc/codecs/max98373.c
@@ -174,12 +174,13 @@ static int max98373_feedback_get(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
 	struct max98373_priv *max98373 = snd_soc_component_get_drvdata(component);
 	int i;
 
-	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+	if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 		/*
 		 * Register values will be cached before suspend. The cached value
 		 * will be a valid value and userspace will happy with that.
-- 
2.43.0

