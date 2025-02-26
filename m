Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010061.outbound.protection.outlook.com [52.101.229.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67973198A19
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533865; cv=fail; b=AAUIHtLsurQCPUb6m2yj/FnVW6oTn9J4A7JJKgxYYUVwQ7D9uz8qcU9a0UzWN06SYWbK8KZuTygJO9/Yj7LQjisfwFkAdyyimxRahplRCafOykbQKsCNAbF7pPl6gPtIdgPwskDagsVYBY96+HtuH4WNPCXoPFtJuYkx0SED3MY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533865; c=relaxed/simple;
	bh=egJB9+dXK5jEgWnFuR2hBwgD3pjyjRamRstfPZ7o4Bc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LKHoHnroZIUMJUVBSEiTVab6TY+id2jbre2fiIKJQbcdyDmfXg6pOaWmWnH/tdnbLtAoZT9i3JqdyGW8itQ201oCsunRUKsTKt9PfpHPNPkrXezIwjbcRYbe9V70FTwMtXvSpMk+lpO1k/SjrrCeHbE2A7HKjgVOJv/fS4ICgW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=f67/5Bb1; arc=fail smtp.client-ip=52.101.229.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="f67/5Bb1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zE5p9/1a4DJtOj/g1aGpxLVgcUypL1VA/FWf7J5UZCh7y2XqxI8Wcr/rDUfT9RfrXue1tnEifVfqyfJpQzqnejXlcgs9aHXoc6cdk3Pkh3DW18g21tsdL+xPBpEzU82pczlWgMa0G20SOpZUtR0xfULS/0k3nhY9Q9u+KV9YKPnd+EkZcMCtPgF/9tfi/AUdQr2XGwNMrb4zkBhzJ5H5bc0YT9j0ju8UcUE9Xs607kIwaPABUZKYicRC725ATqlBFd/7uE7BoEpYDzrPLyieLoULxhdboCn7l/Rqm2Tif4csOpSdtEIrGnOJnTvIRWleuUNK9HRAoCyLfFxltVY+Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xLa2EdLHuHTr/25FndDQP0a0aASz+Bjx5uduIz9VBU=;
 b=LqKolNIhpcIfZKHeyv93EAVc7L6jzjxdYzBXt2DtQccVneuqZsEOaMRJj9C3bWp8sJv/Qkghbt2Ws+NPYU294Lp6/GI2BHpJihVu+pB5gOO4L/OvdAN+SSy4Sn2GbvfCeIh5rh8k7EBKUAxVW6lwpBUHDJSg1tiriiSdceqPuC5m/uGFZHeoxlhZCXNM2QQtdyifBDlM7HyNzAgKXVvYQrxgd6JFJ2WRWEvcUUOmJl3U21olDH6p4WUoBiZaIMvHvwdQ82AF4MoPlQOxN9Z47iz6sfIovk+EJxWnOK3BYX+U9REml0vvkEqMIMovzBRrqrnKPgwfap5J4mrrsgcd5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xLa2EdLHuHTr/25FndDQP0a0aASz+Bjx5uduIz9VBU=;
 b=f67/5Bb1GvLcYAtXurfEKQwWtu2JizrE4Ax8AhzFRNkGuZg+wSYdIAuxOZoZaCdGOxHQgySvhnmhO8BKAqE3YozHk9X/aNHGiYuXetx5tFVdrhLdfdnqAEOcF2T+Dsgz+5mFdSzV2gRI5FoChkubsdcdCcSl/IaZEmLfvgTtKYA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSYPR01MB5511.jpnprd01.prod.outlook.com
 (2603:1096:604:87::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 01:37:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:37:42 +0000
Message-ID: <87jz9da3kq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 122/157] ASoC: intel: max98927: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:37:42 +0000
X-ClientProxiedBy: TYCPR01CA0021.jpnprd01.prod.outlook.com (2603:1096:405::33)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSYPR01MB5511:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e862617-552e-4a3d-30e5-08dd56062968
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Pmh+Vrurkpl9Te/9NLaaDyOYLLY6gxGKgNvIT7Mcx5C9v+HkHyJJNZvJcoYF?=
 =?us-ascii?Q?9Kth7MX7lVOgjFRfnA59Mmi+D+5DvfyAxr526hUi5vfTI9NiaC0vClyKs8t0?=
 =?us-ascii?Q?zCOTmUYVhm/uW3fN/HLaVNPq9y3sVJlpXvOYh2FwQrka6+o16UM3CDm/5Zn9?=
 =?us-ascii?Q?qjU9ncnZqfqzxWXCEbiZ8BINNlNKRgh9eRMsgd2YTd1BhSie6QwnHDEgMvY0?=
 =?us-ascii?Q?XFmBVTjpJ6HREr01xp8EK2Ap72fYlfh3dw3CTWHRpjP3IunzGXh3zcupw+Cj?=
 =?us-ascii?Q?JWd67nrpSJLOzSMXKDjKNk6eyQInc86T/HrW5YCDA8D5/hWBO3cN8GryZ8QH?=
 =?us-ascii?Q?67DYhxsM1WIAYkpT7cCRkDwe8OFa9CshzZO/MYtIS4l/cumtgC5lEGnGBFn+?=
 =?us-ascii?Q?FS6X5uRZJDQpOUm5e2uAftNbBTBsK5dxoLdt7ED2vLgq8p7hIcmNkDGcAkX/?=
 =?us-ascii?Q?t6rzlD7xaz/LlKoat3Ku96AgqfA4oN0Xs9S0R66ClvW2HcuHW5jdhR47BZV/?=
 =?us-ascii?Q?oEWBiQg1id9VFZ46p24JY3IRVjFwHqOpU2yCnVQUC4k+3pyLyh5ByocJGmCH?=
 =?us-ascii?Q?LPsRKpVUBOnVJlangNPIcB69dVqPUP83aan1EQzelF5UxwIq54f5fVoy3UEA?=
 =?us-ascii?Q?fVEGAWaSlFZQ0udieyVcRpOmlIac/JmJV+8NBMAoHhr3WqCmcHqYV1WeCcEM?=
 =?us-ascii?Q?+5VpEkKp/1gfQWv1Cjrp/L5gARzMTVQHKXw1A4UHX79+rC/SYsqJFcwUuYG6?=
 =?us-ascii?Q?OpDinZW9DuaMVyZV2L3blSMd2Ihuv2rKZt0CzAoj1weh5iVeON/y4F+BZTkf?=
 =?us-ascii?Q?Z/I39i3elRi8fKE9oT9B8NHMRpg1mSCNH6rdGyxUBCBnScp+4/aUFwquQ1Nm?=
 =?us-ascii?Q?2+FEPcWFZUgY3WYz08DMLhmSwI/ATCx1xKgDmaTGIAu2ZywF7XmP+jkPEIY6?=
 =?us-ascii?Q?1FWQIEiy27rOfH9aPf6fVOXPOmm0vZ7bQhBfFajXMxgbZ77p/poj3++MupcT?=
 =?us-ascii?Q?Ch4ovcISCyYWsZW/7n4getOrOzdM0jleky/AJacO7XyYJTlHDwxfPzwaxdb/?=
 =?us-ascii?Q?zEzfa9NEnE2uaFJmsgEGYD59av4uigXvHnkpTv7JMZ9rG9fFFExvGaKKbI5J?=
 =?us-ascii?Q?fjn4zzO1bxilm6Q1KxiHp1JRJs0pcHlbyRnfVuOyPJjW26cNDbnU77+148I7?=
 =?us-ascii?Q?GeTrUqB5wY3BSzNQKeNfGknoL6+wi6gpVkoniXw1ZKKwjt5MbHmioxooo0ft?=
 =?us-ascii?Q?ak2IqP3UsxYroK+pT/0XvMeZjQ9C3fMvvEFpgqs/x8na0dVQ82KOdt4eGP0+?=
 =?us-ascii?Q?Fj/Z3plH0IvFU3KbvCBupTDrZ72X4R++dOZCFNba6XFIgDg28omgK9LXl5FB?=
 =?us-ascii?Q?X4yT4HlTP14VVOAsu91I6yzaF5mjvc98QPeYXLQcwx/BSVBxQy8VyouQs9i/?=
 =?us-ascii?Q?k0QrNYAJaamUk1AEdVuqjQUsHJRQAzE0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eYVEo5E/cLfadd6FqcqCDeiYWGfdHOSUUhPWTQor3SlM5YnjUkvpLVyTEFOb?=
 =?us-ascii?Q?jWumw9rZpFb2aT45jynp3LUMzD/W1OtUo/yQi/0fIp1e42Psqgy1L9a/woRj?=
 =?us-ascii?Q?qys8YwtWPlswRor0mE8nfWQ5jY8Y0l3nI/SlUDWytEcaVuzDfGSPSIa15uvP?=
 =?us-ascii?Q?xm5TCm+gzYQ4zv2tgXbfE4Z6cwrXLDBCKxFpnhSjieSBvS7ST0z5plkv2/i1?=
 =?us-ascii?Q?ga/tNeOZtGHPPPom9zeIWSzHQSAlZGH2ACwlhywL0mLm+pqhd8SLnO9f2iBY?=
 =?us-ascii?Q?1B4yOTDH4d44aNW5PyTcNlyLDlGAYzaehp7ZEBd1FhbAX76qVDWkQjpw7Bxm?=
 =?us-ascii?Q?H+0Ux+w/qmGL1cRrnyVzdpc/wNsSVGhcj+2/wqnC+Wm9m8pcLZaKcIEWa0fn?=
 =?us-ascii?Q?iPMZIt60XZNLjRvj8EL1Uxw3eXgjZiaqCnuSQ4w1kUR4DdxqtAke0O4FB+c7?=
 =?us-ascii?Q?oEKLd2mv5Q3p4z1l1E1wHjZrhZHezxLiuLsIjS2X900d2wXNxIyhlXrW1pVa?=
 =?us-ascii?Q?5FQhCG4hVvIlDc66L4hJnMW8j71UFMMHqfajtAMk+gyP9UCv5oEeCaf7EM3G?=
 =?us-ascii?Q?f+mKWRWJ+2GxA8bnliPUohDBmzuxU6iVS/MJD8PviJ4DtwyrqLNacgzRdVs0?=
 =?us-ascii?Q?PDuJEf2bD67xifOrE7LMlOocen8/gh7v5csbdOqpaKZm6+AyajwSh9vy4xNa?=
 =?us-ascii?Q?RYsjhRuBPXuq/1zpKXJLBU5To55vS9PEQZ3HpnUUHK+Xm1US2ceWc6Aam105?=
 =?us-ascii?Q?msEkV+a+1PxvFPyWJl8M4rfRDhgJvlOCZq8bnqVXpXBLI0RH0TYfZvueGXNZ?=
 =?us-ascii?Q?/8l5jPpEsUPOmiCZVKQB1PSN2Xh4i0jUTqsSiqkQRe4gvmZT9bh8jrRPGGSN?=
 =?us-ascii?Q?k54ZbhmNo0b0yt5BH/5D4GyuSqS0EnqAsqpcPRVmsRqO/2OqCzXTxaUAD4IM?=
 =?us-ascii?Q?90J11WEYglL+F5+xI+KZH6dK6Y338NvKs1q3UxxORIs31CEkBjDraRQ8RjhR?=
 =?us-ascii?Q?QOdw/dqUtlwTAvVQBp7O+7AF+5ej4bUn4+fEMxYPnIdcdolcuI/u1TfUWM3k?=
 =?us-ascii?Q?G/Eo93fkV+shpnyWrpN2al6NWTS2zpfJKsJTkiBw0Utg9nzRxCZLgwsy4RMA?=
 =?us-ascii?Q?3b2Edd2PGLGrZkaNCyfRdjoiPimJTusfqxdb04bnzOxXZVI8461Aw/PWse8O?=
 =?us-ascii?Q?diQLItRDgBdXGXqrvf+gqJ/p6G8u0KWanLKI17dCDds9D7q5brMLuTIb1sYs?=
 =?us-ascii?Q?xm6FnCXrh/4FdNkeweC/wtzljuolYig8gP+5MOjycMe5qJfQwAijnBduJVlt?=
 =?us-ascii?Q?nLwQstUcvm2OQa9c5gUj8HF1hiBSzcqtQ0eHyM95733WCuRe0zCmbW06fQec?=
 =?us-ascii?Q?/f/RL1WiWxX6Ri7LCAtQtwbPhoE5aVGijblCSzlfIkvR17QJ5yNHkYdX0VzO?=
 =?us-ascii?Q?1PzzyzJ5lzZMufII1eMTUu1jac5jAod2vPfgep/OKnAPuJrwsVDNeqaWFJ9k?=
 =?us-ascii?Q?oC2P49yqY5i2eSmALsbyiBc/IbXSVKbs0qWSktZ2RW2/y8zzxRrDZlGxf9A5?=
 =?us-ascii?Q?6Kb91NHgo+ClAuRhWpeqixdboOWYMnrwFUwNNkEkDRtJ7cFvPLoOa+mBDtFp?=
 =?us-ascii?Q?Od96YXmozFJTf4abMWoFayc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e862617-552e-4a3d-30e5-08dd56062968
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:37:42.2083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j8dgcXL1ruC5CcWe6iXgbKDuuAiWeZchJKJa2VXDqnJ+LVsJv7d2ovlhmveNaynfKyNmkWY28GzFtLwp/b8yZDO6z4W5kiX+7kyU6iIV4kTPUizq1+hFuQo6yUzGjSzv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5511

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/boards/max98927.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/max98927.c b/sound/soc/intel/avs/boards/max98927.c
index ad18c4e9a670..e8e5d1c717cd 100644
--- a/sound/soc/intel/avs/boards/max98927.c
+++ b/sound/soc/intel/avs/boards/max98927.c
@@ -127,7 +127,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->platforms = platform;
 	dl->num_platforms = 1;
 	dl->id = 0;
-	dl->dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;
+	dl->dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC;
 	dl->be_hw_params_fixup = avs_max98927_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-- 
2.43.0

