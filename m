Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010060.outbound.protection.outlook.com [52.101.229.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F93719066B
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533693; cv=fail; b=bkb2DMe7HQ3R/aluILiNOKqABua1smeMRFrW76WtWWMG8yNpHBgMsVXFHTh3zsz8p2h2kTQb1kgpABI1TOG2dFxQxPmw6afOEFFJmiFvs49LI9jefJUBeJ/59EbVBW/FaLZj5f0JSlqCQbWEiRJC89J7Rtqdmk0BBx5mXf9IjYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533693; c=relaxed/simple;
	bh=9DwalvJD5fIff0FjI3HtbfUybX/Xef2ngL8xhtU2qAo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NdM8g5yTLzFYmezc/iTS66jAhDIBJ3CaJwM80Bv2ZgnsfgZJpTmlSZBapdelaVvLilke88V7NwIFEHG2h8w1wCjhIcEFMzLiuDspX3rcijK/RoqIoU0AxpB1P+u592SIHwzUIfXlGRhi/h1Xx5XVEe47A7rRRAbqkp3+n+eVsus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LNqPMEpA; arc=fail smtp.client-ip=52.101.229.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LNqPMEpA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cs+63CJvZSYOgl91hKB7QglT/uizrclFEq7BZBXcAoThMK86pzTfY2WGWSsHrPn6ufuNWqEc4YsYvWyC1NqXRmqhhO/6XeJnpPv5bsq4Usr/GTfi2AyEOD7PT/BKnDWHvS3BtZHUFmMckMdzRrVksElyFqF9UV/9zMp2jHXkNgsmNvCIb+Qc78rh2Kj/yUp1hkDP/8ODciUuuZC7i0yFB02YXY5lBqeVrhjxamW3yYBwx2TJeQCLfKGiejeFtmsKgzw0WEsGO1fc7H2G86C0g1ydTEE4Iu3AAHvJcXz53uwTo2bs9l5tV4qHQzMDVrgN6p/4BW44saePGUvXz2kx2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y56afHJjoXBILra447R+hrdlsOY6yLqC8sMoEtT1uHU=;
 b=TEobDID9N20K+UpMAPglOwyGfXHeWrc1lQtXDkLdAO2hte9r63y/V4FgLWL9pn0ucVGmEMEss1mmszvCWdO278XjGxvMTNbN3meki21Y9jDA9C+FlbxM0I3KPcHjShbYVgBrPJiGyY5LPkhN0Zw3Q5is718uatcrJPZjBN52eLOGdQT5sBRTuQAxZ1wloXX8qGo94uU5dhSq2PKx8lMpuIqVEwbAFcyrmRd4e/4eouaergXUWh4eWPb8JSn4gsJsQL8phj6XO+EppgN6qZI5Bq6kqWqzAaQXJNqLQAvH2kQF04o5veONGjFgpOSrME41NUdAkiev41dl4eSfUsN5Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y56afHJjoXBILra447R+hrdlsOY6yLqC8sMoEtT1uHU=;
 b=LNqPMEpAa7285H0vVLaZKJePQyYjaGsy3zUrdZ6InhpOC5nc+6bJ2CnjQCddzYg34Fq9KrfqAeEtjavIlm2UZ1dbPCzk/TbWGR8Wkgkn/EztCZ0b/1xKk4zjNzG3zAlHRGNb0incWhfYs+1NJIjxAP8IrY8pmvnTTzDghF2s46w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8745.jpnprd01.prod.outlook.com
 (2603:1096:604:151::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.23; Wed, 26 Feb
 2025 01:34:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:34:49 +0000
Message-ID: <87frk1cwuf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 075/157] ASoC: codec: wm8737: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:34:49 +0000
X-ClientProxiedBy: TYAPR03CA0009.apcprd03.prod.outlook.com
 (2603:1096:404:14::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: 79e419ba-1e05-45b2-f9e6-08dd5605c2a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2YBE5p9FJJKudba0lmhRdOZ770ZpsvEgUmINpnCqUQMQctUOPHPYgxAsxeUz?=
 =?us-ascii?Q?YVwV0Bd3Qvb6Ykh1Ej7n9zni+CowQM4EXKsmJFokNT2foLG5YoFSBz1vJUzz?=
 =?us-ascii?Q?lhaO1d9hnQkGhQVBOAS3TjNp2tJXpDqWlVAWbyg2DTLEv21/vAq1BlY9Q5tr?=
 =?us-ascii?Q?ptpM6UIA8rV0GmSKZ/kNCQwCCJsaQlLY/3s946aPcFns1Gtvb4TplhOqY/zu?=
 =?us-ascii?Q?yS4OAt63NHw6nAbSeEDP5TVWY1IiWSn83GjeGnBRx19aGZhBQz+kEtvDeydD?=
 =?us-ascii?Q?eDNgHNLvLwpV7FDKphfgJ+Fayk66CwZGssL7xFQWPL2MPefUwoYcJoh/43JG?=
 =?us-ascii?Q?/nXLCbo905zoGxZgua8Hv9GIbVdziS38Vrqu43PrThTIDK4oqjfdQ7eC4Cwc?=
 =?us-ascii?Q?VlSUsRwHqTGa5xGGVtYHk3NSIxLNPxIyxsVtNvHxFZUCZ6qTg3Sa7/8FEoKv?=
 =?us-ascii?Q?oAQzc4KPabFODzuNgPS2RFo/jo0ewb80sDrZWzzsNzY8hrOWkTVmussnnMME?=
 =?us-ascii?Q?tInys8EofM163+GLYgtjmGOD2n8dVK6VNWnvPcHONy0CNGI1TecDaskXCb1Z?=
 =?us-ascii?Q?UjisunoyvOeEA/BlBH5IEg3SYP5wGbcVuD7OCZY0Lg8dv2g+wewdK9hIFXUL?=
 =?us-ascii?Q?NP3A7yN0kilhynTv4yqf2AVnIkuRnMREp+SS/dlufkDAR6Z/u+WIzPTRt2GA?=
 =?us-ascii?Q?9k2PH0EBiQic1Yw3P/HoDHUNhF42gD6yM1tPh4cfpdWHsSdzYKO/WkR4t3dm?=
 =?us-ascii?Q?Os/R9adQ78AdLWPeDNajm3v5wP+Ym9Gac+S6pjnBxhLF1O5y5rV8BTBgZx4S?=
 =?us-ascii?Q?oaKPnh6JBp+lgxyFbglzO+FIcu3VGvkmzWZMQx0dcBakHaP4f9bBK8Og8APB?=
 =?us-ascii?Q?MWrBwH8nnSmJwMJFTRXy32i+bCjG2SBuQozD25PjbPYJYkUb9OzFbcJWoNJm?=
 =?us-ascii?Q?tGvERXGmPyI0ERxE2rTUzCSwoRZBuFhmVaVTvSWURYdkRcZhdMLguJRVtda1?=
 =?us-ascii?Q?Y68vN6VuNltqYjkcMl/zq9CuQmjo46+VHheEr6hcmzZICTn/fe3OCpDvFyzq?=
 =?us-ascii?Q?vOwhX6hk25aGFS1hGu9WFmDTQ0jVQI4Rhx6hDtiSoAIqkKRyXBEqyZUkjdPP?=
 =?us-ascii?Q?6w2uhBgfIYHa739TDFS8JixrS/HxQU+l1uQnj2d06agdmKvk58x2BEGhtICP?=
 =?us-ascii?Q?ogmX76lWR+JTL41++UAVHGUBK4CY0KzVVf5Rb481/xeu6JrDRo0/Do7Jx4kL?=
 =?us-ascii?Q?QqdfoQoU8iaHbuUSdgVOKJz7xMkkPU5DXNIIee+HsXC6lAZ5w6ka18UrV3Km?=
 =?us-ascii?Q?3vSFDvzxmBqEqgTmfhYNmIETXmWC1WFn7vYCipE6kc/+8aJ9BtsyFitRR7I3?=
 =?us-ascii?Q?zO9R9uubGDl1fc2wjxuW6wb9Jgj6HG57uVVa/34cFODxBj3d5pmI7w07OoHp?=
 =?us-ascii?Q?noLRc+SvvLQEXUk7ZVAyWucxhbs6fdpO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OYeLtEbun9PqGuj8m/FbpQZuJunr1/NX3gQA9E5HivhGYqoRz7nzPodj3YDw?=
 =?us-ascii?Q?lqNeGXgXyZJH9Po79JP3JRkczEv1Ohvvle2L9aF8I3zM24pzbZGcjONG3r+O?=
 =?us-ascii?Q?XifPLFmie3KlRn7kSd9w/gPVfP9MJi1hjFRJRf3DIEvifqSCnZ30CMp7b6WX?=
 =?us-ascii?Q?hKRYi+kcgSKENVUcxRi4z0mAm62F1nrWrXfv2qeZQc/6sxpqPEB3XvpXaijh?=
 =?us-ascii?Q?7B3YrdcOXa7o0mIGGMVRzuV0C0YS8xa7MuXwd1sei7pfV4otqNbzh4XFxfue?=
 =?us-ascii?Q?YnzD20Z6aUxIGbteLXrPD+ZkLVs9Yj2jmU6LFCXnb0oodSbMkhZ/V+JJYEyX?=
 =?us-ascii?Q?HjW9mI9Ttxy1dVMq9p4CApZ1yJ0TpfR/BUC9sipkSxoeiDBI7cfe/Dz0L0/e?=
 =?us-ascii?Q?HT+sSBmKP0VGRhWTTlv0a+BUV+hh6y/Oz80BpywLfSj3VKwTUPqzS8lI8/Xx?=
 =?us-ascii?Q?S0WNGcb8rWEwa/JnAJqciIdA6r4ybPZRR6xloMZRVDr6R/w5DlAnFUpUusMg?=
 =?us-ascii?Q?kdLSsDdDQKhBfudvNYWv55qgWvFX2SCvMzRn3Z5mFN/alQZsTwRpaRklE5Ow?=
 =?us-ascii?Q?pIcMBbSt3NN9S0dDfVnLh34USx0tdCBGB5us1Am7lxPibagNMnejp32eA7iw?=
 =?us-ascii?Q?Z+bj1/ZAGO1/+C2nKWVdRxyIKOpaBcOuKXtjE6cj/pcvEE7vQDlUS7KAbxpx?=
 =?us-ascii?Q?LUQM8JsQsV0uXnrbIlR6rYjaYxrap6Jv5kSoizkMReBO/FUTGCs4AfNvMXKg?=
 =?us-ascii?Q?W/57qBh4rbTXr6NQ/bIjceefB3rhx2aPatwAjP3J9UP+ZhK8d07saq2OSPBI?=
 =?us-ascii?Q?tFaVoiRVvxCqipjqsIZdFkACgeawDGeyzlE2yRM59C47PzBcuvC/D4Zjoq7R?=
 =?us-ascii?Q?+SR1e+vUY2nhNlSHdAUok+psjac48BiLWMQi7WxTohbEMmTICTM1Qjjx7Snj?=
 =?us-ascii?Q?3iJ0bSUcEGoKPRgdxLJAWQe8eS2EwX6XaW/DO8BvJS3961Yh84HmR0942EyQ?=
 =?us-ascii?Q?DYXjgTs5jPnwHGb5W9ZJB0evZDQG3LqcI8x/ZNgjb1Kb1YNxvDNtG9KjtCTX?=
 =?us-ascii?Q?oKgQwD4zu4U1oNz8xXP/yZ/mwy3634hWrOoMAxPqsJbBmcinoeHVay5sy3Cl?=
 =?us-ascii?Q?S7WoBaLltylY9aZBtkEDqS48zxiG10qCsnu/COT8NDg4K3nhYCVX+FuldnAl?=
 =?us-ascii?Q?0PEbLJgzDc7/RQSD8VqQUcuG9Q/6ogqyzZqlYc2Vhnsk91I74LX9ChKG1Jts?=
 =?us-ascii?Q?yBubgL1kLDWsu4lzidFgXbPR2pZKegwRuEyfIb3Bs4wScMDsvgQtd1IQSfFT?=
 =?us-ascii?Q?SVu8y0kYqTkSGb1L7f/RLGoqO4KoAKoOq7PYiw4xtkfpOc7uAiXUSfxe+E3U?=
 =?us-ascii?Q?35jdzZtyt+wiptgpDh/oBNXI3wF7H+0ZCUgDw0BSP8f9DXUCYpp7VzY//ApD?=
 =?us-ascii?Q?dSNM0ecJEzsy0TiwTDMAU4WgCARgYSlOZTTIhXm8eqU8AkPcuTAZkNIOY8tC?=
 =?us-ascii?Q?8TySs/xA6CYntYOjiHd9uZlRKLzIGli6Vcw3kB/IrkTghdHF9OzpalUrWB0M?=
 =?us-ascii?Q?cd3bOO9c+glaqNATHGD4mEeLw96tbUhpmImhAWz6Rpq207DawDAitLE04NmP?=
 =?us-ascii?Q?1JYndYL38v8PJ58KkBdmJYM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e419ba-1e05-45b2-f9e6-08dd5605c2a4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:34:49.8707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nSZ0molJJm3oR5lZ/oUoBJlkgGEB/5tMfpJiD8KiqfrV7CmX8zaTTigdHelbhtspL9E88IxxS3ILo8SPWWIMZMJzYoYDhSwjaw50t9oSa5AD4f9LrScc7hVGQaLNX1/o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8745

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8737.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8737.c b/sound/soc/codecs/wm8737.c
index efdc242c2ede..f7e48f27649d 100644
--- a/sound/soc/codecs/wm8737.c
+++ b/sound/soc/codecs/wm8737.c
@@ -404,10 +404,10 @@ static int wm8737_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	u16 af = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		af |= WM8737_MS;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

