Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011009.outbound.protection.outlook.com [52.101.125.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2D2433AD
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 00:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768868105; cv=fail; b=l7RiHBC86/i/h9jb+HhdBE2JGL6ICHetSzs+E0SfnvO8KOJ59YFrgS8q759qSL0TViE9ARYl1jNI/hHGxtOsiKvMAeAoLJHowMsT4sdGhEx8gaRpI5gDfzt41mqqqUOA5UJL0uiFRXrFI5vkdCLbuQq67Q4Rou+fUtWgMRfQsho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768868105; c=relaxed/simple;
	bh=1dSCb7ma11IFLJruWq8M7mZkx6D3Gm7qIP5kSOuK0sA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WxpZ6EB9lwAy0UJM8sSlzX089dlDaI7A5p91L3/xN9XHsSLsuBXMjiQHN7Ff5lMD+CxQfKQSJg2iVI0rq5xRZ3KOM+uQKq+BijPL1ukiqb8XLhubpjAwv9poLQEDV2xKS91GxrL6XJZwHMU+X/tj1Va2EVQ+JydOZeAljEqpc7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VQFEVEbi; arc=fail smtp.client-ip=52.101.125.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VQFEVEbi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zREpnS9AQomfuvEHIuvkFIdprGS70lhCj99PX/h4LWJaLBI2Gha4jJJy7kK/qwPCZxlApv1t3f2lVfXifQJESotslb4LtjuiEKhhIWc51JK1nGWblsUzczDvaOTBD+WaTt+9mckv3nez1f2LHC2K3PCEvPNPSbzB4wieLYr2BbSJBPmzi9do1H967duD5Sjhkr8X0+kyfCjKMfXocJvzwD125657bmE2GjetEK5CsfJESnGfBbGFnfSJhFCXq/TBzspdCThGzQIJCJ18pJLASjx7whJEypyjmoCugvLF0yqCVe7dO8ZDELXLKJT5nVtjlHwpgWVQOFrhFwhPO+u+KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DT1LM1fosqkSpDDltJH7t9rr5bRK3w8x+aichnERQqM=;
 b=NnwCL5p7ev5vBIxo9s1l+3F982V/K38AQ3iAFp/dN4/LekR+s+j9+kgEk6I32vC8CwwFIldulVQt5bWc9P06yCN0pC0MvbJ1JGNnK4eAzQhaguTbE1hQoo7+/XhAuKUQP9guK5XN00CRgirg1cPCmW4J5wcyjit+EY6UoTH/F7BZhAkooVChvHDHKuaEMfgcpMRfbRNDYRXzIhFPq06vRx/sXlzCHT1u6hi0So52BEcG0vwz2T0BT3SN6kk4+tW1oshv1jfNyGLmOPKpfn8ptQRjXIPNjP4fOt+5n4Ye/WjERhU8qNyZCuhI+SZWQuuTO5gKNj0yW2hp2iIuFbShcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DT1LM1fosqkSpDDltJH7t9rr5bRK3w8x+aichnERQqM=;
 b=VQFEVEbiMBzah18fyjV4Uijnm0zjhpexVTagV2RR9+KtjmsVMtxm0t1gg7+eYYVWi44VPYgat9yzlp8AXAcRBV3WJdhr4wKUgQSewlddNBlyMVeB8JkW392ts9GOFTkRD4dQdoYV385nS28v/GbEB6H39yduiK7zrbSEgZfbOwI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by TY3PR01MB11799.jpnprd01.prod.outlook.com (2603:1096:400:3dd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 00:15:02 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 00:15:01 +0000
Message-ID: <87fr81qgvu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 7/8] ASoC: soc-dapm: move struct snd_soc_dapm_context
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pl75qgxt.wl-kuninori.morimoto.gx@renesas.com>
References: <87pl75qgxt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jan 2026 00:15:01 +0000
X-ClientProxiedBy: TYWPR01CA0019.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::6) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|TY3PR01MB11799:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e77f35c-4ad7-4136-d744-08de57b8f44a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZIGmrazuXKbIVVYAHj7ZCZzChSZ22V2m2IY5BjNJTR3jajbStGu775JK1hVV?=
 =?us-ascii?Q?SB0OHUMP0utd1AybCgTKMnyt5B1Ml0/G7Y+723c1rUOFase8hjM01d+mswDr?=
 =?us-ascii?Q?pCENtOrI10An6OEDcru7SwIynURYlp3NhuT9ZQaGp0LPg035UC3+Gv+sOBYf?=
 =?us-ascii?Q?wNFD+P6zidh7heNFRld0VoA8KY4G13+TwGIdDpLjD2hO+yNztzLozl69+1u9?=
 =?us-ascii?Q?yFgfDaPNmQ0HWUpKS410YdhMKsVZwznwPEFfA4J06pPfkBrJ/7sEG+Q1IH/7?=
 =?us-ascii?Q?zmeh+JgE1b0B7OwhsiP6DlKGoGpdhYDLggyxAJCo2xtiZ17uUKVy6VkAwCeC?=
 =?us-ascii?Q?03uy/Snx6CG73iwyggK3Qwsd8QUb313VTVaikGTxLmq1/tyOQBpaBSS0HYlO?=
 =?us-ascii?Q?lje2wiAB1ix+bpOE55Yt9Psb46j5lJKTo4loGs2nW+ANsYPOUs82HpmedX6k?=
 =?us-ascii?Q?op7AE2K8mZFqCCiZfT6Z9JeIK36iE92UjVPt+EiYgb3w99psSpoSm7rA2Kra?=
 =?us-ascii?Q?kFNNezcy8tHtd5eVczkdt4lpMfrOToF8URF1/2kox6Zu7F36yQzfjPnPqRBR?=
 =?us-ascii?Q?mV9lqNCqrnhoGss7gp06P3wE5gGBJMI7XhsEL1rO+27YNASzndKp28pmmoPX?=
 =?us-ascii?Q?xOAsYIe429L/sg1u4wPqdfkqc0UABEesA5fRjPAVNR0rJeelmwxMk8xleSDz?=
 =?us-ascii?Q?ga+qHASl/8CdKvqUpFl3Ocowu19fMqnpaWW5YQU5euBU/v2G4D9ZbsQzHzeu?=
 =?us-ascii?Q?OxPXYE1ge1yoe7Gdt6oelmoQb+HQ3+tq6lrcaTorYiSTkUfA6t2EJZRKo2as?=
 =?us-ascii?Q?ir8GX78scEQ1qgY+P+u3UbLoCc2FP7oxXLeax2GZLxAqqL3+rHn/FYa+SxOc?=
 =?us-ascii?Q?oPpMTrENwIoXBkJIB6UgifX4Sjwvg7ruIePfAN3g3R9babEN6zr8SNaDRXRH?=
 =?us-ascii?Q?cXDEmUYeKWslXWG4mv0VhK8X+mSBkpJYqLOEsY2h9CpsCErFrQUG0PyPN5mz?=
 =?us-ascii?Q?67yQ6hstEamxe/cv8MSoQJviMPvBBQi5iT5LbdWlgyXJO+zMiiopGxjvM5jr?=
 =?us-ascii?Q?7gpBWXhkcMl44yWC2d6/7jLr+z9H8IenFpkwvDe7U6xBe+6eC8haMNX3Qe5V?=
 =?us-ascii?Q?WAt3EhkQJEbF2sJ/SPZC416gzkbQkU4SNHkhw7+WwopSsuYXzWKIgsnF7ocl?=
 =?us-ascii?Q?YmgeCDmL1NMVj5hc/2uUXvShMMwyJYKBodJqfuVDs+QMvTukK0xTrW1eGtTf?=
 =?us-ascii?Q?lXmi3aCxueuegthnP9xyoS0ignUJWQHGwHXn1BFmoyKu+D6TETkdULGdxhyk?=
 =?us-ascii?Q?nZ8VppG0vigFoTMxQMIt0lf8BDNaKPaCMTCNu9YiI2fTDfRtZNLtc+Nk/YxM?=
 =?us-ascii?Q?7V/ShymRlEmdTLxQeIV/PS8i/elX88TXZ36xQV1AlQxllrnryi0+mNrSmjXz?=
 =?us-ascii?Q?qXBfgkKUC6tVFgGPBJhR5GVgnQG8c12j71SmRBaZbXR37+QGzgwrKLKzruUl?=
 =?us-ascii?Q?yJbxlYjX8JzzMZHjuJZ4MPW8Y6Xtg561h1x5l+TVEiaExqqaYqGsQFEUFNiY?=
 =?us-ascii?Q?ityA+w7p6Qovoe68dWJEYDw6S+WJPAn0oGPWiQzRpNjs/FS8l7Q4jxFSuEL2?=
 =?us-ascii?Q?76oMDvtUVFOuwn+iAI7rTyw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zvsUdyMSd53qCnKmU1Ktxj0x3mYi4piOi7L2+C5vEkzzFOApS2wNH1R4tsyi?=
 =?us-ascii?Q?nnIW3FTzh3kFbllgohDjdTBI0pFrmNawbMUCl1oJ3Bx2JhW5GP7q/2y8wWom?=
 =?us-ascii?Q?UWp0EFpFSOfxAacdvl/tqa6sS8SXmikxGFd+8DEGvmNr0lE9GREDzuxcMo+D?=
 =?us-ascii?Q?fUhr9vTIsucuGOtMKud3cPFOmLFj/6fdJyiUfWCG/AGowky4KQ5S3OlYZWiX?=
 =?us-ascii?Q?fsGxkOp7OXNVPnnDgnACYrFZ7Y0hqGcZKxZEsICAMY+kYNl647Qe12eRBes5?=
 =?us-ascii?Q?wKDZbi9o+01WefR2DHojm4SXbSZCPzgqa8cIGxrwYUGs9MJ+aDo+xsrDqwVc?=
 =?us-ascii?Q?izcZtqo31a2grZA/i/aFoOBwhr4VpT+Vn4NIAxx1xyYlK1K0nRjNWK+uFG8p?=
 =?us-ascii?Q?EFwfCTjbR5f71vRkGty5Y2SigIbaTHh8FwhjoXf4IL6XYBYCNXODGbFNQaea?=
 =?us-ascii?Q?bWATqORmOLeRo5LjOBiUVhJOxxZ5hNwiQeiJOMRlX+rhYTJsu9VcVwniPwIw?=
 =?us-ascii?Q?ouy1lCuDpN1F5YBfH8P8XljdlF7tdphFUOBdlrM+Wgwqnpw4z7b8VYwM1N6u?=
 =?us-ascii?Q?fbdjbUTyYWrhIFwtveyxk/sZrLwQXTSvBAP4Se0Rc6ImdjwSQexv3sNYR9wR?=
 =?us-ascii?Q?2KUfLngzqrBmGMgRJ+dK98Tsx68z2QBsQpRfXXj3EH2li9f68MQ9CsSnVi6O?=
 =?us-ascii?Q?aggDIKvdz/ld7D7kphpSM4kvf0hUFh9dRNq6QDwZ83ziPH5P1PgeFtzJTrCW?=
 =?us-ascii?Q?zOzAARZY4XUw/RaiOoUVfZfdCh+tZbBRp1+LIMKPBnUvBrsvuZrw3C3v6+IT?=
 =?us-ascii?Q?VDOUWuzJ4vgOq0HHbTqFKqP/mjHiaGhmSacXJK1t3lXCeoH7mB44a8uHww76?=
 =?us-ascii?Q?8oJ2c8+v/EYF+kjYh3YNuIvui8a78yBCblm98fhvU6YNl020et3M5LKE8/Z1?=
 =?us-ascii?Q?GVmbkhc/fMYNU87TknB4qrw16QlZ7EDmc4vnIdPbAULqN+aZXV6mLfuPl+OF?=
 =?us-ascii?Q?D6y88+4zdI6fiEHH3VFUgQNIAa8dw8/kRc+GrnTFqRuGbclB0/3hey458vLk?=
 =?us-ascii?Q?BK2WmQ05ovzyf2zh6jcyxiGyVOOHDnz9F1mT6f73COXBofi6aBvJYtX29Ldq?=
 =?us-ascii?Q?3KtTgUvfKGVsKLiV8qLSU04GFphLmNSxlp5saceQBlrS6s/nT/M7EQ++vLvj?=
 =?us-ascii?Q?yUURco9q7ve3RMnOrt30ijBK/P+gk011ILgnPCdQfuAJvnkxePNrCtDDkf5f?=
 =?us-ascii?Q?7efNJigUQHv2MZ7ZtfA2jFOaXPEol7CBFLujQk+dRCux6EemLgHCuPyJnPhV?=
 =?us-ascii?Q?xNOnIWyu1Bsqex1NP0ElaQKEAg3FheFlUWx0D8yQe5TgqsgaxuenLq+Z4nIk?=
 =?us-ascii?Q?hBTJi1FZaJtx1p0t19fS7S4+Uh5bRyFy8prv4uBJNe5wqxdAFOo3x1t6BBDE?=
 =?us-ascii?Q?LCa8L0qpuhUc9MRyjDr1/JQHNq1J69i8NKrD+mHFuLfVvEYhot2Y+0EMIph/?=
 =?us-ascii?Q?eQXAsfWsmB7GKoVjXVnwixliJvRWTorvQx1ISHWmuo3hacnZtG+sTOw6ZGV2?=
 =?us-ascii?Q?aBRc2kAmc+caeVzTK9Y3Giawmz9oFdlxyPJRjpOS4vnkUBLOAofPtC4VFyqd?=
 =?us-ascii?Q?DZtvJr0uK0KjybsKj0t9gVnkZShTD7lzGVXKJYFJdXp/zSp8/bh5Q+EFK7kr?=
 =?us-ascii?Q?XrwlU7Ttv0KZXQ+NhxDs8JAAn/Bjczz2C181zLrEuXG2RqgPAqKZwRJNASh/?=
 =?us-ascii?Q?V45GRLDk9OUE98ld5Lkrx7ua6OYZkbKNtpRUYzbeK2/Pr4oXOKam?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e77f35c-4ad7-4136-d744-08de57b8f44a
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 00:15:01.9119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+XZQLx6Sbrw8pXmBznPI6//qp2J/sLTvHI1sTbBKZIYeSTE25qYwu+2rYPzYEi9rgT2QxLrYicZ9aKRSrEzMIiNbW9NyCXLFK5sy7zH6jSLM/lkzLvJiB3+R+0i+Bs0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11799

