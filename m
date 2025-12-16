Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011003.outbound.protection.outlook.com [40.107.74.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCE92E7637
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 02:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765851313; cv=fail; b=gszXk38/WCWOgYAlFVHDpU5Rlm9bCyQiulcdk3suqySSIdKv3zotSqzHreFdxHIw7Zw+I9Cu79jrFKfNlrrY+5VW9EzaT/wsLcRcwPdzmS2siIUjZgVZd5/b5w+gZ39Gz7lZvSjBAMID0QZfn/5urhaCj4ESeUVIgb2RHfOpZwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765851313; c=relaxed/simple;
	bh=tgLKSTx51n6IZ/jERhpirO4TSS0ZoVL3393EuZGebPU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OlKOQJM93xu1AMo3N0dNqziZ5/07oiKV9P17NiohmSCzYNfH1c2AN0Zlf4X1fnN+ymuuyYX+470EzahhuGl5ckysFztxZcE9uDQsyDWTYGalaVQvzXE9bH0qRk176Fcz5jXjkVJVfbrwZbsXqhHmXkCsW1PV7kN5rM5D+ryf5xc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Ftb2wqle; arc=fail smtp.client-ip=40.107.74.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Ftb2wqle"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIKiKMD9qL7l48llg5B+MKDxnmTzr91zbF79qmUsi54jTy5vgAaGOwADIzz9bTC5iP6rsKkr4hpo85kcnGwru0JInk3eH1SC2cbv0yfUO2gsncnmUxHjzeaBBb/7tzwpm8R3KENtn9Nn0MbC5kADWrY70VVZ8ZpFd38cnkNYovd8XC8EW/LbSCxgD4MiWLIC5qtPl3ukTi+BsC6ERkD8d+qJBUXNi7k6lVBO5sIax7wPh5cOFX9qsYEosrFiVscxWr8jjgfwTfddQs373FMAaVWrQWrca4r3/ROvUO3hNX1huPfCTfMrtqk8OxD+RCPe8ohHk+qFeMG8gDlkCfD1pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQgKpIIf6NCFnGdRIf0Ip/+jDDNxhZu3Al+JmMXmcLM=;
 b=NrnnGdWepXmKs3//K9z4VqDETEryB469PGl8pg+WD7MLkWEl2opU21P2JAiI91P9MRB3doZjfjvVHJ2KvC6zPhaT6br924FPiJtAufAxhP6NhLhKWR9ZVkD3s1spm3RrybaH5UgNcwaoxwUPu0X8+bnquIKhDFX+q7vNaM6Oy8aSsKdDGT/7qAZkzyzn43QwaGysKxGWf7p37mJ6qeBxErdraaqGZDdY1tAnRkbsMMQQQ8qDopAmTXXolpDzOHJykfmyZqPEUP//1pfeRVeYypwoM/utuiTo8AelfY0EZ6atZzTgn8jnMm0d9eJseR9hNoFwQE+gQdRYfwQ/OgYUBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQgKpIIf6NCFnGdRIf0Ip/+jDDNxhZu3Al+JmMXmcLM=;
 b=Ftb2wqleXy1q6OnmhH/n5BztP4NPVxXu+JNt1msPK50bLER3BkdJ/Op/aSMVwCFZNzo29iQraISkZUFoj4OnNWRNZY7VzkInwzk/Zv8rTARZObiVQVU1zVVylbCGkVMSVI0wR6IH15vFzF+k0wPyzXXzZPHZR1AUDBUic+lCDMQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8637.jpnprd01.prod.outlook.com
 (2603:1096:400:13e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 02:15:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 02:15:03 +0000
Message-ID: <87sedbrx3t.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 5/8] ASoC: soc-dapm: remove dev from snd_soc_dapm_context()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87zf7jrx52.wl-kuninori.morimoto.gx@renesas.com>
References: <87zf7jrx52.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 16 Dec 2025 02:15:03 +0000
X-ClientProxiedBy: TYCPR01CA0124.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8637:EE_
X-MS-Office365-Filtering-Correlation-Id: 78aaa56b-35f9-4ad2-f20e-08de3c48ec43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D3qq0jNVen2UxNC034uQLGPNyWFa83c2p+OKAWK5XusIwWjsbPDdnj59AwPW?=
 =?us-ascii?Q?vX/J+uelgk55weOD9q0z2gvpXoHJpGG5qHZoUW93GNY0d4WhEW8VjGVUl/zc?=
 =?us-ascii?Q?04+OLImdeiewkdaMAhsi1K5bahx89+5METUyV+2Mm/2rzhw4hv9X5RAFwJFt?=
 =?us-ascii?Q?r7lgXnEEc3sI/gpFDbhPsFbolxVDTNtQ/8ZQP7UT4JwysHCzGiT7gmZEmQbl?=
 =?us-ascii?Q?2N3pFu8DM14R1cqbQm8IPZlEdX/woyS04yYBxVmc9g0YsGsltTnauF+UCc6e?=
 =?us-ascii?Q?s2vmstFiPfoCHQWubNdi63DiQmKYgEBuecczqTFD6JB8ymzSGrYTGevblauR?=
 =?us-ascii?Q?6h/f8DrEouFfBmeC57vlmmU7sO9RLZI0B0GynvyzmB2lLyy/O+OiLrdKxsK/?=
 =?us-ascii?Q?6eoBTr9Ffbgv4eKyy7gSp4iwm2ccQQZehJSf0dE/fBsEUDXPCAp/Gg6zpiOZ?=
 =?us-ascii?Q?5r/q33QLTVEQS5ThQJiYx6SHx04tVoPPVqXbBsmgolhhX9YAEG0VKyg86kP2?=
 =?us-ascii?Q?W2Yg8RRezSGLoH013eNOClJ2KyHT7JBccfZIwew9rfuo07fi+12OyDyZXpQV?=
 =?us-ascii?Q?+rrvCrLGhrzmEETzTWChHnPCMizh0bCmJpfztuVzNQFwU6pyEqwkbZofLlGy?=
 =?us-ascii?Q?GiTGvw79P0mfuKaJZAgJqiJgcQOOr24wsZp1cXfkXVo8xQr92z7XA7sDIwpo?=
 =?us-ascii?Q?z5yd8ocvM3vs21TicN27Orr0ntu+ImJDdK+Y6ZXgaJuc8584hOC16MUaMnO/?=
 =?us-ascii?Q?r5GjLdBwOW9UJ6WRK08ui6dGQ79Ix+pHiLJ+YVKYuS3H8WmNtmoLqc6mjvU7?=
 =?us-ascii?Q?2PXBSag5YEfVhXwRRYkRcal3rsj9lLfvxkKMa1Mz7cT2tsqa4ueNJg6TO+5q?=
 =?us-ascii?Q?iAZE3ZTpRGJI75B1ApT55rs79p8IGHEsizVqIve40fAD1tpM8RYKAZ4GsMOj?=
 =?us-ascii?Q?uzWgVcKcpUA0phKXOPxz+jlhkL3/n3JKVEtzWoY11qR/6QHVNTwcTRnRKz9P?=
 =?us-ascii?Q?1zEb23O6elhaSaR6yi4WfDDR2p/gz2uEAOVSOMzmxZqGLUiE4ZhSt4bMemjW?=
 =?us-ascii?Q?Vzn95ubXjje6gq8+VbWQLOZlQt4Pfl78192090RJ8COU9yvK3eiIA6HqjvcL?=
 =?us-ascii?Q?Lf3JCpfTh3jESEhtNQQONHKP8GtigM8mts17zQqf3jIIGXTdVUx7XHFhy2Jn?=
 =?us-ascii?Q?AX7SvjoPxrnRXVM0Pj1k5zKkOKit1I+xm5aQYfcfN0Cyxgc9lNtyCB3lNM4A?=
 =?us-ascii?Q?f6o2Dr4bfh5dCOTGcbVWOtSlHFDkUSDsuQqjlPQTiA+tSFfAH7baX2HPl5C5?=
 =?us-ascii?Q?ypu8xsJ5LkxqHXY0tdUTWrEwKCLfiDQz44q4Trg3PAMx2hs+2J+wT4KMBDmK?=
 =?us-ascii?Q?qXCc/ehxJLVFF1tTMIq+qCNZ0bEsHKfW4W1a0frdtSluUp7Q666oek11211x?=
 =?us-ascii?Q?vgKNG9cwIP/8/TXCjAT2mWx2BXuoXz1/0Yk25z7pjMt9s2ay/tl2hD92gtmG?=
 =?us-ascii?Q?BWOV1UwdvomV3s3YzhjwG/zYX+XfiBCaOMlq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rr+4r4r5VwMgYfzXUi8gbUodTzaM9O9s/+1QysUYVAiSs/AIdUr1XsGD0ZJ7?=
 =?us-ascii?Q?J+WNaEURFYBMutJoPhCdsjQIbJGsisV6Xh+Qr5a6zu/LXQ2Z9ZGVVsbunPx2?=
 =?us-ascii?Q?Dvqj+r4eP1QYGwbHn7mbWVKRGO7xFQ8+cPrskjNavCKZkQYZV7A+dOyysS7O?=
 =?us-ascii?Q?4gjZYQNjN3aIYsuAwZczBy2yEUZrxLTe/KgHidVcmTPyb15NGyRMddcJz7iT?=
 =?us-ascii?Q?+/LrsfaKtWEGOLGDJ68qY7yTyCmspqjUTSqrEriF89belYvrFds/L/Avm4EX?=
 =?us-ascii?Q?HApexwK8HLbiwYPDg1Xvgods5ODCF9na4LUKVsrGBK4zeyFFkS9e+RjqvuyY?=
 =?us-ascii?Q?iXviREebh9ND2VS1i9AgNeZnMlfyYfQwHQMHkDoS2lDr37UMdSEux3oKOIF1?=
 =?us-ascii?Q?FF6IGRFvrhmdfcnFNPKFw0RLkXmTAwnAyw3Fe+gxkb9kSUDSF6jf3YI02XI3?=
 =?us-ascii?Q?p+M5oZM6bz4KL2KR9ja92KNG+PVXlZYb3SBHMQKRbVJw6j9Wlp8glqVH4hJu?=
 =?us-ascii?Q?y8gVwaj/8EC5JFLQ1387kOUWTPt4IcQ2Fozn8OozVAEmmxaHRCu/vqscQ6ij?=
 =?us-ascii?Q?sVM+Rk6HxrZyonjHjXkdPZYsgy2KQD51dUGldXxwdG2Ft4Izermq/GAnpVde?=
 =?us-ascii?Q?/AI9UhjLNIj2tBgdlfz8Ka7nLfdveadYMeHgI7GCcRfFgUo8GBnQz/tigeKw?=
 =?us-ascii?Q?zH2jAhYKwAMl43aUbZLE88HWuGhIoRn4/7cnQsVDh0cKS5LocSOSuJCWGZ75?=
 =?us-ascii?Q?4NJp74R2+AIPtFWetZtz8J8m5fBbU/Q6UDMZOo/d7uIXlplCvqz4yWkzdUDu?=
 =?us-ascii?Q?UK3Yqk3jw83etpHChnzAMLV/PYqphPFVsSMpgaH9XoMrxF9CINs/Dk188aTI?=
 =?us-ascii?Q?Jg4h5TB7ayo33wk0ctu2OYlLv+WSLKxHDj8fu/GV2FxOdb/sfA2ARl7/ekPu?=
 =?us-ascii?Q?KC5FwyXMs6zwGJmoFCBqdWMbkhIoxl5j9jgBKw1YcHQhupDyb7xHq3Is4l6t?=
 =?us-ascii?Q?/lsWKXkBvcggrDCPI3GMyw0aEppdNE0a2PHYD+Nvs2VhckgyYD4jNV1QK7pu?=
 =?us-ascii?Q?J/FWPpRM6rDtFrLWSnZXRo/Nx07kXcFI9uS0XwOpXkp5fb2Zf2CdiZNukBpA?=
 =?us-ascii?Q?Uap3vqDM2Vb6SC9ZH5+VkHfl11ZCsGn5fR0Sr1oKDaON4x0VAsIVIIcM9I5m?=
 =?us-ascii?Q?sm0xelQsfIWuk9RoHt0IcUUsh2+uZqF202AwtDZQxmoCC+l7EXX5FT7NPL52?=
 =?us-ascii?Q?DTZQqK7JSFMNo/NFURIFUgJYUNs4//AGad2n/UMGuqNGVSC/VpV+ifwNtfay?=
 =?us-ascii?Q?NwGEQheHxI2MyOe6+Cp8mYIvMkjw6dkwDRrQ6mHF6yVe4+c7zWGHviihgXjH?=
 =?us-ascii?Q?WTfcz+8VihGSLhexTjswYcBx8g0LLkTfqAvHpPsl73SYMimgkUzqs7+sYu7J?=
 =?us-ascii?Q?CJ3XDjAlrZJCzJNM6lIVTFbCJ1U5i+BsjjLGxqwHKN9BMYyJkYbajkUZQViW?=
 =?us-ascii?Q?HacVcXcsh0i3SCWkI52diBavocbzW0XzydRQHCVViG4JJTgB7MvKrA6OztcT?=
 =?us-ascii?Q?C9jFcKywZ1K0ZiXUIvv6vlQ/KN9hByIV46rS5MavwtwzVJYKiS81cy//QeVe?=
 =?us-ascii?Q?GuQzpCOTlblu0I/TYCLFC64=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78aaa56b-35f9-4ad2-f20e-08de3c48ec43
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 02:15:03.4691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rm9NZGVJBewZ2ufhsLWo1M+wvUX4J/CSsHY5KQgk/ep1DFAXN0/i1tBCUBtxsivYNZIjhUYT+eaCKpHwbMw4ZTC0j9Nlbaon4BBvzXkDlo+kF1xC6nVLYCByGWbYObR2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8637

We can get dev via snd_soc_dapm_to_dev(). Remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 1 -
 sound/soc/soc-dapm.c     | 6 +-----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 7d3ba38260765..010d63db5436b 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -585,7 +585,6 @@ struct snd_soc_dapm_context {
 
 	bool idle_bias;				/* Use BIAS_OFF instead of STANDBY when false */
 
-	struct device *dev;			/* from parent - for debug */ /* REMOVE ME */
 	struct snd_soc_component *component;	/* parent component */
 	struct snd_soc_card *card;		/* parent card */
 
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 4d920a59da3c4..4c2007c61ca14 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4862,12 +4862,8 @@ void snd_soc_dapm_init(struct snd_soc_dapm_context *dapm,
 	dapm->component		= component;
 	dapm->bias_level	= SND_SOC_BIAS_OFF;
 
-	if (component) {
-		dapm->dev		= component->dev;
+	if (component)
 		dapm->idle_bias		= component->driver->idle_bias_on;
-	} else {
-		dapm->dev		= card->dev;
-	}
 
 	INIT_LIST_HEAD(&dapm->list);
 	/* see for_each_card_dapms */
-- 
2.43.0

