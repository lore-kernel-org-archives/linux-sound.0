Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D493F1654;
	Fri, 10 Jul 2026 08:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783672856; cv=none; b=Hxyjf0MKUHjejLaOsE+Nmtguuz48axtFqnlL2JXooSTl5/F87pGo1MadfunufiR0Hg2OOWv+KGxz81vnSLasKkkEbttR8KJ4P39zOW1jXyyDOmSYkVgMIQU4E2dDLnp/HS8vDYCb2eTvUvC4pgNZssgMOC60TS7x37PWa/fvMP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783672856; c=relaxed/simple;
	bh=DBQwd6eVgUCN0rjT7V5Z6SU7agbYvS/ZWdiBkiJcybg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lQnC+ApQfK1V7VFrwKBpKze1MwiD7NKkAgHrTrw+OU6qwi+Sem6xkMIua+BJUMKwuH2lEKzKHzyfyo/DUrrbCBS3X/fW2L470LfNpVUWdjzzj4fPtZ9lXu+iBu/EhQJbCz1/bkzp3tK2oePX17xgnnG3HA/oOUXth5mRb5RZzbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=WpIVWD06; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="WpIVWD06"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=0V
	Wj7RfYSAmJyUbEPm8o5PtRCM0dcxCSmc/H+++NpOM=; b=WpIVWD06s7BEb6E0U1
	mpVsaAQdI8cg4cJOm5TV9/1E6k60y8liq26nMlCIXI5D+ZbPwSs/d00w2K5RKA/H
	hmhoOhVoSkyuwG8BjXsFTeq1J0vSOvAtc1Puox3L73q8jocTamYG37BWgf8LO5Dp
	6VNi1mZPQSe0wR67p3oYEHeu8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wAn6Ozsr1BqBwqkHg--.166S5;
	Fri, 10 Jul 2026 16:40:29 +0800 (CST)
From: wangdich9700@163.com
To: tiwai@suse.com,
	david.rhodes@cirrus.com,
	wangdich9700@163.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH v2 3/3] ALSA: hda: Use scoped_guard() for open_mutex in azx_pcm_open()
Date: Fri, 10 Jul 2026 16:40:09 +0800
Message-Id: <20260710084009.665814-4-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260710084009.665814-1-wangdich9700@163.com>
References: <20260710084009.665814-1-wangdich9700@163.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAn6Ozsr1BqBwqkHg--.166S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxtFy8Zry3GryDXw43JFW3trb_yoWxXF18pr
	Wfur40k393XFn2gFn7tw1I9r1rAa4Ska15K393ta40yw13Ga4Ygryvyw109FZak3y2yF15
	ZF4kX347Xr9rKF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRN6pQUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC6B3ZKWpQr-2ttAAA30

From: wangdicheng <wangdicheng@kylinos.cn>

The companion function azx_pcm_close() already uses
scoped_guard(mutex, &chip->open_mutex). Replace the manual
mutex_lock/mutex_unlock pair in azx_pcm_open() with the same
pattern for consistency.

All goto targets are within the scoped_guard() block, avoiding
the goto-jumping-out-of-scope pattern that is not recommended
when using cleanup guards.

No functional changes.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/hda/common/controller.c | 158 +++++++++++++++++-----------------
 1 file changed, 81 insertions(+), 77 deletions(-)

diff --git a/sound/hda/common/controller.c b/sound/hda/common/controller.c
index afec5c5546ec..04ae21cc5e5e 100644
--- a/sound/hda/common/controller.c
+++ b/sound/hda/common/controller.c
@@ -584,86 +584,90 @@ static int azx_pcm_open(struct snd_pcm_substream *substream)
 	int buff_step;
 
 	snd_hda_codec_pcm_get(apcm->info);
