Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793156644;
	b=jihqCrYExBFem9MnCPlSrQJHnvPGCuWtOIY/VHM4/7Sxo7/La0W6zR+P8t+u3qL0g2nm
	 o3SxT3U5DD+hKAWaHGrDcqtHGONZ/45j+9nNqplWO2HnGwSlZ/Pd1jQya7CV9UcauHAno
	 Rv6OWsIauNR9SP7Hj4dJKnCiiqxXqg8q15cY4WrlESFH6MQCKKP6xGV3kOxvGSBiWFvg2
	 O1dOheUNE5kXPdA1oMr8SOA9j8icENMpDZqt/sPeuO6QsGuNpMvRI1VYzhBswLriv0liY
	 RBG6kpjhLBLvkrK3KsCPtHLZTpQE03aItmP1rsbVGkkGB85aC1/lH4Q3Z6ND6wR1+2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156644;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=XqB0yN04kWE0Ewi5TXE70oGZuS4p9jnxQCc54OTVEUI=;
	b=Cd11ey8l9R0nqNZdSErHJ0QfnePYBv6+K2e+kxTJ18Ey9G3K8rE7qHjC+sEW6yijJq0B
	 SYPCWvgUgZ5KaAh7c+Ga0F+GzKvL3mSzx1nbCwDEis0ATtczomzUzdRz1Q5ltWjbSyTFb
	 fKkLjly8qoq0/xBWdIwqhFphFTo+U6gg9K286zaDY7uIQt2sjppb4PtMnQbnhcw4Ske6B
	 AcR5RtEmRseDs0p31Z1Pzfqc6/FyjDcN1nISTuNQIvk7/LciOHFZ18ILjOm5s6RtWHyjo
	 oAvPfrfItrL0ukZWs3Cg1cl0ePCLrHu9VwZh6l/2vJhh4iruIorAO3AzVsRcV7EY13Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=dqr3UnqK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.23
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010023.outbound.protection.outlook.com [52.101.228.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57133606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57133606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=dqr3UnqK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qb8cxR8lHzye2yjVYtGc5cksJqneRG77sokwsUlf+zwvBG41CcLZC5/U7Opxgd/bL+eQ6KEOBnEiPI4FXmvzzNgqY3XfCQx3Tfiy63//O9UfnnfBd3nw3YJiL20OpUMhsP2jnrQYhrvcfRVOzuhswzhAnu5a3r7/clNHxxC/FDalfdHtuWmfOwal004k6axjkCAaj5Z3Ci5iDUjPnU5blT0CwySa3cKp4Gwfamwh+nrlx9pbIj1fsX0Zs7rz/+DJ5+9kEfhCLttLMZhHCJEakZNXV2er/9kmg/+7ntVI9uJ/x9V5yKAWwDFq4dusLtqMOQiDKyCHL3c684+Pp0YHtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqB0yN04kWE0Ewi5TXE70oGZuS4p9jnxQCc54OTVEUI=;
 b=YiC+ZOlDWfFosqCtaMFpDsCINLsC742IO3bcGqqKhKRmO0imEzYlC1A9tpUzLeu2SDdkqyBRdERwMEljOm8MoM0eONLlgJewlFE9leke6/KuWmqg27V362Evd88KZuqswt5mnZhGkw0K/8L8ccU7gdK1B3Imgc0GOV37VqhURfdEicQP6fHOgjirw9Nqs3ohwVPKWdRRyZ6vDCP9KYoP8FIINMIls6xwciDr/ZqkyOjwgYWA/W4t0nq5M5Ow3zxxC/D/OXDh0vUyKt8xlyO9DrpStCspeTLXehITMKuv5VPsDvXv9xNe82DE51isV+myhLLoqltCi2LNaXSCOSgAWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqB0yN04kWE0Ewi5TXE70oGZuS4p9jnxQCc54OTVEUI=;
 b=dqr3UnqKKhHDdYet4lsZOaWvJSepsAcWEh6CvtcZ7X3GgcJBkpULxE6uzKixGW8N6wDb4IzwIH3scLShM30DL96P87a1p3IanBuRtbkxbqxRYmaPgp4gSMVGNedBQLARSSotaaAWb5R9P0QD84MPUsd0EzZG/fQOschgHdMhFPU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYYPR01MB16159.jpnprd01.prod.outlook.com (2603:1096:405:2e1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 03:04:01 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%3]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 03:04:00 +0000
Message-ID: <87pkwusezj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 15/15] ASoC: soc-internal: remove temporary funciton defines
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
References: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 28 Oct 2026 03:04:00 +0000
X-ClientProxiedBy: TYCP301CA0046.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::10) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYYPR01MB16159:EE_
X-MS-Office365-Filtering-Correlation-Id: dca41a2c-5a96-4ddf-dbea-08df34a01da2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|23010399003|1800799024|38350700014|11063799006|261026140227099003|56012099006|261026121527099003|261021121427099003|261022105027099003|261021123027099003|261022075727099003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	MIiTeXvnkf6c40/nUgkS82bAABl/5pqm/8bNxRKtl2eLtKPCm8x9gFvLmCxhLUQRpcIwdkXs5bd69j6jXunnIkWSSXDcVuW4h3JnphI2Ngx/jWFXswRc+Zwqop48G7rWVqnwlNTNfZYzRJsH5+dIupfJTTiCKOqsAbQkqEN7BtqeMXDMTqG1IsskyqFSZJX419oNzf1rbsk/6dlf7PZ1eKjxJffoEKAlcdjx2RI044DnVeazxUy/BJ1K6N2dwyGoQtTBpQmPOOp1lYiOLO/QMWndAj08zqu9KptGtRa2Nee7bC8fmS7XgcLGcBLBOZ6Jwx5p3XlLmqllc+vb47YQc6qtusty0+iTmCRK4O4S46anrUBXWNJTLDx1hk71zhqUYqwXSmodSu1lzJzE9AdCaYOt4yRJyNF2937k5Q5uwFobyxK4LzCyiUDPcFnG9eT73RgDwj2XmxztGiuwMOEZ6PhbxZdv7pT8yK1w4G1BphzeY9PpGJS1ftza+gRHWTD4t14Qh34rlYomsRtX6PlRLTaCbOt+xDTEP47nPIzbhX1yNDyfyTlSHJClS9r4AbGcNAOcPmWCiniWW8clBxNxh1a45ZZ+Q3D/GJ0Qzmzdc3YfoikDnZPfnhVkJS5CVa85/uIqSkXulSd+y3UEfCDG/omvb7qTCpYCL/+9ktql+rjgdQG3HWjCVFaCxZzC0IghiCKsqQuv8yOey7aad6qK3BzYDjD5iOP4Tnuxjiv7lqc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(23010399003)(1800799024)(38350700014)(11063799006)(261026140227099003)(56012099006)(261026121527099003)(261021121427099003)(261022105027099003)(261021123027099003)(261022075727099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YklsYcjxrCjLrxtTxEqPVPbKE8qg01q3zyZWiVIYTUBZczkvrTvPd3uEX9ua?=
 =?us-ascii?Q?Gv+LuSAJYr7geFFYIhjd4S1uP0MN6/Ecpoc8ExD9EIKTlsYXGV9aUF8bioe+?=
 =?us-ascii?Q?Pyn7PIidN9UeH9mD7VHgMCJWzjH0tQcXCI3rw3SxrJtOW47rdsstlmAnOtBb?=
 =?us-ascii?Q?ZAAi9Rd5ksc6KLCTUsKPgdJsmO/tiEptqg8C6O3MYy17sO2mAFbpXzXKNhsI?=
 =?us-ascii?Q?TC6qQauCA7rVdEeGbTMHvwBD71iqZg1rNpqy4qCmSMlBMIAuDp2vR0THTJ0x?=
 =?us-ascii?Q?0hbWed11jSxVZfWWZrLGgwqPekF4QdcFIAf0BE8L82xuIoy/Pi4wUaNnNgXx?=
 =?us-ascii?Q?WcbdvKWT39uPrnjBwStBb7hvfdLr338HQ7+W/kBttAWYQaXwf59ao5jEoKRd?=
 =?us-ascii?Q?D2z174eEIHWIeDXu9w6G4Ojb40Y0GmYen/qAv/VL1YKAsxCuGbaNiwHCqCzR?=
 =?us-ascii?Q?Ouuw68i53cF68zvpgegcHa7IQ/dOtbr4MYu+t561W+IlofIR9sLpjcMSbsTF?=
 =?us-ascii?Q?xxSv1tx6kiYg/uYTBAoveL6nMovc/uXkZdlh3vCt4u95KXBlM1KiS9/hmxlX?=
 =?us-ascii?Q?xWEbrFs7q1kIp0a/bYfs3fq5VXgpwDlpJ0Kd1NCrpLkk4dDhaMPEmTdbTOVw?=
 =?us-ascii?Q?w5plKc4jNUrJXBvoaccD2oWvNdz3sGN+I0Z0hEA7xQZkHrkRiq8HqCaNz4c1?=
 =?us-ascii?Q?bgwwGUnxblyVFb9lWDym7quzBDeDKn8slsJrWLBOfjZjTQ9fxGymu7CFTHMl?=
 =?us-ascii?Q?piijwU6ACyk4MSVGnDMqZ4hOWPbHHAAzEubwjg/p4guZbfwuUK0f0i2S7a/q?=
 =?us-ascii?Q?lSvzUF6NZfZ0jP7229Kc58Rocn3sROYOgFrtsYV7nlpXmNugkmelul/dry33?=
 =?us-ascii?Q?esPG5Zmf485ee4NDZLIJIEQqAiJepW1aFP1VfKF1zc8LObzIFOfaJLsuWjJn?=
 =?us-ascii?Q?kpceVAnYMm7yu5G9UuMjkEykqhZ/lV//GvZBmTIMa4L32QIxPLvU7tFdv3+m?=
 =?us-ascii?Q?a12Du4Qid2RRcqrTFl2MLzQnjzUVmtH5tnkG+gsb+QaG8c8/vrgpTY29Pk8u?=
 =?us-ascii?Q?ny4v6OwBPdyQ3FB4Ew0z2TuUfyvvTkYFk93ghxAX4y2HvDbCy6esnSGPqtod?=
 =?us-ascii?Q?vPUTx9Y+CrzyqPoyzF/NZRJhyVg/Etrqv47WRNxAMTkj/4oAwyHEhMe9peOv?=
 =?us-ascii?Q?Ox12F75PfT62HZ+QItvqnyFQiT5GLd+pdaTx4Cer8yg9Gu8e42XAQxtw7p7q?=
 =?us-ascii?Q?hcRY/5Z1vm7PjQfTU3ipy9F11+qRUNlw/pEcLFc1wEmUG3D+8v+fHtTi0aTk?=
 =?us-ascii?Q?4leLR4McReZU4SAusX2WdSIhLMxj6/1BS+zqeXWsWalYsghQOEgjy2XxBgM7?=
 =?us-ascii?Q?O0OJO/X8My4E+Y2/fdtGm6jWScT7diImvmEh32kiBjTKdck+Tgsurx1fg+ar?=
 =?us-ascii?Q?6MrmGBJQ/h2peGODgNrgCEytxDJ3jz8RNeIvzCyH7aXTpHLITsGQ/V0N4jXq?=
 =?us-ascii?Q?gD6sOXhycP01a5xDqXwMzsf/etfWmazQvWM8+1fQsvu+Nkz3/XdjkIi5JmR2?=
 =?us-ascii?Q?WHWx+7KpMvecBP3fKvlASpG4UNKcfi0bzqBsWvQqjBeCppvh1MUtxvFUqKJZ?=
 =?us-ascii?Q?fciAWJXM3YlIZQ3tO/0FAPF2wD0+/Rz5tEH7OCxqT2YgV573EKyCsl+K6+BY?=
 =?us-ascii?Q?ye5E1NQgRqK/k0SkLLuvt01MIj/6C5TE+wciA26D6koTotVYjD84ruTC0W83?=
 =?us-ascii?Q?kKzvVES/Eb1vhcLfs8y8eM08uMm11a91hItkt5pnvAFg1yYGAxj5?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dca41a2c-5a96-4ddf-dbea-08df34a01da2
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 03:04:00.8127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sePRr8jZ3zdYV29v4hh5hndvPnJV2BSsHTS1bhEvfFDcsUIVn/pPnxtn1LOmdxzYwZ2G+evWWRH+wlBeQ9KmsBSVp2vsL2v/JG1+9G7vMLbFzi+DebayfZoWIx6y4jFl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16159

There were too many local function dependencies to move Card related
function from soc-core.c to soc-card.c.
Now, all functions were moved, let's remove temporary funciton defines.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-card.c     | 38 +++++++++++++++++++-------------------
 sound/soc/soc-internal.h | 20 --------------------
 2 files changed, 19 insertions(+), 39 deletions(-)

diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 959b56be0eedf..6544dbf2ee260 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -28,7 +28,7 @@ static inline int _soc_card_ret(struct snd_soc_card *card,
 }
 
 #ifdef CONFIG_DEBUG_FS
-void snd_soc_card_debugfs_init(struct snd_soc_card *card)
+static void snd_soc_card_debugfs_init(struct snd_soc_card *card)
 {
 	card->debugfs_card_root = debugfs_create_dir(card->name,
 						     snd_soc_debugfs_root);
@@ -36,14 +36,14 @@ void snd_soc_card_debugfs_init(struct snd_soc_card *card)
 	snd_soc_dapm_debugfs_init(snd_soc_card_to_dapm(card), card->debugfs_card_root);
 }
 
-void snd_soc_card_debugfs_cleanup(struct snd_soc_card *card)
+static void snd_soc_card_debugfs_cleanup(struct snd_soc_card *card)
 {
 	debugfs_remove_recursive(card->debugfs_card_root);
 	card->debugfs_card_root = NULL;
 }
 #else
-void snd_soc_card_debugfs_init(struct snd_soc_card *card) { }
-void snd_soc_card_debugfs_cleanup(struct snd_soc_card *card) { }
+static inline void snd_soc_card_debugfs_init(struct snd_soc_card *card) { }
+static inline void snd_soc_card_debugfs_cleanup(struct snd_soc_card *card) { }
 #endif /* CONFIG_DEBUG_FS */
 
 #ifdef CONFIG_PM_SLEEP
@@ -92,16 +92,16 @@ static void snd_soc_card_resume_deferred(struct work_struct *work)
 	snd_power_change_state(card->snd_card, SNDRV_CTL_POWER_D0);
 }
 
