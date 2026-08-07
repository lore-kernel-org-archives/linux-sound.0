Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5432264B0
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786062063; cv=none; b=D65HlUdq48KVvlBGjuKuVsMolgORWd6QP0H3UIxbUhI8iVXC33aADPmfhICWoZ81k41XnXb+ww+7TtpgHp2PibFED87YGxu5/Gem/ZMoOslY8RLmveMkrmx9s/P7WJ2gi2kBYOv/+5RDMn4wpePRGYsJfqtJPhhepBWXFMuSKRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786062063; c=relaxed/simple;
	bh=049Z2R+ZU+vBHU9gpj7QoB3yYPHlZIaAgbVoEm2QHBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IcMU6aAaIx+O9EThGwPLR1AmMk/chtuCZ8R47uZ3M0pJIT26+jkOWnbznzrATClXe2/UiZtDCCautIXH9a/MqVCHxnJUBk4WrvO9qefoL3xef7X6YauZc3H+myy65o0JVou1bqisMzl8/5lbOzKHi36vJK4nuSoJMGSC2I+1yxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqmqtM/i; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqmqtM/i"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8f1a8e914a9so22661166d6.1
        for <linux-sound@vger.kernel.org>; Thu, 06 Aug 2026 17:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786062060; x=1786666860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=toxh8rwTNL/X7WiYHzoGF/u3b7cgt27qWmy1VXJxv+k=;
        b=aqmqtM/ioHN4TMJMfpF8zf7sUgV8qoWUb8Tqkojv6oMwcvQc0d0MW06hEgtXqTjic9
         C5Q07Ik4Mbzc+W47RWegwrxjIHndxNWr9GMXO5N+Ueh1a75Fy4Ns0r1dxlKEkyo5cEJX
         620FpJpg7UHIJ0XBfZYwYWlGJf+Ie2ljwwc49xdOFYZQNBdKJVHlfMW/GJtQhwMMj0M1
         Pn65v2YEAumft+13srggVkQpE1SJi6pNpMFy59ba53NGtcJaNQXDMtcJdnowuAFDS+UE
         eYqJcedrm54WOuGsvxi9yqbKUdeC19Rlvtfqi48+CA9a+x75TyU6FLRw4eRnl9IXfp3y
         7zbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786062060; x=1786666860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=toxh8rwTNL/X7WiYHzoGF/u3b7cgt27qWmy1VXJxv+k=;
        b=PUY7W+YGz4EcMzqQf6shOy0UogA7i97dF0Xg2/lyFNhethZz2FQ3PnpkzN6UaMClGh
         Us6QZ24ABNc7QHihkEd37/hN08pr3VU0/MWf2q9iuCxtcVCABj9sEipiUc3/kPsdF8VI
         hsFY8bGuQnH3GGdNG6Wd2zdFyP90q0LUG+BF5oImWyZrgykfyXGWTzQuYFhMNvvr7mz6
         Xxr2IZdLqmG6s+Lr3uMAHEOx04Ed8Z6LIXIWhNJh/g8jHFbDpBzCmdFR/t7ouNhAnG9j
         ZKqyapedaEm6cEcqIt1j3s6VAnO3IIAHynQBhFRai4V5uwolEuW4H6uji9rwnXxAw+hI
         lPyw==
X-Gm-Message-State: AOJu0YwmcSUHmeybqxiyLCQmCT2trx5VDDL+miEbb4CfLqd0JW6L8RHa
	ngLOzmNebsZEsYCaqu4GXFAMO4SR+IO7vVcKRQaVu/W0P393rQUgJEaiX0Nh4A==
X-Gm-Gg: AR+sD12l8nPvO2l5acDVc3phr3ljv+fsG7XTals7ZLooUmtTpRH5XSmAuv82VNZDwBr
	cKIsrF4JCiB+Scd06anPpPpr91698+qxlJgUeyHXvdjC7QImjHRsu7hatPyMu0KEBvl8KJFo5gp
	bByAN7AbuBC+d96rgmG7WAYB6j+EFJqLmWLQxEON9QNYLKmnKcIxo6SaDlNh1ijsb/CI1sMSUH0
	N7stOwYNdB/zvewjYmBXExbJHV2YxtvMVO5PbX1meCZAycHidxuWnnPS88T4gdlsDu+yPuB32x1
	mYl+U8ViPqZasdmIvqzvvv7meLaeO1dtaIdRrK0BpYvu9ljCFLptK/9k8DmBNEyXpvB4UfUOf3X
	cHQ/8rrIuxxdMIoqkO0zK+dKsNBOzLlR9SwIc5m6LRhTlhQsYaIkoz7tYZA1xSdQFbpc9ZAYfAc
	XaWc4JLxbDHiOCzBZ/RFu5jMHn/80j0VimoyWKigANVuCKqmpplp501ks9Aja+Z9LtSehPOdrEk
	zuMrhEnko9ccJqcKGHLHq9VClbv7x9qQ5ZS4znowNV7OVxpM2TMFAwxaAXLqrqeEb86XMNe1pQL
	ZHzt0hM10MVzz8+mepCQ8bsiaZC1b0uIzbGPgw==
X-Received: by 2002:a05:6214:29c5:b0:8df:98e0:4594 with SMTP id 6a1803df08f44-908813800f7mr217479286d6.15.1786062059761;
        Thu, 06 Aug 2026 17:20:59 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908800add3dsm64589136d6.39.2026.08.06.17.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 17:20:59 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Michal Simek <michal.simek@amd.com>,
	Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ASoC: xilinx: formatter_pcm: clear stream pointers on close
Date: Thu,  6 Aug 2026 17:20:56 -0700
Message-ID: <20260807002056.42953-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xlnx_formatter_pcm_close() never clears adata->play_stream or
adata->capture_stream, and on reset failure it also skips
xlnx_formatter_disable_irqs(), leaving the hardware IOC interrupts
enabled while ALSA tears the stream down.  A subsequent interrupt then
dereferences the dangling substream pointer and calls
snd_pcm_period_elapsed() on a closed stream whose runtime has already
been freed, causing a WARN_ON or crash.  Since the IRQ is never
disabled, this repeats on every interrupt.

Disable the IRQs before resetting the formatter, and clear the stream
pointers in close so the IRQ handlers' NULL checks catch straggler
interrupts.  Do the cleanup even when the reset fails.

Fixes: 6f6c3c36f091 ("ASoC: xlnx: add pcm formatter platform driver")
Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/xilinx/xlnx_formatter_pcm.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 7eba3a0205f1..e1d2f1cadf8d 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -421,15 +421,19 @@ static int xlnx_formatter_pcm_close(struct snd_soc_component *component,
 	int ret;
 	struct xlnx_pcm_stream_param *stream_data =
 			substream->runtime->private_data;
+	struct xlnx_pcm_drv_data *adata = dev_get_drvdata(component->dev);
+
+	xlnx_formatter_disable_irqs(stream_data->mmio, substream->stream);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		adata->play_stream = NULL;
+	else
+		adata->capture_stream = NULL;
 
 	ret = xlnx_formatter_pcm_reset(stream_data->mmio);
-	if (ret) {
+	if (ret)
 		dev_err(component->dev, "audio formatter reset failed\n");
-		goto err_reset;
-	}
-	xlnx_formatter_disable_irqs(stream_data->mmio, substream->stream);
 
-err_reset:
 	kfree(stream_data);
 	return 0;
 }
-- 
2.55.0

