Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2194A2D1F7C
	for <linux-sound@vger.kernel.org>; Fri,  3 Oct 2025 09:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759482810; cv=none; b=ELIjc3pFNqRnYgmIBBSvyzlt9Xi5WhypqJPgDL2LQv1Np2GJR3C5U8JM1bgqsG1VmRkaWLfd/dQCPGvzKKVKU7kCPCUVgu73EUSEx9d25LugxQPDSpz54lkOH6FCyJbMXzAtILFux8cJmqgHl8FngEpwNeFN96fi3H3WqCOYEyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759482810; c=relaxed/simple;
	bh=BQ6TpPNckvkGMLa8nCgEZ4uvHpMY2rXRo9al5sRYSZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DfQ1sAz9aUV1b8iEpdj3U9H1/108BhRLtAwX9lCECfYMdnrzIJmt9xd0I6x1nw3Li3hFNsD7uwEOTWd7/qw9bNMQeeknD+b72hvBCU9fu4pbphaXMI6tODzrE9SrQBjpMgIfkYxSXGLeLZMzZFt7UVx1o0QAfTH/CujOmTFxeSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H9m6ytHA; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9m6ytHA"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-27ee41e0798so29091855ad.1
        for <linux-sound@vger.kernel.org>; Fri, 03 Oct 2025 02:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759482806; x=1760087606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x3w4aXsrWjnUKMZk9fA+/Y2yLLmb0WxYC/X8uHWERpA=;
        b=H9m6ytHAkBbT9UF8YNCrhs+qRQsrDoFyjlWEUPZDk8GqNkCx3Ys75/PUdmBxhHg3Aj
         EwRwi1UJnOPSWPgge8QNzXKtcqvpRO5sRb3E3EKuN8LeGeKNzFfVzbPFDmcAUANPUIXA
         mCEtzi2JsRfkN++wKrlCfP7fboN3/mrZYGFYW51sPFPg69VifksBwvuuPC/hR3XGbcNW
         hUV6xjNlRsxoLUh2+isgVQeMrRHxBflNWQREvHtBFVFApeBmJYwDJvfPUaPUt9IRX69S
         bGmF/xxu58BSGdpa3zLFpD4NLQU1Wp4jysIBFGppmS7HNFDKKscMj6RnFhf/Kz9fp4W5
         GLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759482806; x=1760087606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3w4aXsrWjnUKMZk9fA+/Y2yLLmb0WxYC/X8uHWERpA=;
        b=auzOk93yOuLwifhHzTwI3lO0ubqT5BTtldlDXZnnX3EnOwychZR902KJpYoD5ocETF
         2CBBkhcnz6+KNxHuz1dAu/bG4dDLo7LSCBV/H8oqRJU8n9hEoiJCcnTXFHmdk5/ROrKX
         deExQ7AEUpfIYj9AErl/fZyZs0nqCfN63XUI8wcZWCYVPBZctJK+u66kthwhbjBqlYha
         qtnLXt51PxGQDMv6R2z8ebMzg6WEtP6GWRxblms5gdlpDfWJiorgObYICc+hc7dzMcRq
         BHJFC5pbGrmlTo2b7c0mr3U3/WPflNdTlXmBIJgcVrfMkXSgvsWilJw0yUwcA4NwM6GL
         LrmA==
X-Gm-Message-State: AOJu0YwFPnko9QFpYstUTJoJNhFI9GRgiTpKE501T/0K7Et080GRHjum
	5MToCUdPj+7aUftKVHFV+JyKOcQKQYQbGGpBO3C2YpB0m7Nt02E90cjbfjVuHaBdGINr3A==
