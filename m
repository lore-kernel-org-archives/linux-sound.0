Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011070.outbound.protection.outlook.com [52.101.125.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A4F18FDAF
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820670; cv=fail; b=sOEPw3Wr0FhdoSOLR5ZqfF1FKnJlZb/MYwG4e7RPTUcV/f6dMk09dj9RZCtN1cQv5dHwpc+a/3+MKhQAccrDEK7N0dfqnXucQjYW8hUD8+aQc9QGQgaDqzOwWUQjwtO3Nmwr0FAAEjpnzgU/ojnQi8T59/RTvWJjO/g44rRgVfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820670; c=relaxed/simple;
	bh=kLSyLLpuSjs/U/4Lg2GYsP35YeH+uTKcvVEiNQLJ69w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kkw3loQyigIobUkD5eFH9NXdFK9l/oEYbyq5GO41oe4ZXLfqjXX7nJ4HLrGXm6E8aD2Ek5Y+FZU7amH0pbCdStbN5NdynkRiQ6FwatSqGuxQpqYXStqC0PZMUemLgZ4TqL3c5T8BJVnWMvaBNvmLo5pVmXaaXC4tjf1CDGlaFnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Xr+IHpFH; arc=fail smtp.client-ip=52.101.125.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Xr+IHpFH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJe2tUhi5fBA7qzSCFUqs6tgkfOK4qw8cf1RajuYC4WkEYQWeJC9xViYLemuC3dCN0A+Q1+TUlf0GbHyRN4jv2+gmKxY3YXADQskvuW5B4weBYRVcCjQzZQNtfxXjnv7BBQp4QUdJevI3DzCJRtNNF257J9ppg6zMTHcUeBqhHZIajsHnWK1Okt30W2PnLEhQaj6v9h7iadnJfHFkauMkdTe3G/awasgi0TZXIwlu/zseTWp0PS2y6EAq8p2UB9/DK22zcv/QJMkpvqI8kEfysKV+Ypv9M90bx/bh4OGxF3510F6im8mE8xwRQq4HZ53IOR0+ADYqaURQvCOeYZRzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9HTI+K3pnxE/8EfZszIUrvN20QnCIAfRl8p6aHk1S0=;
 b=XrAu7uRqDXWP0fnTGQSNLy5L8tC2zLQUnjawsZFRFXJQKvNSfx+OJE93zYHM8VcOeimpJYH//oovJoheq6+ITESjbeTkM6VBgdyicMqsXTOrPmDb1ad0U2c6oYfhTsjZ85XUH7WVfD1Ih6Gj5zPu3pPEY4CqYzwqOus1bC8bLkGfh5pU/VRQKgfVvEHqn0Hku+tBIVgAgM3eyPzQM/0Wxnt8JZWEK+uqUSYzxIuJ1GlFn5jaYPOftgD0cKJmkaJMjvR9hyzroInHoB4A1IRZGNUNrko6DRDz0yrV8Lq73j/UFwzLl2lcBoRruTs2g6qmRHv8i4SoLs8tgj871YgW/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9HTI+K3pnxE/8EfZszIUrvN20QnCIAfRl8p6aHk1S0=;
 b=Xr+IHpFHxFTR6Bk1b2hXBwzripxzKXP3H7e4tLqDxWFK6SnqBzULsEN3UpGiU7P2Z+7vqxQoMG0SrGu0wRH2iEGvGQ5Z70qGlj1MSdHgLv3r/dNgff+FZxsPXnagJ8juR9PulMQ82amc2IEVVAwWUq7Zpy77P3lpopQwD21WsTs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:24:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:24:26 +0000
Message-ID: <87ecq54ds5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 098/292] ASoC: codecs: rk3308: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:24:26 +0000
X-ClientProxiedBy: TY1PR01CA0195.jpnprd01.prod.outlook.com (2603:1096:403::25)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b7abbdb-3e26-4ace-d959-08de20b8abf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EEP4dvXQjkq50JZCH+vp5b0lktX8U/dQmhffPTSFQA89T+tsMRHwZVSKxjfy?=
 =?us-ascii?Q?qvBBZkDqtRmtlcBj9JnJmfU63kqjow1u+kyp7kvUM9SVzigFEK1lQ88m6RIp?=
 =?us-ascii?Q?GqzAEh8UuyzU2AJedmozhnc0YVO3QHz8JjY3udJiPQ9YpUHtvEakfK/Vmi2T?=
 =?us-ascii?Q?1BtjuJ0sl9k4JqOxzd0HDtrT8aHFAxg9Dw9O1AGKyzMxjsGNGQ42+CV02qfj?=
 =?us-ascii?Q?Naqn/y0tdF4ZfL66Tfv6eBTSsS15JEfd5Zr8ubM0UnTOgNPQJoFPbhtnCZOn?=
 =?us-ascii?Q?NO6YMPPcua0lDL2NxgodQXPnrCx5/z+2DHoJoVyrKW+mcMWtRMmHvHs40pOh?=
 =?us-ascii?Q?7Aecs0HIZo9ITRW9R62EfjjQ9XdcOnREE1QWa7dr4DflN3MwN/UuBZtuBH7b?=
 =?us-ascii?Q?w8z+LqJWinLOR5t538CwZFjrZfQn/oswLeb8GZtIadcMEMzS3ygPo+BQXZQS?=
 =?us-ascii?Q?m202DGtsoQoeT4lf0ouLdOKI4GVJQAuSJyjB1WFj+QKiXtFVd4KVDAXibeEY?=
 =?us-ascii?Q?srmAveU4gQj3Fd4ZBGC8KY9xOQaIoojJaz9YLQ6VMgUz1R4uYMzNTvrtGS5n?=
 =?us-ascii?Q?aM5x/2DPz7Z2nX0BXKnMKyNl4HiQFX1iT0lUKlW0RgcTVDpi+ym+4dA8JuMD?=
 =?us-ascii?Q?dC2X+V6HRCrEG2IFR53xZTjuEAjULLE4H9kv5DwgD0JmCBPGDTZJk5tDlkUq?=
 =?us-ascii?Q?ndXNrdqOtKGLovjXX/CPEmtoJZJJ1+ztFkPLNKNX7mq3EoUpvGbXe4QInAPN?=
 =?us-ascii?Q?ZE4mXW7j3UXV9jmYtKAxuUSRzmy0ggHu5SP6luiBVjGLlcioUAu+YkF8DaCI?=
 =?us-ascii?Q?7faqOvMtiJDZzFT13HCHekAz1//5xgsZZQX8epSKhyj2pIxCmXOe84NFYvsK?=
 =?us-ascii?Q?Bk1LYjQj4PE9xVWbg54OKng31LQha675DDxHnj6xs8zMdijbCV5Or+oI/OVS?=
 =?us-ascii?Q?S/EV17mXg7dWKcTtQsDj+5e+a1mbXrvjhhkJ0/IQQrfC81DcYMGCVzxvVEYB?=
 =?us-ascii?Q?kRUnmWSSs1X9O7tJhnDwifo7t8V2TXzvBGI+D/fwrrSqWD+ZreZEAKKx4rWw?=
 =?us-ascii?Q?N8oVc+bodQPB+A1QOfeeSbg8GwtvjePiJBLk1zy5wZjYVxCwQ66HkH4SHG18?=
 =?us-ascii?Q?TElSLVP9uRZEXwJvc23GtjfKWBeD0LLqENcbMAnUu8/6yxKgGuKvHIvEng3d?=
 =?us-ascii?Q?lhby+VrXDebsUMtAYCa0s7L+QU3KaiOR83IyBojOGGX7mLfKPF892ftYfSTy?=
 =?us-ascii?Q?BcK4TEcIR+yCTVjYKipmpj9SmZQS+GBOnaw4QKfVMenfoitustLHESqEhmWu?=
 =?us-ascii?Q?P1SOvSG+AgCwDuKb/nDM+tVM44e7QJ3HxdmnIJnZxopcSaUJydMh5N9MksAT?=
 =?us-ascii?Q?0hjEmrAGF79Sxn8QwtVgniB/SWHcBQ7CAidNO8ZeWF41SOokA8EkKCam3dce?=
 =?us-ascii?Q?LWkFfGSO/c7zBENCf390hTKzT+QiAccSa/BqXlieftccPnpfUglnGt5n2S/J?=
 =?us-ascii?Q?HqjwWnXUKKUt3gC2GF0lh7tiaRQSLzqN45bc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ykPp0wHvdQGlncvr5ar4559rCrK4stlXYufBbaHQcQKkYbCvzjLYR9WSogPf?=
 =?us-ascii?Q?UW/p3wr/cQ82kVIbMtDggzqBdsX1O4AiuvoIS1IAdcuPY9NhkFaaxB7tipIP?=
 =?us-ascii?Q?FlcmuilOwf65o0UGboidR3V61FEAqRou/GFlnzdc0T/TyTjF4XL1xrq4fNBi?=
 =?us-ascii?Q?RHkuLWBewBwFXhsYq3Yl8lZdYUYFoh0R7R1PBEyAKXVyIxmVUEKUW4V+KwDJ?=
 =?us-ascii?Q?ohaiwjs8OfNhfBc/XX3kFIEjuS8wo2+kDtpBcfYjlRXx8a29JsO8s4Hs4Gz6?=
 =?us-ascii?Q?6KbNKMjFIPnlmnsysc6iro2mj+CJZcgq6gfX1gqTaNJZRdBAqjA2nWCK5Ea0?=
 =?us-ascii?Q?vl7RQ4xczEBMB33JlxaTZG+a0VfONlIhp5xs89kAT13S3t/3DnzjQ97ZhH3i?=
 =?us-ascii?Q?B4dISQIs8CUkLnGrYOTueVh8ABgizDyr5f10O2fjQ8jtgkCZUe9bxWCJg1pH?=
 =?us-ascii?Q?dGyBZb/5YiX29xRX64CgGv4ljca+fOeB4728H/tUzDvAchj2mdE2mOMHIVqZ?=
 =?us-ascii?Q?I1vC1v2BmwsSZstLFd/ccVeJ9f4x8sOU4mkEJEmwTfqu1BfIji+p3LVWxUJU?=
 =?us-ascii?Q?S7sulpZ+9Ng4O5s0fXoQPhsLq1dWzWxHTwisjwPV1y2z1ZZjINxkTF59w/Q9?=
 =?us-ascii?Q?HlOY+j6mfAKIhExDVaVl2cOEOLKb2BlcrYqjinmawpE2585atwgUUi+BTAq3?=
 =?us-ascii?Q?h8qVB3KJ9+aV8Ao/wD0eKeQkOufCzix/wqLEyYTqtF0Yrr8iLuPoZmyGAfPr?=
 =?us-ascii?Q?d7o+vlHlYJCe+6M2Ap4NjaFgZBkwXExfMpJOc3uADTZFxsUCh6nYMuvjAN4Y?=
 =?us-ascii?Q?/dEsj39uV6hcGQ6sJj0ktHZGAEWyGx4E+ulomOCR5WYcbTbrCnBjTXodGSXS?=
 =?us-ascii?Q?xCrkOrGaA2oquAPY5aObVQtDvMvhuw2Y8LIXoOQRj4Y+7E9vxX98C6sk4t2e?=
 =?us-ascii?Q?P/u9LtrE/cmyZjZO8OLU1Ksj5IsmDok76s7LJMlwf0fGnefGYYkfwO81blBK?=
 =?us-ascii?Q?wjG9NXjoF4tjifiEcmCrWfeLIk1nKyYKHNxIBhnkDKdNmXRsvRtDV+4G+6im?=
 =?us-ascii?Q?DcVaKnAjI6cc6xeVIsazWubvgp1Nfc2WnVwyqysn2VpXFfpReb0rXuXrnU/8?=
 =?us-ascii?Q?St6W3+euVhNqpOgG4s2LvUV8Y9wyeW/FcASLArDej1UxpEFkEd89O40YNt3p?=
 =?us-ascii?Q?327hy6z3UOuUtqlEuBSYhnjCpnRShoZWFdV9/8zYsvvlGYhwxY7+yE0kAxQb?=
 =?us-ascii?Q?DBLDGQCsSvR8C5yihVBkiJYJ5mzJMAt3MVizX2slYKTCjsNRy3knseFJQJyH?=
 =?us-ascii?Q?EW3r9IruVCaipcw7BZLkzNrlURfVizhQQyVnd2MIuMjKwdf5euv950S9+10l?=
 =?us-ascii?Q?WEDkyIfPG7UtRBJ2xL5CEZi3R9zpNVBnsjY+/FHXqHuEu2uIWu4O7eC8YF1H?=
 =?us-ascii?Q?zWACbCdVdLnpHDeosW3e0ueyIdhXDSMdsra35179a32GX0KYJhO6auelCfae?=
 =?us-ascii?Q?q2Yc14240mLxBD3HxggOK4txi0sdYsf4um07l3ewHVx8eZImmXn+kmIgRlky?=
 =?us-ascii?Q?zegp5x8L1y4t0K0kx/tASchu5snw6fxrBW9+rdw6xvzNcjvpAfe57h9FygKJ?=
 =?us-ascii?Q?Sq5ECp9ZvLwR67rccxVRcpg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b7abbdb-3e26-4ace-d959-08de20b8abf0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:24:26.5051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F8YMkTlz8XERQBLZFwPWYTDlzhWlY5G/s0Elz7T28nhNc7cBAwhSq6Ts3X2iqYIhUqalq/zCsbONM4grSFYkv8rQeVsfA8RGUKU1VliT0Jz/TXq/n4MZTQlEXRrQOt5k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16440

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
 sound/soc/codecs/rk3308_codec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rk3308_codec.c b/sound/soc/codecs/rk3308_codec.c
index 8b51e87a17115..60befe9d37f05 100644
--- a/sound/soc/codecs/rk3308_codec.c
+++ b/sound/soc/codecs/rk3308_codec.c
@@ -786,6 +786,7 @@ static int rk3308_codec_set_bias_level(struct snd_soc_component *component,
 				       enum snd_soc_bias_level level)
 {
 	struct rk3308_codec_priv *rk3308 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
@@ -793,7 +794,7 @@ static int rk3308_codec_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) != SND_SOC_BIAS_OFF)
+		if (snd_soc_dapm_get_bias_level(dapm) != SND_SOC_BIAS_OFF)
 			break;
 
 		/* Sequence from TRM Section 8.6.3 "Power Up" */
-- 
2.43.0

