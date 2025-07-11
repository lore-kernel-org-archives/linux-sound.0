Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011015.outbound.protection.outlook.com [52.101.125.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF623FC7
	for <linux-sound@vger.kernel.org>; Fri, 11 Jul 2025 02:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752200836; cv=fail; b=Tl74xSryNgT3+AIL00T+aQck4v0MGzpfBegI8CaDSkBFfyHhq+Ajkytk9u2AnjUKJg14qJ9Hqw+sPZj7MXBW2VWPciStof3xXbhAb/p/UyNxViJ8KtUbPsq+9Ur6Xjj2gC8Glw72qDeS8dPf40Qzp98OCaurOxcwG0ZZ4diUMc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752200836; c=relaxed/simple;
	bh=gD2+ivE2oPSs1eT5EdzON/phYwXt97vADYyIW17VkEk=;
	h=Message-ID:To:From:In-Reply-To:References:Subject:Content-Type:
	 Date:MIME-Version; b=shola5qYmwGfvTFyDAxmFl9rI91GbvoBY0Cw10lYMr6sM1uJ5oefW0f1t/QO56CRAYubAJ79D48oNJnBi1AKxpuq9IXoXrZwewDgYQPqR46GJU14FLgPl/e+ZI2Sb42WyGaD4PsQnyoaWM4Avhw17yFlt97d3+PQgxudoh/VSyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GX57W6y6; arc=fail smtp.client-ip=52.101.125.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GX57W6y6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8vwzqj3UoY5LJMJAS4OrrEudxjkdBq850N+ag2NLt92ZHG/Svsn4PcjtVWUpn40D81zTmhqxxaLMmy2WVTfupsqRWBpZ/MkPjIrUjc3SNfSkxgtgVSW2CcZFbotB3vstKOGKG3db//FOUhSfc+fK0IgmdmbJFkd2i+MXK6zpXbMdIw5CWA/Bvlt7SfIfvYMF4HEdcn0fJXyRGUBRMRQB1A+X7dmo9+aTmuA1EDXK8f0WPv/f2wlyw5YKML8l6ztCbFRm84P3voDpjwh7zvqsurtirRw6Xr1P/WlkNqOzkfRrgOZb8AUTgMQsq4yvp5BJVL+LFbmLpYwrDnCuYUyFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/IuAQSDrtv3enLEgq8bUjvbcKniYFvjzyOA9EXDnic=;
 b=IUpT/KuGRNZ/C7KxpvMBbjkcPYGmIkkMy97aUxsYdiJ/9ONLdMeAhYSdchcBimotGAW3mGXUXYLnFolH0vSWZfae8OszZ+N2V4+7UydDwzJ3i/BKx1dk3CxVMB+3uJRRb+7jFto8XwhJYr54QP+Qri2ONeq81EVKl53UBLAJ2ODRdymdw/eCiuBhE4V7zURj2n2SPsUZkJrcOhmfd4OrZJy02HPoSdAjmi+Cuyy5hnVwN6iMgfmcH3DG5uZqp0WsV69ufjN5jX14bMxMFIsK7IBqh9Nr+FyTqpMeHJ160CDCllj3/Th6sG7L4HIsr4RgPdEzuzEqVftb7BvZDu7wVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/IuAQSDrtv3enLEgq8bUjvbcKniYFvjzyOA9EXDnic=;
 b=GX57W6y63ap5RJQyI/+to07jjqcHP3giabtLWVaIkULuiZOp46k44CRnmBRLF0ZLh3QNwMUt2lU0H038JYPbnD6Ms/xRK5SxV6ULxL229qeRfQDVXGnTxoueytBAoQxOR/fzWh7AeQ/LfPEVY6UzvL41viZies7tTRqRaPgRJjU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB13586.jpnprd01.prod.outlook.com
 (2603:1096:604:359::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Fri, 11 Jul
 2025 02:27:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 02:27:13 +0000
Message-ID: <87ms9b4g3j.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sej34g5d.wl-kuninori.morimoto.gx@renesas.com>
References: <87sej34g5d.wl-kuninori.morimoto.gx@renesas.com>
Subject: [RFC][PATCH 4/5] ASoC: samsung: tobermory: don't set dapm->bias_level directly
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 11 Jul 2025 02:27:12 +0000
X-ClientProxiedBy: TYCP286CA0145.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB13586:EE_
X-MS-Office365-Filtering-Correlation-Id: c7be9578-cd8b-42ed-6576-08ddc02271e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?21Uiup4KEe+ADS4h/+nLdiVvPw7Wwd0yrNIK+AvIN3yti2xc9Db3RcpspTK1?=
 =?us-ascii?Q?2VIG0QjMP38BOIyRVCuuRXFD6C61CXlGzYSHATBHa+fbQL3Wg/ZxFiWdwJm5?=
 =?us-ascii?Q?yvy6vw2mjMvD63svn29Ipc58Lm7vQ231ZWoVTg7S4YT0m4p5z+BHi+YatahO?=
 =?us-ascii?Q?ITvj0IAIiNM3W2UBVPFxNGZ7Zx/ZWvFGcCg+pXvzYzpkFVJz04DcahgpT2KX?=
 =?us-ascii?Q?QFVnH21n83bYI7TkBdtg8Fn4QHt7OXX/mmKtHI9VHoVRv5usBYH8w8FqE+JI?=
 =?us-ascii?Q?PqCFNpjUnBg2pzdZh7finf0DxJ63Fare8fgeAyQpe/5aGM3UoRf4Ee7fOaDt?=
 =?us-ascii?Q?vpiUFhGAsrzuuqT5yj5ZXpTOZJYtNnJwyDGYlyXmulYauPX4YeZ3Jo4M7JHc?=
 =?us-ascii?Q?P0NkD9KrxM7vQv3CQLDSxbCo/ws/3F7uS1iCElARTSoezCKqzWyAJhYYw2fD?=
 =?us-ascii?Q?BT5RBHOZE8ufqxPj0Iv+4xx8OAKHrGCM/HLimGtk49eY2DEROhH2cG0EQXP2?=
 =?us-ascii?Q?BSjiwtRzLQyEprP+wBIh+WJqK6ZB8UL/JG3TjMLrJCbD7tM1OKzEbr2dRpNC?=
 =?us-ascii?Q?4IeGYwCUv4Qrg9aQ1kLSw8bKnqOWBMg4ch0oawGBPMG60abBRo8tMr3jTS62?=
 =?us-ascii?Q?vTNABzeh6ydL7DTFIgJP/OMC2L51qrTkYlCW69HarkKlDjfBNrY3AKZB+aix?=
 =?us-ascii?Q?lxoM2tg+NQeXjFdXgoSlEmTK7xkvtlS7G+ODESzGEjwfpnTPsbRNboukxGi1?=
 =?us-ascii?Q?8TFwNmPgYBtyC8Hb2o74YmYNVjdB7wr/dAOkg/OHB11KFaiWhav8eXCIKQAl?=
 =?us-ascii?Q?ktsSi0SMjVQup2MLSBbfwvGxaqfqnox9BG5yXib/mnvjpj/O1af5zwy6SRYK?=
 =?us-ascii?Q?HfGQh7T8kYi6hMl603GyqZmpDoUzzeKw4UeGwq3SRTSWADD/ije/ByEwG4JY?=
 =?us-ascii?Q?QUStKfMPH/ax9BKhGCk1kVA33R6EQx7aGs/D/76vYsAYQaMNRDh+cRq/EIJb?=
 =?us-ascii?Q?IPUj9VIRdQrFTK/7KLPmQfxapBeCAZnTyJW8IyhT1YulJ0Tqg7vaxoLS96Y/?=
 =?us-ascii?Q?tw7pssMW3IoyQa/DQVqV3BqGbnNYcdeQtsWIiuUp/ZLOZsOIWGBMjvCE5mBi?=
 =?us-ascii?Q?Rs51p5nETdEqFII9GGV83AEsziIuYdQHR4p4xB6DTQvkx+7znt8gE7byX1i8?=
 =?us-ascii?Q?5DRwdXOp+OXfwWp5kNGe+PXQXBQ7kshFBERUi4QSjmW40rqqBvZAXTzs8jOo?=
 =?us-ascii?Q?51SwqYzA0iJX8j1RIF9aLKN3hv+Mxo97n54VziFVitsAv6uFmni4tkkq+MMH?=
 =?us-ascii?Q?xlKfc8pu8jbrET/z7XPU+FDN3WTwo+TmBDwjg4bvBK5KDLKWCFfD3ck8LfcF?=
 =?us-ascii?Q?vdwYbNTpDsR8I2SjIZjQ5KS44zL2dyWLjagQ0YNxGX45Ud/feQGH4WWqtL9d?=
 =?us-ascii?Q?mo42Z5/tpTc0J6xf7HgYQYMllAb4FlhCtqruYvyRBKTWC1mNf41zT/uz1f9j?=
 =?us-ascii?Q?LorIgbsSZjN3wCc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n0kksefi4EoAe3btUz3nEbB66Pi1myr/ouun4rpI1yyoLCayFuhZJ80rw6Jg?=
 =?us-ascii?Q?FNXDSoiDoFIDv/oIre/GamU8y6jDzoifotIoWGXL0nf1VUxeZ2/k7Zksb16/?=
 =?us-ascii?Q?b8HHkxD7g4KnBvMuG1GwGno8ofxj5P2SDPg/lbxWgYRAj3vUX/E4cX7i3WX8?=
 =?us-ascii?Q?+ohxkDcC4m/VSYBedmqqM5qoVyBlQhFilnUyahyyZSd/h7Tvyjmqwe3/+W2m?=
 =?us-ascii?Q?POfE3QsppvKB0+BtJt4YZnSdGhJ9ykmjTC2ahYSl2FQ0d5YtOrWiOPUAW2OT?=
 =?us-ascii?Q?cX0335zKmjJ9+zvAM8CbZqpeIa3tyr+hnJ2VHrbl79GbAtbGQ/9StuWyEPmS?=
 =?us-ascii?Q?WH507WCB/DHxp7LTd0kGOuqlneH47qULvI6gXMSKOrxqCUFu8FjAAqYYIh5J?=
 =?us-ascii?Q?e0NfCxBI39GUHl86QKOY0szyIwM9u61cSckdpS10ViHsAxQAq7RH+5jbXTdR?=
 =?us-ascii?Q?zDTY9nm8vTVkcDIJWHgDiXQ9DKdiXgQo/Yd6clirtHIGvoHuSEUxVfpurTgq?=
 =?us-ascii?Q?g8hO0zbmROlaHL2u7WZdk3jW9O8p7pSti9EpxEHxQB4ZR2ygsLiFLGAnHxMC?=
 =?us-ascii?Q?KyGW1BHqvGaTX5W9W2lkdM0hyFMIMQ3X5SWbYq6dcR/AFe3grjOjwEofczzu?=
 =?us-ascii?Q?6QcFLvUZEYj8IfcKq17qUDJVX3VzsHwuDPSM40bO7F6iA9U6W2J4l/g87UHc?=
 =?us-ascii?Q?vv2ZJWlSaoDHcZQMwWhOavw/3a67mFVxvstIunKonWvTQ5+3NIsPPuULcw+R?=
 =?us-ascii?Q?uIsppxqk0kSITP+now2v0Kn+xPhfjos3jF0sX/bUi8sIB7GmsoY+BsgTXy4A?=
 =?us-ascii?Q?sWY7ZXB4mCejkpag9UoXyNejm8YNmPWZMEXExs/SI3PbP0prsrHyKCDoOY5J?=
 =?us-ascii?Q?naKXoJFw9bzSzjuCeHEWHC0bFf728ROKbHGtz04rnZQWsY2cWZdxl0J6UgR1?=
 =?us-ascii?Q?xglKXTMJzHESaZvQ8b4lN4q7Wn0Fw5pkZ76QPlvSPLtYn+M8L5UN7BESEAdT?=
 =?us-ascii?Q?zohvSrzajnyEZEY0u3HoJmIfqxiFDON0KR4zqJLj7wD8LraYMrlbRE7JB1bw?=
 =?us-ascii?Q?MT+UrEhsqKH2I3rR0irrdBfg6gdm4YxnRN9Fq+7UMrBTOsby8S/CEqM1cxMq?=
 =?us-ascii?Q?f2l4/BMoEaf/OmEVcXiXeFHmOFk5dO1JFyC4suZaGREiMo03aO6pKHt/Ga/7?=
 =?us-ascii?Q?BpjoUmuY+VvQpvGOdguqWdlx7jd7daKKHH8/kXKtVqzhc/hPbAc0Bkcqa7Rf?=
 =?us-ascii?Q?pVBYe9yCf8T/ZVrnOi2THuCKy6Z9OO584ldEr9nL2OnqFC8oaQGgxUPXfukl?=
 =?us-ascii?Q?TnHpoX8faHCaf3bOHixAZ/E7TItlGDrjlyQFgtXYYOopU0+T5iAMVrqWnrrI?=
 =?us-ascii?Q?CNdRaCfLE6WHDoAu0UiovZib0oWAreHKzO2ku1oRVQMyWokTGpkOOjFjvde4?=
 =?us-ascii?Q?YFjQbFt9WzadePijdzlBlQ2952D5BUYCu1Ejfoe1k9ThtyW1K8BGDw1VbE5J?=
 =?us-ascii?Q?npLs9vzPdN0OLzVXPJDTdlmJsHVICIEXfacIsfIBfnJCJk1VsJ28KedQ57im?=
 =?us-ascii?Q?KNI8gB/Y3E1oK83Z8omnHZUjaMbtsntNTidqSZR7WpBy8SeFlGliQyjJ1sVQ?=
 =?us-ascii?Q?EmaOwziFSOvkrjaVcwQYsy0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7be9578-cd8b-42ed-6576-08ddc02271e9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 02:27:13.0038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZbgEC95zad57urMfqFqPbYhIyuM3lcyV+PDFI8YAi6YR45gCymc3SowOw3HVvUol+Su7q1dyFwMXQ/GP+dIQ45HXGFxDxeucmAn8vOIwZVd2nKywY9okYiDE00qwQfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13586

snd_soc_dapm_set_bias_level() (A) will set dapm->bias_level (a) inside.
No need to set it by each callback function. Remove it.

(A)	static int snd_soc_dapm_set_bias_level(...)
	{
		...
		/* success */
		if (ret == 0)
(a)			snd_soc_dapm_init_bias_level(dapm, level);
		...
	}

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/tobermory.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/samsung/tobermory.c b/sound/soc/samsung/tobermory.c
index d0f0c01365aa..1d0a782402f0 100644
--- a/sound/soc/samsung/tobermory.c
+++ b/sound/soc/samsung/tobermory.c
@@ -91,8 +91,6 @@ static int tobermory_set_bias_level_post(struct snd_soc_card *card,
 		break;
 	}
 
-	dapm->bias_level = level;
-
 	return 0;
 }
 
-- 
2.43.0