X-Gm-Gg: ASbGncuO3FH9lDMI7qKVhgTCcC1HY/fe4Eo/uOThbON8FtaFDTJeSO+EdMSns/LX1Md
	mbUyR0XRGG/qVeIVkSydCwPADM3ZizsLfkIT44K3pcYF7g0xCoJ9hD1ZvThEqCJ+8nEGJ4mGs9Z
	skTv+VzEfY+5QV04YkU147OKLOXk2EZCeBVY6Ztjicfsmuqcz3ecX9ruRRRMj3ijNnshNETfaRL
	mDb0/0VL7VGyiOhocexz39ppeLhZK5J7TE6/F54s9c+VzVJiCXp5PDybPg6ZED8gPoHuFh1DdFc
	0f1dl/hwAuICQ9uehapgE3OLBArtxO//mEm9J/apmzcH8tZb8Nexq8eQnWaAa8VEWU3ipGTZZNJ
	le2BgLNMNmFDECCBQc8nBpeEsDv9zwnPBMrTBzLBN5Ja6yNqhV8gNKYNyUSpEInxL9g02zSF0CH
	VckHnALf0=
X-Google-Smtp-Source: AGHT+IGzKg6G62U1gFspKEbZb17bhknIhb1hepfY455zfW67yrMA+EkURag9iWvfAxy4fhg+YyajaA==
X-Received: by 2002:a17:903:11ce:b0:269:6052:3536 with SMTP id d9443c01a7336-28e9a67bf21mr29079145ad.45.1759482806263;
        Fri, 03 Oct 2025 02:13:26 -0700 (PDT)
Received: from localhost.localdomain ([185.213.82.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d5674sm44210095ad.99.2025.10.03.02.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 02:13:25 -0700 (PDT)
From: Brian Sune <briansune@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sound/soc/codecs/wm8978: add missing BCLK divider setup
Date: Fri,  3 Oct 2025 17:13:04 +0800
Message-ID: <20251003091304.3686-1-briansune@gmail.com>
X-Mailer: git-send-email 2.47.1.windows.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original WM8978 codec driver did not set the BCLK (bit clock)
divider, which can cause audio clocks to be incorrect or unstable
depending on the sample rate and word length.

This patch adds proper calculation and configuration of the BCLK
divider based on the sample rate and word width, ensuring the
codec generates the correct bit clock for all supported rates.

Signed-off-by: Brian Sune <briansune@gmail.com>
---
 sound/soc/codecs/wm8978.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/soc/codecs/wm8978.c b/sound/soc/codecs/wm8978.c
index 8c45ba6fc4c3..2109c84f33df 100644
--- a/sound/soc/codecs/wm8978.c
+++ b/sound/soc/codecs/wm8978.c
@@ -717,6 +717,11 @@ static int wm8978_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *params,
 			    struct snd_soc_dai *dai)
 {
+	unsigned int bclk, bclkdiv = 0, min_diff = UINT_MAX;
+	unsigned int target_bclk = params_rate(params) * params_width(params) * 2;
+	/* WM8978 supports divisors */
+	static const int bclk_divs[] = {1, 2, 4, 8, 16, 32};
+
 	struct snd_soc_component *component = dai->component;
 	struct wm8978_priv *wm8978 = snd_soc_component_get_drvdata(component);
 	/* Word length mask = 0x60 */
@@ -820,6 +825,21 @@ static int wm8978_hw_params(struct snd_pcm_substream *substream,
 	/* MCLK divisor mask = 0xe0 */
 	snd_soc_component_update_bits(component, WM8978_CLOCKING, 0xe0, best << 5);
 
+	for (i = 0; i < ARRAY_SIZE(bclk_divs); i++) {
+		bclk = wm8978->f_256fs / bclk_divs[i];
+		if (abs(bclk - target_bclk) < min_diff) {
+			min_diff = abs(bclk - target_bclk);
+			bclkdiv = i;
+		}
+	}
+
+	dev_dbg(component->dev, "%s: fs=%u width=%u -> target BCLK=%u, using div #%u\n",
+		__func__, params_rate(params), params_width(params), target_bclk,
+		bclk_divs[bclkdiv]);
+
+	/* BCLKDIV divisor mask = 0x1c */
+	snd_soc_component_update_bits(component, WM8978_CLOCKING, 0x1c, bclkdiv << 2);
+
 	snd_soc_component_write(component, WM8978_AUDIO_INTERFACE, iface_ctl);
 	snd_soc_component_write(component, WM8978_ADDITIONAL_CONTROL, add_ctl);
 
-- 
2.47.1.windows.1

