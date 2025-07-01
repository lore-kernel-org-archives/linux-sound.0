Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011056.outbound.protection.outlook.com [52.101.125.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CEB3D6D
	for <linux-sound@vger.kernel.org>; Tue,  1 Jul 2025 00:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751328625; cv=fail; b=WY7zSmrHQZ/zozDIeoLdmjL03yP9lMlJ9Xebia6VhDOuZFBu6KI6vji6d7PuqcjyLhbVktAQdCZNah5BmEueI50hILhRJap5Sw0sQYBjTLQAzD0q/TuncOhttk4sPqcKSvSgIGXq5rv9zavQVtSWJGIekmuXjtGfPFaKA63ao84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751328625; c=relaxed/simple;
	bh=wZAcbQ1lnyfFWukYC+5/kOSGzQ7pwCZnLXw4LlFXcxI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jDRvV3ZGnrRpWa84Vk2GQLAd8/+l6QGHS5VC1yzGNY6CSB/xjfUlKFoW66SYq3ddZWHdH43AJh/enbv5Cj19+E22w6jx7uw2pBOPNpjUovlWn8DxognHkHAHtGIPSngA8KU4dzw7PERoSrbWSLI/UhqvS9AmAVARHijSTh9fJRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Wq1mCzXI; arc=fail smtp.client-ip=52.101.125.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Wq1mCzXI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmFhTIj/Z58zWgre0QEO58V/BR34ibvUKBSd7wn6g3oqM7xYt9In7UJbVs8T6SaccQBbtvUKWGT4ClEj6RoUH6vAsfL+UhiCzUkN4QFbvFQFCpeCTWvn5T75CefRN2hZjpWVhFgf3D7ETREsnMq+Tel9Zap6iEcBpTlIvj3YYiEVaQ+2irs0RVtyJOChcnaLDAxLKtGU8ybbgxKL5JqUs/kDW73J0TBiueLVWjJY1ZIIYgLYuq+CWelVtUDLdcbhfoXzhSDtwl6KirO3MlDoIsU3kL2K70PJ8i3xGMipG+HKAbICHQuE7b+CxQjEEpZx6+bQc23s78FELYs5Vi5oBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0JME7kR0hCN4kX6t+jmzwNfa7jx++ah9HD27oDFPug=;
 b=C2E/FRol8J8R55vgxzmrqF6yBU+mtQmYkKnY+CdbsBF7ZEXkMEakt5D5LXPwKePgK4vbVEgiyk8KZomWh2ELhVnln8JI676YbN+WyQT/3mXfMHYQPo7089UtQ0fQg4En/DladnaZZCNbTk/jE0RMqW75m0VleCKhQFbYxB2MVh0yrBciEuGt8jlLixgmsrbZPTfD04K+kBFwUs3Jpd4zvZ56YuYCRclpIZDL0Qs8+liq8+u7h71zetYqC/BN4KQtlHB5xQ8bw5yy4wqsiltjY2hLv4eTTH78gHAi66gPqgllXTkWrjN1gTb/o1QXxF3FFDAUCQCBz4rAZKTAfxAzYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0JME7kR0hCN4kX6t+jmzwNfa7jx++ah9HD27oDFPug=;
 b=Wq1mCzXInimJZDLD4ZU53iq8grdX648HrCvIlLvuFSMwAzMwPSRm3aRansFx5KOBdD0q9EWLuhLjA+LJdnzJjywroJVcsVv7zSaX+dvx2JEMd6zlGCBuwftKp44LJokX0Ms0QMYLBV0KD+CAxJGi5tXoGU8U99h9NaFZzH8l9cI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12421.jpnprd01.prod.outlook.com
 (2603:1096:604:2e2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 00:10:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 00:10:21 +0000
Message-ID: <87wm8shitv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 01/11] ASoC: soc-dapm: remove unnecessary definition
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0t8hiue.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0t8hiue.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Jul 2025 00:10:20 +0000
X-ClientProxiedBy: TYWPR01CA0001.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12421:EE_
X-MS-Office365-Filtering-Correlation-Id: e45b6183-f3db-4638-0fd0-08ddb833ab17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iF9Fc0OCJG3CIAKirpG0Hg/vm5e+X1XToUGpQfNCO28GAVqiaXijuGRso6O5?=
 =?us-ascii?Q?k04euf3vVP35+rt2tTWjcHmPkTnPNZe/LDJ8yKkQc+7Q/RdtC8Rju4MzAMcb?=
 =?us-ascii?Q?+CjqrSRSHwRxDMgKavED/RyXTLU6CrFaCj/l8iWg+yM0rsZ17OY87ms9xyVJ?=
 =?us-ascii?Q?eYm5qLVkvp1rl5sePLLAdzbhnxQPqPJ3U/9K8zTgEQxlAUgwt1AatSSoFsaA?=
 =?us-ascii?Q?PNKJAG1qcPsI1wYrYn77bv3b2tKlxgCvWWc74LSd9Rv+fG2X1hIwTV8HyCru?=
 =?us-ascii?Q?GUSO5j6f7XrhiPrbSZlNz1Ct0JQzkuyjazTgKp4xOyYwpo5M5JCWiegSI9TQ?=
 =?us-ascii?Q?bmNd3th42JCACBRKpmS0a82fOxB0JMFm+af3inWkkqUslKgOFBhoaYvgu5Zd?=
 =?us-ascii?Q?rsMX4z/7FDZiOY5Fr+u14Jl+02KtBWFN8sy9uapy9XwsqMkYdOTILtqkpc7G?=
 =?us-ascii?Q?NYXMEsPNyVwTGVo/Z6DYFOPjrqwCe6B+vqXZwuL7F4JEIao1TcoiHpgUU/ia?=
 =?us-ascii?Q?PK6d9S1Xh7iP3Umz/R+mQCV/WJs+zchudm++zvTkqR0/UF6ih357D8huDW6h?=
 =?us-ascii?Q?qX9PNStfseM13ZYLsCxDtOOsWi57Y0cfoh9OF64F8qPRlp05ClNNWYa9cVsS?=
 =?us-ascii?Q?ISfb/9c/RoGtXzcVBIIFjTbTlylkOGN5LCWY0j8XYPHYwRYK/rRUjUrvlLv2?=
 =?us-ascii?Q?GTyVtP+S+wEaqH85FMcm5aExG9b95zxAYGavbsrDIL+mGaadnExwwAZwFNeu?=
 =?us-ascii?Q?4OdMZxotPxs6EipQnfECmG0vH5WSz8K/uwKfUMnTqr8AC7KpP2rRQwgrrbGh?=
 =?us-ascii?Q?6dcUKK6vX/MyfRxHQ5DBA3Q2yLxA64PWuufriNuZCj6m+qIIvhClQDT5v2c3?=
 =?us-ascii?Q?rdwkt7VWefXCJKuvkFs7athgt5qt0wUChee/fLKeLe8fANpljNzIBWwOLg6p?=
 =?us-ascii?Q?kOpi/8IGQ5lQqjiVwrjVY7d5d3QtwKi2g9PBI29cjbVz6Y6aoL3NNiBDbiOm?=
 =?us-ascii?Q?mmFXHI/fPHzuTqtjIF1lvzqem3tGOK4H6NeLnZQQIiT3Em3kSL5mEDWI3WsC?=
 =?us-ascii?Q?RCga0hZNB02JlVxG9jssdPmc1wnd1ZnrD3RcYV1oY9VC6fx5YIldbjJ6bBy7?=
 =?us-ascii?Q?ASQJNrmF33oELkNtdl+JufSxGk3uuPaey4wHxNv7YUuhWJ2mboIa2bE0gl2w?=
 =?us-ascii?Q?I/CicIjNXK99HlCgJhKzAWFYZudTWzYQJRTYHwBowtW4OIE87SWkj8uB6LCh?=
 =?us-ascii?Q?6pgKFI6CcP6rOOn/D4AKjuhNxPwLS/LtCrotq/jcEjDiQmz/Ujs4In/w1BPy?=
 =?us-ascii?Q?5/v+f9KVeyH9t1FsWHK+RXAi4J2llatCYbL1HWRh2oV1aecBy8iBV06XwVOq?=
 =?us-ascii?Q?aw/jZW/imcw/RyneqqzXk6TNTT3QJu264a5iIEwaMLfcPeW40vATWRtq+i8l?=
 =?us-ascii?Q?Hq1wNElpCDmPfjdO2/0vRWCwk1EhllN2GKFB84n9oTi9BXSDdF1a0w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IOk7QPI6fKsr5L/61EeC7WaVuS0b5cT/Mgq/BkersX/tFZx/rrCA4isafCim?=
 =?us-ascii?Q?R5V2jABJ8LnkDBj0paPSZ0URunhXEx3inWccxSe0bXxp5/WbWMERWOTaWHkW?=
 =?us-ascii?Q?VOy93+97qKtHfpLFD8MlmBKcLlm1+WE6rDYgoEZKRDRZgmgAogs8vBVbbpST?=
 =?us-ascii?Q?stwo7Y/1JLfDqsg0F2CdF4XzoBEWhbk5cz9oal5u1sg3i8FvX1stnTRv+T4G?=
 =?us-ascii?Q?HjS7sctAkR/gGNReWarcatyqdyq31Rpuv+j8sbTxYIkHERnCne0812Vhm/4u?=
 =?us-ascii?Q?UDndNFh4Xxzw2kXd4izbmLI4VY2+6dQ3te/gDr0rjm8EaH/1/xFv6ACCQhdP?=
 =?us-ascii?Q?XMVTm4n+o5nTFWbvXfr2+NW+nRZRsIsSAOViDcRB4CHvrEf+SFX9jnP+T40W?=
 =?us-ascii?Q?k4jMUbUC8XyYdCCevnuJinq/NrWM1GiYh1RI2P3xvRFO4r8PCtrqETXNToQt?=
 =?us-ascii?Q?DSxgQ0OlEQz6/R9mo2e6F5Je+/5C1ky3QwHsT0Two3hXgedEJOYZYb/EnpFU?=
 =?us-ascii?Q?CkxRLwSc2xbBUwwRBcQ8otTPJUK6KdMG6Ms/TD2O2zy0euyKlsQBjxncuu04?=
 =?us-ascii?Q?etakFiFGy5nMUJLDgZ/eils9IpoUFn0p1AwfxGTnMYR+0Ty6vVoPG8qmqTDE?=
 =?us-ascii?Q?q92lu/t1MIFrWVDWLl8Q00PMrKTMStRrDNAvKpAIOTE/AnIPm722SAa56tae?=
 =?us-ascii?Q?HbHVCodMvbwfig15HI3XEPhZQpIZlsBRZTTwkuD/oeeorBjeD8dtm7HoU3J7?=
 =?us-ascii?Q?fdlPyOqD0ga4TqRfN8PMxbZ50rmVWEjZy6IAo7iYazstuTIao3JwCmScck8y?=
 =?us-ascii?Q?6xNyIu+NndUDt/Ab8EC9fu0H8SAY+goSOOcixEEKkVNqS/aQypYoUq83iie/?=
 =?us-ascii?Q?EuS+69gtsh+w5ojfKNBKCeVw4iZETrnB3T2mS4L3F7hLD2Kj3kvDFy2Fu/hP?=
 =?us-ascii?Q?YDTIfBk/Ff75OX+2OB0YiEW3u3W+j+ZAm1CMZcIwoR6qeEydXVWFGCZTMMiI?=
 =?us-ascii?Q?714UNqOw+/JUg7l+h4fwgPtUuqgIDgon10WTyTGtP10fXSDpCyyWZA4eQdNu?=
 =?us-ascii?Q?4PNE+Vd9ShcTwNfqEaQ0tZadzN+Xqb8USPWe9SMDVU06mTVcqE6pblbfD+Wg?=
 =?us-ascii?Q?AambJfHLAHwTFb1vBFe0K/E/VnL9qNAihY3dRYCKkVlZIslVqhFxhi1IupR/?=
 =?us-ascii?Q?7JKvsxc5W/2na8h59DqIWlfS7U2WD8lXJ33sVakUdq5YLLpZtEbZKXXfglyr?=
 =?us-ascii?Q?5zQx7x+xKwFfq6/IBO3VWXPHICabxZjsr+rdaxTQ8dcyzIXmymNXJwF08dNS?=
 =?us-ascii?Q?QbWwwMVP0NVHTJwt7R6RqGvC/954wcaim5UVCVCmYCv9KpgrNG4C2EMeRQx9?=
 =?us-ascii?Q?xgTpmkkn223LYCmPDwzy4cY13yUySwNbF3IzIFgtRl9nuzfY9AVROxpCTcnj?=
 =?us-ascii?Q?Gy1beyvftDXMzD9sy0n802lMmOZ7NYbthbqTgnz//vUiNnm26j8rE3cZtlhg?=
 =?us-ascii?Q?88aviUwLJDbRWvXrGYcVlqiDJgLWsBohEnNb++US/HtH7jdBEfh0qAxPl72s?=
 =?us-ascii?Q?sVsGmD42YQWxfOcoOv6xx0e+nXBPHINwAIJouSW85onrAGVEqOpgvHc0TeDf?=
 =?us-ascii?Q?n3afZCvIWICZNIfT+qzZYCs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e45b6183-f3db-4638-0fd0-08ddb833ab17
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 00:10:21.2557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QP7+WXSFvsy28EBLEbXJpJqaVSmn/LzVOx2z7ENFofbkFt3W1v1U44xg4icw9LVICBEHX/4SVWE4G1qbr/LH+k027ii5XbS1VZdygH8F85T78iaBczn31UI5K3/6chDc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12421

Below functions are already defined in soc-dapm.h, it is not necessary
in soc-dapm.c. Remove these

	snd_soc_dapm_new_control()
	snd_soc_dapm_new_control_unlocked()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index f26f9e9d7ce7..091ab31ae42d 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -55,14 +55,6 @@ static int snd_soc_dapm_add_path(struct snd_soc_dapm_context *dapm,
 	int (*connected)(struct snd_soc_dapm_widget *source,
 			 struct snd_soc_dapm_widget *sink));
 
-struct snd_soc_dapm_widget *
-snd_soc_dapm_new_control(struct snd_soc_dapm_context *dapm,
-			 const struct snd_soc_dapm_widget *widget);
-
-struct snd_soc_dapm_widget *
-snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
-			 const struct snd_soc_dapm_widget *widget);
-
 static unsigned int soc_dapm_read(struct snd_soc_dapm_context *dapm, int reg);
 
 /* dapm power sequences - make this per codec in the future */
-- 
2.43.0

