Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011000.outbound.protection.outlook.com [40.107.74.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30BF221FD4
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 00:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780964621; cv=fail; b=uR/3OKn5mM8prtjQhVMKB5kMWMLP37fs0GSezGyVPf+n4gsaXhWTOlubUbUtKTeFpL64SyqwPoTSUOIsdHVs9fua0nmmdm3W2W7+uyUreLl7c1VIf7wC+YHCy8Bvk1e/lWPF9EJFUPQJDcutl7L1/XiyJS/bbBkQADgQdoZkrEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780964621; c=relaxed/simple;
	bh=CqP9cdM+NYmFFaj9GHdUAJ1mHVMpHCu0FU6J56vwgB4=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=c+kTg2PnosFF6YWaCWbXVnr6Dw8xid3UomlPBSb0xmKpvQ7lNTGXEvLhyAP/T5tfKWArKZxKAmlRxIWbcENZL1Awo2ZN/Is/BHtd7ZPJsxpFTs3yAwLnUA3Ub2rlB9xEfUfsPbUw6TSn6KBGYn7o6Cq4s6a6yAJdEjU+ug/rYxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IRGxSkkS; arc=fail smtp.client-ip=40.107.74.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IRGxSkkS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhXsVSG73WEPDyitN9sfRYEA4UuD1njjE0G4I1yT1TVp+9QE2MMv1tV02WbPhw3+LuKF+YDBy6V/+rew4/Rm27b3jBiF1NWkw6gjosBo8D0jYh3db1Y/UbSCSvOFzyzME7IHq9qH6p6Ws77RL9Pbh/mlQr7LHZWb5V8011f+ykUp8rADPq0cW+JJTn8TKyYImhjBCXV6rMDdCNC8LZE0BMbFRprKibqoWXpYidRMHeWaAp7k9ztFPcIdqc8PoiyTa07cCu0Z9wdtb1xebyOB3GZ566p3ULxyTbrGpz1zkSGSocKWIfzO7qD6UYtQ+nRWAf6CSHDwZpk576B+/ahZwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcecbsgQK+z5sqQTj0aJ7FkKDGjdjtxt/dXd0mHS6AQ=;
 b=cZdFIQvioDIOEAG9p26oNXhtProHPDk5JS3wFjtVoisVylSRKLBHEarY64C6/PXv7becSZhHgq15IaWP7KvA5w2olD4YaO62+9cG3F+9jG6lIk5fE2NN83bWaN6XYmxyHqQioF0CDK0TytybBSWDKonvDgsMRf0c31b/0OUhsgCDbc5OmoTdLDWoy5Ac9j3utgcOsZUCWvAVU1g+/bk09EYCypcJmoN44NU9nu7trkgprNTHnQKfnqCpJKArt/4wtecOht02OeQ6BvHSuQd+0xDUhaL9IakyiMXcMYccH0mWt3elPmLAarEdav2vRyss5XpcKV1WOv2h159+MPGw8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FcecbsgQK+z5sqQTj0aJ7FkKDGjdjtxt/dXd0mHS6AQ=;
 b=IRGxSkkSOTDvb6FPJyx5f8i2diH4rLRPEXc/9pWIY1ZCZ22dg+PS2F2j0OiivLotafUWzl8+lmZTf9BPBqneto8qT19aEdr0udYkr+/3MZKdrT1D+naTToq0UMnGKe8uzs9LJ9QAjMh+RLI85aluKX3uiPABu9/zHtZ9r4ZVekc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by OS7PR01MB13877.jpnprd01.prod.outlook.com (2603:1096:604:36a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 00:23:35 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 00:23:35 +0000
Message-ID: <87jys836k8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 8/9] ASoC: update auto format selection method
To: Baojun Xu <baojun.xu@ti.com>,	Geert Uytterhoeven
 <geert+renesas@glider.be>,	Herve Codina <herve.codina@bootlin.com>,
	Jaroslav Kysela <perex@perex.cz>,	Kevin Lu <kevin-lu@ti.com>,	Liam Girdwood
 <lgirdwood@gmail.com>,	linux-sound@vger.kernel.org,	Mark Brown
 <broonie@kernel.org>,	Sen Wang <sen@ti.com>,	Shenghao Ding
 <shenghao-ding@ti.com>,	Support Opensource
 <support.opensource@diasemi.com>,	Takashi Iwai <tiwai@suse.com>,
	=?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
In-Reply-To: <87v7bs36m0.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7bs36m0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 9 Jun 2026 00:23:35 +0000
X-ClientProxiedBy: OS7PR01CA0229.jpnprd01.prod.outlook.com
 (2603:1096:604:25d::18) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|OS7PR01MB13877:EE_
X-MS-Office365-Filtering-Correlation-Id: 37ccc221-e2ac-4a1d-5562-08dec5bd586a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|921020|38350700014|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wIu+dlKx4xKkjW1afpV7cEMJVIAw3CsGrsOmOdV9ROLsqmKUXXHXMwp0n5scyNkcaFrQ2yBKi5FMXWVaTlUvFVyQFPkvaP6NRflOtE4Y/BNrgFSxhiZFZ9X+XXMFxbZCG78bmEm8thBHzBtLHcGOzy3ofQJkKOmCCT2OpFplktEEzZPMMiFp1N/a+ghi0LpzXfuwD7MSVFrjjc3xFfCymYhGO1Uxi4QkWfvToU2h8FKASEfipPY43DmCUxhcysEJDbxyTS7MU7YUwzW97Qnzh8+N6DnN2SGC6TgJUMO2+nBTNx8xc8SriP/MAmYEUqA39r7X5J87fyob6O39zi/ZW+ZIR9dsDsRdEnLKUYgcU9bFhX6A+dTUfn3Mz2QQTjA+d8jNZhUFv++srDJ77T4/Fl8BoTTg/BMVA6wrwVE1CPGFO9uJUQy31KJt0Ip0PoEqcNWdvTIl2dYcRbcGCuqdKDv2w6A/sMobTeiCR9L2OWp0ALe861I02PyibkpnSYSuvrxVoYd7cC+P+RRH5+nKGZONObdMOdU+OZhYnDc77TwUUbUyXLLBeceVI9u386b2uqbzHIfwFNSd0tuvjatez/Rk/im2QgDWknMyptX1robKJ1+TXK/C5WPxamznMO9rwlo8MWiijgKSJ6QTojkni5df5XiZEk0EVY24MT1Sopg3MinazaCpRPc6Cv33gaFfaVxNGpfZBR7izIyj3dSvMYQlsTjKK2eHWny4r4s6hn85INm0FmPbGN5Wu0+x/+XUGd6tecpqQ1xaq2q9sNV81g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YFdE9khYqTHzVxRGj/gLFx9Sw7o2nNceIRApQNZ/yqIubQGWy51qVpOfvEW1?=
 =?us-ascii?Q?AurAGwpHNySGlbKmxaUx8WT3v9ftZnzu0DhyhM66m2VFmKC0z+gIItICnv8/?=
 =?us-ascii?Q?DOu2+oaDKtdmv2vdhUb1ijSYl3BhCBxJ237NM3TaHIRN5mpSjx56mCIDhH+X?=
 =?us-ascii?Q?mK26qDOzZ3PFKhueovKh6WnBr6CtBeAE1MwqnZkG35nZSlNiAQzCqVKvnUat?=
 =?us-ascii?Q?e85wJGHsavv2q1MvsgUFrZstkn8YNwcieZfzGFquqJ106cdh6OChkPyBdllf?=
 =?us-ascii?Q?/wlr2e/1C+2zN7jfqUMPS9R7jJSYang6AX9MfDlBjGHZCMUGHqFBsfhz9z4I?=
 =?us-ascii?Q?LiMtd4ndLKmS2oOP4Ix48xf2U29O0H4/fmmFqrsJzoydl8JSlJ2kLQms/LdZ?=
 =?us-ascii?Q?Vog1YMSIzh9PBK1saqwg8YU4AYTbvOxL6/ERtojO2VblfQaJtQgtZ5XgMDO0?=
 =?us-ascii?Q?hrWzzl3ix0PZDG9pLC7iyQCk3eCGBvB8+hSnHaI2GpVPlt+51vdGUUGupJzt?=
 =?us-ascii?Q?J7zDNj+993V5PMlcOkxLi3z09xZTe78acQZXZOPSKozcLOTWDd61FOEFVhgc?=
 =?us-ascii?Q?kxHXEe411iP543u7JPXN8P1IJqZR+qETH3QgTNsj81Mzv3F/BTsc0H5kxNV7?=
 =?us-ascii?Q?RMBssRiovVD0bSWyT+116q8igkwo6qjTxayVhQPkDHV2/tD3CjDqaPFpEzuL?=
 =?us-ascii?Q?m0rpWNQbasJaSsDjYr7RHELarikHhFtz5tq0QKmWiZj9RslkOGLBED2NqUg1?=
 =?us-ascii?Q?MX9wY2vuh4vpNXUQlNujcsT77vNmzk1aD48OuKSTv9hH23U8rgUJwJD889Df?=
 =?us-ascii?Q?K1f/ckEspqkHVgHmU5n5F8ZKgBBUNm1GHCB1mnuKaPBLm2HA6BEuxKmZUSWj?=
 =?us-ascii?Q?h5OQeDll2rxX2CaQ5zS39jFwNtm6anVV7kCf1dBRUX03fAT/ThiQBndz80rs?=
 =?us-ascii?Q?oQC/gMXNQJhKw0n0Fje5+iutd35e7B7OERyOfNpXR+4f28sD9CwEuXmgwcqs?=
 =?us-ascii?Q?+n0+J6Bm76VzuxGIGkLCpEiuQwBRVZxx4w3TEyyBnOHr1BKLk2cr7q34Arl1?=
 =?us-ascii?Q?W265bttVp+9n7bdqjV05HaHzliy9zqo0Nnk9o9aTa993YxxWZmRfhp8bk7WU?=
 =?us-ascii?Q?oGXsn/MDobkFhxfHXNRRuiVYzLLa+xHGuVfhioy+6PaFoEI5+JXQCArqvvg5?=
 =?us-ascii?Q?OOD6par65UmaWfgfUrK4IVVQeVirG8XYsepGy/SPy5HhQyLLCvBoDwqAWifH?=
 =?us-ascii?Q?WjMFhmeYS+vRc/wZYEoCnsrjJaaD6zU8tIGMQLQ8ADO5ufbeenoNMZcB1tSw?=
 =?us-ascii?Q?4tpeF1iwAS+z0vjhdhzw9yxQVQE0lUWsXRnEihwMkCtfgdvo3jGvSuMd0NgO?=
 =?us-ascii?Q?nbKUiyg5UbbQ/D4G2zU8qIpvy4U4+Spl51saBrHODM8em94PFc2x23Cz0lK3?=
 =?us-ascii?Q?vwNx7tPvCsR367usjeRIWgCLjz3m+ffVQg0rZDVyMKoUJls3nQiH7foW9YQJ?=
 =?us-ascii?Q?FxMDmZGsP431gO54VxHXZZ/Ln0cINKgETtF8H5m9mJWxeR9fzPfhCeap4zfl?=
 =?us-ascii?Q?734eJPiQMSpKn8ZjEyxSIRtAh62eDLB0nrB2ke9ANdk287v7mVldbDLco8+g?=
 =?us-ascii?Q?I0tA4eq60ytjMl2sJ22vo1br2DnTcYQ7BzNCANQld4RMxc2NPslxPIqUg75N?=
 =?us-ascii?Q?3hTLxbH/1HApotnc3TqVpUPyk09cqdUtjgFpg8DFT2j7H9C2JV7KISfegrMU?=
 =?us-ascii?Q?ZHuzh4X68BMPbZoWVXcdhfMskNyVEoX5pVB8MVutV93IHdd1tuyF?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ccc221-e2ac-4a1d-5562-08dec5bd586a
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 00:23:35.7225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /yCRXH/a7spQkS6B2n9e/3BnPySCp7kil8I0xADX3sRxUeO/OmGm3oIoq6WQDkpCTAixHO0L8+SmiOEqDiGoWc57UJvTUNGm74lqR3VWJoExWTFe5itppKeLc2VbvY4a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13877

Current DAI supports auto format selection. It allow to have array like
below.

(X)	static u64 xxx_auto_formats[] = {
(A)		/* First Priority */
		SND_SOC_POSSIBLE_DAIFMT_I2S	|
		SND_SOC_POSSIBLE_DAIFMT_LEFT_J,

		/* Second Priority */
(B)		SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
		SND_SOC_POSSIBLE_DAIFMT_DSP_B,
	};

It try to find available format from I2S/LEFT_J first (A).
Then, try to find from I2S/LEFT_J/DSP_A/DSP_B if couldn't find (A)+(B).
(OR:ed)

In this method, it can't handle if there is format combination.
For example, some driver has pattern.

Pattern1
	I2S/RIFHT_J/LEFT_J (FORMAT) and NB_NF/IB_IF/IB_NF/NB_IF (INV)_
Pattern2
	DSP_A/DSP_B        (FORMAT) and NB_NF/      IB_NF

Because it will try to OR Pattern1 and Pattern2, un-supported
pattern might be selected.

This patch update method not to use OR, and assumes full format array.
Above sample (X) need to be

	static u64 xxx_auto_formats[] = {
		/* First Priority */
		SND_SOC_POSSIBLE_DAIFMT_I2S	|
		SND_SOC_POSSIBLE_DAIFMT_LEFT_J,

		/* Second Priority */
		SND_SOC_POSSIBLE_DAIFMT_I2S	|
		SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
		SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
		SND_SOC_POSSIBLE_DAIFMT_DSP_B,
	};

Note: It doesn't support Multi CPU/Codec for now

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h |   7 +-
 sound/soc/soc-core.c    | 145 +---------------------------
 sound/soc/soc-dai.c     | 207 +++++++++++++++++++++++++++++++---------
 3 files changed, 166 insertions(+), 193 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index c40823ba54564..ba3ae56c6b062 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -81,10 +81,10 @@ struct clk;
 /*
  * define GATED -> CONT. GATED will be selected if both are selected.
  * see
- *	snd_soc_runtime_get_dai_fmt()
+ *	soc_dai_convert_possiblefmt_to_daifmt()
  */
 #define SND_SOC_POSSIBLE_DAIFMT_CLOCK_SHIFT	16
-#define SND_SOC_POSSIBLE_DAIFMT_CLOCK_MASK	(0xFFFF	<< SND_SOC_POSSIBLE_DAIFMT_CLOCK_SHIFT)
+#define SND_SOC_POSSIBLE_DAIFMT_CLOCK_MASK	(0xFFFFULL << SND_SOC_POSSIBLE_DAIFMT_CLOCK_SHIFT)
 #define SND_SOC_POSSIBLE_DAIFMT_GATED		(0x1ULL	<< SND_SOC_POSSIBLE_DAIFMT_CLOCK_SHIFT)
 #define SND_SOC_POSSIBLE_DAIFMT_CONT		(0x2ULL	<< SND_SOC_POSSIBLE_DAIFMT_CLOCK_SHIFT)
 
@@ -184,8 +184,7 @@ int snd_soc_dai_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio);
 void snd_soc_dai_set_bclk_clk(struct snd_soc_dai *dai, struct clk *bclk);
 
 /* Digital Audio interface formatting */
