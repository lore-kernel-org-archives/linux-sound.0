Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCC539283C
	for <linux-sound@vger.kernel.org>; Sat, 27 Jun 2026 13:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782565933; cv=none; b=rdM/cPzerQHMagsIObfP/eHohKdug8PNs8JdhnELekZcy/TetqHglixNOy270Qgf2RdxPf0kZBRwFMmMY+Rq9vYuHV40VFt0XMu8Dl3HGNJURDM4j8GoOEMKaw/Q/oNQ0t+jSJ8UEIufh86haMCOgELGaImVWe9nGDm1yM19Y2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782565933; c=relaxed/simple;
	bh=ikMPwPpVaGjReFp0lLkog0wHEbVrARGqJA6m7oHHbQ8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=sMAIUicJvfpZ5/qmOQPmrFz5wI7CieQnpCvyslE32Pd04wdHGyW4SxxU+6hLupvXlVqYpW58b1KAMz/cZWQYgzIvqLEcZS/7/tMTkZrFgY0BkMTW5jsGHDZMZuD5oAThiRaNiyPAAFpJQlm06a7mq3mlglWDgkZsq22I1PPFqks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZOtI4qr/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOtI4qr/"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4923139e940so10581955e9.3
        for <linux-sound@vger.kernel.org>; Sat, 27 Jun 2026 06:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782565930; x=1783170730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mYYGf5y/FFyUp8Jk8dSfusP7o73GMsKAwMN8eV/HMTQ=;
        b=ZOtI4qr/dxm893OzXAFKyZ+dogy3eC9Kneg1c2LteTGdQWnwIF2T/6U3s2xgrogo+B
         GotTW0yYO1/DiI74izJTysW+AMZeKAnlowkBXKAcaLPpP3ZqlYQmDdjLfl8s2xq8MT5f
         CqDT1LExTsH2lnLNhwCRsfAAUEh3BZpat1ummsrOFbed374SuSB2IdSaWeyevu+xE1T0
         haotElBNGWjgULvHmj7spRCPIuxuY8t6N/q6Qx3SUwZtxWsq20uqHIRUXIj9an2vTwCW
         NVFp71lv19GYm2fy71jMt0E5RDh+/FHKPgEx/zjYno3yv8NGb1ECt+RQhFMkSg5bR2T9
         6/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782565930; x=1783170730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mYYGf5y/FFyUp8Jk8dSfusP7o73GMsKAwMN8eV/HMTQ=;
        b=dq52HAY/f46+YsG7/i+/z7ZvMOhdhdVbFNDhSYjOZhOmAkJjQD53rK0Zja5mdoyBEJ
         af7Rpo79RbSm0NojIsz82X1aJC9neuBPfxDvrCEsU1yP7B3eE96QF4cfWiQ0F0aOEvLz
         kltBq8kbXD6IVSugIKXu6PIFsKR+ElLFq3Nv9Hu3Y2cT2YbHPMJcBoix34i7GBRxkFgk
         r93GKKvnByuDTvMxN2Qy/3SaO6PF+X4LH6oMkPAjFj4ZFylWn1hsHWrjTtyVjpOj9aki
         9B4odCxBl7oijqgsmTmuyTCWE3SL5/ihoWzXqJ5NIYOPNd0a7taPPgUhjNGxkxxlU7wn
         sKCQ==
X-Forwarded-Encrypted: i=1; AFNElJ9h3BZklSOoCJRlxkBU/x+IeRyzpMLNIfkZKMMyCXCmjmWmF6payxac9dsxZWVRLxRidPg75z8Zs0hDCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAWLdjvT+JqWlK5fD5iUY0rs/1yfLBWSDCz74a6YbNEwJg7vM0
	ZAXzXdcNtfIpTRzYGRLBlD2ipSfamqKV5T15YznN8P1eAbqvt14f3ea8
X-Gm-Gg: AfdE7ckSxdVX0YvWwe+4TVocvgzOZ5dVtBjuqCECA5O7CHdJrdAC4v3eGQwr5scMhYF
	xYUn0EwyGq3omjR3VWUX2nwecmjNU9D3+FwozuFShzNOYaCtvbzHCjr81/H3RiU3LKPpsLFU7cj
	u6D/FUAg3HMoHLTOsOBDj7C9DkUOoY79AgozOF4UypsxKkwLyjYl4SotszgtURJBd3sU2Yd96mh
	Rcnm746u482BGsSqX8yWYQnC6VToO18yqEG4dAwc5bWGldjmNv0hMGeNBG5cgCfBd3hq3hnViAl
	5hnbApW9DQcMTLnfmCuRD1q3FkaYxIHAjk2f76I73gI4epD3qcFXK7aKHh6TdVJFRPX2V9wBePp
	+K6GQNf3RgWqsWdErKBoXwN8qZQt0bGizYGFx/nAczGGg9NnHXBILLTvuH9g0xeF00UcxNc13bE
	qf7Mt4t0nmrDAQGSsq
X-Received: by 2002:a05:600c:4e54:b0:492:523f:a3df with SMTP id 5b1f17b1804b1-4926685fccfmr158769025e9.5.1782565929840;
        Sat, 27 Jun 2026 06:12:09 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fde98csm171665075e9.6.2026.06.27.06.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 06:12:09 -0700 (PDT)
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
Subject: [PATCH v3] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF datapath on start/stop
Date: Sat, 27 Jun 2026 13:12:05 +0000
Message-ID: <20260627131205.808800-1-christianshewitt@gmail.com>
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
reset before enabling the DCU on start, and before disabling on stop.

Fixes: 6ae9ca9ce986bf ("ASoC: meson: aiu: add i2s and spdif support")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

---
Changes from v2:
- Ammend description to match the change in v2
- Add Martin's reviewed-by
Changes from v1:
- Add missing fixes tag
- Trigger AIU_RST_SOFT_958_FAST before disabling DCU matching the
  stop flow in the vendor driver, as noted by Martin (tests ok)
---
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

