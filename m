Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011071.outbound.protection.outlook.com [52.101.125.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1A61DD889
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820890; cv=fail; b=heBJNyzmIfsvWXBlO3fEROtl3mSLIKENxjAK5EXfKMIRZvc8WLKFgz2Xw13BhagkBT8rQKfL+WSyOtYbIDiHBTavcBromSX+6wnkX/8YZOarrj8In81RXDPQnHcqowc+gVAH7MywEPdOm5N6DaioL9OIb+Gk7W7QwH5N8eSHdvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820890; c=relaxed/simple;
	bh=DfQbIqelnNeO7yoZpZzJjzgBOEiAxDtH5useEkqguJ0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ithdqgfWUdA7FPv+PPVQAgNUQe/svtNQSPp4ZybVWV0HX7CfpKtkWLr7ZrFgB+G4L5wJMVK+oaXeBqNb8oN1QLnZ9YaxNxU9ikP5VJ7bKqciV6FGHs7ZP3NwtW7zimumEJXATHL63EPmGq6SxZlSR0OHWNLsAktXdWqONxsoIqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gVdcsukB; arc=fail smtp.client-ip=52.101.125.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gVdcsukB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D9OJEGxR5AlH6xQhOgTvho3HTKmHY7hrVTht62NYKiSDlVf79PKuyJsqIFdKxP2eU+cKcJeca98GsQ+0mke0wzhAugp3tLERog2OyRfjocbHS4M1QHxA3gnLZTcJvmDm+9PuVdnDtzU0I+Sk/xO/n+fxARhA1IZiE9dwso65Ae7X4eqxC+9TS7TX4w2SUxXb4U8+ZiHz+6CSeBnUsJzr/Ngc6UGPishHUz5B7/6F4R+p8lcfbIu+7fWMRRUo2cLPWBOwsD2sijqq+vMzzKz+0SoUEYux5En0uS7XORQdn5oSn0SjaHU/BoRTD1YewSlHEOLEL86I5EFHzB4WtWrUow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0fzg3dSdIT7xHGa3+XTq412Lb67DKx8V9QIrXXLADA=;
 b=qQ9JDB7HMkdyylABB8XqP7F8bubihBIyL5P0Fzu0E0fCR9/GKdGtfFwFhdLwx7l3cLmbZXwBSyxaajFaqTkn5ncT2pOPKBa51QL1sUWhYNMuHI/kAZ+uvxTtKgMoc32rUSw6G7RwEujW3YgF0yKIR+jinJ73JTVY4vfG9XNZARY5vmEyz7hG6/q+EpEuYIbExCSCKoFp/aowxpKj0JOoSKIBdcEMs1LjzFbJJl5PkuIIILbt3tnELdd1oI4ldVp3Bkzte9xUafdaA3ecytneLNAndRYXi9IPnWW6gG6Zqzg/1qNLL3ZomB/mjqOwFYYm/5LYoVCtCHv/la4Na+1LMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0fzg3dSdIT7xHGa3+XTq412Lb67DKx8V9QIrXXLADA=;
 b=gVdcsukBoC7LzQBqFeB8xh5ANHutuXWXQBkfMQcLXTxQwVq0DuLu2E3drytD0r68zvEIplVPcAFdhdfvCAtzE4WF/OUUz8H6i/gfTjZq36H8QBuq4wrnjH8KjiweAUTMKAeOsVZqWgm+PopiLoI+LojwIHRq0YjcGJ6a65sfyrQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB12798.jpnprd01.prod.outlook.com
 (2603:1096:405:1e9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:28:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:28:06 +0000
Message-ID: <878qgd1kh6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 152/292] ASoC: codecs: wm5110: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:28:05 +0000
X-ClientProxiedBy: TY4PR01CA0098.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB12798:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ee6a8d1-b99f-4166-5a28-08de20b92ed9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aixuIaZ6woCAzCWppzpWhnTAakxXwllaSEKW2k6rPXg6YS2xG4zQBYfOqEBS?=
 =?us-ascii?Q?lLHyo27NlhsRUBPofP5xOcLuKEqJEfaZibs88NedNlEikpizmpxzH6QN2Q3s?=
 =?us-ascii?Q?61VCPebLkuO8oXeHXMFiMj7Me0RnoaoCLKWjidJM/FNOWkbB4TsYIH242qss?=
 =?us-ascii?Q?8lJKjiGWDfJksMyGX6D49wtMwJKQZf28+UlxDbgB2mJlQdBe5/jpK1UyypdZ?=
 =?us-ascii?Q?a7o4fSq1Ik18/LwGNk0ME7twcrRSfGWpzhiZ67PRlo4TdJQUJFOQOdWuft8j?=
 =?us-ascii?Q?SfGwFvSxpcZ/bCsEE6pVJcgCTLXakrLli02EtuRzQTvgPM3pglmp9y6eFRxw?=
 =?us-ascii?Q?9QSRLASiJZdWKzwH3boc5caHLK9S+1y/bWnG5hGskwZH9vM2fgL5WGGbDGvI?=
 =?us-ascii?Q?4xuwHDppq3wA/pZ4qSy5AITS9J2lPj5C/jMzkpGkjc/1ggaiMpxFMB/tFDDb?=
 =?us-ascii?Q?CxF7Ixys0gBARGBnt22rwxrUYnzNoZpEJfuwsxl+yBNJcp+6B3PkMpRmn3os?=
 =?us-ascii?Q?+rYG06/CmNQQ1s3KMhelC30QdyZbKLt9yhN7SeJ7GV0FyMWH/wFo6AkfgcZQ?=
 =?us-ascii?Q?eNjqPc79lnnPXLP8L8svDaFYdThqLkzEYRxB2D59E7vW7Nfp/gSxu+QAMn8w?=
 =?us-ascii?Q?bNLchwJnCuYHv7MELNO41UiarjGA9/ZQzk/NOwy9r2WR9WsqiNRbQapJKux5?=
 =?us-ascii?Q?RIaOl+nRTu5XD4j1LJQYvniQHdGfJCKK7WxusiDOP9TWJdszUi5+BwduJ+h0?=
 =?us-ascii?Q?Q+wCNkJkuCZutkF3Pv9eXmodQ/X9ma89lNz6R8PDeHrzsmzvhGMy6f/mWpIz?=
 =?us-ascii?Q?2mGPVKRwjx5iAQQpzcfPP5qeM/aMmCDJ7uHwZ6e0pEL9Pk1l80zS6smpXuLc?=
 =?us-ascii?Q?2JJ7uBvOiGY64y6phQNXy5k/XKDlJryvH1xKwAZDFh94QkLWBwuhrGJrXdqv?=
 =?us-ascii?Q?l3WkPTtR23lYglLNVWZpF2eQ/3ZomQWUkNR9DixhMhm91gRcmYi9QZF0p2SG?=
 =?us-ascii?Q?6t8tVJBSnEvFY2UPh4UsyxgAqH+P10RSO20XScGRqzUBe+o1Klx8vsTsjgzt?=
 =?us-ascii?Q?t8gSiu5W5dgSvwXMp+AV5WZYLtRcQElmAlI2KPR09vAp4b3LQu5wzyqQeoyg?=
 =?us-ascii?Q?TcfV6PexJhMZD26O38GW04mex4Ij0VgZ/SDqkdgAsYRZt3K2ZOEHVwQa6WDQ?=
 =?us-ascii?Q?S3j7//zfs6UXUYUruXebVxHEyj7hmpOubampCuNfkMU6gDmJ+qDq2rp727ql?=
 =?us-ascii?Q?xpWxuagCq74s8FP8p11kRjuhI9BCO9ajYLnxJFf09ovLP5wBXBuxhMlznif1?=
 =?us-ascii?Q?PlRJXYuXTQUX0a8WGADudNvlgrKula54GPJPYNlCflP+YpSBeCN6mXl+IaYL?=
 =?us-ascii?Q?BAyJJpchuL+vLB9IuDTTQrUECDNZqleA/PWrmmVDlg56mfWRVaexnMFByzMG?=
 =?us-ascii?Q?XuXwkKz82PlJtp5FJ6LT8AnaM/DbHIveQuWc5VAUpPr9zwL5wBKn+2EFe8YH?=
 =?us-ascii?Q?0QZuji2Xwm6qQ2XxKS7XasW8ehSu03L/ZcRK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mnkwhGEH4rJgYTHSEXubQnsaY1DZ6csxjjNOIjJgMrEpurxNz1fcV6LaS5Po?=
 =?us-ascii?Q?c7EuNQ4vJ+8LAAXNknVwluXNEsL96x135O/dC/zxohuP3ILDIo9Xxae23Ifc?=
 =?us-ascii?Q?XbOEutvYdGIJqEzJy0mho55IScTUVOIApheM4pmwjZ/oF4ezYSzjukIzG8nl?=
 =?us-ascii?Q?ALwmNwOo6u7xS7yJ+vQpG6y23A0oJmDq+5K+HTa+rfX4Q2OB5a7TIPNae4GJ?=
 =?us-ascii?Q?70tMuj3mNl2FCNuLZSJBBQZJKx7Fc/ahZlGHFiJv9p8rpPf14l5P7EMXp4aN?=
 =?us-ascii?Q?D9ZETnpxDFbXo1/y7yAWnyMHO6pAR+dwKjRVnJ9Fvl2J8MDXZOPBKySCmpij?=
 =?us-ascii?Q?YmLuw93x40OBF+oUfIftFwORziiIrQ7rb2jidfI5Np/piZXk2m5Q3bPoITTb?=
 =?us-ascii?Q?6vUmRXpM8Y7HKzKPR2kxPd6RkGKoihWSJKCUhlkscp/SlrEZ0Nj/eqczQQCx?=
 =?us-ascii?Q?L2ItVHQluQ4X8UTfXbrRKRr31A8nAwCoxtFRvxp2rR/wnihA3AjlyRThps0n?=
 =?us-ascii?Q?Yalkl8VJcdn8LO2/aVxj8+6wEXYGxHWRVw6qxdQo6a5PDeGwaf4WbimiU1Uf?=
 =?us-ascii?Q?x19CIr9QCFn8e2zWEbekfpKBJfmPk0p+kKSJ/G+ohJ/X99M7ZjuI7hZnW3uz?=
 =?us-ascii?Q?yMOLB2p8QUZLgY9J4v6ozaoifeAMCHx9Y7SCd5/0u/xII7fa2I86vgrdA8uv?=
 =?us-ascii?Q?3P0UaVJtxubBqu5DvlaXH6Oc5/Zd9jpuJPDBmW2m5y3/D5IBzBOK/qxHOF6f?=
 =?us-ascii?Q?XCYK0YcEWZ1i5x/Cn/ZQrd0Na7kwAmBwQoGJNbsVToNGjXYu5RrYcWHx859Y?=
 =?us-ascii?Q?bo1pdyS83ai2xnVSeEf744oHP6V1IkL983GROswIKYZk+UniUmk4sg47vhrM?=
 =?us-ascii?Q?ilyKjw8fX7p+DgiEXlJlTTpO04nYRAfi4n/zCkg7mQ4hAM4IOQj4NJQ103FB?=
 =?us-ascii?Q?AjF+hs6s1N6YsHc7YRdqnztO9xzdCvB2L7Sgfe1YJ3Hf7vaerRiBzcUQ+Zr3?=
 =?us-ascii?Q?9xaAUr4dvhezAIWPTYv2tU/7+wBlSjd5EwI/gbhCn+gmQq1FNX3BADFKDyf8?=
 =?us-ascii?Q?J++DP6Js3RP8oBKprTMQ2RvMC3dPHXpp1bCOYQ3O9kyTEsEeXfPKNW50uaXQ?=
 =?us-ascii?Q?G0Jy359sYXSy60zIy5j0HH8dhfvmPCcwrv8kVkMJZPpgQ0dsOSHLmDDB+x5+?=
 =?us-ascii?Q?SYTosM3DPGs5A6qC52YrwD1gpxg4SYYY0TsrC1TR2VC/8BbSObPpY1KkYoW/?=
 =?us-ascii?Q?cE6tu0v2JsYp3pWOwaqeg9jNQ3JFDHZDJoQzY/CttJPP4tkuL6wSpjukBN1q?=
 =?us-ascii?Q?FVfYdZjIu3d8liV1QVlLRVCw2M6GDsE4oPYDZG5kHtqTfjoibVVF98eQ2NSi?=
 =?us-ascii?Q?r/sU4jtrisH1Iaf6O7zSwLGnMv4wB/OWSWN2rUVAWu3GVkcCwexBtFLB/3E8?=
 =?us-ascii?Q?rXv1+RXo3CwfNzbqDMuZ3Vu9lovT4wu3GOekgq1sKjvWE23pAec5Ki40T0r7?=
 =?us-ascii?Q?MfXwHVPuPmMw43Rnb8bqnRfTDKn1p9x/XPxH9oFrTvvRnUrypvB1WFEARirt?=
 =?us-ascii?Q?Q3OQgB8gfcKrq4baVCRCyEZhjyiwqFyqbJfDnXZ/K2EhSeF9tNaQ3ePNSGai?=
 =?us-ascii?Q?szJM4thqiPVEJRBBN8AL9NI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ee6a8d1-b99f-4166-5a28-08de20b92ed9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:28:06.1425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYEXjkiGFXGnNWkXx7asXyUcGgsJP+27oFyZBInb3eFOCBrRoQkM1mM/7GYggx+x/Pkd6yzGX16qZzB2NQ34abjjcYgwDJUcyZ27GUVdgHohjSxl6Hy4c2gNNVy3gxnN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12798

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
 sound/soc/codecs/wm5110.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
index 29b805128ae55..7a311c869bd31 100644
--- a/sound/soc/codecs/wm5110.c
+++ b/sound/soc/codecs/wm5110.c
@@ -403,7 +403,7 @@ static int wm5110_put_dre(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
@@ -468,7 +468,7 @@ static int wm5110_in_pga_get(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	/*
@@ -488,7 +488,7 @@ static int wm5110_in_pga_put(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	/*
@@ -2297,7 +2297,7 @@ static irqreturn_t wm5110_adsp2_irq(int irq, void *data)
 
 static int wm5110_component_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wm5110_priv *priv = snd_soc_component_get_drvdata(component);
 	struct arizona *arizona = priv->core.arizona;
 	int i, ret;
@@ -2324,7 +2324,7 @@ static int wm5110_component_probe(struct snd_soc_component *component)
 	if (ret)
 		goto err_adsp2_codec_probe;
 
-	snd_soc_component_disable_pin(component, "HAPTICS");
+	snd_soc_dapm_disable_pin(dapm, "HAPTICS");
 
 	return 0;
 
-- 
2.43.0

