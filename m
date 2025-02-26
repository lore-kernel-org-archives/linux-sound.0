Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010045.outbound.protection.outlook.com [52.101.229.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398ED198A06
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533858; cv=fail; b=jDIyVVs1hE3xFuzJL+KFoXtOjbjcWO+5okchS8GYm01qV5uAtK/B1ubLCJLLe6HtxsjdGwFlx60f1MSrdvKOVpOkfnvyWx9vZ1jS+ndYDqhohuJFU7XSwlUnq3MhyiifhdWDHcTNHPga1/GSG0b9k5sL4UQ2el6fOWFGCjX1HAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533858; c=relaxed/simple;
	bh=arg7yTWYVvrvMvgCBAz6bQePUSKQV31N/9oQDb+Hn5Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TbF8ZFthQfXlgWWib+yseHpKlcqoBSKmfqvChnj9BfUWmbVUjLN9cghijqmBOOq0ML85wm/ot8DPHPme9Xt/tmpRhw+6EQfvfgyyqPa7ZtLvKFfp+vI/b5+AvHEUiSWB7p9CqL3v//O8d2z2EBU9FCEXZYk9GSymFdm2Wg37gYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RuIw5L3l; arc=fail smtp.client-ip=52.101.229.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RuIw5L3l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VKL4b57KIEnd9BB1kputYVccNvjWi6DPO5Uya7T2xJ5XHa89PYi51LR3NQRou7gghdLsErfkBZe5+3JrOqWKRYfcQfnS/ZstU/IOnmdV0jn9MqX1u9KNkGsvggXzbDFPdlmVH1HYbdSA0ducb3xAWIMtqx/4RuMfMQ5aJHvxZIGasEFEg9j/uqBzcCC0zszTlu57AVHyNK37fSTxA3g/9yfgNmTEEofgif2Q8A31IGy25FxbueSAsWVKKYNqOGNQRyHiw+ng6diMy2+Ksms4RKjFC1sOr7tCYcgA2lkSR2K5mCm1EsgrCnd8VcNawJM6h613xit9nAJ8URigLpOZ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8OMvCT58nZCRzNCyajMf4f6557ar/1JKi/Mv16QQer0=;
 b=CEMij+dc8vDj5Eh1//9+WpcLVXKFt6NAsmRxVU1PXVz9Tat/ibO8hfRokTUujIv1v4lXuV5RZ3p9p+6zDtdbJds239p3cZPxttxigRiukasRlC1oYTuzZ0f/JQjpzIDZpe7HjPflYq8e6pynLH/VyZ4kPFKEO9X4jTbrNa/PWxo6EVqmamwpSxX8DQAJSKPkaYK7RtIDFcwP7OIXbucJUGJyg7KQ31D+hW7ZBYorjYUk43ozlRRBoAu3WrtC9RDT0uzybraedv2hFYI5CMKbcXJhHeb0AoWS0QzR+QyiVexrqW7RQXrLfQ8FYhdB0pt+Mg+qA8fYBD1k/dVH92JRVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8OMvCT58nZCRzNCyajMf4f6557ar/1JKi/Mv16QQer0=;
 b=RuIw5L3ljFLhrHiGVPRhGuQtg/ofi1ShHF4ah4iFw0lZCSaZACKx/hLCY2KhjU2lfIZHLowA/l1kq2kHq+GCSQG2w2N6b2R3nKXsDaWStOgjFW22HFY3I1Mjs3I3U4AnH39GfB+WwRCn3li0YJh5QMJk9UJRvz55B6pWVStDCrg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSYPR01MB5511.jpnprd01.prod.outlook.com
 (2603:1096:604:87::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 01:37:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:37:35 +0000
Message-ID: <87mse9a3kx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 120/157] ASoC: intel: ssm4567: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:37:35 +0000
X-ClientProxiedBy: TY2PR0101CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSYPR01MB5511:EE_
X-MS-Office365-Filtering-Correlation-Id: d8c7a154-e787-4735-ed17-08dd56062559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2j//qGeYnlHpDu9NtahBoWY3En6tzlPCDMoawbMz94i62R/36uy084EJKaw5?=
 =?us-ascii?Q?vwP32xQlznEThukzGn74xY4ObV1qKl2Z6ljkSnhYKeEslxJL1lBiyaJyf/fk?=
 =?us-ascii?Q?7zPBwLO+3Uxf0SJv+yWbp/x2MbLWJl0YiGWTn+PcM6+Cc2RBXsR2LtqSn6ei?=
 =?us-ascii?Q?W5aRBC/CW5T7PDJQp6/wZJ0QRwgPEu+YOODm1fnk+J79a32PwlnIVcmm5VVW?=
 =?us-ascii?Q?BUZsiyDbx37w7VUqV+6p22EB1SH9yPYpokRzNkR2U931IRc9Cdce/uoXEiJJ?=
 =?us-ascii?Q?ux70d5ZcyRQv58L77S4oDtx9bhvnBR00isY9SJHWiN18X2174A1pST4WFOha?=
 =?us-ascii?Q?21t/RtiuCXV5UIQtSwfL0eYuxsJc7a6BHztBGBjfpTMwVkkS16DKTrhjb7KL?=
 =?us-ascii?Q?WxxAnz2C3EXE3gQnUnBhgWK9YYXS3NbL2TxIFMEkicsFD6ueUlb+I485ZjGU?=
 =?us-ascii?Q?G6kyNP8ePPBphef8frwuxAZ+rnUs/LnVNPxmeIMGENd/tyG2N1etzo0rsEQZ?=
 =?us-ascii?Q?bD22EBt/qSJhXPsKuML+hoIRWSbAKjmzcPAKvABh1ZtkZOBvpgcAous+nKNZ?=
 =?us-ascii?Q?H4QevnOy9TYABjg9pwAZb3IPiWAblMyLe8GU2hNOvaTmiB8LJSk6w/LHf4+y?=
 =?us-ascii?Q?0YX3XzHWb19ZAo1QyQgL07w3V5dfRrevVeG4rd+8FOcLlRCBqAiOttOJKvYu?=
 =?us-ascii?Q?2Brbs0+FVeJu9rBAjSmh6MjPZfdQTZSP8W2SY48YwPmMtlFbj9BkW616aKkm?=
 =?us-ascii?Q?GfvMNHtHR/ODLhOg5fx/Tz58AGf2cRVH/VoDlBs9WusJGrBZ0NW1OTBDqCiO?=
 =?us-ascii?Q?AuF2fq9kKLFviF+VyD4MG5EgnMg+wbeEOQD4v3aoRo8LEnvljZbYFzr0MilJ?=
 =?us-ascii?Q?z4L1aBotoFZ5KidLcaVOnBFGj8qDFCgmWuWKm/LAsz6gU0CKo4x2vcnG20SA?=
 =?us-ascii?Q?rABbfUoIWeBwyemNTV+NhIs7lIj8EBSa+A7hT/8kA5G5Rxl94VChw6Z8M52y?=
 =?us-ascii?Q?DU5xot5RyQOzgrMBioM0II4fj3jdKonGPWze2QiAHIlqShHrJd81luQUFqfO?=
 =?us-ascii?Q?3GhRIQ4bmacSrS5jkAxdX53LkP+kja7Dxq1DyF3lV2cL+jGGLUNgRZldVjJu?=
 =?us-ascii?Q?dERDL0HBJIIJ62/PtYP1xmbA5JrHnrBql7GiWTFXNLLXr5XlfcxECUXOehir?=
 =?us-ascii?Q?wut6zouJGC9x5tQJlk1MxpnBkHp8ByUa8UK4JcH8jsCQFcx+ygYFl2i7CuWS?=
 =?us-ascii?Q?kKEsLq/ewmfKA1I2Kz7vQt+8Y5lStSTGdXbXlyQA7jDwMCpmPQzwxiohCP61?=
 =?us-ascii?Q?uqUyNY0MmvK9WgBLjG+PgRKk3WzqHskmnPKsRBxOqrcY15fp5Ebu4V8pefCR?=
 =?us-ascii?Q?Z/ex1Em8fFBFG0B5jZFNBHya4GvhUUr3NmQJwZumpkX7E5QO+rIDTeiO5UPX?=
 =?us-ascii?Q?md7jqKHsLttxlzqkpk3xiULrx0OQ4P4s?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pMT/h+XoTPpIyDRuW24Dt2Y/okWDAQmxKkrs4J7BLdnhJ8QEjMrLjM1yC5dc?=
 =?us-ascii?Q?l8CYopcxI1c1MQfIy+e98ZihIbMUVD2jFfEmlle2C7wnvyUt/A8Im6/NwgNy?=
 =?us-ascii?Q?5BBu6e9EXTq/Djqg9Si+zbUXa/z67duIB2BdaSqPCwZyCyjZ3pp/spn1TH+Z?=
 =?us-ascii?Q?dTTAfBUbEEE2joBuw9gWjSqHsA0RaIibzqc4qxZK53zBJXrZD6CyK4MaWwpW?=
 =?us-ascii?Q?8MdjsONDUbRSoBXupbO38MWiwyU+yqS4UiwoJDElLQ5ugjkUa1hphMxwKQRx?=
 =?us-ascii?Q?+weGRTJi4km0bXmJrZAEqxhEgOr+cS13hOdYQHT/gcYEufWyNtrRBrALcg02?=
 =?us-ascii?Q?o2Zed3ckJmnSlWKBzUSqMqUpGOEvZ+Vls9mTxzwTx+8ReAHvFrMcVegdXvJZ?=
 =?us-ascii?Q?YHE2SGecs3TVYMnE5y7HzG2rQCMfnHZ+IskaTRR2DIJ934Ci0jcQl+U57P7T?=
 =?us-ascii?Q?CHCisnodgQQoxp6aPzvlB8YUnfJ0+LEWfbV5WSvp5ZdBCeZhbA6WkYygP0GI?=
 =?us-ascii?Q?mPGAVNSj4XFEAm129TFE68JhYxhxWA6Q2ExDRM3LiQJK9fHLb/NUaAtIsCkn?=
 =?us-ascii?Q?z1tI9GoKMSNAUe97EzZ20IcQNYr9FgUUZs45w3jNoIdXZsMOAUaACSF40+Nq?=
 =?us-ascii?Q?jPElYJdxWrolchYGBEUZipA2PRqZhQMwEB9mFJVQhLhcI7HWgv5xdEoAlBGC?=
 =?us-ascii?Q?wgZzt9Mtk4DjIlxoQKMy+g57fS/zDkhKYpCywm/N3DTJyEvaWqd2ph6HQ/8F?=
 =?us-ascii?Q?3Jiw4keyEXojnXEuYgCszM5k63UQbcHfsVnycr/MARIERoeSRDpt1DHD1BQ8?=
 =?us-ascii?Q?0cLKI/0XLwTN173iGszVt5UZJnIjQ1Kqy3FI1lC1AgIjBDucUGDAQH1s7r4m?=
 =?us-ascii?Q?te0iAbP2EN7tgVZWeRWn0BmyHbZB7p0LTWQ6NVJj/pYo86lDKiMd1K1FsZaq?=
 =?us-ascii?Q?1eg6MwF9jgV23yOcxKOQGjS8CLuH/kEzDq41awPV+15BfymfUHza0nVPItCo?=
 =?us-ascii?Q?IOag1I8t8ehBsAyrhBJzHQsGqeTiX2I9Ppo8vIA4GDouoBV+K48wJLpLTtYq?=
 =?us-ascii?Q?Ol7UcH0AVjuPXFw/Am/1Hg4DMXQ1uv46WD9FV+7Xs7aQ26NedU/r3hdoxBmG?=
 =?us-ascii?Q?IGC4pYms0IEBKfRYJOEq7YDudUTWoPOIEGCbHKIlL8Kt+Z8ueX6FMngcg25U?=
 =?us-ascii?Q?UF0FX4InFXhOs04LaUKxETM7Z96WGq7ZSgQf6cNEn5v0gJkmMsileEqGjpPq?=
 =?us-ascii?Q?n+LDQFXDaX+uh80829Y9I1Br6saZgbb46eoCbNIKzAxj2bQ/Qietn+iA5vzE?=
 =?us-ascii?Q?ZGqAHLtRxUuwiy6F/t4SvQ5YdjuRTR+mLBp7i9LbzBKYr/TLjYNVGkXWnASD?=
 =?us-ascii?Q?ySEZ/X9lQwQR1hmUA5mQyyMWzg+QEfsnz1U/gZOAaxxtkP+UHqRrbJTLmmKP?=
 =?us-ascii?Q?davsJO6kP9wy5Wx9PtbWsMGZkOVUBI09xkn2P3zh4i2Xz3aLeV3mNnnyPspv?=
 =?us-ascii?Q?76fXZn+gB9WInzOrnc0m64dXChYagTTLK1pHlwXCw/0jaBvTCrILCAO6yB6r?=
 =?us-ascii?Q?9hwsFRNa7QkzJUKvR8+eKZMCbuHfmTJdD09258xHyNwJQto0V00A6YrK64dQ?=
 =?us-ascii?Q?+wJafAuSz75+QYkpmf9fYE4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c7a154-e787-4735-ed17-08dd56062559
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:37:35.4050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Dm/5XBvJKwqpPrwRaq+UYMPwCtlnKYRUhCd9/DwdQSMQvCwuMjhxAmOpXVsuK/vupnjELo3Wjl64bgPuADFJb0xpRT2hPVvdTJNEqM6/RhGgoFK+nY/DRTS4zf6nztL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5511

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/boards/ssm4567.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index cfef00462f66..c9d89bfe7178 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -116,7 +116,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->platforms = platform;
 	dl->num_platforms = 1;
 	dl->id = 0;
-	dl->dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_CBS_CFS;
+	dl->dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_CBC_CFC;
 	dl->init = avs_ssm4567_codec_init;
 	dl->be_hw_params_fixup = avs_ssm4567_be_fixup;
 	dl->nonatomic = 1;
-- 
2.43.0

