Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010020.outbound.protection.outlook.com [52.101.229.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F583081D0
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415642; cv=fail; b=Gvtyc3hg+dndPyUhTNBt/g+LZ6WejsBaGIN8HHO4sFWQJj9rHXriu+qVXiu/aUr1ExvLaFOJVJCU12jg4tAe+5W3X7DnI6JWcxW+35DOxWBn1TUD/Jg60qn4ID5HmruF5QBeIZ3y6ZacZKKDcxGLIc9P9lVjNK2VklObguZq+jY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415642; c=relaxed/simple;
	bh=yqEK8lSk/RVcQPNVYe6dOS3UHSjVtgofxZN4pO/O+bg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iELhHTkkXrxT3GWdPCybIf8yigf97sOtOftmU2HUBIWrbRxgF7jwzKpAao9YK4MvKXNqOZUi3DlASbyfYFyRj0N1rnxOZG9YtJNCd+I+YxgovIXDIPJVbPvIlthKb2ql6Q7IwSgaRRPl8m91ytuYUpIZVtrdHYemypCEKLCjslY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=H2KkvFEb; arc=fail smtp.client-ip=52.101.229.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="H2KkvFEb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSad0+aOdEchzUJQVPhvtbRYNDBFU0827PhgUid1gaqa5Zg072cmp7a/4xWb7KuAaVMVG5DMOpPLtt2LU1hBjUFNDZ+w82yJlW37EVzfpcmOhWorN4SbBS/ED7H3u16UleeMiU+ZVjUbeT6N8gMMT/qRxCI8cIPIOFqht8S9y2BIR2oMKsE9D9V6zn4Dlybj6JDgD4c4pl9eT/kfKwIsATREpRP/R+fvwEPX0JoUYAym2CJ+je7CPE4zahnu0ncezrEtr6t0lxEtKX3keblLBVyyKpyxJHV34VXudzxdz0qj8xqjtQj+hlILKnQPCy+Q8pdWxK5PVRr6ardDAV6cug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcNHHYw1l3eXNorCSwLNE8pe5JH1Gzx10+fObmldxS4=;
 b=v2fZF9BBMA1+uTvW8L8102g2WOzEbXofWxg+AyBSeUTpLWExyulDMOySd6TnenStJmBfQYb9hOGUF+b6G5mQNRqHUL31hSsgub9QB1CjUhIob3LRUaRHvZnv3rStzwPoSlLBWWAK4ATPtLXnPBbi/Hkmx5GbWlpMMhNdRFBzDpGI/YxpR4MIzI46SM0LnhB7xLJuI70tA9TxQOvs/FhHlw7ID7Ubkh/T0u1tYQSflsdZ81V4LFe4wO9oCGcoRSbJdky2VCk2EWZZA7+sfI5hz5p+4eRzBv+Kx47Rarb0We1/S8Wc/KcpbhKJWIybJV88GO7D6uejR+0g0y7KWm66aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcNHHYw1l3eXNorCSwLNE8pe5JH1Gzx10+fObmldxS4=;
 b=H2KkvFEbdkGQ+APNmFqv/wjUClFQrkq++dgnGZut3OfoxIaLJ22vomH6bmVzbNJY76Bvc7L9gAcavak+NKmIpQWxGlnumFUEeJoC3Dww1IxyHv8unPGSxc9wjBmZaL6mHJWpkSv5plU2KjaNegcDPVDbHMCVTMG+jr4/eH/jKgM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13995.jpnprd01.prod.outlook.com
 (2603:1096:405:205::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:20:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:20:39 +0000
Message-ID: <874is2t8q0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 019/139] ASoC: codecs: cs35l45: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:20:39 +0000
X-ClientProxiedBy: TYCP286CA0151.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13995:EE_
X-MS-Office365-Filtering-Correlation-Id: fbb344e5-637d-463d-2da4-08de0ad9082d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zFhikFl+S41wvf/U1kRspkjo1OMDAoFowESR/pgz+6dxPlCIStQRPm7L/HSh?=
 =?us-ascii?Q?lPJkkPUXbpyyYSQa4+zWAJmLDiJLUciXMRWwwL1lCJv1C8m8VLBTzukT3mBt?=
 =?us-ascii?Q?49mJfREaI3iooM+PLuf284qTFtdxxm3rSVDFmFbc9135tzRPLSsqwUto+Jd8?=
 =?us-ascii?Q?uPD66m0UsrBl6ARUHdcznTi1z5cIg/oksXN8UC0wfDFN7BqTSIbdtu5SwPAJ?=
 =?us-ascii?Q?g75F+oZnNP3QjSpIJXDS68fPAAkQO6qqfdmCaH0CYbILvO+QrYxD+FjvAOpS?=
 =?us-ascii?Q?AoZUaLog/qx28cM+Ao0TDMAQ+bfpZ2nkMjVkJkwjph5lcdMhkSIHl00nWGg5?=
 =?us-ascii?Q?pGwRotFSM+IryvlDirPcE9xNmOaScqCZbaUP4IbQ8m9sQUydguAxDsS3yByS?=
 =?us-ascii?Q?ZgOk9+kNrgAglDjWOzWW7rBwXNyxjVHqRiOJA0tAVdnsxOpfaMZWQMjrI7Vw?=
 =?us-ascii?Q?ajhh/1j3brCxUuAd/YrpZoUkYghSUzbnQZlEbXWWLeSsXDvTdtjU/IQDGg9i?=
 =?us-ascii?Q?mJJ+8xlZ/BlRJu9fvadMAL10DP7mW4cnFD2wgScCo7emCt1V3UzffAEgig+t?=
 =?us-ascii?Q?ApoJyQWK7mmRahQRqQcUUGY5IfWKiMaYXlkJZr/fXrp1gbyfNjOHukOWA/Cd?=
 =?us-ascii?Q?epfDoZQHjteY4Gkdz/NKvuD+LIxaFcb98EK4NZ9hHcMCsH3CqhYclhV2JoP/?=
 =?us-ascii?Q?ugZ93oDI9xrmf1hNf7zowjY8L6mQZC1e32FyK4FPV2h4r6GwU+LwqDCZlZvP?=
 =?us-ascii?Q?hflRptNfn40bb04UEn9JMV80JPleDA1rehpEKAy6CVN0MyW7mjt4OBOG3yUD?=
 =?us-ascii?Q?YPNXT/0fTLeFs0ToA90WQ7MMA8SOFvuWA3UHAfwuKgfEo4sE4zQVXBZtOWoZ?=
 =?us-ascii?Q?HTOr9rry2jBbqwixyK6JtA5+6Y4/eDu/bTmLxf5ViJ9aIvzuuikRhnoiES9/?=
 =?us-ascii?Q?JOd5miRpZMEq2hcT05ZCb/pP3Vu7tMJ+By2XMdm+AaW7pE9FYKdfccckBbAA?=
 =?us-ascii?Q?HiKw4XTIQVQ246PaV3XTnWVv5Sa2A1a4ID67EtXPjtQxha20NzNK5F83yFFv?=
 =?us-ascii?Q?lTApc3WwXSYRSuv1BOl/Ldm0I6zJ9xrAzncKqnnqVrxZwABTzbO/otcNgw9y?=
 =?us-ascii?Q?GZ0BIilHEobnknb3Xzy3wimbiMWX6NxA2N+FEjFj3+dwjjk7L38wZZ+3Ur8H?=
 =?us-ascii?Q?TEAzEsjZtN7ZUbvjoUPcSuklG/vQVLXFDAgvUUd4TEqEAN8sUBdJogigjivG?=
 =?us-ascii?Q?PqEFuJwrx49kQRf5b34Jfvhn7lPaFDXYrf1qk/28ZgK+mlY+fZwLy8HIkDW3?=
 =?us-ascii?Q?5aDeu6AS4Vob+E/i+HP0COziXergGEnv122rZAoO8zDcc2WPtw6HgSxgdng9?=
 =?us-ascii?Q?OwIxNKutFCLV3Xt6nYH+msSJAZsQ93Z7wxmFcCcOFkKygMsN2+TEe32gb6j1?=
 =?us-ascii?Q?d1kOkOLnI8oatKS1tJZorCBGn/FEKXXK1IuXS1PQrcny+6PgFtqncA6lfv8e?=
 =?us-ascii?Q?vnXG9ndQuH6gsODaQPCRk8yPOA5bSncfW+lW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8NBZsWMQ+yUbNAYB1PrfdvqWR/KGc6vOtDDZvxsElyNj9APEMyU2cRpCVp/d?=
 =?us-ascii?Q?YWFqfT9AspXGpltgGtsD8qovezwF+p/Yn8KGfJzm/VBY3M53TlhwdF4YcATb?=
 =?us-ascii?Q?CHYKT6OKy43BJim7B2YHX4Qgi6HmBlpvHzyvMxlTdu4qXdwICJKyFKsxgK2i?=
 =?us-ascii?Q?2Ldh0fzmR15wy/7eYv31yHDlUJveA1M31jjIjM3ETRbbZHyFIF2ZsfoIp1qs?=
 =?us-ascii?Q?m5ud7S2e8Ldj3VyO6P9qzljoQOQrukVgLCCIcJ7UWkFDaqX7NsWfu85seotr?=
 =?us-ascii?Q?1keY+EPoAlYiK4BeRMcXkI4MRHwpVI0g0Yc/L0pgfZSTMViZ0TpBhiZg/bag?=
 =?us-ascii?Q?u9MeFH+RG/3s6tqjrTL7/pTZwW5ozT5jV2iu/pbCcBriry/q8Cmx/ufa5N3t?=
 =?us-ascii?Q?WMqY0OO+VVcNYDEaO21L/xtuCosjw33pzu/beLlFaaQe2qZgFA67fRxXGLOr?=
 =?us-ascii?Q?d/pItp2aOLIDiB2FhQJNHGkFqCOvaXCtsTjt1ZHxLzlhz65XYDbhJ30qjdzz?=
 =?us-ascii?Q?CqUnZb1ViQe7SISSCzHKkMBUU4wOovhgGCvInrU4HQps8No2kGIMGwdOYZD8?=
 =?us-ascii?Q?PUZDSiKnBn0nMJUyIyV7/qobpyViHf6+jGvWZN+UTh+csb7MGyJ+e5yllAKC?=
 =?us-ascii?Q?alkXRz3+S4GyfK2pCS+bd37PNmpmtak72vUeSggYPfuYsgDMTevnYo+HuHuI?=
 =?us-ascii?Q?/8Q0Vqx8xC02VlWYzb62JoD9oK2yHizRDZ8MDY3IdRKPCrY/VZj61Ik384r/?=
 =?us-ascii?Q?4JvznNsQhazuUkNubXJk0Zl40CuI3jrp2TpwxgrcXl8jC/Emvw6Dmk3ZMmV4?=
 =?us-ascii?Q?w+QN0AyveADPgH1f70F48M7TKqOlvdkqmpXgm8HgMmgz1k/iMEmMPcgvZjWP?=
 =?us-ascii?Q?+yVFugxcV9DrUr8n9HVe0xIxB2L9stFFjP8gookFiYgY1yhIq9ezyI7ktZNZ?=
 =?us-ascii?Q?s6qsVJ5JqpkwEFovEXYz1wQnpLEPPadx0I7HvIIgltD4/D6TQTP8ybM/+MQB?=
 =?us-ascii?Q?sPSfG4ZKnFiEwFDSeyi2WmYhj3J0zSy+sBZoH7/m0tPrRrPiXP4g4Ns0qJy3?=
 =?us-ascii?Q?4YboMK7Ow5gm8/YumfiAH504JS7d5MT4J5XwEVjQ3+DAZJSICQfYEEtTdfgO?=
 =?us-ascii?Q?RLPgKzSfZ4hC8ZpVzu3ZA59ygxfyBmQQfhJmrRWAqdxzsRGP/iOgswPT50x1?=
 =?us-ascii?Q?vJlt+j/kXpoq555h5t7qGVWi/RpD2xrbN4u01nwCH0+oBme8EM8AkK1eTriN?=
 =?us-ascii?Q?/PY8sgi8Tp1wS3b+9XTOzISkzlSzUiUv0BHdY6MR8jviQbAMrIjIxLaF7UME?=
 =?us-ascii?Q?WqKNBST86L9v/i2XmaVrzHNxdUGfRpD0jcFCbdGShE4WSvx0K+TdCgKfGG7z?=
 =?us-ascii?Q?q9sVTFyfNuyqFlNlImYTx6CfdtsxD+lDbzXZovsO7/n0PYlZAo3kqbYvMEp7?=
 =?us-ascii?Q?q6LW5EtK9mDXMypGtGTIcDAUg7sfKNIwdO5d4wToEqeQibijdRvTgw04AJ5M?=
 =?us-ascii?Q?jO9L4ijUMQjzxOpHN2a7YQEG+s+gu/EtPofs9jLP/ldXyPwzBfaSl2aMeLX5?=
 =?us-ascii?Q?6vB4Vogv2uhJ7X6Mzbim/DhbfB2DvjzrewVCgP0z5PC6TnBM0HhWa2eRTrGK?=
 =?us-ascii?Q?monmw1niaax75mAuYEjHhOo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbb344e5-637d-463d-2da4-08de0ad9082d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:20:39.5576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SIbP03T3SstEr0XC4nxq7LJK5RhGIO0tlGdl18w6tQBphwUxrC4MwWC+I9HZpAlW1ZLJ41YqGZXv25SernPy/SnyYQ2Zo2T5i/DcaHyLr1PseTD77Z5NXm5GpHeevE27
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13995

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
 sound/soc/codecs/cs35l45.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index d4dcdf37bb709..28f47e9607719 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -198,8 +198,7 @@ static int cs35l45_activate_ctl(struct snd_soc_component *component,
 static int cs35l45_amplifier_mode_get(struct snd_kcontrol *kcontrol,
 				      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-			snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs35l45_private *cs35l45 =
 			snd_soc_component_get_drvdata(component);
 
@@ -211,8 +210,7 @@ static int cs35l45_amplifier_mode_get(struct snd_kcontrol *kcontrol,
 static int cs35l45_amplifier_mode_put(struct snd_kcontrol *kcontrol,
 				      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-			snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs35l45_private *cs35l45 =
 			snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm =
-- 
2.43.0

