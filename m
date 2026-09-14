Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010042.outbound.protection.outlook.com [52.101.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D8D2DF6E9
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 01:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789350386; cv=fail; b=NPc4nfPrdNkS1VxSQ6v3C7Ol+VAHOLwcKeUpsJBdIa535woEXyqaJGPfHntvdAp9z1CGNGjdQNDMeFfEGO7FgACwTnFI611DEt3QhYV2cJYl5eRMs2amRh4F1Kt4eXQRGqB4ljvIza9rSijOybQxBZkWx4zQwnjW68R6yxEqyUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789350386; c=relaxed/simple;
	bh=4ndvHbDdrgCtxs12UaUUyWS4OLuPoI/i93exP95iuQY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PUcM7mWbTEt/QeKw1kHEb5zHQYfHYh8UICM+iLv3uIBXNogLqjuqhrdPNy8DDd+ZptHio2Dsf5d1Z11++2a+FOHIAyIpDL01w/RginNaM5/GVblorJxdfsl59Z6da/HWzpoDGukWORhv0pv9vAyny0FxYyKkSm4csXNXidLBbnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=a9yZbv2i; arc=fail smtp.client-ip=52.101.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="a9yZbv2i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvchD9Dac/XjatCsSomXSzRXaDM0IUTf75oTfo3iKb0zGR2Pa+NAx2TtAVkQS/u6g8tcO+IsIsjfA1EXFh8W2yA9lAcxogdKVhObdNYGOrxsLfra3Ydw4y9tjrsw//k8+aTMXL7NWY8eLld6IBkLSUWBVp1FSHk8QvoiuXcwJJYZFqKKIfMbZbO6moih6EXCH5SrxUHkzz/J+t9b+SADbdJM3ktIn0/yifrhX1P/kmvKte4rj5stp4EYwl8v4lTsNTQP/3Tlp/kt4KRDuVsVt9IiccIfXhghOPNtv8hIcfH8cln01C/QyUgLk8QSG9MoTJTcw2Pe0154OcZeJffcog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7/+gt1jig/34fW7EcHiSyul6bIWrKLos3cdpCNUUlU=;
 b=OTvq/rXFc3hJjOFL+/XHbx4kgOnGrcybhnVA0zqimmyv1j9yQUGl9+4Q6riEhBmsT4ZLvEdLCnxsl2YGl1wagYvE6x7QZvlDU4VeBFYfTUnNcy0DQJ1yciSymQRojALHnBFFqqNjrqUy1sd5C3YPY+yPFD+9oC06rx5ol0BGLL4/WuHBWXA7akkQtHIP7nX2OtUxRHu3HrVnz71gpdZokEVzTNTZEsKfHgtRdXS6R9qydWsC1rAKgWucg5doESMS5Z4+oIbu/wDezubJcZuT869L46FK9ueNF1rju7Lhx6iYu8cNI1mVWvkkBcAzewQC3s8tAMtcCrwg1u6ISzONDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7/+gt1jig/34fW7EcHiSyul6bIWrKLos3cdpCNUUlU=;
 b=a9yZbv2iF7O+ur7jLlm8+NTsoUeiKN7r8DZIDjXuHFjZArpK+83aIWMSihv0xG4PgVs9Md3cZ6LzOBJxYbd23aeKXFekeZfDtWOegJOs51H1XfREYHe5tKyw/22umjDLV5eS5YTrIgPx9MmKznUxdREzlkqVuD2TyauMNJpTgzQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYWPR01MB7202.jpnprd01.prod.outlook.com
 (2603:1096:400:ec::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 01:46:21 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 01:46:21 +0000
Message-ID: <87h5jsli4y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/10] ASoC: soc-dai: rename snd_soc_dai_stream_active()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 14 Sep 2026 01:46:21 +0000
X-ClientProxiedBy: TYCP286CA0188.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::17) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYWPR01MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: afefe43f-4e68-495f-4799-08df1201fa4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|52116014|10067099003|22082099003|18002099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	9vKKryB1kQNK3uXHMY76O/l5Nl57kCIPoexuuMOM4rok+tQH54Gp+Zxf43xXpANdpyPdtdzGce9IS6BKemYU2cDmEGXdNM/1pqLUZfOsQ4PR5v9Z9UpZ2EVoV4OIFLepuaeZ7gw28uSxMev5zlhdD9NL2FZub+xtYDaXpUW0wAYUbMl2p9lETyNDzGQXV2lkfN0qnOi3N6vSUo4qXcucAaHsfLWjYMmcYuHKaHkzFDb8mJc0W28tXFxGtys1CZMi6egBg6za33pm5Bt2pWsP/C971JE0WpNtU0EShKk5CzGNgR2Ga/ng2m4CpKmhD4OP3BGoL/p9GdbWtridTKhELECiYOOO7t4VTmgn5zoE1MKFPSwNNZQTiyTVE1SIoJ/X3kDqlStSwKJ7CygtgOdiUFM8P52aH4miRvqiMFunvgrYAWVTeqf5TyPWXgNghyXkJeyXRLQgjh9fm0G/d1aj2qwaWG5Gdx/sOOa+CcVnmSwRkkSaie2UJhog+7RnNNM1za+9Xy19CtU1c79tTRze1qSfgKM03hRw05pyysTV/alSfqqhgaEB8XG3+EaTvMhP76DMqxSBpBY2vCJ62G2U5yfRGDhby4EAQtFlD94kvTI9cRZ0mffBIgaKV9F+lvnWMERX2jswqpXkOmR643I8omBpj5XH6xLh9QQ/KaGzGJQ77sVNyVaiakIs4hYSikhFcJwAE+RWw/xRXcRFrwiV9FzYfyLuYDmYXGE62zo+Dfs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(52116014)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gGk5Vn7fKBQJnDC81+nCPSnfL7+XIsyAunWsXtCjp608Sv0zdX9D850Ztvam?=
 =?us-ascii?Q?gNKaQ7iDrSruQ9bTNzTo5cnbgyAKI8OBkBLn05p9pRGJmJClHXvpuIOuOAGB?=
 =?us-ascii?Q?qSFM5fHCmVLE7OuDbzfJKAytlKBXfmDfjlAuapSF07dnHE1O/kxIvCJtiUxd?=
 =?us-ascii?Q?cntls8pwpWzY2ojL0c6H3hZuQC4sg20fPWYgT3Fa3zD/qawXLIQQYVsTPgNZ?=
 =?us-ascii?Q?TSJORV+SbjUn7lu/Lvhuv5bttqXQhkfX5n3j3wdt1XTzpNf6IMKDO84Z5mj1?=
 =?us-ascii?Q?hUzoyWjlYdXmriYHTWZg6z1gbKgQ4f990DzE8McRjnm+EyvLfRhKfIUNhuBM?=
 =?us-ascii?Q?W2jNAaiY3pYYFc3mRWOWwO8079kKJW1oL5xiaEL3DjJMjhBQQ93RAX9Ne6Pq?=
 =?us-ascii?Q?a7O/C07zyStfcJNEqlkvzKlnMe8lshH/eg0vxkr2rNptuxeJ8ERi+FR4FIiP?=
 =?us-ascii?Q?WuGD18W2vDU0TTEcm1FWrABsppGYUT/jASLBIwMiQDxfvCFVPACZIdXSI9uY?=
 =?us-ascii?Q?zlRs+8zNOM6dwWvRZepP0SoWqiouL4xzsQF136KSCkI+oEOYKAUJnGV7wOHX?=
 =?us-ascii?Q?rXi9cXet0jmiw13AE9pQPz0sPSmDE7k3yvxfLjAkd8JRV9U+i7i0/lyKoUp2?=
 =?us-ascii?Q?mn2+3IVaSpb2+E1ClcdBEdvvDzV4tw2skdeaE2wzwQy6KMEWomItduQ4xdtm?=
 =?us-ascii?Q?HSnSVUTkFNeMzcGX2N40UohagtA1idNjYnseHJmhlF30nO4gL2q2YMYHwDmT?=
 =?us-ascii?Q?sWnprz4xmzlfNuQ3ouVoQ36TCL5MpYMhsj5CF9Nq7T1Wrqmmumzg/pum9H2t?=
 =?us-ascii?Q?Ca5ZSNUeEu1KamvA+vd10zy6kkYVmlZpwfo+5XxsjXXW8ePMbJ98DJGBc4Wi?=
 =?us-ascii?Q?3QNb97h+mLiZDFUv3XRF0BQ7LQAbvw8LjQY4Pv5TBLW9Jl6AYA8w8MwBpZyi?=
 =?us-ascii?Q?QOsNVfowoGtuzihz2XyO2hhCpgTbifSJLhhZBXvwV5KEUxdMDanXRkWOBcZk?=
 =?us-ascii?Q?2vH68p/oZXjhrYYV91a48KBtnya0sO8zJC2i2UV9t/EafcVJAA4isvw/s1Ke?=
 =?us-ascii?Q?6MAMzn/X0iDaVOFnbaPSMMPd6i1I7u0mInuYn5JSdSYbDTugizlYy0nSJCd8?=
 =?us-ascii?Q?G4kRGGIBgywE4LFZm1FX+YHFISBHA37mscCjIenHoPFsdEPeg5aU6etb7Xat?=
 =?us-ascii?Q?gcPJcVZB6LQ+jwuVHRGuKZ//nyPrYCU69+Iww9SUrB7d5ljz2yqlooTA59vQ?=
 =?us-ascii?Q?QuvTjxVPF5HCbarAPrqX/2kFWwBkYPeoswjNLPJY0sWis1KyaNgW9syDn/3n?=
 =?us-ascii?Q?tC9S5p7UCBY9/SVPvEDv62MreBChuAduwyjCoB5yHaW16O/II/Hih1zvStiy?=
 =?us-ascii?Q?gZHeeq5MBCFYxD4X1QAYpEfswuxMACLAHJEiHT38a2zo/aOMWnyfE22kwcTr?=
 =?us-ascii?Q?D24RdSJ48KId+rsQ08HlWmN3ozmC6GthMvtZ2cWTSyXijAni64kymzx+iKiU?=
 =?us-ascii?Q?rmfA8mDora7Y80m5KaCvEMnW8LYvKJr2iH2aRaItbdUNnhXfuHC9etGCwvN+?=
 =?us-ascii?Q?2wjoUK7lsEzKMdgZvdXTMcPgFJXPiTYpI40LHZ2s6+sFvfvQ0nCVtbIjfmRO?=
 =?us-ascii?Q?ftilXuEDbtcuelHPVk/loxa9QasESpPLM82FlZUhndm2JzfMJvie1khOlqzv?=
 =?us-ascii?Q?UwhIdN0nKFgJfYLgxFzHeVUwo5DzTAAVb7uZ46AH1ShX4I6TgwPFhmVh09tD?=
 =?us-ascii?Q?or55UktwPl9sJZ4E/bpJKjrEqPN0TZiW+9h2d4FsNSxcqcZyvC8C?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afefe43f-4e68-495f-4799-08df1201fa4e
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 01:46:21.5780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e7EivLyKlPYDr04XkwTiA/I/qb85EMF5Jfg3DgmsTzNOPT0mmvFswkCUSLwQirIaF5Zr/iU5+8athlv8cslA6QGdrFmai6d9yzDaoKnEsRbpiYVA8s6cenfABv0izoEK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7202