All drivers are now using new dapm functions.
Move struct snd_soc_dapm_context to soc-dapm.c

Suggested-by: Cezary Rojewski <cezary.rojewski@intel.com>
Link: https://lore.kernel.org/r/87o6x69h4y.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 22 +---------------------
 sound/soc/soc-dapm.c     | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 6f3e1b57cda32..49f0fe05db01f 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -20,6 +20,7 @@ struct regulator;
 struct soc_enum;
 struct snd_pcm_substream;
 struct snd_soc_pcm_runtime;
+struct snd_soc_dapm_context;
 
 /* widget has no PM register bit */
 #define SND_SOC_NOPM	-1
@@ -579,27 +580,6 @@ struct snd_soc_dapm_update {
 	bool has_second_set;
 };
 
-/* DAPM context */
-struct snd_soc_dapm_context {
-	enum snd_soc_bias_level bias_level;
-
-	bool idle_bias;				/* Use BIAS_OFF instead of STANDBY when false */
-
-	struct snd_soc_component *component;	/* parent component */
-	struct snd_soc_card *card;		/* parent card */
-
-	/* used during DAPM updates */
-	enum snd_soc_bias_level target_bias_level;
-	struct list_head list;
-
-	struct snd_soc_dapm_widget *wcache_sink;
-	struct snd_soc_dapm_widget *wcache_source;
-
-#ifdef CONFIG_DEBUG_FS
-	struct dentry *debugfs_dapm;
-#endif
-};
-
 /* A list of widgets associated with an object, typically a snd_kcontrol */
 struct snd_soc_dapm_widget_list {
 	int num_widgets;
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 7aef57dcb2a72..07370215ea7cc 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -40,6 +40,27 @@
 
 #include <trace/events/asoc.h>
 
+/* DAPM context */
+struct snd_soc_dapm_context {
+	enum snd_soc_bias_level bias_level;
+
+	bool idle_bias;				/* Use BIAS_OFF instead of STANDBY when false */
+
+	struct snd_soc_component *component;	/* parent component */
+	struct snd_soc_card *card;		/* parent card */
+
+	/* used during DAPM updates */
+	enum snd_soc_bias_level target_bias_level;
+	struct list_head list;
+
+	struct snd_soc_dapm_widget *wcache_sink;
+	struct snd_soc_dapm_widget *wcache_source;
+
+#ifdef CONFIG_DEBUG_FS
+	struct dentry *debugfs_dapm;
+#endif
+};
+
 #define DAPM_UPDATE_STAT(widget, val) widget->dapm->card->dapm_stats.val++;
 
 #define SND_SOC_DAPM_DIR_REVERSE(x) ((x == SND_SOC_DAPM_DIR_IN) ? \
-- 
2.43.0

