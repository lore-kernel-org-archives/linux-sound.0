Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010030.outbound.protection.outlook.com [52.101.229.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F70E1514E4
	for <linux-sound@vger.kernel.org>; Tue, 26 Aug 2025 06:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756189330; cv=fail; b=GmfsB/UHloh4vrDv2OKdrchl1jwXcB9MF1bFtWbOKLQS6799n7iGi0j2IPxERCw0dh8Cl+zrGzZ5YkkAg+x4dF0KBxJlIwJ4X377x9XIW0HHQApAXWQU/8d63CrS0QcL/Wza9zOizt2OPA8ta73JXCFNuQ7CBb7WvmT9YlhROHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756189330; c=relaxed/simple;
	bh=WbLhQyhPr3ZKZn8f7GGqoy4bCRTgozyEKy7Dc5K0RB8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fKcv3ba5hyk/txo1hNLC7wOD/QywbFC7KkEM/c6wzMrxmzUPo8iRgcFX1QvN6VBLR2sxY7iaVTI16GFKyrEsIuTnuItjOw/AtiIHcGh4asRexF40LdGEo9UCXqWwbl90QDKPHtMm9aSNW8y23rfssGtf0LhEAZb4vM8t+8+8IqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Vb0hCroV; arc=fail smtp.client-ip=52.101.229.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Vb0hCroV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=USc1DP/dVRRgPicY/UGuUZxDF7U4X/xeLiLZB2gs6KSfpqAk7cuSJ72wv5maBNJ/+SetAoEDuYumTKcpA7KerJGtd0OPvDBj3LyQ0voo93dGaUriotp0JzveF9O3mgPGlVKKSy3UQiXQd1dEvfmyVrLGJ2qZOgjf3NjQzt2TLk7CuuMqvUkrpY+hFZ6PMl/EsueZyh2tBxQljc5/lv852dqMpDr1I0IKeTec9Wqxn4FJYl6PBz/20snJIEVmZVja/4rJT1w0tCR5GzESlKPaNPrh1P6s+b/40T/M/2x1+ngHh89V189kvmcW/1uD+Sa2AbVRhV/mkzA7mzpzazrOrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBhAY3EXt4/nNqC1pBi00+hbBTND+nsq+Nr5XbpGbUo=;
 b=j2Nr97HzZUducqoLT/FJlaZJtSQIHMwPmlmILFZ136sNfloggfVC+dzHspRHEtRe8D0K3qdzw907LWWcxl8bR6BJNec51s/0CPoICsMI6E1lzIGhEvwXqAZ/nFxr4ssveiXJIdWfgZaFIc4VrCno3uKX4d3uvpT+8bPtOypfxr0tfAFajtyPm6hV9b065S2l4EpcdipRe2p8utkT2TNmwfoFXzO1ydfXBY17B6hTCjj4I+wL7xeGoDaMUikdGjUjeFTfJvh3FlChq/fEzdFifCmFW3DGJFsejIMdczRZp+Q28Iv8hzCADYyhpSIkfRFGgFH9CcrkrzJx9G7MM8hJ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBhAY3EXt4/nNqC1pBi00+hbBTND+nsq+Nr5XbpGbUo=;
 b=Vb0hCroV2YHWf9kwyvHqSqL8CY8mFd1NydpfZ4xP6mBr973nsKzZvAK2A+SmK2p6IQBuYyogm9/shCRN8mHezEtllfH/vOrOBhALdvm13rkh6m0CaG8v4HUxK2Ql2SCDp16qVdMNO625w1cQFyrw6IJL1saSfpmIK8ph3viqvc8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB17440.jpnprd01.prod.outlook.com
 (2603:1096:405:354::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 06:22:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 06:22:05 +0000
Message-ID: <875xeay54j.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/4] ASoC: soc-dapm: rename snd_soc_dapm_kcontrol_widget() to snd_soc_dapm_kcontrol_to_widget()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <877byqy54y.wl-kuninori.morimoto.gx@renesas.com>
References: <877byqy54y.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Aug 2025 06:22:05 +0000
X-ClientProxiedBy: TYCP286CA0219.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB17440:EE_
X-MS-Office365-Filtering-Correlation-Id: ddef648e-84ad-4db3-230b-08dde468e0b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NEZE0iyeApRsvj97KcFMmpo2I8upB0tHY1wf0i5DgHxWF16+87uY81K2X69W?=
 =?us-ascii?Q?cW3WjbJuNJLJYcP/6491xcDTs0HL6jb+c9ZiJU069OCUyBfmBFjQKhhkZrEE?=
 =?us-ascii?Q?Vo7zpayRrI2UYX9D91/aWfYWCCBHxP8sC0dYGn/G2ZMdeRskBMDC3gEcXyan?=
 =?us-ascii?Q?dhgHYm3x7hwPMEM9iA6H4i/sOkOyxxnPRXZT454VYx2gndwLIFP+S4UNc2EJ?=
 =?us-ascii?Q?EBeWXYtb72AWzmApjjZTcdZYHE38G7D45qQoRqPB4dIYQVkFg6s2v4iCWFJE?=
 =?us-ascii?Q?WlFqxwcu4bzUke4jvXc9ukWsSscY8qZ+OVsrZCenzenBhRw0zf9LCfTzQhh/?=
 =?us-ascii?Q?SG3sJdLvjD7LIzaqIdvzL5cHgv7uEYMDN7IWHBkHjVG30iBHCJQ2ye4NRUTT?=
 =?us-ascii?Q?ueqp19DELlIGqW3WKt4ECfM7hhQ61KDgvF9zF4+90cDFqPpXtGe6FG+dqn/G?=
 =?us-ascii?Q?V8DLHMa1tKIgISKRU2eJQRjEWaG8JQRkUF2pykE3lOyloawKfxFBoFNBR6d4?=
 =?us-ascii?Q?L9v7nWke1prWQDHn0yzgvxpZ/73+jdBH7hCuaoVArJfYphl7QKRNQvTZfPgR?=
 =?us-ascii?Q?RTVtF2ga1CZqiJTQTJob7K/h8wP3KxwG61eg35tBfiQOyFoHyBqMhN+eu6wD?=
 =?us-ascii?Q?G0c98q90uO6ooykNhW7H8XrznAClE4e2ruCkeBXpKc58/A3YHJor/rOStV+Z?=
 =?us-ascii?Q?/qpq3OenCqEXgLtZBi8nAAv36ZpecOXgFQFuhwR6FKapVgyNWLgot6PgIij5?=
 =?us-ascii?Q?N2Q4a3dTEBO8tI0uVPukpoomF6CEN7I7Yh1/hzdmrkq4FhtRINC/hKNWfivG?=
 =?us-ascii?Q?n5B758SLgMjT2ZELKw60Fq7d5bNIthwZ9uYWdB5mVwsE8JcP8zj3qiek40r6?=
 =?us-ascii?Q?0ZbX2vzd53N2ddA8Mp/P5jRJiETQXY+qAN8Dy7YHf8L5T6M1NsYsRNRvVpM2?=
 =?us-ascii?Q?mvQzLymbaHTfwlGE6sFCKS6BNa/FHWqJ1oMCW3Nhv2wtZ+gFSGHC9GjQCi72?=
 =?us-ascii?Q?OVJrvyK+oV087bmegqnKMguI4wZuBfuPP4AJWwDnOr6WT/qFzBMezaIEO2+U?=
 =?us-ascii?Q?fDLl3YhUdObyOm1LTXlPclkr0SrEs2WmsNkansKzuowQ4Izw1hT2AFnjAeYs?=
 =?us-ascii?Q?ECBvLB4XFadNnVdhxzrILlshLE336IMjXeGwYic8pPsXPs3BtPmGYUDePylu?=
 =?us-ascii?Q?nfiYtMn7VEV4Ad6H+hECYyihJ/0+XO3KjmFFuLAH7vd18vaPBsBseTzhMarg?=
 =?us-ascii?Q?SXNLAcKzgs2WeFWozIgnhTfw5KYq1/KipbkY7n0AN/Azu+xGilh7QuSm02qg?=
 =?us-ascii?Q?qZvVWlcFg3CkxwWz9Oap+Q/el+eUOgIvEniNuxIkYtSzELNATcQb9GkceiRI?=
 =?us-ascii?Q?rUS4YK8E/I5Dud4Gv4otiMDuBGE/rJ6ydU2dMM3CGE90YeCIeRzKubeZwaoq?=
 =?us-ascii?Q?4dlMPq1fOfzN7Qvo8AmRc3uvhKFumZcGbOwui4Z2cBQFx0/yfmLthg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TwxBRMLp4FjVhH0bhjD1S+9WEIkRvCZ1f286a/li/MpdXL7AqhhRJObxY6gA?=
 =?us-ascii?Q?vt28s1uY3iAA0a5720BMGtslPC+tDWWEMKbR7L/8PZfN8cOKEoCo6CWc+lBK?=
 =?us-ascii?Q?Bdo0cFRnIOwBcZW5qfPK2vbqPWdw69crBi0qaEl8ymCtpWSebzuqooXpoweJ?=
 =?us-ascii?Q?u33FAMomG51BQIXuPPzurak1HKesJbTkYVC7MTQxk9ETUUYBq7uyaM5ZxnWh?=
 =?us-ascii?Q?PHrX++KgA64ZncYvvSwgWjKtOfybFpJgGCeE7M6mIGRnnZfRW5wxtnHuVC+v?=
 =?us-ascii?Q?32VGvfin8c0M8s5Nc1D5gHS2tYnYiviiScSix+HC9QAXCKGq9aBZ05FtJRxC?=
 =?us-ascii?Q?OQTAi1QI+bGe4utcO3/ZBK4aV7JOqvkO975hGzd8MatlUc6N4mwwbgLMs/zU?=
 =?us-ascii?Q?EM4gTYqQ/qmVI+PWAfETs0Z5mZXF4UPxqCzeVk1TlM4n6v1FouRdanf4Dq5C?=
 =?us-ascii?Q?1tZKjmDpXT5H33l+nhRF3yesbLSO6Op2D/47dtCjgVronEsVFcOGY9ouhpT/?=
 =?us-ascii?Q?rYPdRUob6Ufk8KAc3Qq7vWfse57raV15bgOI+E9oDwjmDU1lX4MO1yQvCoiJ?=
 =?us-ascii?Q?N3VciHOMVV1Y+kgdbz7Na8wwWXCQPVuJb+x0+DtDp/8T3doFv+AxYPxHbhF+?=
 =?us-ascii?Q?UP237XtTcvFITcbPeshZ24SQ+CMHVHn3SfMtt4Sm4lZjPyfmMBhImd8ySdbT?=
 =?us-ascii?Q?7s3C4f5HXxw6SxIVlHNCZe9g+/wmin6EgW6jF5t4GgDCXpH5Ihalzz5YutUJ?=
 =?us-ascii?Q?4vHgcUftUgtk/A8vQV3+RMeeEjIOI0eV4jrO/0EfyQPW2YMnoUQXM6VgQT/a?=
 =?us-ascii?Q?xXVdvvekU2KD2xp/hUlFL4LGKSBBvkxwPvgsvQErJsbqdiUg54eQhTvg4Twf?=
 =?us-ascii?Q?ybzSNSiHs8PkFfMAQcxnKqg5Ih6y0XclrwezE0FKHMIUFU3A51Fp4BgxlKMy?=
 =?us-ascii?Q?UP6JOu46iPzD9i+IDR0NM4QGW0HT4+H/tvBo6VIIRcJcmchh69gRuYbaepUC?=
 =?us-ascii?Q?tEtmz/waJ+jkunq77iNz3h36rMd36f1rG+d/dtyKRr5176eQUupZtMnOXXTc?=
 =?us-ascii?Q?PaoC8qzGn0sErJ8bL2dZTG4na20qNd1nE5569a1z38TbL/cvpvK+InNp7nYB?=
 =?us-ascii?Q?rl0MuZcWWOQLU/ux/ydj8KymoP5F1cDW/NpgTAnwdt5R3zQsdUYDHGyQJrna?=
 =?us-ascii?Q?MUC8FXH25uyw+LgIAPLmBdcSOgKggU2czA1EbqO9C87OisfYCxTIZ8LhJJnp?=
 =?us-ascii?Q?JfZTtqy1TqZ9zMu3TILvLkgnZgQxkw5s2xGbwqJhSg8+SHsXKpRuPLBiaTpu?=
 =?us-ascii?Q?8HRhisupC2stvhFantfQLnM7J4pcfFTPYLDK/vXa59uzkngMEGWq7r5SBDMg?=
 =?us-ascii?Q?INmPZqIKOsIDLHQto2HWGa7wP7oOOpZ3Agn9J8DJ231WSYWEaii8U3rKu/E9?=
 =?us-ascii?Q?c5mTE6PZ27c2+beYvqUG/kO/ZswApT6xA1RXvZaq0FrtmDGRhHmTsgc9RQP5?=
 =?us-ascii?Q?Li3N72Nr847/z9g4vNOcwoJF1uo1X/V6YP+RfkHbD1C2a2ZLZghNQ0O43qBG?=
 =?us-ascii?Q?8Zzg/q/VjnRzo98j2Q7TTX6wP6YNaxUCMO9CHo1hENDwM3s9re+e/LutcEOc?=
 =?us-ascii?Q?4kBl/rnbb94oOndGUZ4S6FM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddef648e-84ad-4db3-230b-08dde468e0b4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 06:22:05.7143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6lkCcxrS71wCF0F413shyAFtcQMOPU3fUe0P/7ihUEQvQxALySkoRK6R5yrEyYWIKWrCcBCAt0Dv0Pl34s4tVKGrJizMJbRs/wx9dhno0DIHotryfzZ7Mw0q5Y4V+23P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17440

snd_soc_dapm_kcontrol_widget() is unclear naming, rename it to
snd_soc_dapm_kcontrol_to_widget(). This is prepare for dapm cleanup.

This patch keeps compatible by using define, but old name will be replaced
on each drivers and removed from ASoC in the future.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 3 ++-
 sound/soc/soc-dapm.c     | 7 +++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 2e9196b6ffba1..220eb6d08534a 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -719,7 +719,7 @@ int snd_soc_dapm_dai_get_connected_widgets(struct snd_soc_dai *dai, int stream,
 void snd_soc_dapm_dai_free_widgets(struct snd_soc_dapm_widget_list **list);
 
 struct snd_soc_dapm_context *snd_soc_dapm_kcontrol_dapm(struct snd_kcontrol *kcontrol);
-struct snd_soc_dapm_widget *snd_soc_dapm_kcontrol_widget(struct snd_kcontrol *kcontrol);
+struct snd_soc_dapm_widget *snd_soc_dapm_kcontrol_to_widget(struct snd_kcontrol *kcontrol);
 
 int snd_soc_dapm_force_bias_level(struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level);
 enum snd_soc_bias_level snd_soc_dapm_get_bias_level(struct snd_soc_dapm_context *dapm);
@@ -729,6 +729,7 @@ void snd_soc_dapm_init_bias_level(struct snd_soc_dapm_context *dapm, enum snd_so
 #define snd_soc_component_force_bias_level(c, l)	snd_soc_dapm_force_bias_level(&(c)->dapm, l)
 #define snd_soc_component_get_bias_level(c)		snd_soc_dapm_get_bias_level(&(c)->dapm)
 #define snd_soc_component_init_bias_level(c, l)		snd_soc_dapm_init_bias_level(&(c)->dapm, l)
+#define snd_soc_dapm_kcontrol_widget			snd_soc_dapm_kcontrol_to_widget
 
 #define for_each_dapm_widgets(list, i, widget)				\
 	for ((i) = 0;							\
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 6782a0d6cd477..bfb2edc2f91de 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -877,16 +877,15 @@ static bool dapm_kcontrol_set_value(const struct snd_kcontrol *kcontrol,
 }
 
 /**
- * snd_soc_dapm_kcontrol_widget() - Returns the widget associated to a
+ * snd_soc_dapm_kcontrol_to_widget() - Returns the widget associated to a
  *   kcontrol
  * @kcontrol: The kcontrol
  */
-struct snd_soc_dapm_widget *snd_soc_dapm_kcontrol_widget(
-				struct snd_kcontrol *kcontrol)
+struct snd_soc_dapm_widget *snd_soc_dapm_kcontrol_to_widget(struct snd_kcontrol *kcontrol)
 {
 	return dapm_kcontrol_get_wlist(kcontrol)->widgets[0];
 }
-EXPORT_SYMBOL_GPL(snd_soc_dapm_kcontrol_widget);
+EXPORT_SYMBOL_GPL(snd_soc_dapm_kcontrol_to_widget);
 
 /**
  * snd_soc_dapm_kcontrol_dapm() - Returns the dapm context associated to a
-- 
2.43.0

