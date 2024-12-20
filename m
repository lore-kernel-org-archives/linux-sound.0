Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4267B21883F;
	Fri, 20 Dec 2024 15:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734707583; cv=none; b=SwsPuGCkvmWJZI+EhccR64uJl/n6y8W8SPNgKqnK8GhbtYNmZXMbtN3Kgb7syevDPxm1dWYzRfPfm2o45ryCEmd0B/riT/Z4sCasJ3tJyKkJ3svdzR3AFyux2wgH64FeZ186ceNHLLSSWowqXptDVANKL+gNE/lu1bE4041m23I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734707583; c=relaxed/simple;
	bh=nN5BR/mbD/Bk0gNplrI7fyqs0p527avf9JZ5qm60F3U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qaUHwoY8/2l9+33hCz9Jmz9c4CRHLOy3ThNYDrIhz84EHTnyt8zxkO1FxD8dpGsmQUI/iwfa5L+Ejns+C4fn3ESoa+1Fte/sqCeA2zhSGNOvaf+ERlLtevDR4MHmM+yys27W0f0K5CACO//3AXtQegyK+oh6lHk3rRpCRHTfWGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EyqPM2qj; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EyqPM2qj"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43622267b2eso20507045e9.0;
        Fri, 20 Dec 2024 07:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734707579; x=1735312379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f7gZKHaLNVNRMfBbsC2HggMQQau/kJGoNEgYILpnL50=;
        b=EyqPM2qj8nusE+wtji2c6p5KipfKDJPApImOCkNB+DXOyqElRynPz/WeW3FNZJWDiO
         4fIA+cIJL5bLmaltkg1Ur6+GXOwdijPkg+FyUq/PiFdgEhF1yjCehkiOgiZQBlKW2RGM
         r2VordP2pWBfkJmhbFMZ9tZq03amJz7Z5c1a5Vhl1mRIl5H6jwP1k1iO1MoftDSIdqGM
         b0eFDqAYBl0Fnr+PIsaVoJzNC9pI56xoWmgKQUuypmhQ5pLkcTdN7zwdlnoDcTy4YCCu
         ucXnTIgvxkmzDxHOCmxjuBkN7O503mHeAiyG7ITH6xpUongh8HU/KuJv2L5F/krcNudj
         WRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734707579; x=1735312379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7gZKHaLNVNRMfBbsC2HggMQQau/kJGoNEgYILpnL50=;
        b=eF/QAyLtBNXs50zUNEOeS54nnQhQ/SWsXILO9aHxWlXnv9Y5VX4CqIJE7i6XQgt6u4
         e1M1xGLt2oZeKyZmp487hrZi9pP84zi9H1fzSnksLkg30a0E+CyiWqInUOJAvec2981f
         fPUUw2sZcFfm6UrEpfhVAY7ZbCECZ1SwEwhDYF1iFA6m+wO+Kc3JzjwP7ZW1m/dsNy2V
         yJ68HwOve389vXxZlN1TfouwkSK1a+INRjHEBxHjxN3wINW7ZGbg25Avx8QY2Ey4stXb
         1jhRfBVbcztCWH0sqQXYWNte0KDlTHjR/O0QCW7MYsWX9Iye5QhvhKFtfu6LHg65uCaQ
         XRrA==
X-Forwarded-Encrypted: i=1; AJvYcCXYGtKJdMkF38uwpvnq6gpR+Ir5h6qe/K/6A2gAcxQQsINhTDezw40d2aguKZ/o74BCJMgvC+SawtQLTXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHEUrSmgv0fkYXXvjdJxgsyEwpioo9tDieOoW2UuNoCIpHZHBd
	enwEfvFFoQuBHzVEMQnJgXFsJ420I8ZtzHMUVU1ZbwG7nVCZHhLGcrQTzQ==
