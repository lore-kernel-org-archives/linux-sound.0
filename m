Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011025.outbound.protection.outlook.com [40.107.74.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E081149E17
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820493; cv=fail; b=sggHCbAZricXXOy5+qLAuBMu0wY8bAI1eiybkJSQ0aU4HXtAbI6HHP6iH7fdyZqJPATD8wTrtKhzCj6+tHlxc2kWaZwRa64tPUwgQ2UzBz+8yuAbPUGhFUPJR+MXevTPFJHhAxFWD/+W2nF6i02zAym42DHp/fO2VtvbnMQqedg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820493; c=relaxed/simple;
	bh=slRhLbyXR1XFxBG+UrzMCqRGnU8kQXKY819a36rAv5c=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HwzkAWv86r/X6a8ZSDnIezi7kw/AP3AiBG27SF9FKsG+eoLDn0iCGwq1CmZa8j6YbUX4vePVPdkTKqUq/bRY5d6/PPdb26Kx4k1hAiruBoN4lztouu3GclZjt/LjtWrjncm4++BaCrFYzPBDebU8k9291eHThNIlA4gZVblm2Wc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Gya2XM8b; arc=fail smtp.client-ip=40.107.74.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Gya2XM8b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=USfRrrc/GhEVZ1kzyaHDepfiU8OMLR/qzcTLhYGWvPfPCieV/PcS8qnWNiwqlAwaKQioBb0U2vGX3wKdyt/3y1WbyImOnOzjH68VF4c71ffEyBMYUrpiVlMbQvFOvIePxGKl0ODKzzd0ymwHhK06wISx1U4V285O5Nf8lJNyl+ewTJsgxBEMqY19QHhckh9GIAgdCBgwSh4Ub6B+X2Czqq2RBpRF6t+cQMPEnFQMZQmPUAA2IrF5v7JasAu4zoyqnomt1LrFgS1hwy+nkGIXSKwyqc26iz1/hTNdDBP1VpaQtxN4VaBGaYmCNFkNpMxfReBbS9LHgCUWZkNcMYU1+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kn/CqJ5fMmIq6V0mSKdYwc7vDf2CuOaHPpGGxyHqw7U=;
 b=FCNK3CVzT5KV2CFO7qUSpb12Xtf5DieyPm5Znx4OAa40VECkHBh5NILT8SGNgn3h49joKB9/2d55OnIpzBZKttvVYkSr8H71W0Qf1z8yI0JGbzhTkwcWymR+xFvFJoXvKswea66zoBOqWHVYLDJP9Gnr44QWntLNK9ZZmxuoESCrzBSBM4ocC9V3EQj98VI8r/hqxDM89F3PQ7YjT28Aou6Z4MLb/7OP+VewWqDEtJR9maWbdGVBimXTMWST3coHTUo5t1O1L0A4pDiT+0mz6XCnUVq9LppJSOuBbpDDSj7Qk//IgDfgtbRRg9ZtLaKy18DTMKIkgcSsEewKcQj0hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kn/CqJ5fMmIq6V0mSKdYwc7vDf2CuOaHPpGGxyHqw7U=;
 b=Gya2XM8bYv/jUMk84X3B1cpVCui14B4+5T6Hgfuz2mZWEqjH4pFO0p8tIsygPFnYcS19cNp7GgREnj2AIua/FLI4FcOsVe5mBK6IWxp/qWqeUPdg8a5B0mDNRPBE33FBC3CVwNKPI1L5TSGJ8ALT8le3Yg0eE860l2DpvlJNx6U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB14361.jpnprd01.prod.outlook.com
 (2603:1096:604:38b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:21:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:21:29 +0000
Message-ID: <87bjl9771z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 050/292] ASoC: codecs: cs530x: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:21:28 +0000
X-ClientProxiedBy: TYCPR01CA0142.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB14361:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e55534a-98de-4846-a91b-08de20b84236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WRhefH49bAuAkxKkEL5R8Gs/t/lvwOmxpjFxq2wZTMGCP4gW64Y0jDjV+VSD?=
 =?us-ascii?Q?770OotHtfml72gjklEwLwuaeVB6dPBj/xWw2BvneeqiHOicdmUA9boMG9wb9?=
 =?us-ascii?Q?0JwI1BzRdqtvoaYu/CJFUQqLjay+5bWq3HG392b8yzsGQL4jeUa8kAd/3QV+?=
 =?us-ascii?Q?8Du7ih49JsZwGP2SDmgwbGVV55Ttq9ZAxXmC3+eX3t9FUIzTejVDdR/j1PaW?=
 =?us-ascii?Q?MkmVPhskrGo0CjdBi25oR/IZ7sv8kCQ0ko1cuW3rafEw6DjPp8S5pawGDETP?=
 =?us-ascii?Q?vGgN8SuifTormxp/pRD6X7527iWFC8/pvuXw/ALlGnwy+7PksRt9+dxCFEJl?=
 =?us-ascii?Q?/iD+NSQgA949wkZconFLvPHxyIKE9t2jJDLBGAqaZmlM/3vUtcTKejmKusOX?=
 =?us-ascii?Q?CappuqLoKj2F/Mp2CWCrA/SwOx1ftXy4pkeBk8+8/DjnSHCyEamIq+/7MVcD?=
 =?us-ascii?Q?ytP9Dq3/hYdGCnRa0GhV5b/Wv6VkjCNhg56KTttYzy0NCGrr02VL2a2ElFcN?=
 =?us-ascii?Q?AmCuFENUIFXq24NQfGhkeFFHKft8TCgu8XS3WFhHzfMoWjHJtADKUrtabndZ?=
 =?us-ascii?Q?yfUOYNd8ZEarwWhBV3uD0e4ySMnog/0CQe0AfDYNEQKvvqI8sE3lJIrf6Ny6?=
 =?us-ascii?Q?35/NdGI1wueRjfqM4y09T4k/FiJES+tkQjVl74uEv0sVZDptSWekqI2eRx9E?=
 =?us-ascii?Q?X0Ivkc/ViBlw3bqSpxGhC5ihvnYavbsulQLvlueltS286Bv8L3kovpp6Y2wQ?=
 =?us-ascii?Q?X/1TXm2B9THbmgUVWiI44Rtjmhf6b9LUj7sXtdHbEvoDRlxfran0Mh05UHNV?=
 =?us-ascii?Q?no7kj5U5AmzrbQTCWGIXcgT2jB7RNWYtvG1c4iqodGmSdsw/hl+bkhWapk+L?=
 =?us-ascii?Q?Na1HKWJ77z2lfXDyBSTo1PS4nAQP0VU2PRWrwZ0asHT/b/TnFFftZsHLO/KE?=
 =?us-ascii?Q?OKTiHLyG6EoL2QsR6a4ZgcIp9KUVDkd1xj2NOlwNfBR06MN04oXSrxH1H68K?=
 =?us-ascii?Q?Al/c8jJYOE+VNshl9ACXGpbkcF8fMeYBXAxvqfxH6BCKFIOk2veVqPpGqf0d?=
 =?us-ascii?Q?RHn1xd0tXWHKbwayw1v5GrNhoOz2pCm96IAWIbw/HHnXOWCHIdJYfUtNyueX?=
 =?us-ascii?Q?a35Rl9XUUuk2tgwCFWuhrs6Qdl/bjFgMNdZritPdAvXx/IbZd9OPUYYmO4mQ?=
 =?us-ascii?Q?pq71sg4O0TsU0CS3AwS4ADpgLF755hkCQIvKfmioNxSK7v1mkL4vGPCcQx8j?=
 =?us-ascii?Q?nOHYoygNCqRWes0f/qS6LsG04nCLoE+wuA5DGoavj4h3/Nd2iOX7BcDNm3ih?=
 =?us-ascii?Q?WX67gTV3rpO76TyNRNT70dktq6ewQXydMzY+3hhEKlLFHgnu4jw1L3rwnN0K?=
 =?us-ascii?Q?z7gWRREVS4QImzszXWo9c0rdPPHC4NrEEX0/QFvcF5zqF+QGKZoKeS35bGBm?=
 =?us-ascii?Q?eSJGS+Mnjno/QjRlHvGlC6yJrbvaYxJFinZ1aMbOPgyCNgwcXerYfCcDJazb?=
 =?us-ascii?Q?0N7vllhrcDkJkf2LjCiBAEzC8u0GxPpKfm81?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VXW2T2+GtW8A0mKwcjPf8xFN3nnUbWL5NMIZaNKlHw/IJGky8X6SmDeMtytI?=
 =?us-ascii?Q?eyFtLwvxxaIKBU9SGQ32pbbMdhLlOoQiNWWC/dyMqQJWmfTsE9HKGFidg/VE?=
 =?us-ascii?Q?ffXQJILbZXKoBQU0P6a/l/hQ2QqELOXrOjKdU5RPAb10oQwvpwqVA4q2Eg88?=
 =?us-ascii?Q?uLlzkBFl32dhC4CFQyPaGq/f2HOaI0ygrctmi2v1fPH18E5gtAz2hMl+o1E1?=
 =?us-ascii?Q?Xx5kFiRaZOEFGReEygsQOMpw3ndFqW/e0054LY71EPbbwSH1D4WuginupGEc?=
 =?us-ascii?Q?dukT1pOuKrIlqU4qbdTmaAYJx2w05QJ/C66nZMX0fr6HVNziVNG5aCb2wtcm?=
 =?us-ascii?Q?LzyQzeLsvwSlkPKpH/rKcPKu+7myJ4/v8UBssNPXQBtzRV1N4JwmbeksIoym?=
 =?us-ascii?Q?eEtpxfW1Cj/M2j013iaRUh1boFTQmnESiKP5UKaenTQDV5U9rU9kBDu5IKNs?=
 =?us-ascii?Q?sGnOqREnSe+Br4v72OskFsXN7Vyf6wee/0UX6d6pE42v5fqJjWz0F2btazvV?=
 =?us-ascii?Q?+z7RED7Hy8QZ7CQ934qQ7TZC9fMGsZyqUtncIjZfVDvKg0bXw3yO1ybM2d5S?=
 =?us-ascii?Q?5KbkMDf9TNBR3bsI294227CqwJaSf0DmFWjnRrad2tanjKtdwZVc6Ulm7+pp?=
 =?us-ascii?Q?c8V4ogBLLpRuscTYwin5ShiR817VQDR5+xOGwBcl58xH/k75yiSsA/Vmtcji?=
 =?us-ascii?Q?ccwYfFcpHohJ0OgOFscdeJQTkx/FeC6iPRyuYp4h56AYHtGMc5F6AnP2jVLv?=
 =?us-ascii?Q?0qc/oozZsy/Ul+sYOdl5FJDjYVjVIxIMna1RxV0R+jASUPw7XToyC4bFmhV1?=
 =?us-ascii?Q?ca/IvghVMG23tTvbqzQtfAkIgRQGBqGd3dvl6fDxveH4saOB3q3XbjILUMIn?=
 =?us-ascii?Q?fIRMMB6EjnmoRVTvGY5L8M2L6/ttebpZ3IlEbvRxuJKIJ0sOIpCHP9cXrVid?=
 =?us-ascii?Q?4yv4OdwjLiLmMx+AdZ0MfBtlurYW54uGvjs83wLIlUd3Ura0eFVrnDMX0TSn?=
 =?us-ascii?Q?6VzTmpFnOoOBmKZs4ZnDqcDTjsXKsoi+NV5Slefa4DfXmBuMIyyc8/aRddGl?=
 =?us-ascii?Q?VeWdhKU3jhfvCHQxzH05mHitpZ+DO1hX2wMRQZNqv81UPuSd6TbLp8f2sqNb?=
 =?us-ascii?Q?4j13d6egR2S9kUoaUpy/59wTt1UBG9CulEYw82Geypg/8o1lYcgTQmwHS2sB?=
 =?us-ascii?Q?rz7xZcl1IWm+7P4276sEYbD9Ujc3/qnKZZRXqLJZjTP7wk569I1nbkUHb8MZ?=
 =?us-ascii?Q?qADiAaoQncopCrLY17xU8Yk3P1EkvOgJ7ePY4WHYYINbcgTHkd1N0ZVVnSyM?=
 =?us-ascii?Q?zj7xpf9BIIb5io+9fNUC9BVteqM9LKx9AurD/CJh3+u4l0YEYU+dbOiBPOgj?=
 =?us-ascii?Q?wn+Ht2cA04s5G8sWgkORsFWJRtO1nC8VitOUf/ERqLpObriyfdL2e/ikIeYM?=
 =?us-ascii?Q?pDh9nTwaqmIyUeEJKNYWXjXhM+xpLqfDpwggqrP0chrOBdvv/S4yS2xcqzHZ?=
 =?us-ascii?Q?wIdHdMPG3HT1jnsT7Y+pYwaLKrz29KME8KWZ/tCw4yqfmsemUlTGKZWusdVg?=
 =?us-ascii?Q?5L+wxs5HBKllo2yOnBt/ugQaRhzlsg2cJoZitM+AMl+8fUOY2eHIOClx1BUs?=
 =?us-ascii?Q?4iee66QgWf7hjWhV8cN476Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e55534a-98de-4846-a91b-08de20b84236
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:21:29.1751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VVQNlyqOOBZuonLRYltsU3udYGsRyExmJEkn8z/MZQBbjjYFXVvkGV4bDyTs8eUHO4eMOKKV7VzXSSQC7xO4drfT++LGqpHJGlR97bnO1qJJIyqOUNwgCYsLbU3dNrDk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14361

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs530x.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs530x.c b/sound/soc/codecs/cs530x.c
index f8f409d0b0350..18b5ff75feec4 100644
--- a/sound/soc/codecs/cs530x.c
+++ b/sound/soc/codecs/cs530x.c
@@ -131,7 +131,7 @@ static int cs530x_put_volsw_vu(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct cs530x_priv *cs530x = snd_soc_component_get_drvdata(component);
 	struct regmap *regmap = cs530x->regmap;
 	int ret;
@@ -522,7 +522,7 @@ static const struct snd_soc_dapm_route adc_ch5_8_routes[] = {
 
 static void cs530x_add_12_adc_widgets(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	snd_soc_add_component_controls(component,
 				       cs530x_in_1_to_2_controls,
@@ -537,7 +537,7 @@ static void cs530x_add_12_adc_widgets(struct snd_soc_component *component)
 
 static void cs530x_add_34_adc_widgets(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	snd_soc_add_component_controls(component,
 				       cs530x_in_3_to_4_controls,
@@ -669,7 +669,7 @@ static const struct snd_soc_dapm_route dac_ch5_8_routes[] = {
 
 static void cs530x_add_12_dac_widgets(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	snd_soc_add_component_controls(component,
 				       cs530x_out_1_to_2_controls,
@@ -684,7 +684,7 @@ static void cs530x_add_12_dac_widgets(struct snd_soc_component *component)
 
 static void cs530x_add_34_dac_widgets(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	snd_soc_add_component_controls(component,
 				       cs530x_out_3_to_4_controls,
@@ -1007,7 +1007,7 @@ static int cs530x_set_pll(struct snd_soc_component *component, int pll_id,
 static int cs530x_component_probe(struct snd_soc_component *component)
 {
 	struct cs530x_priv *cs530x = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int num_widgets;
 
 	snd_soc_dapm_new_controls(dapm, cs530x_gen_dapm_widgets,
-- 
2.43.0

