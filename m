Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B51B1FC112;
	Tue, 14 Jan 2025 18:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736880233; cv=none; b=tHKn9/pvs8EVsa3p61jYCCllJQ0xFp9E5gogyWDGcMoKjEDSZAwMzTuOnP2NkHk0Oa9HawexiPw9NbtmGLFsECm7595Vke3rN3RfRzhfDd6YcHAJ1VkPNMx03ZnIr2D/fd2PnkL0wLQHvrGmsQsI3YdSjifmXIhgx0ItRUMxrUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736880233; c=relaxed/simple;
	bh=UW8vtfJt25I/oIrst99ORG1EHi6yn7aqooLhqnpVv00=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oybICw44GgnawyM+caHUe2CK+tToeTbQBxKXy6Sn5Kq9f1oz3Tb1EL7W9xhhF40BaJklGOkCiFODIMqcyi3MDMEZavTPH41qINOO+Eum2GYVdiMJR/aKB0Q5FkwGSFkeIOD0Pvs3JVk1ItxP8xczmMo/CIMuAJT8gMqv3SvtS6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEk5E3/P; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEk5E3/P"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-436a39e4891so40958815e9.1;
        Tue, 14 Jan 2025 10:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736880230; x=1737485030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MP0r3bLoYVFjRqfDo7Jhs9cI1EAJ7/k8Z9o0RtLWnWA=;
        b=dEk5E3/Pz8KAz9P/QHeutLj/jJNuIoxc8NB2uW1AVXT5VKVE5XJlyjVlvHBErJhzxF
         yzOMMUf3aUntRbjZ/JAoq8VqkJsXZcp4fsvJuqgag2X6O/eYzrs/o1zixi0Ee+771Zhm
         8Cx/OIVj4FVTYh9QbCsxlcmih4CO10E0CBnTSqM2pISRvNR5NFWZxrbSbKwND9bAlyeO
         uMFVvVweRDRXlRpiCI6Ya8FqRP4n4+OE9Uqqvh6YrwujDYxpCiLROREDuccINrDLNLdd
         dxL+4Ck6mv/imoWI2HsBok+HCl/Q1Et+o/EjDs25ZvJrQ1MJU9YnmqI99BQlpIImGk4K
         b8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736880230; x=1737485030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MP0r3bLoYVFjRqfDo7Jhs9cI1EAJ7/k8Z9o0RtLWnWA=;
        b=iM0aBKs8ePNxqvrouqBsuEHShPb5+wFLkfrS8XCnObxh5KakXpG4tUuH/+URB2BEQK
         +RZk/UAuUS/4RTSdBgvBzc9U+IY3ydawp1CdOmixBP+dgmFoFcBCUNZjnuTbNmgCV8RK
         V5i1PFYcV5um2Sh79lsQ9yjrXNz7n5XnsOVKggnMtlzq/gxuzQhsMYswu1Gncn3rBwch
         IT97X96KnEFJ/4RXuB0n1TAoYkwMnTL8rAyRSdyiN4FT95Ls5wzWjaDKTGB+UrmaGng8
         cLreojnX8UVVj5VzN1V5SbNjWeNE3zEZLO0pRsJTAfp0yUwwH+WWxvqV53TJyv4ffRB7
         uxIg==
X-Forwarded-Encrypted: i=1; AJvYcCV3eSqFQl4g2YM4QweEsasPnbjOOxQvNyZaUc+StkOQghIGaqrAcRDPZW31BzJnlmjw6TVeBxYmeObC8XQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvwuV3xsNCs7k/4NnQF1HlQGWrzH//dIpw7TziPLS0BTASiYwG
	X8xDO1CuZMrtIvGq00ZOSFz42ZmKFBTLk684TYmpd39zW3yPmjdh
X-Gm-Gg: ASbGncuxncce41OUId+PnGqU6gI7+rOLEIefDUM4M6cuc4afLGIT3aLOfX1Y7fCWdaU
	5D+5XyXlOJDwyO2LktCFwBeasKEXoTdlVUVd9dAApyNaLxOv3BwwC9MiFGTiG4khk4U1K7TJ/fD
	fF4wY77FgbP/niR/k5TEeIDctRe9ukxIlpin2KcqjHYrA8+snoioeMpiU3aBk+MTfsb6RyzezQ0
	I0rWbu/394RArlUIixHTD+leMDkT59w8CSCAcSNRFTuhOxRplFo7ORmjwughPeJOauHgg00p5OS
	J0iDNufHqWdqLOaDkF4=
