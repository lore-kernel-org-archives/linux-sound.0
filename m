Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011047.outbound.protection.outlook.com [40.107.74.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421FD18DF6B
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533539; cv=fail; b=s4mX3N1QM5keATflSnRU9mHPqNKoYwXoiTRq4zXUM2lXbdYJydlLdiuW5UQdBgx0NMbdMJemQHwx8MqpgCnytJh2LRG6K2yIjwxhIow/65tetuGi7h8+U68i62+krcjAB+2p1D2Gac3aUOItvnUaF8g24HxKvABzEqQ/+yEZudk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533539; c=relaxed/simple;
	bh=QatuPuT15CYTkRBb82cB3eeo3htjpXzCQ9ZQjYenzw0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tt+Ww6s+2utUJ4z9b4w6+v3E7FuFXUcXRxfQbrASVxiad1LczNOFDHeC+Y4cWCHBVYLew+zJTDc4Vx6Q/pQAT08EL/ivvBCmNaoGJsd61WOHxYYmhRGyWq8MmrU0j9tRxXc8OMj5P1e7qyf0YQye4PCCdWIX9DXNCoOLIV2qLHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=I8CWF1wJ; arc=fail smtp.client-ip=40.107.74.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="I8CWF1wJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WnblGv08XmGIM4U1t7UQcj7e6pAqcnHFHt3qAGcn06BAluM683Sk6OAvyFrpwCZ+HG+rWO7S5JpeVRn7CScwhJXE/0mEGeBONzDIeuq1jbbqaXPt1oV/DPP++mKjnTHGQ90C747+Kq96WcMaxmqL9fKy4bxWX5RzpHJViAgce1qfo6pMW5jQB0hJ+jUJKscy0YRNgxQdLo5IsmXwuvFRk2+QedbaayVmTFkAs1mwGDQBCM2GPsCM6uu5iKAHkYXldq/IaG24RVAzcILgUYLLiuYaTtuO5u5m6ea+KUje1a6zui3sUI6KwGiKlIc4F1jQVsghtLuFhoLMlzYnVQT6PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgcdfRRfN3BBF5/tzZW5kDnhc3i/O6U218BixCf22wI=;
 b=uhhPJAX4KR94gzGYL0wbcg7MAJZiCaOyGlYaE1/34kp1zsYLujgRhvSUmXTEY4ExjhJ/2UQmEEDMHM3EZjIFLw65X3LlF/nEORI12yeUQM0ScozXfR0ghcpW+Hl/VHuNm2ezQ16mcS3PtzS1crNN6aOboPSXUdlSY7+FvBidNWzT+evBpJya3bgKMeq8W0247rXFGhkHyR/Nc40TX1kKraDpQz12Izkfc3WntGaGqthb4jPfZRKQU9fMrBwQUVCxSgdHbI0U3JMyftWIybH5U0FRM2AqJkScQY0FVOEAoPJICV17SfzFs0qXarrOTozWcB5Q4nJ+StRd4LoM8Y1/aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgcdfRRfN3BBF5/tzZW5kDnhc3i/O6U218BixCf22wI=;
 b=I8CWF1wJG68kQoyXez2+VE8As50WW1N31Al0LCgSow1mEXyrd0rrxXVfpuo6nzAFzorvV4guU9eJc5LnLn1nw+l7xdEQNbj0g7IZvOTXR7L7SNqrKbVZBhoqgo8dvtbBuBH7P0t0hJNw661zYf9nfQ12xiolqJGbiGug+XGmedM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14997.jpnprd01.prod.outlook.com
 (2603:1096:604:3a9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:32:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:32:16 +0000
Message-ID: <8734g1fq3k.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 034/157] ASoC: codec: da7219: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:32:16 +0000
X-ClientProxiedBy: TYCP286CA0289.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14997:EE_
X-MS-Office365-Filtering-Correlation-Id: 900cd3bd-5345-464c-f1b2-08dd5605671f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q/fYEsr87Wr8jNL6sxdifcOejecl6E2uK7IjwqKlQZK3bL7FHGX/BFFQlf44?=
 =?us-ascii?Q?RG9MzA3OvfYF9aryFbxGJsXOAubP86avET6lw8koVgXMYZGvyte+MBC/roZd?=
 =?us-ascii?Q?P6MtT9GYRmAo1dhMxnyEurz50g+UMQ2QPF+98favmO+U9PMD8BBcFSkA045e?=
 =?us-ascii?Q?oD3EW8zfuAYUAPlH5kqPuT+E8MFpPXeDWQFz3IsZIZtN6QUsYcramGIl+1aF?=
 =?us-ascii?Q?HK/0SJr+mIz9A30VXolooCwfJ7d0PIO60NjPO671iSVf4vj3dUK30aajMqPE?=
 =?us-ascii?Q?4v+LRkHWZMl0G6dxz8WG1wyAIDueLkOzuem4/T3ry/AXmV0J5Pr3bTufMnD4?=
 =?us-ascii?Q?j3gBDrCkUFl1oq/ck6hVraqRzV54DbxFqrSV0jVQ+QwiVa+bML9SoetQqsUX?=
 =?us-ascii?Q?wTRRn3brXKuHIwDnKdFY/cKinqIRdVgFJ4popzOOs+X9LG7Rx5KDNAO+w9O3?=
 =?us-ascii?Q?Eg/FQZeYhdStlu3XFoA6qULOFUe2F5PljnSyucogxNA1b06TL+G7iC4SHOLj?=
 =?us-ascii?Q?FDhldgpkdXJTysel88gjWkzdcRxG5U1gUGK5bWzgS2vg6RXHxlmgFJWMluR+?=
 =?us-ascii?Q?EQswVJb2At6C2weQiCoWE8FjzXnzxpwK+ZZL/9V0MTOJ9brAnQDJ/Y8mE+Dq?=
 =?us-ascii?Q?WrBABqcHZb1fhx6KM2h0ZDuBgqTpSmiuWGcmjSaX+25wofNXh/bXDgaRCR6W?=
 =?us-ascii?Q?RzstDH1py5/w7uaMd++LQA/twd+JyOu1W+2TI11Q9Dxi2llMCRrZWUx3TQjf?=
 =?us-ascii?Q?3aWtehkfVocr5Iy9ee6BuN/rDQ2na4jqEGsOEmL2k5p+dciWoLMsmqBh0I0l?=
 =?us-ascii?Q?MVQpgQMUyku8O/aymRM0yf2ZEvU5rSREwrC8yCQjJLw1cnZZ3mjgU50qM40b?=
 =?us-ascii?Q?3KQtpvRTRgdep0cjOZHITR54VfJC519+nAWB85D9iKAgLMIQbFP0AWwhEPaO?=
 =?us-ascii?Q?Pom1zF56fwUDRhk+bPPEGlN0a8WYt+GVBZQrrPnhXErqnoyaQ3w6E72f+MD9?=
 =?us-ascii?Q?STh2+LiDYJdia9HczOvsOZ/es+gO1D3AKjIWVLGTPk4s5xlK9xmTtDStumLZ?=
 =?us-ascii?Q?z3Uj/RLFLgX5lPaBCRAjOZwB/tE21ZqVQKzv3i+5uKvBqn1QGQ67QbUok3H4?=
 =?us-ascii?Q?SBVwUdttTnNKml5DWqBzfIq4cu2ooeL24Lk7UaP9D5Mr1VtzmsKAH2dv4wj7?=
 =?us-ascii?Q?zjJvRSbShsyw79LDAdyyOHA2IKPjuhFUevpWoizEvOCkO1Pv6YFwGSxTsvyr?=
 =?us-ascii?Q?QHOOr4vGcUvCz6gpg+YaJdA2eFtUVfjS7NTcnqIxGUeGyHsBS38uCiMtbAxD?=
 =?us-ascii?Q?rMOy/pyNQ/Yttyaxi7MqMrhYy90tX8TwvfSvp4xm4GIL6xszhIR9ZlYSeyXS?=
 =?us-ascii?Q?ljoWgfX0zlwPEpywVP+806pRyICNBKqruzBG7BSyH+vZta9NfXhvr3QBCixh?=
 =?us-ascii?Q?VJhTRClatH2yFw+EVaagLf6kZOBCzjRJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?32L4LIR/i1OCp0bv0uY28IOvmmizdLrKp9tEDttX+9ZDLwNvHHlLvGasI40U?=
 =?us-ascii?Q?hYXwQw/vmt4lcrxnCqbvnSXCom/Z3cRgqCBIbZBIXYc3Rmd0T925Glt2Uhi0?=
 =?us-ascii?Q?XYMRCi5xi2GFH9JSPeXIMz+gcJZuBINb2Y7GAcQhEFrdomfDf2rlaITxxLEn?=
 =?us-ascii?Q?YTKsYEnOnGBgOEU8RsXrm/fTLBvWMip4mAMX9JZD3AaSVQ5VtZmOybSaLH5A?=
 =?us-ascii?Q?SmjlWEldWKw1nNgc4ZUHAlcaWC51q68O4xHj6UTSq9chzusJKG0WGLDa4Tdb?=
 =?us-ascii?Q?CeutJ6qxy2tlkchbGZ64w8d885Y59kA32Zf2DTVwywQYTRgSHGEsVbuyxd5H?=
 =?us-ascii?Q?QqaqsTyddF2DA0Nctn48Xyk22Zc3p1eddxaiU9oe3D/DRPkMZ6XOJGZBkFZX?=
 =?us-ascii?Q?mC3fF1iDTXuBFAwJD2dw5tA8yGPusJ8xb1ltZ/g+/HvKODElNkRucUYTd8fJ?=
 =?us-ascii?Q?4yhTpsOVwTUPKEVla4SgbKFyyNAEnrxA2iPOUuYIVA/cF0JIvQ3l+jAL9JiQ?=
 =?us-ascii?Q?Xm78YH1lKSGks+80E6hfderCOk+bjKIyYAmyNuuQaT6bucmF3S3w/Dj51sbL?=
 =?us-ascii?Q?G4MwHSH4jxVUjPGQ+PHMbNOQMh+sN7nVHQubtyh6MdyOUsquVET+qZeBbObt?=
 =?us-ascii?Q?YC4/M6ZUozVn83S46FTbxksw6iZm1HVWabwUrp1kztuiBMibpxjXr3nACKYY?=
 =?us-ascii?Q?qk7r4rlmmHmADQixj3qa+erDN11BwQq1tnfHBu5lAn7x1c3iCjJu53rY55XS?=
 =?us-ascii?Q?PIug09p0r7f6BLRFlpt0x/dI97grdfYc/M+T1V5Dp37ck9TSeAYigyXrAHbO?=
 =?us-ascii?Q?gEbRbkpOaoTS42jQ71Tr7RVBRuf9B1h0Ff30cHr38uVJpdWTD2lx/6bf9tix?=
 =?us-ascii?Q?jVkkz8j6PBBjTrry7WfmnOtRz1gciy3tLlI5MY03NvH9qy3Oej8g+VXNwuyO?=
 =?us-ascii?Q?V54XbCqZwAtNNKSS8wDchHhcMrVDLiObspTcQt+E6tMicGt7WyrYNxAIsYgz?=
 =?us-ascii?Q?vrK0m3yCrYYJS9RIdp+kOahdJbXBG8Hd36xxgvC13Kr5dN7T++EaVBolUxDc?=
 =?us-ascii?Q?S2wPo4rUWdOanCSWlIgU3qDCIYisw20XG/VXiC6goSmuDZ1n/1oWo86LM2Iv?=
 =?us-ascii?Q?oePgGrq2tP52ICzlHPLQtdkMAN30nVrAxg576JROI265ItNnImAnWj3abQS4?=
 =?us-ascii?Q?8VFp1GWwAYPueJTAYuyU6Ti4xGzzyXZy+bXxp16EGS+WJDGZ9/BMLwSsAGVD?=
 =?us-ascii?Q?3Rb6Tq9i97K4l7CVoPKzXJhRx09Fh08sEtYIWt1qRII9PA4gPREM5h3mqUPN?=
 =?us-ascii?Q?HlQVcewKfiVEFbO+Mxaz0N9WUUbgUuTUymQqGIf4KfpBcdlvCPdoxvMiYr8T?=
 =?us-ascii?Q?eJN1+S5Ki6r/3ZREtNdQtoZ4LthqmK4+ArAvRputwXVCr2QSMtc5Uc5COPVi?=
 =?us-ascii?Q?7fJxGIqlaKR1QAR35dC/P1QSg9nkX92VVvuMAlJPVBI42fd4WOqL7lGzjA1V?=
 =?us-ascii?Q?dRKuyq7JA5T/mddYKKXQ+0E7sesakQ9IO//Qnl+FeHYxbgNaHF0vAe0oUB3H?=
 =?us-ascii?Q?zXEDjQV/cl/2lDLogydUckd/DrdMH3LMlgXVsQH83xxKWC4kl3k5KJ/238px?=
 =?us-ascii?Q?kzaIH9wlTBOsmhfmDDH62ME=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 900cd3bd-5345-464c-f1b2-08dd5605671f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:32:16.2682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2JQLsPqzaKvUUKaxC+MLGQq1m76XMJd24/CBq+hiH0XggbbEBcUoSzv7s06OO7MDvAcMZ+NCUwz2cehwhdjLlwf9bizmKueLZZGLYZEdEEpyGrSrivjTz7L24MzSyjv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14997

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/da7219.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index e2da3e317b5a..3958e88a2445 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -1312,10 +1312,10 @@ static int da7219_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	u8 dai_clk_mode = 0, dai_ctrl = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		da7219->master = true;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		da7219->master = false;
 		break;
 	default:
-- 
2.43.0

