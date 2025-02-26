Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011056.outbound.protection.outlook.com [40.107.74.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2F21531F9
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533632; cv=fail; b=GG0mnJyjYZ1eheA6ZmcdUy3BMLjf3I/hc5797nEKGzMt9omoZXMmj4drwXNrqAa7Lvui8ozrgY+1W+S0ZZk9bhX1Y8ZgBZnFms/AH++QL+Riwb71pkmjaRQ07wk4aU6qlOXKJvpKEMdJvklIzEb9nZ/O4A9LhgK4c8SYWsvti34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533632; c=relaxed/simple;
	bh=pHnZICv8HxbOLOKugSIGTbq5YCFXPaTb/GFXkne5dYQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=aNU16yc+N+EFPDSnqgJQYirNXB9q3SuVOq4sGXBrC02g1mQF+ZE/jIwiWhvLWj90C1SR8gZ3f/NsuQ9PzlFn4kB4IsZ1ddwGswlsUxszRxffketm00qzS6Ahpev2oGt3Ksg92FxCKY88MBjiNoiM7z+BPmHpvi65/vhZLQDMHSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nQpZoZ6K; arc=fail smtp.client-ip=40.107.74.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nQpZoZ6K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rmh7xOkXTH42liDivXAg5JxSyzr6AbJtV3UypRV5cz18D9gNxnnEu5EfGKV05bxSc3ZANghZyhVtEUR4BiRqs9mR2Y5hBEwQWGzudqQyTKJzIhjHVursRCkkujP58gO6gYAA5DDH9ZC6jR7bQHiSq29VRjcqrBcf6gW97InRm6L4EODgbiN0esRHo4wMYHFqdwmVu+S5p7vFISfjhF/EaJCZg2Z8AE/mAnWuJqZrKKe26nt2FmzmLu8GcsDM3lhNrT9zqNZ/fuH9yu96to8cPTuJvIk5pjw6BN/q6C0etmdB9BaekAJmHx42EYfGlIH+8DsLPvO/88D02ASgVkfEBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jdR014usHjrodgUzI+u/rXp5iQS57eYlDgadgZFOd4Q=;
 b=HdDu0keeIh+ggCotn39T7ZEzTsSs6v/jSQrmI0PRY4189MDTnghMRzCknt/ArijVFxlDUnnVjJOKyycJ6e2y1M6uZhYMOrGDF9ba9pA/i+BC30B55J4IGoOhhzHYEugDIUJg6oYnEcVDnO4eNlNcnwxceh4T+IpAhfkID/9Dol6cen6NT5u4Fz1M2+jhgyEvn1q+RkfRiMdR3O4Da6an5CsI4DSUGD4EC6UMqddOky+ksqMx+Er9EoEsrlLVIUQby1RvBj0RKcaJCMh4hv8kPSyraCS5UttkgOHSuZximg3ft5wNoWnMHm2Pxn84pkUjdm4IOclFQHn0/sKLuSrE/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jdR014usHjrodgUzI+u/rXp5iQS57eYlDgadgZFOd4Q=;
 b=nQpZoZ6K0GxvB+qO3izgmu/DIFBHe6kUD4OBveN+ozPMupwAKYssDIw79iwmiPz7ZvmVquCERluAlePjsmdI8xnY9IBjlfldAUABAb2q6pw+mx2q6Km6PF6wqKewZTZdWSXb3y38lWKqREYI++vaUaqkez0nbbiH9UtFPRaFglg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10414.jpnprd01.prod.outlook.com
 (2603:1096:400:246::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 01:33:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:33:49 +0000
Message-ID: <874j0hebgj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 058/157] ASoC: codec: rt5663: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:33:49 +0000
X-ClientProxiedBy: TYCP286CA0220.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10414:EE_
X-MS-Office365-Filtering-Correlation-Id: 379d21ea-2f4a-464f-c77d-08dd56059e8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DpvirMtLVVCxln8gGVB5Zk3g5zc9RbFclkPt6giXVuMUt8PQ9/pxzYlF7rEd?=
 =?us-ascii?Q?maWpF2k+uICi1Vkip7FA8gbbKAzPYX2RcYLmXHkoWwRTiexRAH0PouTFCIjS?=
 =?us-ascii?Q?h9ETDkDS2LhRXSFKuKiV02R+Iu42gG8WmhQgZIXv9kmxcISxt44dACBxzsRJ?=
 =?us-ascii?Q?eEojY46yt5VcWD0vHnqSKfMLDxQSE9nx97lM2hlDIVRRSAO5iwvwkDFR+Qww?=
 =?us-ascii?Q?ekT4uUGLiPSmLgq0QZ5REjObOsoIPnaqBrV84qPF33DoJE/ytXoTMn00Rr2M?=
 =?us-ascii?Q?UqxJjbA0NarXpM0fmltjDJLZx1mVavwHoU6lV4hciYzndBUjvCSjXnflRcqB?=
 =?us-ascii?Q?Xl+C2pwTQIjtREuR/wG/LtCxsxDSewITe4KpYvZyYQWcFR+P8bWyruNVGdu0?=
 =?us-ascii?Q?G49X2o73d/nsnkvF8hs86C9e3enRcKYkAgdHqYEeNC+ym7disyJGYtWDHRhN?=
 =?us-ascii?Q?79E0QhzL3xRhwWgDuMjhSSDrDtQyg9+uq3yjrtmsq2HmnLwfXSdtWWogJPB2?=
 =?us-ascii?Q?LNx6lIrZ1zTGrGk+UmFnyc3rW435ekOs/hksnpptslacZ0YSsDP5q8dTLtG1?=
 =?us-ascii?Q?HNlc32tBLE7Gg4ukHYjRlkgOVA+UUv1GUGJd8urIVSTPaj0p3QOCE0JHQfF/?=
 =?us-ascii?Q?7NOMU/kZa4P5/iOOQAGy9aKEd0CNL8Ell29w4nKvH7Yr4GuOZwMryUS3WTmi?=
 =?us-ascii?Q?hzbuuP1ojV+n+4YkCZfucuGiQuR72s7+711x2rapoGtlGE3arIcxVEILICiC?=
 =?us-ascii?Q?OqseBw/J4mlqZpUNCQe14P9VYmAMOAd7QI0tH2gi1+kGQfz06xNNmN7ZH+Rm?=
 =?us-ascii?Q?EF8S5qgj3KlE1roDDBpNO8PoVK2Q5vbui33OfriaNvzPKXhBE8HJiEDM/FaB?=
 =?us-ascii?Q?0nGxioXKglcx5G7ieHVm79BQAy4kyanN1wCR51yw6M9fDSK+btiwdCtBMnpQ?=
 =?us-ascii?Q?DjacNVCVEp9Eplap5VdpOrefQpv0/scMYKra8Ojsu7JucncP5Xc5tdOmEC/L?=
 =?us-ascii?Q?qF0RVCDzv6FE94+w8XcwOJ0FEgYynk9hk8sPInB8gNCG2Op/bjOcaazx/Ej3?=
 =?us-ascii?Q?fFcnh61UlJ9uJJrPbRYjYZPfBsvvPv4mjLFYuhEARvaGYTwcf+pxVBR94xEc?=
 =?us-ascii?Q?tPdFtDLsRXwmOqdmx24MftGpFmX9QAzpkxjasXOEvAQuCnxVfS1PBDdWYzPE?=
 =?us-ascii?Q?mJynkUmKM6LY50IMYz9HYS668JkKQn8xHsMjyebby0gVBdAaANoyHs42dGhF?=
 =?us-ascii?Q?8WacrWeRwNS9KysnxRAURTn9r2vamEPGr6Z5X+Ie+nUGSKR5vrfVhGKbRa1L?=
 =?us-ascii?Q?5E1grKZql5y4layjAKCZ92qwFQhD5+QyMl/dYdPXGbyj8JZFMH81ndpTL4R8?=
 =?us-ascii?Q?/y0P/DE02v4qc411H7ABuCziIudPK2g1v+PFjiw41R2HcGPARtIenzI6cO60?=
 =?us-ascii?Q?ctJVfNsmSO6OEBGAv4+onw/hhoXYSJCr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UU8urhU9t8g8TLcLHtoodA3FI6NO/gsuIT63bikXr3W4TwLoZbmRTWDA1SNd?=
 =?us-ascii?Q?qeF+Tt6OzjGE3w3fP9llKJ3Vq6Vj57lWfN0UJgCz6ZhIAxwvtzhO1RSmqrH5?=
 =?us-ascii?Q?0B6zKQmhxQbCNIpsYEzNfqHBKuMIF3AQcQoCHUzlO34B0MwB6xCJEtM3/Hkl?=
 =?us-ascii?Q?8efkeiYm0Y8aTqVQilgdz7b9S8XGclLKffuhrJa32Xbr5ymuTk6WGp/FgcJV?=
 =?us-ascii?Q?ay6//4hPrSPRAQ5LmaYPmorH2YlqARpX/280ocn0igH1e7ZKk+ZG0Ez1cyS1?=
 =?us-ascii?Q?K1klYyNJZhm02Qf4jETlVP3H84mUKElP1khPKG1uPpsMqo8OyoKedhI4BIDQ?=
 =?us-ascii?Q?1rJxwVQgaOskIDfz8nj66LlBfNDXDzph6C2byXBbo8wnM4tzFJke/4ZlL/B5?=
 =?us-ascii?Q?aGi8nIOjSPvsQdiQNIAvMt+n0ymY5LNR7GioXxspi8cRz3FfoDd5mYfmylEE?=
 =?us-ascii?Q?0bqFjHWJ6Xx8nMlfqCqIjgy5gEf9iE9OoMrUNybzdamY1P9SLGDTUI0ALrcD?=
 =?us-ascii?Q?0A3POkNYw+OcdABMy97KH4kF3czSe9aJQOY9voAC3ZkOsB8EzgfqP5+kRzRu?=
 =?us-ascii?Q?IuPY6yOSyokNmz5F4txx8slBfjftHyF1QHvvASjSGdQQGRvGCuj2pp1Aiwxq?=
 =?us-ascii?Q?dLvqaCXQZ1m6Oc+xA9L49vw5xV/62CAvxyrK4c5IIvSFPUJ1McRGyOMO3bAl?=
 =?us-ascii?Q?990TGumIUBCAxKzgLkoBZszfBky+WHw0TmcpBp+N1AcnPWC8fDj2lv69hbLe?=
 =?us-ascii?Q?3owv5XhTAs9+PBjUDYLyhyyCM54a5rkbmQnU31c5xADHaOpec1vAYkqJiFcp?=
 =?us-ascii?Q?L65Bb0wALRbpJntc/Wk2bbsVB2abKvK8/DAMrOH+wsuWx1kpjkhk2+Hfd/a7?=
 =?us-ascii?Q?35ae5cvU63q3+0+OvUW2Ne2VoBBTAhu+l+oOWrWHuHpx0BTXhZJJaO6lLD7B?=
 =?us-ascii?Q?PzPAFTyXATwIjDeWgBaJrtgmA/VN6fYoxqEBpYVAzjTrDVERlZnIjB58XVsR?=
 =?us-ascii?Q?Y2mBnC18/bb5HW2sW4qTsgACUu7OmTqw3sT4o6JeDh3kpgkjskzegg7K3N3d?=
 =?us-ascii?Q?nWS4RdZB9Rkmv5K9EfF1h1Lb/DWmE4fC3bVC6lcRzp0SWH0MpYUvYbEsWndI?=
 =?us-ascii?Q?q4Qas7S8vtQlkX5pAVzGP2D7kmkOFficJnX5246fE9lJDj4FmygmmBCBeoqh?=
 =?us-ascii?Q?4mKrB5SW6+LzAyHRraomBqCEJQx+di9hdNu0JnbUlvlRRVetuDWvCjgdM5iV?=
 =?us-ascii?Q?oQjCScfkzoNDjUsge5yQdq41v2l/t3qVqKyQF+v2OwXdl8ChH3XlifWSl+W5?=
 =?us-ascii?Q?wa1zSZiT9ie0xsDs8/3BCSYYyee5So51kZeXMOhvPBs5kg+WFjSBDv+HhSnq?=
 =?us-ascii?Q?mthDu7efTMaLwdu5emMNtnn5bWn8eN6hhJD4ZbxfNvQf6pF4/SWzEdNmxRmo?=
 =?us-ascii?Q?8sxScqNLNp9vNML7z2nQKW79HFKMARx4gq/rtu56NIOlxs41/gGQUg+xEc9k?=
 =?us-ascii?Q?rHEmTJQyA/Lt0OVOHBnbNtGgw38Mbw+/O1I1vI6txLDRctlV056dJJiL5YIb?=
 =?us-ascii?Q?Vqri7yEEKV51tMVxTiXcJgEPKuhaEgwmpicm8DcDKeaG4qniWmUNiTqN5vft?=
 =?us-ascii?Q?h9pT/apa9ztXC50vPfWYvF0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379d21ea-2f4a-464f-c77d-08dd56059e8c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:33:49.2707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLSC5kwmEKYXBzs2qakABRgFpLRR6hIL6QKMbOWImxN5tTjZqA510acE4tFStJwBJM3EGPGrTmMHFY6v3zUbOA6SPxZh8jxs8AMZO2iTNB2XBeCqgR1kjxNeqXI0jrdn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10414

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt5663.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5663.c b/sound/soc/codecs/rt5663.c
index 9d32debd3689..b86bc0285266 100644
--- a/sound/soc/codecs/rt5663.c
+++ b/sound/soc/codecs/rt5663.c
@@ -2814,9 +2814,9 @@ static int rt5663_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int reg_val = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		reg_val |= RT5663_I2S_MS_S;
 		break;
 	default:
-- 
2.43.0

