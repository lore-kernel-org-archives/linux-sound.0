Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010071.outbound.protection.outlook.com [52.101.228.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9FB199931
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 02:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756347726; cv=fail; b=KzFhgfGpuHBxB4/ZpjlSetpVZPAu9wrOyhyQEseiu/1IEzkqhFJHuxI01fPyJ4hSfoNFSHShhe/g47nsu2SpZRZfQmHTV1ApBYDTVxRZMsJDiSN0vPqPAhejeRako74sO0GBj4M/KDQqFV020VJBoYIaY7OxzevbWLoncnqbems=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756347726; c=relaxed/simple;
	bh=iPxXIfcHAUU+wH0hlzfqvWeN3jqLMfDlB5abR1uR7tg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DbxqJstAZWp4KkLUuLuCb3EDoGpCc4J/f5VZCuiOdkTL0HJzd5Y0MpCuRn+ZhJEDbv4UNZxS/JIJLK/M6v70s+L6Rl+3EfcfscFzoj4uCCxfMZK0tSmRPLjTT7jxsYp0QL1ngmDJIqOr3xDkTSJGzV3nMYXmzHZFCX2g+pcyNpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JTm18v3s; arc=fail smtp.client-ip=52.101.228.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JTm18v3s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPGMcBefs/bvLRlzpqm8OI0qYmJx3q8syUyuKdN0VZUWx1eEpeTkGz2TIgv46GLBQb2aVbL4FrEGaADYcwhrDZgPFzf7A8aQZBgGjhU7sLEQkHb26qPcnwuH+DzJzy98pCACX3fGc6QS3mWsZ1IUrCps+6mv7RWyOwt6VsmZ5PYGQsHAwH876edALdIOHyi6eGASvLJGyZwoV5qVaQmT8VxG7/CGHtAJHDRU3HSWIIp8C/y5xc1pvCdhhZ/9Z4bnKiORmg5y6w1S6sF2v6BkQVxr1iDrB/soyQkH69Hu74rNzmX3TGP/rng4Hldcr9CN+gROlyljy0sPEhMQicWYKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33RNKDQ6DsRGmPhZtE8eEu0X8wP8mTlZo9xinyRgcoo=;
 b=wFvSC8+9Ra5NnG12l30BUecHhePkfMBZM+iLNkqE5SyFwdRZUX7+I/X9280HivNpLQDuW8XOFWn/HD6Iypnd28Rp54CeLqK++o5IdQV6ibxbBadIljgEGX1KUGMcxymu74/FoyME6/5GDZFonQdhhqEOUq8Uk4mNKGaUoBvqVEsp4W6HnVUUCtU4z9f0q419L0mCcdMpM6zgVOSfwwcfXdT/yNxfr8DlBfoPeNJzVojqNRK1OT9+AC0pRzM1EipF3OaMLK+/SEUK03lvLSVN/2F22PBjXrkpetqvuXvnWiikcO/7CDtauxkPYhrGwx06QeL1SKzHwpIEVk4cifI4dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33RNKDQ6DsRGmPhZtE8eEu0X8wP8mTlZo9xinyRgcoo=;
 b=JTm18v3si8BLtCTIysghL8yxPwz7iQDrDqNv37rwjrGpZFx5FlQPJ3t6ZODnnZYY33t2PEN8fBSnyh1NMbNimdBOppv3rkaJS0QNbmDqan9Id3adbHkJLqxtmaECAd7YA1IP63dp3JKrIwCJxpdkI00JkkIU9Bqy5QmJysvd70w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12429.jpnprd01.prod.outlook.com
 (2603:1096:405:100::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Thu, 28 Aug
 2025 02:22:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 02:22:03 +0000
Message-ID: <87cy8guqwl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/4] ASoC: renesas: msiof: start DMAC first
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87iki8uqxt.wl-kuninori.morimoto.gx@renesas.com>
References: <87iki8uqxt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 28 Aug 2025 02:22:02 +0000
X-ClientProxiedBy: TYCPR01CA0046.jpnprd01.prod.outlook.com
 (2603:1096:405:1::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12429:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bd02fb3-148e-4d73-c88d-08dde5d9ad08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qZzqtf38Pix7L+iFuWZTqnzdHaAz/RMXZJLOn+P8tz6hnApgKMulCYKKHqDD?=
 =?us-ascii?Q?4Jqlw2SBN40dpZL7CtX/myMSRJCea+QWVqLOYfewf/hRoaWxvdAZ6eY/XY30?=
 =?us-ascii?Q?Np8uq22XoB9grsPAoZmSr/g5haKX5EuQN7DXrLDG8NHayAmfyWXtPvDryOyI?=
 =?us-ascii?Q?MYNJ1KBNszoSxTi9s9xJIcHj8g+L+sAPiFgKSPSUZT/1oL+T70FV7hPgzTxz?=
 =?us-ascii?Q?72XiRhbk8NqNdtH7+gW2SCwW/PlosI1NlhRuVSLBMm9k85vSeI7kCpGp1jLl?=
 =?us-ascii?Q?hW5TwhgYxSIrGs9/d58vPdpUfnaCK6kojBERWjbjtP94qiHiX2X1AXCEwsOF?=
 =?us-ascii?Q?EzeM6US5abWkry4mQn6RUNY8G0rZ8v9tJ0LkRAkSEnSvRbp7RfGm0L/5K8QM?=
 =?us-ascii?Q?N/ZsI11di9o8q0T4yALK6IEqxM2bySB/vZDHubR1dlHe6MYxBNsobRm0LCD5?=
 =?us-ascii?Q?bHQ3ZdwLeiNLiALwyYv8Oi79kImN2rIMgbtb7xurFQJCBkEHnJwj6t0941lp?=
 =?us-ascii?Q?+vGQZtuXCGOgRZZ69zGEgZ/lBB5HPfDHJWXl3IZeC5TlMDGPMOTWYvvyGHF4?=
 =?us-ascii?Q?9ZxMURs1SrbbmOnsqX9O1iwRAn6kylbFXbf/7Z49fXuim6uo6URKmngrZPQF?=
 =?us-ascii?Q?obeEIwdC2EzLnDd87xWESq5nvI7LtCoNzya4OuOw0EmiSSda38avW3Zvn2CF?=
 =?us-ascii?Q?Vclu/JM38RK0QLhmH1XeEx75yPp5T3lZsPh53fitV9K11xo5750/AQq2PJky?=
 =?us-ascii?Q?x/47/st+ypPoD6tiY7xz0IFfF6skEjFY4dbn8aZyteJ3/4wHLSCar7318MlP?=
 =?us-ascii?Q?zGLnSp3LmQ+yOoJ3NmqFHdL7sYqV4wiVKNysSxsvRcTSDzN7NxrXdWtD3QR3?=
 =?us-ascii?Q?AafHnt9pOgMlkV2e86yJXzmAkg5G7zjf5sOF/i0mUCUEMDIjvFzBaflONjyY?=
 =?us-ascii?Q?fjvnzDkMGGDQggazF522qTlQgKsv3rbs1edYj2KPbdSngPmcU5RCRXbZhvMB?=
 =?us-ascii?Q?x1pJ7yYXLWtLJD5dv6yWyltsrlRyHl6h/NcsaJ5uUBzoBZazTtjCGb9k6gUL?=
 =?us-ascii?Q?q2HxhmVutIortrA3M5uWLjGZUCckP7+lXNApjHFTc7wfG2XT+hiE9/903lNY?=
 =?us-ascii?Q?pUBuvuDTqOjD8KZ0LW6FW16O9g4iEtkTZoPmbsm6k/GNP2tMsKk385AZhkKI?=
 =?us-ascii?Q?1YqFRaWZJS8NjV3HPwhKr6WpVHGEbei5RHWivadLhMWR7Mm2hxXSFtkh1af5?=
 =?us-ascii?Q?F1Vz8CwEgoDhq+C0c/DH+D8Cr1zSrQ4o+cDelVSRNAeyIwJwrR+5XmRUEv29?=
 =?us-ascii?Q?2Tigo3hDdOXq6IX4QpiVE14TMdwfB9HG2ecKTTq25zVOV27rmzujieZW8zwQ?=
 =?us-ascii?Q?dGRsdywbtyCkqYspdlNoB3Zo+fj8zvpJd2gE8n3hyHVyEIRH1bsKD+YuOemX?=
 =?us-ascii?Q?ztcfnb04DOYeFLqnE9U05eZakF9aAvMOAroFAuLL+CztWzp20KU+BA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?udV2U0Z9aDZnj2aPaZ2eIZ/oEJkfaAnZJ1R3mwkSFhRfBE+4YrzQ3QseqB29?=
 =?us-ascii?Q?RjSyNBp+6xf+Dd5gdltnjNtUrIvft0+iCypEy1NzvKQxKrDpZPzpK6eGaUai?=
 =?us-ascii?Q?a4Pe6eBpG2A9GsOih3r1JC4040NQpfZ2mNJMtwuuEQKYV5aBPHeOpCwb4n46?=
 =?us-ascii?Q?PnSQxYs/6zmNa+dWqD0m6eGj1cweGsrUVm1LKtfpoc8GcovmLMOjaRjMS4ul?=
 =?us-ascii?Q?a6dBDfJwlwqR9ZBcL58g/dFzemCcffrunZPVlHihzUbzYDLR1gRSciTYU0Tc?=
 =?us-ascii?Q?bDpHZ8q2ilbWQKjYmRHkbl2Q0kV0PeWpiRDa4/QUCGHGgqQuUlcHIJExo2kX?=
 =?us-ascii?Q?e3OfJwjlH8MIv1bujM3airYaP95Trx0+K4sqeOY0Iw5NXltxEjgdeGA8Yfzo?=
 =?us-ascii?Q?gcRbG0/S5o5ooDkOxeOeMCVv9QS10BNUj00n34xcESGcDHuE5mIqEhZkrlgi?=
 =?us-ascii?Q?4X5/DtMk5pnz3H7JLLFaqASvTEW2ua4zk7Gzt1U0NGCOERHSDj0MvCw1v2X/?=
 =?us-ascii?Q?l6yRPi7d8fWgEYgdzPUXKh0uQQMMXDY7zfzkAoAB/xHYsEZ5AyExAfOD8g6n?=
 =?us-ascii?Q?vp4moWvVgWJXaTSbCCPEhf/rhsizOrIDjETElQBd7B6UpsTFGQQeyZueYLfp?=
 =?us-ascii?Q?PuviYaDJEChDcFYWzDawBu89NIj0olRAujd/bhYULqc+x5p0ZmjfmRmNm6Fr?=
 =?us-ascii?Q?KtD/XhQ8vnxbWeyA1v8oWuDGlO5ueszY19OUJUaFRcwKIsgg1zgqwX5quAPZ?=
 =?us-ascii?Q?Nq6bvAzdNObBmuE0lS/XJ3hyBi2/yUuYzAlgI6EynHtvuVWgs6ofNhcCBfi/?=
 =?us-ascii?Q?vxN20r+c0aeN+Nfs/32rXZ5pVSM5iAyC1eRfOswAcdRY2YAf1heACR5qYMQu?=
 =?us-ascii?Q?1vWqBgUeYPYAp0s9DREWzT+ZCNyDRz6soeqT2FwEs8dqA9S0B3sk5yZOEPJe?=
 =?us-ascii?Q?zYcEwsKGnX3aW3j23t72qnLjGFmApef9mt5gJza3ApWlQbU1B2tngY1nXRL5?=
 =?us-ascii?Q?/gICwx5uJ2W3tjab690XuhDaDWaJ72zFTkQkBEszhjdbeaCQmFgQCIETzzHq?=
 =?us-ascii?Q?NQ6sby3WbA3q6UTNH43Uxnh3eNrMc2TIe8fL5DwkJbSzcss+Dg+kR+zgFzFv?=
 =?us-ascii?Q?q7cK9LuPCjkcOC5NUrYeM1suRz8a4n0uFW7stqfFWoyoSI03IxSEcmVE5J38?=
 =?us-ascii?Q?FhpA5L3ZL7yeqNcIu0HV97O5YAeM7CQ4hTlDV6A08AnOMtu9i7q30nRxm5fD?=
 =?us-ascii?Q?5mmT0KKqCv70GZkJldvUBzbdg6Dor+xamBTqNEL0t/M1lqqd6UWk/m4JfB/c?=
 =?us-ascii?Q?E17yeaalCJkyZceWdebtBXKoDmPwNQit/u7lH8vkb12KmfU2T70MQ+S6zH0q?=
 =?us-ascii?Q?BvQfx/BYyZ75JdQVss+hwrCDFmpYufqiH2J4g+dp+05yQYfpjCzmv0LRxX+s?=
 =?us-ascii?Q?QBQEP8Rl7uUxZDnHpL8hbHaqBdLXspHjamOeWiuYrvt6JVEvxpH3bwrAJXcd?=
 =?us-ascii?Q?gLgm7i+xHUBh5NwsoAqrRETfxFvk/DDt0A9MQsopmtZxSV7T99y83HpSCOux?=
 =?us-ascii?Q?mlmY+TyiZmNKQyPqWtn80UzUJjYdtaMa1PWf5gTjISw2WUA8pNu9U45MkHHy?=
 =?us-ascii?Q?XZMOok97I9tquu4mqS598Cs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd02fb3-148e-4d73-c88d-08dde5d9ad08
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 02:22:03.1373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFScK64JEYT8WMe2BSTvw3a0fidIyOu/N9viI3D9NxYlJgKJNFf5rDpmxdg7tVXemXhAaEqcKsWmK8XPRm6rC4WCCCw1AFRX4b0fBN9e2jbpTVxoAXYPk3EdoBNE8ox/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12429

MSIOF needs to start DMAC before starting HW.
It will get unknown error at 1st using without this patch.
	Playback: FSERR = 0, FOVF = 0, FUDF = 1
	Capture: FSERR = 1, FOVF = 0, FUDF = 0

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/rcar/msiof.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index 90ca3357392e..77e1dadec14d 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -136,6 +136,9 @@ static int msiof_hw_start(struct snd_soc_component *component,
 	priv->err_ovf[substream->stream] =
 	priv->err_udf[substream->stream] = 0;
 
+	/* Start DMAC */
+	snd_dmaengine_pcm_trigger(substream, cmd);
+
 	/* SITMDRx */
 	if (is_play) {
 		val = SITMDR1_PCON |
@@ -186,9 +189,6 @@ static int msiof_hw_start(struct snd_soc_component *component,
 		val = SICTR_RXE | SICTR_REDG;
 	msiof_update_and_wait(priv, SICTR, val, val, val);
 
-	/* Start DMAC */
-	snd_dmaengine_pcm_trigger(substream, cmd);
-
 	return 0;
 }
 
-- 
2.43.0

