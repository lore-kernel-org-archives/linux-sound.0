Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133DA3A6F0F
	for <linux-sound@vger.kernel.org>; Sat, 27 Jun 2026 12:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782564637; cv=none; b=G6r3tZjp+s9/iIog0ENZfjBLifRaWNjpAoTpu/B7yxNf73CRFZDgsYwLuJTYyg5TGyKN1Pd6b/YJZKXrSRkgvPX7C93r2SqeKih7oBCtQiaQn5gPIOYZkFT5Aft9bNtb/Wp9eWPSZPcecyALW7jYs9WS60Sc6d35iTYU3xe2Nl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782564637; c=relaxed/simple;
	bh=qAioeDbQ3Ql+BriUVf3MwJAXS8ui6W2vCcfFRpJy0CA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=MA82I7g0VZo+kqjhWPFwAKfisN7oejcNaJ9tYogPDx2decYMN20b7LFdG6bjs+Lv471x2NOkMEHH1pgxUFAhR2tXBvW4XvvxqtBvVC3e3TbVzi8AUeVJnf28PaFP3hhHi0wRaR4gzuMhl9eQ4fy2fECH3xkrMEORTtHJI95JySQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anmTQy3z; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anmTQy3z"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4926fe5be4bso10148955e9.0
        for <linux-sound@vger.kernel.org>; Sat, 27 Jun 2026 05:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782564634; x=1783169434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CgBb9c2zB8E5ylruIOvxgxXaQ+5aMJ9oD3Y4vVrihts=;
        b=anmTQy3zsDPNFetWSTTTUjIRu0SDTnKbfBBkOpt6vwR2/xCEMhp6MTsXh9eXR8xgI5
         hWyU3B6gkeKyyZS2MsMax4zrPXyG3PCePgDuLCEgnrgHiUpHCJDKbhK8liuZF/itMhcH
         bEIcAFIDNVtKmFnhKmffMExj4uw8WWiOmdjSbKzCER/LgLOhgCEDl6cGT0jSl9OQ8zD6
         54lENRwBRF+CCihOV8hItutbsPXCWWlDjqtyMDKwl78KC8ufsN2DOKTJgqdlwwEZ+8pj
         V45fBp/Z0sGsCtaBmGfNb7maludYlT+fi2Mqu8mhfespHm0jt89J0PmkGW+jrWCuDpyf
         MULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782564634; x=1783169434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CgBb9c2zB8E5ylruIOvxgxXaQ+5aMJ9oD3Y4vVrihts=;
        b=mDWaT//VCyukTJ4nhw11wBwEZK+I7uGw4kz0bEe5M+0I94nbiH/J96Hkj6pCTSOHvn
         PK45eTtzQbu0Shhfd01c+bgKhFBUrayLM56QCyorlVGR54SzuBR8nbFEp6EhVqvg0sat
         Aa05mwrpATcoQv+HJFzeLLBWeRlcf/mVTtEAxMij9ryj2fvbZuBEkqQXNWqZjIZAsD65
         V6bgOe4+D29ysh1OG7XmoRUYQlWLv6C5D2SMjUWeDgE71jl++K33pldh0eEsJrrhtIgs
         3Cczc/SJSLwfEfxUMDdEnXEbQDOrgNodfy06UkOhc1PJBMpzsXhiW5FAAdw5CSowFFX3
         1xeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OCYxFanqTB4vW8KNlsyDfiR44RBMHI/apMOn/CVYivlU9YjWszVDOb7KK8+OwWXtIdewrK1vkgNPmdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXMc5gpOfpZu1x5ai7WjwFlQCEMa6iWxFYxmvav4mbCtOzlc6s
	L0A3sCRoEEkHmcAuyQc6MwXWk4KVeytIlpX5cyyDPzlRUxO7kDxG3XIw
