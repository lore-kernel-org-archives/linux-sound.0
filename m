Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7A4145B27
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820455; cv=fail; b=U9sFJVPWB7NTzNFZmVELZbHs+7xxK/21xvgerqYKuh3Jtz0K8Wcvij+THKpQwLiC5vqivFd+iVS9fQFswqXkKWOAYDRr8zcUfp9jDqSiMJ8Ap5foNiPFU3M71obddUAw9SxhfBeAXlLg9O3kiOqH/8uxDJUOahNQ0+g5Sw0FllY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820455; c=relaxed/simple;
	bh=IEemx/tpx/T93IrBWkT4FOTzoc8AnuIPrsOckPT6p6A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RR0lrOlYlCPxpHd14W8JWTdD5Ocvxq/H363+nq1jskHjZuFkWdHONP+tFybVyx4OHyCEsIjCOvDagnGQNaAwyZyLP0qdHHxUH19aF/rk43XuyyzIZ61/TqMAoahvxmmvyTYnGc6P9eXwvdLZOwBmEA2pHERCbgR2Jeyaigp1W08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PDC6ihdo; arc=fail smtp.client-ip=52.101.125.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PDC6ihdo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVA1yUoO4tOJPhX95oTD4A/jaLtguTSb16GEIipA1GjCwcHUv6oh/ui9IUEP2ZIiUoOvDufToMobCwTW3ilL4e20LyGIZRnQYoMWt9ZZPtGMoa28F7lQ6sT4zUwyyKLtYcGr+IrY0p1ltXLPfd14cxIlK04ezr+4qAQEiPTpUlMnwYtiq4FifnrVvoB/2RE43YyIbQN2nxqyQfWz2Eaa/rJL3or3D+h3Fm32lBqBQ6AiY+5ZrHoOrZo4CQmVNUNznA/OMgwGnp8jfNDGwFn5tCMv4vhJq0Xz7mY18FiP48Pxauv9kP+H2MCIH52h5E/o9nv6EfX6pmHBAKiu84vw4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rISXcbItqZG9d3HxAnToqLjJiYDLBmFNOwNywefpfC4=;
 b=s/15pdCwoPE0M1sr6CH//TXMtdkwgjKBpx4BzNajEbtRpaNwt5k2Yrx/Tze9mxurajfyY8/CpmJl1W+tIMSntLw8FWeKKfyoLRGENWRQdV+60MHmnv2D+5OuJG1GLydgJ9hiZmjo3brj4d9xaF2fO05dYnATlDuMZhatwzgjezD6atv/42AaM3Q1CgL+5YhnhwtXQdT6QkavmyO5XApVJXPyIjDaXG4Lj+vv5RnMnWKCt001ebfFupcaBioDB8VkCqmX23E7SXOXheqUv8SqLFK/LIEtf9jKR4fQX2UQJRezRlMm6Kxe50H2tpFPX/HBcqpcUlKMLmlcsmxw5J+O3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rISXcbItqZG9d3HxAnToqLjJiYDLBmFNOwNywefpfC4=;
 b=PDC6ihdopAoGRebuF44rzViAAhUdj22ZyQ0/uZVR84Nf6pLrviBKtCv0JFGFtypr8kpTIdyOCWs+7f1cd1KGhf5vGpTiw4MllV+sySme5c715oz7qDAp6EJ/vV+HdVEeSGIpIgZEwzw9wMZzU55OL5BFjNz54M6QOIOgPbt1vrQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6994.jpnprd01.prod.outlook.com
 (2603:1096:400:bd::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:20:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:20:51 +0000
Message-ID: <87pl9p7730.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 040/292] ASoC: codecs: cs42l56: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:20:51 +0000
X-ClientProxiedBy: TYCP286CA0174.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: f8c6f228-8344-4329-55cc-08de20b82bc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DJ3UKta/7MR6vt2gMIOGAp27cwehvk2mxv7kicHgeDpwtb6zB74wvWJlZttw?=
 =?us-ascii?Q?Ho1fNWiQz9/nAugCS9j7NZwI6GTWVRIHmYPAf1YRttyJe8DcFpNOqW3GeYts?=
 =?us-ascii?Q?B891FTgmDsKsx4kym5ld91vH1C5laQS5Ean24qP/kd5VwiNrfeIdYyeOkxEA?=
 =?us-ascii?Q?eiwItxsK2XygKxrkvx/m9i0Cv9i4RdLMfLqVzuTEt9qPCXXmaDV/kGh9TF8j?=
 =?us-ascii?Q?l/lsGb7MRNZQEKjoflxWIxLPIHLUm6QxFlDs30uaBgUdVPEGzKtVvi9/1HjP?=
 =?us-ascii?Q?uz0OLsYWd7Or080VF1AAw1mJgh4cFlenBkgcKRQRowPu+hlxUTeQkLo/8gjk?=
 =?us-ascii?Q?hTq5HE0QJ6zErqUqvwCSQQQTwnOHjqriGDcG2XnkavJR6a1zFJ8uYt7PxdRq?=
 =?us-ascii?Q?SoAvRmgKbp8uz0NthWBEtdSZ/Wm2swuGLI9SrXFyD1bfvbEoLN3ma4GsrOW/?=
 =?us-ascii?Q?cKlKn/pJmQ6FR0P2yLJdLBqt/GlwGh1qswUbTG7yWmRQF88fH3+UHtOkm58k?=
 =?us-ascii?Q?YR5Y4mtHMGClOX0JxmiIFMz9F+sc5VWdi6YJdUYGuNJY8Zi+aFpXq9M4R1F1?=
 =?us-ascii?Q?XuxTcfVjVYFIuuxOPNvX7THeXiphaDJDkXfqGDM20e+RLVFrpeyBPoWR4qYQ?=
 =?us-ascii?Q?Kpj44hqCfUP+ontTp+DPROGVv2Ix9sZKIB6KDrcD9jcxg8zQ7OvQH+i0GNXS?=
 =?us-ascii?Q?zafWF/fQHcNYVMDlFfR7uL6iZbWZuBSgc6mz7o01MhPsApRm3Az9mXE/igY7?=
 =?us-ascii?Q?WMIYv6u4Y82Aved2q1xI2ue5FjCMDXdGOX2ijwTOOAgJDX0Z/pSASLFDA8w+?=
 =?us-ascii?Q?+8plFg3+xVg1iHaZbW6eI0vgXyJlG72eDMwGwX/ewX8bBYkV7QbRfJBeMupk?=
 =?us-ascii?Q?BrcA0fC7DKMJ+XAuIIV0As7A02VKHFIPgIDIJh23/03q9LOcN74zoCgEfSUk?=
 =?us-ascii?Q?kHMYC9sj7NWqkOQHf9AA5TxvEFaP7+LzjZmwHYqHObLKSzPl6CHNCYc+7iKJ?=
 =?us-ascii?Q?Z6AKFe0qECRjchn5xcy0+41l6B85hRPeBdBvVE0CW/dquHvr+zlAHZIRJPgH?=
 =?us-ascii?Q?jBqRQGLN7+dIANyrR3mAafEHVjD5UHX8E/Xfz+/c1tFxO9CP8FDhSNzKcg+o?=
 =?us-ascii?Q?/sPsKbkxosR/FKRjAhONTS7215Xgukzg1kdOrlDfqAkaKajvodyYl0ZJFSpA?=
 =?us-ascii?Q?zTuk0eavYHroVrdLwIQRRHLOx8W8L7/0G3E8gzQ0/MUdCdoHWJM09sDIxZo/?=
 =?us-ascii?Q?wZof1oyorqVCCxsTYfPgM/NrInc2W+0AFfiL2TUlwl0BYGuOlud9K7okd0DK?=
 =?us-ascii?Q?0pOyQAXx50D9HYNGP5MHFu06HmQw0AEiGh56Dc6odaa95Ju1NIRnU5b50NoB?=
 =?us-ascii?Q?MbLW3V3/GacXRDZRF7hOWre+ETmpzF+pwXAjgdW5GcQgF8Uvj8WHwSC2fQcF?=
 =?us-ascii?Q?KSmoX1OMZ6kdKmuF7v/WKiO8k8ecMnRQ2YHneejj54sHID7RYJ9Tz0FFbFGB?=
 =?us-ascii?Q?0p7qNamQ8hCb83NikGTXRbfPn/n+h4CzizFw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xWl4nkBPecrQWKaHuF7YN1Nt9pcd+7+fuPlmBcuzQ6QRWxk3D4W38pT5Xxcm?=
 =?us-ascii?Q?+iq+RmzhxpN/eTSqwbtNHODaNtPeuU1Wteo85PzlM08WWARmpYXVAEq4PABl?=
 =?us-ascii?Q?0CWl0PYz2gJuco1l3BJ1yP9Hcd3U98KHOybdeKImE3t0Y4GXOkm7lHsdtkoe?=
 =?us-ascii?Q?wLcYy5GxyoLlmpvxwj/VuVlWDghNMzfRz2TjZrvUvg25VO1vWR3HvHITZM+f?=
 =?us-ascii?Q?WT/gkR6tC+IYXS/EoSCl90kHb2ZA9+23zVp4557k5sGoZ1t00260MBARhwTi?=
 =?us-ascii?Q?XeMMKjuZtyl4THUg5WPtXvDIWCrycarAHZgPeuw4dcMILiuFsbMKubkRxS13?=
 =?us-ascii?Q?IKCwdd0hp+NvcvjfPaYYttfSN+kISAKUjNOdXVadpDUIeECeM/6B4DXahhKC?=
 =?us-ascii?Q?4BsBBupJ43/Lcnf82A0ivZEf2OiUcLURGsv3tUOQVE5//Cv7CXakU87tOU/i?=
 =?us-ascii?Q?OfDfBJ/QO7O2bVC4cxJBLr66uQSXUHvsooHFwNpECYZ9hA+gQ8EiUW/gFbkY?=
 =?us-ascii?Q?mMK7MwcQlQ9u9hDlk6KfOjJ0nho3/uHz5Y/7B0NMQD3zv3H5mEiUP9nGg/tK?=
 =?us-ascii?Q?D9rb9uK6TBMxYoGjWf1wwA1DSyHg4B2lqC+3Kp0cQW/qHOPXdMwllSnkIqd5?=
 =?us-ascii?Q?Pi1AqysqWmhw6Q6dnnwgcftDo748Qu081QcRmwFLnXuqgvrdFe3qkb5DfmNI?=
 =?us-ascii?Q?Io1VLi3jcfoMuQ089/JLrh1AMWjbaALQUQziqZ9M6++/SjHoOogcRjMDNF49?=
 =?us-ascii?Q?8yae8kQ1+A5sI0IsammLNiRmo7cgDr/DgO25yMFbBJUAvNTbr+6zEhdxa14M?=
 =?us-ascii?Q?yPQ8yLR5ElaKeU219OeY4EmlI0zOTyAVUcYtzvsR8ifayn4+WHop+molTz3L?=
 =?us-ascii?Q?1TZxMHDsSU10FZftqEyd53T39xI04KMmIuq5gdFqYvV+ws4/HWqqqiVhJCMD?=
 =?us-ascii?Q?H5f8hWQ6TxzyEP2uwbayXaeDBVSv3Q4mpIHdiRjkKEPxdyV2DG54uIc8XQao?=
 =?us-ascii?Q?M622u7dRrBqvI5mOVhnAL8sr4dikdpiKMbmvVF4qj15+vxhAVZlSrWa0t3bN?=
 =?us-ascii?Q?YKqgAqdIurfz1QbZxGpUSsilRieottFgAlCiK29y9zU8+2l4E+o6Isg68C82?=
 =?us-ascii?Q?wvyUirzriUwj1v2Pl0i0iGsjCbLQ/B9Ud1hThhfvxR9sHEzVB0uXR+3c7IeV?=
 =?us-ascii?Q?mfVC5xKKK4ns8KqeSwssnLdQRU5DObW4wBIsli0fMNBCSdRsNh/jXqDOvlIZ?=
 =?us-ascii?Q?ncFuTqIA4p1YJfgCJI+gjy4CNbMxsn4QakCMrCJ75Gf18yuDFpe6d5lSScm/?=
 =?us-ascii?Q?L0x/AjEzQQebo4kWpnbChstR/TFbnraDlBAg8MwZZFMjfTksf+LRkEtUZclp?=
 =?us-ascii?Q?9sjCnOThduINbt9uEM23e2hy73KOz/3V09Ac3Yv3ey1RX+ZHu2nHVOCbl5Gu?=
 =?us-ascii?Q?ub9vHyvTBTIsZkRshFF5Wa6/3naSIk7sxtraTTC7xDWwuBWpMiHeVG1JVEVG?=
 =?us-ascii?Q?QpML1i2oaX38PkxiF4mVb54Uw2Z8dPdKnv7tv3hDM8anNXgadrJJEpru5uPk?=
 =?us-ascii?Q?WGczzOtAhX7dW8PYZUsBzFy/Z2ATULM+7o6BZXWiagewL/nx+qei3nRQwyyg?=
 =?us-ascii?Q?lwAILGZM2oek3Z0SLuMQl5g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c6f228-8344-4329-55cc-08de20b82bc9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:20:51.5178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ai5NZFqT2E2UYmlRqiHh29WVCs3d14gWSQ39RE60E2fWWA+6GeT3+k3npCct78OUXFTFhZ27ea2F0FnJP4OB2G+0iuhFJJwCxbN4dMBOs78VIz5TsNKhKM6owipq41a0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6994

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
 sound/soc/codecs/cs42l56.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index 98fa812bc07b8..aabb74f1f43c2 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -911,6 +911,7 @@ static int cs42l56_set_bias_level(struct snd_soc_component *component,
 					enum snd_soc_bias_level level)
 {
 	struct cs42l56_private *cs42l56 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	switch (level) {
@@ -923,7 +924,7 @@ static int cs42l56_set_bias_level(struct snd_soc_component *component,
 				    CS42L56_PDN_ALL_MASK, 0);
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			regcache_cache_only(cs42l56->regmap, false);
 			regcache_sync(cs42l56->regmap);
 			ret = regulator_bulk_enable(ARRAY_SIZE(cs42l56->supplies),
@@ -996,7 +997,7 @@ static void cs42l56_beep_work(struct work_struct *work)
 	struct cs42l56_private *cs42l56 =
 		container_of(work, struct cs42l56_private, beep_work);
 	struct snd_soc_component *component = cs42l56->component;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int i;
 	int val = 0;
 	int best = 0;
-- 
2.43.0

