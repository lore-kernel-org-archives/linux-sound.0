Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010059.outbound.protection.outlook.com [52.101.229.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD44F19C57C
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533876; cv=fail; b=q6CUO05AmUDoNH0HDK7uRDL4mUyQOe2d6G3Slx3pBYy4ct+ADtrzW7HuJqpCTN9JV9OVayQPCnRAkxTO8rL47fO23Kd4pmh3cDBCh4yMHOr8Dt+1tvkuJBQjV6s2Z9kDy6PhTmdRoKK9Lbeq1js95U/vqaz54rWBYxYd/Ye3GGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533876; c=relaxed/simple;
	bh=D7PGRGzd0TOpPrAl4WDNVRls2evdWEVOeAGxx8abo+c=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Au2MbBVH04ioTw58FRda3EUonRe4MpYw7snaFaKsaSqshCDo9JjgQdln/IusH4D+ZIUhLavY3vAFFaRslr11autF1Fa7bmMPqvVOc8tHG6J0ooHfSVi2Z6WMbeCJ/reYnygbd/ApaWzzRJ7yZOq4Q185tAqqTGj2a2LRP75P33Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cGNVbsru; arc=fail smtp.client-ip=52.101.229.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cGNVbsru"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAXO6EcLVK6kjDHcNtyIBnT92bCHOH9+A58qQZrwIjJexI8T860fhQwo0ebfagYFxx5KRz6BAOErCDOmz5SiRtyO/an3BTLO7/M7LXXEs4tj9rPxb/R2xt8d6GRlGbFOEFe5VBZpSLYP4/enFhM/U22ycN44y2Lzzi8aaL/LPppsbCuDtpZ0vtpQla7czaXgQcAByqrxt3sBKm/Z4biVsKG6/ckEg6ZkOI2IcRV+YIOeimUL1muRx9elYap/QcvyeL9QZebZp54k6GpDuBjTbFpZnZ0+IBtpvrgbVcw+J56uXRtVkrvYTt3ZEnn2bKJXJP+6uF/vx2WYjOpkRUMhVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtJuToLd4GEYbj/c9o0iVSIA3F4jhk/FF7ZZc3TtwX8=;
 b=DY7tdzdJFKiNaMF+EDIYLd01jQKLOhC7WHLeXr8Ao5iHPP3Xca38yE6d/kXPJOJwLUyKPEITBYx6kKClkSkk11iiGCLVVRpvg7jT1y6lt0JJi19utbdeuODVnF5ZnSJJELqU+f5WlFpL2kET0xrp3ycMor7XjgQLtrQ5WMtVtAAHXt5o7+fHkUh0A07NFopchImMMI/EgBEYud7lKNizwHZyiUKzrOZ84zPsn1aV/nqxZFnGrseIJ7vODXs9o+eC7rFs+6sONlijh5JQUUrlUkXkGTqeRskLTpzpyXJuUxFko9JOxdpQZLsTlcdbzk+g+PzMiFz1T3/jHOcPR63A5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtJuToLd4GEYbj/c9o0iVSIA3F4jhk/FF7ZZc3TtwX8=;
 b=cGNVbsru6JXcen9rL0429/e0lCvG4naFQCuKZ03FdgfMDQoUbwdSVgQVknPFvth5GqDjvt+D8k2B487JtwTLTq5J+AfYslqr09QD+At+E3SLuFXNI8T2W0dMnZF3Hcg+XpZNIzEgSDCuZ2kcJHTxzvHSEY/Pkz9OZ76RvVqBI2Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSYPR01MB5511.jpnprd01.prod.outlook.com
 (2603:1096:604:87::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 01:37:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:37:53 +0000
Message-ID: <87frk1a3kf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 125/157] ASoC: samsung: bells: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:37:52 +0000
X-ClientProxiedBy: TYCP286CA0262.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSYPR01MB5511:EE_
X-MS-Office365-Filtering-Correlation-Id: 3390b39c-84e7-4f53-469f-08dd56062fe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XPpvfMtZQRCJAYabjqzm9sRmIB5GvF0vGJ3teZt70XVAEjkDYln8JETXNL01?=
 =?us-ascii?Q?C43du26geDSfcksf791KE+c98S0EQNX2NXL1zHO1n2fcPq6pMaPYg92XjWiD?=
 =?us-ascii?Q?gLXyWcOdOz69FF0VSGZFDdWZgsUX8O5VykrhXa+GlMlBof14M56tN0M+GgEh?=
 =?us-ascii?Q?ptPRKmNGwzSQnXMUa0OkcKYnPEFFsm+G0D5RKAK19DH/+o/CzD74ukTKJ6Bp?=
 =?us-ascii?Q?ujOFE6XBO556YFlD8pSVnjHPdW40EoTf+gXNVhMBOuGV+g8FTwL4b68q+7E3?=
 =?us-ascii?Q?UZOSqHOLJadh0QrobVmOkkLd2ECGEC5qmQNzEzl8tKEih4EaHvC2mU0lC/6q?=
 =?us-ascii?Q?QKQcQylimug+xH+xhzeD/AFo2wse5mXxGtaZdbaRF9u1jek6DL8Pjq/pyTJW?=
 =?us-ascii?Q?Z423MLWG6EVVBlnBVce4UH7YNDLAtoJ931lRgkKElxHyFLKBGQtBscznydRp?=
 =?us-ascii?Q?zFCWThZtZNeIoiKEV3JGoXXAF+1MNg4Nu2L9vE0gpOzeTFpiMY3sSxKdd/wa?=
 =?us-ascii?Q?6ZrT69tqUnX2V64gKSZ1JPxOQH33nhm1iHLMGi8qC4kQSREUj7GCSQrau1Ij?=
 =?us-ascii?Q?Wn5/js/k3QMl2tMRre5DqH7c6DlK3cp1YsbAAudXJQDbaQGtThrNoQrL6vQc?=
 =?us-ascii?Q?VikMSSdFFlEnjEvhEssTVd6hrGw8oGk+Y6vk8e/+Vxb1K/vO0qaIxy+lt9aQ?=
 =?us-ascii?Q?1hXYSUOeTmueDX+OpkIAa70SGYOI9gSum6G2Zz+brP7L4rNG4Ck+LV/1ty8+?=
 =?us-ascii?Q?IwEhwSC74V606oa/6t+Ydk4f+7NEI3/DG2Z4W+WCuueBbg6niMajab31oeWS?=
 =?us-ascii?Q?4np4Z/0wQuEvZNtIVo9JCT6n34Z4S9cl+2OhzsSTNrfHVufdWI0Uw6BkSbvP?=
 =?us-ascii?Q?X3gIXCSnhNO+PvVTpHw8PchEyKKlwQJWtE1fLoeY9U4f9VHM4uDI5evnIvMR?=
 =?us-ascii?Q?67TGbC9J8AGaQq5riusTzkbKfiKGuHBbuROCzxlAEeBUmp4/naGxpliMOGO8?=
 =?us-ascii?Q?VEPOvHZNxgxJzVbJLhPbeQXgKLP1R3g96fOebIEvHCUvWmgJ8mPYfMWLn/QN?=
 =?us-ascii?Q?tYLkjOnevxeLzGI8YyqZjv6shfifrB3p6HFxW1qF8kP1ETqOVGC9PBcl+aSG?=
 =?us-ascii?Q?BCAYY+5CEDjYCiY/Ik3ioTHVM8nxoMMFer7kL8L2aIwmCxRVk0i4GxTTRN//?=
 =?us-ascii?Q?3sygBbDKx19140XAdeG5wAUYSYW3aPzBgpWvmWkvDScpBTCo0yDPOSxAF+Xc?=
 =?us-ascii?Q?EOHkIPKcYnXft5DgSMC9p8CGgpWqoOGRKUb9AOUWf5DHMDpf2rZQQgHTPPZz?=
 =?us-ascii?Q?BGpKVluWxIGps+qS1lr+2kPX1K05Ifuy6CY+VW7nzHi4RibVxQJVAa9QUSAP?=
 =?us-ascii?Q?4RzYoRXpPeFa9OrjtiNFhnEsEXIfhQbyyj2u/y2mKsYQLwGGrwKQnodlSeoB?=
 =?us-ascii?Q?zqYISdGrkmslt+INdIqqLoCZdqCFR2zK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gy91SOIMhufRyiMyl0ocfe4cDnMfx4bLnmvK213bVADlXK9LWzaacL63OUJ3?=
 =?us-ascii?Q?jxS6FaEZH5yPEvlMUrGNkb92F46CVAQ64ttV+xAxj5AkgC0DSLIcP18mr7+b?=
 =?us-ascii?Q?6tt3PXF1yApFE9yjvrumudtxXhaIL+n4Ru0UDh2squK+TsbPT+vHj6XEHOlw?=
 =?us-ascii?Q?YEdDtZr9KMG1N1HQmAZW1mFkrch/+BZHNcm0DVTJfek0poi3Dkgvh68maD6V?=
 =?us-ascii?Q?K7prXsBv5S4QCAmk5gedVUod77NR074b2M+8Kg3LOaO6PrybIEP1QXaNdxt6?=
 =?us-ascii?Q?+GmYLkNddz22tGPJVMExljLFoPoiAaNzjwJ6+k8ZyVdMgXVARs4zY6y8fouB?=
 =?us-ascii?Q?yl/KgFBTN1a1hHVkVIci9gHIxwmh4QSIXdcKzcHkeYzFYIgRKbzFhkOFBuwv?=
 =?us-ascii?Q?Iz3PTZJr8B23c/GgvfT7PONmVZdPw8GOTudy8uOGu7ygcpD/GuWF6oR8PZi4?=
 =?us-ascii?Q?QknW4Q6LDaWQAy9H4tQsRNt6BC7pxs+ixPxMH7EX5nOYNOIXxx73wOrT+Rg+?=
 =?us-ascii?Q?HAzxqwkOcv5+vrwJhLkpx1EzKHE3WxYBpt8l+jdsHigooUtuwO3koIwnTnd+?=
 =?us-ascii?Q?uj6lvvpyisNnMPPyYj0jqoZO5dbxJu/EoNclJRxHAbnjrAwhTYE3xGd5WRNR?=
 =?us-ascii?Q?a76c++rrDJuzp5H1KgtMOIWNvRXqeYH5yI2WUgoO6Z6vNrcKBdCevix/O+Qi?=
 =?us-ascii?Q?fpLvQ/yboTm3rVxvcaEyftjrwqAE+9lTdu9Zc94Lu4AtOMGGn9e/4Hm3SSzI?=
 =?us-ascii?Q?co9AGxSrU717r+OfMmcMFX2YtRItM+ZJpc4tOYYmz7Uk4TyHqr+Xi0bb8WFY?=
 =?us-ascii?Q?5mdeD+LjmzfsnAWycdpVLI9wnS/MOODfvsiMlOR8JCokxV/v6Wqnb/Ise7bZ?=
 =?us-ascii?Q?yx9+5POm0Zyv3RVTblCscc5bMy6aL50rWNieaepLEAEY/LOcsUQ1KKa3SgUh?=
 =?us-ascii?Q?5/kpWyYbuGaClKcEC3CVf3QtRD6dQ5glY3+VtqkpDqz1Ks5M3xwLzZakquXX?=
 =?us-ascii?Q?oWS8YVGfDRrUfRCv5N4OHjoO78S/jUAc2WeN4rbfgeX4P5FsFVvSeoNQfuLv?=
 =?us-ascii?Q?fYMiW4A7m7vMVWQ93cdxRKlcBoOYyXAXrQc3ud17zcK0UMsPUNwbinT2mG08?=
 =?us-ascii?Q?E4uNxLJmtbIvfn+fXFzRUYglxS0MqdQxPwsmE15zA3lXC9kFlYfdRAMQ90dk?=
 =?us-ascii?Q?xiSPANzlt4tlK0X7A+e7tzvvzsbI1izQPdP3vXJGEVj1BW7dCa2qcyBdpl0T?=
 =?us-ascii?Q?5vv2qrJH6LF1zgjsRvl/3Zu+JKbMJWHXkrY0OCjBEXaW/BQskzub9p5SC/T0?=
 =?us-ascii?Q?983KhHQ7LTYs2qLNNiuQq9+zSj6+A97TyXMCYuU8Rswp1UJOr/D1w9ynbIvo?=
 =?us-ascii?Q?67k0X1BIVPYoXQSTVbKKZRmjSOHHhbmE8YfAaQ43PiEw+3KRyoy2p79gSdc9?=
 =?us-ascii?Q?hxajDCyOfSprp2SXiEtbci4ljLy4zjuFqAjEy1CKfkJvEp53QtmkiP2uyXWo?=
 =?us-ascii?Q?bXIsdtXhAzxwTiJcnLB7WrxR4xqqOs+xd2+ikglTU0OvY22dPwXv0mAvNBIc?=
 =?us-ascii?Q?C2TKp1TQ3e35k2IelgUo5Vn/9IapuwpONdXydwjj/eFzWdBr502gf5kd4ru8?=
 =?us-ascii?Q?xdsVB08R6mTxMw5ZlcmBFSA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3390b39c-84e7-4f53-469f-08dd56062fe1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:37:53.0658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hb3B3V0Y2RMg9s9hLHBWIWIzPvCtO806uS+qBkeEO5jth7vLIWBJFYnp/pE9CsCISEafdxiFM2XGbs2EDXpujsdT3At6AlljzNScY6dEKu5MtaheDrYqw6Tkua0ANC2G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5511

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/bells.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/samsung/bells.c b/sound/soc/samsung/bells.c
index 365b1aca4855..ba9b0b1fba03 100644
--- a/sound/soc/samsung/bells.c
+++ b/sound/soc/samsung/bells.c
@@ -256,14 +256,14 @@ static struct snd_soc_dai_link bells_dai_wm2200[] = {
 		.name = "CPU-DSP",
 		.stream_name = "CPU-DSP",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		SND_SOC_DAILINK_REG(wm2200_cpu_dsp),
 	},
 	{
 		.name = "DSP-CODEC",
 		.stream_name = "DSP-CODEC",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		.c2c_params = &sub_params,
 		.num_c2c_params = 1,
 		.ignore_suspend = 1,
@@ -293,14 +293,14 @@ static struct snd_soc_dai_link bells_dai_wm5102[] = {
 		.name = "CPU-DSP",
 		.stream_name = "CPU-DSP",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		SND_SOC_DAILINK_REG(wm5102_cpu_dsp),
 	},
 	{
 		.name = "DSP-CODEC",
 		.stream_name = "DSP-CODEC",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		.c2c_params = &sub_params,
 		.num_c2c_params = 1,
 		.ignore_suspend = 1,
@@ -310,7 +310,7 @@ static struct snd_soc_dai_link bells_dai_wm5102[] = {
 		.name = "Baseband",
 		.stream_name = "Baseband",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		.ignore_suspend = 1,
 		.c2c_params = &baseband_params,
 		.num_c2c_params = 1,
@@ -320,7 +320,7 @@ static struct snd_soc_dai_link bells_dai_wm5102[] = {
 		.name = "Sub",
 		.stream_name = "Sub",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBS_CFS,
+				| SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_suspend = 1,
 		.c2c_params = &sub_params,
 		.num_c2c_params = 1,
@@ -351,14 +351,14 @@ static struct snd_soc_dai_link bells_dai_wm5110[] = {
 		.name = "CPU-DSP",
 		.stream_name = "CPU-DSP",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		SND_SOC_DAILINK_REG(wm5110_cpu_dsp),
 	},
 	{
 		.name = "DSP-CODEC",
 		.stream_name = "DSP-CODEC",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		.c2c_params = &sub_params,
 		.num_c2c_params = 1,
 		.ignore_suspend = 1,
@@ -368,7 +368,7 @@ static struct snd_soc_dai_link bells_dai_wm5110[] = {
 		.name = "Baseband",
 		.stream_name = "Baseband",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		.ignore_suspend = 1,
 		.c2c_params = &baseband_params,
 		.num_c2c_params = 1,
@@ -378,7 +378,7 @@ static struct snd_soc_dai_link bells_dai_wm5110[] = {
 		.name = "Sub",
 		.stream_name = "Sub",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBS_CFS,
+				| SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_suspend = 1,
 		.c2c_params = &sub_params,
 		.num_c2c_params = 1,
-- 
2.43.0

