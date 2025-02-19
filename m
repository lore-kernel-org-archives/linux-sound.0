Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010036.outbound.protection.outlook.com [52.101.229.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AF03597A
	for <linux-sound@vger.kernel.org>; Wed, 19 Feb 2025 01:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739927969; cv=fail; b=TxNnHrYst0ihc1Qg8/CoYO/QxsXCapIQVGwd5Jn4wvcPlU37OPbf604Nki9i+B19A3CGW+UX2LPmC/08mMggvo5EhJ3AB/UtDV/lVt+oYnR3n+O5mW8HDM2zZsW7X/YFHoMkh+rCSOx1rkPD9ue7JPE6dKP0miXaNA6BpLbQF0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739927969; c=relaxed/simple;
	bh=qSUMuORn447kuzvuCPYVqKo8RjcH82yLvP0I8nw82nc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=SV1QxVc0DlgqLCJckiTmYqj9VsSBJQKl+4IxK0KV8AXa2LZwYSSFGCzyljXASgih2Idu1vXI4MJgV+3IBOFo4yYEfh4IZrl7phirnKcH9m+hizteWWJeYkaPyOngIbFUj0PIqrilhJUINn5MBCLML4QqzBIum9EESJlmD0u2OVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=muhalbGQ; arc=fail smtp.client-ip=52.101.229.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="muhalbGQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IpL9p792kidMWmRlLP870+BtrBS37rr+aPFml44wclgPtFWhb0NROgsgUEw4ejGx8kzcuSlKlKUCZWjwE2TYpAfHHUAUDsdO0L8XHRrrZD6aM6Ue/c1tj4e7GXQZURrLUAGt/P4myWxJzj3f0JYEM0icll8+5LFe5M7HF3yi3rZyYk9mUlDFEV0YcgQZZAeE72ktE71Hz6mcYOzzyx1aY1+HlgVuN5iztyiZO+xb6ncChwXXhlVWdjlm8DboHDSsuJfSnnil/q9pDmhIUHq9yeiygTGxRfApXhNU90ZbytbB5qC7BkZwpXaDnStPVxoNf82ZFSFOoorX7fOaIWlFrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3C6hzitxdBN3orS9Z78XtzoK9XDLUVOGZBpIVb2yu0=;
 b=U5Yk1qeijmZ7PuWOlm3WcouhwzZassFu5Qb/PuR9c0LP0sAOQo75VBhnQ4O4gMbrFxJOvzPb1JAzFcRvggBa5CEWYNo7Lxns8rckPpXpbgg+wEwwYs8oMqrS1VSvicv9jtjV1ywTVmcmP8gONj/WjezOHX+ZdV/rMLy7UZHuO+dBZSA1rvaKyEy36LANrMMtnSkRjvCwnRkWK5ko8qkiYtib0cKk6oBp0dk5fDqBKH2hddUx3FgaEXYgdospz4mouy4yBxW/GRWt89u5zaAnx8sitgwFgqdpaV16FrbCeeaWw9TMjh24o7x6IKLDeRKHxZiQUdIQLBHgVu9jkXAYMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3C6hzitxdBN3orS9Z78XtzoK9XDLUVOGZBpIVb2yu0=;
 b=muhalbGQTGFxWto00kuGxCh2QOTDVm6TI3AETfSQaLUTE9Zk5JN2JY+r668qTh0UGKK2nNavjMgzzAHD2rCyfEdpNLpZ1rZvqnXLaz8vz9pe2J9JyLoXKFEUyIST8p6obkFVgRtzKL/Z7ka5pbY3dTHpDRFc/BmxwEn08qaod94=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8705.jpnprd01.prod.outlook.com
 (2603:1096:400:189::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Wed, 19 Feb
 2025 01:19:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 01:19:21 +0000
Message-ID: <87h64qvihz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC] ASoC: sh: migor: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87jz9mviis.wl-kuninori.morimoto.gx@renesas.com>
References: <87jz9mviis.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Feb 2025 01:19:21 +0000
X-ClientProxiedBy: TYCP286CA0272.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8705:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d8c5040-30a3-457e-3129-08dd50837050
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7dS0E3UI+DdRzzQUuByznAMmQ46At2PDQiY6m8JVbGfRV32G1k2MYf3MurPw?=
 =?us-ascii?Q?7iL7aMphhU3DUyymzqJPSftM8AZ/thDHWwbcL6F8c+WqVtffDuAcMAhN936B?=
 =?us-ascii?Q?nPYe8by+8bEBXzS5nlpsvVCB6Bq8vztRNfmV1hKlsIUjqXxa2m9arLb7lCur?=
 =?us-ascii?Q?ch8RuQo9ExQ9OsmOqUCkExAwX932HaqYqzXQJqYVYVfYAroU6/r0GUvnaJn8?=
 =?us-ascii?Q?PJWX2CbU8SElcXyOQLFYUU0O0ixAcUvgnRTv1snJyyw8PCfJHxQx+2qa7Rse?=
 =?us-ascii?Q?vKXPJ+tYbZERCd3kDX+uuJmBUzfW4IdpOxtpEqpnO7baFn3lFcfAuLPgtN3p?=
 =?us-ascii?Q?xFgf6/hAoDf28gI+JwPQ8tjfwMrMCw85Cmv8LvO5JB2LkBok3FOdrb36hYn6?=
 =?us-ascii?Q?LDMx6hrpjp8TKB4lUVxG6pAxJ46A95gUdkshsk9oVqKFCrrPyeHsLNiorb5g?=
 =?us-ascii?Q?6Udbm23h3G20jt6cS5dd3JIL4/OALLXScY+DIJaoxa1nSPR26YWhvI92Ns6R?=
 =?us-ascii?Q?rpn1IdhlRNWGazYyE7EcA4yA9gAjzC5rK/uihiJDmEoHp/gNdLyPaOWV1HdF?=
 =?us-ascii?Q?DSDjRoY5yXObVvhGaZYBiccn8EVSFzgJOVHAss9Hcc+XrfXZDw+n8KR3bXwV?=
 =?us-ascii?Q?dlj7cXVjGOAKgUi59USC8PVUItO85hwT6p9IxGQcEZCRBqDICzyMAunlo4AH?=
 =?us-ascii?Q?JPwhzaH8nF978Ynf9O6vpOTo238WtE5VzCAavEMF7UAkvLg3pvznLal302zH?=
 =?us-ascii?Q?teDQoCnn1Guz63Q21U4z/8Y2kMsEpsTUOqX7hWq1QFfpnm6llUyBuYBM3HWK?=
 =?us-ascii?Q?hClGVgHv9tN2sKNBIhbRayRUPTcvVauneek9zjVW39cYtZjYMiuhGz5aS4vh?=
 =?us-ascii?Q?XFV1pgY3cDbhMb1fpDdPsHdwIDZmCbYErI4euIbJbgbbbWCQJL8e0kkVwAmN?=
 =?us-ascii?Q?2nYdQ8NuOw8oCV9D9CND6vpHkuitnwb5NyvBmyAydRoYZFDLqYPD+ztKwUuw?=
 =?us-ascii?Q?iw2xaEtPvy8YKjwQFwpG0wWj6aRSKrQrio40TZK9+XnHuZZQV5bej1y7ICzw?=
 =?us-ascii?Q?DiTSz9NmS0FK5qjMNHY4EVP84jBOXLzYpkVBfreqBDiMVLh8zUUI+yPZUlwT?=
 =?us-ascii?Q?khEfsjVauBHjlnU/Y8D6dQOOAvSizTBHkFdYRWzIsuH9FHPIG6Po41SLke2t?=
 =?us-ascii?Q?utNRr2OfaKGfyzK5N+dYKN9EUb6OpVqGCL9up+1cq9lyyURofOn1RDDaaOvj?=
 =?us-ascii?Q?73waEVaqgjpW5J3qqv5jtleIb6/+bGYY8Ce4PslL/Du2UiqBvWlTl0ZpDhvL?=
 =?us-ascii?Q?1RCgl4KYQAsM2smYMpxyCDkvGy/k8vp4RPFDm72NV8HiXk2MaG7sH5W7qYJT?=
 =?us-ascii?Q?P7Nv3LlMhd7hqwMlglM1isf2+jPVt3cnyUYfOqtMRflwyzSSi+NiVBtqqOq8?=
 =?us-ascii?Q?w/4IwhPnNi6r9gRJoGgVpEOV1r7b+9pR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qu78xl44p0RTaNxs91IxmoS6NVEOFD4zSg/Bj1gKrRoSBhU0PaHvUDd14fO7?=
 =?us-ascii?Q?ej/x0qWiwl9lLgZ97beeK3DoigHnb92kAxzkiDJYJLq7jtxv4Dzxq2qEt9/J?=
 =?us-ascii?Q?zkW5JYclBsA45Y6AJJ8TNlbS29klYO5Zx4rxXVDHFpUkigyyFh4a6I0ZPH/D?=
 =?us-ascii?Q?HObXAxjiYaD1yCtPny2BqffaVoct2NIBQbX2G9ACtRoKxolEn1FN5/9YSENm?=
 =?us-ascii?Q?4fNhwguBkt5DXeWHwh1VnxcmKHWEN+Avui3hV0IHtPklaQkW1CwmedPES6kc?=
 =?us-ascii?Q?EezmYh43iP0ruyGiThGqJF9HdaYr2bhoX39e1Z2EHVO2KiDmoYdnBB1XLls7?=
 =?us-ascii?Q?pel4qtpvjojvz+nVStaEzSVVjPRlTgjrLSoZjLb8N+sJoGRF4SQXyb7QedJc?=
 =?us-ascii?Q?ZI5LAn3NTZ9tQuYRNEXyvvTJ9KdhxTi662w2yLHmTSxTgpKg6DAgTcmyY/ME?=
 =?us-ascii?Q?3ZJI6a1LhvBBB1qyrqPDqGELZQxDiOxlvki5qfg2B6ht1Lie6lgGS58MCjaL?=
 =?us-ascii?Q?Jr9lIHL4cqVjESnvV4i5D1MgNu++NTe2WCrh3sIYcqKIDiBten5CRCrH0OgR?=
 =?us-ascii?Q?MXjvr/LxlgX0GD5Zqu94FqjZqh2Le4X0BincOp7/+Dsachgmc6XjP3YRgA1b?=
 =?us-ascii?Q?xzlVcOu97h1n77V50aqSKjh29e0Qb895CY/XpkghsHDL5fEM2B/zUt24pBRW?=
 =?us-ascii?Q?bj4Fin4UrEnXq3MSeCj3de/ErqERa6euLMhvduHy1AqrNarSQ3zocuFH0P10?=
 =?us-ascii?Q?99QGhBSDxxUqjn8vUZKVBqE73152SvinhfV0Sv3Ty1D05O+ULM/f5uUmXQXs?=
 =?us-ascii?Q?FXK2644Thl13fGryzFpjHdryQ8avQjjueWX7vpwt8zFfO28cSV2VRwmoQ6Rx?=
 =?us-ascii?Q?whP+gaESOHmuVT/AsBqQ4hW+wJU9l4NdIG1oadIST/rIelvNwTBFbsyfVAl+?=
 =?us-ascii?Q?vWSDKyXTWtibxev0HQoc9hbwMM8UjGWMADoHgBRYPf6+nXy5mFaX5jWgQU80?=
 =?us-ascii?Q?A7x/djcn1+UwvbGb2etwqBl2qErnmZzzhFIAyaUg6fn+SW6aUPwNfL6ATZg6?=
 =?us-ascii?Q?VSj6KQ8YrhJG+Z0JwMeREzS9KrnbP4OczRb1rf6WVNHP9pXjmQ+FdyiAO4ur?=
 =?us-ascii?Q?/BsLIaZG2dp9FxYUvG3N09ub5/V4Banr/LLB+t+15kAsrvCywmcbmnolwBv8?=
 =?us-ascii?Q?uRISgGUooWPNlVLqA01/kjr/MXclecgrw2YE+GHWWodYe2QiHughUY4gYno8?=
 =?us-ascii?Q?u361/RxOi3ZwqW7WwlE/J6m/Cq5bRJDP0oiu+YOda7ZJrGuunqlOgYjtzKGR?=
 =?us-ascii?Q?33upYt2kW9tsCHhR0nl2C+xtADWAt0OdJzNCyISpQgiJxQ4OHoSt/52roLEw?=
 =?us-ascii?Q?OvHSRQaOeDUgebDNv4tb53pVv2Ur+44R+yvcV1Rken5062O+A0Iwxp9fTlXw?=
 =?us-ascii?Q?Y6YTJugIPxUxQCqIZnvb5bHdYzrANgnT5G4nabUqk1jcKqq814kD3ENGvNkF?=
 =?us-ascii?Q?G9/HUmFlPGceFZKYtTQPjU+g863xZ3bSWNerzuUDu6MvH/wC6hlc/yHVvF3J?=
 =?us-ascii?Q?wYwpI+ArJUnUbqTRdITE6Zm8g/D5r4v91ipu1roHuYRHhofj3VbetI0v358G?=
 =?us-ascii?Q?GrAcvW8wypcRy2bbyB8ZB0A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d8c5040-30a3-457e-3129-08dd50837050
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 01:19:21.2718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3z2znC1M3KytlcSkUwzme5xvQC6CBaF/yzLTNUNOi3XLHJGVVYeK0uzAsd+bXNa/RaM++q/DssF5PeQBKopQKTC2QUK6jznzpFBdCxoyRuMK8MoPwhnIxjjNE3PKRwEn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8705

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/migor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/migor.c b/sound/soc/renesas/migor.c
index 5a0bc6edac0a0..45fc594d331b0 100644
--- a/sound/soc/renesas/migor.c
+++ b/sound/soc/renesas/migor.c
@@ -132,7 +132,7 @@ static struct snd_soc_dai_link migor_dai = {
 	.name = "wm8978",
 	.stream_name = "WM8978",
 	.dai_fmt = SND_SOC_DAIFMT_NB_IF | SND_SOC_DAIFMT_I2S |
-		   SND_SOC_DAIFMT_CBS_CFS,
+		   SND_SOC_DAIFMT_CBC_CFC,
 	.ops = &migor_dai_ops,
 	SND_SOC_DAILINK_REG(wm8978),
 };
-- 
2.43.0

