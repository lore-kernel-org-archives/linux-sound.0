Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793156613;
	b=v3mwJ0pNf6l12J8dqaf5s80XgieGfjRNU42sHIow/Ck9edbbl3NuIGunUpUlh5NTUW77
	 sQZryI7SFUw6saFGvd5e1AXFGvuyXBgXL9zeljx7WoSJR7Wyb/YvyEkN/x1jtGNxLFUHf
	 IJEa750skLMlTe3HazHRoXNqKoYjkbvYRMEPAvgc/DVklxCPpBmG0BJ/aKdpCVZgqcvba
	 Ttkj8178jGPdiZVw8gU5Z/rlZEXsQNW14LIesX3z85mF0F553JL8h2ZOwXi0LDhSk2CuH
	 oNHLMTCLybj8aY6/bLEcIfdCN3tbvbE/sSgpUqWEjqCXRqEcbzM9du4X5DaGnGHC7gw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156613;
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
	bh=JwCK8tGZbKXWzU6z71TAPzUMngAqMpkoPk7mRbHIWY8=;
	b=3X21qk11ZVC7A7kW8EHEhgVS2Ae/D0FWpOVcGAENKC+aumzEmopRhxRu0WLGb1Pq4ss2
	 pPN5cs7B4iFwqeQrLPaf+WLFvq/VXlXiQ7pHj+FQ/krZdOzV6IVOM0ZHNkDlukzBlX0e3
	 KODGykKDRe61oCEC3wuLzj5BtXu/2mKdGo4mj97NNStk0vMQ46ASCCcbdY6JgH93LCvIE
	 gBNSjEnvLR2U1cKnyzA2Nk1cwc2rZF4VXC5h8lOl7/i2RTQTHeuSdH1CITmLfPHUTXine
	 F1LxIpZiV6+/LJ8cutJDhfs43Iypp6pTswJyWp61YJ3xVt+CafyF8Ovd6o5erCs41LA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b="lgh/5I0g";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.21
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011021.outbound.protection.outlook.com [40.107.74.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5A9606A321
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:03:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC5A9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=lgh/5I0g
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uycCxAmc6Pb8RW2lIsr6QEN2h4v0ajYC5FKY4x5aTGCXJJx2emf0DEk7Kq6vuNyTWW/Gv7pGEeRlrLM4U+auXjAKKxrIyTe1noYShmc25xHWvZEdaWvadQDaPwY38B/tpImR70BW7CFvB3oTe2l1yMnI5TA5X7ax0yZQHX9wYD9/OK9y8iY0AeFnPRgVrbTS4dI42YGTJYYsHN9mKNI+Epm9NwPVAdH+UK2JOc2lXcwqHvTGtsG31z535lrA7px2bvg6Bju5uqZ22od6DgPpFFfenldFjE9F62HUWQxO+A9PlaVhz9TNVnS8A3xl1OD3nFP+LhGIcr1c7fn5MwHvRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwCK8tGZbKXWzU6z71TAPzUMngAqMpkoPk7mRbHIWY8=;
 b=qz28whzefIwtdQZf+O9jSwyMyAJN0InclJXtsaDU6EwX5nhNSmfltvED2ZxZCxu/fRQIQQcSr/y3EL/k88EHlkCjXY7UXB+dTTooKjMmIywgM2Y3Auv+j0fvnD0zijPfmEdF0eW4r/b4b9NE+aaCGB/p3PNQg7xfW5n5omXEXfATsAUHYaVcSCs1CQwCp0+MUhcG6g0LJfaemwEXcyQgexlTkRm/mg9J0cYBDfYej87tN/Ql7DVdTAHaLPPOBTp4PQbRLUz4TFTmgGApLVDBEJMV5TTtSMOzpKJnIifT+xxNHT7zVC1fh4452VtrDNrYI/QTh0LXkSzJr7DXMRldBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwCK8tGZbKXWzU6z71TAPzUMngAqMpkoPk7mRbHIWY8=;
 b=lgh/5I0gJ68s7o8lceMWBvFJ88ZuKLA/49WSUbTiXksw+aUySDqbiV6aa8ZF5gvEh/I1l4HSPspPEMgxuCmrxYYxUWpo0BmjrLjM57dksMaznKe1IVr8R32ZjI8v66PBZNmL1FuPXJE16xthckthIjIVpRv72D0Dq+/xEuNfelA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYYPR01MB6650.jpnprd01.prod.outlook.com (2603:1096:400:e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 03:03:31 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%3]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 03:03:31 +0000
Message-ID: <8733tqttkt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/15] ASoC: soc-card: move snd_soc_card_init_pcm_runtime()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
References: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 28 Oct 2026 03:03:30 +0000
X-ClientProxiedBy: TYCP286CA0064.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::11) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYYPR01MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ed461ed-37fb-4d10-bcdc-08df34a00bde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|52116014|376014|261009223027099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003|56012099006|10067099003|261026140227099003|6133799003|18002099003|22082099003|38350700014|261026121527099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	oC7U+JSJLV7YrN9IQNBoemurUUbq0J4z6Ej9Q9aQoYH4ofq8RMk081brwdBmupWKmtKoeVdY9UhyILHUTqRWatSCY4sgAEh8C6PP3ZfhzoSHSzYxqoYNQNRWhXDwrSiXAF7yLBr7oqvGLJuKpXjYdafrUFTQ3oMAJN3LUbgkN25BT59wikv86VXOAV15wp7UueDvA1RqxAoWYq9YhQcXgBuoo+E228cPCY+uI6i7WInprI5XV6NNEgQ56MmtpT57mBO2RkXaGeIB8Y8Ba4d0HZ4ex/xDo1eLtxFU3PdLMEVgo/+aiAh1KCIjeFFoNEkmtT6I0kxeGWYTDRDEGY57tnHgJUJnnHn9/i59dPd0+v4IDYmWqSc7cI4fRMqYKXI3T7nv3HfdESnU3MNpza6PsQT5ii73MNRsMYmia2043IORwG5b6Q5V93S/0uwnA3tRKj5HPju4OOhu2DzfK/esQjhBp+czB9jnoa6H1qF0EVLgIQOGC6I/6Ts7eW3zp60YP0kqMfTVyAfnYS9pGJ3GSRU5XGXbZGUXZyaHtLTfp2jpRi29GDZLN7FIbk95/U0UpfCK1OIUzdIEG1XzXZ/SlW4zn++biaDT3/IT8WgH1M2hum5VCJyvZgDN4HV/0LhFyKJCWBn9AtoIJMEnR+4XfevPhterO19p/SkpCLLSZnoLfiEpx2FssDR9et857FU9I6s4Z3X3ZS+ZNEsTg/1x8A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(52116014)(376014)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(56012099006)(10067099003)(261026140227099003)(6133799003)(18002099003)(22082099003)(38350700014)(261026121527099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tkfFUAekBhIvVPamHYSWlSGn77HKHmd6uSzCjxoNUOXaII312bjF93cyME4Y?=
 =?us-ascii?Q?WJCXnRa+om7LE4ddkDwgD13zwr+u6AR1wGMQYGzoVafBWvw0oIG7GhsFZihm?=
 =?us-ascii?Q?k/eEPAYXC37l2K3/CI/f53eMMu0vCNJ6iNU0GFI6gTKTHsb06V+koKv9r1/e?=
 =?us-ascii?Q?xgojjooFXBFEanuXszMlLwJ17fpK/1PWa5z8h5n+PtSL07WjE3CVUNzmd2PY?=
 =?us-ascii?Q?NI5fGIrZ+Th0Qu2teUUojwhpKHwrOWdWMhM3h6WJk8qAJlCihxIMrGWOy+PG?=
 =?us-ascii?Q?fCVz/ZIbnAJC65mMvvDAdBI6YsvgA5MMGw4SDmJOOteawhm5U0tB/Sn8O/Op?=
 =?us-ascii?Q?yqPrxAonv16rlu02fIh0v2y/Pv6mGDqLroqNCwfRAKyiTFRJz1aVuHuECdS0?=
 =?us-ascii?Q?CVAC7vqvkCNDBEy9ayGczZdfpgbBcTci7H3JKnN/HN35CJaLcACKbcRXOxAQ?=
 =?us-ascii?Q?RgnKrBZHyFin3OhLP4TiJDedbur+4NioSsNgvzbFDSR6Tu20KHtBX3KE4sdE?=
 =?us-ascii?Q?TmtCVrAGBqwq/1zWss5dVvUPpINCpuBXofZsRMr0C28NI8cmUkpruEDAYYql?=
 =?us-ascii?Q?TAnWtVY50Xiz7h2jzwXtaQ8Oa7EqpXlAw/3Q280bnRMsykp7kQJTK7kAQCS0?=
 =?us-ascii?Q?S3JB64U/Q1OIHyJ7BYj3f4o5IG+pKWCSs8jrSpT6jL8JgUjKV56Mg9n/Jtw5?=
 =?us-ascii?Q?KiGBY7KNx/NCdYQVLfJRJjeerGadI6qSm1+QFdPJLqC9/1HeIq10/x9hQYHA?=
 =?us-ascii?Q?bff9dlTmtuSF1mSHjSlwNFdmnGdGY8cDztKvw4wSGV/w+hnlLkKGCJIbY5q+?=
 =?us-ascii?Q?hlxff4QmRPgar/1xKXqhQv19vGZapASMPklUvP5W2FR35LAcP39+uGAKhVAG?=
 =?us-ascii?Q?C2STdSIHyJBamxfIPseO+fpP1i2c700K52fQ2SIIzqH92c+3O34yPtAzIQYE?=
 =?us-ascii?Q?v928h5IIZ9In9SUiu1kGZgB9b3CZTmiC74vPkbEC/U7w0iIyWrTw7gvdw1ZP?=
 =?us-ascii?Q?+RpTwdHhxQfka+6SuG6gT1fI3rGAfANArOyhY2DEK/WQPKi9j46Gok0zz4sX?=
 =?us-ascii?Q?+uk6jyfTn/jDYmWvmxg2MdQcZ0OtcICHwdNAszbB0/NT9Qu6GlnPj4X3l09V?=
 =?us-ascii?Q?IccfSZUmlYkEeV9rDekHmraYCwzYrli6zOHIGKsdxyqGWbVk8jX31AxRcIRZ?=
 =?us-ascii?Q?3cFI2AEHy9hXP8acfIhPe3g8s1zIs1TVMtmnQMSHDi7NJsf/+Kay2QKK3uG2?=
 =?us-ascii?Q?wHIXZ0Lf3nAZgfySH/w1riq+TwDe7fhPy1a6wX5+wAetUrJohw9yHumPIt7E?=
 =?us-ascii?Q?1YYd+T+ire2sq1FAY1gtngSos69ck3kwMSMIw8wQjV2O4R8GPeDUVogOIzGV?=
 =?us-ascii?Q?X+rnv2flcjthwV5IzNGUYQ2TzuSVbglhTln8jJFMrmhqMQgRk0EJr4hbt/8c?=
 =?us-ascii?Q?Q6WhadBB+IKiG9WfuRxN5/Bm11hnAFpTGXe7wqIyWf9ooHNttDKtyXDX+D/m?=
 =?us-ascii?Q?12bP6nsUGCC2sZIqqjs26YQ1BpsNCEgwiawmE2lOPWUe+wAwywuEwdfvEips?=
 =?us-ascii?Q?/fuipCrrnAAYC5QASdCbQuJEIQ37GBluNGol/FEjfFeaxQ2/Y/alWNTC/TZo?=
 =?us-ascii?Q?a0W46YjQaVUYYAoUQEYrWmcj7AkogvqCn42cpx/QldA3PH7bvHPY3Tyya/8q?=
 =?us-ascii?Q?4viuYBCno3cGlur3WPOof1x9iqgnjxezDuBgWJWwArttGiERjbD1E//gKUrz?=
 =?us-ascii?Q?HPe+vsEj2IV7B+9H0SB+zvuIpNgZHCVwyRrxjEy5mReNJsJlj67P?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed461ed-37fb-4d10-bcdc-08df34a00bde
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 03:03:30.9800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2i6S9oYg5PiFrgsLXHcLnE7bZczPN+OJuySlvWpgK1dokBwy3YKfCIdzgacpsKbR/UeYkrYHTFe7q9XnpxCfz4ERpVJfIl2ApHtfrZV1sdTrla6wjV81E6FWXC2/Kf00
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6650

struct snd_soc_card will be capsuled soon, its member will not be
able to access from non soc-card.c.

It has too many local function dependencies.
This patch uses temporary funciton define at soc-internal.h. It will be
removed all funciton were moved.

It renames function name
-	soc_init_pcm_runtime()
+	snd_soc_card_init_pcm_runtime()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-card.c     | 49 +++++++++++++++++++++++++++++++++++++++
 sound/soc/soc-core.c     | 50 +---------------------------------------
 sound/soc/soc-internal.h |  2 ++
 3 files changed, 52 insertions(+), 49 deletions(-)

diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 6e2b8a86f4587..405d88e57fcbc 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -10,6 +10,7 @@
 #include <linux/lockdep.h>
 #include <linux/rwsem.h>
 #include <sound/soc.h>
+#include <sound/soc-link.h>
 #include <sound/jack.h>
 #include "soc-internal.h"
 
@@ -117,6 +118,54 @@ void snd_soc_card_fill_dummy_dai(struct snd_soc_card *card)
 	}
 }
 
