Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011044.outbound.protection.outlook.com [52.101.125.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADF9230BCE
	for <linux-sound@vger.kernel.org>; Thu,  4 Sep 2025 05:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756963303; cv=fail; b=rlzA2RML/cP/9eaYz5uhp4+1C2/btnW7BvM9auHnx2V4L/SILFcMF28urvbQLU0XagKMg485x9xptZR2mY2UXbLK2XMCSWYUsFRT9s2v4YE0sWoPg63+p669lRSHsPVn9ettg2clMkHvpJPlyntnOrj/0DhCq9mzcxlZyuPOi3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756963303; c=relaxed/simple;
	bh=UL4oUwavqyWUEM+fkjplCwJftKclSmwKrphxHhM845g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PGVXvVsYrMoQHF+hEDCGIGFNbTxsPFU9SuAQB55V7OAeutFZb3E+/u95RiG3/hH6x+BNexr/JGoEBB15E1eoSMCol1onGMJ1q/qqe0awmUIz4mZJA0YjhZc5kDh1/GzTim97vomMoOb6DY9PxEvifVCBXKCb7eyagC3HmxPqn4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dxoTOedp; arc=fail smtp.client-ip=52.101.125.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dxoTOedp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DkD+ZOfZepXdxmXsGcE1yddXOHiLeQM9AmF7WKxcM1CZULuiCs+P+lJETFWFZsWopNBWFesmcc6Pb9NbuzJHS6rSxG7JxDjJ3OotV2ex/AETswtLDEpE9uy+9++bwM71aa24jhyADJiNw7JnrVjvQkJaAJLR01GhNsnLB4+VNj8zekvGjPvw14/K1LxzfwniQApuXYYR251XeXs0Sod8PwZKsqQIDvI7bSi0qXaaPN/HLlPCOpJKAQyVcmaV1a8oWcTUbzzzqMWh+o/1P1UV8vVZUfN9pW6LPtxkYVz9Q93oaLMsyKG9MMjq5Wd6G0Fo/CyKd7JKTbLhMfJQ2263Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kV+IzSEYDMLgL8uCOtOOLKwK5sdPR1/ckSwq9Bhqj4o=;
 b=wpPyB0Nl8uByEunaKUxpGybYvZh2UuFFPB0QMxnT8u6RavBio3vqFAI0zg1ODkRWoiX6g4oYPXRXHupOnF1EHxCr3G3+1yV+yOhGkSjRmFDBaW3J1+xUhnmviZQpkfVtINFVQdm7qsB8qBH+XaACFR7weq2ccMEnV1MELpiHFO4YTSgQI7Zj/JaspYxj/r4HyYHWgQgsIWGbPlaDnPjnJFglyQBfIocBvXSMA2C9CrOjfxcSInFtogqTY73QwReZzY6ZZmYXUOQMYGu3EIR9jAJWGSxr8CxNdA6pnhYfxKzU6Oy8ixtfwdOLjJKXSOfipchLK5Zqtf5hgloSIy1MmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kV+IzSEYDMLgL8uCOtOOLKwK5sdPR1/ckSwq9Bhqj4o=;
 b=dxoTOedprLYtQa00aqLH9SODYeXOATIGLIkI7dRVETVlMD/Njj6V95Ev35l+Ja2CHrXba2tZNBKY/JtxdzvZ/IY+IGUQDbP2cp1qmzSXnH9Hdh1T5HZlQ1g6/N6bJAkzXfcURIzw7N402v+Z5m7svpNuPV8DFVtFYL+nOu9QFCU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15650.jpnprd01.prod.outlook.com
 (2603:1096:405:288::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 05:21:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 05:21:37 +0000
Message-ID: <873492x066.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 08/10] ASoC: soc-dapm: tidyup idle_bias handling - step2
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ecsmx07m.wl-kuninori.morimoto.gx@renesas.com>
References: <87ecsmx07m.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 4 Sep 2025 05:21:37 +0000
X-ClientProxiedBy: TYCP286CA0161.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15650:EE_
X-MS-Office365-Filtering-Correlation-Id: de462a37-f9d1-48cc-8eb1-08ddeb72ec18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q/YxTz+67OTM+fNt76e4tQpkfgLbUy5/EeGQoZ5ciiZt5KkSjcprQUfFFzvA?=
 =?us-ascii?Q?xjtudEK1C9RW61qzn4Lwk3T571wh+F+BrRao+CqB5stTjXZBjAFav3YbOvc/?=
 =?us-ascii?Q?foALU4b6wXKiBfAs916U9znI7uej8JBkV+BjGtgaBgQpGdctf/xuHrC2dpPH?=
 =?us-ascii?Q?ZZpUXSPN3CmAkpc5lCR32pEr1IVDIlW3dkhzZe+kEDRI+7SbYzTD28Pd3/HU?=
 =?us-ascii?Q?6C5EiByg5/sXvi1+MAFoEKLJtNXZ8okbw0pyk3i2GfvIbG05WZlHsfAuCeXu?=
 =?us-ascii?Q?z5Ffq7J9fIatMG73/gqxpgP7HuvEJIrCQ/Rg2VzOhAP6iKtakGcwPWbZPjBl?=
 =?us-ascii?Q?mzOVRGTnqRP/ullnMGZXPbJvHkkl6JSdVyIMPPEmKo4o7GJ5wGCrKSEYgrQr?=
 =?us-ascii?Q?dxTl8QNGAB2BDd5817OUBEwcvsgeleq/WKfFXtKJmQ1VAgR22ck95+qpYV0B?=
 =?us-ascii?Q?G5r/CiHIMw7bkJ4lnxXMfuzoyH08iJ16YGrGD5OuwSErL/CMqTWr4Gbnr+1J?=
 =?us-ascii?Q?aTb+mGQmkf4fvya19yInHDAkDR+TN1ESm9Heo2UYeiRh5Etdn5TRyYT08L5Y?=
 =?us-ascii?Q?aobCpD/a7JQEhpCN8nEl0k/SdjbmQqK0Rdo9jW/7XJa9L7Wwpo7Tr9GQ6yLO?=
 =?us-ascii?Q?6bM7p4oHLcbNOQSCrdvm6GVtw+ycNMKZufT2CQ814txqAsNliB2pYTD5p1wh?=
 =?us-ascii?Q?2JBlLMIBuREPQYjoj6I5dCyTvetXkcthXBxP3f2lKkHJWWVNQfcIav9vMCfF?=
 =?us-ascii?Q?aS1DJm8o/XZkui9ODOtWb5ffYSKL6GjL61nEdrDYi4+rbcFAn/34lf65cSKO?=
 =?us-ascii?Q?YbJf9zc+EI3VWCKJnd5Esn/dwRxQ83OQj2UcMd5vLpKjpanS04s7gp5qgGTc?=
 =?us-ascii?Q?Bz2ToNEoSoBE5FRqE3dCZH6sZRtgh9qoljx/5l2jRh91jDS2b1tXMrnlBCQT?=
 =?us-ascii?Q?KRBiOicvDIbRZRXV0nTXWz0y/J+aXfhVHjbNvglrWGDQG3Wo/Hjpyn6a30m5?=
 =?us-ascii?Q?6RZYOVuydderrWPE0JlDFYS+nLtT6xCf9RjUsYZdteFwASeDtuGeB9bPaad5?=
 =?us-ascii?Q?kWKf4RpTPg4WRoe9QjQYn22kgLP4fMPIA7soxHEdzPVrxgd9j5paUvgwSJ4R?=
 =?us-ascii?Q?mWoZVkh7JDbkuLwodLJzxR/ScLff9Pvpfp4FN8cZbg+lWC3+q8qpNWLCSKon?=
 =?us-ascii?Q?141R5kxya8KB+5pNV1J0dAxhhSf6Scv31XBhvXxhhBzyTXaLkImJz6uaGb2k?=
 =?us-ascii?Q?5mfchfh02OVteum2aa7Tpb1uH4+7Nqhnvaj0+uUnE+3CkIc26aPyVpN5R5iB?=
 =?us-ascii?Q?RlXV8K/bJ1j2LjpRxw2MbtpJz3Itg9SP/INfxzy8fkWU7OCDq0y7qAQ+siYk?=
 =?us-ascii?Q?Csr5OeHgPsMsvyc0tdTLUZoDiHCk+BvNgv60wpAjK3/LJgwpRbVgKTJKwiFM?=
 =?us-ascii?Q?v53gQfOA2wwZ34yUXpIdXZvbTMnG8B9DvKkJWV9tJQMApa5JzxdGhw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0TYYvbTzSaaJNJW/EdJT/nQRDyeTfLvUfeCwuMEtt1vGEKF+NJzInRBS401N?=
 =?us-ascii?Q?gEH9FVXcghCRvLFLzY8+7Zg1OdmHsNfJGSz6u/BogKQRwvq9B4vqoZUVkEy9?=
 =?us-ascii?Q?EdCudEZ9G1AeoKrJ7q4Ge2ZkAtTDDoaIhAxbM/8wWcDDNmOB/5nErsQzwloZ?=
 =?us-ascii?Q?UteF0kSaYPzaL16huEEmfWU7ElDvnxMaSL6gEWqHiRWhWtM+BKPkbqTGKipA?=
 =?us-ascii?Q?kcA2I07IPX2ZJXQrv6bDf82zIiREz/EMuIWHY5ecCU43ZlsgACYK8LF98j3W?=
 =?us-ascii?Q?m7FnCzN/V3vhYHOCMFSFbwLfmVvgPfQmRq8QjO0bE2fAEsOChML6T+1XZPFG?=
 =?us-ascii?Q?VZH9HvBiniLpa6ggpbD3w4Hc5jtY+g9hEKo81qNVfqPC4mNayHUINs87H9VG?=
 =?us-ascii?Q?R6pEpC/Q5YURMxe2i5ApN1fA+gGocivUtsHURImVocWBpg3mftyCoTM73joB?=
 =?us-ascii?Q?QQ7om0ENL5u2SNIFhUbEWqTGCHYqeFQVxwjjhyjkngOX9ztp9QPR72JFdb/6?=
 =?us-ascii?Q?t45CF98YWrc7XVVdp1+TEbMbdv1C8wLTgl04yv4vOxjN5tw6EEdthB0RC7Xk?=
 =?us-ascii?Q?LBLM9amFPUFm739Yqr1BAS3syCh5V2sHFRv6ptyQUNsYFXkESrchI3ca+S/w?=
 =?us-ascii?Q?tBTe8HbuYGAJiHIxL58o+RNGWzX6twB/dRatTeXUXnipIWiKHtaFQztJYoA3?=
 =?us-ascii?Q?Yl9guUaTRe0bLkiCBBQPeADLdtuGof0NLaZtmsktKFkgUeg2+dwJOSoQV1j4?=
 =?us-ascii?Q?5aenRE9wDeETaAImllV+sja/EJRrNk8cJF6WjXbyWbHEWDPqxZ24/Gy2jo4l?=
 =?us-ascii?Q?kkbNRLynkHNrKpoYQ73+UgixYcJbKVrVgTS2egmIZ8CZsaFignRiB8k1eNAm?=
 =?us-ascii?Q?8fe/KuJ0Aa13TmXevC+AoB/L1SJvPbQX3FNd/+bDfRxm/jg/aVVvTqravO1A?=
 =?us-ascii?Q?//xjER+V2HYGafHVE23vvw4t85tITX6RczEuKs93AvNMgT4o0U7n1qXuYTQf?=
 =?us-ascii?Q?egeSfLpmZj1KK1EHiKZa56AtT7ph7RKTlEHqp+c1kKa7zUCwlljzU5htyOc8?=
 =?us-ascii?Q?Ad9JDnMnc2CJEggVLFus0mXjN/Eet2Pc95zHgH3nR60FFs+lkeOWDxo1ZO1s?=
 =?us-ascii?Q?az1CzMxdwitJ0DTBAKH30/EBL0105tnp5Bgs5JLdBNxKU5N7jdkmYT0WpDyM?=
 =?us-ascii?Q?9PnGQkc5BKFYKgOMJEPgDFJ/Iaex50/TB7zacOvgUCuQ60ibG1IZfDF9Kj7+?=
 =?us-ascii?Q?nd28g2miXhiShfMgrmwWbMFj0JLbSd4RDyA4Asn8gj3fkwOvOn3a/Pfjgp8O?=
 =?us-ascii?Q?89cCW1bu9k9ZOgFKdGODl+dfZqnGH5WDyYTZj9WCvoxsggC25hhODYpAnpKe?=
 =?us-ascii?Q?VA1qzJwKsUERg3u7l8qOCP0PNlYW4/olIAwenJjgP7mlw7owgVn+cnTnzUzd?=
 =?us-ascii?Q?s2yY7v9Ob1k96ViZ/BQEopF48aXz9gWR0YQNvF/edwh5yKCghnSCjUs0JBOv?=
 =?us-ascii?Q?WCRtc4bQuA0mOllC8/5UhDGsZKS9z+Rkbb4JnFQINgbCI6ue+UJUIB9VAV/U?=
 =?us-ascii?Q?Ywv2U5+oA4cQFpuqRBElojAxMtqyvb4ZAz+R65a1/lcru8wfZw5wwNUPAVLz?=
 =?us-ascii?Q?7MYOKr0HsReD+Mvn9m+XJus=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de462a37-f9d1-48cc-8eb1-08ddeb72ec18
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 05:21:37.8944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b31rud5bLXyxXncxj2q0av7WKtS1PIO2UvLaKU7SwV54XzePXMK9zMnxfYjpMmL+3VR1qRncacQVNMGjlFNJLfuW3qYaruU1Puch+iikzr5UQLgfnBh1bKdGDpH+ZqFb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15650

Current dapm_get_idle_bias() is unnecessarily complicated/confusable.
Tidyup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index cbe945f1dc9cf..a263696ef8acc 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2182,21 +2182,16 @@ static void dapm_power_one_widget(struct snd_soc_dapm_widget *w,
 
 static bool dapm_get_idle_bias(struct snd_soc_dapm_context *dapm)
 {
-	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
-	if (!dapm->idle_bias)
-		return false;
+	if (dapm->idle_bias) {
+		struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+		unsigned int state = snd_power_get_state(dapm->card->snd_card);
 
-	switch (snd_power_get_state(dapm->card->snd_card)) {
-	case SNDRV_CTL_POWER_D3hot:
-	case SNDRV_CTL_POWER_D3cold:
-		if (component)
+		if ((state == SNDRV_CTL_POWER_D3hot || (state == SNDRV_CTL_POWER_D3cold)) &&
+		    component)
 			return !component->driver->suspend_bias_off;
-		fallthrough;
-	default:
-		break;
 	}
 
-	return true;
+	return dapm->idle_bias;
 }
 
 /*
-- 
2.43.0