-void snd_soc_card_resume_init(struct snd_soc_card *card)
+static void snd_soc_card_resume_init(struct snd_soc_card *card)
 {
 	/* deferred resume work */
 	INIT_WORK(&card->deferred_resume_work, snd_soc_card_resume_deferred);
 }
 #else
-void snd_soc_card_resume_init(struct snd_soc_card *card) { }
+static inline void snd_soc_card_resume_init(struct snd_soc_card *card) { }
 #endif /* CONFIG_PM_SLEEP */
 
-void snd_soc_card_fill_dummy_dai(struct snd_soc_card *card)
+static void snd_soc_card_fill_dummy_dai(struct snd_soc_card *card)
 {
 	struct snd_soc_dai_link *dai_link;
 	int i;
@@ -123,8 +123,8 @@ void snd_soc_card_fill_dummy_dai(struct snd_soc_card *card)
 	}
 }
 
-int snd_soc_card_init_pcm_runtime(struct snd_soc_card *card,
-				  struct snd_soc_pcm_runtime *rtd)
+static int snd_soc_card_init_pcm_runtime(struct snd_soc_card *card,
+					 struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
@@ -171,7 +171,7 @@ int snd_soc_card_init_pcm_runtime(struct snd_soc_card *card,
 	return ret;
 }
 
-void snd_soc_card_link_dais_remove(struct snd_soc_card *card)
+static void snd_soc_card_link_dais_remove(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
 	int order;
@@ -184,7 +184,7 @@ void snd_soc_card_link_dais_remove(struct snd_soc_card *card)
 	}
 }
 