X-Gm-Gg: AfdE7cniE34Yn93CckQG+YSLs9uO4+8NfpiRmkIyVLsgyFKRk5/nQVkrI2xyT+tzKkz
	xLy3jBWv160uP9ZsLUsFYyOXvnGpcR4pRzYyJNNd+Sjbd/QlUhn5++N3WN4Mu1mIf2anpC/woWN
	SI2EzXw1RaoUC+kT6Imo8ttD3Acn8qsmE2a+mEV/in+6K/95gV5NKmlqBPkP/bbLw9f7LE4KcnW
	qnZhvZ8OVTsVIM0ieApCx0ABVlsX3XLSEs1oRSpfQKdl+/LCp9xVThtnIYO2PXEEAVVQc4SYCZ2
	pXxtrXZzFvMgILlzopRSZrKL0nfQtXKJvwoQqfuNr/j0rgd9dywmYiJFuUcwWENUiQQ9m7WVdLS
	qxkVThFBOH//m8Y7NfKoi93jIxlItGhA06To3Lbb20etp7RzX9ep4M0NxANpAsAfdYhuoW1Gya6
	36dIoJiOaU4tqN+7aB
X-Received: by 2002:a05:600c:4f87:b0:492:703c:df36 with SMTP id 5b1f17b1804b1-492703cdf53mr63941035e9.26.1782564634280;
        Sat, 27 Jun 2026 05:50:34 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926f94f213sm105298565e9.12.2026.06.27.05.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 05:50:33 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF datapath on start/stop
Date: Sat, 27 Jun 2026 12:50:30 +0000
Message-ID: <20260627125030.808058-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2S FIFO soft-resets its fast domain on start (AIU_RST_SOFT bit 0 +
AIU_I2S_SYNC read in aiu_fifo_i2s_trigger), mirroring the downstream
vendor driver's audio_out_i2s_enable(). The S/PDIF FIFO has no equivalent:
it only toggles the IEC958 DCU, so a stale datapath FIFO can be replayed,
producing the "machine gun noise" buffer underrun - on start when switching
outputs, and on stop when playback ends. The latter is audible on devices
with an always-on S/PDIF-fed DAC (e.g. the ES7144 on the WeTek Play2).

The vendor driver resets the IEC958 fast domain (AIU_RST_SOFT bit 2) on
both enable and disable (audio_hw_958_enable), and when reconfiguring
(audio_hw_958_reset clears AIU_958_DCU_FF_CTRL then resets). Do the same:
reset before enabling the DCU on start, and after disabling it on stop.

Fixes: 6ae9ca9ce986bf ("ASoC: meson: aiu: add i2s and spdif support")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
Changes from v1:
- Add missing fixes tag
- Trigger AIU_RST_SOFT_958_FAST then disable DCU as in the vendor driver

 sound/soc/meson/aiu-fifo-spdif.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/meson/aiu-fifo-spdif.c b/sound/soc/meson/aiu-fifo-spdif.c
index e0e00ec026dc..a9861c5d6637 100644
--- a/sound/soc/meson/aiu-fifo-spdif.c
+++ b/sound/soc/meson/aiu-fifo-spdif.c
@@ -24,6 +24,7 @@
 #define AIU_MEM_IEC958_CONTROL_MODE_16BIT	BIT(7)
 #define AIU_MEM_IEC958_CONTROL_MODE_LINEAR	BIT(8)
 #define AIU_MEM_IEC958_BUF_CNTL_INIT		BIT(0)
+#define AIU_RST_SOFT_958_FAST			BIT(2)
 
 #define AIU_FIFO_SPDIF_BLOCK			8
 
@@ -68,11 +69,15 @@ static int fifo_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		snd_soc_component_write(component, AIU_RST_SOFT,
+					AIU_RST_SOFT_958_FAST);
 		fifo_spdif_dcu_enable(component, true);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_STOP:
+		snd_soc_component_write(component, AIU_RST_SOFT,
+					AIU_RST_SOFT_958_FAST);
 		fifo_spdif_dcu_enable(component, false);
 		break;
 	default:
-- 
2.43.0

