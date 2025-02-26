Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010000.outbound.protection.outlook.com [52.101.229.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2499519340E
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533794; cv=fail; b=EfrBOE8QNT6g1tmRKPHqsDgt7qobRjHMq/mH+CBuoUweBeJJlL3DVcQQ/JnbksHsqPAQMG4OHPS0sXQaF7/qEDxQyzaeyqxx0jVqVyYem4VGTHMEnD8kRGxTAsZ8vsnjehWIQHp+3ri1YVl/ze7K1pkhWPha1yTJPBtfmINbjjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533794; c=relaxed/simple;
	bh=1aqMwgnWVhskcH7EB6hfpWelFhj17YEJ3f1ENpjCxTM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=njMiV0ctuI4eXL32KasBJpln+N0GVMQGFs2IZDAJEt37oOrY8HGOznoAwBIaw2w0frw4znD1Vl8VeP2Rz/hdiaLmKbjw7AguyGsY1tQ326Rh++JY+KGnYUHYc87pE3T4MdtGzhDelhG4oqrNoJooJNvXFRlj2uyuwkGAAXatW8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=G3o1hl59; arc=fail smtp.client-ip=52.101.229.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="G3o1hl59"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brghjvp9RoSHGjnxD5viciKyh4H3lRldsQ5JGFsWbPICtwPei/Fe6nha7XddbWw/HSMeBEWnF4odDUhxFhR45z2hweaw6MlwE8esVnGZwTDdobDtbUjSslLNskAdcdJjH9XSynsBBn8tNYZw74aq+OgfqH2Ye29qDYN6TNDplwhE6KeDZc7Nb3pyZpl2Nb6mXerThugC528f+BgJk1UY1kXZnO9RB4aFrwvHhumYablKFoQcsiiPv8D75drErDUg7z+fQQDcre84H8VWe8gSaK6/onZ/DvqU1znW0lWACvjalmnT4eFxi1tiN9JJp+ODXza/XEKp1K992h/rQ62eXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFgdpj2vvp4/cMhVgk0DAtggTXHw1Sg0sX29gRtgXEM=;
 b=H+sSRMMJiIaXOc4XvJ64xMag6y8LtmrKWyca+hL63zHww7EBRl79JWBdB6viXNWu5ee1Yw9t/7Qrt5tWnjXbjGIa8VeUWCFOCZhz9m/dW5K1cboO/tqR13RMIK4wMORf46pql04C2MeV3sfOhc7eV3ZutyuY04ld9LxvEpgK0fZZi4BaovAOkmkj/IYM2thBneemt0Q76ynpI7SRijFoROVSf1XkYXG3UjZPAgrYvabz0obPlFB9P1Y7LpozAFd0jupcCrLbjXXQcVJlq6t6QfTWuUHMjriWrchIYTy1ajH3DyHa7QpOMbXOY62sqnDC+Ucx0PbDUf7OlpOHUvU+Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFgdpj2vvp4/cMhVgk0DAtggTXHw1Sg0sX29gRtgXEM=;
 b=G3o1hl59bZo115Ezo0wiZdlZt0fdNB4dbS/rbNNBw4EUsi+DaDSpt1EhRhGNRqBcNA8x2NQ8AZqblSpBe+0he/QwmP3h9wB0YUKQboAz3ktCl1GhTh9dSTMOhVLNf6d9m200M2n8O6RGPA/PD8d8jvVxirTkFp28AOQLlZEUIn8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11967.jpnprd01.prod.outlook.com
 (2603:1096:604:23e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:36:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:36:29 +0000
Message-ID: <87bjupbi76.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 103/157] ASoC: codec: wm9713: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:36:29 +0000
X-ClientProxiedBy: TYCP286CA0246.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11967:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f1e9f98-b692-44ae-7ecf-08dd5605fe18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Tcq/9UXZTzEmhHZB9d+qWu62yXYclPmi4Jem40ZqnQLz8zezi/dmbUTsunc0?=
 =?us-ascii?Q?ZcuDe3xIlTFiKmUWa8bTR4P6DaKBxYSqjwSdEmgyMyp0CRjL8SPxJTBxj3eK?=
 =?us-ascii?Q?6lnrhi4k0QtSebx+f2Kt/Rs3t2/5N63RwyCS+opIidnD2JKxwMVAXkkkqRVN?=
 =?us-ascii?Q?VA1SG/zTUvA3kBIHbLtrNbRbIvs3CjtWxRgwdF8zXQylPqMG8P+iGQAhGeqc?=
 =?us-ascii?Q?rdC5wL14azCvmfX6yc3CdNl5NbM4E/He1GIjhzR+zOoAZNJXBob+EAzgLq+S?=
 =?us-ascii?Q?xHmmO3y07i8dhuluOlW5vloRTErom/UVHbnkFINg0A2d7AjkawxR3PIfYZOA?=
 =?us-ascii?Q?UoNPeNaA2gXZ8/83nGf0wFogJpOS6azhMS7yJvuh71eMuDAnkcMEboMmbIjM?=
 =?us-ascii?Q?LLOm1ExFgr+x6V1XMyj+erea7y7kKPCBJa/i4b/ECjiYgTuQDb0iM5ZuSNDh?=
 =?us-ascii?Q?nXQ/VOC5gA1w3ORSPut+pGzLoJGuMTqtuxLPjWrYPS7KjYCPvZtwEaao5MAA?=
 =?us-ascii?Q?/dRbgQ9c5ZhZqLPkX2qxQ8JDeYuXJ1vTt54p4vxFM4k1sLQ7rfvUrkrPDiJA?=
 =?us-ascii?Q?nSujaA+MDo3VJ6WzGz5JiGFROsTpD3XqoB9HFoK/VQ0zvvqZ6VyBshVGn0jj?=
 =?us-ascii?Q?dRyg3FvX/yPHzIHnxbjV4m2wWjVSQZMVyfHyNBhr+lsggbqRlnzP75S4C2pu?=
 =?us-ascii?Q?lohUm2xiiPqoX9l28VIJl5PMHZRTPUAyG3tbMjaO91vulEGszrMiorEVISpR?=
 =?us-ascii?Q?QPrpeGjE665EeLQ3KKm9fAeonaHlxdhcR15eAVM17tRpGY/518ddKj5P1g+J?=
 =?us-ascii?Q?LC53DG0hrGe8ammAg44+p8skb9z+oRPMFq10x3JbF/0iNf0c5nzokNNzi3IH?=
 =?us-ascii?Q?/b7p40V1uIrjRb+weSin1o0cDCMHvvdmzqIRy7BvQbAJmIj0oCoY2rYrxiuE?=
 =?us-ascii?Q?+WQfU8TXgSy3fEmSrl2OfF4avu6AcQPBKtS6PiPx47iRefYSDzMr56RmeLVT?=
 =?us-ascii?Q?tQiV84vfc7bsewGW2GuvRmnnOuzezOS6UTghzDAiiP2YLjefY/J0lJ3fYAxn?=
 =?us-ascii?Q?AAlyCMyMz8qsBx2XYRLsHgBkw8Sak1DZF2Gdme/YD5EZQw2Kq9d9Jb3bMDG+?=
 =?us-ascii?Q?d+2IIsDILgvWRMZkG++Xpxmww8z8k6RiF1S1t64I9SqRZNa7Z1NgmhbMPWIE?=
 =?us-ascii?Q?uNOsK2Ky9tczagPtNYxiaC+fFmCChvpmw2hGelS+VSdy4NBqY7NCOdhkDZYF?=
 =?us-ascii?Q?xy+KdftllCt8xCBnKJGs3uWdpfewQeKVrUDuoNqBSeBWfEa7FUaC+E87aSKC?=
 =?us-ascii?Q?CjK7SeQaWnOGbdE+6ehfW67y9qe1uHQec/cXO5L+dIFNcZaZHzQWihEhMWY3?=
 =?us-ascii?Q?+OL2b1CUgzYfcnVVLvyZ0hlvx/zSIp0zwSiLjg41/V2JBE4wTaMtZOjnUHDi?=
 =?us-ascii?Q?xFl1aG3pf09/FR7PaOmhpuQQrHP23As1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jTAcDsYfCM2FzjXuyhvDvm0TcB0ZknbPOIUYCLn7Xvrsw7UfPEB948HvIOXR?=
 =?us-ascii?Q?/LiOism26pQiLznB/c1+3M2hKM0cr69xJIKm1wUz0PMcaMAQrPLwKsuPz90u?=
 =?us-ascii?Q?F7crYvAJl4fl1j8x8kUcIPQwGdFUsqu4W2Sokkcmd5+rarbatj3QX20Z0A/3?=
 =?us-ascii?Q?s9qC8LQoMzFH+NSUme06CzF0Y+l893ikWAz5Ta13oaSLMXIALsn+82t+3iGX?=
 =?us-ascii?Q?82xOI1GyOuyBmRbAFx/r32EhtTbxAttB1RT2K4J6VNKOrp7XE+z2eyFl5EyV?=
 =?us-ascii?Q?iccaxiVUUv660r7IOcyrZDlDvE7jE8kGw09JcrQhPhwLN7SSul+W90W4Muhn?=
 =?us-ascii?Q?d6AxVH0Oy7Abj5NE9eYmA3rG8IV1dg1QZHywpMnknxX148m5FwVK54iCWSaJ?=
 =?us-ascii?Q?FTulbzm87xzIvNAPMjY1ZvgPB4xmvWbtGAcA1kI4e4sQ0gEZ1I6p29UBmGlY?=
 =?us-ascii?Q?0+I154sJfalVnv/VNcGYOvwBzJ5/J9y4+5saA+jDnzY+07zvIhcUh9zIWFAt?=
 =?us-ascii?Q?fVLGEhXsVHwkDMgfwfHZw7ObXUmSycHrROD4WXCAFE5WvdZ5G47do+YmkKxM?=
 =?us-ascii?Q?3CqKsmBQQaD8ndkQQIBxEvKX4hmZ7oiZvj7lNAbGm8Ewh1n8TXsVoOTLdOwA?=
 =?us-ascii?Q?uF0BB4/ynIxLQxenaKkB6AP66HL06MwA0oMKR13MxzdrOo5VK/AeCwmzLgIW?=
 =?us-ascii?Q?FY0HMgoXBsNpr56vZ4JtMGHClJfnDyIXG7HfprLOlcbwWzmVBXGKunhVDCKa?=
 =?us-ascii?Q?UEqX05mRecvLqNdhw4o5rXtO1T2seO9qy7+H8peNGR6zYjVLe8feGlR1fzrQ?=
 =?us-ascii?Q?i2M/LnqFUbMNhR3EYBTle/xpmbfHzVRxyncpOqKGL6xmghYMRMqsReigThcM?=
 =?us-ascii?Q?KopjrCZzLvjFEtupJMYMpVkDxYRm/VxyZD1xrV9McScnexQIvQjfcJKOe2MW?=
 =?us-ascii?Q?uNwFDpUPRK8bvqjk6fc6BINEgQb5kP6gNSFWWRtLCUF4q7tKelb5dMXJzPpU?=
 =?us-ascii?Q?k+b0xv5AT8LH3KmJlanCWh6BPAE4nCiFRRdmSVGsO+NxaaD2wjqR/hcz8jIM?=
 =?us-ascii?Q?bvYjDgYWdRGgQ7yoVcFs6Zr40294TcbXNbxl/opS2oBOECzZ3WW8Fznliz5B?=
 =?us-ascii?Q?9S4JuHjkKxJKVwSPZhghRVFX9O1CJF6gc+/Uxxa/0VNDCjxRwNa5fhhF495k?=
 =?us-ascii?Q?iczr9u/gKHulWIaTL8EOY7bQsx+fl73swOgFRe5B08BE7NZ15L0JKAb7UOW1?=
 =?us-ascii?Q?FykBmFxIl793fQwoPC98byNwkDXuP7nsTKFqru6q7v1CDOFnN5myEXJSAyMi?=
 =?us-ascii?Q?JxIGG0Yq6ceCnJInnG2vy9SVsg6GNOhmLuBzoNygGrQ8qE9a5ZQERGdV6byU?=
 =?us-ascii?Q?XSmzR1S0mKoRw/6liW2eQen2Fodq7YIyP7761oY8gAeGikEaUn8quRA1KCJ4?=
 =?us-ascii?Q?vxs/9tL4F3kS1W/OM+7k4Jj4qKxRhEbEVsFp6JYUAbPAjSOpJEUvlYjh60iK?=
 =?us-ascii?Q?X2isCE+lV4QCKDhrpoQBHHcNaeRPO90nEOGH7jliytsF3mpfKCGQr0ovLq/4?=
 =?us-ascii?Q?tHjRJnVtiBEiygUJKUVoCdILGBnz3+8xlIEZ7JlPg/S2UVBPQDChVDL6N3PZ?=
 =?us-ascii?Q?tXG8FyFGprrFi3cO54Zh4fE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f1e9f98-b692-44ae-7ecf-08dd5605fe18
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:36:29.6180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2XSCinLz7IHMKfF7GVxwitLMRxLp5VTf9J2dEejCL3PLZsAa1/v8boARFcbylsGXuQcMZn5dV128fiVHsb8S1bQ3nKaxmjtJK0272368IytoQSFq2Xg+wHtOW6rWGtJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11967

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm9713.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm9713.c b/sound/soc/codecs/wm9713.c
index 64b69316e4c7..5b0fa1b20d76 100644
--- a/sound/soc/codecs/wm9713.c
+++ b/sound/soc/codecs/wm9713.c
@@ -944,19 +944,19 @@ static int wm9713_set_dai_fmt(struct snd_soc_dai *codec_dai,
 
 	/* clock masters */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		reg |= 0x4000;
 		gpio |= 0x0010;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_CBP_CFC:
 		reg |= 0x6000;
 		gpio |= 0x0018;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		reg |= 0x2000;
 		gpio |= 0x001a;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFM:
+	case SND_SOC_DAIFMT_CBC_CFP:
 		gpio |= 0x0012;
 		break;
 	}
-- 
2.43.0

