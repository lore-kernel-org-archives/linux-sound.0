Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011071.outbound.protection.outlook.com [40.107.74.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808FF198E6F
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533932; cv=fail; b=GHcKLkpJ09WToMWQfZyv+iLn+HF5x47i62rG2q8cr5PY52hIe6tqMozVSoKFa+em8xjS+Qe0eqpJXSweEkM9EWiS0x310IpdsKVaPfH2rqJTt8wP73h7wJeMpTtSBmSLp/kI14XrjgWzM3ljKNczDGGcUcyVgB+LVoKAbwF+XzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533932; c=relaxed/simple;
	bh=D4e+oRNwavtb24xE9Yjbv6AS5V3FZMNa7hpqeCSY3lE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=QWPNgb1N8MhDuZ6pUbMR8FbXf4K8xDkFhQh1n/pYP2giLDg92qoVYJ32Me5/l9eFuHSiee01OTvdH/MdsRXM0ih4utmxnY2cHPG6c7ibxk7tSOC0cxPG9CX1lz38KPjKqMdZt5PAO9hKf62TiWOTOukFMg55gUkmWxgcXdYyaos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XbRKF6XE; arc=fail smtp.client-ip=40.107.74.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XbRKF6XE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+2zwQJsAm5JzXpOUGpKZF6p4azi64o5XXYD3R9c9MWq/WSwOqSXF8ZgJM5SAsNNuToiDBMjJje3+rc4GiUkQciZFFDbkRbuTl/xmZ+C7x+ytqPwJ25u5tjSOencUAW1CmpP6e/mGfKKy2HNE6dRIAmsMSokwA2LEj2mTxSJMcqWejgPg5iLBYCcXhPvy4swLTQNtMo+yusnQaAbM7gu971FxpnKBN031Ca1dkrxFEQXsvWhgUs1ucuxZmr7CYXavKyieJwIiMg8pQjICM2WPWtHRc55P6XrUsa6HTrlg+8zt+sJWKuMrXcURXO+Jk3P9qmKiIE5TusbDBBFiLvaGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8b54Jc/0o2OeD0BN63ILMUeT7ZpAdshEahTNpn3EtM=;
 b=q15I7UPeTLOwzZRnl5rpronRU1YS5MIrmpVKr14ce12RtdVXqfAxzhrYhTH+l1eAadyOf7ak6bqBowIedZq7IDmovrRp9T7pB0NgkXVWV5cedSZ5kdvxHKY620gVakgMDjsjTaGds3MGQlW43jV/92dNcEhNqo0UJTDjDHbUlBZubhGolkmLSmF0c7/VxvNgi2mdIg3lNtRvpyApZA+3rh86z6U8aJjEluTSrsrEqELmgOmK1ipx75r3FZ36mM7BWHVNf6xJMeqK4eZamCPER801NxGKh2WFQiD2gnVTxxPhZ0Ugij83LFvW3GYzVTHC+LSFifIoAGhL1KIzWz801w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8b54Jc/0o2OeD0BN63ILMUeT7ZpAdshEahTNpn3EtM=;
 b=XbRKF6XE2oeDDR+9LSkx6gjDep1qYamd99qztDj+Qs6mO8feMQblqB0drFjK7BQOEYdhnBA3Zsz2jn7GKqU50za7WpVQ8U1LOsNKmBgNkm3RhcSR+spRJO1QKqwlBF7+F7PZRHGbiZbKcuty1edfqjEmXDuhBx/DFAG+me1jbQo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8864.jpnprd01.prod.outlook.com
 (2603:1096:604:15d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:38:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:38:50 +0000
Message-ID: <87seo18oyd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 141/157] ASoC: mediatek: mt8173-rt5650: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:38:50 +0000
X-ClientProxiedBy: TYCP301CA0064.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: eb74242d-840f-450a-c45e-08dd5606520c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QVQHaxf6Nd6ump95qX7vKRGc5/6OVWH1WMUz/7BpGWAbkrvTLOiZewPR8E0t?=
 =?us-ascii?Q?PCndM4uQnAZsbCOl6d9PBh/i1HjnJUjJTJpknj664C4+iwzbkNWMx4Suh/xO?=
 =?us-ascii?Q?OtW+Tvy6ZiH8ANT7XU1KrqkHh00QsUXXkZS6kbVxqXhX7yN5ycsLLoxONU1y?=
 =?us-ascii?Q?4w1sr/dXJ7oLr9DSWiNedEjGpffovq4p3//v01sNyprKDF+wxdrdhMrr7Jgl?=
 =?us-ascii?Q?17j3wXpH/wQRHbm/K2dwxTQi5WtVQIvEBDk1/RN75dJ9E6FtbHPsAEVxe1kJ?=
 =?us-ascii?Q?89w3hj/WR0f7DhmX8RXBugVNWPoDVElKVUG+LBlfITsDrdwYESekx4gnTIUJ?=
 =?us-ascii?Q?1WqUmjGzG07xdwWoFVW4H8zpSLV42pXYffj1Zz4vBiLaIwG05RcMZDUzDMn5?=
 =?us-ascii?Q?gNeTs7Zmfptsh/KcBB3j7fgG+GzD6sg+UqWOClfJS0yu22mIIzvkuXaJy04c?=
 =?us-ascii?Q?oEk7yXIGMDktoYbbDhmu92KsGpbA7oCAZp9lVCRUW9QX8e6guvMngX61Drv1?=
 =?us-ascii?Q?GiZSjbsHCHiu+Kbce5DHLnhrP03GI8JOGphaSbhjT6U2e0R6TH266M5IMTZr?=
 =?us-ascii?Q?rqSwFJPW1VWA33J3xiZX3NwJ9eGHlDJW428j/KwUHtLAV2pOTUmlHFJnG19U?=
 =?us-ascii?Q?CpX3iliIdYAsizeXkDNocc/w9rlq7HR22hX74Skilf42zSdENBMFZ3uPBTlI?=
 =?us-ascii?Q?cyDZOSZK4LP3/Zgx2cfeUC5xTZM/68L2yee+5xFTfrldFc162UYHviZapGi7?=
 =?us-ascii?Q?mf549fIKwQixtqzi2VdMheU/Nd8Q8J+7ehLZOd4vFd4z0w84VZa2/UnfaWdy?=
 =?us-ascii?Q?7XHlluYUaUPkzbO96ieWZJIoSbmwFCWk1GV8KbMkVGkBgWkEi4KK0fPymUM8?=
 =?us-ascii?Q?o1CWIprvmUiY1RnWiEIvSUryyasiZBSoqdCTVg6lrx6eUp2kS21kUkZX9aMB?=
 =?us-ascii?Q?eBk3O8s1pDFAc3CliMBYo6Ec7D39IDQvNpeZ9ticwTbk0hacP5gXZXdgbtSJ?=
 =?us-ascii?Q?rh/OrfPCa8MsDM7MwU/ExXjey4NRyO+sAqmT4+MLJSnEAn6lW5yQL05EPBzn?=
 =?us-ascii?Q?6p4qs0oQ+mSV0BJmNaKcT56ZU+AzGh+ke+PaREAFIMY4or0+uSojLauhAUS/?=
 =?us-ascii?Q?w457b6zLZRjDh6r+BjTFJ68hzpaCMzxR/mlzi0mk52li7kwJ7Ke/Vt+MvY+G?=
 =?us-ascii?Q?O909cu40ZiV6WWpUBanHjcpsYySEEBJxl9QEESPlAirYJqaIeAnLnyp7VnOD?=
 =?us-ascii?Q?ARiM4Mgo2ghVue4YLWinHzTAWZzDbbK1MIgMY4Wo1gKTINYEyxLFfwvkDG1G?=
 =?us-ascii?Q?ORvUkzTNFg1/2bzxYxPEWCFX4Cpwz68QrHt6ePVmqH5Sn0deooTKsyHNJIDd?=
 =?us-ascii?Q?HFIaDtLCa9pPkQF+e0OhPrbLpLBBkFs65/eOIlD3Xh3glUZ/0nNn+Rr69uY+?=
 =?us-ascii?Q?X+DH8jVbPp06BJJID+dFbs/wUs6SmEgF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DWH7zFAAiTCskh5aoC75ht/an6NpZvTezXspjYwRllbHVBAdcBrHeC23bO6z?=
 =?us-ascii?Q?7u7UsLLKTGk57toLWExzos9UmOtnAumrRliqpbt8u5zXEzbw7ZmcIz5X9Or3?=
 =?us-ascii?Q?kaNwpo6YxZVFIpJ+OFDmarc1HlurUyQo2Gexr+qu5AaGJtunbEgjeD0Nx93x?=
 =?us-ascii?Q?gUKAVFYFPEwQnwcp3LPnpZmUrF65iuH7aCQVz5XZlwhB0bS+bh5zGgzcAFdU?=
 =?us-ascii?Q?qJYzDF7+h9e5dWkE/iSlID1gKngJ7Ri7Bx/KvA4gV1diWMIWVrjq/uoLPkIh?=
 =?us-ascii?Q?gsWjNVP2LMro5YwvjlI53YY3d0hKSdCka7aH5ulNBTjU6qMdpeH+kUp0BdPF?=
 =?us-ascii?Q?IZUsm4NMUurXz+Dt45abIlikq/qDSxO+/mCjiNLzO/mW+ceI+otoljnlhoYk?=
 =?us-ascii?Q?fEZ8Y2l2xxGiL4GM3cyRHaffm1VyAS7p2lMdP9smcJW6lbIiUZGFbjU09xPP?=
 =?us-ascii?Q?NaJekxzCdWwXu/ZSOuBGTb+w98l5EVfg9eZ3ItN9OC4om15mIPxlTCJ2p7GN?=
 =?us-ascii?Q?n1Eg0dFWT7Yt/I1Mm9wnXotRhCrOO3d5C/k3/bLB0Z02+9Qj1E6auna4U2jg?=
 =?us-ascii?Q?tlSedkaivU8euGPolnGUfSNjmEdK5YCrQIu7pkWQVJMPceoHCI482vvFpb/8?=
 =?us-ascii?Q?We583mYNvA9CpRx0DhcOv9MWO8Ey80jL/fVCbUgZrjPIuP5dpOBPSUuX+qM1?=
 =?us-ascii?Q?81ZEWwbuevHOzxSgmdHuLvjfHh1+feD5ae8SIQ7nMKey8UhBaLJ1ZE7VARdj?=
 =?us-ascii?Q?HwQfh3bVvUep1xYp9SuaxnfRxJo7Chc9OQ6I2QrEwAF6BtOOaK30ekMNzd0I?=
 =?us-ascii?Q?Ih/KCCpI4j1oPycRqT5+UKPiZkqHE3AlWq0vyK663Lh53nig3zKQw3N+0a/Y?=
 =?us-ascii?Q?9yXVpDKZCaEMfA44q1paRIkWFCBCA07cYvV0gnL8Ii1KaeaQMJRzXRgFmaHs?=
 =?us-ascii?Q?JDuwp4dxS8qcqdF5dJqU4VV4LF/6c93py0iZyCd4pDKL+5q2YAupsQ5a34Hk?=
 =?us-ascii?Q?o3DhF419D5Xkjgp2+wUUmFRHYLC3AgkAZcjMusK7xzt/xkVBOhG4sK4XMV9O?=
 =?us-ascii?Q?liGW9CNt8CeFeJtPWUC+eLlbSGhCxpEDQt/02sm4jzxVL8JCxkn0E/CqL9lo?=
 =?us-ascii?Q?48ZE7Uj1b3Wc8ZEV4H81jCF3EWU65Q4gqszqqU4vpJ8L77HAii0b/oqjyE9B?=
 =?us-ascii?Q?t6SqvhvmmUmry4TavoM5PDHMPyHAOzBzecSjU0dGY9cfvhSw+uw5snk0RkkW?=
 =?us-ascii?Q?g/DnZSL59WAyPRWtTb3jO0DBH62xPk+rpB0XEZNnPy2vib+xVELHWqzkyOQM?=
 =?us-ascii?Q?POeyqMAE457JE4U3sUczLcJnmR4CLP1lQJk2SFSg7QZpnujJo89OVtDshtiv?=
 =?us-ascii?Q?fIRNH61Kzm2h9/31ProabhyAOdKD78bkoiDj/louPksTXLf4Sy6BrCNP/Lla?=
 =?us-ascii?Q?Q4gBYnqW4hDYCtYNGH67K2M43z38LR7liKbA9gdx/J+mTuwjrISWbu2e3EZ6?=
 =?us-ascii?Q?RqpYIZ5B+IOK8CaTF3+2JOWjWVuuD+QeX1Bumrk/4FSIU9vsHHKAvbPljLIL?=
 =?us-ascii?Q?X8EMqnTcSs8i0W9iiFJIbg1rogjg4SVF8Ypyak687/k5Zr0P5zGoNxFiMYNl?=
 =?us-ascii?Q?KCTL1SuECa7v8PHkhzjrHRc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb74242d-840f-450a-c45e-08dd5606520c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:38:50.4138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZrdljYn0if2WBbe3Es2MOQtOsDMDnHPAG3Mfl4xLWw7g2g6bNxNqaV4XgoeualMSVeVDmy/eWdJ35hMooi7PUNLPN7NjWJyxzCZ54mvrLzHhZoXcM2hvnpzhfZB8dn1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8864

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8173/mt8173-rt5650.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index 59c19fdd8675..7d6a3586cdd5 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -235,7 +235,7 @@ static struct snd_soc_dai_link mt8173_rt5650_dais[] = {
 		.no_pcm = 1,
 		.init = mt8173_rt5650_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			   SND_SOC_DAIFMT_CBS_CFS,
+			   SND_SOC_DAIFMT_CBC_CFC,
 		.ops = &mt8173_rt5650_ops,
 		.ignore_pmdown_time = 1,
 		SND_SOC_DAILINK_REG(codec),
-- 
2.43.0

