Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6157248AE3D
	for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 16:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786638750; cv=none; b=ZQccPnwe/XjyebSLGOwKqKlL+eyDjnp+hrVENsoeUGlx+qNe1c5liZ8UkDL8tLKFDb18xznpAVYeMD0/CV8OO95LySy0D8D57wRjugfM8o0nZP5HvPCzGxkrPBN7YFxjmOIPq/nCaCPRt1OWkGUVqzIbTbOS1jiz5tBe2pSU+Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786638750; c=relaxed/simple;
	bh=3T8Gpk4hBZ6/7bKZ34LAXa+oW+i0l/pUwjNPfBxsavw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uVhZO4Hvk1YGmQHRCoG2+NgUoclwrO04RLN3lLC321xg2k1KfaU3mMYU/uFONI9yG8EUi4gJEsLFp3GZ+WwdhDDXhltbPXdYywPKVtfUSA04LhFwht4ncK+Vsb/Kca8/IhoTS6odD5iuKsZEku5Mw6TZTU767KBeNt6qfeuspeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SztbtNFH; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SztbtNFH"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b0231a3e86so948475e87.0
        for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 09:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786638746; x=1787243546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WOaWqaE8RFMDGe7l+nIA7VCXjiyeSRAiT9jJHXAYkP0=;
        b=SztbtNFHOrHFdGGJ4dr3rCgzBURQ/GWwIEBsij6N3kxS6bPmpBd+uVR4CsdmX9gKGk
         G8TfJWhCfKiLuUGX7m/9WvEYb8nyxuCJ6VT8bsi8xzvGcSF79LepZiiUEL2RiGhEpnGf
         KGCLkUDHV+Yq1/6wgxNc8LZfcj9b7aefH1frz2uAv3tkoS9RuDThIcmGKLLOG0zVaAjp
         jbRNk2LacHKIWHWkW0iTd6KQwiLk1Yk6RSY/yK9JMS1wRrodpuU4/Yd68LDYlvJLAjjd
         gR9cb6Vu8Stn2xl0Ug0rmhWgYWzvF304nZlz+hvyVHoTeLTms9cLya02OkGD1JxBAw6s
         Bmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786638746; x=1787243546;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOaWqaE8RFMDGe7l+nIA7VCXjiyeSRAiT9jJHXAYkP0=;
        b=pR/L33vljv+vw9UVCS9HzM4xeD5/0Sp8sL2QtBYuj7/XdRaeaWwQWCzjCGWoxi95V9
         W3IPc9bhB6BGVrRxvXcMynu4oF8SBmLR52XN+ty2LA2pVVsNEDPuIjzxVtP/QyoXvZMF
         9qmh/w2TkjbZC2QaVNofvhTdW/aW/jDVSdnUiqGcs/y3UHvdIA80W0phB1s0UJm/4ENh
         bMDZhiMCg/zk9CrvWamd9HuvEug2ylkGm8Reo5tK9DCTKqCMftY2YJOc4uwgfYX/ISZ0
         i1bG1vSf2Py7FNU5vbpUFKiZkHy9aJwMHhuFFEnPUZjJlgPnN7OgyX24YVs7FscFV5Y8
         qBKA==
X-Forwarded-Encrypted: i=1; AHgh+RpM+yDFhaRVQCfJM+fDCe9twRW62tZEgXuzliXKSeCEtaiotpdbbuEtDdQ6RR9hlLFyiZLavtuUStX6OA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjlDWTV2NVRxzYxRjWXnO4zKzcbEDT4v+Wl5fqVBU3NxleOUu4
	QWUE9+/WFarIpOYJVD3FmU4tLMuKNZ36iUb8cwAvMXBKTJimWM7bGunE