-int snd_soc_dai_get_fmt_max_priority(const struct snd_soc_pcm_runtime *rtd);
-u64 snd_soc_dai_get_fmt(const struct snd_soc_dai *dai, int priority);
+unsigned int snd_soc_dai_auto_select_format(const struct snd_soc_pcm_runtime *rtd);
 int snd_soc_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt);
 
 int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 4aa145dc5c570..1e107ff905528 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1284,148 +1284,6 @@ int snd_soc_add_pcm_runtimes(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(snd_soc_add_pcm_runtimes);
 
-static void snd_soc_runtime_get_dai_fmt(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_dai_link *dai_link = rtd->dai_link;
-	struct snd_soc_dai *dai, *not_used;
-	u64 pos, possible_fmt;
-	unsigned int mask = 0, dai_fmt = 0;
-	int i, j, priority, pri, until;
-
-	/*
-	 * Get selectable format from each DAIs.
-	 *
-	 ****************************
-	 *            NOTE
-	 * Using .auto_selectable_formats is not mandatory,
-	 * we can select format manually from Sound Card.
-	 * When use it, driver should list well tested format only.
-	 ****************************
-	 *
-	 * ex)
-	 *	auto_selectable_formats (= SND_SOC_POSSIBLE_xxx)
-	 *		 (A)	 (B)	 (C)
-	 *	DAI0_: { 0x000F, 0x00F0, 0x0F00 };
-	 *	DAI1 : { 0xF000, 0x0F00 };
-	 *		 (X)	 (Y)
-	 *
-	 * "until" will be 3 in this case (MAX array size from DAI0 and DAI1)
-	 * Here is dev_dbg() message and comments
-	 *
-	 * priority = 1
-	 * DAI0: (pri, fmt) = (1, 000000000000000F) // 1st check (A) DAI1 is not selected
-	 * DAI1: (pri, fmt) = (0, 0000000000000000) //               Necessary Waste
-	 * DAI0: (pri, fmt) = (1, 000000000000000F) // 2nd check (A)
-	 * DAI1: (pri, fmt) = (1, 000000000000F000) //           (X)
-	 * priority = 2
-	 * DAI0: (pri, fmt) = (2, 00000000000000FF) // 3rd check (A) + (B)
-	 * DAI1: (pri, fmt) = (1, 000000000000F000) //           (X)
-	 * DAI0: (pri, fmt) = (2, 00000000000000FF) // 4th check (A) + (B)
-	 * DAI1: (pri, fmt) = (2, 000000000000FF00) //           (X) + (Y)
-	 * priority = 3
-	 * DAI0: (pri, fmt) = (3, 0000000000000FFF) // 5th check (A) + (B) + (C)
-	 * DAI1: (pri, fmt) = (2, 000000000000FF00) //           (X) + (Y)
-	 * found auto selected format: 0000000000000F00
-	 */
-	until = snd_soc_dai_get_fmt_max_priority(rtd);
-	for (priority = 1; priority <= until; priority++) {
-		for_each_rtd_dais(rtd, j, not_used) {
-
-			possible_fmt = ULLONG_MAX;
-			for_each_rtd_dais(rtd, i, dai) {
-				u64 fmt = 0;
-
-				pri = (j >= i) ? priority : priority - 1;
-				fmt = snd_soc_dai_get_fmt(dai, pri);
-				possible_fmt &= fmt;
-			}
-			if (possible_fmt)
-				goto found;
-		}
-	}
-	/* Not Found */
-	return;
-found:
-	/*
-	 * convert POSSIBLE_DAIFMT to DAIFMT
-	 *
-	 * Some basic/default settings on each is defined as 0.
-	 * see
-	 *	SND_SOC_DAIFMT_NB_NF
-	 *	SND_SOC_DAIFMT_GATED
-	 *
-	 * SND_SOC_DAIFMT_xxx_MASK can't notice it if Sound Card specify
-	 * these value, and will be overwrite to auto selected value.
-	 *
-	 * To avoid such issue, loop from 63 to 0 here.
-	 * Small number of SND_SOC_POSSIBLE_xxx will be Hi priority.
-	 * Basic/Default settings of each part and above are defined
-	 * as Hi priority (= small number) of SND_SOC_POSSIBLE_xxx.
-	 */
-	for (i = 63; i >= 0; i--) {
-		pos = 1ULL << i;
-		switch (possible_fmt & pos) {
-		/*
-		 * for format
-		 */
-		case SND_SOC_POSSIBLE_DAIFMT_I2S:
-		case SND_SOC_POSSIBLE_DAIFMT_RIGHT_J:
-		case SND_SOC_POSSIBLE_DAIFMT_LEFT_J:
-		case SND_SOC_POSSIBLE_DAIFMT_DSP_A:
-		case SND_SOC_POSSIBLE_DAIFMT_DSP_B:
-		case SND_SOC_POSSIBLE_DAIFMT_AC97:
-		case SND_SOC_POSSIBLE_DAIFMT_PDM:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_FORMAT_MASK) | i;
-			break;
-		/*
-		 * for clock
-		 */
-		case SND_SOC_POSSIBLE_DAIFMT_CONT:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_CLOCK_MASK) | SND_SOC_DAIFMT_CONT;
-			break;
-		case SND_SOC_POSSIBLE_DAIFMT_GATED:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_CLOCK_MASK) | SND_SOC_DAIFMT_GATED;
-			break;
-		/*
-		 * for clock invert
-		 */
-		case SND_SOC_POSSIBLE_DAIFMT_NB_NF:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_INV_MASK) | SND_SOC_DAIFMT_NB_NF;
-			break;
-		case SND_SOC_POSSIBLE_DAIFMT_NB_IF:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_INV_MASK) | SND_SOC_DAIFMT_NB_IF;
-			break;
-		case SND_SOC_POSSIBLE_DAIFMT_IB_NF:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_INV_MASK) | SND_SOC_DAIFMT_IB_NF;
-			break;
-		case SND_SOC_POSSIBLE_DAIFMT_IB_IF:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_INV_MASK) | SND_SOC_DAIFMT_IB_IF;
-			break;
-		}
-	}
-
-	/*
-	 * Some driver might have very complex limitation.
-	 * In such case, user want to auto-select non-limitation part,
-	 * and want to manually specify complex part.
-	 *
-	 * Or for example, if both CPU and Codec can be clock provider,
-	 * but because of its quality, user want to specify it manually.
-	 *
-	 * Use manually specified settings if sound card did.
-	 */
-	if (!(dai_link->dai_fmt & SND_SOC_DAIFMT_FORMAT_MASK))
-		mask |= SND_SOC_DAIFMT_FORMAT_MASK;
-	if (!(dai_link->dai_fmt & SND_SOC_DAIFMT_CLOCK_MASK))
-		mask |= SND_SOC_DAIFMT_CLOCK_MASK;
-	if (!(dai_link->dai_fmt & SND_SOC_DAIFMT_INV_MASK))
-		mask |= SND_SOC_DAIFMT_INV_MASK;
-	if (!(dai_link->dai_fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK))
-		mask |= SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
-
-	dai_link->dai_fmt |= (dai_fmt & mask);
-}
-
 /**
  * snd_soc_runtime_set_dai_fmt() - Change DAI link format for a ASoC runtime
  * @rtd: The runtime for which the DAI link format should be changed
@@ -1504,8 +1362,7 @@ static int soc_init_pcm_runtime(struct snd_soc_card *card,
 	if (ret < 0)
 		return ret;
 
-	snd_soc_runtime_get_dai_fmt(rtd);
-	ret = snd_soc_runtime_set_dai_fmt(rtd, dai_link->dai_fmt);
+	ret = snd_soc_runtime_set_dai_fmt(rtd, snd_soc_dai_auto_select_format(rtd));
 	if (ret)
 		goto err;
 
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 1719ddcefa4b0..b098d1100b4bb 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -138,68 +138,185 @@ void snd_soc_dai_set_bclk_clk(struct snd_soc_dai *dai, struct clk *bclk)
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_set_bclk_clk);
 
-int snd_soc_dai_get_fmt_max_priority(const struct snd_soc_pcm_runtime *rtd)
+static int soc_dai_fmt_match_cnt(u64 fmt)
+{
+	int cnt = 0;
+
+	if (fmt & SND_SOC_POSSIBLE_DAIFMT_FORMAT_MASK)
+		cnt++;
+	if (fmt & SND_SOC_POSSIBLE_DAIFMT_CLOCK_MASK)
+		cnt++;
+	if (fmt & SND_SOC_POSSIBLE_DAIFMT_INV_MASK)
+		cnt++;
+
+	return cnt;
+}
+
+static void soc_dai_auto_select_format(u64 fmt, const struct snd_soc_pcm_runtime *rtd,
+				      int idx, u64 *best_fmt)
 {
 	struct snd_soc_dai *dai;
-	int i, max = 0;
+	const struct snd_soc_dai_ops *ops;
+	int max_idx = rtd->dai_link->num_cpus + rtd->dai_link->num_codecs;
+	u64 available_fmt;
 
 	/*
-	 * return max num if *ALL* DAIs have .auto_selectable_formats
+	 * NOTE
+	 * It doesn't support Multi CPU/Codec for now
 	 */