X-Gm-Gg: ASbGncsJmQu0H6rsrGUe6dnb0vFbgKBnzG6O+Kc5DVMZ4fBfYwldun1n+dyjO4An6j9
	ldIgUSy9WNujGOKQbug3yyjq+yZ1AWEl06MIPgSpTUY3NiKt0+dN4m18n1csKVX8AGZI4Ov4Bg/
	qNe/gWNVVfYRsMib3X0ugHYGtxwk6BaUZWYekYC+24wivnc4xMlGWXFtjxSk5eucmC/wS/5RFiR
	aGsxX6IpM8MusKUXoqL0z+GaF+Y5qoWqTP+fzEjZw70p0RwG6DNSvAGADXvtYBfDg64HKg54Aaf
	wx+9YcyVu9CXiSSpziE=
X-Google-Smtp-Source: AGHT+IFh9RNoUT9gwF+0XyDw+ZnceuCHjZwgMeLL12wWFCb5+0ZvWWLN+x8neJLnTTO7S4tocQ0cEA==
X-Received: by 2002:a05:6000:4612:b0:385:df5d:622c with SMTP id ffacd0b85a97d-38a221f36e3mr2896891f8f.30.1734707579112;
        Fri, 20 Dec 2024 07:12:59 -0800 (PST)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8a8d3dsm4207172f8f.94.2024.12.20.07.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 07:12:58 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC] ASoC: simple-card-utils: fix priv->dai_props indexing
Date: Fri, 20 Dec 2024 10:12:13 -0500
Message-Id: <20241220151213.2462-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
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
 include/sound/simple_card_utils.h     |  3 +++
 sound/soc/generic/simple-card-utils.c | 10 +++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 3360d9eab068..0122f7871a40 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -89,6 +89,9 @@ struct simple_util_priv {
 #define simple_props_to_dai_codec(props, i)	((props)->codec_dai + i)
 #define simple_props_to_codec_conf(props, i)	((props)->codec_conf + i)
 
+#define runtime_simple_priv_to_props(priv, rtd)					\
+	((priv)->dai_props + ((rtd)->dai_link - (priv)->dai_link))
+
 #define for_each_prop_dlc_cpus(props, i, cpu)				\
 	for ((i) = 0;							\
 	     ((i) < (props)->num.cpus) &&				\
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index a0c3111f7e08..c0f94e1cf0e9 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -296,7 +296,7 @@ int simple_util_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct simple_util_priv *priv = snd_soc_card_get_drvdata(rtd->card);
-	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->id);
+	struct simple_dai_props *props = runtime_simple_priv_to_props(priv, rtd);
 	struct simple_util_dai *dai;
 	unsigned int fixed_sysclk = 0;
 	int i1, i2, i;
@@ -357,7 +357,7 @@ void simple_util_shutdown(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct simple_util_priv *priv = snd_soc_card_get_drvdata(rtd->card);
-	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->id);
+	struct simple_dai_props *props = runtime_simple_priv_to_props(priv, rtd);
 	struct simple_util_dai *dai;
 	int i;
 
@@ -446,7 +446,7 @@ int simple_util_hw_params(struct snd_pcm_substream *substream,
 	struct simple_util_dai *pdai;
 	struct snd_soc_dai *sdai;
 	struct simple_util_priv *priv = snd_soc_card_get_drvdata(rtd->card);
-	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->id);
+	struct simple_dai_props *props = runtime_simple_priv_to_props(priv, rtd);
 	unsigned int mclk, mclk_fs = 0;
 	int i, ret;
 
@@ -517,7 +517,7 @@ int simple_util_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				   struct snd_pcm_hw_params *params)
 {
 	struct simple_util_priv *priv = snd_soc_card_get_drvdata(rtd->card);
-	struct simple_dai_props *dai_props = simple_priv_to_props(priv, rtd->id);
+	struct simple_dai_props *dai_props = runtime_simple_priv_to_props(priv, rtd);
 	struct simple_util_data *data = &dai_props->adata;
 	struct snd_interval *rate = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
 	struct snd_interval *channels = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
@@ -628,7 +628,7 @@ static int simple_init_for_codec2codec(struct snd_soc_pcm_runtime *rtd,
 int simple_util_dai_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct simple_util_priv *priv = snd_soc_card_get_drvdata(rtd->card);
-	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->id);
+	struct simple_dai_props *props = runtime_simple_priv_to_props(priv, rtd);
 	struct simple_util_dai *dai;
 	int i, ret;
 
-- 
2.34.1