-int snd_soc_card_link_dais_probe(struct snd_soc_card *card)
+static int snd_soc_card_link_dais_probe(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
 	int order, ret;
@@ -201,7 +201,7 @@ int snd_soc_card_link_dais_probe(struct snd_soc_card *card)
 	return 0;
 }
 
-void snd_soc_card_link_components_remove(struct snd_soc_card *card)
+static void snd_soc_card_link_components_remove(struct snd_soc_card *card)
 {
 	struct snd_soc_component *component;
 	struct snd_soc_pcm_runtime *rtd;
@@ -219,7 +219,7 @@ void snd_soc_card_link_components_remove(struct snd_soc_card *card)
 	}
 }
 
-int snd_soc_card_link_components_probe(struct snd_soc_card *card)
+static int snd_soc_card_link_components_probe(struct snd_soc_card *card)
 {
 	struct snd_soc_component *component;
 	struct snd_soc_pcm_runtime *rtd;
@@ -241,7 +241,7 @@ int snd_soc_card_link_components_probe(struct snd_soc_card *card)
 	return 0;
 }
 
-void snd_soc_card_aux_unbind(struct snd_soc_card *card)
+static void snd_soc_card_aux_unbind(struct snd_soc_card *card)
 {
 	struct snd_soc_component *component, *_component;
 
@@ -252,7 +252,7 @@ void snd_soc_card_aux_unbind(struct snd_soc_card *card)
 	}
 }
 
