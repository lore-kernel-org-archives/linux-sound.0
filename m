Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010022.outbound.protection.outlook.com [52.101.228.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3F519D8A0
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533881; cv=fail; b=gbxT5hyOEj2WdLFVcALgoLfOx9tiAd0P4hhfI4AjDVxMvVz6uAcv5KIggTDZocxrJUUt3kWVGspdyoeCdaIhjDSFQUZSkM5lOMOBo4Hg1CGTnr/JK3TJByzrSSy/4jMgBilE+CoQ04FIJ6GWHb2xo7uZFKJ2+sHtFjA5gwvFAks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533881; c=relaxed/simple;
	bh=LFPpCbLBC3HZraSHjn3gex5EGOi/oaDVhOQIbEEsyvc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iIE1YN/5CYRSKs7ZqxYg9iKvybP79PkGCKPHf+uS08I0rjQDXtHk0TZWMeZhqLCZxvDsZC7kTQhVZzdBexMf/BBoFZDvUronpbjmlheMn5rcHTCQAtsClC6zpXWWxCniccx776FNXQw9ncvCCiazcpPLez1k4WUnQdjK5P3RfaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=h5cNEQNW; arc=fail smtp.client-ip=52.101.228.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="h5cNEQNW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtCpuL8MZdYtMD5J4E8XbEJgfUQ9Y60eCIQNEZPRpD+CtU4VsQDaczBpvmjAeWyzZg0IFRTlD4QeHNQYLns3qh0iPJOHan1Wnpx+RV0s6rLa1mCBpwBQ8JgDs9YPaO64N9rDE1S3t7Vyyj1yZ7ldm7TlR5w2/0YARJcFoqNC7iMhfw/tFL9dSmkw2m4tRf3dLd/icJrH3LadKFZzZlvyueHfMgYeOVsWifsSaX7S60WJmJ+jWFbb3TFmV7tj17T05zCAvUvOODjWVMrzCkY6dzsovXhz1E2jveDZhl9HwYMgjL2JVe0rbHKRNBHQXRj2cKsAFXH+dchcQ0o9rTlTfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5sVOHOaWhZYWp+JFuX3IUqPNuLlTH7KdHYrgOhukMA4=;
 b=UWxxrXqB50HPz5OqDTnpNrxLTOQNWxmRwFWke6ty9L4t1wdKiR6FJmmNvjLxHyFGGDAAegw6KyR8k5iZj8saLFCYKWXPRz+yzcIvYytZNJNQhnD0jt2CwDKti9a6Cj8zw3lM3Qqyi884c72jbfc9UDmiCRxKDBLg40gyzBPieI1BYDQoYTbCxoTebwTohXpdoQ8UTdX7hPZrHQhvptm+efLClf/QMO1Zu02YHLxYuWIqgfqsL7gSiR+oYLGx+l21r/sf0SgboVsuHaDzSi5vQLip4zh+20xEK0WPgMq+X+yNM2l1UTkfHqaf+ecnByUoEBx73GN9onn1d9oYAMzNgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sVOHOaWhZYWp+JFuX3IUqPNuLlTH7KdHYrgOhukMA4=;
 b=h5cNEQNWtxsVgaMUE8FwmQ+aqaVY7O+IqIN2RxQDkzphq9Z0auaCY9wEsbxICNQ6tQxiS7hVKaoVpaDknQZCFa03gKm6kv58yLwu1vP8onLj0h2IZVNgIWY3nXimSnXFWvwAp8EEWn0GKiymcdUB7lijUjOqs5Jy9FZ8ZjOEvZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSYPR01MB5511.jpnprd01.prod.outlook.com
 (2603:1096:604:87::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 01:37:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:37:57 +0000
Message-ID: <87eczla3ka.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 126/157] ASoC: samsung: odroid: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:37:57 +0000
X-ClientProxiedBy: TYAPR01CA0163.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::31) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSYPR01MB5511:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aced2fa-8008-418d-3788-08dd560632a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I848zWLBudedkKUvXfU/w2X5nCo2B1MnU7Abt3mUkQwQ1NaKA6oZH06WRIwh?=
 =?us-ascii?Q?u08MPPX+gjTbK0rYEXUUTXAe+aYldswaBYx5+Ma2/NCn7mfOb45kRZBIhDpS?=
 =?us-ascii?Q?nOxFGc0Ee3WXqWcNFvZ02uq8maL8EWZww1Ep1mVXdoCwcKujYaAnx8UTQvFq?=
 =?us-ascii?Q?EglYPnoN+XivxPu5Z7AnX2Dv5dLLd7VyMEhP4VFkCVFbS4eHdA/337a9RVdE?=
 =?us-ascii?Q?HC8FETudyDDnbuKxuIitar1oec3nOxf7zp70JFRalwwvsBeaCnEU3Mz0qS9u?=
 =?us-ascii?Q?v8PzocujMqiDGTdAm7qU8RkMSDtKnfzAddheIR5nEkm0eqZtMjwNtQaQ832Q?=
 =?us-ascii?Q?1msvC+GJDsez2tfzBT164c1ls00XULlVtNY36hsTExL6a0Efeh9PX/nB+n7O?=
 =?us-ascii?Q?yiysZ2vBAfBjADMAhxeqm3sx/DzL0OyiM716Z3YJDLy3zkg+yRZqDs3C/5MR?=
 =?us-ascii?Q?QIFQs9XXKyXDctN6H62OYgirW6Fu3uNt96RVYrG88qXdsbCWezlfVL49hyV4?=
 =?us-ascii?Q?zeQD/IhN8DHziDIrzctCXiRrC+418Pt5cgFSutWd6v+inpg9oMAtHvUFnCkU?=
 =?us-ascii?Q?n3cyohHxo27RqYB5ZnYUxuQ68t8dIWjeR+YgSU38H4T32/3p2ggJGxRWB2l0?=
 =?us-ascii?Q?pku08DBzWegJc3/UMKLzlHaahDYjBXlOmXYxKE2exGItJm5088+7ung2M8zX?=
 =?us-ascii?Q?ShKa0d3n41B8soGpBKuZDm2Ese4KGzCnEuYy4Fy7dTTFnIr+awvorhQ4fBKL?=
 =?us-ascii?Q?6A7E7GQvq/V7+F1ntWaUXHmlp6j4eIvSThzlr/drNx5mEGWM8oXx77BAn5yz?=
 =?us-ascii?Q?FcOT7FuG35ZL9cQ7kFLDYCzHBosM/MnaeGXucm3Pc6jZRM3Fk2AA9wLp/hd5?=
 =?us-ascii?Q?Glswt/vCPCc4jne1UiPWkpTDBqG3BMxaamXZyg/iuYlJ5gWTKuDrGbVwhfrk?=
 =?us-ascii?Q?r9p76CqeS/qfVvVygoRsPKPxXYbemFlt/4/XZQvGS89hxNi3QXWSSeWxQkqJ?=
 =?us-ascii?Q?QHQThSkYEBM1v77YwCbcKyN7iPMCYaJLSXSmfK8oCeIXLy8mc8fIN1pWbE0s?=
 =?us-ascii?Q?4NAi5UOuY5OnRnY7cUQfgsZyGE5AuYeAlUC6AQ62M9V9keqIIWhXqamFkjLm?=
 =?us-ascii?Q?OfjCPwK6ZBeVw7hHWwx9U0xepLp3Yjq+djXJuwXfGpxxUYZGfyThm3nTFFbK?=
 =?us-ascii?Q?Qna8qMBjcw2U8mfZWncfqCCo4SqFMWbBh1jAyG882CtFdWa/a+SNlB5BEL7d?=
 =?us-ascii?Q?MPfwoq0JICse1r+4TLcIkyIjSoCm72eA6NI4h4XIoYEqf7T9o8+waYw1/9dT?=
 =?us-ascii?Q?zXWT9Jl6TtKWK9AuzAJFg5REIjDnc/eI6WAN6NUCx9NMee0ibNjNCYtoo5Q8?=
 =?us-ascii?Q?GzqdoX9nDxLQ1qr7e1Z1RmyeLYuJeNioX4mjcd28+XEI2o2QY9GqYFUITSiA?=
 =?us-ascii?Q?S6IzDNZv/iOexcNdHCAcaZ5TvXe1q5Nf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PML0oODRQIbja4nO/jFDzNN6dfy8rITPN4VX8i2k27TpXpfH9ElGvCldR3cE?=
 =?us-ascii?Q?1/zQz297O4UKJcVjU1ZJx9jW2d1wqsthjBOTKPvgu1LgLViaoyy1Z6KaB7hl?=
 =?us-ascii?Q?dkCcswUynMsgCVO1wM/CDfu9PVi3vTORdSGKcWIiErUvvIKd3SFfjdp2M3ye?=
 =?us-ascii?Q?hsRnq3ZIAyb+q0HF7dvHtUUVBA90BjreVL7O6IKgqCzfgxEQmYY9EGkhqSD/?=
 =?us-ascii?Q?5SlC9eBt6LA/T3+cmgBYbI0h5/5MpFO8vvt9t2PRYDJKusHmXjSUdYuOlA5z?=
 =?us-ascii?Q?2LI1lv9unc635Txx7SIKw8AuFHgm3zm8/v0nCr2g2ohjKY0h5EuWQe28ipCE?=
 =?us-ascii?Q?E/8ve+fiHxjgtJF0fEilq/Qgc25InBYmkHy80Cnn8IDtz//2LTDv0tQrTGC2?=
 =?us-ascii?Q?YY5mDsjP/zsFWBPX3UDTlWoolxob7gp8ehcMmMN1zOjWo21ZzT6wZ9hJwJs+?=
 =?us-ascii?Q?OhhaLU43OWmY/xoSWTg17M9MHy4RKE8PP3EN7AWUKJXuj29dc15iXGgx2LVY?=
 =?us-ascii?Q?riTXL6wIdO20vt3U/uqSPeMGe4cHC8LhFE+IUJm0TZDInBTbeGmjoXrZiM2r?=
 =?us-ascii?Q?0nWMJpUBnlmFWlon/FWzbWDsKKzokB1r+wzW3LrRqzWWhh2S6lgucYjZwJTc?=
 =?us-ascii?Q?HNscOzh0m9SzhAduE9QN3wrLQR6g32AT8b/st4+lIJ5E7Jwwm7L+LRrQL1aS?=
 =?us-ascii?Q?B7my26ZxYnjLC76WbXB9qewLqBiryFXMQJSZf7s6r4xRYKE+scS7Ek1Tu7u9?=
 =?us-ascii?Q?FXdYG1shXuj6mMoOjxzyG3tb8W8u6YuPDxEAN0jzo/T6t+49aD+VHuSmi90v?=
 =?us-ascii?Q?QQhuijWnbgNQU35YUYNqHh9LPVrRekCeoMj1grlBqwctnjlDyrbOgabNQIFx?=
 =?us-ascii?Q?3cMS87lbaleCksKKK99lQWBxWyQB0vpxCVNxThSVk9Hg5jK8wk1l9UY8PsKw?=
 =?us-ascii?Q?32KC+1nzusCK4I41V2NStbiA8d3MJuv010jvDcUc4romlNt26uNMamib4j0a?=
 =?us-ascii?Q?ktIMS1GE/8zC6JX6XnpxhJRsJwiTEEvurrbbbcS9XPfji1WQ5wPJFpZ+Vz+8?=
 =?us-ascii?Q?GVJK+9wsTGwy03Ligv70GyYeO2fFBtRmEUhfqbz8KwvuVtOcFWoWCcijZtja?=
 =?us-ascii?Q?R9rrbxwRrTdgUU5Ps7vnY/ucJUYweqPG9P+x45sTlU8y8AsCwUBkzOX6bEAg?=
 =?us-ascii?Q?XedJFYKYi8XLsAuioy5fGcimkBvp8oh26usDi20NYO/UF4sAwX2w8xExvVMo?=
 =?us-ascii?Q?HkDhef340LkTBHEZjEe5pYNFHlX3MQjN9Odr/1lpJc/0z0xgV8gZAWWYreNE?=
 =?us-ascii?Q?+9NOFV2jX83hewS7eXgqp5dBpW4yvnvdPjWLNyeHbbL6CXB28Me6mf5RsreU?=
 =?us-ascii?Q?6mP/40sJ7tanFLXFNFXLW1MvN38h97TnQLpwVXRm/TIjNf6K5iZTyi3rh7uc?=
 =?us-ascii?Q?AzEHs3IN4gjlBNh2ax66UYySN+sCZE5zlZ9QiKqoWCp1/RdbRkAlNS+kiqZJ?=
 =?us-ascii?Q?ClHQO8/AlmIFfvXBBxJODtBm3MYJdewL2y1F79E34XxjvDNiKnUzncR8zZVK?=
 =?us-ascii?Q?+FXbXkvjo5ZGcbKtoW2JLzhsa9qd1TLXpp31j9qAiF3kCvWWfx8UpzaLrgGF?=
 =?us-ascii?Q?xQ5UqJtMENuGUw76FtX9jSI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aced2fa-8008-418d-3788-08dd560632a0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:37:57.7244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVXDAUkAyemt1uca6B3kaO582Hw1Ozm6S2LvzAYLySxu2PkcuB/AczHTHpiJOkXrG8a+gD1nL74snWlUpRumCDEz3sYR6ou/WecfhR//Ud0VFhjZ4FBazT09Kc/8wXY4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5511

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/odroid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index 40ac12c07145..ab3398f39f4a 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -180,7 +180,7 @@ static struct snd_soc_dai_link odroid_card_dais[] = {
 		.no_pcm = 1,
 		.playback_only = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-				SND_SOC_DAIFMT_CBS_CFS,
+				SND_SOC_DAIFMT_CBC_CFC,
 		SND_SOC_DAILINK_REG(mixer),
 	}, {
 		/* Secondary FE <-> BE link */
-- 
2.43.0

