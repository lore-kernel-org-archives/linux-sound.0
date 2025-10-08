Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7409287268
	for <linux-sound@vger.kernel.org>; Wed,  8 Oct 2025 16:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759939511; cv=none; b=WE/uznK4Ilg2/6m2HktU0mk0HzSCRnKEPqsZ5DFu8c4amSLGqtgYAGvOnBHQgBQubXI64rjwmEwKRzagcZacNcuViS98WO6PpmQ/dCVF2mhbtQ3EfVVoaZKraz9erCkV50Hj/QLI23FLpe/MyO2pMvpEOXiXyFz01UhtbpSFDPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759939511; c=relaxed/simple;
	bh=K08WfS0zn9WdF9OY55ASJ9oYL9UzYTBlPczRzX3vcjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=btZAUdx3M/iEmypULSXZkzPFFjPxRTpUltRQJ1cjpJrLLwA7t+dUvL8v1qoPcUwPIKZHKtZhvZL/Skzbb7Zn6AeGoCj0Ivv5i4gh7yANpIXCVS2EKSqh/nEOGqYVQITj8OlYmj2EQXKWrGidEZWLcTByvj+POZ8IuF7dbWgyvBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HC3fEM16; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HC3fEM16"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-794f11334adso46886b3a.3
        for <linux-sound@vger.kernel.org>; Wed, 08 Oct 2025 09:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759939509; x=1760544309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/4uNl2Ay0LlgN6EXPwo8K9A/+ge9VPm7JFPlv/QSzME=;
        b=HC3fEM168QQCwro8QA/jHrMNTqlovYXZEeiJgNNMTl6F383J/L883CzHPH/OTIfebw
         OW9Dmc9FedFgUpM87B+udGHqlacknGmLSEhCy8uXJeGqkTeT3bdNUf8EnZkZc6vNRu5+
         E8+9gxNtvbcNK0bzeHT77v9x1DaZQ/ZRp1ZX/Y+WstevohLSmcrC64R3VPPZ/1odHOO1
         DQKr3qdFFHf1sCpgVG7LVXd2F6iE2xCe8Aop8jMan60axguROfTY3IyGuNlPaHnx9occ
         JBX0ujhaWjxV6VCuvXrdAZ/trrkNg9C5jasxDJwH4eROU+0nfAGNYiM8FVheB9mADoTw
         T77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759939509; x=1760544309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4uNl2Ay0LlgN6EXPwo8K9A/+ge9VPm7JFPlv/QSzME=;
        b=fDwz5OCO/uwiqFYriwFO6ozfJhgpYLksIv7m8hk6hpZaKP4oz5V1fr17U2LhsNsX4j
         BMZwj1sgVJwPalrq9kkcqRf2MSpISKniY8sQogrkYCdPSLnvVmSUHF1lULPLkBrGJppZ
         H5RHSQqZSO0hXre/WS3wnxAM+aH5iSP0RiZlNJBYrDfAbvesPUIkuhHRRtryxBHo5coq
         DB7i5AUqZ1+tRRU8LUR1DbKD1VvHKTB0MBbHk6/7FlOlBXJkOcbHLSsV0An0DUTEMjFS
         jA0mSGH3LB/ZpHG3LSnaNRU2rV1TmucBDEI4sojHFMTjtzZAV9IlyvEh5mbWnl1XcOM1
         5Dbg==
X-Gm-Message-State: AOJu0YywS7M0p0BRXKjZjzUWrrb0L4Sb0uTQVW9SRX3P/Ok1MeTJqIDA
	TC01B+AyRX3xCtuwGGIFSJSbF9zvg1oX1frP16y7NcvZdjKjtvSRYMMM
X-Gm-Gg: ASbGnctcpiDEfJ0tvqXD7cFOtNHTGLuJdyAJUAuSXIJBm05C7vlX+KaNa7FiPpiS+JT
	nCsYljosgt/+gY4u0guIsHk85d5NfS/jJcjHGSfoUUj/vLyDFv3zLRLoPl0+krqz2iFF8AtzQph
	0u/OgmOcgAmTNkSo7dxppjkwCrEsL2qcz+cVCxWGiYAn4SMW2t6RtLAq7QDwgobNHRp1xdBKIMn
	ozK+uvZk2m4Y34AP9mhNheOVafkDGVhS0/YwU7GqGLies0OW8QgdLiDcn+sHLrNNx4ulUHjBRBU
	wStf3PmsySIEBHmr2MSwgepBxbr6Sih2m5vf7vmXdTE4O1qOuHkGhhBg7fMh+rg1hv/wmKksxqF
	IH1EfHGCK+7sM4fNUA0KnZuDHicpABf17gTT82QfvPg1WwerKn49fyitHSez0nlsmg7rjRJs/