-int snd_soc_card_aux_bind(struct snd_soc_card *card)
+static int snd_soc_card_aux_bind(struct snd_soc_card *card)
 {
 	struct snd_soc_component *component;
 	struct snd_soc_aux_dev *aux;
@@ -272,7 +272,7 @@ int snd_soc_card_aux_bind(struct snd_soc_card *card)
 	return 0;
 }
 
-int snd_soc_card_aux_probe(struct snd_soc_card *card)
+static int snd_soc_card_aux_probe(struct snd_soc_card *card)
 {
 	struct snd_soc_component *component;
 	int order;
@@ -292,7 +292,7 @@ int snd_soc_card_aux_probe(struct snd_soc_card *card)
 	return 0;
 }
 
-void snd_soc_card_aux_remove(struct snd_soc_card *card)
+static void snd_soc_card_aux_remove(struct snd_soc_card *card)
 {
 	struct snd_soc_component *comp, *_comp;
 	int order;
@@ -408,7 +408,7 @@ static void append_dmi_string(char *dst, const char *str)
  *
  * Returns 0 on success, otherwise a negative error code.
  */
-int snd_soc_card_set_dmi_name(struct snd_soc_card *card)
+static int snd_soc_card_set_dmi_name(struct snd_soc_card *card)
 {
 	const char *vendor, *product, *board;
 	char *dmi_longname;
@@ -463,7 +463,7 @@ int snd_soc_card_set_dmi_name(struct snd_soc_card *card)
 	return 0;
 }
 #else
-int snd_soc_card_set_dmi_name(struct snd_soc_card *card)
+static inline int snd_soc_card_set_dmi_name(struct snd_soc_card *card)
 {
 	return 0;
 }
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index 255e06466e925..858a071798d0f 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -13,26 +13,6 @@
  * as snd_soc_xxx();
  */
 
-/*
- * REMOVE ME
- * Temporary definition
- */
-void snd_soc_card_debugfs_init(struct snd_soc_card *card);
-void snd_soc_card_debugfs_cleanup(struct snd_soc_card *card);
-void snd_soc_card_resume_init(struct snd_soc_card *card);
-void snd_soc_card_fill_dummy_dai(struct snd_soc_card *card);
-int snd_soc_card_init_pcm_runtime(struct snd_soc_card *card,
-				  struct snd_soc_pcm_runtime *rtd);
-void snd_soc_card_link_dais_remove(struct snd_soc_card *card);
-int snd_soc_card_link_dais_probe(struct snd_soc_card *card);
-void snd_soc_card_link_components_remove(struct snd_soc_card *card);
-int snd_soc_card_link_components_probe(struct snd_soc_card *card);
-void snd_soc_card_aux_unbind(struct snd_soc_card *card);
-int snd_soc_card_aux_bind(struct snd_soc_card *card);
-int snd_soc_card_aux_probe(struct snd_soc_card *card);
-void snd_soc_card_aux_remove(struct snd_soc_card *card);
-int snd_soc_card_set_dmi_name(struct snd_soc_card *card);
-
 /*
  * In soc-core
  */
-- 
2.53.0

