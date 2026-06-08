Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010026.outbound.protection.outlook.com [52.101.229.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F9F2EA48F
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 00:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780880301; cv=fail; b=E9rcmi1nE55Kj2wtGawuezveHe6PamEbH4d4rm7yqZrTm3TgXv/wTmJil1bW0LkDHImD42AXK42H7h+iWtlcE+Dr9HHD5h6jXj1RV2YhuMpuAM5a6g/nQI158NE+t75RzbKYrj2p3xEDbFD68iR7b3u5tATgmXcgZJOhmxhcFHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780880301; c=relaxed/simple;
	bh=CqP9cdM+NYmFFaj9GHdUAJ1mHVMpHCu0FU6J56vwgB4=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=S+g0GnieZW4o+BB+a3RxwzguN59ABr2kMTrMdgF4EOk69HYok5rAGo3riOsrAXQI7nkAANDXcD2i0otbqGHX7hY0V0U62o0PxyeV9ldaJPPUAPkmhtjoPrS+1ojcJfR5U05NV/kYB2PxbExp7fltcHiyMIyfx8aaSRnKv8EYFrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UVtETWYJ; arc=fail smtp.client-ip=52.101.229.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UVtETWYJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THPBXpUhbGbQMvsVgvxjZQtUtxCjCXGoxmAXc8/uTzz4TFoP8i3cB9u/vAm2uYO5HuKA+fIQuHD3Q2TetKHnql3+CXz/aCTQAb7+SfcT2zXsQe3+tY50FmPFINl5glkorhMWXeurBocRyIpYTV5zM5wm5agae54jKOKkFqY6jkZp0cELys0RWCbuuGrFQ/g7SCZ6HseTQYg4XGQk+E8ewQ88Gi4yFlhKvh2+a/pYfhctFPnatpojSSurB20VhOfjAcyS8xg9M+OEmG0qXxq3K7/veprz6qth6kItLQOktgFSmBJfoe7g9kEbjM4kq0hkOh0+z91tvOqCN58jgXf4kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcecbsgQK+z5sqQTj0aJ7FkKDGjdjtxt/dXd0mHS6AQ=;
 b=qiU9jDLf1sQADr3yS8g5EHrv+o1C0w43WUJVOWLDry8i02OKpL/ephya350vx4vCAcX49NyrwPprFoFkyWofjdUwF+XXkNZPiOvdomrvL1KKQ7hjojJyMtsmjdTdAtajTAiuhTxWr6f4C2keRvusZcQolRvIKHlXPYib3JV32eKi+V5L92rrW+eadtoWazCI9kw1S5X16ox37MHD06zdoUh+U+Uasy9vju7XsYyoFASsgss9g6/t6hncXDERFNFAovyA1Y+39+u38BrI89EFToh2LLzd3372ZDPfQBICm4FbxcmJJvQzuKY8eqtbL+nvLrufD0z2257apXfXaTdrOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FcecbsgQK+z5sqQTj0aJ7FkKDGjdjtxt/dXd0mHS6AQ=;
 b=UVtETWYJX3iG2jWPNjzSleGq/xWbfQoh5WzeSNd5DzkuFeT1znldgw1hqmXMTpMb0aKhprh0ZhRw7uxqdQiHnKK3NllexMFvvMbPkB6iUWtUzRyHlUblRaHD3uZc8UdIoOCT5A8ZeAImiHmR0gK2lJnx8tgnue0OJpw5gDJ+q0s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSOPR01MB17966.jpnprd01.prod.outlook.com (2603:1096:604:478::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 00:58:18 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 00:58:18 +0000
Message-ID: <87ldcpetlh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 8/9] ASoC: update auto format selection method
To: Baojun Xu <baojun.xu@ti.com>,	Geert Uytterhoeven
 <geert+renesas@glider.be>,	Herve Codina <herve.codina@bootlin.com>,
	Jaroslav Kysela <perex@perex.cz>,	Kevin Lu <kevin-lu@ti.com>,	Liam Girdwood
 <lgirdwood@gmail.com>,	linux-sound@vger.kernel.org,	Mark Brown
 <broonie@kernel.org>,	Sen Wang <sen@ti.com>,	Shenghao Ding
 <shenghao-ding@ti.com>,	Support Opensource
 <support.opensource@diasemi.com>,	Takashi Iwai <tiwai@suse.com>,
	=?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
In-Reply-To: <87wlw9etne.wl-kuninori.morimoto.gx@renesas.com>
References: <87wlw9etne.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Jun 2026 00:58:18 +0000
X-ClientProxiedBy: TYCPR01CA0197.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSOPR01MB17966:EE_
X-MS-Office365-Filtering-Correlation-Id: 971e332d-67e6-4cc8-2b02-08dec4f90771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kCDgFE29v6vPDEK3YutB4uoZQzEczKTDmRVcmKzxKyX0nYGrB0gMuV59lP5oLNYdON/Xwrh2QEJvD0cZ+3Py9lnt7qSsUApuoaxpDk/3ZJaT7V+JHPPSshAdrOsa4ce9KEvquC+tLKpa/zg6viIKc/8D/eKe6iNqszSn6E4WCCcgoL657KWDxRcMJtk8Si531LwKnpJ4nw7dPXPU4vnknoemyDmq7sN2sLIwPT5fVVzgTvKRMhybGj3RLG2i7wNkisysBP1hyj83oTG7GD72DvRnqURAJ66uNIZiPQXBYSZHL9kIoUCeInqB8Asg/LCr1cFF8zoOXVxstIwvCOeGRC/tlrxHSvmoVYm85Jr/65aEOkjRZ2CU3Do5OLKOkSEtCRt4MyzPrIHRxRuTPJBnCDGhExu/tni3jx+9K9phshMzpzJotmUsujxnUuw+xs0xiCcnWcuhF8fA/aKr8OneUF3qyX5jfOeENGMG7ce3m6IZjuvwcpLXslMoYjiC2I9D5kwXUlbYlZJBDPGBP3Q30WcUJlVQfjAUSnC6/xasyUi+4k8f4GEgWQLwZlWzKnGv3aIes0B/ZCW3gULIXE/FgWSsYXzqSjXRP30BytadbGDzyV3+GMH4s8zFZc63hH8Xd/Jcr2yrQ1dYARYAqsDQCS38QUr5CN2X3UPo2wfwsGzCRR2g2R+vO07p9bS8+BXw/DlFRrqmx4TJPfgCDwjcy1V/d0/g4LRwwOQ6syyy2SqAqWX+1HK4GLivgKFvCikAVqnUjMxA1k372N8ak6dPkA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QEvmvJ2Dn79C8prTeqQp5rFrakQdlzI+uRPI+6ZoFO1N1sl/gu6B3WRciOQ7?=
 =?us-ascii?Q?6VHMPs9AQj4/qTan/QjwyChWBwvjt4karGQE25w5z0OYL0hgIsc8qg2rKZ/J?=
 =?us-ascii?Q?WMvRqpEwhG1tGQMhB82v5hkPMLg9qSXQpWpcdcNHNQLphNgeXmWrThLa0NyI?=
 =?us-ascii?Q?xzWNOufXbX1C2gWfKLqW/trIYJ/L9wQgPVno6QbNJbuEnceIF9Glsy6tDp+1?=
 =?us-ascii?Q?sE1YwLn1qCEtYoqJ4E+rlD9DJRfoJsxucybJfZmCzeMpnntp+f08hK+Mke+3?=
 =?us-ascii?Q?Sb2TayPtVTix/UaKgUzFwhsNmorl542wEWSp1u/sAjP4OcJdtc25oECF59qH?=
 =?us-ascii?Q?GwDPPApvGsyFjvxhbO66ftHQfwDXiRa3BZotf5DOpRnPVzp8nJLYc5WNeWdi?=
 =?us-ascii?Q?l5TyhJEPGO7IE5kl3hk6jA+1rymdON8EOysuo9qTjvMgSqFVPSEuxzJvwMEx?=
 =?us-ascii?Q?wwE7Z8++46LuUGbX/CyBVRonLSnHZCeVgx86RRDDhkseUhOQbGVqcPTLbglC?=
 =?us-ascii?Q?JYwf/bQQAGWYatL2bKaDtPG2hOxk1rRj03V8cQqMI5iBrHKznARah897N4cY?=
 =?us-ascii?Q?TMFUJsyFKhmMA1oqcUGLnc3ufyAx8+HTGCDjeQdnJKZhp/1NuliIIr0rIUbm?=
 =?us-ascii?Q?Zb957SRTErle8toTA5hVGRVwvONBjIgbVRBsF6rl68jcsm9l1toc0tLww8nB?=
 =?us-ascii?Q?ZrGbl+I83yZzXBx0RDoYj80vslkzumCfG7XXnMrshKDHgU3XiZoRbQGFn2BO?=
 =?us-ascii?Q?WzI4cTpYziofw2KwNcdWQkLn5Xr+e03cd8/Avylay14BF2yqPe2e4MLwNzrh?=
 =?us-ascii?Q?NkztBhHKIH1IvtdH7FjoSAS65QRekvEK8i8ZrbyPAxMEH4Vas9nP+WAw1Ivs?=
 =?us-ascii?Q?njoOps0YqF90jWhPSgsVq7zLGaU+AkeZD7xuEo/4mkxP+eHbWIRCMvzlfBs9?=
 =?us-ascii?Q?Tclb1xApYrESqanQxOkGq+wPUrhqfLs4oSXrB1OWEQHhlDkHc/BmsN1REjr3?=
 =?us-ascii?Q?vP8B9DRlxGvHj23Nc3V6B/QWZFOzE7GdfK0ootSAzX8VFg8Cdr/OOlNg2MbX?=
 =?us-ascii?Q?QR9PcoeuPbvu5lJyH+Ho8zToCgm+VNp7txQ7KSHx8qTN9FGk/FV0QlKXfjY6?=
 =?us-ascii?Q?kXjyYLjjkj56KzhUO41P9P9WnnPoMOQhIevBxcaLsPMGHavu4Um5h2KlHLX/?=
 =?us-ascii?Q?Uc+ATBzR59m/scw/ZcZkwCKn5kUrSW/fZwG4oBRdeWyzObQzSceci1tz8n3P?=
 =?us-ascii?Q?I4r604bnPqo2LUcfyVYDzYapTXMIe6flPqsfBsjfdq0JYOVyZv5pwhx9awP7?=
 =?us-ascii?Q?pcjiSuzmPVbZIEcAhFLiKPHidPLlKfOK2XAcypABd6mcA2kNaJ5TflVKcln0?=
 =?us-ascii?Q?LXo1G95eOCuXN/vlHehOB0VM1YAgNg8k/SWR2mhXJq6xRvLp+6UHri8C24Of?=
 =?us-ascii?Q?kbz3TuSKr7f2hG9jJfJpJNhY0koZQtbkmKQvwy7/lxhl2xb7y3JsUbx+T6cC?=
 =?us-ascii?Q?fvthON2Z1GxfNbccgKav7m4suWkKkwRsc4u8IbiqdIXGeq2r2FEqL2LntnDQ?=
 =?us-ascii?Q?0xrp56pPNeZGQOhzMDOaxIiqBb7HCDP8b7nUuCBr58Yj/J6eTulOSGB978ry?=
 =?us-ascii?Q?PckYmtGysIBxbpsNqcBJhGnaF7zkkYsUi+eiN/0oR9s98WqJpOPC813iDoTx?=
 =?us-ascii?Q?Nq+43QzkObzCWz7WDjvkYYpcRE85qoQaEhccAUXXQGKDk9KrpKBgXTltS62A?=
 =?us-ascii?Q?0uZtpmzljFOQ7CID0O9ZdnqMz5ZfcoH7QkJWRVZ3iRNlkG3ufA10?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 971e332d-67e6-4cc8-2b02-08dec4f90771
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 00:58:18.5150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 382JQcACsJRlcc1slJf1s5lZPRB8NNohsM9wP4m1v+I3GTf/AG8TAdn+r+f+asyALr0CHHMvfhgd/FGS/XwWJwzfzuTh/KQuAkHxBqaQaOvDtkGS+AL387Ffc5HP+PbS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB17966

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

