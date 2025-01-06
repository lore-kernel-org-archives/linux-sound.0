Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010049.outbound.protection.outlook.com [52.101.229.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E899617C
	for <linux-sound@vger.kernel.org>; Mon,  6 Jan 2025 05:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736142577; cv=fail; b=hzfqm+q44aJAQuD8+GTp1cutUtnw/7fh76EiR1yCzMkvs05LedNb8BmF+xQsuMYMF/QGmuL9BDSXhWG1lUHu8cVG5pzNLJwvSvqsGnB+dcBOxZbA5dwjKMr13fOCsOIUE8EQW5gtQaRN6Ujkm9OpzZ8AUG/RzHwQh2TErtXxOH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736142577; c=relaxed/simple;
	bh=LBn6g11xJEn5O8cjRKTJLdVA7WnEkS8ZBTd2AqBQgLs=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=oO8Hx9bi6el/vtr2CjnaYQ0TlIdlKEPX4QJb4AI9yEE6z4Z5AQ4xM6RWjq8IpCXDoUATsNxEoMfbr7KMUQ5HDrPome53onk8lMkDkKpzfvgrzjZC7UUMGSp29qYhxrf94GA8sMADHKobrj5HZYq1Wgs5rYJ5Gbxmhojkux/otJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=j+EZPOri; arc=fail smtp.client-ip=52.101.229.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="j+EZPOri"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fwX3BTKndysuBB2Nh25v5X/9qJOOvvXvGO6BrKDaDRr1E2V6ymRCMxTxLpliUbO/5RvKQcvcB/+CpPSvtK7oqBUe84DQWIBC/IwxSsQCvE0OSJtwSknRhVnOn7USOrMmzkdWmZa6slbrn7J3WOH4IsQAiw7ns4CRq5mV0J1BHQkSuIQR8Jcw2YjKBApg/xh+jibKEx+9nJhnYwNuFHREb/MNbq2VJvVnved1iqMwRmq6XzQxQ/kxc1YI/5dRZw7QodsDZoOHuKPT7L/oUgfnMRwiDzNlughetSt8YISl8yCiEkitL+UeTs8tW8ZwuH1vMMssNtK7qCzqRg36n9Zvvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUQQ+4ZbkQkz4KAmBKMiDOPMK/+30sxXNCa8D+sYDDg=;
 b=OqGjn1olp78grMRXs3/Zw8G9c3QYn4mOOn+6+/WICJkfsLSOoFjtUz0HIXPamrrtjfYmatATJlZUycl/Syp2d0Doi85TDkWdAxb8mi834Lz4+rz0zNQnXK3PkDKkUEkxdssZGje6h3kmN5nofMGtZWrN7LVb9J4mY6CoQZXQ3xIGVIdPS9cnmN/PkO5ngiF6EIVmXD1/J0qcpYKFpJS4KYsmNgyuGhXtdBs283Ha/ISSVxQTtH0NrxMlI6cOhkcHDplJlBlXHIVA1c0vNshyXbDXlYg6NL8WkKZCHVmVblhWyB0vxp+TxkTWmwnSpn7CM8QuY/qaTC1D8JTBT5peRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUQQ+4ZbkQkz4KAmBKMiDOPMK/+30sxXNCa8D+sYDDg=;
 b=j+EZPOrik/WMpgepZJIeHda7kI+a415JEHCAgp+oMCV6KmajRvGrjJV4SXWigLb/PIvjJE1yRp4mcYKALb/wxn8so68cwt6LOmNs7SLyTtlnZfp1PrgTOKeufrzB74eTFDhfAsqJSi/UKHqZKlZ5N4pKGiTYF/kvp3PXQITLmbI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6247.jpnprd01.prod.outlook.com
 (2603:1096:604:ed::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 05:49:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 05:49:34 +0000
Message-ID: <87ttaco5jm.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Stephen Gordon <gordoste@iinet.net.au>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
In-Reply-To: <87zfk4o5l2.wl-kuninori.morimoto.gx@renesas.com>
References: <87zfk4o5l2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 4/7] ASoC: soc-core: return 0 if np was NULL on snd_soc_daifmt_parse_clock_provider_raw()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jan 2025 05:49:33 +0000
X-ClientProxiedBy: TYCP286CA0297.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: db1e3949-61a7-49e9-8e1d-08dd2e15e5b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?stN9tXUiAEgDHGcLuMusE+jxUCahucrwLTjwn+a9cUUEgQEdSbLuhaMDy6MW?=
 =?us-ascii?Q?MRkjBep25jq9gOjlvxylCxGaeurn034ATf/PrVJKOmZ+IuRB3UmIXitu+909?=
 =?us-ascii?Q?6UFaxMJD6GnqTG5Y8QO65gIc716BP4SWyct8gGEeBKktlYZMs6uD+0UT1s29?=
 =?us-ascii?Q?JMTDLyBpfzVjvttvBFp4LsVwr9QNHrvVLLEgAqM2b2zR6oiG9+w+QiEO9hId?=
 =?us-ascii?Q?ZEvObmEGoB+QLVHNAqjw5qZmtm+i4eESd8a7eKUNigX+24X8VjsiNzLnZM3c?=
 =?us-ascii?Q?aYfUD/n/cJ7w0jxt1dNS2ob79BT9Ka8sh8Jgqe48DWS1jmCbA+k8WNWAy+aR?=
 =?us-ascii?Q?g23HVzbkyh7v/3CnkkjeVA6CEQn6SFPjTbVe4zL4M3o8gZJF8egLCSL9rn+R?=
 =?us-ascii?Q?XChBENl+m1vtpXdmjqBF1n/g/ztQWLutnZu5AC2PRgmEX8eD8Pj7CM9elkkO?=
 =?us-ascii?Q?zXIvQDDBddoFrf9db2k4aPa9VDJ1ECzm1kFuEO9LQNg6oCto51XPGq0I42Op?=
 =?us-ascii?Q?7l4ifiRMMZFNc4JbbUpca3L8lTo1Y2F5W8XOSJg6MESG3c1jdtk+uKUXivIY?=
 =?us-ascii?Q?Zfb8HoMRZBS5hs3ozuiVHjn19Pbr9fJwikeE7xzu5aGRW9BYJdGU4fxh15fI?=
 =?us-ascii?Q?27yjosOVYaOTq7+VPKkYU+lZwrJREIEmGbtbdn61i9dSz4MehJSaq9gsBiaf?=
 =?us-ascii?Q?c2ftBurNoqgYf5h04dsQ3xs4VY+Q3b9JdP49qeC2K3f3xrATvt0/OCM8YS5s?=
 =?us-ascii?Q?gBZwRSQ2rE30bNKKT8q8IqrKZA67jFCZsVaCKAUkKiPccIGXywiqnD3cUFzy?=
 =?us-ascii?Q?bsfo8qJln9eNoYu70fD7gF/fmiYMwPcWV7LrhX2ppO5vhiF54NbfUJq/jbqE?=
 =?us-ascii?Q?Q/01XIGO23JckBwjj4jKl4pRlZdl3P3wFoaeJ1serLGRrpmd4wzGo69NlVN4?=
 =?us-ascii?Q?UZ/RNeqx12UlUHy55LqLmsYSZdvTyZaBqQFmwDLrMeI1wHzVgcVrCEvOQaja?=
 =?us-ascii?Q?OQWJWDh+ZlTEV1ZGFveT8InpNossukiteOVaqanlRQVoIQedXOuwYmFRiUUT?=
 =?us-ascii?Q?LB5qSHFDyFWyaytYwNhspvt/+VHC6V7BEQTLCGB724OfjGDBUoEz37pFFmeT?=
 =?us-ascii?Q?nYz9SddFcUU3bJ9hOv+OLTLNRJpmLTYQkBtNoA6eyJo59vs5kvSyVaDfWCST?=
 =?us-ascii?Q?JLUMp90y1PzOfSDOEVw3j96WytEcMgsCAkBUJyulaKHWI9ZAo6ZneYvQ3s4k?=
 =?us-ascii?Q?iEh30WVLrNSyPPKa7Yu6LOj8OXX/U3shDq65A1OL3M5OfjmuNaFd6uPtZyJI?=
 =?us-ascii?Q?5LKObGPYM0JWfm4ZyeiINQB+0Prtf702g9BBxdp8RdV9DOhccVz6mvXallKs?=
 =?us-ascii?Q?74MsSVcDqrU74kHtj57LZE72y39NrlNcIzfIJZd1t9007gkrMyaWz50FecWw?=
 =?us-ascii?Q?4JNru2ERnuPvjbZiQJmCEmAYWYvh+I0s?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O95E0K235mFGJtvZTxggw2Fuxxh0HjMRH5rSGN/zV44+ebnOBbxl0l0R88yb?=
 =?us-ascii?Q?jEuiYFVD0LxRPHOp5OzjgXDBTUkUsZBwP6sSe9APPdunshn/kSmJQ5AzrvE3?=
 =?us-ascii?Q?AiQw0lA/dl0cQ3h3zd80elMNTRYK+uHBu6CyDI+bfn3x7rmjinX6BncSsZAF?=
 =?us-ascii?Q?raoQMNogil8qrWHgOUocHGvYRMs6x2bjPBfMkbo2Tg79gJFzma2L1+XbwxJr?=
 =?us-ascii?Q?xoEW0dqM13IhT8VfDyx5nm91XhlOouxPxDS0zH/J3q4oY8/9gv9cN21Z3WtO?=
 =?us-ascii?Q?ngPWgn6wM0XpPH2mcuumbBp8tIUjdQ1eVijTBAU0VOGd7/4EVkpjKMzuX/oR?=
 =?us-ascii?Q?snsz6pc8O9MJtAMPS4t9ZnlOWGBwgSDmeQbnbd2sXZOs7M41DtHlZEhuIdda?=
 =?us-ascii?Q?i5cca71Qm3vpan8PWtyP8i8zK2r2n2M227Kcjr4ygILJhLQm5mmWxhQgiWlI?=
 =?us-ascii?Q?3LDUP3HhcjAhuiyuYbQK+zQvC5a9CSYii9R2T7NKb681K6cWC+aNauyb3PCb?=
 =?us-ascii?Q?x8o3t4tSJoBlKcAlmX/wjMosfKhAC+rjwUXwsW1iHUvnYjwcobfVlb84ptEG?=
 =?us-ascii?Q?YjcQEHLVFRkfPY0pZ16n7bhC9B/lreAA1fboVhOFQ6YViWlSfoBMfUC7VnTG?=
 =?us-ascii?Q?6+14WC4g9u65u1CWus0bO+9pnSFIxCwEjp3Ox25tAcWbaJpbCv2w3aUa3DeV?=
 =?us-ascii?Q?A4jXTmErmVbe2uQ7/Wh37M5prv2whEXp+CxzqzDeqDHshhq6bdS8TZ/foZgK?=
 =?us-ascii?Q?w426tBYTO3Cxet6IAWeDW7ciQGOMck569XS1LI79QS6m9bDoTnEixAVPjki0?=
 =?us-ascii?Q?An9/jr7b7/4HL/FPmeTHrrZAYEdbfoUKDEd6zGC6WDdnAsgkB8cFLZ847wfo?=
 =?us-ascii?Q?+0adbWhS9ufeTc5lIIuxETpUqbzzGN6TBvON8m1MSUh3tMbinlYO1EzFt0m5?=
 =?us-ascii?Q?ASne2y+oXWUeIATJWgVDSh3Xmce6QaKJBGdGVqZqvObZPjaeg5KbDaMSd0Rv?=
 =?us-ascii?Q?w37WhyXUeaW6WAWpSf0S8YNlOTKbyA4r592ZjGwlO88XngTIRQRFoQk4UvDn?=
 =?us-ascii?Q?mI8FvAOhuyeKmhZPHHE0dv0X2wQ54YpIUYONRQcxOU/dhS3GQGD5sfSCfxsl?=
 =?us-ascii?Q?7nxxbbgbU6ht5Feg009LpPA5otZghxbMGUyubnd7U4G4RlzPRZEJatiJr3nI?=
 =?us-ascii?Q?OZBZdXq2hQ3rHf0NOe5iQP1hfENQEOCDefIxYn/GgFa/V0PUtmVYIIKe5L7V?=
 =?us-ascii?Q?viKuXO0KpZJ+sZNDNtq2nYqfnTI23r60DNVTMhsPloeX42hUCpZyy2eD1GVC?=
 =?us-ascii?Q?MujIAlgugS7xHep/CtIKB98azK5WEGZYfsllzgrogS9QKzeNYrLd9G7+7WRP?=
 =?us-ascii?Q?+ZF7EipZV1Y6fDUXo4tbvE1pfWPzcxAR9KExi8jQOjU4sS9GwrsBr9Bl6jWl?=
 =?us-ascii?Q?pX2Pb5HkqRyjai6f2n2uQcOp8yBXo1jNli/Ttpgiym0SQPkMmp7pZynfgP10?=
 =?us-ascii?Q?KVtiM3jm45pI6hyd67EQ2M6Ga+T/JTtplR6Xg6n1ISvvq8lebXFPf/K4wsOS?=
 =?us-ascii?Q?yPeofgmdtSGBTy1KNgHZRfOjt7uh7L3PggvylwMI1Uck1umkO/igHF6zaM1E?=
 =?us-ascii?Q?68Y9tcXTBaRnL+oRPZI+jg0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db1e3949-61a7-49e9-8e1d-08dd2e15e5b3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 05:49:34.0380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9npKSAxPEEY1iVawLugiOkcolh+G5X72AiaRIcBq7WacccyMpo0S9riAYdNLtvvcKzGA4PFqoEmOhOPTM33vuLri3Ef2u5Z6Jp5vDF3VJ+FJWCfWMYQKWeZHrJCRueuD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6247

snd_soc_daifmt_parse_clock_provider_raw() might be called with NULL np.
Return 0 in such case.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 710c278e4f36b..31cf499e3e79d 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3390,6 +3390,9 @@ unsigned int snd_soc_daifmt_parse_clock_provider_raw(struct device_node *np,
 	char prop[128];
 	unsigned int bit, frame;
 
+	if (!np)
+		return 0;
+
 	if (!prefix)
 		prefix = "";
 
-- 
2.43.0