+int snd_soc_card_init_pcm_runtime(struct snd_soc_card *card,
+				  struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai_link *dai_link = rtd->dai_link;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	int ret;
+
+	/* do machine specific initialization */
+	ret = snd_soc_link_init(rtd);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_soc_runtime_set_dai_fmt(rtd, snd_soc_dai_auto_select_format(rtd));
+	if (ret)
+		goto err;
+
+	/* add DPCM sysfs entries */
+	soc_dpcm_debugfs_add(rtd);
+
+	/* create compress_device if driver is supporting */
+	ret = snd_soc_dai_compress_new(cpu_dai, rtd);
+	if (ret != -ENOTSUPP) { /* driver is supporting */
+		if (ret < 0)
+			goto err;
+		goto end;
+	}
+
+	/* create the pcm */
+	ret = soc_new_pcm(rtd);
+	if (ret < 0) {
+		dev_err(card->dev, "ASoC: can't create pcm %s :%d\n",
+			dai_link->stream_name, ret);
+		goto err;
+	}
+
+	ret = snd_soc_pcm_dai_new(rtd);
+	if (ret < 0)
+		goto err;
+end:
+	rtd->initialized = true;
+
+	return 0;
+err:
+	snd_soc_link_exit(rtd);
+
+	return ret;
+}
+
 struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
 					       const char *name)
 {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 9a0e058f34271..c1d64892f3876 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1076,54 +1076,6 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 }
 EXPORT_SYMBOL_GPL(snd_soc_runtime_set_dai_fmt);
 
