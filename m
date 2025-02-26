Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011057.outbound.protection.outlook.com [52.101.125.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0B019049A
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533668; cv=fail; b=V/0k9AXVvPVSLFwV4aDmBZ+Wh3cCUwf77k2NeXx5g77DW4Q+DgFQLLLgmqyqak0llHwWcbhMH1i+WHNVFpUPHrh2XSwzmu0RCJr3YskqITlboTq9MumCO21W0nh163z5Nikm//JcjB1UKSP1RN1cDk/lPcoLBEdKi58+0FWTzi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533668; c=relaxed/simple;
	bh=ZRkkQsCItcvPl0u5Eykx5ZWESpPeq3WD2F6HkpBm3/w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Vvacnl8y8RHK77dyVLp1s88nKM4558dAyMxPRXUvs3JTqOU7a8boRrWhej8Ymb7hmAKgvdS/XPMPVvXnQcyJwk7Qf47hOQ3S9/+iHJU4OtI3KZ2qDLg09TgAz1kXvyuy04cJNDT0KwF03Zw64kR+aWHMz4bEyzTtxy/SlYnIQg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=arMjkSDm; arc=fail smtp.client-ip=52.101.125.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="arMjkSDm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9I5bFAWjiSk2RL8c+S9Mu4B/e1peQ/YgFYIb96Z+lCbh/ZAE6VhKSFoWGHcYGbOwtCg40cqwAEiwbuHB1QRZlBmkpz1LP4kVKhO8oNdyv2bKmBXTnfqcix74gPbBSra5YPuOcEX7axAAELurGVfzXn3hWAESuio8bPB5RnT2ZNCulXpimow6egEG129zZchcRaMaFLq1XwgvDe9zu3L1dhob8vuMmhmNJ3r+O+5SNq23/cy8xoujsOh8bygrO3tKesZETeFm6YFLQvgCS7a21P5NF8FiV0nqS2cI3I0gdJOeRjn0wOgJVUKcYMG0M5kCyu+9+hAOAKOQun7JtCDjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzSDfbpxh553WrDgJtg58aSLUd5XvvTATtJGwr5LN6I=;
 b=Kl8/ntq9uin1IjVEQZ2ekNdOtcHsxY5vpPgrVIzYaH9hE902b5cSLysoHdy/xBFqM60lyutdNAZYJqgJUSIZZ+OlE7ExL61ZmoyZveHXaRcGLMJv8+icepn1pe+Vt/dxSsYVF7UAjwJEnJF679WO2khm54Sw7sVoLlDQfKxCVwbJ5Wq1vAdaHGTHpXz2Gg6dfkYr7Dil3wj1KjVNtHwPLW30eSjWiNvftW5wQmqJ9T8P78MwogLEbj9vCApiIcZwLxi6TaXRDggsSCP9oDU5VA6ai+7u1hEvv7zmENbM3yWDhZMefeXPwQE8gpdSPnmaNk+LsXHeMXOACma9i4RllQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzSDfbpxh553WrDgJtg58aSLUd5XvvTATtJGwr5LN6I=;
 b=arMjkSDm8gtskICbkQbOZC6XYDUFtTbMdhgB8GJ4teWL9RUCJefu0RdRSsrshuvCy/mvXhogXxcn34sf0vYyHLm+7iO+qlaCxFTFJoQ/iBUdaIK0Vr+IVQIMrvvwVOBOAkMEbi1tEVMaV3r19ZYdWUdidvyFX3RENt1f6Icy3Wo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10414.jpnprd01.prod.outlook.com
 (2603:1096:400:246::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 01:34:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:34:24 +0000
Message-ID: <87plj5cwv3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 068/157] ASoC: codec: wm8400: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:34:24 +0000
X-ClientProxiedBy: TYBP286CA0041.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::29) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10414:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b402fcd-f538-474e-0541-08dd5605b3c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rohg/B3jWy+POdLPySAakc964kYvVB+ht5l+dOD00CnAcl6D9DEHy+ndYVnq?=
 =?us-ascii?Q?pFGsh1B1+HedivOqWzyGQ6wZSYplZEXxXKvX+mzV4SbwzKaeO3TJjKxW378d?=
 =?us-ascii?Q?5GFcQwtx9RGaG7kuc/eGHreShDXYz2b6og9u8RJolSq+K0n36U8gVeMPESAr?=
 =?us-ascii?Q?L0Jb6Bog0wL+yNpUbTT9GYiGpJ9FaRREd6y4F9J+Q1xTazlgKQq66ZdUcS/B?=
 =?us-ascii?Q?NlpCdUsOre5Wca8Vhd1WxRGIYTp+9VC+Vk4QgWvJ+jZceGarlgdwYl3J7U7m?=
 =?us-ascii?Q?JIg1cnuvv4pq/GZrxlZDf0UL5AjTr1uTtMRW7s8gpSLnUXWse0/t6pjsEzIr?=
 =?us-ascii?Q?nod2otmGt+xpOjm1JFv/xVpGXTY6CzgZnns922HrsCBdIelQQhOW8ZOqnO5c?=
 =?us-ascii?Q?ab/Df9APGZl5icnGVyFTboEDzqtYO+SoDJokJG3IDL4FiPio0HEPoTVnMm8L?=
 =?us-ascii?Q?hIZg+GvvKK700KzjEx/vQydSwecMcAmLkiofqI1xBqT79JLS+IbXXwuMLXrX?=
 =?us-ascii?Q?LhMmEB87rwvdXh2ajMiCyKDY+pWnS3zAavvLK8nhK3KF9/g2cNKI3aIJ8sL1?=
 =?us-ascii?Q?sG+Z0XHkE7vzzUOrT23sYXQOPkq65D0VZkfwZ5Q7qmDzapOXlRhRRxcRCYNo?=
 =?us-ascii?Q?kz27FxMh6GMxIlR8RPJEopSqSJJn9e3mlc0W2TUx3apBG3nQmzNx9Rw4bORM?=
 =?us-ascii?Q?Oo1Oaf2lzA2RNAHt/yCU9YvK3//zgjg0VYVJMs4lB76aC6RPMi+kytmu0YwM?=
 =?us-ascii?Q?C7xIzfx5f0X8E8sroHUfRfb6h75UV316B/F0Xlkj+wm4Qluw7VutJID2B1Na?=
 =?us-ascii?Q?HbP1YJc+I9OjruW0eOB5pzzoH5Zj71eSlgGg+SldYf2RHktiPjiZbjpLhPnR?=
 =?us-ascii?Q?YDbpwc9QRXcGjA96LsAsi2Kk4KQU6KreDI7fLiKc27+NIVZXFKOfHg0nLCpg?=
 =?us-ascii?Q?9lFS3Q9SdGr2pR7huEL9AQ409gOd1UzlDjBZPqDXIX4qQqPGi0ZK0IohuMKn?=
 =?us-ascii?Q?JR6ZfZ+o7YTs+MtdZ1W99hONuklNAYdfAtXeARY+rE3JtxD88bgjrf5C+b+M?=
 =?us-ascii?Q?UupHrHZ6aOmJiquD2IzqCA52diUjqaY1ucRCRwJF68znPmF2tKb1PT7RMjrh?=
 =?us-ascii?Q?meT/9LQxa0hw0mMmnxmrG50M04CuAkgShlL6jSNLlC/z7SLz2P8TKdvf/3nD?=
 =?us-ascii?Q?9W9BIUsRbA2+CStEI2LRy2XPFZPP/L/LY+ItkD9PojNpifhgwvCjXL7zPfdn?=
 =?us-ascii?Q?HQsCcqbsasc71bwgFVgz/IrwJW72PYqpsGxkbZvYWm6GK6qFfbF7F3H1vdpI?=
 =?us-ascii?Q?eZ6qbRp4m75S4ojvJwBv+zoYqs6GarJqKyyVfN1sFZCQI0vz2YfltsUuxcGI?=
 =?us-ascii?Q?J42QHz3nzE9s/rHz1dDXRFq2UhueMM+3Wwcos1JKidK2BdapPB/mKtHFoYzX?=
 =?us-ascii?Q?OKgRHutnxzzryTwopKyuOmz37280jNAi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DCUDGmuquPCEq7v+aOFhQalWbItXMawGhAmR4fJAx7/eyxqH3UXhaCwu6FXM?=
 =?us-ascii?Q?VDVO/Mv4/hB/e7kjKsbLXwwevPQzqixjXLEJLntWr5417azmGerBhijoSZgG?=
 =?us-ascii?Q?ijJ50o4m+2UQVws2lcxL7mf6DTjTeyoiU3/TFW9eqeVguttZKYcTO2Q/6q1b?=
 =?us-ascii?Q?tNUIh2506p/WajNrrzqQXQR3GusWf2aUzs6Gu/f4kFd2HKe5lx4xZPmbXEs9?=
 =?us-ascii?Q?+6lWB2tfwQIuYMzKImFIP0isGdwivPGiovA6k514QDMEF2qdOxfQh7xhEyIq?=
 =?us-ascii?Q?qsACPz4O+PMKHRLI5ESbDgbevQY/4+WzfgYsp5sYC2/gdO54hjgk/a2uwSos?=
 =?us-ascii?Q?FGxEAgP8alGhZeN+fPuJUKiMIMLZkl/ji4Ndi6iczOpyZ2PdfCFyrjyl4nxz?=
 =?us-ascii?Q?Ui9tnQ/kwbk7huw4QaooBJvCTfBitUTejQdYzJwBEl78vbsFe0O0TDmd448c?=
 =?us-ascii?Q?2T3TKIV9WT+gpcrp2WNYX9ZwVTaoYdiWVpNuIoMQwexP7bFUJZNETFxTCm3Z?=
 =?us-ascii?Q?4EL7X2aoHO4NkZZ3C/l6PICuuLw92PG/pczrqb7iZiEit8Ngvmy5TtFxHYTE?=
 =?us-ascii?Q?0spR9PFsDtxPrVNNTRQrBsV2R+2fzrY3uBVeJ1uyTQ6t/n0oAoBMqN4JYNfV?=
 =?us-ascii?Q?7qfq31JQZ2hZ0gRNsgJG/nq8XYxE5w/pUHUM/YrIG58PGDISieoF/qTJ+DVk?=
 =?us-ascii?Q?JtdRMh1cZdaOqt+UAcRLeHEjT6g3hVLJRDgx60Z0yxrEme6hPXdaOgeTBLyf?=
 =?us-ascii?Q?DQcIvVQbC5AcdHE0aOJBkQDaR9T7/xLA9TOWmVHDGGsbfOfIqGIKMsbP6LMP?=
 =?us-ascii?Q?XiYf9bB9EpeYO4cZJu+yQwwdr0ue1OnrJYCMEPzC/3w1xDvcPFwfcCjtLXqJ?=
 =?us-ascii?Q?wmO+plMItrrd+hsauV8jjuKeDmyqhGvAvtudBnyHw6N+LNfmGHpfAepwrMbi?=
 =?us-ascii?Q?sXWHG+i+Sbv0paZMGQf9HftgBHWE/mEMh4lGBgao28P/KY6ApXe6te2TfhGK?=
 =?us-ascii?Q?aZpdZCO1e+LbZT4y37cFZF9jBFdFepwBL48aaoyLtsdG6fhXxZL5w6qPHFx5?=
 =?us-ascii?Q?v375fbrS1E89LuH5AqA9etpA6i0G9IMW5Ho5VxMJCsPuYgQ1M8rJxC1WQX7e?=
 =?us-ascii?Q?zu8OFuZQJW7NK1URnh+7PUiTzvZ1LPMi30/lSEjc1omISNdGF0F8at0yhgkr?=
 =?us-ascii?Q?8WmjBxNmtbFyC9DZO50u61LWT5pUYUywUMCRKW4oMtlNRNuRK0w+IhrpY4r8?=
 =?us-ascii?Q?NCaqGpHjVrp2iPrM99x5z+oA9Qf1eG6Ab/mbWqBU7hRSoLzsws+q6MaAUIMb?=
 =?us-ascii?Q?iYOozEM8Nff21paz8eE4bbXFUgtQFItLyhm+fMIX46MEZ5d2OYDx5+FDr6cB?=
 =?us-ascii?Q?JKaR/Kcbr12PnUcqkEuQ8l+FM3Oeh8khoGa4evjwZH+4i8t+0sPZSM9MSZ+j?=
 =?us-ascii?Q?0MyGEoo67mhuWVkwleg7F29ZCdJMtFxlh7XJvDcqPGcnBrM/1Vj+E8mIcaDG?=
 =?us-ascii?Q?0I6TV+/JYQTjRm2iu10mzukbWERsKGWCu4RxQNtbxqzbM32T6rFYkgJr82tA?=
 =?us-ascii?Q?MdDWycnLx9mIQkdghuaz1YmyIX+Q5prYi9SrcvgdLjOI0EetCB4mBSLZMmMH?=
 =?us-ascii?Q?H70PheQct7D5iKg5I17+shU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b402fcd-f538-474e-0541-08dd5605b3c0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:34:24.8211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJ/lFAY4qjtFNeEJFh+Driy4hE1OV8IpRQSgOnH2AwsjI/z+vrWaJcmCHc5lx6OtBDxfkn6ryio8sNrgeK7sSiU4Y093cPh8Y1BSQj8x2Lyqv/fChOY8K+ynqNxHEF0A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10414

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8400.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8400.c b/sound/soc/codecs/wm8400.c
index 19ce839f6ef7..5ad6d5b63ffc 100644
--- a/sound/soc/codecs/wm8400.c
+++ b/sound/soc/codecs/wm8400.c
@@ -986,10 +986,10 @@ static int wm8400_set_dai_fmt(struct snd_soc_dai *codec_dai,
 
 	/* set master/slave audio interface */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		audio3 &= ~WM8400_AIF_MSTR1;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		audio3 |= WM8400_AIF_MSTR1;
 		break;
 	default:
-- 
2.43.0

