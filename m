Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011054.outbound.protection.outlook.com [40.107.74.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B278879EA
	for <linux-sound@vger.kernel.org>; Tue,  1 Jul 2025 00:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751328662; cv=fail; b=N4VOHxR3FuS0WiVWqabTX0ffceXjI9+94UQ6jqkhBjOXITgxVGMmXclMWhZ9Vvs0a9Wo57r5hZ7XM1MhRl9BZ+XPbC6Ax+jYvGGri5hzX/DrvzkqhTran9atI7CELJVyrmtwPa/KqTrJTjM7czRJvNj55yhHbyBwoitckZ06+Hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751328662; c=relaxed/simple;
	bh=2efJjuk2BKXeBU0UlPHNnjAfTRAgsiL9IqtpJ8TbmaE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=E6/ouAMXTkiGUamkEBO5wVpkN9gEPGu0mGclEoCOc9AvoqRPScXpRMjO7wKgEBVX4NUbYo5nMKt7OF/W3r/jQd3b3+rWLZDB1Wn2hpULCeUYz+cYiA2svUZw6w0lucafwB6isXdT/eZgktxnf+p5tRZtAoiENlYFBkcntp61K3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bHCbdLrw; arc=fail smtp.client-ip=40.107.74.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bHCbdLrw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZqwHRMLAAlzYLmTrYNRwUGRsl3dPOCJvnlIgRdWpmqZhhQp+tRqIuax/ys1mASv9bjip1oNtQif8sAMo8sotdyTT0yeXhXjLbKjeiOT3FIt5OfaSHJN+8SVwCorZyFJtlipXnNInsgdq32tQLcX5nJg7A65PpDqJKcPZmIB9gW0WKBIcmpVf++gVn+m9AESi/xpAP1yheexkIJhanNqcO36L5Yl2OqSaeMmiiwfC4j/UTh/va+qPVt0cDBuSWBYKMmUMhOcFUT3Te7pbfTtb7Nu6u9WEVqQ3wTUnet0r1JNh2Wy3UgfvI7fdXlvoPcM67+wArdh544cXFAlPsHQKnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URXww7J9UtPEwNzANMHg4hYAeN3ZaNCmDvaPVO7Tl+4=;
 b=FdtzqGWTEGENQTkHKc/E8+CHpvtm0wldSiBpusxkm5YFcI73co3N76vQWak0NqV6f7Zgro9Zec3ybCkMRIYc9t0bR0D0nDkAkEzlHtHHKt8fn9InrzXnPyyVt3AOzEC7IN6zTklm14cJdinhbWpjhR/g70fu8SkkNLTiegMLHUdheBy02LkHidj5g+NdJ+JcvGxnZ29VX1EEKjAAbcC2BatYf/w2Uoqas4xEiuZbjvzfbOBF4RiKT13YSavWtxX9dHPzr+OLKwg1o+nWU3w6R/fv1E8rbPqpg3QcStaJHjHCPkMsNYBGBvor2xVsgwxz8poWXNLgWrhSg6yj3p3ZIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URXww7J9UtPEwNzANMHg4hYAeN3ZaNCmDvaPVO7Tl+4=;
 b=bHCbdLrwcTlUAd3RZcAnW03nthZRdm81KQ+CJCmqUW13ddEFgopB75lAylJBrnnsjiHO9LUOHgDu/mPNVvAKbreiSL5rOSd2OoGh/91BSdCiy0ny8PS/KTb2o/OitNjhaLjW69CAiYPH05VbGx2IsD7f51efTFX0DtX96z3VrLo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12421.jpnprd01.prod.outlook.com
 (2603:1096:604:2e2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 00:10:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 00:10:57 +0000
Message-ID: <87o6u4hisu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 07/11] ASoC: soc-dapm: use component instead of cmpnt
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0t8hiue.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0t8hiue.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Jul 2025 00:10:57 +0000
X-ClientProxiedBy: TYCP286CA0164.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12421:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eb13ec6-4944-425f-1744-08ddb833c0f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7Jsk4fRXB5t2HRg4peGWv1kN+7Cc0l/qSd1Qj65SFOwy0WaI3YwF2n+x+DN4?=
 =?us-ascii?Q?Yydr6r7c6O54yMCxAvINR8OpX+2WvQK1h7z9BB3jWCdnHtWJP6fAsdUAqcDE?=
 =?us-ascii?Q?lNCGY3OFM5vgPWsQO8QGpe+BBs2xAc/yfM+89BHitdxUCOTN+UGbU/5Atmc6?=
 =?us-ascii?Q?TSu6Kn9Np3txgMlic1jKoUImCpwKCWO6hDQUJX6uO0B1ToAGtn7X2lRXXgGN?=
 =?us-ascii?Q?yC3W6vUSZoRn5NpcFZK4tWpTwVUNURKK2jrQnj35CDPcj5okCrooTnLv7BhQ?=
 =?us-ascii?Q?5spAlOP+pbf7JxnWYZGywTDzWsyiK736cfLAvH4aZJa+p8rrT2tOW01KkIr1?=
 =?us-ascii?Q?YQ9+hxnVemZnlRwKEh4ASw3hr32EHXLBwTMQiz5OE59y2f7ul0FAHDvLWJlP?=
 =?us-ascii?Q?yxDUBrK6SJXfc2T/voDBGZmvmQaNDsOEmcibww8uS5EBeA3C/vlAcz/+RuuR?=
 =?us-ascii?Q?e9d6nPs+DkfjA2GjfWcQpl//QEiX9j6yfIs74zvHUuMQZOC/a2arAhjrkqTy?=
 =?us-ascii?Q?l5vQcSk2mjr0YByxWyC8f55d+OJx2Chc1GOqzs98+OwIzE86WcClun12V27Y?=
 =?us-ascii?Q?BV1DVlhQs6vJ2sSNHvmhwMCyaSs6TIg8qKepwxVT1NTSV/JOosaj8SvhvQkm?=
 =?us-ascii?Q?j4FdHnPc7uXirsAlAC0kqAyLAfEnuyK8cW+8vgjKg5NrZssHDzGjH6/gw3qg?=
 =?us-ascii?Q?Ise/tnpoFWaSeGQCohRHVyGp3YKM+BJKZYzsIOMuZF1aweon7E5SKxjtQS+W?=
 =?us-ascii?Q?vm0u1lu52rckhBOcLwstMVfUxCK74Uab5pIMdRs/5aBGad+tYbwjLNIH2P9e?=
 =?us-ascii?Q?ySbOr8D/HTAUnNlDGBwo8c2KA57AExTxgodyKresfkAf3ZVI+m3yk32dPisV?=
 =?us-ascii?Q?lfNIP/5Gab/Gr94nwCn8/QHGh5MA4oRXAj3GtQkt+LSO+/aEkaoIdbWKHFEP?=
 =?us-ascii?Q?b6fEaOQ/7ti8HwViRStFEjXeoFOw/NfoMNDQmg5oVPCVHIQh4Z/GlbGcxJPh?=
 =?us-ascii?Q?ExFgWxtfEXtyXUFFQuess0syzGz4HpEzQH97huZbpNIxuQ1MVgwQcri4kM+0?=
 =?us-ascii?Q?cSchneQmixygrAn9GAIVhreoMyz6R33L94DDjPCXal19b4mBZ4RBpbmog3Pr?=
 =?us-ascii?Q?XUZOCb9zHOcZ682T3heCmpoqTeGd1dAmQ9UiLNpFCs++1xJKENdBxVVctmX0?=
 =?us-ascii?Q?1LlK+ntby6jcNJD5PSyB77kzMs4qWsKOO4nC39TjAzlyAUNeV3jbgqRGqBXr?=
 =?us-ascii?Q?cwfDOiEgT+H/VuvEjBSMhp1ge3/QZCpnKn80+krJAhK8v7uY8klOvasxGtCB?=
 =?us-ascii?Q?Ov7y8xYWLLhw5ZRrbEW+by1XYi2cmpXEMXOzHIGrLkA3V3kvbg+8LQj2KUah?=
 =?us-ascii?Q?x9GC5CsSmxb3W7uEcu/TQEnGA51eVExZInvZZi/sVAU7PSG6F/1HnfVvc0LC?=
 =?us-ascii?Q?4uyAe0dJsI4RVz7vgldacHREjthTWoZdbp6qZ8IsGcffmG1KoDK8Fw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ISDoFPTzCLkhYv5zP5SADZ3EEVRQkKTaBVsgYMcRGwMbWAl+VpWFpazgUfu7?=
 =?us-ascii?Q?JY/yUeRqTl/d0yTJFlxf7jA825+fjLPgMIzddWRNbQ0qr/cFemci4pV3Ta+/?=
 =?us-ascii?Q?+7PG8UpxSruzGRC/F46ago2MEVFOW2plUQTxRBsc9yJezYyA6Xheaw40+GCD?=
 =?us-ascii?Q?evwY+kxoiDlCxiawwMObNr7i8aP0CZPMH1p1ChRjqux3kWIczfaaTDKEhszI?=
 =?us-ascii?Q?0gTTI6NqK6h1pPe5uQOOYrM1g27/ubDmq5PXa/DP7pAcdJCm4BrMgOv3i/II?=
 =?us-ascii?Q?sZLkctnAT/GuRDhNxfiSQjx3vwx84mjDF0D54ywl13OHGZxTbEWBhqauxib0?=
 =?us-ascii?Q?mdJjyctvvOTQIfokmg3EMk4GUPH4fbta2E9v6M2/Ga51W1fsim8Pb8nQRKSo?=
 =?us-ascii?Q?rv0ASPYOeIwprhiKb/nZYLoQnOzr3x/3JBgjrzLtWRny+x0xx4xoq6ZvPR4t?=
 =?us-ascii?Q?VAR38h2YOUvsqQzrsWhMkAcIAzrOxgBpraiYsHpcW+KobliLWXZnBGSBSZxN?=
 =?us-ascii?Q?G8KZ8y9vsj1cdlplSmKh451JMzDybFq8vVtOEC0rzBWfjTx94qJkuUWMfOPy?=
 =?us-ascii?Q?WRljUMIkBuKFCUmBFab8WZWp2xmSGbTz8EAwVTWtZxwJcFf2x6Z2ZGYJL3w/?=
 =?us-ascii?Q?Ns2CITkcpnIsM1MASBHmYlMwf2aC2yYGOZsNwru1xkSHFyKQcLZpgX6oDjBx?=
 =?us-ascii?Q?1AziD/srD4amKT1rs2f9ZNIrdptdmgM0eyrYb5exsxtDNV8hHldsDMEluXYN?=
 =?us-ascii?Q?hUqOvL6sD+Dtxee/Iz/Q3ifcwpMuaFRKOPnR76DzRdJAfqhFZ1+STCDfkEz3?=
 =?us-ascii?Q?suSAUltCyz+Iz5nMfEVlxjpDGTMX/OMTcYvOyB2Gp4RA461eozPIZ0TJAbdF?=
 =?us-ascii?Q?dvV1dIiNKpFy8xh4Ojj4RLYW9HKIIpjXEdiPLt3ELz1UHuqL+KgfbL3AvlAM?=
 =?us-ascii?Q?jjgRJsBT+UE4sdLRVVnYxX6vmK5nXRZVvmuzZkWjbZfpVptelxY329sfvz44?=
 =?us-ascii?Q?uMMExlzimD6jZbj37XLd0DDyfqJNmsEXvl4FByr8wOFdx0sq2yFMawFcZh/6?=
 =?us-ascii?Q?41JYjCQPODN5Can+T1DzWQkupIUfubL/oY3/n130VDM1ljmLpbduzf3831vY?=
 =?us-ascii?Q?d4gKw7bLuwtsnrjEfdbwZu0YKxBiUobQY9KsQxuwnkUjkKZkVi/ADeM1fWmM?=
 =?us-ascii?Q?nAG7tIqUYYsg52gXBzoUzQoDx6SZDkffnPPFs3pf+KAqJeT+Ug9pwzwmTWLg?=
 =?us-ascii?Q?X5uhDlp08OXkVGBEMLJm3HA3zjZUsyWGJT30GlXpi11yjeQ/LgkVRGYjQzF0?=
 =?us-ascii?Q?r8CTHq+dEvH4f5z5Mo6Pqe092CvBOJ+BuI9on+P93ZfQjADRR7zJ1H02kuJv?=
 =?us-ascii?Q?niVk0lvZ9fjDST6SV9JasA5PLVLF3fRs4uQTKiPUr/H2AzawyN6i+dtek59n?=
 =?us-ascii?Q?tzhtSzOdn+O0/Cp82N2Rq2zQTmndZRoYO44/lRQY9DtRuM1+pTp75/RCYRMK?=
 =?us-ascii?Q?8oY1uOK7DqXTqcbp3OyD3iPRnFJ1Wk3AS7dZbFW2G2HjLTGXXFE9wW9UEpAU?=
 =?us-ascii?Q?Ng9nLUBYLcKdUwzWlvrMGtGbGomzuzh/QXcJ6ycJHmu4jukryJnaHZ1fn9mU?=
 =?us-ascii?Q?/BHxZ6gMdS++2EycHn5aAXs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb13ec6-4944-425f-1744-08ddb833c0f2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 00:10:57.8048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EFyUSHjmt7pJIX4aiLD7eZn0G4oyUnlKzXoKU/LXcHDSsfLrrDOEgorvIQS6YInb00p0WH2WrKpJzSfxlKVQbHZsl/jaC9QRo6r31OjBp7heNkRZb2E1i/YMhKowboTK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12421

Use normal "component" instead of short "cmpnt"

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index babb642c9655..d4cf047bc93e 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2628,10 +2628,10 @@ int snd_soc_dapm_mixer_update_power(struct snd_soc_dapm_context *dapm,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_mixer_update_power);
 
-static ssize_t dapm_widget_show_component(struct snd_soc_component *cmpnt,
+static ssize_t dapm_widget_show_component(struct snd_soc_component *component,
 					  char *buf, int count)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(cmpnt);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	struct snd_soc_dapm_widget *w;
 	char *state = "not set";
 
@@ -2639,10 +2639,10 @@ static ssize_t dapm_widget_show_component(struct snd_soc_component *cmpnt,
 	 * we're checking for that case specifically here but in future
 	 * we will ensure that the dummy component looks like others.
 	 */
-	if (!cmpnt->card)
+	if (!component->card)
 		return 0;
 
-	for_each_card_widgets(cmpnt->card, w) {
+	for_each_card_widgets(component->card, w) {
 		if (w->dapm != dapm)
 			continue;
 
@@ -2703,9 +2703,9 @@ static ssize_t dapm_widget_show(struct device *dev,
 	snd_soc_dapm_mutex_lock_root(rtd->card);
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		struct snd_soc_component *cmpnt = codec_dai->component;
+		struct snd_soc_component *component = codec_dai->component;
 
-		count = dapm_widget_show_component(cmpnt, buf, count);
+		count = dapm_widget_show_component(component, buf, count);
 	}
 
 	snd_soc_dapm_mutex_unlock(rtd->card);
-- 
2.43.0