X-Gm-Gg: AR+sD10TxD0kOm9CKbEmK6yr7ac+dIvpxzyDujytwikkD72H0AkUiPCRLujDjAtAhx7
	AyoLU0QQECpAmhNYZkkVAaZlIg2zNm0mGbA4EYlGIuuZsQnjiVPzAGmHs7oltwfjnjJG5QiyG1D
	PC72Ah2gY3wRiLpy2lVc9QBWfuse7DW8kfWJEmW6frcCyHAt4C+AC3RftDfKKxkeBQ5hsYepIbU
	PKYpsVNzroEJxOfcgkATXQUuLoybOMFoQY+4vp+YqtAgNOZg1hKXAfKQeHk+La8w0t6k1KHXS3W
	DSs/UBj28ktI5eOcRAKLLe8uC98lyYKU5kJW/m3GU+KVYlcvjy2dbfIfINHiNfb/0bbUryzGQpz
	nY0vnLe7EkQxIFeomJcxsDkNLgK7XL4aAzY6Y2LXnp0578i3xQu29EWJwkPA8iClP+/N7VDbbVj
	QhHIshUBkmdeYvkvrNKY/pysenxNhXI2c77DAKTiXgd4+CX49c6R2VF57ZvC6ryhELU2sB/5n+t
	Fcw6H/a2xsOX1m97apwx9A=
X-Received: by 2002:a05:6512:3b24:b0:5b2:e890:e6b4 with SMTP id 2adb3069b0e04-5b453f82eb4mr1037445e87.36.1786638746233;
        Thu, 13 Aug 2026 09:32:26 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b453a54adasm586005e87.38.2026.08.13.09.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:32:25 -0700 (PDT)
From: Andrey Golovko <andrey.golovko@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Antoine Monnet <antoine@montane.tech>,
 Robin Everaars <robineveraars@pm.me>,
 Ville Saarinen <wiza@saarinenkoti.fi>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] ASoC: sdw_utils: prepare the stream again when
 resuming
Date: Thu, 13 Aug 2026 19:40:00 +0300
Message-ID: <20260813194000.10412-2-andrey.golovko@gmail.com>
In-Reply-To: <20260813194000.10412-1-andrey.golovko@gmail.com>
References: <20260813194000.10412-1-andrey.golovko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A peripheral loses its Data Port configuration when the controller is
power-gated during system suspend, so the ports have to be prepared
again before the stream can be enabled.  That happens on its own when
userspace calls snd_pcm_prepare() after SNDRV_PCM_STATE_SUSPENDED, but
an application is also allowed to restart the stream with
SNDRV_PCM_IOCTL_RESUME on a card that advertises SNDRV_PCM_INFO_RESUME,
as the AMD ACP platforms do.  That path only reaches the trigger
callback, sdw_enable_stream() writes the channels of ports that were
never prepared, and playback silently produces nothing: the PCM keeps
running, no error is reported anywhere, and the speakers stay quiet
until the stream is torn down and set up again.

Prepare the stream on SNDRV_PCM_TRIGGER_RESUME, before enabling it.
The SoundWire core expects exactly this: sdw_prepare_stream() accepts a
disabled stream and then reapplies the bus parameters without
recomputing them, which it documents as the resume case.

Signed-off-by: Andrey Golovko <andrey.golovko@gmail.com>
---
New in v2, after Mark Brown and Vijendar Mukunda pointed out that a stream
restarted with SNDRV_PCM_IOCTL_RESUME never prepares its ports again.

Measured on an ASUS ProArt PX13 HN7306EAC: without this patch a tone that
is resumed with snd_pcm_resume() alone comes back inaudible with DP1
PrepareCtrl at 0x0 and PDE23 at PS3, with it the ports are prepared again
and the tone returns at its pre-suspend level.  Numbers are in the cover
letter.
 sound/soc/sdw_utils/soc_sdw_utils.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 8a07ba2a29e5..3e091e78d8c2 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1510,9 +1510,24 @@ int asoc_sdw_trigger(struct snd_pcm_substream *substream, int cmd)
 	}
 
 	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_RESUME:
+		/*
+		 * The peripherals lose their port configuration when the
+		 * controller is power-gated during system suspend, and an
+		 * application that restarts the stream with
+		 * SNDRV_PCM_IOCTL_RESUME - which platforms advertising
+		 * SNDRV_PCM_INFO_RESUME allow - never goes through
+		 * .prepare() again.  Prepare the stream here so that the
+		 * ports are reprogrammed before they are enabled;
+		 * sdw_prepare_stream() reapplies the parameters without
+		 * recomputing them when the stream is disabled.
+		 */
+		ret = sdw_prepare_stream(sdw_stream);
+		if (ret)
+			break;
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-	case SNDRV_PCM_TRIGGER_RESUME:
 		ret = sdw_enable_stream(sdw_stream);
 		break;
 
-- 
2.53.0