snd_soc_dai_stream_active() (A) and snd_soc_dai_active() (B) are almost
same function, but implemented different place with different naming.

Let's move snd_soc_dai_stream_active() (A) prev to snd_soc_dai_active()
(B), and rename it (C).

(C)+	snd_soc_dai_active_stream()
(B)	snd_soc_dai_active()
	...
(A)-	snd_soc_dai_stream_active()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h |  4 ++--
 sound/soc/soc-dai.c     | 16 ++++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index e91f87ca57689..52c7f4282ef55 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -244,6 +244,7 @@ static inline void snd_soc_dai_deactivate(struct snd_soc_dai *dai,
 	snd_soc_dai_action(dai, stream, -1);
 }
 int snd_soc_dai_active(const struct snd_soc_dai *dai);
+unsigned int snd_soc_dai_active_stream(const struct snd_soc_dai *dai, int stream);
 
 int snd_soc_pcm_dai_probe(struct snd_soc_pcm_runtime *rtd, int order);
 int snd_soc_pcm_dai_remove(struct snd_soc_pcm_runtime *rtd, int order);
@@ -541,8 +542,6 @@ static inline void snd_soc_dai_stream_dma_data_set_s(struct snd_soc_dai *dai, st
 unsigned int snd_soc_dai_stream_tdm_mask_get(const struct snd_soc_dai *dai, int stream);
 void snd_soc_dai_stream_tdm_mask_set(struct snd_soc_dai *dai, int stream, unsigned int tdm_mask);
 
-unsigned int snd_soc_dai_stream_active(const struct snd_soc_dai *dai, int stream);
-
 static inline void snd_soc_dai_set_drvdata(struct snd_soc_dai *dai,
 		void *data)
 {
@@ -588,6 +587,7 @@ void *snd_soc_dai_to_priv(struct snd_soc_dai *dai);
 #define snd_soc_dai_dma_data_set			snd_soc_dai_stream_dma_data_set
 #define snd_soc_dai_tdm_mask_get			snd_soc_dai_stream_tdm_mask_get
 #define snd_soc_dai_tdm_mask_set			snd_soc_dai_stream_tdm_mask_set
+#define snd_soc_dai_stream_active			snd_soc_dai_active_stream
 static inline void snd_soc_dai_init_dma_data(struct snd_soc_dai *dai, void *playback, void *capture)
 {
 	snd_soc_dai_stream_dma_data_set_playback(dai, playback);
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 1df58861c8388..112e04049d10d 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -718,13 +718,20 @@ void snd_soc_dai_action(struct snd_soc_dai *dai,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_action);
 
+unsigned int snd_soc_dai_active_stream(const struct snd_soc_dai *dai, int stream)
+{
+	/* see snd_soc_dai_action() for setup */
+	return dai->stream[stream].active;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_active_stream);
+
 int snd_soc_dai_active(const struct snd_soc_dai *dai)
 {
 	int stream, active;
 
 	active = 0;
 	for_each_pcm_streams(stream)
-		active += dai->stream[stream].active;
+		active += snd_soc_dai_stream_active(dai, stream);
 
 	return active;
 }
@@ -1159,13 +1166,6 @@ void snd_soc_dai_stream_tdm_mask_set(struct snd_soc_dai *dai, int stream, unsign
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_stream_tdm_mask_set);
 
-unsigned int snd_soc_dai_stream_active(const struct snd_soc_dai *dai, int stream)
-{
-	/* see snd_soc_dai_action() for setup */
-	return dai->stream[stream].active;
-}
-EXPORT_SYMBOL_GPL(snd_soc_dai_stream_active);
-
 /**
  * snd_soc_dai_set_stream() - Configures a DAI for stream operation
  * @dai: DAI
-- 
2.53.0

