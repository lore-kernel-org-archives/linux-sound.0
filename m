Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010047.outbound.protection.outlook.com [52.101.229.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC80681ACD
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 01:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398016; cv=fail; b=rwEHZ3Xep/T2AfG9i2Dyrq29sPWNE9S8mTfoxuv62gYiDNMJCN2rtTOahhlLxFKlRkq9bM6jE0sZfHB8BgLVKyWbFkF+Bny0T6SH8WKhEIn3MEAR2/zbEHD3gq0wdrK4SwG8dvShQeIGmj2UvBmXE0xUaxkjId5HSXlhpSuYdsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398016; c=relaxed/simple;
	bh=I1oncPTGkxfMKhCaTr5PPq/1AOCB3+OpQKvBezpe/IM=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tcB3Y79gFYzFvbOOwmDvPbstLDmM7LzBhiPZ4SO5hyCtfytg5qVr0iDYFBnmyh/HglI7K9aR9hM9gpvs0bClX+CBfjVuxzTOMmXiggIh9uoEwoiVvHNlJJYdvIdoDk97sLo4xnJad11+pV8fto0fUeKHbj8BXnCa2A9zw0IY+LQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=azEbdi2w; arc=fail smtp.client-ip=52.101.229.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="azEbdi2w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqEyTvuv8Y0c8WzheBsnsg0a8m2CW6LqWKNi5LMOG/Mzh8MWDykcj4foGPsSvITH7UR5eskf2yXDbHyNGMDslS/HTNcbN5ER+/3VbzN3Wgtri9aOKgQ8nXMKYKovobAoTr90LqNoG6Yhxxlq4JiEI4WtgVm4ejuIlGwznws1knHNVunVzm0pr9S1N6GFF6Y1xN1tzF4xsNad6hCCdtE5xGcfRV/GT56D4MkCW3dzx1sbW2vpbt6Xz1DvhhlbjA9sKvs9uLJG4Dydpm+zWCkqzqNTNFjG9gryaxyQFeYkcQuTHw2BW3gLkaBBWAIyihNZ/Mzm93EjOQVvJPY+nvW86w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FliU0JKKv16Z0ZHp1Q0ZtCgvuqzoTMX/tYgaOjHj+RU=;
 b=eDglWON+pL+2aelXRvx8cnMicnfARDihDB3NuIsx8wYda9kKRmZ6DvJH8TYiY8f2tZrSKqcxk04U/leA1eJTmJfAfUh4UV3gdQ/L2eMljFS9cxtWAbh+6p4qRgXmeFrCRITFCQmefZHspM9XytOg9F3gWsjMqC5vH7WilFl5lrr5mVMcoW/vxEIgNdAEhbqlXy2QpMgNPxKGd7Kc361w/P0KrWFZyngfYU96g/c6kYe2/4A3kzLVTiY8lI1LFmcffK6SPr7iGsFKkAZY8CRcwxOJI/bCsXjm6N/FGhyNYGci1xg9yo6yjdNpX5MII0tgt5yki/I9Db3tYS1ZyL7iJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FliU0JKKv16Z0ZHp1Q0ZtCgvuqzoTMX/tYgaOjHj+RU=;
 b=azEbdi2wtvZBN2WqX9YLD8mYuYpv0AxrS9soy13E6jjwY1d1c5UUDkG0rZKxHauh2EyO9IRONVANgYMTfSZgTTwSxn/NZNJbL2QcF1ityTc6HQiz4zfK8xCbSeg3jvC8QbxhgU3d8fE4jPniVGxG/+ZNNJ4Czgw1papD1lTjiDI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY4PR01MB17164.jpnprd01.prod.outlook.com
 (2603:1096:405:367::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 01:13:32 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:13:32 +0000
Message-ID: <87y0djyw5g.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Tim Bird <tim.bird@sony.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 01/21] ASoC: dwc: use .auto_selectable_formats
In-Reply-To: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
References: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 3 Sep 2026 01:13:31 +0000
X-ClientProxiedBy: TYCP286CA0099.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::17) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY4PR01MB17164:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c2e84fa-ec1f-49e0-1847-08df095891e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|6133799003|56012099006|10067099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	q1ahLZ5UQX+aKv3wB6pmLyKlgEpJPcVSWyuujr1ki4MAXW8qfVBhjXgXQYw37QZc220czD50suaJJAqAVR0jgw23yMNn7vmFcdA7GkxtGXE9zLAV0uEoq9KdfTyVauoUwly/5AczMM7pbmopFs332spKZNEY0bK7kyGtOxjMVwken8jgvv1ZTPB+qbTqG4+H6rlry7CbLQKwtIRjZnpacPHSZKymBivjNHjaXOdKdEwKGD46SgyNyR+E7QKPdNEW57Pheoes5woU46QS1kw/8ODkx+EZPuKWdHC8v/3NQ9z0dsobaaQn+RNLxzwcCFvDYNP83Z3TKV/yLyzqXuCT7rH3n079KE8810IJ4K0VrkmPXjKxAK/4Qp/YYwBYoTxLD+VL7m6p2zunzcOoL1DaufyA51be5nK9hpbj7r9S8q+yCYfwcD9IfNWiCKCkmV01w1qPvL7N0zrqrTunj5j9dXRHdHmsrYTU4Qrl2Rq6zlNURKbJf5QLOqed29wfmvskUwaAbLmlzRyAyKcYM2avbpjTo/cC2Uo2/wBzN+5TP4Li0+PztsCdBrqAuKlOKB+DwdtTEJE2Onr4bzX1V80v3kGaa/47QUXWK9EhG3Cn8jDtHHR82CBBmW0I7/x0j9LHhkgzDQUd/hkdUbYUq9lmgN1aruQidpGGf/crJ43J0dtWtH7INLdB1ffzTbqxUSv9cjpZWbGneg9MvVo3UbAvx2DH9AVahJJkmOzq0oOhhW4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b3W8QOG6/v5BPwoSXwbYDA9Ubs0GG/4qt5S4+MD9iw2OSV7Nru4CfRTyy59I?=
 =?us-ascii?Q?A0Y56WnGuEJapmycVPDUEbyaKl6+PKNwVkJmlelfcHVMDZCneRP4Nq7dFC8L?=
 =?us-ascii?Q?WKt4L9ra2e7l23avMVQtBP+lWqEl0LVNXYYeTcjHYzcekml/r6iDAS8gW7on?=
 =?us-ascii?Q?6Ijc46pAOTlCnR3onS99bA/p7uGZ9m7aAzKO7Ts6QJTYqae78Rrnh/Qro2dI?=
 =?us-ascii?Q?R2aGsVTZgwPBJz/veXzqWLPNohJe2jusIhcwRKXWpPw6mgbvJuA+OkQslELE?=
 =?us-ascii?Q?R/R7tYtcqo2LBiqc2xWxybogBBBsZ9QEfHdjVLCD8RGZuUnNy5ObnQQmeRDP?=
 =?us-ascii?Q?7G4klTSnFjFvaTnaK0XPzfoX9VL7FHkR+eNp0FXGVbRL8SwCB14E0051Ui5B?=
 =?us-ascii?Q?TpPW0rcMyG8OL8JDWWgHLHHuS7dR1dydEgtQ7XRZnPPkX9BUTv9M9/RjYXP/?=
 =?us-ascii?Q?rbh+7OjGtUrtuvMmisJaWbDxVuy642IBQlsq97Q6agSRQGiItSObg11wCdXc?=
 =?us-ascii?Q?aR0FWl8fM1Me2Ym/HVTyXzvSQrBmzg+1KpqaBZFXRT8PWno4kNs1w/oORZeD?=
 =?us-ascii?Q?IKpHAIssAHSQHmTSDCW1BcH2tOyG0CTFTgFPJF5zcKv5uXBNS36XR7rS+kVd?=
 =?us-ascii?Q?gxOxxA8ZgWPuzTH30kY6mZPeiozlaPtGsATIUVtYFF5yJaqDOsR3QeMCzYZn?=
 =?us-ascii?Q?Gtcx0kXDTuJg8s1ukR678jcUHsny3TXFPIdbQBX0aFSD5OUy2ZMiOsIpTWnI?=
 =?us-ascii?Q?GUrX5LPbdsds8uLoW5VzHF6HidlHew5qhzciky4HOfnVA/gXz+SuUUMxvJqS?=
 =?us-ascii?Q?nFSkAhXd1P7Q8VZ57vRcG05FZHrH+RCR/BOuVCC4lTEoS0i5R6gLJglfeBFP?=
 =?us-ascii?Q?fHpR483xB3BgehGL/txF3yzG7tPNyM3GwCYgjRTMNC5Q9GYV95sVllsigo9D?=
 =?us-ascii?Q?SCKP3Y5KgDwPD997iJr+3kmdeHmMED7MuQ1/aei67Rj917Hz5dl35OX4BTOo?=
 =?us-ascii?Q?7L1UC9o7VUsdX17n6Y4CYPiBeK9bBuc/MfudENDxIrs5K/DnXdCAJ2ssHF4v?=
 =?us-ascii?Q?po3IKuPs8+BfqAUYMlePFAC6TTt5inUGXny+9bZOke5BtvqSTJqy7Ck3YiDp?=
 =?us-ascii?Q?xiPWRoxhh87DMG9YTXP2ByDYZo7+wMKNjvkOUfTeF1F58Vhyl80On50KELWc?=
 =?us-ascii?Q?IJA1Ln2aPW6hegI41Mxk0uOfXmNhYbUCg1pCitlWozpT1LjeaCihMGcShaAC?=
 =?us-ascii?Q?qFFJPPWoHe0LzkcflhACTAGfOBCPeATn2aL7N3NRVdWnTHlWbEVmS7pp9RzQ?=
 =?us-ascii?Q?vDD3Ua4uIBtjtAeIvFZUZA/44VF02NoZ5WElIJjKYLek40L5IQ5ESKtkQa2M?=
 =?us-ascii?Q?Qjin44i086fW6AKKtzVz88mTVtN2TGSqJryytGX51XmBdPD19MUahOIwyxAo?=
 =?us-ascii?Q?//a0hKnxVkfSvmcYAmuJpCj36oQ9bMbBeteOunf2Lh6uemxn4+0MvdpolAkD?=
 =?us-ascii?Q?RR2Ry3+d8mebdgJdhWHTmxWjPsNzsdyGyyYH8c4JPJTaxH5GfkfjGrmh+/IH?=
 =?us-ascii?Q?0VEZ0yIEHuWxiFjLnQ5Uj9IkqTOZ4kqC18YWuQpX82rr3p3lNftKJATYiw+l?=
 =?us-ascii?Q?lca/W07xdyLR0lGSVA5JWXIH0GRjGxP1xycWVw53a31qFnRSf8V/2nR8/z8m?=
 =?us-ascii?Q?ZA12g0PzxR8IEcN1cwzygCHjD1zaEmOwyhwrzsh9LUXyC1NJIL69fPv/b5AD?=
 =?us-ascii?Q?ia3JmR6z2FPzeFgxXgOao/X3uui/Kz6I7CiBcmKWg5EdDxnIL3gP?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c2e84fa-ec1f-49e0-1847-08df095891e7
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 01:13:32.0585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZL1vTS0wAMIcrbLDq7y3ioFCxmu5ECDA11juW7Fb84UgggpjFUr923TblIItfAgMXFPhHHMN9Wq3yCEHJcfxfNJjVMGqilL1utrEEJyZs2L9WKqOFZvbbaIjFJbNTYm8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17164

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/dwc/dwc-i2s.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 2e9fb79b1cd8b..ade89c196a798 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -464,6 +464,13 @@ static int dw_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 dw_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops dw_i2s_dai_ops = {
 	.probe		= dw_i2s_dai_probe,
 	.startup	= dw_i2s_startup,
@@ -472,6 +479,8 @@ static const struct snd_soc_dai_ops dw_i2s_dai_ops = {
 	.trigger	= dw_i2s_trigger,
 	.set_fmt	= dw_i2s_set_fmt,
 	.set_tdm_slot	= dw_i2s_set_tdm_slot,
+	.auto_selectable_formats	= &dw_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static int dw_i2s_runtime_suspend(struct device *dev)
-- 
2.53.0