X-Google-Smtp-Source: AGHT+IHEwYpLXBqTu6E5qHFpUiy6AbbrF30PjYBon/qehxptRuBf6hwPW//yIbYrl7eV4Z78Oiz+9A==
X-Received: by 2002:a5d:5f55:0:b0:385:f19f:5a8f with SMTP id ffacd0b85a97d-38a872c881emr17448233f8f.4.1736880229754;
        Tue, 14 Jan 2025 10:43:49 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9d8fc67sm186421205e9.8.2025.01.14.10.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 10:43:49 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] ASoC: simple-card-utils: fix priv->dai_props indexing
Date: Tue, 14 Jan 2025 13:43:14 -0500
Message-Id: <20250114184314.3583-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250114184314.3583-1-laurentiumihalcea111@gmail.com>
References: <20250114184314.3583-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

As of commit cb18cd26039f ("ASoC: soc-core: do rtd->id trick at
snd_soc_add_pcm_runtime()") the ID stored in the PCM runtime data can
no longer be safely used to index the priv->dai_props array. This is
because the ID may be modified during snd_soc_add_pcm_runtime(), thus
resulting in an ID that's no longer a valid array index.

To fix this, use the position of the dai_link stored inside the PCM
runtime data relative to the start of the dai_link array as index into
the priv->dai_props array.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 include/sound/simple_card_utils.h     |  7 +++++++
 sound/soc/generic/simple-card-utils.c | 10 +++++-----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index f6bfd485c31a..892f70532363 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -89,6 +89,13 @@ struct simple_util_priv {
 #define simple_props_to_dai_codec(props, i)	((props)->codec_dai + i)
 #define simple_props_to_codec_conf(props, i)	((props)->codec_conf + i)
 
+/* has the same effect as simple_priv_to_props(). Preferred over
+ * simple_priv_to_props() when dealing with PCM runtime data as
+ * the ID stored in rtd->id may not be a valid array index.
+ */
+#define runtime_simple_priv_to_props(priv, rtd)				\
+	((priv)->dai_props + ((rtd)->dai_link - (priv)->dai_link))
+
 #define for_each_prop_dlc_cpus(props, i, cpu)				\
 	for ((i) = 0;							\
 	     ((i) < (props)->num.cpus) &&				\
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index e25b387a9776..dd414634b4ac 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -295,7 +295,7 @@ int simple_util_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct simple_util_priv *priv = snd_soc_card_get_drvdata(rtd->card);
-	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->id);
+	struct simple_dai_props *props = runtime_simple_priv_to_props(priv, rtd);
 	struct simple_util_dai *dai;
 	unsigned int fixed_sysclk = 0;
 	int i1, i2, i;
@@ -356,7 +356,7 @@ void simple_util_shutdown(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct simple_util_priv *priv = snd_soc_card_get_drvdata(rtd->card);
-	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->id);
+	struct simple_dai_props *props = runtime_simple_priv_to_props(priv, rtd);
 	struct simple_util_dai *dai;
 	int i;
 
@@ -445,7 +445,7 @@ int simple_util_hw_params(struct snd_pcm_substream *substream,
 	struct simple_util_dai *pdai;
 	struct snd_soc_dai *sdai;
 	struct simple_util_priv *priv = snd_soc_card_get_drvdata(rtd->card);
-	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->id);
+	struct simple_dai_props *props = runtime_simple_priv_to_props(priv, rtd);
 	unsigned int mclk, mclk_fs = 0;
 	int i, ret;
 
@@ -516,7 +516,7 @@ int simple_util_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				   struct snd_pcm_hw_params *params)
 {
 	struct simple_util_priv *priv = snd_soc_card_get_drvdata(rtd->card);
-	struct simple_dai_props *dai_props = simple_priv_to_props(priv, rtd->id);
+	struct simple_dai_props *dai_props = runtime_simple_priv_to_props(priv, rtd);
 	struct simple_util_data *data = &dai_props->adata;
 	struct snd_interval *rate = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
 	struct snd_interval *channels = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
@@ -627,7 +627,7 @@ static int simple_init_for_codec2codec(struct snd_soc_pcm_runtime *rtd,
 int simple_util_dai_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct simple_util_priv *priv = snd_soc_card_get_drvdata(rtd->card);
-	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->id);
+	struct simple_dai_props *props = runtime_simple_priv_to_props(priv, rtd);
 	struct simple_util_dai *dai;
 	int i, ret;
 
-- 
2.34.1

