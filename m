Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011030.outbound.protection.outlook.com [40.107.74.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8058D191F98
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533729; cv=fail; b=QKxGUmZMmxzxbcgnpZDuoefQqWEjLc2CPXzeVTy2n19a5slyZ9FrkZYvMzps/ZfAaNk5w0zqmYd3JQdM1UkVPm6vr50uMnlvlZNyyICtiYN5kFG+W6rBi+FqjYgULq1YDxt1Fbj6jmSYWj+2DudHpmCC10z0IjrGr4oOUCFwRSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533729; c=relaxed/simple;
	bh=9vG5YVdBS3Ib2Yo8h5ycfhsRt7Y5jpXPh4WX5ADH8bc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WW04fv9KgI9g27DJB+1vNaaGHkM+xPfyjT4YKmZbdjFuvg+PeCOCRCNW/ODL2svJe6AHlJ+yXeVyEGeVBpNyYLiq09F1549BJ7vMvnQ6Iv26qFb9wjPX7j/aiR/6zf+U6sUvmHthwkwpMVgYmhcUh78bDSW6DD+3SyhrscM39Rc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=U66hbZUO; arc=fail smtp.client-ip=40.107.74.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="U66hbZUO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8Gu1761duW+lV/tQ36cXq2UALOLARHy+viweCKVE7yI2bgfJ72OEtPps96VS0s6d2Dp6NiUAQig4+C8bBZ8gKtMjDh1h6YkNkZybvk88MEc+85y4j/9RTFozpiTmKd0SQ5fK+u2S6jZ2Q1eKRiRxzcUh0HESSoACbXhMp5WxS0NtgaDSQGG2JoSP5HKO15XPfp53l5ORmb2oENTCUZBmmmNo3NqqhmUGudqkjtm2FiJnGnR3K/cnpT9d40iypHr5h1OjlNzmbXQ2vAwbsFhBuMRbBdydffb8BoKzKPgolgViYUgnLZKyOxVE2qZN6HINWRKU7UyDUNJowgK7S/uyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDkIbKMYPWQltBA9v62BgLfEGTvHxXyxquZgj822FCk=;
 b=ja4PZmIiGTR3u/zuDS451A6WyiICoRSY03qSxDig6YHkCr3wbyOX1+3xaEk3ltGf/e7RKJll2XwEZeNOrFMODf69nwzFtEhpYw8pFP6oeaAfpia5tYLwm2kGhTs3bmkId1QTtu2BvpZwaNyuh4HFR0L0/t0uzkuVWxTgalmjTTSRKhQSoVrL/g7tF9UbrQsXoX20pq2lKPpz9fJtzhXG5J2pNu4W8lA5nahiSw163RLaWMPJW92pQGjvrYv5MS9Nzmgj74b7oY8rqqMA1r9IjgfWz1ADbxGQ8SoeVz0R+9Z+PK3s84Cfi/ZwiIwSH4Rq9zj3ZQzWui0hl2bZxG6TNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDkIbKMYPWQltBA9v62BgLfEGTvHxXyxquZgj822FCk=;
 b=U66hbZUO8MQHSAUBembxpEf2u+oGG21uDK+wcsbQyHZHZj2V9OsfosQFk+furSZFaTiljGTyK2d9C1YJE5ppnp2QXXfU/GU9iSPYe3u0ZFIis0DZp2TZZvFEh4/wBdrwu04pPB3UZ7EcUx8d+pg2AisI0NspdDOjH0xT/CVNt5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9660.jpnprd01.prod.outlook.com
 (2603:1096:400:232::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:35:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:35:25 +0000
Message-ID: <871pvlcwte.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 085/157] ASoC: codec: wm8940: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:35:25 +0000
X-ClientProxiedBy: TYCP286CA0324.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: ec840ab9-d016-49e7-657c-08dd5605d7dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HDwK2Z4s0F2pWLP1BHcvdYNawogi4cRsqDSupY0fAKxkjacZAmVB8QuuKqtJ?=
 =?us-ascii?Q?CXwiahmfIMT0YbS9HZgvDcTpAyyIDZVUWzURuOdEPs+c+km91QgBy7fILdyj?=
 =?us-ascii?Q?JfwKdTTtb/qEbwN4GmxHht6nHV2zIy9Pq+CKNrz0d7QefdOsUVae0Y6MD14b?=
 =?us-ascii?Q?swKS2fTtRosFC0lfdiyMSNnyHevXzPJZDD6wHZz/ZDo1nAkoS3KXsMlYVXLf?=
 =?us-ascii?Q?y5OSZt/BSxUcoiPr9VSFmXwInVkHk/DY5Gd0RijvEeIg1n6sTTHhWjFzme5I?=
 =?us-ascii?Q?JnOi27cCQJ/5rqvCvIX9+lcDXmYJn88EQ+sDLiLujDEqcGOzljbJW5b1Wolf?=
 =?us-ascii?Q?2jL/IPLlWNkZulI1qjb+3scdqGbuWLvx2/Z0r3WTI6eL8rZrvPoFmnBdEtZf?=
 =?us-ascii?Q?A//R4SEwfN5NvsCGDjOzjPWInSiYdLDNBuoVQSpLE7M5E3/uUjFFzsj4Axfv?=
 =?us-ascii?Q?mA74+8OvlTDuv9zHfZOQrE+2MnCrYwSCttZ9YWRsq/gpKcyEBtLQv9wWqU5F?=
 =?us-ascii?Q?H5/z5J6HNfuQsjuTgGAUw+upcC/BaFZUtkiiI2svHpFUgB2VsqxQzdn0KkPM?=
 =?us-ascii?Q?FFXLv7uG+o6am31pU1gtXVwFXavbfq+R/XJ7zPJk+/kKxRx+XGv7Snb7qRtS?=
 =?us-ascii?Q?JfzEjHh1yuSRXeq2tGAyQpilBViZK8LHpJZ3YoZdf85MsDqrDLlrZ0u1Zrn6?=
 =?us-ascii?Q?BZSTMTt63RQL4mpIzAww0FT9QeHFW5Sep0i9vW1ci/Xr0UCKeLpDMgiRriXQ?=
 =?us-ascii?Q?fIabr/HtZoMKZAsv7APeCblPbL9hH0XSG+CjaNCDuci9DJZV1F+v74O/CuKy?=
 =?us-ascii?Q?YiH9pNNUr38OV24YGP8rMt8qXxzLtk4k6C4yU0M7C+1pj/dViTO7wMJBYJja?=
 =?us-ascii?Q?vDeG0LOddO+YCkSDfGJU3Oh5yQ7WnYfD7aZRxzTg/oNsnyr5yaTBiJeFBeqX?=
 =?us-ascii?Q?oPLIEf0GQoWyA98JMIs+ng51GIdOatJ1U//r78G4nEOX9V81AsfEdtZE9emS?=
 =?us-ascii?Q?Tl3hfHijGEf4URVAaWhcUajVJ+Aj9Z0WDPMfq3baBAwUzRd4yJm+Gu8xKb3M?=
 =?us-ascii?Q?qJHaQQ1sYxOiEIU9x0jQIWVuEa4ETB/UBanat3rEFObrc82wCfmD3LAL+NnR?=
 =?us-ascii?Q?55HCMn8hw7TXkKgahY4R76kiVAOXtr0lO6aSfg/gDh5X4DIys9Bf2ljPiAJ6?=
 =?us-ascii?Q?j00eUUbm40ouwir/gXvhgkTkzcGKYLpOB+RVuAdlUsjZLmXdAYm3c72Kz8c/?=
 =?us-ascii?Q?IW2J9b080wQKUr9GB2dAzq/k0InRUrIwsk5MIzpCWZwgfM2s8/gDiEKZb4mj?=
 =?us-ascii?Q?ZkWtNqTvvSmUPps2GmB81lTrWZ0WoM7Xx7YJThaMsjMIKmqbFXeBjgFcF45z?=
 =?us-ascii?Q?IT9ytFJ2VpOtp0WutP4pqS4Sw3ltSQOT/0bXdZJPiSS/FvnVdNpqRuDwIrGi?=
 =?us-ascii?Q?0p/1FwdxRyQdyWyFDXX4/VbQkrENtj6a?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wzzaHVn2kaiyczj/0Yo/URycQaqSd5cPUyWR7PvkWU9KZawW+r2JYefusJVA?=
 =?us-ascii?Q?I+VK8/Nc9vX1Yfb3VRb6DsUsFi29h5nIcS7nBLEY8jW8RBx9FyYomUrR+XVa?=
 =?us-ascii?Q?EhtOb4s5d0pbld+056dpPi471ogxHdZmGeMn/+5y3cQCbTlq5XjPWRYhNlf2?=
 =?us-ascii?Q?zRx5SMGCyd/sg42vqKYNcxf5J37Uk7h/carqvihHsLkle69ZhHZXWfiObJ6h?=
 =?us-ascii?Q?8bJ45tbiC/M2ey/gPrGG7ZFNbaq4Q9sbW5qf6KR5yfDugEbXDJK+974kFfR6?=
 =?us-ascii?Q?9unVOB9ZmkNp9xDDrUlOSb6QdSBi5+l1SFMUhLwzTE7Qryu3EKxA/pIyuJ3S?=
 =?us-ascii?Q?bpORlm6rpwqyP6nym63aqXhuknupqN/14lsBx1ujz7aWuz35mJQYos5JXEh5?=
 =?us-ascii?Q?ukW5J4qCoegW4iFcSV6gFhs/IY6KFN9CD8srIW1b1LCb3kiiVUqS7LGpdm87?=
 =?us-ascii?Q?EAwC546Ug0AdMvBJT9qisAUqxoNP/v4a1CRzHSZAHOT4IhKGudSz+hEfa4m5?=
 =?us-ascii?Q?3bIytZ3RboSJlEqDmupzyw0EfCXCtuVSdaQhVfYxoMvYKfzcD2uONBFoH+/I?=
 =?us-ascii?Q?hRhK7zhfAbT3+Nohj9Bm8TGLGoyirDiSQwtb/vuQFx/3wnWidudg0NoJS9GL?=
 =?us-ascii?Q?ENtQRrYee2htzDPcN3jVPNFQ071Zl9XFPlnrrItvqsom4IEnvHjl+RWtpv0w?=
 =?us-ascii?Q?BpYJUA9D9G6hmmqyLavtMgYKTWNlUlZ/hsdqf0bgtg4CtTmI+rBpNGhjnn6P?=
 =?us-ascii?Q?QU9/H9iB3SPyNyl69971Dk050BiWmMagV6C5RHaljPM7SflwqA9H7AJ2P+D0?=
 =?us-ascii?Q?ijIRDhKQv0AsDfJsBUvUcwJUuv5aWbsvx1TXGIB4j+V+1mH8KOAfJ0UORDb5?=
 =?us-ascii?Q?PcYEEjqGqn3al8jzGQoOfOeu2V90as2kDZQBOlehERPrKtHf/hibYP0Wqqwk?=
 =?us-ascii?Q?YHtCuKBRTpVf0K+ynWPbPzL+/H6zgvoWMB26jVNvnRTekhvEhjsZ5Q0xgWv+?=
 =?us-ascii?Q?GQ1DVhbQYvDM9FPi5/WgogseTwshGPSU1mBRO+58BwVJ0P59GO3/8L5AADf4?=
 =?us-ascii?Q?bRAO/11JlYHuE74f6wcMjifI/ER4g4bL5zPJVCRPRU8D/pGacvk5ufw9vmeR?=
 =?us-ascii?Q?NHJtIPDmzZr809ilbh1GuDcDZVwri6cQZJ36eboxars3VR4th5K8vpsqXfbx?=
 =?us-ascii?Q?5M4dLkSQMtHnbZtjHeHkhW6gGr6dARhsQ3515KO1HbxAu6fXYS6btjv6tl+5?=
 =?us-ascii?Q?KutB2FVGkbuJacWcjFZ0s16PpUHu/+Pbj6FIu9Y5wF/eHciFkppexqtoLqGr?=
 =?us-ascii?Q?9818Na+t84hYLEuZYi9wuH51N1F4Uhdq318sFK253jBTaaQmsC1ThhMNFngO?=
 =?us-ascii?Q?8b+spKUBsEKLNJ10kOOO6YOGhSkjUX7KjesepIQep9CY0SUCyo2Mux95KJ4w?=
 =?us-ascii?Q?nGA9QNXMYTnCtIKEobUSm566G7GIzOzMntln+NHtxkWMtjBHnx2b7i5ARMqY?=
 =?us-ascii?Q?bu3VjpNxJ9662M57kh5wZa8qyu5UBwm8fu03oK7nx90WA1hRvPJPG+89ikY8?=
 =?us-ascii?Q?LCwhS7wjUVhZEHjfTKOi330p9AF/V6TK0CQ9Z/+XPMy8nkwRnwifdf2CnQmG?=
 =?us-ascii?Q?agAFMRq9ej+6R2LLFEYN9q4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec840ab9-d016-49e7-657c-08dd5605d7dc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:35:25.4332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPtynWBFHQe5UEnPOMHX/eGOPyteJntRCAP01fESeeWbEWDL08DKqwHH8OOkRgZvm6ErB4HjMxEXq6wrJFZ98ELusFY0NgDEUiA/Kzamc1HfdHEaivgX6CIN6kIQzyBh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9660

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8940.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8940.c b/sound/soc/codecs/wm8940.c
index 8a532f7d750c..401ee20897b1 100644
--- a/sound/soc/codecs/wm8940.c
+++ b/sound/soc/codecs/wm8940.c
@@ -343,10 +343,10 @@ static int wm8940_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	u16 clk = snd_soc_component_read(component, WM8940_CLOCK) & 0x1fe;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		clk |= 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

