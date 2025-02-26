Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011032.outbound.protection.outlook.com [40.107.74.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D84881E
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533897; cv=fail; b=nw+3u7VoJpll1l1x12dQO5zeVxbfbXWL4U6ELq+ojBvZ7bMt+52LRAQ0naVXqNDokGltCucJJWTfSqfT/FWGgd4/zhhNbLPoQjCk2kqBVjh5olb2DVtq8oKwwtoptThGC9PSj4WpzKrVVWKv/n/qZ6j/4P0CT4wUCwBKMtYppn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533897; c=relaxed/simple;
	bh=FcVRcUcntkTb8Kwh2EzgSf77mbZH2EvUU7NXxWrRfDc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Fd/CbdUbQfKBkbZUrFIjb8Q7WWSc9EXwBjxS6e1iHkOrd+v5w1cVjks+oAqiawjDxGhnEO1nenhZ6qWmSGYUEKR+8Nktpr1/HS74/1dOxSMT9u0D3YvAmrQjMK5AzOqDOJoxOmlSJ8EgIsui/A4wwMHkUY46zuXTkjZsJBJDynU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OL5z3TYU; arc=fail smtp.client-ip=40.107.74.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OL5z3TYU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vAVuXmzXyJgPaWvk3dBxWdDYqCGruSFexrDTOH7U3M/5qvAKa8uCiXVCW8hJ+FyCBAmJboNREuRer5+soh+8u6iosnZVLilzqFqlVBhL/TFfm+lX0TWrOZIc8A2ronrwmi5idt3jsx7fQLOG0N/K3qsFHm3HI/36M4vitfUdYMejfxtjZJCqAFb056XL+B+mWHoainoRPEu/oWx3VIjK7XoISx+NgQsIf92/TGf/k0KnXsaiM29kyAgTMKQzmhtFf0PUdXIBG1LNYLvCA5mMrnSTm7DErYlvpPN41Eiyb2nYYYiDzFilsaNEsn5osk9Nh3PMEZSQ+zpE9+gMaP6Lhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIZBEuw1ODjfXFdO/HNH9S5B1Vst9b2iv7ssai99FUA=;
 b=RalzRHvP+C7CIg3oBMC5q1MPTcxSOAirJxONOrj6UpJv6nbHCkk3tIm08a1cDUjwNqSysTFI0LaU0pdTCOfYvgxxnRNaEQ1pW8OFijMSpIslZ1egUK2pVdJsvC4SICePJCFID8+6ROJdPJhlt/GwhAhXGVfNw5Ra3JvYUK8QSI0QOrYqJ7Txx+6gDVt4KVdl6LLuD8/kvZUJY8e0gqcGfWJgroEMZiD6Un3zP77CYPQcej+cU08RbpojZnJi30hnaqp5THhABqmQ88+TZf4hkA8QYPpyhGd4Hou76ntUsmIn+d5uyY9MT7mO+uICRTaacO5TlkDk/lmjM1yi3B6A1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIZBEuw1ODjfXFdO/HNH9S5B1Vst9b2iv7ssai99FUA=;
 b=OL5z3TYUIz/jWFZL87qKmX7Jf7SChCkbltNazwloqpdsxi+NpIOfGPVNBSPtMGG03F7jnafl9sf7BvcBLEVeTBnj+/reC8q/TShfyoEsoA5bB88HgvUDN+OVq/g+U8krYO2WZHpZX39vbPAqCQeebTmNSIOgaAYDlDWCMRpNfag=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8864.jpnprd01.prod.outlook.com
 (2603:1096:604:15d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:38:14 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:38:14 +0000
Message-ID: <877c5da3jt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 131/157] ASoC: samsung: tm2_wm5110: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:38:14 +0000
X-ClientProxiedBy: TYCP286CA0217.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: f0e730b1-6f63-432c-266e-08dd56063ca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/A53UmLqkYWZ0xxVfjC7ztt4ANitQuuNllNQs5KTTv87fLO+/Qqjqa+6Xssh?=
 =?us-ascii?Q?iTBIKxxcDcGaKJLfbSlnD0m+jESU0FC/j822T4/6OE4F+sBh/3EmGxZCrzSu?=
 =?us-ascii?Q?kEumkOwbB7jRSbcrVRGkxa5ML3O91jJbNAUVHJhhu9c/5pEqthovspvgRsnL?=
 =?us-ascii?Q?gROwCHaJ8O5lME9vT0fHHSt/Xk7AykbbPYQqMxM1WnslmiQrrD98NqvmD7oy?=
 =?us-ascii?Q?hGCkSf0Pg79oX+q/2GAIoFMuuXhyKbvW2tpQdiglTdaXSb73hE+hO1wfuQPo?=
 =?us-ascii?Q?+p+HHvgFebyBojLCr5X0W7UdIcqVwf/F7rVLirtbc7sGCk7TNl0pU+QLI2Ge?=
 =?us-ascii?Q?4LIE2OXiiPUK8vt9OFHy6rjWR4s/C30+M+VuRAZ4WLUpO9BFGoKWOES9gsdG?=
 =?us-ascii?Q?z3rXyV7GV/KhfAGtVC6FZc/Zp6tSEjVK/omvwk8SnFBfI9U/4qSm59ABxK9C?=
 =?us-ascii?Q?RsrKltP6RiGPfmJ2gGRVgFLnRlCG08I9QTipPGL/MzVIxEgbQuQ9K/PcGtkf?=
 =?us-ascii?Q?eMe5UoU4j8aR4cDR6OuvjC+tGR40Cp2RgAeAJHa31hXDGykVba24ahe0Z83E?=
 =?us-ascii?Q?Sz/iKVYbAuIgRCZwInYf+QBq9Uj/aWaEtbN7udVtTDASwqG10qdMVx+0CaxN?=
 =?us-ascii?Q?lzcM/0PkSiPfy7vp39aez49vGEZMTrtfqV+IQRwrkT3WLYP35Gy/wMqfijTe?=
 =?us-ascii?Q?ciUAH23aU/W0OnmOESUjc4e5fwYoHU4BqoSPHAAF4K37qkd4szxBPDO67nn8?=
 =?us-ascii?Q?h4MfqCBR2aaDcwJZSLE5No6CaQfltXK9kFMyxG/V6T87pFtlGbAwymDAjn/j?=
 =?us-ascii?Q?ruWPcfI55ogXvYw+qaznKxn/DCZcbtD2vvea05Nia6dH7DvyDU47FIaVV6Ap?=
 =?us-ascii?Q?WjcffFF/K+xzVrJGkmwceGLNs36Qf1wVo55AEoHePCSIDV1Xng7H9dnHx4iv?=
 =?us-ascii?Q?QglJp5RP7AwccUecetlZuoAC/NuQXaogwHbJjkIyh1xKtfhUypELxAuVQtqU?=
 =?us-ascii?Q?oTUR/rQ89NuaeW//Cm/1W5d2aFOY3M6C6kRyaxjWdTSQDPKuPRiP70EsuEPt?=
 =?us-ascii?Q?pZwFv4j4lzwszle3LfbvnuGpwy1+QtzNTcQzmk4nHOgNSe3sdBg4s41CU+YN?=
 =?us-ascii?Q?3Q23yEfnbbypQd+UYIH5Iufwnjmy4GaihYRo44RTJMZdAReEzlkARlinmlff?=
 =?us-ascii?Q?L6zg8WNu7Ics1fapWL6oLwHsjD+WR/M9Ds/hGaKpHwXvvRGFYMhZ6bEwdGEH?=
 =?us-ascii?Q?a15V8DssOfqD4qw1w+kZsBZ7RGiNpIQlLbYeOeL6Ihq2U2XdY0+hOOX/fp3F?=
 =?us-ascii?Q?h4A0Yec+9gy81Z6/RjjscxXlGHYWVdpkdEhs6iCGXcCNfiFGUug9hnjph2ZF?=
 =?us-ascii?Q?s9ibBHgVFDolOWF4yDx1jVcOeph/1xfVm0domTCBtVnZ7qmJcU+ZPLl7kmlL?=
 =?us-ascii?Q?9MeliBM6sbOYbSuMVXrsVM14SznEqFs0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xRaAAYvryGMUST5tqwj7BC1J/nFAM9KeihSvfB9r0N4cVPjsdXkGxFYuhBYJ?=
 =?us-ascii?Q?x6kP9Ez2oLywB2xXzoh8834E53CU8gJuwwW7U4IW2oA2NBysHaGanRbFLMLp?=
 =?us-ascii?Q?BTDj8G2c2TV3zxF/gywuqK/iIYEVh4XaA3bvIY6fHgImSQXnYWhuXY8dPscN?=
 =?us-ascii?Q?N1eYjQ5dXblockm+YTR1PbIMqEd0v13vFvrw7tYdL6up11okPC1wwOSfnxTX?=
 =?us-ascii?Q?iHwe69PcZKNWJHKFmpHE/icZbmYdwT//eiTdMrCdvRtRw6bKLguOYKM1P/Jv?=
 =?us-ascii?Q?73prS8OvRGHOjbUF9cfQoCkm4NYp/leCzCW7DIWC+/+GTlfBPej9PjWZdgCb?=
 =?us-ascii?Q?gSFhe4PlGCt5x4WtC0QNIT7W7ub29UHkDda5dQHz7a16m/9hcSOe8OluC6WD?=
 =?us-ascii?Q?WRGiu0tVrWnaskx1GQwT5SKm4vncbdrabVixSOD1tRz6Trqhb/wEJ7PHn7fm?=
 =?us-ascii?Q?Xy3JMZ/DJzSkiFFs6msV1t0YyxNrc8J8C5LLJ8UZYTCKFcCrLWJkW5v8NHP4?=
 =?us-ascii?Q?ocIyYzQyR+MndOFRbOLhzM4uNJmdaoKQo55HSZelalulLpVdEbwgswCDMQxh?=
 =?us-ascii?Q?+WruerwzcDGR2+y3TZIVj47Fs3ul5TGf41cZOsHBarwgnySCB9AgcfwhHStg?=
 =?us-ascii?Q?e6DNF8P1zPGv11KP5neqiaRNAJ/UksL06BnFp2KJzvbbPozYMVvrkZL7o8IQ?=
 =?us-ascii?Q?RzLYXBJehy9kECAie7M7orlvP9cwfEv7pZyLjjapjaYwj+V8jQ26Gj6qU68M?=
 =?us-ascii?Q?fz/eyC94jbRBS8ZY4k/B4c0zx2HPLESe1TOE0B7hvwKusdRXN/dK+49tmwpT?=
 =?us-ascii?Q?LZ27unwwiWo8EQruEDrtoCQ0gLoLlfOF2Qg/0Ltw/TCF0ML3daY1Vd2pgXbN?=
 =?us-ascii?Q?nBaqeoDLIhi6iHqHDla7Xh1qVkIqRTEXh2a57XP+LPVnKYp8O4direHFW4Wn?=
 =?us-ascii?Q?atL44LMlgrcu1A1l5uLi92AVFjBPq5ES0FfYntRKLtNfnigiuvRQa/Y1T3Wp?=
 =?us-ascii?Q?lW4mmak4pm2ZRD2eMN3ixL6suQqLprmq72qfdQwD1xHziX8mECdmrDhONVHK?=
 =?us-ascii?Q?gJv6/vmfVR9qWGLHyvEskylawx0+Xj1OAhg3nvq9NcLWzzSAlkI6H0CAb9K7?=
 =?us-ascii?Q?gVqWsTV17msHg/dhwhnso1emmGk0K5CTl5ZA9AOHQrXMwsdskYFKyR1JAyRT?=
 =?us-ascii?Q?+JvMSkG/JfIAEdHnDkpzj4s7jNNkQDr6KJXOCxejX+OF8wcB4T1IvOhD+VSr?=
 =?us-ascii?Q?EmrNsum1pQ+f7FHSbLd50RbZ8IWhwXoUIjrOR8wUCfcuqOOa5aIhl54nlIJH?=
 =?us-ascii?Q?VRVtLeY9sbGpm1EgonDzBCj+L1T0x75+XjsffesZKZ+dAF0iOohxR8/iKMsu?=
 =?us-ascii?Q?FdbDWBxWyVsxrERZuRYo2A2bG/ii56dQ4DturiJQrirKQKTRvb03HF36FcKq?=
 =?us-ascii?Q?C2ktXAJgrTnVOZ0GyvxVNWDRXXoDxb+YBnHiiZ0elu852VpZG784+54S6sS3?=
 =?us-ascii?Q?tPG7vusxicpKi6EroPwcSz+OWaKBVMjGEbYfVy3CxyagXBq0THcbKPMpYYlF?=
 =?us-ascii?Q?BOy9ohdQvNsn2SJyb7/X4totn8ixZr+RvT7DH4YOKzLfmpBz0FOIrBLzwOo9?=
 =?us-ascii?Q?MeEGbk2+ilipU+BHmAYyaIk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e730b1-6f63-432c-266e-08dd56063ca1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:38:14.4819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: siAoJKyP/tmPlURJSRlprN3iAdmHp6Ej5p+3MrKjPoaO43CFEws7CVX4bd7iGUqaz6eOSRq49cldR6dQQ7D0Q3etu2uIuRR9l9mJUIvce9CtvKRMEbPdjDIpbiO2npdM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8864

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/tm2_wm5110.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index 2417b91a328f..db853833f0d4 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -451,21 +451,21 @@ static struct snd_soc_dai_link tm2_dai_links[] = {
 		.stream_name	= "HiFi Primary",
 		.ops		= &tm2_aif1_ops,
 		.dai_fmt	= SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-				  SND_SOC_DAIFMT_CBM_CFM,
+				  SND_SOC_DAIFMT_CBP_CFP,
 		SND_SOC_DAILINK_REG(aif1),
 	}, {
 		.name		= "WM5110 Voice",
 		.stream_name	= "Voice call",
 		.ops		= &tm2_aif2_ops,
 		.dai_fmt	= SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-				  SND_SOC_DAIFMT_CBM_CFM,
+				  SND_SOC_DAIFMT_CBP_CFP,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(voice),
 	}, {
 		.name		= "WM5110 BT",
 		.stream_name	= "Bluetooth",
 		.dai_fmt	= SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-				  SND_SOC_DAIFMT_CBM_CFM,
+				  SND_SOC_DAIFMT_CBP_CFP,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(bt),
 	}, {
@@ -473,7 +473,7 @@ static struct snd_soc_dai_link tm2_dai_links[] = {
 		.stream_name	= "i2s1",
 		.ops		= &tm2_hdmi_ops,
 		.dai_fmt	= SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-				  SND_SOC_DAIFMT_CBS_CFS,
+				  SND_SOC_DAIFMT_CBC_CFC,
 		SND_SOC_DAILINK_REG(hdmi),
 	}
 };
-- 
2.43.0

