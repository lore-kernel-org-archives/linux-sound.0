Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010041.outbound.protection.outlook.com [52.101.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEF33C9EEB
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152980; cv=fail; b=mLO14NTzAotuvSRM9GjLugw+iEPz4/CjOxtxzPDhrmhFZZtWwjuSjPm36HTxXmDufTJG0yNSqoD6060JEaaPCP2vZb+u9L4Am86Q8mC2cWgKKJpm3TT7sxQ/hmQXhS8VPuEU7E30/ec+7x9hjBjMgif+BuB2ahr8Njjm3XF6mEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152980; c=relaxed/simple;
	bh=/jG03SMSWASnaBfD22b9J1XOVXnSMZAMlYrnfFyrm3g=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=f5tgaY4Xj5tXPlf3WeTLnCRhBfCsfVKLQuI43Vw5VS+ViMWOZFqkOQ9n90s1EYXXJu0mpoePaOG/7qaOMIbkGGwaAe0DGPRfzzkh6j5N+KGcWN2GKG1l0KndxDXyY60YjZAJ+mVuIyrS3jYTkn9Hl8nthvw3Mnd/rJVfoTW+Ybc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UYpXAbFj; arc=fail smtp.client-ip=52.101.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UYpXAbFj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mLx/xhk/VWFKyRiAkz0IaESfP004IPygMlRJQFQQtJ136o0ARjnV/P1p9vZ47JEDxxuuonS9A0LbFJCLTtvmmDsJnoaK4LPNCa7x5/34yHGfvKk7fT9GuDBByVVwg4Kn8Zm2cvOclAcEMUx9mHIxmu8icI1M78doslTwb5te0eNy1Q/1tt4N7A0gZkyYDqBQdWbfA37btzSOK8G85qw8JWVu8EyrzkpDC7FsXoyDLz35t7bUvC8+XTeIxUc0LJIo1RkGtnDxFLIzFEJf58IU21vd5MDyEsE8cJO0B5Uy6Ux4FtCrdezU7spcUNVmznJp+Pq9u1lWhkpAlLYtZqIKfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdLcLo55yIv5bCpKK5V64Gz15sTIDjbw1JEhQm6lZoE=;
 b=gSwrMcE2pNdWZPDvt6cYE1UZTKNIb+PtC2E9BK4DgYdwgvv7DgC+LX/uvbRNeFg9cDaHofxT5qND+HtWMpsZSYurA2/3yuFFtJYcMIcE1b5Sz5I4/AfbEYjDHw51bQLJHHyLkh9xAsTgYd/zLvao2+4fDf7EzmUqxVi1h4tBcoPxBfb5G/nEzZj1uzTCMvEiZRmeAEswuOTjiffcuaCJxJ0gyBjuaOGNVGSgAX03wAolfGgC4bb0lR2TzAhPMNGMhvc4m0i4gK52DyKXhJhauzROMb0YO0VxnOkVrIG1aFNmG32uI4FG55ICda23YV8bQViFMAW6oHMEP3dQBsV3Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdLcLo55yIv5bCpKK5V64Gz15sTIDjbw1JEhQm6lZoE=;
 b=UYpXAbFj+OlhBC00loXTV6wuASXo9A33dia2rU1UkupIJnZ5vMNt2bIF/ZjMsvUjXbwyDPfA9s6b9XXNX03J6p5SH67CLZKUFtxOkGYTHcpPZVeR70/MLMyzPIxPRwG6E99dJ69SoYO5MjAGUl1EjOKbGlinK2UH+ZThhWmRIlY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TYYPR01MB12794.jpnprd01.prod.outlook.com
 (2603:1096:405:15c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:09:37 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:09:37 +0000
Message-ID: <874igaub8v.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 39/39] ASoC: codecs: zl38060: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:09:37 +0000
X-ClientProxiedBy: TY4P286CA0029.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::6) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TYYPR01MB12794:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f5cc4f-deeb-4ee0-0010-08df071e0dc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|10067099003|22082099003|56012099006|11063799006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	zO1NRVG3LEuCPsUJk9djvxYUlxQUSe9KPkZntKOiv1Kmwod78iVd1ExVhWTzMex8VkPKq18J2HZw+gXAPyaB1WpLBBApWvgNwvhegNDIXwHCcao+clrkoltV2u181Mmz7Zx6FiIkSDyI1vkpxltqQjx6sAxHo/6/iHqgRylD7Y08yvwpnATQM0sg2CJJ/ufKWFgHmvwaCPxmqtxm4QEj9aVZyrhAl1d6K+2ape26YrbaS5iQs508dX9epiMbrSbvTjA6upx1vcMO0ra1ySXrcPJxE3lmCZRhIZXfXvAO+N7ub9mDIaACLDf3y+FQax+pYyPZEGYIw8mMV7EESeCu3CgxZ+lx+b4WEBBf1x1gtPknj8k+GT9DezjVL65kQ2YRUPaiSgvRu1Dt741yrJtoL1+0FA61RPWZwPET2VdQ3WWrwJdlHC3vuNHGfPnVnrkLrVAdfNJwmXTqDU/OtrgroCta7gDe6cQzolwwhLSxcUMpjHqPw7aNcR0RODpc5cmPVgyClsSznEeT65w0Buxv2GR/x9jkM4KqQ1e/a4E6ENb/KoYqLamP8vAPztDfeSgzrQWMxA/wf0+C231W5b4kB2J944k64LszpweT99wNFbarHcMjxNuOYqa4vpv22zEaivZU7J0zg2H0ACE929D12TMIJRRdsYFG8zGiOpMt0/LeoJDdi6XJlz9BeKEyETAcObFamNwSRBcQpzHiNn3D2wYyevAtuynlPEkwENFii38=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(10067099003)(22082099003)(56012099006)(11063799006)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uoVUewp1W2x6w37Rtsn4aoNJQPhiCKYw4j1moG5lWNKWGM+Bf2/pz0ab4LlF?=
 =?us-ascii?Q?3DVna8SBZ4Fp2MQU6lA2oXGeoSqbABLy+y98P4EcZzShRVUO+4ioJJrh1K04?=
 =?us-ascii?Q?XO045WAlc5l4sTfIUuy9tCsQFJNf3LzvO/xcrY4vs6BDYIenpgBfs2aSoQKG?=
 =?us-ascii?Q?UgL30z7FlFHWw/dzzomok16Z4BOwXEBmcG4b2KAhtuJh0SHtCVGuotonfqTx?=
 =?us-ascii?Q?B8qTcGF1cCq8RRQUCPV/tc20amlPYhQ2kqUY9PC8PTiTv97G2Jsq7vfvzsk9?=
 =?us-ascii?Q?YBePX2Uj+RtQzSxGlMei0gwYDfMnFNM6fsCqhMMCnpPMy1KDdqVnrzcy6a8g?=
 =?us-ascii?Q?4niBtQZoiFf9rL5VCWo7R8jxTR73KNd0Aq/dwLrxGgfITSg0SKT6m8gsBH3e?=
 =?us-ascii?Q?xBzd15D96Yi9CtBcgazsMGoeRmqvC8zJmSOecQiz/c6AB1BuE/AVu8UGB68W?=
 =?us-ascii?Q?lruiWcFgVNcsCQ/h/YfhGNtNmAhBFdVtLw9dvKLLS56YJE1idFmtMfMYXvRA?=
 =?us-ascii?Q?KXqaFv99ymY8APf59HDOfzLkFLolSXS+GHFa0WbH6rWA4cahLeuww1E8mXC4?=
 =?us-ascii?Q?8sly0/H5rLBvmZJ4/RSnZBd54sLlV0jEbQp6czguvjljjiD/Dimky5UrCnZt?=
 =?us-ascii?Q?ax/UofHo/pD+Ot0m0dXr/+LcIne3NQAsIiBeEWvRxVN4A7APXOE6jW3T+AFy?=
 =?us-ascii?Q?1ZB+I0QWYvn5DGnFo+NXCf+6P3gxNEsYlTjN3nLYLzIs+rkbRDP9nYQkOwIE?=
 =?us-ascii?Q?A9uDIQfFit8ENgVieP4lfCyBK1LkD+sUZUU9qptA5S++lKCWI2Gi7SKbXrHx?=
 =?us-ascii?Q?dlS6qt4DEo6Upkamk/Qo2GJQCTuKST84BuGj850Ecb/14ZqP99YF8fme1YYl?=
 =?us-ascii?Q?uu6dmwjutDff1Q5MxPhh9rlByMJ+s5MnJlUPAOH5QxmJDHCMKTGhoXzl75Iv?=
 =?us-ascii?Q?PZJZMjTn8YFaMm9NzCO++f63ec5ERLOXlqtRE5d43TR58lIooKXn5crlS0pX?=
 =?us-ascii?Q?LXs7VbHwdlD7X0wnNRKjiI+8fO9o6YeWsjsrWT9ER5Xj2un7POcxaixtqiAP?=
 =?us-ascii?Q?Gx+LNrPKImEgdN/lhufdCmltC0sM0vaG7VRiLLVTqaMLJ/RuyEoFhBVa/sKX?=
 =?us-ascii?Q?PU3zwekXBZWgpCwGNnBvoTeZs8kp47XBBJTXGLA5bxih/tpe0bL4WAg2Zdci?=
 =?us-ascii?Q?xJf0ggAeysPvh3JXDIZrxtDJY2BW4/++VwWESXR54U5O/LLzmfh+/NUDY9NB?=
 =?us-ascii?Q?zQ4Di2KNM5ctPDjkeKcUN7mjvgnS8+9n/+MK+W+g5P9FL6GRPcHJiVrJ3dlJ?=
 =?us-ascii?Q?C1njfH+vh4D9UyRz9mdtUO+gfUebwxzTwCSJaaMKWllr796MpbLTFJr6SnHR?=
 =?us-ascii?Q?vfHLtlQ168259/K8gandXK5NhECbaJiYs+uGUJ7Lk3Hr/c2x8KDEwhdj8x/R?=
 =?us-ascii?Q?2LLmb4M7sqNvFEixBhOsTg/vRn0xXGk1R2FqPwCo9EstMH3O0FSFxY1p7+CM?=
 =?us-ascii?Q?lxw9qTTO/IK5XeBYBAXnPTJZI7O6ioTL/nRfAkpJ6pH3NV4VdkGDUvRzhsKC?=
 =?us-ascii?Q?4B3jvUu6KPjnK88plLIxHCv2E3Qf8efaLwItRAMPKQX74JH7JhrtdQhGOwt+?=
 =?us-ascii?Q?fcK/4qYssKFrgKZTk2C0Omeszm6XBfAzsCHoZO63Fcv8iHzAwNADRoyjzzSF?=
 =?us-ascii?Q?R8ZIN7wiTgzxUqsfqj/PTWGLDqBHq3N01hvK3Duu35h2Vv5Uep0Hepe8DMzW?=
 =?us-ascii?Q?vCoPRlXINDlsj8wwW1eZkaBC+eSBYOFQbB+a2NKL/fbV+YT7dzEt?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f5cc4f-deeb-4ee0-0010-08df071e0dc4
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:09:37.2296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fUaaLdyhfhi8DlBWlLkkWRPCJmM53aSFg3Wfoc4DSvaCaldtzU7KvCw/W+TKu/0hCt2Hswe60dgcUwqR8LMfD5sTgJwAeTrNNvRah3HfJpsnogs5ojQWDpBu6pErkldo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12794

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/zl38060.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/zl38060.c b/sound/soc/codecs/zl38060.c
index 894b8eb42e399..b7062860cca15 100644
--- a/sound/soc/codecs/zl38060.c
+++ b/sound/soc/codecs/zl38060.c
@@ -334,10 +334,16 @@ static const struct reg_sequence cp_config_stereo_bypass[] = {
 	{ 0x0202, 0x000F },	/* enable I2S1 + DAC   */
 };
 
+static const u64 zl38_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops zl38_dai_ops = {
 	.set_fmt = zl38_set_fmt,
 	.hw_params = zl38_hw_params,
 	.hw_free = zl38_hw_free,
+	.auto_selectable_formats = &zl38_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver zl38_dai = {
-- 
2.53.0