-	mutex_lock(&chip->open_mutex);
-	azx_dev = azx_assign_device(chip, substream);
-	trace_azx_pcm_open(chip, azx_dev);
-	if (azx_dev == NULL) {
-		err = -EBUSY;
-		goto unlock;
-	}
-	runtime->private_data = azx_dev;
-
-	runtime->hw = azx_pcm_hw;
-	if (chip->gts_present)
-		runtime->hw.info |= SNDRV_PCM_INFO_HAS_LINK_SYNCHRONIZED_ATIME;
-	runtime->hw.channels_min = hinfo->channels_min;
-	runtime->hw.channels_max = hinfo->channels_max;
-	runtime->hw.formats = hinfo->formats;
-	runtime->hw.rates = hinfo->rates;
-	snd_pcm_limit_hw_rates(runtime);
-	snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
-
-	/* avoid wrap-around with wall-clock */
-	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_TIME,
-				     20,
-				     178000000);
-
-	if (chip->align_buffer_size)
-		/* constrain buffer sizes to be multiple of 128
-		   bytes. This is more efficient in terms of memory
-		   access but isn't required by the HDA spec and
-		   prevents users from specifying exact period/buffer
-		   sizes. For example for 44.1kHz, a period size set
-		   to 20ms will be rounded to 19.59ms. */
-		buff_step = 128;
-	else
-		/* Don't enforce steps on buffer sizes, still need to
-		   be multiple of 4 bytes (HDA spec). Tested on Intel
-		   HDA controllers, may not work on all devices where
-		   option needs to be disabled */
-		buff_step = 4;
-
-	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
-				   buff_step);
-	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
-				   buff_step);
-	snd_hda_power_up(apcm->codec);
-	if (hinfo->ops.open)
-		err = hinfo->ops.open(hinfo, apcm->codec, substream);
-	else
-		err = -ENODEV;
-	if (err < 0) {
-		azx_release_device(azx_dev);
-		goto powerdown;
-	}
-	snd_pcm_limit_hw_rates(runtime);
-	/* sanity check */
-	if (snd_BUG_ON(!runtime->hw.channels_min) ||
-	    snd_BUG_ON(!runtime->hw.channels_max) ||
-	    snd_BUG_ON(!runtime->hw.formats) ||
-	    snd_BUG_ON(!runtime->hw.rates)) {
-		azx_release_device(azx_dev);
-		if (hinfo->ops.close)
-			hinfo->ops.close(hinfo, apcm->codec, substream);
-		err = -EINVAL;
-		goto powerdown;
-	}
+	scoped_guard(mutex, &chip->open_mutex) {
+		azx_dev = azx_assign_device(chip, substream);
+		trace_azx_pcm_open(chip, azx_dev);
+		if (azx_dev == NULL) {
+			err = -EBUSY;
+			break;
+		}
+		runtime->private_data = azx_dev;
+
+		runtime->hw = azx_pcm_hw;
+		if (chip->gts_present)
+			runtime->hw.info |= SNDRV_PCM_INFO_HAS_LINK_SYNCHRONIZED_ATIME;
+		runtime->hw.channels_min = hinfo->channels_min;
+		runtime->hw.channels_max = hinfo->channels_max;
+		runtime->hw.formats = hinfo->formats;
+		runtime->hw.rates = hinfo->rates;
+		snd_pcm_limit_hw_rates(runtime);
+		snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+
+		/* avoid wrap-around with wall-clock */
+		snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_TIME,
+					     20,
+					     178000000);
+
+		if (chip->align_buffer_size)
+			/*
+			 * Constrain buffer sizes to be multiple of 128
+			 * bytes. This is more efficient in terms of memory
+			 * access but isn't required by the HDA spec and
+			 * prevents users from specifying exact period/buffer
+			 * sizes. For example for 44.1kHz, a period size set
+			 * to 20ms will be rounded to 19.59ms.
+			 */
+			buff_step = 128;
+		else
+			/*
+			 * Don't enforce steps on buffer sizes, still need to
+			 * be multiple of 4 bytes (HDA spec). Tested on Intel
+			 * HDA controllers, may not work on all devices where
+			 * option needs to be disabled
+			 */
+			buff_step = 4;
+
+		snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+					   buff_step);
+		snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
+					   buff_step);
+		snd_hda_power_up(apcm->codec);
+		if (hinfo->ops.open)
+			err = hinfo->ops.open(hinfo, apcm->codec, substream);
+		else
+			err = -ENODEV;
+		if (err < 0) {
+			azx_release_device(azx_dev);
+			goto powerdown;
+		}
+		snd_pcm_limit_hw_rates(runtime);
+		/* sanity check */
+		if (snd_BUG_ON(!runtime->hw.channels_min) ||
+		    snd_BUG_ON(!runtime->hw.channels_max) ||
+		    snd_BUG_ON(!runtime->hw.formats) ||
+		    snd_BUG_ON(!runtime->hw.rates)) {
+			azx_release_device(azx_dev);
+			if (hinfo->ops.close)
+				hinfo->ops.close(hinfo, apcm->codec, substream);
+			err = -EINVAL;
+			goto powerdown;
+		}
 
-	/* disable LINK_ATIME timestamps for capture streams
-	   until we figure out how to handle digital inputs */
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
-		runtime->hw.info &= ~SNDRV_PCM_INFO_HAS_WALL_CLOCK; /* legacy */
-		runtime->hw.info &= ~SNDRV_PCM_INFO_HAS_LINK_ATIME;
-	}
+		/*
+		 * Disable LINK_ATIME timestamps for capture streams
+		 * until we figure out how to handle digital inputs
+		 */
+		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+			runtime->hw.info &= ~SNDRV_PCM_INFO_HAS_WALL_CLOCK; /* legacy */
+			runtime->hw.info &= ~SNDRV_PCM_INFO_HAS_LINK_ATIME;
+		}
 
-	snd_pcm_set_sync(substream);
-	mutex_unlock(&chip->open_mutex);
-	return 0;
+		snd_pcm_set_sync(substream);
+		return 0;
 
- powerdown:
-	snd_hda_power_down(apcm->codec);
- unlock:
-	mutex_unlock(&chip->open_mutex);
+powerdown:
+		snd_hda_power_down(apcm->codec);
+	}
 	snd_hda_codec_pcm_put(apcm->info);
 	return err;
 }
-- 
2.25.1