-	for_each_rtd_dais(rtd, i, dai) {
-		if (dai->driver->ops &&
-		    dai->driver->ops->num_auto_selectable_formats)
-			max = max(max, dai->driver->ops->num_auto_selectable_formats);
-		else
-			return 0;
-	}
+	if (rtd->dai_link->num_cpus	!= 1 ||
+	    rtd->dai_link->num_codecs	!= 1)
+		return;
 
-	return max;
-}
+	if (idx >= max_idx)
+		return;
 
-/**
- * snd_soc_dai_get_fmt - get supported audio format.
- * @dai: DAI
- * @priority: priority level of supported audio format.
- *
- * This should return only formats implemented with high
- * quality by the DAI so that the core can configure a
- * format which will work well with other devices.
- * For example devices which don't support both edges of the
- * LRCLK signal in I2S style formats should only list DSP
- * modes.  This will mean that sometimes fewer formats
- * are reported here than are supported by set_fmt().
- */
-u64 snd_soc_dai_get_fmt(const struct snd_soc_dai *dai, int priority)
-{
-	const struct snd_soc_dai_ops *ops = dai->driver->ops;
-	u64 fmt = 0;
-	int i, max = 0, until = priority;
+	dai = rtd->dais[idx];
+	ops = dai->driver->ops;
+
+	/* zero chance of auto select format */
+	if (!ops || !ops->num_auto_selectable_formats)
+		return;
 
 	/*
-	 * Collect auto_selectable_formats until priority
+	 ****************************
+	 *            NOTE
+	 ****************************
+	 * Using .auto_selectable_formats is not mandatory,
+	 * It try to find best formats as much as possible, but automatically selecting the
+	 * perfect format is impossible. So you can select full or missing format manually
+	 * from Sound Card.
 	 *
 	 * ex)
-	 *	auto_selectable_formats[] = { A, B, C };
-	 *	(A, B, C = SND_SOC_POSSIBLE_DAIFMT_xxx)
+	 * CPU					Codec
+	 * (A)[0] I2S/LEFT_J : IB_NF/IB_IF	(X)[0] I2S/DSP_A: NB_NF : GATED
+	 * (B)[1] DSP_A/DSP_B: NB_NF/IB_NF	(Y)[1] LEFT_J:    NB_NF : GATED
+	 * (C)[2] ...
 	 *
-	 * priority = 1 :	A
-	 * priority = 2 :	A | B
-	 * priority = 3 :	A | B | C
-	 * priority = 4 :	A | B | C
+	 * 1. (A) -> (X) : I2S		:update best format
+	 * 2. (A) -> (Y) : LEFT_J
+	 * 3. (B) -> (X) : DSP_A/NB_NF	:update best format
+	 * 4. (B) -> (Y) : NB_NF
+	 * 5. (C) -> (X) ...
+	 * 6. (C) -> (Y) ...
 	 * ...
+	 *
+	 * In above case GATED will not be selected
 	 */
-	if (ops)
-		max = ops->num_auto_selectable_formats;
 
-	if (max < until)
-		until = max;
+	/* find best formats */
+	for (int i = 0; i < ops->num_auto_selectable_formats; i++) {
+		available_fmt = fmt & ops->auto_selectable_formats[i];
+
+		/* In case of last DAI */
+		if (idx + 1 >= max_idx) {
+			int cnt1 = soc_dai_fmt_match_cnt(*best_fmt);
+			int cnt2 = soc_dai_fmt_match_cnt(available_fmt);
+
+			if (cnt1 < cnt2)
+				*best_fmt = available_fmt;
+		}
+		/* parse with next DAI */
+		else {
+			soc_dai_auto_select_format(available_fmt, rtd, idx + 1, best_fmt);
+		}
+	}
+}
+
+static unsigned int soc_dai_convert_possiblefmt_to_daifmt(u64 possible_fmt, unsigned int configured_fmt)
+{
+	unsigned int fmt = 0;
+	unsigned int mask = 0;
+
+	/*
+	 * convert POSSIBLE_DAIFMT to DAIFMT
+	 *
+	 * Some basic/default settings on each is defined as 0.
+	 * see
+	 *	SND_SOC_DAIFMT_NB_NF
+	 *	SND_SOC_DAIFMT_GATED
+	 *
+	 * SND_SOC_DAIFMT_xxx_MASK can't notice it if Sound Card specify
+	 * these value, and will be overwrite to auto selected value.
+	 *
+	 * To avoid such issue, loop from 63 to 0 here.
+	 * Small number of SND_SOC_POSSIBLE_xxx will be Hi priority.
+	 * Basic/Default settings of each part and above are defined
+	 * as Hi priority (= small number) of SND_SOC_POSSIBLE_xxx.
+	 */
+	for (int i = 63; i >= 0; i--) {
+		u64 pos = 1ULL << i;
+
+		switch (possible_fmt & pos) {
+		/*
+		 * for format
+		 */
+		case SND_SOC_POSSIBLE_DAIFMT_I2S:
+		case SND_SOC_POSSIBLE_DAIFMT_RIGHT_J:
+		case SND_SOC_POSSIBLE_DAIFMT_LEFT_J:
+		case SND_SOC_POSSIBLE_DAIFMT_DSP_A:
+		case SND_SOC_POSSIBLE_DAIFMT_DSP_B:
+		case SND_SOC_POSSIBLE_DAIFMT_AC97:
+		case SND_SOC_POSSIBLE_DAIFMT_PDM:
+			fmt = (fmt & ~SND_SOC_DAIFMT_FORMAT_MASK) | i;
+			break;
+		/*
+		 * for clock
+		 */
+		case SND_SOC_POSSIBLE_DAIFMT_CONT:
+			fmt = (fmt & ~SND_SOC_DAIFMT_CLOCK_MASK) | SND_SOC_DAIFMT_CONT;
+			break;
+		case SND_SOC_POSSIBLE_DAIFMT_GATED:
+			fmt = (fmt & ~SND_SOC_DAIFMT_CLOCK_MASK) | SND_SOC_DAIFMT_GATED;
+			break;
+		/*
+		 * for clock invert
+		 */
+		case SND_SOC_POSSIBLE_DAIFMT_NB_NF:
+			fmt = (fmt & ~SND_SOC_DAIFMT_INV_MASK) | SND_SOC_DAIFMT_NB_NF;
+			break;
+		case SND_SOC_POSSIBLE_DAIFMT_NB_IF:
+			fmt = (fmt & ~SND_SOC_DAIFMT_INV_MASK) | SND_SOC_DAIFMT_NB_IF;
+			break;
+		case SND_SOC_POSSIBLE_DAIFMT_IB_NF:
+			fmt = (fmt & ~SND_SOC_DAIFMT_INV_MASK) | SND_SOC_DAIFMT_IB_NF;
+			break;
+		case SND_SOC_POSSIBLE_DAIFMT_IB_IF:
+			fmt = (fmt & ~SND_SOC_DAIFMT_INV_MASK) | SND_SOC_DAIFMT_IB_IF;
+			break;
+		}
+	}
+
+	/*
+	 * Some driver might have very complex limitation.
+	 * In such case, user want to auto-select non-limitation part,
+	 * and want to manually specify complex part.
+	 *
+	 * Or for example, if both CPU and Codec can be clock provider,
+	 * but because of its quality, user want to specify it manually.
+	 *
+	 * Ignore already configured format if exist
+	 */
+	if (!(configured_fmt & SND_SOC_DAIFMT_FORMAT_MASK))
+		mask |= SND_SOC_DAIFMT_FORMAT_MASK;
+	if (!(configured_fmt & SND_SOC_DAIFMT_CLOCK_MASK))
+		mask |= SND_SOC_DAIFMT_CLOCK_MASK;
+	if (!(configured_fmt & SND_SOC_DAIFMT_INV_MASK))
+		mask |= SND_SOC_DAIFMT_INV_MASK;
+	if (!(configured_fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK))
+		mask |= SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
+
+	return configured_fmt | (fmt & mask);
+}
+
+unsigned int snd_soc_dai_auto_select_format(const struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai_link *dai_link = rtd->dai_link;
+	u64 possible_fmt = 0;
 
-	if (ops && ops->auto_selectable_formats)
-		for (i = 0; i < until; i++)
-			fmt |= ops->auto_selectable_formats[i];
+	soc_dai_auto_select_format(~0, rtd, 0, &possible_fmt);
 
-	return fmt;
+	return soc_dai_convert_possiblefmt_to_daifmt(possible_fmt, dai_link->dai_fmt);
 }
 
 /**
-- 
2.53.0

