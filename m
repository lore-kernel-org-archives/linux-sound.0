Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011060.outbound.protection.outlook.com [52.101.125.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D966E15442A
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533869; cv=fail; b=qvbSVLB0kHZg4AbCTRpgv9j3e7COya+ljucZWwL6/1FwESumpPX6IXxrY6OSzXKZ1XNw7kkJh+0/QljBMr9RxuBHA9vESreL9lnoecM1ySiVkyBUG90n5dJ7ExvTIQT4BlQQNLc9ES904L4ZWZh5Hp6oMXhV79b7z8Xh7SVIFwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533869; c=relaxed/simple;
	bh=fQUH2iDD29kW4sF7tjddQPUB61ZHQLX8vrZB+XLcvko=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=B3oD8j+uLZQL3XPMNIreKu23HgpjbFqDhXYS/Wr4RotkrY0WKdrHhElKNuFwxEmznPoYAKw3yc2kHxi5Gj39Tc9QbTJXMHCUyu4NkGMg6yXNA1M7Fs/u+V7iayDxu76Wo+TA32LEcLP0+66QZpFCqdnxLXfixU0qa1FrMZacS/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OKUwGQhv; arc=fail smtp.client-ip=52.101.125.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OKUwGQhv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nyYlDXehpHkfLZSWBZRxRY+Hm4hAVF+dXoQogSDrqGU3RTOaCKH8QwHV7q7FI2adBSGg9H6tBsysOHZEbqmh5KIjAH9dIp93uwxEDTONAjAPP9D3G6OeA2RLDr0mCBoeU26SGN+vRrvjNOe2lGkHD+ZT/GSKaDxbDZpUC8ilcNkAsFN7wTn1qXDBkRnJ3wHBiNTs+O1MbBEOSyIRhZBWGCHACCrXrEaLg8+ZsRZUQagZkBOVEnZo0j+/OUdF6qK7CWMhGxD5YGfZfYKSKeUxokun+VdDZCIJWK/oLM2oAAJ0C8Xr8DBOMBX1l/gttcfl56SddAD5K3ET2Oyjos2/Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yrc58ut8/ICJEGxgp6CspOvY6MQs0KJm6zDGAG2JU04=;
 b=dUE7hq1nFeGbAfUcAGK61o3q+JQNvG9veAKd44S5PrAPkMkBhfgn3uCSyq2g8MbMWxcOTyPsU0H33R79gAFNeJ9nrcSX2g1GInc+g8EOo/MZe0K9+BH4IgIRAGRaikiC6LWjLL0jHeOoYrovVfG0wyJAuO31ufkGmLnvEGBjXsgV83Tf3aA4LKlMVYET68XTAYWIWw8ZQOFG+Yk9U4/lvqnr29LMYh1rH2X0GSuYmGQsE7CJVJNQM4+0MGfn9ogOcY7lMScBkpRoNuYSzk3491KAlETavGJ7oqtqvuaHhncHyIF0innRizUO0RjnbT64/iADUPgkWmDC5prs8E2Vhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yrc58ut8/ICJEGxgp6CspOvY6MQs0KJm6zDGAG2JU04=;
 b=OKUwGQhvz0z3TvjTC3Sp9uuceQlg/R1RxRq6mIJUG1sy42YlGDBi6n68Q8fiO+tcFeKCK59z0Kr6HvapjhYT/LmCIYELi7y9Gg+ztBv9WJP4fobxa46BDy1PPc+fkPb1x8zFA82deskDVYzIensVoShcgd0Be2eMfknCjgcCDLs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSYPR01MB5511.jpnprd01.prod.outlook.com
 (2603:1096:604:87::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 01:37:46 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:37:46 +0000
Message-ID: <87ikoxa3km.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 123/157] ASoC: intel: max98357a: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:37:46 +0000
X-ClientProxiedBy: TY1PR01CA0190.jpnprd01.prod.outlook.com (2603:1096:403::20)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSYPR01MB5511:EE_
X-MS-Office365-Filtering-Correlation-Id: 142f8ed7-76f5-4d05-8243-08dd56062bcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+rBWMi9B69fLtSTq/9DR0JWv67oSouSjfY4rBdPwR94lVuGuVVC7urKtir8X?=
 =?us-ascii?Q?2IFjn68ENq7CEW9vOxVWuZhjA925CwDihU+uOWkS2u0m1zC55HoXQAhMGdKU?=
 =?us-ascii?Q?gSew9KwZ3nD2ZyhDGO3+Pa/zDZtxRsXF9PQFH4Kh0fCgMmPsbwsS4wmUwYEV?=
 =?us-ascii?Q?s++TsJ2+7A3vtsARJq3CbQpAD7a6CLe3P+GqyjLYt6GBJLOKzHjSReYGGjIR?=
 =?us-ascii?Q?iWGQsVaheRaRHmf17LuZunyhzRPQ2x4P+sjVHPLlyRqi4EvbOlPTM9dYbiTM?=
 =?us-ascii?Q?6ZBBBCWSc399IoeaLJ3Br78w9wpobxTGljNjC9L/an1LBWcAavRbwVz5frdm?=
 =?us-ascii?Q?yK1eLKFfa/FoWh9zMMNu0p2Ym2B/+DsZ39ZdkeqcA1t7cdIW5rGj6ar3C66n?=
 =?us-ascii?Q?x9Fp4vQG4kxya9mCHwnUc9GyCdK/Bf4+QUgE84urOVZUfL6+9f2fjpN655Ss?=
 =?us-ascii?Q?zqQs2loR/HhtAUDdCRphNgPrQhfOAOSnuBt0OZ0BWH1/UcNCBSRvesCzJMjc?=
 =?us-ascii?Q?fltKIdHrwbH1XNI1FAMKP/7A8Z5oiDCxKl7ZX63ciNjGjyGigYhHVZsxweJQ?=
 =?us-ascii?Q?kyZm4s/VttcHaSXxoeTwjv8AxzucGSiWTBuClMPB/cSpoDwL54Xn1Qw6ysK4?=
 =?us-ascii?Q?uUmYNds2qAGL8fBShAwymkeMZtLkTNeE6mOK6prUpsud00Ce3e12iZ0Xcyke?=
 =?us-ascii?Q?HRiXb9T53mLmwkNoNdvTonuBMvYrFW3h0EP4J/EBgFRvqjpKAVvKtXjYih95?=
 =?us-ascii?Q?g6lW1y1IXoW/Z+NYUVMcmp16azN5GB5q7qumkU5zU45i9U/Y8n8xOO5QbltE?=
 =?us-ascii?Q?8LyeCVpLX46EQ6+t3hjRozvF5HrG/kJ+Jx4af9KRCA1FtbjyM6uy5lMAEe67?=
 =?us-ascii?Q?LqbkfBbJnFXEWiwbnvs8vvkg5gO3rVnOS/N9EO+oaPaxQIy/JzL0UNCMVEBf?=
 =?us-ascii?Q?LR5glo16qgDK8lQOwpcK+BU85rZcDA1ptAu2M4mB1AvMTsP887gf2Z4h5I11?=
 =?us-ascii?Q?e8Ca4a60lmyO1gurbDbpJj90I1cMbGM1VoVn5iLVFlJt76FJ8vGHNGds2D9t?=
 =?us-ascii?Q?73FLdWX8M6mO9ugsg8kUgKY18ZlALIA+PjKt3Stibt23OFkmq++f2XyAWT/C?=
 =?us-ascii?Q?xvfrimecGaI6UioPkmV5d7KsASQ0aO1DGd+oAGxRwglvg0OBeMkGhumXYmjb?=
 =?us-ascii?Q?9hBy0ICvoIVsqYjGKPJhdaVOOMTuiDwiECsLO0ZlKRb04ZRa+tdbf1KWwVvl?=
 =?us-ascii?Q?oRgSkaOGQ59vXKdx1ivTviIWYmmwiZv0PGN1Jco4B4A6cWbH1u8immEtQk/3?=
 =?us-ascii?Q?nzhR+X1z1oHCvKEDbVIyLnVnHpQ2jJQgMMIr5vKyYSjRqnwQ/+EqRtaWsQjJ?=
 =?us-ascii?Q?c/KvY9oWTe1GxAqf2VT0VJ9Kawewf9SdEers4wgug2ryVPZEw4uzTcUIrDKY?=
 =?us-ascii?Q?NWVJ+HEsteWjiHETlxK189aftV9H+icv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uRhYjg+tQNmgIOyk6yeRkUxZ3x1CcHP5dViYSqB5TRPgjgPCP3QBEHfhNYt+?=
 =?us-ascii?Q?+qMQ3vm0MK5u6eaNQFsnvNBq89xOVxvKIlbztZdu6wkjVRilZIE2bT7qUJ0B?=
 =?us-ascii?Q?NGEEFwJWGg7sxLOK9Ln6S+oMNY2VjdGNlfiv1Ro8h1A0i5scxqkmAZEG4xcs?=
 =?us-ascii?Q?UMGHMk9vhoq/eYHXjeiqTuNnEMiPD4s14TquAIqdtj9U0vc1xbxYhK8xCdyO?=
 =?us-ascii?Q?k3R5E8L+u68+VqcRzZHiSswZOlnow7BjLyQDOJx6i3cnz15/18cXWHul0z+G?=
 =?us-ascii?Q?vpePPlA/37NGC3GDlWxNIj0qXDDChxtiObsq8+eZcshDgEgO8UdeNy4wdPT5?=
 =?us-ascii?Q?iItf5FXacPmIHb/ZoPbwAgXAMc3/PKzx1R6KGUp1zvbPSIz56LI5C6Gsc5Wp?=
 =?us-ascii?Q?DPsLu2MNBsNH0ysWFWuvutg85I8khHhb39VV1EEGtlT37bSAcMlW4iPVdORG?=
 =?us-ascii?Q?gdIiajotbpHIuQAJLp6HZBoMXnj+NWYoO/A6y1XmZemvrXsKHjIXjEoeyNqp?=
 =?us-ascii?Q?cKXRePCOlxOBDhed+V5WzIVUInrFp1/YHNoNEZCvA6xLYVYdufA6kAYS3W27?=
 =?us-ascii?Q?yFhZSZZTvLo8n+Ai+7Ag/jBE7Mh8GrhSM02o9TxTz2eWFbpsNJJv/JjWfUHf?=
 =?us-ascii?Q?nQ15K2QLWY4lgAcyEMKLBoYoNAHJwQyafRWWTDfYWfaB836vVCh3omFAT0II?=
 =?us-ascii?Q?OrROBUFYezGc4S8VmPnKGct4oRya8OwWE2Ge8gkhMFejXqqhNAr9KnVEcUg7?=
 =?us-ascii?Q?QF9+gBxvKnpQBcsA/9ZwyTvzYWGUIhThWiJ4b7GlL31ohAsZC1igiQlE3wSQ?=
 =?us-ascii?Q?GajvF28xOIZSJ0eBiesm0QoylU/Hkf4Ki27OfTUdOMTGT5G9MZNL5xPX2srI?=
 =?us-ascii?Q?LOcUnpJLdS7ij+K2xg8+tD3tEZOWinO6vkuCBjPLCE3k9yhzaaWvd9BxlLos?=
 =?us-ascii?Q?c5LMKfm4WPgnGolCwz65nBqz7OvvmnNjoncKY90xL9WFS2wfe2hgWdmSTuCr?=
 =?us-ascii?Q?C0Yk4up22ZiOzhUGnLRAAMg3EZHWUkPLsw3xjFrzoZezzjdtrZFlbzjljA3Q?=
 =?us-ascii?Q?B0vk7f3IPxVxYG7s5MBTTomCtywN5/Qwe9ESbP7HkkoAYXIW/AKoc7JXCtkh?=
 =?us-ascii?Q?PA/bU6Sx6Q89GDEUAyJKmaaAfQQAf6mlsb+VaQMKJZJ7kSkUXNpFeQ2TSoGj?=
 =?us-ascii?Q?tU3XCXOKarOHNXxJUUHEZryn1p8UYHI9pVzi0xJWiNt/NhqWOBUF7942wmhF?=
 =?us-ascii?Q?wkROfYFywY22A38JTgVAlRCP1OLNb13mMi/kIVTB69e7N62qY9Uzvzl15j8v?=
 =?us-ascii?Q?hZxbawRtJVM047swXOuhHtxUn6Q7UqFXWc4kMN2dvUJD6e+YhnXH+3aDDOIG?=
 =?us-ascii?Q?sov4sJBD+xeLPfsJ7qFtMGYmcTJVWXNU4srWrs1ZO5zmjKea1z11RW0wmCn/?=
 =?us-ascii?Q?aYlPoRRrTBslpScEQlg/QpblVbkLrW9Z4bl90DTjYkro5XY32VRY3lqy6SuB?=
 =?us-ascii?Q?A9a/resa1rx9J/ejndWW9EDKmzavjJr1uHxMuuNbPX+KQdOkVjcX0zFTuQQb?=
 =?us-ascii?Q?3bR0+6mNvkFakU1zXIuTQMtnoricY1iRu1Lky9Fp4r1jFYWGIdWCPLATVWQj?=
 =?us-ascii?Q?7A+6uFIgF7Ds+niwO262sRA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 142f8ed7-76f5-4d05-8243-08dd56062bcd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:37:46.2464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uvMtjt3YCnw1z4ZhcjCyDxkhQwoLC2p0Q2M3aqhVBPZwH3YJA9UHI8a6yz9AwKqNHlOyTkOa8bzrxO8rB9V6EAZCjaa2HlLFqqrOdD6MZNwhNUWNo8INhpT2E90+Luvt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5511

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/boards/max98357a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/max98357a.c b/sound/soc/intel/avs/boards/max98357a.c
index 6570209c1a63..c55c1d60b777 100644
--- a/sound/soc/intel/avs/boards/max98357a.c
+++ b/sound/soc/intel/avs/boards/max98357a.c
@@ -78,7 +78,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->platforms = platform;
 	dl->num_platforms = 1;
 	dl->id = 0;
-	dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;
+	dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC;
 	dl->be_hw_params_fixup = avs_max98357a_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-- 
2.43.0