X-Google-Smtp-Source: AGHT+IHSwlR9X8nvzvyK35SoahmqhhUuc9WoGLaGvsDB3ru0DwXBEkmxWja+WJ5QFHVue0BRF6f0jA==
X-Received: by 2002:a05:6a21:501a:b0:2e5:c9ee:96fa with SMTP id adf61e73a8af0-32da83de32fmr3996700637.34.1759939508502;
        Wed, 08 Oct 2025 09:05:08 -0700 (PDT)
Received: from localhost.localdomain ([185.213.82.31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794dbc5a6c5sm120658b3a.54.2025.10.08.09.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 09:05:08 -0700 (PDT)
From: Brian Sune <briansune@gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] ASoC: wm8978: add missing BCLK divider setup
Date: Thu,  9 Oct 2025 00:04:52 +0800
Message-ID: <20251008160452.1741-1-briansune@gmail.com>
X-Mailer: git-send-email 2.47.1.windows.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In previous WM8978 codec driver versions, wm8978_set_dai_clkdiv
might not have been called for BCLK, leaving the bit clock
divider unconfigured. This could cause incorrect or unstable audio
clocks depending on sample rate and word length.

This patch adds a check in wm8978_hw_params: if the BCLK divider
has not been set via wm8978_set_dai_clkdiv, it is dynamically
calculated and configured at runtime.
This ensures that BCLK is always correctly set, whether the
machine driver configures it explicitly or not.

Apart from this core patch, due to request from Mark Brown and
Charles Keepax. Overclock BCLK setup is applied, and dropped the
possible lowest error BCLK result. On top of the overclocking,
warning message is given to user as a reminding.
This patch author do not agree with this design nor
concept from first place!

Signed-off-by: Brian Sune <briansune@gmail.com>
---
 sound/soc/codecs/wm8978.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/sound/soc/codecs/wm8978.c b/sound/soc/codecs/wm8978.c
index 8c45ba6fc4c3..d894d1cda326 100644
--- a/sound/soc/codecs/wm8978.c
+++ b/sound/soc/codecs/wm8978.c
@@ -99,6 +99,7 @@ struct wm8978_priv {
 	unsigned int f_mclk;
 	unsigned int f_256fs;
 	unsigned int f_opclk;
+	bool bclk_set;
 	int mclk_idx;
 	enum wm8978_sysclk_src sysclk;
 };
@@ -590,6 +591,7 @@ static int wm8978_set_dai_clkdiv(struct snd_soc_dai *codec_dai,
 	case WM8978_BCLKDIV:
 		if (div & ~0x1c)
 			return -EINVAL;
+		wm8978->bclk_set = true;
 		snd_soc_component_update_bits(component, WM8978_CLOCKING, 0x1c, div);
 		break;
 	default:
@@ -717,6 +719,11 @@ static int wm8978_hw_params(struct snd_pcm_substream *substream,
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
@@ -820,6 +827,31 @@ static int wm8978_hw_params(struct snd_pcm_substream *substream,
 	/* MCLK divisor mask = 0xe0 */
 	snd_soc_component_update_bits(component, WM8978_CLOCKING, 0xe0, best << 5);
 
+	if (!wm8978->bclk_set) {
+		for (i = 0; i < ARRAY_SIZE(bclk_divs); i++) {
+			bclk = wm8978->f_256fs / bclk_divs[i];
+
+			if (bclk < target_bclk) {
+				dev_warn(component->dev,
+					 "Auto BCLK cannot fit, BCLK using: #%u\n",
+					 wm8978->f_256fs / bclk_divs[bclkdiv]);
+				break;
+			}
+
+			if (abs(bclk - target_bclk) < min_diff) {
+				min_diff = abs(bclk - target_bclk);
+				bclkdiv = i;
+			}
+		}
+
+		dev_dbg(component->dev, "%s: fs=%u width=%u -> target BCLK=%u, using div #%u\n",
+			__func__, params_rate(params), params_width(params), target_bclk,
+			bclk_divs[bclkdiv]);
+
+		/* BCLKDIV divisor mask = 0x1c */
+		snd_soc_component_update_bits(component, WM8978_CLOCKING, 0x1c, bclkdiv << 2);
+	}
+
 	snd_soc_component_write(component, WM8978_AUDIO_INTERFACE, iface_ctl);
 	snd_soc_component_write(component, WM8978_ADDITIONAL_CONTROL, add_ctl);
 
-- 
2.47.1.windows.1

