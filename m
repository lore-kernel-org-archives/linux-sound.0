Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B0A3CDBC4
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 08:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782461070; cv=none; b=KfCOwwGkyPqZfV2bI0qFlpWx8ER0GNfQM0Dk6FY7hym0/dPLwIvSvgscFdkUnDG2npmoMuU8QPgK0RT9zzA7jeGGLPmyVxgkT9q/z/tyu11CJB6awSoKbaNyPcrmId1pO0pvN7/SY6pFkC+NayrtTx0fEROC/Dcb+WekrYGf+NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782461070; c=relaxed/simple;
	bh=KjZES4q6S+RD1M9SKDnsCGfxL/RfbGVGUc+xZhxcHuI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ijd/P8PBrUVa21JsfqJx47MuLDqec8a8dfTX+ilsd2jCNX7K5G7ceeHh+uuEApJqaFxjWP/RuEeRPEqN7eqwZgPX2JIZ9YMJQw7QKjXw4g5saAFkWqdFTaj67h9qoypXAORoDpZ2vgpcRAwUOHr1pOSTmJUQwc58DvAKvsPPZ08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sQiAQOgP; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQiAQOgP"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6978f0870c9so1227155a12.3
        for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 01:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782461067; x=1783065867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8BDlwFSAwx/VUcU/0Zc7YpwR/WtK9Ex0Sk5CLPSAtZY=;
        b=sQiAQOgPSwi6TyMswLPJt6i87gpfVe24rERaUIZ1Ffef7l/u0OcBpjkjYeHV+jLORF
         JQz5Y4/tvLJARI1SPjzXxdv9tZdpSrpr1qHpetkZVa9Fet4Zqi4eGaZLhELQNguNl0eh
         +/gxsXp4xfIvFaaOD/eHvrvnmETpdba/Oat5QVn93WQ5hA3R1zcAWaJiGBujtDRwB6Aw
         rhrbvfjRh+l4qoPkToHFTdu7Rfm444OsUahHZHMLEf9tYixfOmXOIt4OInX6TEM+krOd
         4KD2VVURecCH+dW+SwYeRKr4udQNeJKVdc1KoC5cmlzl2XF+JwVVns0JBT60aQyA0fGO
         9/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782461067; x=1783065867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BDlwFSAwx/VUcU/0Zc7YpwR/WtK9Ex0Sk5CLPSAtZY=;
        b=ZKe3YJSEgtQEhG0ZO18Vk4+s+JILZefM6zME69ybEvAvdWg6K/NmR5iVNtwvg/I8sP
         KSzrWJ7iQAH589lZYKYbAw8B8GT/aO7EqqT9gjqN0/ot4JfcNcObUpsIp+1azNdhd+jL
         hLB0r4GisjK5Sz81gYU2VfiHZ7tszJt15+4117q8H5K9RyF3NBqPlosj9ym6FaHOs4sG
         riq5qKxPu5ACG4FWmkPnx9YiSao/Y27TgWxFJnZ/C7Jp/qQecMwbI4bKxphQOnVNUmna
         kKGYth8ssIqbQPF92+vGMYnZbOC8mTL4CBf0mt3GZ8Ho4cN3adA6u0Jg459QKdvlKpOH
         wCYw==
X-Forwarded-Encrypted: i=1; AHgh+RphORk8NajLtlUPqdnGRGGwJ61rS5G1KwIsHGKu73x08moPzqAe6rjs5++U5f6H/VgPksmCx/04Knxjdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBez90W4tod6Sv1suVhWpe2CocBFs5HeKigfDuH6QYM3tqaLbu
	VqjPIrFjiqf63Be63FRhi52yjgUFlABfjJFFVWc1YTa+bTA12NfpHgyo
X-Gm-Gg: AfdE7cmfY5y+JFnagdjjn6xa5ETDZtHD7fM4eu0ftpVe3jFgfaorRD012W8asRcAoHq
	Ycl+P3yKrOU39e8ic06MHDXK5EevUXasaYFB0AFryJ/VkNHEUCOJRgSdP0rMKi87CHKlHlq7AQT
	ylpBgrB2duQHnS2FJgduozS8Xk+VBBH/rLAEwEtFePL2GEjYmAwpFhFZu3LB/fyGDfJQ+y+G4Gs
	cLsaFaRAeM6C5asfk0dJlvIayt6s5KqQjh55i0QyAOMIHwvaYDTW1y2kkEXfLSBJaaiDxY0pCgd
	EYn6CTUftee9LkGxdtlHjuqE+GAiP0CARqB2InLo1BU1FbpXvqAG8HN5Oi5tUswrnuHox9PTZx/
	rbbkhBxGynzeYXvkOxjlMQvrYJh4PsaH+z4eLeB4jB+h1tjrI0YNAAXgo9Mu+twOgpQd2R8Y/Ym
	mv5146wofVJulZIG2l
X-Received: by 2002:a05:6402:3553:b0:698:bbe:9c8 with SMTP id 4fb4d7f45d1cf-69810ae7ec2mr1477123a12.15.1782461066991;
        Fri, 26 Jun 2026 01:04:26 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01c3bsm24027475f8f.10.2026.06.26.01.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:04:26 -0700 (PDT)
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
Subject: [PATCH] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF datapath on start/stop
Date: Fri, 26 Jun 2026 08:04:22 +0000
Message-ID: <20260626080422.4191435-1-christianshewitt@gmail.com>
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

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 sound/soc/meson/aiu-fifo-spdif.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/meson/aiu-fifo-spdif.c b/sound/soc/meson/aiu-fifo-spdif.c
index e0e00ec026dc..826055a71421 100644
--- a/sound/soc/meson/aiu-fifo-spdif.c
+++ b/sound/soc/meson/aiu-fifo-spdif.c
@@ -24,6 +24,7 @@
 #define AIU_MEM_IEC958_CONTROL_MODE_16BIT	BIT(7)
 #define AIU_MEM_IEC958_CONTROL_MODE_LINEAR	BIT(8)
 #define AIU_MEM_IEC958_BUF_CNTL_INIT		BIT(0)
+#define AIU_RST_SOFT_958_FAST			BIT(2)
 
 #define AIU_FIFO_SPDIF_BLOCK			8
 
@@ -68,12 +69,16 @@ static int fifo_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
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
 		fifo_spdif_dcu_enable(component, false);
+		snd_soc_component_write(component, AIU_RST_SOFT,
+					AIU_RST_SOFT_958_FAST);
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

