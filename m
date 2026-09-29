Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010002.outbound.protection.outlook.com [52.101.229.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B88F2F7EE9
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 05:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790659787; cv=fail; b=EWRj3vni0Jengx1Ms4Xfl2+TmkzSXs8FRzur/J4STk1EzFEiKeZcjqYDHpHOhs2MH7rNLab+iX9zaDQaUk/YC5dfaX8vkYIiAPU9oKOEndkdqduxuNqppa9u3qoli3NHD3Q/fS53Hnrjo28g4kj1uAJKlE4WyoC2KnYXBJA7YQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790659787; c=relaxed/simple;
	bh=yE9aAmTZoN3Ii5F+e7uHzeNw1nw1kpEiUHKXPuYU+es=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WmYmsYyVo0pXEQr9c82RoIJ7/cSoLOJ/xX9Q+BoO8Q/LuyeCj9cyVYcewv9K2kRsjkHZ5YiKlTPsb9HHDuG3VbjNVJ3CsKna7DJ41hCYifaD0DyXppTL4Hw2WhXVfvEeRx63oIZ/sRS0nkLHvkEwpgodRkeoHAMD4C0uGOVtEWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=owf/4vTv; arc=fail smtp.client-ip=52.101.229.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="owf/4vTv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3hYH4W/eJ3DRKpMxqAf38CSG2zesl6IjSRtRYUK32uEPpa4QSlNwcZB2BZXKHJ2aphABhHcsikLfXqIQF564lHp6EBSLqCTX2a3HSjHllEOmN/2Mp6G1Ntk/7ueOkfr5R/334d7R0y1CtbdQ2en6Yt8e94glUPJhi+aI9QG6mJ8lC2TwRqv7HttjdbbPd1Vos8bSdXCF5RWEkJL1HwkenyUajm/3uPZNnZX6umzPdYOQeNflu+3c439H9gMuLMemb0tToqx8uAJQVjx6JsNd/m91X8kpjSz3owV1gxoC/b+MIt45MyjcRU7FmD4cAYsE994n4VlPNO4CYYnHKermg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2WzOhRICTfgX7U6eubpGL9NV3roiGfGUmCqd0O++tQ=;
 b=PkdhcEQYnnWVhyljSh0a2Ks5VSGVkWTWRtBhQMFOCXN/yX+NvOrgn4Q+iPXEljcJNlRg+tu0YHEy3qBaKu5u87LzesjGLiaT8cO4WyG7vf/zOVUw3dtRPz1WqCyPjlrQuFiLpUqkYONdwKJeAbGharcHdrnvhoVq2mnDAQWRABOFtTNtIIxareUpsw5rFX+8lsOWs2n/JD87bDQxYTIeGYZIEzZMkFfQ5+99R1IfYth03ygO9aaix/iT8DXda2cvYpIeaEkfsCQHv4gtqY4KMv7CNV7tKJ/Ma9iaR4F1UFYN4qvjcXIpwqBFbFuTspjozDMTAqCAvO5XwUWYE9z2bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2WzOhRICTfgX7U6eubpGL9NV3roiGfGUmCqd0O++tQ=;
 b=owf/4vTveCIVx9uhE7FefXKUvFDj5OsH7e/ow3Lr1KuHaZmsejbLc5+FV4BRSv2zLJEfDt0/p6WqpVIIGWUsXkcZjZuKyfENEMO4/TgRGfG2cHFOZEAPkqoaAsqIYiT3BkrNDgg8vEEpeoMfFuv3hC6O5zweROGtW+RvVlBYGCU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OS3PR01MB8890.jpnprd01.prod.outlook.com
 (2603:1096:604:153::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 05:29:44 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 05:29:44 +0000
Message-ID: <87mrt0eibc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/14] ASoC: soc-component: replace bool member to bit field
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 29 Sep 2026 05:29:44 +0000
X-ClientProxiedBy: TYCP286CA0350.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::16) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OS3PR01MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: 12cc2285-0ea2-4d14-4c2c-08df1deaab29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|52116014|376014|366016|38350700014|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7Kxfl0PBLn2Ro58WllTUSl1qhBzAZaAJf3fbURDvhsk/SXqvLC3hJTugNqp38bSiW89lLwyMjJ01vTGVwy5kOXFHJBApyZSbkN1ntUqM1ht/YUun8PX6qvjXs3Z4oLG8KxUag37Hti3YCDjDnU0U8x8QMwqiWwQAdjK/Hs4GbLcwQg/xJ7xpZtf+7BNbDg6rGyIuWxz5vUyTqP1WxYlZLZ2HKDdf+TwSXWWra85FajHLHlPECP1sySZYoPQSBogLgD1id0ARjnTzclVvCUEwVu2+qlGloRhSYIP5F7qAvFSTTPH+NCnoflEuCpaosasUJcQT0LMJtJfLafe3hcfmdk4sf2qQgNXOa+ngHiDr3Wh74xqO5m8C37JFQQqHZrkg6hxfjzSO6DsRuvI1gXx27o3yG7Db+R/UC5LpLHqrQ6+0LJkX5RGHPTriwOgSsXxFRopqtkhQWp5NCZkWzeRoA/3an9D6Sf8UooofyUlNX4plQG1XHBKFaMnKhT7QZsQKtkN1izJzZ62Nj7AYWpWzbPDxFm1Qny8qny1Ai09FylwRZSm+s+vjOCf1zTQ64gO2glFvUdPkxTm8gRPRqClKW68jSPe6jiaFkPMHX3Tj7FpcgUHL2tCzVXI2OVkoJW+/hoGFsL4AY9U/ja4OBPqRuYx2xGc4V055hh8bh8LVXLfMvaHje6mV9uoAJjaEIB3ZMZxZN9fKxY3GWhEkj4JSEmoY5ZX3L+xYAltq8fA34OA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(52116014)(376014)(366016)(38350700014)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?10M2KQx08yMfIl8JMtckrwALb8b4qjRVuSOQejs8snIr4iLYT7xkEFR11OSn?=
 =?us-ascii?Q?xTR8rSahnofUA5n6zswHjj01ZGuVZXUreUk/SoZM2GcupbwgrAz0v6OVxtkg?=
 =?us-ascii?Q?65nxxITZpO50/mQ6Zvf53jcRnwF8XhxYVvw+5qrTb9kw0o/5W7ZEO98zIDbB?=
 =?us-ascii?Q?st63XlmNy+gTR+IfaQFout+DUkvN7J6S0Sv9MpJY78cqOUEbrfaXI00x5PwH?=
 =?us-ascii?Q?Q1Npg5ANaOjga10uMHgfLn66V1Rtj45mUfqT0Mvk5yyWwiLAWjL8W+6Y4ur6?=
 =?us-ascii?Q?oOb3af5s818BnfaImD4yiNEvy85zj0o0+HnR/qPq0qTpFu8qo7NEtLatC2iT?=
 =?us-ascii?Q?iXEV8/+u6jqQNGPPuS5FB7rySZ+sUu+1z/gpWjkWR/Dv4Ilf52T9gm9vv64I?=
 =?us-ascii?Q?uiYIS3Oi+0KyC7Of1dEN5+gGglBT01HDYykyr4G34DCNWk1bIgHmdcDW2a9M?=
 =?us-ascii?Q?MaEkh2R6Jz8FByZkpXVpuhzQqmsu9GzNFiRBw6S/Y3AGEsS1GR9wYP1b/mvn?=
 =?us-ascii?Q?SLHVkUl5RwujwZLvfDADCMFn1FNr32MFdif/zTOow4hj3x+KruxVx+rIKf0g?=
 =?us-ascii?Q?T/QGGv9SPXeT0JfbfX4UU5qCXifoRpU/ajRxAYiTYzzsyBXad8GGykKqdlKv?=
 =?us-ascii?Q?cyNFlwmCyEmoBaCJK1UZUswGtQHKki/vP9lcmHXBZPH+TQDYtJKD2uQHXQ4L?=
 =?us-ascii?Q?fkFsw6/VxaD2WqqAg1+I8mWQMeJsgY5p3/Ov57u0BRU01IDiTmGsV/nLdIoT?=
 =?us-ascii?Q?H5R18IEXbVJuunutdcHN49GtnEiNWzq9JQLw9czDYBlpnGeRBdwcwF2ZYHb1?=
 =?us-ascii?Q?SV6U5U5EiQMbTt7buJr9wRV1ylenjV32fP4ZUFZ7x+0jmD/tuG9TXT0ZzsuH?=
 =?us-ascii?Q?tm2vs0cwBlBAMFNIvF74iQK0RrdY0fSF9CAraxnoK/EO/R1S+gyN0VW9XUfe?=
 =?us-ascii?Q?RZegDS2/rYlxwIzEqdewbK02hxOBaKL66aBvWi5ixMLmH0mfppShc2HZJvnv?=
 =?us-ascii?Q?4UNF5Jq0Q7sbF/T/BMajQA0w27HZMdnBFTuRSttgmPnnnP9vi49cqAuK04lT?=
 =?us-ascii?Q?mhC93LsQyWXN9jNNHxn+BOQS77DYWyqxdJd/RLc0cp8N3dFBL0Q+NWo1MHmN?=
 =?us-ascii?Q?zmC8JNpfXRvJlHwPaYNc6zZpo8tbeYdYFLBeh3klZ+aYumo87Ud6MVOxxIif?=
 =?us-ascii?Q?Um5AVNdRZIP3xvk/mYMLKqKxu1UB+XXb9vpUjpdgFdAgGBcF4d51XlN9FjG7?=
 =?us-ascii?Q?G0qtMQY+4Z85KxEuxoRVhS3iryiWx4nv9enMyKu0nEW3fHm0QU0biAnMEl/V?=
 =?us-ascii?Q?w88yDAdwFDr/yJ72V3Pn4IRCRUZ77TLElVg14hgVRxv4IYsyYbk+eC1dUJWU?=
 =?us-ascii?Q?VrMg43Wxx9hHz9d+NUeGAnNE7fw5UJ/APdNeQZG53lP2BkMOSseB5XhSR/Pl?=
 =?us-ascii?Q?F8qqaerxMmKSof74BcwYbuunfY/nI8aj42DqiZidvsXgZJ1PuIv6QrWCJ4Z+?=
 =?us-ascii?Q?RXmxgUaTJX/mSFDemLSC6TwfDo+eIARXxr0dwpUzz0i4iuzJSbTo6rnVcky2?=
 =?us-ascii?Q?79WVB22ZMGaYxLGvEwjG4DilwlKa7WDTWRh3RuUSJ9OWAcdYf4tGtqIa9eTL?=
 =?us-ascii?Q?YjC+UdS5cVb0CWFvQfstQE1QkBiul9Gr3f7YVhmIQH3dgQqICijjX6vjMqVw?=
 =?us-ascii?Q?acGVJdgds8o2NQz4ndscv+3EdW47k6tq4FTC4zzktJfas3j+KEgjbjUwChTP?=
 =?us-ascii?Q?S2U7iPkMCDa/V4VY/cKsEUP3n76pbC5QcglzlFfRaAMY3Y6voQhR?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12cc2285-0ea2-4d14-4c2c-08df1deaab29
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 05:29:44.2254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6rnJnqo67h2l96AZ8PhtBkPZ2HcFtwG4i9w/iV/4yb5Nc5oVAR2qwJXVQD+Pgen+MyYmbu39B0VnaXP8QD0n8mIAd/lYssNY+DEpNLac5nQS/ovHBPQ6KTMGbwz0WL1Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8890

soc-component has meny bit fields (A), no need to have bool member (B).
Let's makes it as bit field, too

	struct snd_soc_component_driver {
		...
 ^	        unsigned int module_get_upon_open:1;
(A)	        unsigned int idle_bias_on:1;
 |	        unsigned int suspend_bias_off:1;
 |		...
 v		unsigned int legacy_dai_naming:1;
		...
(B)		bool use_dai_pcm_id;
		...
	}

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 2da196de6b89c..734dc44773e96 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -196,11 +196,13 @@ struct snd_soc_component_driver {
 	unsigned int endianness:1;
 	unsigned int legacy_dai_naming:1;
 
+	/* use DAI link PCM ID as PCM device number */
+	unsigned int use_dai_pcm_id:1;
+
 	/* this component uses topology and ignore machine driver FEs */
 	const char *ignore_machine;
 	const char *topology_name_prefix;
 
-	bool use_dai_pcm_id;	/* use DAI link PCM ID as PCM device number */
 	int be_pcm_base;	/* base device ID for all BE PCMs */
 
 	const char *debugfs_prefix;
-- 
2.53.0

