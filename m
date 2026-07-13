Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010002.outbound.protection.outlook.com [52.101.229.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE092CCC5
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 00:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783902461; cv=fail; b=IVGteBGzxGw/5ydGhUN9TXNUveolSzy0ddIIygTJhMBXuj8QCmXveD2/PIoKUgfb3PVnbYp5j7NMdZIloZXFP9Y8klE3aDBr/i2QdETjvq9Rsj/EAYXUkgUfpy0YCRS2UDCCM+jeGJf7u/nVD05QZ3Gi3xpaXO1bvqpBwMwJyT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783902461; c=relaxed/simple;
	bh=nnpZktCMGw4IiUddE7KJ041NrLayYRgiF0UkdaCLlBU=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=GDh6p3DCph4kDrz3v67V4CMy+5b7GaNclNvulIjJniNlXZ5zbaf1AOD54E89LI0Ju16/uM5K82mj+UecFVmb5HM/lLnXijbw2whEltrg21tCikWSILqFBo8fpMxjbF/C/jRGVUwocoFnYA5/05MgV7708UM23ZojtB9OE6rqOGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KKotvJ+n; arc=fail smtp.client-ip=52.101.229.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KKotvJ+n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tg1cMqPtoeYDIYGlIkaXmV8tBrT4C2BwL2zXQwn9QvHhIS5qtUB/gKbkForiEGfxOm/SRgnsfPyQx6VxT+YCVhzYxWqA9UCrjCzxElWoCFnoo3gW+CtwGvrLzp/7fHdA4jTA2pZg1duEf+S6X0oIqD2yywwmTgBp6B6q1dJ/5hATYWhICBl2fvcfs+sYH+xMiYXJh+t0VZu54p7jQsf5E8wIYJmoYTeYoPtYMHRK2uOyctspWkca1A0iDYIHjXpBE+JqezmCqvjc3WosvaL0SN8lpUxctLK+kKF7PjWVr5Jw9zcgHbSdCvx6K3jUHgjE3rojXIjtuqUvCznr7Li29A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WisnoZkh3C90vR1EH5NgZEPWOHT0YfFYh/Sb/6BaRJA=;
 b=WBksL8ncvn08yHtMRnMHPuN4DEuiPB2FDtZf5TyigzHsbCnboM6HvAvCadDzfHFd93nHo0mR1dCHMV+URV4j2x9q8/oTsQmADgjuCBIRh/kfI1ovAu0jvLQTOjfcvaG7EsQsADO2WxVDN2ny+44QEfgxeobnTbuDRglYVEzXgdZBem96AKb/8m7RCqojiMPUWjuB0wz9pN86QH/e2nGAM1M+KuyJdMakW+Rz4SL6sD/lfH5m+YbMBnoQE20BDmUdCk8PiVpy2Ia2flXzNLBm5+m5hlZoYJcx7xiBT1Xkuyf25iVqOnHFNXePfPFq1Nx+qidrOqe6DXj+Fhc6YjD1SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WisnoZkh3C90vR1EH5NgZEPWOHT0YfFYh/Sb/6BaRJA=;
 b=KKotvJ+nBJ627F76FagWd2/xh25BVYpLLBnebrPPYYK25PFJqvMjm/IhCSijQwNYQG+C7WdDz/BO80tJk45VQc0CLdKqkPfhgLiUIksB+uqcbzyN5mZRZsgPpDrCr4609eu/1lfoRE+aUdizFhP+iIY2gUZgiscHzWYj/REdGas=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB14045.jpnprd01.prod.outlook.com (2603:1096:405:220::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.22; Mon, 13 Jul
 2026 00:27:36 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 00:27:36 +0000
Message-ID: <87ik6j20p3.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jihed Chaibi <jihed.chaibi.dev@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: Jihed Chaibi <jihed.chaibi.dev@gmail.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 5/5] ASoC: cirrus: use .auto_selectable_formats
In-Reply-To: <87pl0r20qo.wl-kuninori.morimoto.gx@renesas.com>
References: <87pl0r20qo.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 13 Jul 2026 00:27:36 +0000
X-ClientProxiedBy: TYCP286CA0209.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB14045:EE_
X-MS-Office365-Filtering-Correlation-Id: 9289c719-a352-41d4-6078-08dee07589fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|1800799024|366016|11063799006|56012099006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	Eae+SUNrUKd5Rmw67CAP94fp5vuFhvQLVlPlbgvQRUy3RZlo6YNks/d1f0s/GjJQvFasiXSPqb5f+jqyU0NUd/fMCqJJm2PKJ3Z94AQ2jLBexsXYMf8pB2cpihvsfXH7qFNSynCYtYwOxZOG4xiH+RFgE+jNiV7VOMXl+bBwFbNqwMBJ/IMlOKyIQjlrQnwZpw36vs1bP6adOZQxmlW3SGzczSLOD2JEgTclgZxetGZ8j4R20vqYuLNySslJGEyy14x5Zq6DU90fQWz//Ja6NFvEbXRN1+7FFo0LRkCWkAFZXdzgHG39pfr+0VBcvyCtJ78KI40NryZIV3ny/uFy3sibL7PtmjiCYQThUkSmq9Pu8tMl91VlCuLk52Xc8K3gqUFlfavAsS/jL1UZ5QvgPV4ErtppIpQBi/Biwk8YGrnGYw+5/L8V9GiWz/jM/chm2dNUs8KVUxnJ80dr/G1zKgPq7yQbmWtkD6NIEETiYOFsGqk0tqO8DogPLhW4D0TE7rnHE5vZ5So5PGRXHBx9mB2JnXzn8Fvizt0jjBztzRl+/Lb/kiGdvYyRHvhfD0ZobujClh0QPxv/MWRO9YfERPgZieFF46oShVt6L3TB3vaTRUcf2ZXZuoyx/OdiZZuuCgA9SrB8dKOma9C55lvaumNUSARzXSlMy/dsK/hXAFx04UNu2OFe55vBc+jncds0bTVQ79aiXY7ZEl0HNa1vpVfOVm48QfVXzpcEhQRensg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(1800799024)(366016)(11063799006)(56012099006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sNIw+Uz1XWjMj5mHz9dx0CSikBdGwXqnHFu2CqzleGd3CyA9H2f57L4atviF?=
 =?us-ascii?Q?AhqKF17BZPnKHjPvmK7RJdvNaC4IvVYBVt/WlWINb43NwJYLIGL44fB36QDF?=
 =?us-ascii?Q?tNT6Z9HaR71I8g7/CQurMcXflbSxfSyc/rJxD80530AaGdRZlS35ptQsjbl9?=
 =?us-ascii?Q?ndovJ6qklSwZlf+g38rUkxlVg4uhbms7C3q0lWPA5A8Qx0fgFs8sOJCnwrzZ?=
 =?us-ascii?Q?z/KxJtODbNae/KF0cBYyOq0BrUezKg79nrRRB2hXYazT9voPDK2/0BrvDBD9?=
 =?us-ascii?Q?+7y7aLCNIS78GyRjxthuNPRaE0wL+i+poDig6X6jEIUGj4B55M8VihHAomVQ?=
 =?us-ascii?Q?ghEQzMPiZNeZ9eawhL9k1uai49Edk+JyX0E95wR0IL3MW2ip+kU+ABONxT+J?=
 =?us-ascii?Q?e9jlHWf9J/iRE5VzwbwouDaxkPgWXw8F4MlFjNcKmFf9KqemgJERoJrgSmJn?=
 =?us-ascii?Q?+ZO8Q2TEbx6ytNswkL0aQSqA4LCueRISB/yi8NXaAobVm3iEjUxdmjb9Uqoa?=
 =?us-ascii?Q?q27xXq/GsPh8s0+iwOCQTBv8JuDa8lqh/vz3HAVrWwVbuFCWETM87rUQQg0J?=
 =?us-ascii?Q?fX82gWCBxPsGvffKrl5KYh8945IGXzwtb24UHn7Eb5oAb9JY77uaG+klu+7K?=
 =?us-ascii?Q?IEVTx1dP5yrujwEiaCZgDYOJJ49529T716DhtI6u31Bz4cAn2/3EK7j8/9Qt?=
 =?us-ascii?Q?kPwhHU9pvxROtif9jOM1ezB+UaadiD1sbvaNxc6szeUj/yjNz09kvoQqITUJ?=
 =?us-ascii?Q?yAZE4tXp+pOGfQ5zgnhGpx9CsrylAMGda8Vv3l4Fr5t702c6LJwA8Z5SUEe2?=
 =?us-ascii?Q?vaTePV5rKPxXNSeoOeylwcM2ikeF+V6e0YcN3+OnYwIUWIB0jdOTPirrZhEx?=
 =?us-ascii?Q?ryiXz7aC8+sZ5EQI+vmoVEkR4ji3woa0RaBpOxCPX6n2Ya4ufsABTOqQCqaQ?=
 =?us-ascii?Q?IPjJqKqbPHobSiwdhyS6IBs/ETzr5YL3S5AnSAQ/6WkuBIPr5VA4CsOZOgsr?=
 =?us-ascii?Q?c5d2qlDDDsqfncRx9wUJhOrJXYnZapb4WX8241yI0FJACvEOmZ1UHzHejTg9?=
 =?us-ascii?Q?kxOkzybBEJAISV0SNaCPddVdJOs12RPCfhDQpu4MOmyc4rrc+WIwFiPO7F6z?=
 =?us-ascii?Q?ty9GWyC1XQeK0LU3iA4C/7EKnWZWotXzDWU93v3/YTfVoteLpU4mECN7eHj5?=
 =?us-ascii?Q?8KsD1i0cKeJhse2HFxr2t6tVF14vxZxucEmdUTevwV68BLV/+jBZKFfaywDv?=
 =?us-ascii?Q?L6Pjn9Rgh1RqmdDXW3T7y3t1b6uEG24ljfDR+UF5RqUSEjwBu6snHJFyaDQj?=
 =?us-ascii?Q?TC7oZF/wnVmAQ72kpBMBM9LcKCobKk/6s7AQS11chaq7WlWhwTCteFTJvz/9?=
 =?us-ascii?Q?FFL42R4K1tY1qDJnNJXcTk5iEzAyC9DRGCKGYz5vqfM/ersWtHkNPdZ4JJmR?=
 =?us-ascii?Q?8wnfeUxPgfvP5PzvKF1+uCIfKGFy8kZnjRFpZaWrgLvvw1Xnp4YQK0UNFRFx?=
 =?us-ascii?Q?SCRfsrFP1D9KW4FTxuAfh3Iea0wQSGAUKWMtVm13UR5Btg6p+tZ7yGSwkSq3?=
 =?us-ascii?Q?CyDDK+PxNfbpGw6ihe42+PqkscTb7xWlrs2LWEwRAOcxY03Uk0WsOUGvjztu?=
 =?us-ascii?Q?tDGmp/aAwCpArATpw6+k0K8U6sY9ryF7HUPkPyastbVG4WF7tbiFyDTkGJyW?=
 =?us-ascii?Q?ohRLjPYIPCvkOC4xUmwI97hGf8AUe+WBKtjfgRH2gcmsSZUooaUXF89NrH/0?=
 =?us-ascii?Q?u5135VF8CpAcNZn256wwd7u0MiS/YQQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9289c719-a352-41d4-6078-08dee07589fd
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 00:27:36.5811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VtZSNMb9Bs/xjqMrrJs19omJ7td1SWfTuxOsElL5iUuzRVLtMYQ5U29i531VsMwntrAURLyF0uZALi4KzU0Jx6xeQnecd7EFkp62JHW7BNQQQKyZINqbTO+Kur1F/Sle
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14045

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/cirrus/ep93xx-i2s.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index 5dba741594fab..8195ed7c6dd69 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -401,6 +401,15 @@ static int ep93xx_i2s_resume(struct snd_soc_component *component)
 #define ep93xx_i2s_resume	NULL
 #endif
 
+static const u64 ep93xx_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ep93xx_i2s_dai_ops = {
 	.probe		= ep93xx_i2s_dai_probe,
 	.startup	= ep93xx_i2s_startup,
@@ -408,6 +417,8 @@ static const struct snd_soc_dai_ops ep93xx_i2s_dai_ops = {
 	.hw_params	= ep93xx_i2s_hw_params,
 	.set_sysclk	= ep93xx_i2s_set_sysclk,
 	.set_fmt	= ep93xx_i2s_set_dai_fmt,
+	.auto_selectable_formats	= &ep93xx_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define EP93XX_I2S_FORMATS (SNDRV_PCM_FMTBIT_S32_LE)
-- 
2.53.0