-static int soc_init_pcm_runtime(struct snd_soc_card *card,
-				struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_dai_link *dai_link = rtd->dai_link;
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	int ret;
-
-	/* do machine specific initialization */
-	ret = snd_soc_link_init(rtd);
-	if (ret < 0)
-		return ret;
-
-	ret = snd_soc_runtime_set_dai_fmt(rtd, snd_soc_dai_auto_select_format(rtd));
-	if (ret)
-		goto err;
-
-	/* add DPCM sysfs entries */
-	soc_dpcm_debugfs_add(rtd);
-
-	/* create compress_device if driver is supporting */
-	ret = snd_soc_dai_compress_new(cpu_dai, rtd);
-	if (ret != -ENOTSUPP) { /* driver is supporting */
-		if (ret < 0)
-			goto err;
-		goto end;
-	}
-
-	/* create the pcm */
-	ret = soc_new_pcm(rtd);
-	if (ret < 0) {
-		dev_err(card->dev, "ASoC: can't create pcm %s :%d\n",
-			dai_link->stream_name, ret);
-		goto err;
-	}
-
-	ret = snd_soc_pcm_dai_new(rtd);
-	if (ret < 0)
-		goto err;
-end:
-	rtd->initialized = true;
-
-	return 0;
-err:
-	snd_soc_link_exit(rtd);
-
-	return ret;
-}
-
 static void soc_remove_link_dais(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
@@ -1679,7 +1631,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	}
 
 	for_each_card_rtds(card, rtd) {
-		ret = soc_init_pcm_runtime(card, rtd);
+		ret = snd_soc_card_init_pcm_runtime(card, rtd);
 		if (ret < 0)
 			goto probe_end;
 	}
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index 1ec7aec68cb9c..2b4beca5f9e5b 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -21,6 +21,8 @@ void snd_soc_card_debugfs_init(struct snd_soc_card *card);
 void snd_soc_card_debugfs_cleanup(struct snd_soc_card *card);
 void snd_soc_card_resume_init(struct snd_soc_card *card);
 void snd_soc_card_fill_dummy_dai(struct snd_soc_card *card);
+int snd_soc_card_init_pcm_runtime(struct snd_soc_card *card,
+				  struct snd_soc_pcm_runtime *rtd);
 
 /*
  * In soc-core
-- 
2.53.0

