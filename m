Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011028.outbound.protection.outlook.com [52.101.125.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6672E18C332
	for <linux-sound@vger.kernel.org>; Wed,  1 Apr 2026 00:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775002752; cv=fail; b=pyobRW6B/fUA6sFYWvzttirYKfbgk6v0An/yu5RldcapT3It3waSq8SBT/d3qoWmXiGULPxlWkw3fHRAdS5WDcdks3whfG6AkpI6BJGuwBQNF9zi7V/lNZ4La10GkmqjFv+M3x1EiparcfZvUx/F28Ios++hghzgpF22/UTqrdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775002752; c=relaxed/simple;
	bh=RYsbhuCnPbdax8Ail0OFcdxskeuyADeH9vlXyOTTdE8=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=jacs2Fr76dVKJET65x7aiBkK9hYtiWZOu7g5rsT8H8E/IQZrK9Pa6bEaik29xxF3AmY8Ul7ydUfUGBbKiBRnFMjPt//OocgglgYj4oMEXzk160pER9tTtrQFcSSQioUJ6hXlLr5AxRZG2lBS2dD1xhb5f+zg7YXBDb1JWYTi/a0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=F9HDQi7D; arc=fail smtp.client-ip=52.101.125.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="F9HDQi7D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVnT+cdChuV1j+t2ssejRCcbxJahreCSGWz2EAV6uNrnErVKgZDfLF/LR6g8DkP6AoRx00CuxTGLD9U3OdnKy39N+yssywZCHgUVN41I3+K/CnVWA4xLs/lnwHSwZS41a+ILo2nfVA1ACg7YxTdICShAWrT1hfuH1k3Ghvv4YknLIulwF+BYBUQI1qYJxXkvHcQd52/xQsCsT01zrenGbqW1dSWJ1xRQKOgoOI3E5BP99v18Dd/pR32BrJHQ00eMmdkWb2KdKfsvtm/cBHY0Pqmdtizn/mZrYzuRDb09w+GHKa27DzekmguKuxq1AwwqnA0Q9kBCifHaAEhV/n3qZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FI5Ry+WPKUH1dPLu4kILQILQUC439CZSpOgp6cU7tZw=;
 b=WGCeNOvKyTU7Chx6EmK0AhbxA3+UcIbonkLRSaNrb7dx5msv2pKmcNNHap5rRSBqZKbCtxP7MwvzWxhYTUNIejTOab41v40vRoK9gdZCq/CvjzllcD0SoURwAUZTU5GQ7tqKek6XpImZ5i+s6RzedJbPD27OWiWluMLiuP8kfxi6KXip4LDYsGmM7o8YVGb6IGAgYuBVcOHun9eI1tXxZWIQy5tMHbfkOq4gLdYqOx+xkqFbgOtp+ogyXil6hdjuCjoR9AJpko+WbSEdvf7o7d/z1AAbYqCKnanaVSuv4wc/YgeoglAUprYT4KEPgwY11FWRolgdecc3DNEBMIDzww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FI5Ry+WPKUH1dPLu4kILQILQUC439CZSpOgp6cU7tZw=;
 b=F9HDQi7DHdm1yEXfGkJLa+9z6+btxOlBU7hoa98mVdFvMK3V3XQVm6OQlKvkZ8oMihKTCVBVc0UjaZl/0vRunemzcBS4tslOwGnCHyDdKv4X8rY5fSEIizp+4JAyKCQoq9hkiBgvFB92MUmq9IdDXQRC7RBGZQ7Z6vcPj017kgg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TYYPR01MB7856.jpnprd01.prod.outlook.com (2603:1096:400:113::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Wed, 1 Apr
 2026 00:19:07 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.20.9769.015; Wed, 1 Apr 2026
 00:19:07 +0000
Message-ID: <877bqrttvp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: soc.h: remove snd_soc_of_parse_audio_prefix()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Apr 2026 00:19:06 +0000
X-ClientProxiedBy: TYCP301CA0064.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::16) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TYYPR01MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: de970d67-774d-4507-de11-08de8f8449ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	OWhSc3lhaUXb5eLZWwFvOHy3dRu72Sblcxm9EaViE2Ld05AOGWhDRVIUZkTUZaV2RcHugxx/+Vz3HnVKTMtT8qfjUcW8uW2+LS7CJoqmRDT7W6C3aHdQGhCmzj6dEO639XtTYD6BjgWKQzMgjlvN32A4UJig+o4skN0z1NNSSz2zkCwUvF09FHKR6JGsC/XJ3c5+pWwIuHPwcX7G/x750U3I+0IbtMnkkbRe6J+1MXCed2Y2LyudSr1rvkcCJctEz/I+eGuLIqGKlASKwIK82Hm056swbNF+wif/SWeND+aVgK1Fiakc0zTOKecWRaAwrps7Xrw9ut6ducW+fIHI+LxQtjAj9E/pZ9Ylgtw1vJ1pPCzla1SAHf86hemAR3pW4aDLZAwCM6UMGmO9I1SB2VklO4LxKgh10NHmuV923WKPrSLTkiu3L7QgTR4uVDgAXs9kOULy+juJYkTpmf949ceLJlCSiOZCccvEPwRlKV5s+QLjjaWlJv8OXO+syijpj+ho7ZpkU9BVJK84JlPmMyAg2XGBSsYlf/sbwnu4BdAPesuCrl8lzD6yr+R6L57OQ8Xkdnx/2KJ/RjQuqEY62M8V1s2to+CrBmKe5YSKoSLSVCaxf/stB8OMmBTlYk3Ujfm12ky3ag0gtN5YNmzlcd3WyWKYlDX0O0ohW75JAe0IgyQpp1624DdbVCm76jIr0pqvxtHHBL+jWORKz3StEFCUU0IFKgFS8Vd+8uTlKEg6saewx9MT5ZZLc98kjKGdi4mCTmnmxvj9+OsIgbt17br4V9Bd9q6D6l5ji88m4L4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eiNSij1NWoZdH7kYDKjLGN20hfJZW+8eb5+yt1LMA/Jc4iPI7DOx7ko+jfAY?=
 =?us-ascii?Q?Kt14PJZah0SrevYuljsm6uaoexqAzmukeCpsz3CwoUC+5L6H5O2AJmXtA83C?=
 =?us-ascii?Q?rELfjfyoRST6668O6LgC/SHsCDVn6DQ/ea4pN+3io0Kh+QZjTnd29i7AKqjA?=
 =?us-ascii?Q?jfcJ+rmqlzoUAiuQKdwQEs259IRD4fe36F9mZeFuCvib9NmnocQqAtjERbLp?=
 =?us-ascii?Q?+FD/tQhtu1Peoqc2d6zMx/+YQE8d4RWH3/mt6UUo/wA+EAcFZg6/la8ZGz4L?=
 =?us-ascii?Q?sbc+T9qO1YG6aPDTdF41ir6k6wfdmZNgsB8cUAHZvGnilgJw0Jnh8HmmxJBz?=
 =?us-ascii?Q?TGOrSS0bRBvlyEJxMW8XsATZ8CavaR+Y6ZeFcfhOvyPoj20MM8CNc+J2BYJR?=
 =?us-ascii?Q?xfyh5dYUlGoCqj+cUSL/CPX5WNnSqMNmV9YbBHcXqPTiQO1QHcSj2Wzg7YSX?=
 =?us-ascii?Q?/G4JADtVnCg9WZ0Zumf4IxpUtgVHprvB2n/6TiDRdqyCTXmOmy0s+lhBw2nW?=
 =?us-ascii?Q?eZk9GhzJYmg6+DQT0VVe9Qlj2swTEOBo/CYVRaowumg1iAkg0fRCD9/CX8De?=
 =?us-ascii?Q?0h1WcxBB4KUQu1DrM4AV0q894qM+/cJ7UehZ8B4OttgGAF35AHO8HomtY1x3?=
 =?us-ascii?Q?WjiwsH1PZaa4NH87L09NheZDVqJ0IfxxRg+ZJCNg+Gn7icQ03IEret/izNic?=
 =?us-ascii?Q?I7aCJvp1FF5JFzLiDfpEZopHoTC2873Co2yGIMpsFgGvA6X+9Se6EsgrIEUE?=
 =?us-ascii?Q?kfh0uT0ZTmWS6u9G0OVUQ1L0r3lK0Vm4tECd6zhouJiGw09yMP80ZQDrLj9h?=
 =?us-ascii?Q?FthRyrY2X417TH2gBoSDK9IiR8FV+wEQ6QvP4spPWM/26OwhZiyV2IA+/GOn?=
 =?us-ascii?Q?W6EB/v6UKck/RwV6/Sp379q4nhaR839etmeER8v+OpFT9gi5A578NJRyO1jz?=
 =?us-ascii?Q?s5EpJENnwJNYmlPkIsBIKJt3MyxLV4WSdGEukRqcmCWO7uiUjesXsDaaQ+q9?=
 =?us-ascii?Q?73B/53cgCQqfw3ZHSgAVYXwd5qzG+nGzGzPK+BH2Qybyg1wEUvaLH2eT0wsA?=
 =?us-ascii?Q?yDqGK1+96X5R5lXMSrD+j7GQ1jl2aupZ6pKo+OstPgWy82ZAmd2PIjksV4QM?=
 =?us-ascii?Q?RIiKKFTCIPbt7QD2UqN1MTy6g/4Pml72PGadpJ8gj1EDAP/Gqi4zjx9LZl/3?=
 =?us-ascii?Q?5gpdkkqNBbANBdWbBKsC8TjrRwg8SMda0HVunmbOSzQBJDX1qrwbBhUHuL7G?=
 =?us-ascii?Q?eMlSA/wHMw3igh2DSVtqheRsSRPwIkK6g2iV6ks2zmMin0DWkGxS7IXZPO5h?=
 =?us-ascii?Q?KjwOQJSPiSbxGFzFEa5AUipKEitAWIi9G9LJFEUleejDvcztYp+z4W42Jie4?=
 =?us-ascii?Q?lE0u6RjEC8IVrXaFL5GCxZjmq5nqkdclovX8N3RFuQpX1KCmt8U0+A6+sha1?=
 =?us-ascii?Q?TWZwfpinHOoW2WPZUfwn/7JPDtL0DcGIvahnbAzP/f7mQyxD7eVAi71JH8rQ?=
 =?us-ascii?Q?uUGv7VcDO9OPbo7pmdmO0a8Ij+VsZk0rkYF0pqH3mfOHUz5Xr19c3rk3gyJL?=
 =?us-ascii?Q?sVSDGfJpkw6s/Y/bjLnjNH2VIBejgO3DeHrwbzDSyKwEiqPkAP6Ak2Djxo4/?=
 =?us-ascii?Q?4Gm4RZJkpiwze2tex++o4gWL1/3gPlBe9c8DVCAMDKF3vKKtWQ6Smi+MHv7/?=
 =?us-ascii?Q?aIZA5d0N126Ms+wbMxYO+zJLjFB3UAtwTOL1TY+W2KPT9SZoMdHUV7CMIarh?=
 =?us-ascii?Q?lrUs9jsnsfkGHXfmPC5HVPHT6C34AUE1p5tDOwjDs/bhZuTp6doc?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de970d67-774d-4507-de11-08de8f8449ab
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 00:19:06.9925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: blCLNUIU3LKyDJPfypPQdVohp2LAGe6UuFZbxxqV6QuqLku6kuCNEsYWcuqnENN7mCx1tcyplLqC2+kOgaKpzs28PC/YvWG9Bwsv7rOSk80V/cCFpKyJcJ3Tfiu+YiyV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7856

No one is using snd_soc_of_parse_audio_prefix(). Remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 38ed4a9531dad..e852343549743 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1339,15 +1339,6 @@ void snd_soc_of_parse_node_prefix(struct device_node *np,
 				   struct snd_soc_codec_conf *codec_conf,
 				   struct device_node *of_node,
 				   const char *propname);
-static inline
-void snd_soc_of_parse_audio_prefix(struct snd_soc_card *card,
-				   struct snd_soc_codec_conf *codec_conf,
-				   struct device_node *of_node,
-				   const char *propname)
-{
-	snd_soc_of_parse_node_prefix(card->dev->of_node,
-				     codec_conf, of_node, propname);
-}
 
 int snd_soc_of_parse_audio_routing(struct snd_soc_card *card,
 				   const char *propname);
-- 
2.43.0

