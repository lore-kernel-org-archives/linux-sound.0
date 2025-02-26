Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011058.outbound.protection.outlook.com [40.107.74.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F4719994F
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533951; cv=fail; b=ozDbdy3EQc6LZr2RwGQkacIyAxa8ElnURqKvfCxtkY0FPv/i+MQpMv1n9qRRWP5IZrowQUOtozuWGhqDo498kJob659VmnxWONgEcnb7eg+Cxat+IYgSBBwyElaKNmHjsB+O+7noukYj3XVW+ZK+/nddhOjAQih7899N9A9QtO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533951; c=relaxed/simple;
	bh=kQOHN+ZU+G4HpqbGw8pLY4rFnp8b+mLz+ClFN9dMlcs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RR9dR+IZNj80FUfu5FIUN2V53QeDevKQnNbdsviueYmfqvq/INGnyKVzoGx/dOVEjWYrvhXHwWcGxIKm8Dsm6oUDyloHSs+lNeAgMaPp6+VdF17iWEKFWaINp28Ihx45iKq8e0+TTMEV8TXf7+6J7xwvZ5rKQ8YVFSEVpz1RTYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=lSXsHufG; arc=fail smtp.client-ip=40.107.74.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lSXsHufG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d2HgjQtVc4sowKlv88gRp3bWKPYL81FiJ9KqGQYHUUTooCPNloPwbAxZmkZBya9A/gdkWruhCjS5SLjJM8YqTxX0Z+WqYyg/hZxeDF51rarKskGCJ8XcUr8Odmsg3wXQfDb7pgD1R4FWEiiXzaAY/oFtY7mNAWef2hifq0/kdW/XPszQTAT7fyhwmfrYCNA68SoJYIcnReUUbSWCEmj1/FrMxBL5YSRKj6IdSPy/Ar4BspN9LnsQXefyV7IXh0WLOzYjueKR+mVK6jxeR8bRA583DQ4rbZpFkqaVPDMciv4x1tKtZm3sEONGVVhPy1dgBxR6w+ZJurlR8V06amE9Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VgQoTqKJHB5MhNj3f0brzaTyjdkMo4fBpDmmK6t7XM=;
 b=LpwXuq5xbvTouN1SLDMPXK/Z7RJpbYqNvLUPO2JzXhldKGZo5CrYyd8jE9e30BYm+eE58mEDBY54cVba0HoxBuqzs1w0otn9rmKzzEwZAkhORQ2HQjmKcN7yk5XaTYl+b7RAP9rFZGPWb11PBOlCetIYY3F9dC2w1l67zBrzXrDKQOxCfo4/RtxLN+Hkb4i/UpfoQ/t8mFbmpDb9tLCBKgteUHdZY1l7fFXh+rXtP/WDbAVtleWlstiuxsUzgoF7QBCiUd28Ywt5ySf9vxJnhDrrKsONim2cU1nx0GSrPMFIsHaTigK0elgjXDDM5Sf8SogdcXkeWNat3S8HZoXUaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VgQoTqKJHB5MhNj3f0brzaTyjdkMo4fBpDmmK6t7XM=;
 b=lSXsHufGcmzic4oqpxCIr3Csvu8DwsOkbiK/t+a0nRCLSnGZDnG5NjqvpJSB3Tbt3bx3R9nXbSX6i2aoiC43qWJtGRCOLZ5mqPNF/RERVTf6L2NSS7LeCYlPwtctCQpaGke4JQ1YptGHw54F3JzZt6r9gJL4PZI8wUjgn9+J7Gg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8140.jpnprd01.prod.outlook.com
 (2603:1096:604:1a5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:39:08 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:39:08 +0000
Message-ID: <87mse98oxv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 145/157] ASoC: mediatek: mt8183-da7219-max98357: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:39:08 +0000
X-ClientProxiedBy: TYCP286CA0174.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: b993c94b-f887-41db-6517-08dd56065d05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XQ1+FQfr85CFOrjRsYnzwSM7g0Y7W1R9W3kBllC1p6qSrVrQWNNZXTPliBsL?=
 =?us-ascii?Q?THnq1syg//91NmDP3FaXOYwVLw07STVtPZ8YghEq7j6EOJfLDR4oO83kywT7?=
 =?us-ascii?Q?vjkifTy2Cjq7fmIzf0YJq8qexrSTcSuxG7Ug96uCkQ0Puy3mDJMsXnkGe+Xn?=
 =?us-ascii?Q?Lr97PGE5BjqiRpSVwWRhLAW1BYRq2i0ftDJS81B/oMKIG3/e9l+jgX4wt73o?=
 =?us-ascii?Q?/xOhtQ6pOuopi7oigUWH1vt8KB6AOBY6YsY4Vlt7x/vHb/NDpLcTO/uKjc0B?=
 =?us-ascii?Q?/eJNc1trhJUhimvL+Qi1rWTJc8jLN+if2rAeNKbZl7dI6jSJsV8ci2FNHTBN?=
 =?us-ascii?Q?son0J0PRbLt5tncICWzrHe35ZfXR8UM6TnqG4EQI1WLTyHxDOM6E4Y9ki9MP?=
 =?us-ascii?Q?0FhkS1jFMnfLbTc8xMrGWYE+wShUcetBprigh1LSuw5VcbGdVsgMQd1Acfso?=
 =?us-ascii?Q?jTaSweHndv8YZg7qZaV3QQsUIyXAM4Mu18fKiuJBBYXxxbix4KSpycgxcTuB?=
 =?us-ascii?Q?tDlxaJToT3/pkPFyhwivUWfPMjMbLBE5iZKdfT+tcwjO8yIiJEj5ltyZ2ZiS?=
 =?us-ascii?Q?vv/xcZ0fig3b2MQNKaq1OD/sswE7Z7tHhNNO6VOcLZ6yiWewNyw7/uP7Djbe?=
 =?us-ascii?Q?8vwO/8765v2hJM/AjnTV2j16tiqTXOaqjUBUieUKqZ8HVJOalbL/ZLuYgONN?=
 =?us-ascii?Q?OLelQ5N7kcwPN999ZWCezTbTvWqSu7dXvseHdBut6xgJTDvxQqw5gHgR5uIw?=
 =?us-ascii?Q?V1dK1LG9ZZVie+i1oWR9rmBhnEicPE+8gFAuAzhNu+7lYJ6olNcxTY73S0ph?=
 =?us-ascii?Q?254S/t1T4E2n8tQYTTpW4k6apZrfeLKcsEwbdsHnebs7m/yy9p8Bdkrdw6LR?=
 =?us-ascii?Q?dIcDx+fRA5LgBhM0B6JynImgxuJOYiXerSLbg2lHlCnUXeS3NKo3s7FnoaW2?=
 =?us-ascii?Q?7G46659JJk5gzHXJEr3FV38VgMHpVqcY1mjzXfMcG1MIXQLsq8GnoBjpkkaJ?=
 =?us-ascii?Q?6dR+5aFJP7wOiySjT+9p/bVKWGGU713/cid3EUCSuJTP3f6axO/6NZ1H6/bC?=
 =?us-ascii?Q?8l9ZLrnvESgCNe1izLRlD1ZFHbJfA1Fh7cjCX8yR2TBhxg7FToH9UNxo1bPR?=
 =?us-ascii?Q?MJHKvf9Ypo5dfu6DHoKBt0IsJsqkZLb+F8VCg+yAN2ewlG3DtfJNy/ZxI8zl?=
 =?us-ascii?Q?+ZtSW/klfrddKshQXdD3kc1QXhsmBvrVhDY+hw02ObvV+AsOFApPNIKSXm+0?=
 =?us-ascii?Q?Dx3BfZD1APveYSKiRvFzhTgkj1UuxA5AkXKxBQMIU+jH+2zzWxyQH8ZaRL/3?=
 =?us-ascii?Q?6FkMMU1bx8irizKOE3Anv1cVmG0qy2Fg9dq6Cmbtt1OL+zyDueFfi07+GBAP?=
 =?us-ascii?Q?MXwPSs7YAMVSror6L431ZlVImb0JairnYAdt4o3G/drdxeETcvx8WW1FmXL8?=
 =?us-ascii?Q?kXJjIwBVcl7fmVNJCyniEbVBDpbDpnyN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6ic2wyyq4jMwD96qVMi5oZYJaSMsGBK62ko5PI2I8pO1BDUXqaRwLfPRZKuT?=
 =?us-ascii?Q?sbvsbPxhL/h/DLyUV88NkKRbDLPqqXvTP1N4w7G4GrYTyhLDuAk+u8H25CqK?=
 =?us-ascii?Q?U6LZhxqkQ67x5kzdi3x2AqdONB7P7ZT5+KA8lg8B7JWiSf4goZMu0PqFm2a7?=
 =?us-ascii?Q?2+zxKR8vNsspTJbe77AnSXM9A0h2MpgHBOvx+CiuLUaJKOsvnmwBhw2DIJrm?=
 =?us-ascii?Q?5zvtB6Tg7QzfTn+kBwdOYem5qNQMLIQt59pTgdnWO21VmiKhH+sErJ30WW9D?=
 =?us-ascii?Q?RIPY2nrqntSWt8FPPVf8XJcXJhrQWM3r4UwI1KCCa7i6hOoevG1+BdWJr+CQ?=
 =?us-ascii?Q?TH9rSIEVxyRS9PLiuEukenDcwc6lQv6w3YlbmLWzLccRA6C2F1JidYa9JIHs?=
 =?us-ascii?Q?X4M5lExArYmejeov73CCAJiRe45ZJ+EINkSrRP4kkWCoGQzgwCRbsDrzEt7w?=
 =?us-ascii?Q?LugQKysrf09RPdUMWg4HovNnNfehNrtNmC3SKKmLy4DrvbUMrL5eRydquYUg?=
 =?us-ascii?Q?qfhntjG99NYA63LG+UpWEIVlVPg+hjh9KURylwgzcYikyrB12gL+/eyawBO2?=
 =?us-ascii?Q?80B/u0KTnA2m/k9xb2STXmCBYiIlY38vBXuCSfUnirEJU2Bu9MxH6/I67KK1?=
 =?us-ascii?Q?RxRknpxpBCD2PjGB2+uq9E9sfbZ3NiXB2tQDMCFdoWxSSm15U59j76+srfBV?=
 =?us-ascii?Q?UhUBC/ZpAdw9qA4xsqzGqaeswMod7P4Q5DkNGNxELMixJ/fmP5zHN7uXB8qq?=
 =?us-ascii?Q?L8cSTNdg4jw57iPjA/KO+EhYJi58bk6DyFyQH2/BX9GSZ3Q1e6oNHmLethid?=
 =?us-ascii?Q?wtJZLXyPuheW1d+h7xQ3zPNdocRj1EKqlCdAPFk3w4jqVOUyJEBZiVtHl9ju?=
 =?us-ascii?Q?gfjxxuoYUxBQdlQXZN1tTCMw0ZUpUmL2sPEryggozl4SxZC5IeoqJ5sEzl3k?=
 =?us-ascii?Q?U0n3Pn8/cuKzp3Pq7bDNflH+syK89aJkAbogmsGG3D2kWfB6+eIOYJtsgc5R?=
 =?us-ascii?Q?duoxN621a+3tu7sQI90YesB75ePJvl5KqsWAyUCHp8H83kTVh1StY/eiSUaL?=
 =?us-ascii?Q?sy7BkoYMheYWri9F6NiYnMkqf+658+30wn1FwWaIoXP+8g6ipojAqwBmoUdK?=
 =?us-ascii?Q?9s1zcAT3AbuSKTV8ea/MqNMX84+2mPip2Rn0wra5oYciMufSxSZBqMI00jDo?=
 =?us-ascii?Q?Syq6+C2wIssbFz/NqSVlJ55YtWXfx+5RSvcsdX55T1lLJhsKKXRHx7Yxc/9+?=
 =?us-ascii?Q?GbyB6dKXTUrSerb9uyJ70VfS7iT8uayNYJxIXgGnNcsARWpYSs3lCcvOgu8U?=
 =?us-ascii?Q?6k46EyqYJk5pImo9nVaooxO/FAjGu//XPULIRr6uy2lIdDfQoR8XhZ4FL+id?=
 =?us-ascii?Q?T2HQx98Tgw7ssinprvfNQC4uFuwAbUAOmvUiopmP40OG9p2BjW17q6f/Kzdr?=
 =?us-ascii?Q?d4iNYTgsoPU6X2matz5myoGole6unMWv6n5NwvnvYGJfK1EvuidYv4MyqGAh?=
 =?us-ascii?Q?yYcQ6TaIZ9UvWFz2Lir+zG12Alrr+Bmv552xvJJ+s6nysxMpo3opndQlSWOf?=
 =?us-ascii?Q?hrUEV2PiqvMiNbd+egjPGxoQOSrwFwYWx5ZwtLOIJ+8jUnTLokhLmdlLowCQ?=
 =?us-ascii?Q?/8vgYdgMkYwLsegYSNNzFDk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b993c94b-f887-41db-6517-08dd56065d05
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:39:08.8060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aw3k9UUsxaOs4Fct+1Nqh/efUnPYlyPWYG6S6tshzUJ0pFVEYU1T9hABSjVD6bCRAjctvFY/mak5PZ46pTPApsR1hgQkAzNaPsfflBgNPPc7swJjmW5A3xFtbag/IkIa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8140

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 1d8881e0a361..3388e076ccc9 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -563,7 +563,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_IB_IF |
-			   SND_SOC_DAIFMT_CBM_CFM,
+			   SND_SOC_DAIFMT_CBP_CFP,
 		.playback_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
-- 
2.43.0

