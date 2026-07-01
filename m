Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67AE3B14C7;
	Wed,  1 Jul 2026 06:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782888632; cv=none; b=uPumczB/vWcDGLIXC0lc76CHvKH+lZewp7zx5LoeB5QrcwOgpwCIsphlM86Tv2a9O5V0sdp8D2j7URiGgz+zu6GA0rvCe1VY+NNeALohAMMjiHwae8mD8BCngqmDOx7At5K1Th4953sDNksMskk5kI8dsyzdwc1GriuEZpeU8oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782888632; c=relaxed/simple;
	bh=f9wBmc5xQXoGeJUWUl6XCoFJynxsTYbh9sHWT93H8hk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ET0jdUP2VhSst+G4wInsr8OdLmfY5kSUcRu7Pk/ocKa8IrQ2H6UBnry1yyi5ungFgzZ/2b7UZyvuZGr4RrVknvaTy8plvQvTLZdtGrp3R6A956bWrJjjQcjwtChvXndPgRt/GVAi73O76tiDh0qKJbplJv0G1wCZqP4VPwQ3lvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=FLw+1wYi; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="FLw+1wYi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=4I
	4/NIqSpbjaZddvgi/7/l1he5kyrAsde9TSdpveENs=; b=FLw+1wYiIVK3O69OFf
	5bR9znsIksd43jJ0q43zkjjiECGHVvafO+3OqXQhMukGZgdAPG7GURu4sgpQG/h2
	PHvgp8HNTcqRpWCNawYcZgkfQaa3AuDfiYG0xDYxzLT69bU/IPMnbpMYgL2WXPgk
	/AzUydzKSmlFcgnBqBBorQjc4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDHDveKuERqvbJQGw--.29951S5;
	Wed, 01 Jul 2026 14:49:59 +0800 (CST)
From: wangdich9700@163.com
To: perex@perex.cz,
	tiwai@suse.com,
	wangdicheng@163.com
Cc: david.rhodes@cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH 3/3] ALSA: hda: Use scoped_guard() for open_mutex in azx_pcm_open()
Date: Wed,  1 Jul 2026 14:49:25 +0800
Message-Id: <20260701064925.593372-4-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260701064925.593372-1-wangdich9700@163.com>
References: <20260701064925.593372-1-wangdich9700@163.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHDveKuERqvbJQGw--.29951S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxtFy8Ww4xXrWUtF47XF1rtFb_yoWxGry5pr
	Wfur40k393XFn2gFn7tw1I9r1rAa4Ska15K393ta40yw13W3WYgryvyw109FZak3y2yF15
	ZF4kX347Xr9FgF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jHAp8UUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCwBf+TmpEuJeZDwAA3w

From: wangdicheng <wangdicheng@kylinos.cn>

The companion function azx_pcm_close() already uses
scoped_guard(mutex, &chip->open_mutex). Replace the manual
mutex_lock/mutex_unlock pair in azx_pcm_open() with the same
pattern for consistency.

No functional changes.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/hda/common/controller.c | 159 ++++++++++++++++++----------------
 1 file changed, 82 insertions(+), 77 deletions(-)

diff --git a/sound/hda/common/controller.c b/sound/hda/common/controller.c
index afec5c5546ec..2c9aaf74ce7f 100644
--- a/sound/hda/common/controller.c
+++ b/sound/hda/common/controller.c
@@ -584,86 +584,91 @@ static int azx_pcm_open(struct snd_pcm_substream *substream)
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
+			goto unlock;
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
+unlock:
 	snd_hda_codec_pcm_put(apcm->info);
 	return err;
 }
-- 
2.25.1

