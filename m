Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011020.outbound.protection.outlook.com [52.101.125.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B772B1D0DEE
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415976; cv=fail; b=OdNeAD/HVWfihAutLaMLLv28Rdac3BuK8ZDkx1rDCB7LccLAoYrIoXdBqWFYjfN2Lw1a9+cNEgeOYA2qD6GONYUq7K83E4G0YVp6sB9bPIWRc1AKPDdhjy0nAP8HiXrYrFLANWA3BITBofnZYAUxqJjL9a3Q6QEAZ9qNd+T8J+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415976; c=relaxed/simple;
	bh=wu95ZJrGaNRDsW39Z7s/vGD/wyRWCfUgpPUhCsBe8bc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=I95vnNXNALKM93astCG2FI4Deu8kEORNFcLqWljVOAq7Z1Om9HFQKk7pHOXxrTlaEHIVCxYtf0Z70sZKAq/1mG5w7skEtFbIkEECfDhQnzNWrUCaVqMUf9UoSLiCxv9lxp6B60frtuzJyRDSUEd/pXe5wFFu32qox99t1t5roCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BOGPTiEN; arc=fail smtp.client-ip=52.101.125.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BOGPTiEN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mgWBlDhudXnEUjd/FSLabYCukpx3aRZnU4FIwhzeC4TR8bw31MsdGW03cp+cWMiUw4m8ab+EsUBmOMtUF9JLlszyKrGoBcpomLPd6PcVXwxRwvY8F729c4mAbON2hZS8cMxhfh2nYJQAUubPFcvX5+IqRE3AbYxF/yOLOFf9DK14Y1kBZyTqwXEQLPaNNCKUMIN2Lej0QuA+fnkx5TKEc+fI2Hsa6gARkTX9qTuJBMCS62V8LoC+u8l1A0Btf548u9jQ6K4Rp4C6qD1XFWT+ZMGYuaoVZ6OGc9O7O+uyRZsPWKK3OlXhWLPe8sPyQHpowr1CxYXTXkPvbkNAEt31ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uh4FDrCDrhnVnZFuPOUxFQVKY38NLUnetdyZpiZbUp8=;
 b=sEMrjXeVPtfa9t3GECZyBBClpgs2bH5qnmfoL9YvqA6KUGx5qsCiG6NykXVM4hSnJDopjEHs9aORsr8oeoGPYjA4uqM1pKiBBUmhhdI5RdFDCwyjZzOx2RkfaqjTdlovxUZDhx2WM70P6IzDVsbGhgUIi54cSpOKY5RpJRCDawuOaqR7qVDIP7y36TZoAa3K9rpccB+7oauyf9Wa/9h8LsG06aL2z8u7Bx8Y3x38oaakWv99eYfYIA7f6o1D+/BHLeTnlRfU7z/3gEdsY/PL7yY08hp1ffS8w1u5aKGFFtFjWjcn5MatkLX3976NLqV+4UUQ7QyEU9/uM8sAMnS8sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uh4FDrCDrhnVnZFuPOUxFQVKY38NLUnetdyZpiZbUp8=;
 b=BOGPTiENBoY2pOvolcZu8nt/458wX31U5kic6jGSwWgo9vFSu2uoAIsZOHtYsFfGTmIzJkNvnp3cfNVNhptVeMeRWttTPraqdxbQMI6EKsFgFy4e3iIW0cSyL7dvGfC51W1dMmnDXJCEHTvZk+0h91/bmxErYWVRNgDaYt+VIt0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9955.jpnprd01.prod.outlook.com
 (2603:1096:400:1e3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:26:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:26:10 +0000
Message-ID: <87ldlenm72.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 107/139] ASoC: codecs: wm8753: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:26:10 +0000
X-ClientProxiedBy: TYCP301CA0066.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9955:EE_
X-MS-Office365-Filtering-Correlation-Id: f569859d-10d6-4fa4-a264-08de0ad9cd5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D2thwXPBTgVoo1PpzpsISsfuUQZaxb8A3zGKdL+60GsH4GARUQPoGVnlEpKw?=
 =?us-ascii?Q?sTVvzvA27vg9nMKvFVodsSnihVCWOPaPvvmqkicAlNsvs4uYkULEYoCtWDOP?=
 =?us-ascii?Q?Wd5Hug/5al9F6ja7nY/kcbOkhfUYGFVvZiOo04W2fI0/dPNft7xPHgBRE/wL?=
 =?us-ascii?Q?qyHO0UwYaoOSZ3SFonJCynIq2mmxKghTUPOcSnOLlZCtSs7p48XPsOt0Hau8?=
 =?us-ascii?Q?/LoFDe9c82o4t8wtVsV/5vyv0eO6fR6Kf9MOiIfFIXGzFrtjvXrWy1d6jqE6?=
 =?us-ascii?Q?GRmD0/apETc2SUEdTc2XgcgEvY/UonF+pW4DEw5L5K7CZsXqoTanW7Am5KT2?=
 =?us-ascii?Q?PtadLNs1MuJmklDRqrplsOOEnpQtPGzN61Q+wchQMvAWFHd7v/mkUaU/X5/A?=
 =?us-ascii?Q?clzASry2z5uYxB7p/t2tzK6ZriQdtuRtnxXAJSBDaXCK8kKKd+VD/Imd/cLF?=
 =?us-ascii?Q?ycnxBSmAsN6Dt930cNGnh2LCysplWEcnYdrmQQectUfX9TaOTAr7ebnSSqBn?=
 =?us-ascii?Q?2noAWeTuTBhoJ2qWii56BoCseHL6Sf8mtkwJlNAfp/nVp6p+AL/Vm1rTzB21?=
 =?us-ascii?Q?PJ+LErs0cZyXYhhbIuIulSaHw1E0FfLm7KQinwqXrQa74Z+oRtxJ2nmJLUKx?=
 =?us-ascii?Q?fJ9dDyci4UwNqkVCHnDe67g0IusfOQSd3IrUFgy7xBA5p/xqog3P7KOtJKHh?=
 =?us-ascii?Q?qJi7e/T3y6tmi1VWnHpbIzaReRttfmi5JDvrKhL46MJT7wQqSVgNyBJ/sPV9?=
 =?us-ascii?Q?9IuJ+JaNk6zRMG2QQC2wgZmcrCnAv9hDc7jT7yK9T93KokFSPb2kLzjvqU/a?=
 =?us-ascii?Q?8ohsfLEAoiDH6obBUio0cXFpc/P6A4KJhrI+wccKNNpPX7mJSg5dNzfWwJm2?=
 =?us-ascii?Q?HDPBhxsPcYFAve1Li51VxzOiyvZTSWUgQLs9LDz9B+XzLxRJYeeuhky5GLen?=
 =?us-ascii?Q?XBp+Gn85AiEkARaWydEyV+ozf5sNWj8ZcE9ct5CQzhqag9juCFkYQ57snDJU?=
 =?us-ascii?Q?1cQvzg/Pl02lDbhSQaMzDsv/PvirZZ99mpe6rzVIIy+ET7ol6q34WJWY3V0M?=
 =?us-ascii?Q?cPuz/QHTTtmg0zlm33w2EdNcg/wa6+fWTkbVhZ5xGz3AHr/iLg6TmparC6+b?=
 =?us-ascii?Q?s5p2n6Msrx7CAE9BDclh26bzyiamoqdoyUIAsbCM9K6s+/B/XA65IWuxoprk?=
 =?us-ascii?Q?e4V/uCF8wrPiudp/hcw1ivChx0i3tjcr/+qewT7HZytlF00ISRlA+sVwXm9U?=
 =?us-ascii?Q?rkXAMbmGi705RVfyKJd77Gl3Ntrac+gikZKEFkpnhOHLsTSa5qQz5Cp+lhAM?=
 =?us-ascii?Q?OBqnXmx83YWzDmAWjebfr7EN/RDI+8AfwXwgVT+3CtFM+/uB+mLnenXfwEGX?=
 =?us-ascii?Q?9bDBeJ4eH1D9rsgSGHV8gDxW1kujLbo9zBQK1QzjDs9R9sQG2k37gpIwHgSW?=
 =?us-ascii?Q?UhBunLdtTu5ONEPuhztX0/9jUXzXBqwQWkvzCzDIOPh/YuidRsQUWMMOaury?=
 =?us-ascii?Q?YTF1FaMHu13kkpLUl78g0sBdDjhKeohmMTrM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?umj1kXxA6ko0p1m+qQP8RrrF3h20TwVKx0/glKf3zHHMFXRl5dsy1BgeHgEc?=
 =?us-ascii?Q?hFaEbz8mQXzV/5hPJB55KpMne3ckcYKZqjlwUg0G5WHHGP1mMx0w9EAqqn1X?=
 =?us-ascii?Q?thtM6PDpG3nHTmVckQ3ETPyM9ZnIuYbgtHTrsK5qA/UXU99sL2dSnQKKquDz?=
 =?us-ascii?Q?LV8k5LnWPFGjftQr8Llb1slz+P5HtCMh+bgSEjRcWkly1duwU4GWvqS+P4tg?=
 =?us-ascii?Q?huz4d1OB70wXvGUoqExbc3iTAFFTX3yymTpvVGYDWDLI1bB3RtsLgbBqzXlf?=
 =?us-ascii?Q?R+rEqkQxiOi3sybbahWI2zlJOWAr3ndaHe/50d5VLiPn5TYAQ9RoRJcyRsGC?=
 =?us-ascii?Q?naC7e64CYXU/4nMrDGEBVGNNkdNlqxH0CJzxP+/KgAnZOkTjZJxzQygFd/Cz?=
 =?us-ascii?Q?nF89ajDOe+A2vXQnCoRhhrEWWLyxZgGKrW+QUNawn1pJNCCvKCatcLi9eWNq?=
 =?us-ascii?Q?tnEXNgxIh5J1n4QTkgbswWWqsyg5brZP+7QQIPVwWkRxZ7L7b9SOaR75PBRy?=
 =?us-ascii?Q?D9kIDy2mXWfwdG+h7oRzpmQsgkILSayPh/YguvoTaTSnGG+e3Hlly93rUTcf?=
 =?us-ascii?Q?Ma7b2OkraJgg2uA7rjoTrq64bnFI1z5jJcvTcZNKWsYks3qUHIoWiQ+XBXIK?=
 =?us-ascii?Q?ZNwvCvSxKhMx9F6j3keP3I9FLtyJ4ifleT83Ko3/nKtnsr2BQoggW0OBopoF?=
 =?us-ascii?Q?hjS0r+IqmiT5Gev5Yapqv9bYNbBnRSGpZMtF2hQWCJRuQzq5p4zd+9Ypwt2d?=
 =?us-ascii?Q?qX6QZOkx3/0LpldyIBCcLm46XYFaT8a62cprRhG0HuzRLZDCACL1KovijEgy?=
 =?us-ascii?Q?ClggoVFhwhM1JfnwyXMNePRU9cH7oh2mCYD9BIbzF96QhFRqHBigoWaqMh5G?=
 =?us-ascii?Q?9PC9KTI7XNm/mxDcARmfa5Bcw5wpZ7Xiv5+t6EY+7jiMAVhwFmFQI8SK2+2A?=
 =?us-ascii?Q?e4Walf4uMoKD+6iiyir5CXHHh0w2vTfE0VZ6dPD9zw0s9xAHCtXHHMokNpi1?=
 =?us-ascii?Q?mbiHNa6F72r20ZIo7UswG5ZNtQDDCHqwJqIJWTyCxkvVGgil25Y7s0XRVXVF?=
 =?us-ascii?Q?iFYJj8KD7M8DAUpfQyPDa5rEw0vRqB0MsCh+1ERNZvPAVBxdFBNUFBkpG9Ww?=
 =?us-ascii?Q?v4LDZ0kchF7/w3LyIEAh8aenBPGm307VkzBmQLY/CLq3Zan6MeD3qY+gITbb?=
 =?us-ascii?Q?NbMa6AJ4vduGXp3DUU6aogHDwG1T45n4pT1ycaFCrsRUDGxRDN+pxFi2zCHY?=
 =?us-ascii?Q?0RzmUlEBx7yvrZtypZS1IUMBu8oiTrQVRbaOgNS8iCdZUzGM/CLNsaOVSHkd?=
 =?us-ascii?Q?GbEpaBdFDUAGze60kq3Rbyo98NvwctT6FJ+rvvOWqV0daqi5BRbvCIpcRjV/?=
 =?us-ascii?Q?Z4CacTarMqBMEmRhTn1hOII1BqFSWZ8j41XQouIkydDhoPuYIN4Lv41gC9/0?=
 =?us-ascii?Q?dGh8QypU2Aue0Zdul3SU4LiA7ab+p4zM6sfdBnopxINc9FXdh1J8MkO3FFzH?=
 =?us-ascii?Q?mQg5qE54xgtP0YK7QB7KzMeBhQK/g18ctwShAiOm0yyzZ/MWg/6jKJGHbX3b?=
 =?us-ascii?Q?DfF6M3AjxxiYo7FGAERwFsERm0qlWiSYlc0BP7VC/jrdC561ZNS1i8Ku6Hkh?=
 =?us-ascii?Q?ZOD6UZdAVAkCuhDKV9JLVBk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f569859d-10d6-4fa4-a264-08de0ad9cd5a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:26:10.3321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zboC4ESPKfsILWbWIXjeq/r5SgmTKGCvI5FVOQr6RZkLfkuih2q34pZNSEyLjY3NBUuCOnEvG6d5nY2wXFy4i+9bPWHmRE6jtKhfBzdfnIvONCznX8QtZcpxWPpR235S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9955

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8753.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8753.c b/sound/soc/codecs/wm8753.c
index 43cc368cf3f31..bdd38ee5aed77 100644
--- a/sound/soc/codecs/wm8753.c
+++ b/sound/soc/codecs/wm8753.c
@@ -224,7 +224,7 @@ SOC_ENUM_SINGLE(WM8753_OUTCTL, 2, 2, wm8753_rout2_phase),
 static int wm8753_get_dai(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8753_priv *wm8753 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.enumerated.item[0] = wm8753->dai_func;
@@ -234,7 +234,7 @@ static int wm8753_get_dai(struct snd_kcontrol *kcontrol,
 static int wm8753_set_dai(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8753_priv *wm8753 = snd_soc_component_get_drvdata(component);
 	u16 ioctl;
 
-- 
2.43.0

