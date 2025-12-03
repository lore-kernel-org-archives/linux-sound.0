Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011059.outbound.protection.outlook.com [40.107.74.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A8C217722
	for <linux-sound@vger.kernel.org>; Wed,  3 Dec 2025 05:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764739685; cv=fail; b=E8aAdY2zVEsSptcO1j78BR+3D7GrDj9cTe+7gP5yOTkCVclX8LuDf+ME/pfm9YqaMPDvCzOW9j0sW4VCnT6XQHOA804wC76lYr6DL4mBIO/4Qf+zHxp3DjcgiBb/c9UURjI4sry0nD4CxPTUGEjL3wYsffCciXzJj8Yh9027orI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764739685; c=relaxed/simple;
	bh=P+dniXWjwCYaaeCIYE2HuD7+Z5RETcefsfm2/HP5I0A=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=KZ/fyJsEGDF1B+y/Zbq0vGeH7Xzi8TelfdEp7ezIrWMnvQFTX6/iuytOHjBRBvdd8tG0UW4t/oaK9beCGB3oZdLY/rKvNxaPBhPO3K2y2kcSeP/rHSMarryu8yH8t1znsfxSmTb3ULldVsI4yW8JlJyGyrFLThIiEwIeI09aozs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hbIWWMaJ; arc=fail smtp.client-ip=40.107.74.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hbIWWMaJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EtFvw68zinEmFC7Kz41VV0GPSJsNF2N4eWNhO03Jd/T6KRNauIbPIkGk0p/vcG5lKTl5uPvrEqy+SpnK9Y817uDj+9kHzP2UsocFFi2lBhG3aJXwZ9m3K20nqSCgZXfG0kSKQkmrDxzf/FJQEFw3dpmWPegq0yMmwX9ocAHvZ3TcaXcfOsmcznGljOW3gvLamjPBjgDnUFG9pax1Tz2LLjmtQz4OP15ktOODCOtXK8X0RUj/XRR0sDnA7HUPmcpQEqvigc72z/HMpt0NVKwcvXcWMm+uEAyanm1OkAL/BBcOunHMuylWYK+oux/K5UOeklwKztEj665oftRySLeK9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qi349uzAd1kNwJ2WQ7nye1zidYp2xFFKgcCM56Na9Oo=;
 b=xWaSzzeTcOWMLVgPMbN7lSbyx+X334IWtujEsn4LkVKTR5o4OVKaCeEb+B0o0Dar6snvrCCtzB4dDv1pjyj+/Vc4W+B9mF47HRUQg7YYhgdEx77nL8MuGykc5k9aZwCW5WEWuFwo5Dtu4XCY/aXwS7p2NPKnI6qdM1K/99V19vKWLBmHUfEIfMr0kS3NOhBFfWpvqvmdJ4ukKouGhvRmrgXBggg6yw1p9prUkWhYyo0SVbJWeBgWeBe3rclwBYzlkpSDQ5YW0BSUEn7qxRXMybn10pGXYDy1cPrK1xr3sEhBtxft+S7Z/JsrrU3yE2C92l7DxI4e/6JMwEHBpaJ0eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qi349uzAd1kNwJ2WQ7nye1zidYp2xFFKgcCM56Na9Oo=;
 b=hbIWWMaJfQpgLhF0TYrsMkU75diiggfPgF6B4PPWxL1pViwGBif3/Av08YmnpfAPWmbNRarE9jOlCYOuy95mVQ/ZSdCX3E84ELBqAETbq0aBR48oxL/RMyom32GoVPJEoo3eF8Mm+iJKs4jj9chZQIhAW/GQiK7LRds/6mC4Ivg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11833.jpnprd01.prod.outlook.com
 (2603:1096:400:38a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 05:27:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 05:27:56 +0000
Message-ID: <87bjkgnnhg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: mediatek: mt8189-nau8825: don't use card->damp directly
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 3 Dec 2025 05:27:55 +0000
X-ClientProxiedBy: TY4P301CA0017.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11833:EE_
X-MS-Office365-Filtering-Correlation-Id: d7e136d1-0ccb-44be-08db-08de322cb6c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MtZ9tp+m2HHvE4YwrVi38NzMKBOI8hbhx3j/axfx4TWW2fBYVeuFTOUsDQBq?=
 =?us-ascii?Q?oNrIV5VVzL0x02I3F5krMbh8GYX7QOd9CUHeFBTBQ8VO+huRM/WoDni+XIqx?=
 =?us-ascii?Q?m7h+IVkA3O79gS8PNuMISJeq/s6OASoUnrMOaOLmNx5i1aUMOLNZ/VR+/hON?=
 =?us-ascii?Q?5ZyQpD9PC3uc8aRPmUYdNZH7g2RPFqOoCPZEhxmK6vBTcHeWVPVpe4KNluLy?=
 =?us-ascii?Q?q+5AmowGo3VvXqNXP3PEMLZ7PbCYUlSmZWup/uqpEBgq93XXvaMlVSI1TBCO?=
 =?us-ascii?Q?0aaZiOVSJ3UEMPz85PQrjUa9XfPliVZ+MaK+BXvfWwUfAlovVvqkcfS18j4j?=
 =?us-ascii?Q?HeT32JidFr+2u3536/F9iAwYk6+NH836Rb9qobzgnJYXroY9ZXPsVawYqPPT?=
 =?us-ascii?Q?2UE3qKyHDEJhHgOBP7ocGX1auOxpMhr/ruxECIJRzQBXwrhfCoc5iije7ibo?=
 =?us-ascii?Q?HuWBRqNaHQCfEnkdBWPWBWGAQCooU7Pj6UTTEfhAbAaFY4Jfj1WiDlX6vjr4?=
 =?us-ascii?Q?73y+PW17eqrwiRsH4a6SuzIyQP/KAYMf3UvXY7caNx/TgJOIAHW6u/mnYd2R?=
 =?us-ascii?Q?LxTfx2qzfX0DbWF0EbtIa3t1rFjLJVxVG/yVL/gabHyOj1SDS4pauE8b4gGX?=
 =?us-ascii?Q?ONCkQT94+8CbI7Nszs3dqFAQkREe1V0ujW8Drg4URfrIpBZG90382x/NE2VF?=
 =?us-ascii?Q?rWe//16W09VAEbb/cuMO03pk5PhBRrkKbqYJWtSC9jcM5qZ+evPTWBG5DUrz?=
 =?us-ascii?Q?TeKvTW8R9E9y2RXHfmjLyZoOYH+6PzTnW0IOaHPFVhjYdd9sQce4Dqs5qsq4?=
 =?us-ascii?Q?um9a2JYgY0+rwoW8tt0Bhic8ep9ehzmA0bjy3ebZvyhAxjDkPcTUBbtqK8R5?=
 =?us-ascii?Q?7AHA16YtpQ2YP5PymvQw7212T1WUp5Mh8guJWbx9CrLOUuYmFWPof3X4J2St?=
 =?us-ascii?Q?fcnd4NLrluIZZr2K3QfxKorW5xWEzakkdXiqimLqRLptBZe2Ncz9+MlIHh2h?=
 =?us-ascii?Q?moNqYJ98E7el4DXDazFtsiisvzvVZVc84Zith/jyA1uGMapYb9xnTVRPvz5V?=
 =?us-ascii?Q?uP03wkjVTP7IgWtY976tUyh4fBPB2qLFL26PSTutzUUD8GNUnObuneXYf8Ab?=
 =?us-ascii?Q?r4x7POOpL3YSRzI7/3gWwhM0m6FMnndgr7u7VpnK2+UDDKLeAnZwLgWdNMpV?=
 =?us-ascii?Q?P1qcTFMPjW+a/vrgEsZ6er7aSCGoNRmD77u6gJWBJ2wQ4a6pVJlf+KYvzOUp?=
 =?us-ascii?Q?u4jUGa7nENSm/J2j3NsMxpCG30ghOREk+suJieLOO291GKKusMXB2buhG5l0?=
 =?us-ascii?Q?5zsx9uhZdHwutBKQ75ZTHgvkmRW1kdrn8PLuhFokvk2uSUM4uGWLCdFdWowJ?=
 =?us-ascii?Q?8ejbHoyjZ7cUhXhtqr7EiBX7e37rBQz6xFAIoqrhr5vIuuyOd5eTxIp/jspA?=
 =?us-ascii?Q?M2P7/FD3FUzZHdBdPt3sgsn1TGmVESqaTwAezWRdq4YT7J5Qy2CG/ZuSKwgC?=
 =?us-ascii?Q?pyhJwelY5oIz74EzYru4yTmv/fl/UiBtcyFk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l8TUx+G/8YcdkoHpqcISeLJgH6WBp4AGAAIuAM4woYSzFYSr8oI/I2ChcLqY?=
 =?us-ascii?Q?LvmnTP582FMxrXQs6IY8eYWycb5FGV7118IqXrDWN8gHtL/x3b9xNdZkJPZH?=
 =?us-ascii?Q?o2zWO6sXO6uJaIeoquJILpIwwrb7YSSJ6bCaEsncxO1GTSd1Tqh1tJw1mw2h?=
 =?us-ascii?Q?LnAs1spvtLvXwL9hfjiMis2GQkXN318Nk3HnIrHyczXyFKF2hrvyDlN7YTgK?=
 =?us-ascii?Q?13OvVHAIuTXvvBZa2E+tFADhHjxxdOx02SSGE8t2VSYz6NlEM1ecGDPyZ+ZW?=
 =?us-ascii?Q?sA6oLOX5TpXSNRg81ezORulJd6vbNTfJMPW7Y7SckufzrTCpxGVtqlMjO0xe?=
 =?us-ascii?Q?mciyKk1RWR74LRdV9DYbuoT4iHBN+WKzGW2q7ygh5GI1UsHkNycGheSwrtiF?=
 =?us-ascii?Q?xPWHPDlCfGBATX7mh+TV2hSmXMldJhTbkG+Lsr4yUwPp76fMRi5K1hU9KbBb?=
 =?us-ascii?Q?RPZ+lFrRkd5Zuw5WlgUxXhYOP5DnoyM7o1ZVgOEsWJdxrze7qPa3qEI6igb3?=
 =?us-ascii?Q?kUHP09ya3D0RauQk6mp2xJVDBUMKoEsKaw6kRblgd7dSi2cZy1ZFiSrTbfz7?=
 =?us-ascii?Q?hmoZyMj1eiIV2pcPhRgaXIQVK+gvPb1omLOmgcgnSe/oY8o4edKePIs0L57O?=
 =?us-ascii?Q?nOFJqfGwzRE15z4bn6EzfP+36iB/hSkeR02uWpTeItaRI/u2a1ctNTOq96fl?=
 =?us-ascii?Q?/6qcaggIuPUpYoYx0mPwC9U3B8Nv8Kk52l7V/8PzimUEtcisXkEaLfi0NTYi?=
 =?us-ascii?Q?81Yr0FaryC9IyR7SnpLSvaibHP5vkGxGUHAmKpLLoBfdNGnnuMq5mBjLpyhT?=
 =?us-ascii?Q?G2t3IjVnX6ezFGlN1wHGxVgRlJVYPIbSqaVJnNDY8KRaFFv8Amj62Dwd7zOn?=
 =?us-ascii?Q?tXpxEcodzJ3XL2R7KOvhp97FOYMgCZuYURqG23AjJrMvndlZaJmjkZGeZgQp?=
 =?us-ascii?Q?pJwoe62PxyV5U5CfwJWBokHwXG3LOHZ3el2nQj06lDqko7EoYFpSBQCVx6YT?=
 =?us-ascii?Q?MW+3FyuLBlBKKqawHsdqCTg/eRdg+ODV7S831nAZWNyUKeQODB035SyxmNPD?=
 =?us-ascii?Q?+Ep/D8p1lm4siOXTdK7ftIQa2QsVPA9JtogHU/fNi7SexAFFqt0syaxtYHRM?=
 =?us-ascii?Q?FtPisAQ9iYZrerFb4hX/HW5zvnwuLON+vperSwACsKf3CkG3KRO+DScDzvXn?=
 =?us-ascii?Q?IfIQqnacCvFQlRR8fx4MJQbBYHhc+4g815Srs+3gmsR5tH4NtfsrkNDO1qah?=
 =?us-ascii?Q?xNSjctl2cvHrBCd7RqIrAbWFpXkGZNMuefOoitbl3Sj3DtL21DE7uSNJv0ZQ?=
 =?us-ascii?Q?jzih7wIWC6ZagU5vyKBInU7BIyw4D3HZY0CQY9aM3u6IDXqprH06IrJB4HZO?=
 =?us-ascii?Q?M9HIyGDkE3rG7awQt9vlcSfog20xV3rMJllCBR9+UUTLN6gr0OcebhBOV5n4?=
 =?us-ascii?Q?EHwDtO7FUZHmuk+PqMIkCYprP6up9Rl9dvpjtLxitiOUJU8jD2u/zesURwbW?=
 =?us-ascii?Q?SvPkay2sDjTMcbBUA8V06b+OSiqtovL36NuRm+/iJjEWUmI3luKtfA0l52Nb?=
 =?us-ascii?Q?/+x5sBUHtdab4/AWj/BVVc3jH2oYbTXktCpJPfrqmPd/y4cecGGVVMLGHWlc?=
 =?us-ascii?Q?X1y0LKkgnZdWDikY990IawY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e136d1-0ccb-44be-08db-08de322cb6c6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:27:56.1015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OFWGJWDD/pO2HVEzzv0/D/rhkfBIzuBf3ir1SkoR84qK2aoLVyQi3YBVmga5rMh7lZpO9FpOhoEAvF7FyHXK9BNycvuscfGNiAyKjlNT1qQNtuUB684GKldpMn8BdErI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11833

We should get dapm via snd_soc_card_to_dapm(card), and use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
This one was missed. is needed for v6.19.

 sound/soc/mediatek/mt8189/mt8189-nau8825.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-nau8825.c b/sound/soc/mediatek/mt8189/mt8189-nau8825.c
index 5ef15ec988be7..e849e7a649bc3 100644
--- a/sound/soc/mediatek/mt8189/mt8189-nau8825.c
+++ b/sound/soc/mediatek/mt8189/mt8189-nau8825.c
@@ -342,9 +342,10 @@ static const struct snd_soc_ops mt8189_es8326_ops = {
 static int mt8189_dumb_amp_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, mt8189_dumb_spk_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, mt8189_dumb_spk_widgets,
 					ARRAY_SIZE(mt8189_dumb_spk_widgets));
 	if (ret) {
 		dev_err(rtd->dev, "unable to add Dumb Speaker dapm, ret %d\n", ret);
@@ -418,10 +419,11 @@ static int mt8189_headset_codec_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_jack *jack = &soc_card_data->card_data->jacks[MT8189_JACK_HEADSET];
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 	int type;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, mt8189_headset_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, mt8189_headset_widgets,
 					ARRAY_SIZE(mt8189_headset_widgets));
 	if (ret) {
 		dev_err(rtd->dev, "unable to add nau8825 card widget, ret %d\n", ret);
-- 
2.43.0

