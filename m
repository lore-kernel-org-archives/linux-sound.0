Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011069.outbound.protection.outlook.com [52.101.125.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283051624C0
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820512; cv=fail; b=gryB2ibCJJRXmB0F0jksDfWLq9Kgd0bRSR7wrGl7am6jG3bDPp0Iongx8xL+Q41RNmNiBnKuRbsq2xTuWm7uRjCdB6HaYz68yVs7J6OhPRy4TLX9drX8twYQBRrnJJIj4+SaMHfuVRGSBvsFkBqBIvXcJUZ0AIgRrUX7cL84tyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820512; c=relaxed/simple;
	bh=3OWWf2sj7EmQOP5GcGzYKjPTa2PFG4rkwl9Ryvwbfec=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DsGXqXi92CdeApHhYQrSX5iDDm2aNDTe3s2TQpVpIOfNsw83IopauVY0bt65XVE3G02gzcEJtsmgs90bnOpq1fDHxgZiXmqGIONPKThwmb0v06a8fkVA1/feC2Fm8QNG+zY6WjUIr2RPRoPZ06GFlil1sZ/1mjmr6tnhJNSYe/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HO20CZyF; arc=fail smtp.client-ip=52.101.125.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HO20CZyF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QpZi4hO4oofkzsbLabTNt8YWIUPRSwEmcqHiOZYTt+WEitEiHSVkZOB6l8KjRy04L6svGicH/9QDMxvw9R+Vp62vmk6sXpA9biJxVQ9EyVIiC3UTTeGHur2XtGIZc9mhOyIX86SBN1Zx3axe2JdEH8fCNJqpspW5yD1pRSy8ROMrkVx587knqnTeq48LsYhYk8kDRsAU/12srn49lIU/1ZByNoZTCC1WHpo2K7zxuI65Bm0MtA3Xw33YDY+hdDZTjiDK49mUASvdrdJcCVgkKskHhVm2eKBF5H8yz1z+ankkVPqV+AiUI9p3apGYP64yVUqgFkVaBOJ04nGt/SGtfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4T3xSgN523aT73H65AbSsvoUqsHuc1MdB7lcHGRBKg=;
 b=T2l4EsORhe2aWAm5Zw5xjAcjfgqG70+lEH3H5B7pAlfZrl+6AKOZZqvf6Dq3rdsyI6yZMJaaHnADP7gDWDmkYakPIf1T8d8JtUsDtdVA83WSU53Nwd2YpiwsUAmVhp8UAugrBJ9n4jrVxw/Ml3V1q/guvQyFVjXGh4gsEdmN947ppCm4Y0e/2QtfT6RFRFtKpaYrsUjyPpsSjN9gCCEUauVDi75SnMUmwKm120Vp/NCWCMGnXyDKMz6yZ/ZE4sq28M7wDpIKPdhv5f5ijLZj4/DTDTAa7+//IvhsctuRkoLmiiiz5Z8kdBX5WLYFUaOQwA0P8+5qqLCFEMMpYqBVZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4T3xSgN523aT73H65AbSsvoUqsHuc1MdB7lcHGRBKg=;
 b=HO20CZyFuAAOBvAj5ufB9kaw/mPXjxpB0BAXsBWjKvs+gxrw2uRhWdAlkJhVW5OcHAMtqezGVpJaG4GnBqJtnva/urJ+IXj2YkahxURiyXimdnJ5n7aiSM5qpyo/q3+CSNEE+fEQVUI9PiMaonp5KB2mpM9ZleAl4RCV12QPuww=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12802.jpnprd01.prod.outlook.com
 (2603:1096:604:33d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:21:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:21:48 +0000
Message-ID: <874ir1771f.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 055/292] ASoC: codecs: da7218: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:21:48 +0000
X-ClientProxiedBy: TY4P286CA0058.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12802:EE_
X-MS-Office365-Filtering-Correlation-Id: 436437f9-d1e9-4b53-3352-08de20b84dbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mFNDGf9eXxuTXT7GV4SjK+zcQqMCU3VHiY3yby80+V/hzqtcQgadThYKKgiz?=
 =?us-ascii?Q?sLFeuF5NnEfGbO6gw4yPc9jyf37z8JKo34kQLMfRG7aNJqGX3yL8QNrmV/5g?=
 =?us-ascii?Q?YKFtaMwbTfpISA/ROkpLRDf+PRpi198sDaRTras0tUbaO6hrj9mkQwpRTZxu?=
 =?us-ascii?Q?Hg3fOzqgO8+C5SDazcJAxjPiQbX5YB5mUHzaHTs9HEoTPoXKygecT2pwpqfE?=
 =?us-ascii?Q?zr/+Bm2p7eEIwSY9Ritdtym4VCXKCrBG2UiYJFeoGdk5EZN6qe7d5VNOsPQR?=
 =?us-ascii?Q?wRAhdIqnGW0PrXxXeuq6/M5jpFTOiSRExOaGVDeDKiGrJVQWqpP0AFCUjNYZ?=
 =?us-ascii?Q?sU4hkd3Al1PyWqIClb7RTeT+KwQLpnO3UNGx/KNJjPI6Nti0dRjjhty7+mtr?=
 =?us-ascii?Q?+X9ByZag/tgX+frcZsGIU0WXZnm7E0E3L05h66HwudIQFaLVf6PGs93zUEHF?=
 =?us-ascii?Q?fCAoUgp+JSvSEFxwuj3EB4k/gjpBj5OqghYKrUD1oRbnadPBtUUdiiTPct+g?=
 =?us-ascii?Q?EzcmhE5LpJCIYnGGTh9A9pohwNfDhUOaX08OgWOr8jUmTT/IkvQ+54FU0a+L?=
 =?us-ascii?Q?kcUo+0l/GsdGJxb0yaDiA1ZCrvTwsTD557Dap4S3RYnLjWYJ/pPmBBSTb0+q?=
 =?us-ascii?Q?dl57hOh1h1Vsd5pnlHBQtpaX68gace2TGV3X9UEFkO9m8mAcuMoagr2T6OpE?=
 =?us-ascii?Q?t5hD4SzY7kMUwkRCfNQ8s9SlFJaPsFvmM0oTWuPvhstUqF/UKzOqP1UeGci+?=
 =?us-ascii?Q?eWmZtjOBos6dNBOhRKxZ0mr+K3xSupA1Kat6OVdXJPqfEvOjR8gWX/k+FV58?=
 =?us-ascii?Q?eml5CvbISWSX2iO9pQMlZuhKoIwjpkjOjpspygoWgy3p/KHBibXVc6/I5FTU?=
 =?us-ascii?Q?tsqV9aDhxNdh/R3MjaRJQTjmJPq1pTIxpjLHqJl8ryNa7YmlTysFqwiz/hRk?=
 =?us-ascii?Q?fjyCuQDJ/NO6T+TKrf9W/fmBBNvnnJOk8l6MzzAFn5KT3bVmU3eXEJnLziNF?=
 =?us-ascii?Q?1WMN1LjjR63CW3Y/HgpfUAjY2j+8F5E3R6tuBVLyr7Ypis0DZ1dXBVd3MdCh?=
 =?us-ascii?Q?mYYAVgh6AUKN08XnCcMAuHq0g+0PoOYvBosPgs8j05P9XIodN2xas95lYC1S?=
 =?us-ascii?Q?nfYgKm1fYhUYgM6t0xqVmADzd6Dos7/XmM20IAwkfrPTfA25n1faMYwQWlzP?=
 =?us-ascii?Q?4NDz43zcDvjrUT3SJ6r6cdN2y5PPanCl6qxM533giCHfmOr17BGfQ696NbV6?=
 =?us-ascii?Q?LsBMPCQNsO1FwIHBscbkA6CxdlEJSCsBMM53ouKUTh/FtPAXdoAU8yFJLQ72?=
 =?us-ascii?Q?geBtTJs6Ffa1eExZ+acrw2JpkHxMpQ9xJLwPxZsyoZ5VAYn/kgn2xL6qTmVu?=
 =?us-ascii?Q?lNrtalGfaSpYgxQ2LZwTvQHqWLSy4+5C4/Qez5Pt8Y/44l5Omociiu4aUtKQ?=
 =?us-ascii?Q?xir7ZKPewgPnxd0kFeZxwI1441mvJHsVffA1rZAqlUouBiGHw5EANhjOEccY?=
 =?us-ascii?Q?DbtqrA4zfqldd6bic/lyiQqBuze8K/X+xQUb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jovXHNSyq266ZTH3ZhEqlAv3whaObQEw9bI9Nc43GOAfQMH4d9WCtgn0pOkU?=
 =?us-ascii?Q?cQP4yOp2znXX6iI1JS6ldfHseabv9mCGJDqZtahVgPk0yDCPgeD5w2OHHT83?=
 =?us-ascii?Q?P5Vyz7Tze4EI8VfsxBmXGp+1UntFw4C8ly6yV/UDqjVieekoc35W7dcDQvld?=
 =?us-ascii?Q?yTaQ17nbPJJkKcovnOZelLjKlqAgbxRjo5f0w9vtNdkMEN94YUEUZ7gFre+s?=
 =?us-ascii?Q?YBwvIUovESn60Q9Jjexi0Ef+Gkr5QNpvSXjyTdtsR7SS+WNFKXaI51OBw3O+?=
 =?us-ascii?Q?3zB8hzOBV68+/hVE6SgnnZrStMlmz9V0HBCIa6tN89tM6ekp6fNu3N/Pqk0d?=
 =?us-ascii?Q?hij8q81JDpTMxNQlatUMhuSLdXCwW9tGPRqW5EdQeou+HOS7cg0BJeHLXFjU?=
 =?us-ascii?Q?I5z+d46zRsJh20/Ok1F6TZ3O0UW8STNwLrZMr8Ikcg5akkMWNCu4dJ+f1Nph?=
 =?us-ascii?Q?ORLoa+OWdz6b+VNHViMagZrmzxXK6q8F4h4Us/t5G5EvDTPjxK130xZGcVdW?=
 =?us-ascii?Q?0g5uIUZWSzY+HpkmIJC7LIbmzyJI63eX8rvlgRPmEUCLRFT2ySuauEI1/dMJ?=
 =?us-ascii?Q?8iEhWU3GHifuZZ/kKdhdU2QM7uwkSLrYLeeBUJZgqo5qvqQEOvxRWtzrhAT5?=
 =?us-ascii?Q?NpVghiIOMhMe8nFnRUwVpL9QOGwa08ZJkGQFfe5BtZVj2/R8EcgvwzfXWNjV?=
 =?us-ascii?Q?BqLQc7O7GVtDQg71mFouwzcLhQTOvc8JUq8tReQSRy1doG+vi4VbAMEeTSEc?=
 =?us-ascii?Q?nXaJgaVJUr/+Zorw43A58E8+01jlnQOv8tuNxtOoXA3Bbb+n/48S38iunJHT?=
 =?us-ascii?Q?IPUpf5JnvYCkTMjjI2hzIq+ZAJZ42kH2+evndufYH2t8wKOl/8Zo9ZIaS8+x?=
 =?us-ascii?Q?nRpygl47SuQbGmDBZphZKHVPO9jmxBiT/kRyW057wIDzCQQkkZukuM8e01O5?=
 =?us-ascii?Q?VlRv4zIhG3TApxMGskwuGcZwKHF7yxZX+cWpGu1/nB9Jl2JcnBp7zw4QkyqC?=
 =?us-ascii?Q?d36e7YsFVT6FTLNRvAj+479/T2JGPu6k8jI6ogb3kbMXcPZ/sqlyd17xicVn?=
 =?us-ascii?Q?IKCeyTULA9Bv8z4deOO5yrYgets7NuAxiveGCeyaNRZO4In39H+g0uytj4+3?=
 =?us-ascii?Q?fypdGNzEyFp3X6uzGCZitO8uFcCblfyYANrJTDBEG5OxE0XKXLolp7Mq2UNr?=
 =?us-ascii?Q?wjZfSxZTYx0Z1WwIeq5GIwCknNpF2Ta7sL6h7cFBtaPoZqVhT0k00WzeTJN8?=
 =?us-ascii?Q?xeTX+PW7vfY321BOls+CInvlJ9lVs7pw6xk15RYpEIqaDnvBVPQqa3OPum1h?=
 =?us-ascii?Q?OHjhJNhbU6OAgqNjeR8EprHFc4oddXjyYx1rhhdhdIFIv96fEjMeiuIf/o+b?=
 =?us-ascii?Q?6O6dzshWHRSxWyd4I1Xmn03TjH9/K0P8wNqZXcSDAhE7t9LaWiep57QIZ22V?=
 =?us-ascii?Q?2EsuhHwMuOcZsrQh3xGFDozCUvK+e47qwBIpFdWfAN2bDeEXezhgrd4yyALH?=
 =?us-ascii?Q?81guTeUwdB8/OykZbIrrgbY8byoa2HzbhTxCAzVZn10LumywukgUu03721q2?=
 =?us-ascii?Q?CR1e5+uLw4dYzlx2/rPt/m6RjDk/TIfGUZGwzMUc5lq2CqYlr+gyYjEMrsMT?=
 =?us-ascii?Q?MREnDo9uv9o9eFbbMe/4aw4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 436437f9-d1e9-4b53-3352-08de20b84dbd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:21:48.4374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8GYhQfesZ2ckaxhBOKrlrjn0rvcl2tHWRFrEB7so3hiYMRO79a7UmZzODQWrSOS3OELZ8+AcDW6QABffmLX0s0hgYtF/o1vo1VJUTQ6A2aDHXI7GlolnRkUYe2oB+Mf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12802

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
 sound/soc/codecs/da7218.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/da7218.c b/sound/soc/codecs/da7218.c
index e6f4299073e9a..5c80839704c70 100644
--- a/sound/soc/codecs/da7218.c
+++ b/sound/soc/codecs/da7218.c
@@ -2562,6 +2562,7 @@ static int da7218_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct da7218_priv *da7218 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	switch (level) {
@@ -2569,7 +2570,7 @@ static int da7218_set_bias_level(struct snd_soc_component *component,
 		break;
 	case SND_SOC_BIAS_PREPARE:
 		/* Enable MCLK for transition to ON state */
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_STANDBY) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_STANDBY) {
 			if (da7218->mclk) {
 				ret = clk_prepare_enable(da7218->mclk);
 				if (ret) {
@@ -2581,7 +2582,7 @@ static int da7218_set_bias_level(struct snd_soc_component *component,
 
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			/* Master bias */
 			snd_soc_component_update_bits(component, DA7218_REFERENCES,
 					    DA7218_BIAS_EN_MASK,
-- 
2.43.0

