Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010053.outbound.protection.outlook.com [52.101.228.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C25B23FC41
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821440; cv=fail; b=UXptMYoxyNn8E2E5p3m76Y575G/inANkv4nrM+2mOxV/UekhZcEt2RgMbhwvu/PtI+q9ReDYyZo32QB077AlMYJMqUioAWOmdjKn1BXqTxl2+UZco56IJpj0pl4rkxGdq68gIVspL2GI+hfF6AXH1mCxcMXkPUGp5mWy2bnaCN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821440; c=relaxed/simple;
	bh=dwL688kX1I7XyxEMYtmD7Gsknq233HipBkOP00ArydU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=QllXcmcN8JJJ8u6V1t30Jhj+LTO7x4TJhC7U4vxT6M12HAFiXmdIZE0Zi8r4eIbDGmGfeDb24LCFj7tC2LV/WWwUrIZs7xrrOrU0ziWiSh2pbOhUxLB6EK49egXpG0JQgXeRO0CYhMXpBQWvwD/7mW+P3Vb5VMYgQNzNpHY7ifU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=J4avu1rU; arc=fail smtp.client-ip=52.101.228.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="J4avu1rU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svSALvzth+AI8l+EFGI5bZK3VRRSoX+FTil7KedIo1MqSHvGKpZycydmRGSczHV5LLxNXzXqGVzcN0G4qTrxZ0dMOPJ+eOm39ma4lJ/Q2Z5cBub9jq6pTISiylbvSjkehn8GcaN4wyynTElS/R59A54yfLbNia7qOC4VXm2kfvTrOAAdmmP/ZI0CslbD1V9DU7chofJp7h2AA4lcNQ7vJN2BT9DU9H6GLcEtj6dTMrZuof7MtvvtDNu3VG6CCKpoXTYeUM9wpfvGfkITKNLfDKfgxIAzgKD1HIx3M6XPHMNp4ub2oUcCAc1Zz5mTnb2+A+6wM82WU1KnEUFDUwsKQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yo3TZkA4YusDo0pBvUMb68fOLAGGBJvTvF5fcH1imGE=;
 b=CsXP41p9U4yF0lUMw9//aGutKZXV1y/EgAWts2BLoiOwSFBDUtbVOL2JyxSpH0jlN3R6FeFPhO8IvVnBIsj8gI575hkOb9GNRR7kDggW0HUneIQwvBza/nS9UlQX056ZkMxbhimmxsRkijJ/qFLs62boOHgK3QcaspHQSHV+3Pb3RpmcVszdERgBy0PsBgDYhZemJuKfhZ23Q5CQqF/GbymSEizUn45DIPcdXax9SnImqAhOxaLhrhWcVD0ZE+KwK+Lp4FVr2t/OX8g4u1+0r9ZCCgjIbyzv1Y93rjXsyuddm3c2uPMr3Gc4KHmHz8LR4qFxAKY0BfVRkZXu/uZnBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yo3TZkA4YusDo0pBvUMb68fOLAGGBJvTvF5fcH1imGE=;
 b=J4avu1rUFbCARRp9AyazSKizj1fa+qgx9qw3V0MMhSKPbmvQVzaJ4kI+ubbhog2kHpszC3oqT9WO39UXP9LE1Se9SgoCnKohtwg8dghecKVvPzuUiXPn6MglmVyd6H88JUC1QcgCio/11u0/7b1fmzEwVu/uuRVXBrzRjuu5yzU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15789.jpnprd01.prod.outlook.com
 (2603:1096:405:2c6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:37:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:37:16 +0000
Message-ID: <87pl9ps8ub.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 290/292] ASoC: ti: omap3pandora: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:37:16 +0000
X-ClientProxiedBy: TYCP286CA0147.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15789:EE_
X-MS-Office365-Filtering-Correlation-Id: 90b13fcb-7a5d-405c-c93a-08de20ba76e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4eXFlgLN5DP2vxq7wJanpEtEXwgQdaK+rUt3DKSxQok+gwfnjy0+uJL5Wr3C?=
 =?us-ascii?Q?MDSo3SDUBrYOYyjV3KjIsS5Z8fJMwR9r2ZdCO+rfZAv9tWh1ZjB2c2QD46Gy?=
 =?us-ascii?Q?Zb3nYJc7PodzvcBeNyr6AZQiyCQHMgkqScRlW6BjsWyoEOXBmCsvqz0iokiT?=
 =?us-ascii?Q?UvgqxY4FeRVgcT0tCigMw734ZybzwSwVqhZo1nz0PMhKQglkjxm0NBqrzYHg?=
 =?us-ascii?Q?uUidHimpiIL1Y0KyVJwPMP7DGTStxHeI9Hsf0ZWJKfn/gkouNDKYDlb59PVS?=
 =?us-ascii?Q?Gu/OoFvvWPq0nF5ckA0WQ+sAhk34QUFjWc25hWsZcoCMAsUbOB+UhV54Slo/?=
 =?us-ascii?Q?0yv67/4MKlBNbtNyk9MWd/L7jI5aEjyTpqM2ZQnkHzLKSRbiT/JM4NAxE+eS?=
 =?us-ascii?Q?V/g/cwKvL6zI0pPaThbpN1o15QCDiDlqzJc7i5j7qydN1oo36/KCxKeUOmlR?=
 =?us-ascii?Q?BLNx1B6gQVVWDd+OmRcHRvY7m5GIx92XycrdbU8dS/BRJTAjwevdPEmmpKoS?=
 =?us-ascii?Q?V/jPe27YgJBdEF5BxsqNyREPre1kCb4dngmSH4XUZAsJ/1ZuaiYUTDfTPGrW?=
 =?us-ascii?Q?Xz2uKE7xtz4XlDQqRD5riAMJp7Hndy5cjT9pCvkwG0XqOu/mO01cE2BPHL4N?=
 =?us-ascii?Q?v918hc1h5OP93oWqodMK+v+Ao4lM3Qq7juveZHqtTDwuwTqfp0UlKdDPf2ld?=
 =?us-ascii?Q?vH5heT8ZFZxeTO9LLfALrDFBtPMhojBdnI2U91VtSIEO+qiEUkCl3GY4uDyr?=
 =?us-ascii?Q?y1XyEfJe4LDl6uyiVfqCkdiFF6H7g3vWbZunKK5pz3gK5QlNq1TWefXQNnBX?=
 =?us-ascii?Q?i8g2VT8JFgBaofuC8Q5iBcu+S/t093BKgN2al4L8EYbii0rGjSaEc0rTspYB?=
 =?us-ascii?Q?QmLUxTrUkN1/RWYBQ2kGhIoixR5aARfVc3gVygQLgkU2V8VtLmHQUcoOzyq/?=
 =?us-ascii?Q?OpdNciG/yoEcolDLE1esrTeh8WzdvN2/lBSk0FFNSFaVaQ1YA+1iDZS1Ai4I?=
 =?us-ascii?Q?SorNy/AA0DdyE1pGfF1Hp8x6NCTyhXmCTB76N4yDipF9jy+d7RTCHH98Ex4t?=
 =?us-ascii?Q?Zpe7JbMdgQO9njnGLsanCyjfPuPhzgzBhbl51SE0ziOsotw+Oo4+GRGKjJCN?=
 =?us-ascii?Q?1/XtmsdqYu+7nX0A6oV4fAbtPywNowOc0T48m2N+87FZPRChT8D9mF/noC+S?=
 =?us-ascii?Q?FqcJx2A5BQFxxBmGCy04VyZybBQxd8BEnuq603H/pAu/hRPyOzodNyC4RSaM?=
 =?us-ascii?Q?gZ2Rl4NogRNVFvNRy327gutl51zqciiLatt5yPBtHy99ehdo7fiyN99z/Nyg?=
 =?us-ascii?Q?BZEJe/7fHIC8K9MkiTn/jUcqU7vJnn6MSQYQwJNXE+DVi1xsxvwz61JBVmjx?=
 =?us-ascii?Q?TTGX4LRQTOBTUArWVRCh7Zg8EXobBglz141S2E0QHJKinEAnfs5fOrHH5fmE?=
 =?us-ascii?Q?pU5JIjf/4wlkklRuWOsPI39Q5zOZs4MZOmZiOS7YoecLLz4S8sUhEPAYMzNd?=
 =?us-ascii?Q?6Srq6OL0YHApucxpcsoQKXMN1+hZUTfxYpVE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fRjw9xyLl/wwxys5d/r6yY4mtFju4x6CzvKpZNUit6b5Js/P1RJRlHRr8KUC?=
 =?us-ascii?Q?sIjWwfheFS4o0cfGjDjwxR2S0DiO5/MrqcSWf8LnOGC0MmB6NJ6qFm3NzlkR?=
 =?us-ascii?Q?GDxrNWnbo595Ze2S1Lczh7q+OQmjtW4UETkRsTMTU58Kyy8ZrZ11duyzQLsB?=
 =?us-ascii?Q?YHUBt6N0sFFuhhhNrJKjJy+7UvSxhV1iIHAF+x4ZSilAtZK7lYo/+N/ZE1Yo?=
 =?us-ascii?Q?/8dQUtnmtHNBkgBd2WOqFZYQVHbrntHjlZq9tvncJl9nTUNbkhO6Mzz3BWdu?=
 =?us-ascii?Q?xmEMfLqIhbL2ZKx3ucBfU4aV5jf/JUazsRL7QP2lxBXvA7kSo4C2PVtBdMrY?=
 =?us-ascii?Q?sDh2nhIlw+fP8Jv2biRbwiEHQmuEDmBb23QInxmM45rpgAVaKD4eJjWAhHZ7?=
 =?us-ascii?Q?YDzXDWPz8cPwp/05lhI0QKdkHKr2WGxtBia2Wiov6PerzJGimq4V1TgRv2wj?=
 =?us-ascii?Q?1BAnKSlKan8hnp3XdZ1k30jnug8qVihIIrp+UbnhxsmjR/dOjflyT0iKUlm7?=
 =?us-ascii?Q?Q/jU/og4Lf8eqoOlqcM99oIwDnw7dsTZoWOfPuyvTbom+uKbZsIxkZ+9sU60?=
 =?us-ascii?Q?cQHWHkF3YGlqOBNEpUIH06yEsEWZwHJ5WoAwUem42H3H9h1uN8zwWp3y88BT?=
 =?us-ascii?Q?9YKW9ChkEOUcyFTNim0ltc9QP3iIB1xv7dwIm/Ql5fvAQUiAqlK3j6YeekEk?=
 =?us-ascii?Q?NyZIA2PrOvaEJAqtJKWoDfm8MwoeGRHePH3nW+3pNJqS5FGBiFcUkqQ+Xvjc?=
 =?us-ascii?Q?xCyb521MiPNW53GP5+UD7A8rU941Iy4gE1bpVhzWrIWHs194GqV3aeLa1M91?=
 =?us-ascii?Q?XzSrT1RIRrz/l6dvuzrJd7leyP1nLnrXaY/6RUNnfKm+KK5aDRp2jhMV+efK?=
 =?us-ascii?Q?TLywWseeHskGjAhULELpBAl2cjIEMGlaSNE/QeSzYm6nTylyBF9f4onozi94?=
 =?us-ascii?Q?Jf1iTMgyPoLI3Js1fIFDhvoGMj1msdYGksQTEP4I4QWg/ep6vOtKTNjiX+bR?=
 =?us-ascii?Q?fmQ0lhaOF4rWVkhjd3hQ1jPxDfDW4gAGA7yVn5S1rFOUKDSE0Fx6bkXiXGlH?=
 =?us-ascii?Q?D7HmLv1tXi7pon15EANAdYCNSIfGDUVGaiKLRBpGt3PgIo9yCGrmvI8vhn4I?=
 =?us-ascii?Q?/rHA1eRTvh2zUdP2CWQLUAq8/bBriJ2C6HZX/6vrRGkzJBDKgZfmtcARjc6I?=
 =?us-ascii?Q?v8B0pU0zrqx671dz0yW7DKtKgogQxI2yO44OY2iafkmU0EzAb0esLq6gdDrT?=
 =?us-ascii?Q?XocxdoPA+PRVYeO3cCdKzjCl2FPsv5A4hCQJO/8tkjnc4LMT1GtLGVn00YJP?=
 =?us-ascii?Q?hz7AmS2Wx9pO79g8dIzYGkvWssXqpLRrsYKstKc7H+y0FOQNFxX+S3bZTJA9?=
 =?us-ascii?Q?ArtcxpQuT/saXdG4n9yetpbGfrPyZHcVhvlpNccQph60rEj+Q8mAuSGVUdrz?=
 =?us-ascii?Q?Wt2REjPlsMA3cZ+P4JnMbzlurqDvAcHJtZ2lpg++8LGyRXpYW8DJUzrf3WwM?=
 =?us-ascii?Q?OYv7gkBRKjTYrVP6NwRXEeUnsDLbfiYIGxEeiGWvP371FPZJd/4/brhDgsRi?=
 =?us-ascii?Q?rL4OnhiatBSPWnM8SjnH2TpfLGY7n1AHPvhnkYOY66rtOVuQGxZUNthTXBhl?=
 =?us-ascii?Q?3h40/6QfbWiDRDtV+bcOY2M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b13fcb-7a5d-405c-c93a-08de20ba76e7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:37:16.5304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pX3HriO96sO9ztItIaHJr2BytNzLTv72BU4X7D1G7uOSlq79MJ3ya8XA27sy3w8GbHgj9/KhB8H1Odpk6X4ptbszjUH++KrK1W6hYrok4NRuY5hgCZwLkrzk33QBHVBN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15789

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
 sound/soc/ti/omap3pandora.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/sound/soc/ti/omap3pandora.c b/sound/soc/ti/omap3pandora.c
index 808fb6765c05f..f11b1d8a1306c 100644
--- a/sound/soc/ti/omap3pandora.c
+++ b/sound/soc/ti/omap3pandora.c
@@ -71,9 +71,11 @@ static int omap3pandora_dac_event(struct snd_soc_dapm_widget *w,
 	 * VCC power on/off and /PD pin high/low
 	 */
 	if (SND_SOC_DAPM_EVENT_ON(event)) {
+		struct device *dev = snd_soc_dapm_to_dev(w->dapm);
+
 		ret = regulator_enable(omap3pandora_dac_reg);
 		if (ret) {
-			dev_err(w->dapm->dev, "Failed to power DAC: %d\n", ret);
+			dev_err(dev, "Failed to power DAC: %d\n", ret);
 			return ret;
 		}
 		mdelay(1);
@@ -139,32 +141,32 @@ static const struct snd_soc_dapm_route omap3pandora_map[] = {
 
 static int omap3pandora_out_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dapm_context *dapm = &rtd->card->dapm;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(rtd->card);
 
 	/* All TWL4030 output pins are floating */
-	snd_soc_dapm_nc_pin(dapm, "EARPIECE");
-	snd_soc_dapm_nc_pin(dapm, "PREDRIVEL");
-	snd_soc_dapm_nc_pin(dapm, "PREDRIVER");
-	snd_soc_dapm_nc_pin(dapm, "HSOL");
-	snd_soc_dapm_nc_pin(dapm, "HSOR");
-	snd_soc_dapm_nc_pin(dapm, "CARKITL");
-	snd_soc_dapm_nc_pin(dapm, "CARKITR");
-	snd_soc_dapm_nc_pin(dapm, "HFL");
-	snd_soc_dapm_nc_pin(dapm, "HFR");
-	snd_soc_dapm_nc_pin(dapm, "VIBRA");
+	snd_soc_dapm_disable_pin(dapm, "EARPIECE");
+	snd_soc_dapm_disable_pin(dapm, "PREDRIVEL");
+	snd_soc_dapm_disable_pin(dapm, "PREDRIVER");
+	snd_soc_dapm_disable_pin(dapm, "HSOL");
+	snd_soc_dapm_disable_pin(dapm, "HSOR");
+	snd_soc_dapm_disable_pin(dapm, "CARKITL");
+	snd_soc_dapm_disable_pin(dapm, "CARKITR");
+	snd_soc_dapm_disable_pin(dapm, "HFL");
+	snd_soc_dapm_disable_pin(dapm, "HFR");
+	snd_soc_dapm_disable_pin(dapm, "VIBRA");
 
 	return 0;
 }
 
 static int omap3pandora_in_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dapm_context *dapm = &rtd->card->dapm;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(rtd->card);
 
 	/* Not comnnected */
-	snd_soc_dapm_nc_pin(dapm, "HSMIC");
-	snd_soc_dapm_nc_pin(dapm, "CARKITMIC");
-	snd_soc_dapm_nc_pin(dapm, "DIGIMIC0");
-	snd_soc_dapm_nc_pin(dapm, "DIGIMIC1");
+	snd_soc_dapm_disable_pin(dapm, "HSMIC");
+	snd_soc_dapm_disable_pin(dapm, "CARKITMIC");
+	snd_soc_dapm_disable_pin(dapm, "DIGIMIC0");
+	snd_soc_dapm_disable_pin(dapm, "DIGIMIC1");
 
 	return 0;
 }
-- 
2.43.0

