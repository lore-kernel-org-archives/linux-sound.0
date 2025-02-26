Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011019.outbound.protection.outlook.com [40.107.74.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8096B19E999
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533850; cv=fail; b=kTB++cdlPxRERAv5/0lE7hrgfB1DAGRCOrueOl59XwNRtGJEegjAko5Iia/LUkaZ9JSYqh+cp2zVIPWS8T8AcuBxPD8hgMwQgGTAiEy0U5Ywni65Trw5z7Y7PiYJAILCYd7b8XqD+zlVXsFwcaN/x9IU5AcveeYNTBgwfoMxndg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533850; c=relaxed/simple;
	bh=tkF/m4PnhMIAXzDQPJEcsCNBX7O0qMuIhIYEqWRzeJQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RtbfcJWOExDJHe4dV9BOGu/1g1eBzxaKSaSvLpF5501ADuTYTIi+mQBqZqxpoq6NY6x1OSbCiOrtLIEYvv/TuRiX+W2jqGc2jWKmGANFisbOYOOUSlrmv8+7zh8r/sNQ68xus2RXcLaJOZa0NOxsPn67cE5G+9Qrj3+2x7b8+IA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=X7IztPAc; arc=fail smtp.client-ip=40.107.74.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="X7IztPAc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C1jjZudXS6NSHvm5+2amW0JsV25+yszRYXgbYCZq7As2Ovay/wYitYyfNSWa4O2B0G5Pm+1IHNKJN8wOZg8Tyx7forT+VjdoJVmmBH/jQYQ6nCeCR3uO4W9R7PUNnEkg76smivxpwTdeKGxIL4o36/BgnxC2hFq+D6cr16CcPUWKBsTHDqXOHtenge+dqMSlds5gjFFR3ZUx3pofnKVV683yk/hLJhGQMkP/1UYrSmOihKA9BYD2nCTo1UUX4YPBLKxQT0yNLAGNqDq6oNWohDJOfD5AwyfNfXR1sUCC3dVXmyOAgSCShBkhRhEOvsBLUnTUPfazNPuC189+Ov40og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIahtb4cCgUNGQjH5YPa5T5iimr4oDteVXufgRsv0CE=;
 b=pkBRnhxmPO2DimUm/40rhOWT7gEEAf6FRd0JazLYcr/tdqSvUgFS5u7m6aMQgJ9F3YJTolQgKt/RvAqMWdfLKaGssEnu3mRCTGLOs77fsPCLvZyqmL7Kabfz/iDMGEidsrzV55W6WWg+/q209AibsxPgGDN/UH9DG62vRmTnoFCsZRUbSwHAvMUPa21YrYs9gXYUti8GfSYl/lPINYI4b1zpP/LPnpVXMyMMd4kPR+4cGjpE8ukW7/PfQjrnfA5jZkspj9n85QSqvk8O7BUQqY8pW37XrsKPWSEiKNGUUOUy3hyZ9p17sdbb7pAbnQoxcrh7FXuMRkXaZ8FbmEJCBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIahtb4cCgUNGQjH5YPa5T5iimr4oDteVXufgRsv0CE=;
 b=X7IztPAcYLGIoxTTTdZ1/W0Ox5td3uW73Cnj0AJmE2xO73DPf1HUiz9A9DYU3hyjwKfxhJRRcnZ9L+rlUKIv7/GEkrJc8Qhst3qhoNyLmf5Z9OVIILZVq7p9W+GRaEQ0bqsIKrAhgo/BWZ3WnSDp4PvqR3aBh7+9wgoPgkTTQSM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSYPR01MB5511.jpnprd01.prod.outlook.com
 (2603:1096:604:87::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 01:37:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:37:27 +0000
Message-ID: <87plj5a3l4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 118/157] ASoC: intel: rt5514: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:37:27 +0000
X-ClientProxiedBy: TYCP286CA0354.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSYPR01MB5511:EE_
X-MS-Office365-Filtering-Correlation-Id: 28331c84-0311-41ff-d371-08dd560620b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4KCf/ZNKeIh3U5Bb6a6xWJxFENsOaxptAyCpAnFKH+tsWKEDEWvLipnpBHU+?=
 =?us-ascii?Q?21hFyt+zoUCcAAOoDAvgukdaZyN+OdHRensLuflICiRJGmu3MUaSNEtjxVFb?=
 =?us-ascii?Q?Ua4i0FOnAWBjZ7EjhHMh0AvdUCfFuwvzPtnVtTY90ESNI/L0b/MJLiYs2wJR?=
 =?us-ascii?Q?bOBbIED3Sevo5sPGoQPJulL8nC0dTKSLMySvzzMR+ZhlZEepdewJkeULt+0T?=
 =?us-ascii?Q?IYccdymduRU+I1tgEmWldH3gu7M40jMikch/2qxDwffrs5U9Oe//Cf7Mn8bt?=
 =?us-ascii?Q?fGr4TmXirPHBSQJ2vzmh4/tWNqhqFnVqQPZQb8G8lj+uSYsJOZcW3eR1aVFk?=
 =?us-ascii?Q?xtOFvOWk1qfKp5ErsvZ6ZO84hhH/tMalFJgm1h6D/f8m3Grg2CPVEj2F9JWq?=
 =?us-ascii?Q?Nno42u5+9E5JM2hFPeWh10NKggRAk3ccKpuDmfKtacUCpwd5I54WW9uNhKWT?=
 =?us-ascii?Q?ORM//+oSRX4uqJ2P/7Uq5BJf3koc2r0Ypxiy0VeRngEdPQNRZOrijtnmo5hK?=
 =?us-ascii?Q?ldgPZPlvvxaDVKBnRLYLTWUPEtez/4MfJjCO8VZlgA072kpBE/zVgSQ0f2Wo?=
 =?us-ascii?Q?+DmopYhyGiQqwYZGZyxG0F4cOWfWzYFVFf/Uzmuicv6cBRRB70RV2hLJxzQj?=
 =?us-ascii?Q?eo5uowCesSmnG8R2xCG20SV3zZKMUIMJKiH1/j2/HMWpHlUt9zDQ1y7sQEeq?=
 =?us-ascii?Q?khJ7yiJ8ABwMOWT7PbIgqMsUdmc0Z7wQ48sj7oKCDqfj2J6aC2kMyo3y/o5c?=
 =?us-ascii?Q?YWlBhjYsaSxdbcODzknktlQPG/S15sgjzY/OCvEJ+mknxHyEjxBsR1m9DFjK?=
 =?us-ascii?Q?ZE8m93IvyX/8V+slEDyvJMjBibVxvBYG6BqODsJrMBaeno800JUSguVkgJD6?=
 =?us-ascii?Q?VYZUudP30unGSoOXzYcRFracOgVxHjc3ztmZ2EsFdNneQgx7K/bvhwPBXzXp?=
 =?us-ascii?Q?iPis0/yDf+fOfAJCzcv2i62SePko99VAf+KFS4p9NE5H8xSC6fK9SZdU3/nr?=
 =?us-ascii?Q?Cj5Aj0eSsAMUd/zT58Ymo1U1VU/YOS7Y2gV7bXgCAlOUlEft3ITSo0sufp/h?=
 =?us-ascii?Q?ayora2/cwBUodM3PRnaqDM2TlM0+H/GfeCzDv+0aP8vS5wcLb0p4KFrWzyH8?=
 =?us-ascii?Q?ye9sl/NeVe0DZvWBUgIVOVpfHRfqa5jRbULCDlYzMv3P29S+6HmYjuDFxzSo?=
 =?us-ascii?Q?stKKt4xotE1TyDbAtyd/BR06AfBXAKtLW59/+TRSohkQaI/fFcTIO4/NXHEN?=
 =?us-ascii?Q?BXOD/50ifDbFWj3pVRpQb2r5ln/YwedX54Dsi7EDWtBJxYoacJ38WRnyFRm+?=
 =?us-ascii?Q?5GhuY/rYWaQTditEaKjBWCLDQ4qfLHb94fzu7g+gQN5KlTXIN5CAioqcrBya?=
 =?us-ascii?Q?khe7+Vkus8MFcuu8S005GciVyrCkmbyIggJSop6xNXNzv30ZjE53x9IVQla+?=
 =?us-ascii?Q?0XL3UUkYyOmzoT7heQjYYXDGvrfxT9V/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?anieqvad23JVuedhnKCiW4Btj0SbMbVhlskhp+a30BE+h6VbOjQO1HV7Ozgo?=
 =?us-ascii?Q?tmC6q1vijVm9Bhsq+z7K9eEyOIQcLU+g1HwyRhEIcQzcyqy7go0qLokrNwZE?=
 =?us-ascii?Q?2tKFr5v7MlUamEDVbHpiL2/0FsbL0dCbnezMshngil9n/VVmN1Ir/mj/gHhn?=
 =?us-ascii?Q?bKx7W7JvNvwRPYYpRPdOaYVwEKep3zsWq9MmQkx3UhPVuCj8Nafmrc7LRANB?=
 =?us-ascii?Q?Dq6BH/WX8tSG5t61T/FkGEgFOAP7BZ5/rBAHxGPjFOmG4uS5wRlv9w1h0fd1?=
 =?us-ascii?Q?pIfAcbzod0OWQEUXWFI557sVF/8cPcRehk85aPi2lqAw+y2uaajtVstTq8/e?=
 =?us-ascii?Q?vJIR3wL0+9vgscXWEV14yw1YCrG6HL9BUs3VtYMFtDT+Ox/fMyLIj+1GjVeG?=
 =?us-ascii?Q?0z9etvYLXCMUkZS8BNkbfLbBVDLVXTbmrXP2VVfY4z2tSxRqkiF0MrxlKGI+?=
 =?us-ascii?Q?Gxqz9wjRHISWsG5OwSZpK0+Op/+llBJWXZK3Y9Qu+Cc+9zEEvF8MhSeWW4uK?=
 =?us-ascii?Q?nbmUwzt7oPbCscI7bnP4KPQFRB2DZyhwn++Fs3krxaeyIAWWpda0rfzJrmUa?=
 =?us-ascii?Q?7OYZaXzok2tBwQ6bcDSZZrOtXZmfyt+Evt5EAdQu1lMkFOX/o9pwYdTqAztS?=
 =?us-ascii?Q?et4Kmh9OJ+iJ8BkwDSdqoZtLnJFMSYHYkEPdnT14/jAsvbNl17Ei0QQ1ka2l?=
 =?us-ascii?Q?vkROEquHwvxRP8aE/rdoMA5A1rc2SvRTodRhEOy2/Kz8sBsnGAme2Ev/fYKk?=
 =?us-ascii?Q?r0kTyEbIsiLTO3MIaBuKBasrVXbosa1Na7s/f33XWvjbnM1wAxz39HPx7m7x?=
 =?us-ascii?Q?4Zmf8BDqFtLNw+qLmvl44UW3Y2/c+lDuaKICK1CpGcj+EsMj78YciSFUfnse?=
 =?us-ascii?Q?ckLLlFPa+jmqTy0L6hjEJHzjlNaSYKGHKne9HRxfTQU3GL9CiPeEUUgKXL4s?=
 =?us-ascii?Q?Aa0wmVnd9lp0x4HaQgUkyQ8XllKCNurDA6pIDfCIytGHwwHUjm9EmPXlQc98?=
 =?us-ascii?Q?OqVjdvUUHI/bAUcu6FtAxrtrdWL3HucG42EZztUKQt0rYMKJGdue9J3O+Ofe?=
 =?us-ascii?Q?RXj2A2/qP4uuHw+XrnSuXA7o82U+YUbuLAp/fFTX3+Z8Bq9dM2GxEFfTTnOT?=
 =?us-ascii?Q?L0ZTMcH/jXU7h8dg7wuareJGQVZT9teHf7SNB58YfyjYeMOm6WQ67th/O0Bd?=
 =?us-ascii?Q?YGAKG9wCJYZWQiTuD1pb01aeIe/nkVtVd+McD1INB71mzX2yF7RxtdCd+KuW?=
 =?us-ascii?Q?damiYsHhzt2iu/8miRiqbA5lhyBYTgnM4sOXGHRt04ma2wCenKwT5rWKEpPw?=
 =?us-ascii?Q?7uKPFUunraeRuYxlNIp9M6wiR6GFIAckxzoyd74gBwYxZaDL9ZhXg7oq1OK1?=
 =?us-ascii?Q?g1YIzVY059F7grD0mu3P4BfRSEskH8B/olsQ9xxXQc2pkXjIWtPXjSv+GMIS?=
 =?us-ascii?Q?8e77JAUqXacFPMZfuvMCmN8CoiVaJkKwbF4qsjX7d/2BPFmgTAOxvUHI2fHq?=
 =?us-ascii?Q?+Qn3CfsRckczAfAmJwbHVu3r/rR7v8Lc7aYAV+Z5tRZOduBcISJgYXcK3oMM?=
 =?us-ascii?Q?M3M/RZLW0PV/6k0ihhFyLk/fr+3ohz89UoYfcNa8KdK03a7PKkrbCqaukXk2?=
 =?us-ascii?Q?PAYh3kqs6FVcaHdbKkggKug=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28331c84-0311-41ff-d371-08dd560620b2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:37:27.6119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LKettmY8t7Xu7CO+FDcQkoPnxQAFdVNIc1QJVKx2na2XQ75++sLVC+R62hMHSuM1+7qTUBUnO43R6MnngozTwHtPGcNaVpYdKtZOptugFoKVUuDG9ee6CzMvlLAmQ9Bn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5511

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/boards/rt5514.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt5514.c b/sound/soc/intel/avs/boards/rt5514.c
index 30588d9e9ba3..d1c3e29a28ff 100644
--- a/sound/soc/intel/avs/boards/rt5514.c
+++ b/sound/soc/intel/avs/boards/rt5514.c
@@ -116,7 +116,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->platforms = platform;
 	dl->num_platforms = 1;
 	dl->id = 0;
-	dl->dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;
+	dl->dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC;
 	dl->init = avs_rt5514_codec_init;
 	dl->be_hw_params_fixup = avs_rt5514_be_fixup;
 	dl->nonatomic = 1;
-- 
2.43.0

