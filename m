Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545DC37C912;
	Tue,  3 Mar 2026 19:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772567318; cv=pass; b=NCKunhXMs8PVM7t3NE+heMB2CBVEkhjrXbAVqqWkVynjKs9TI66pfNJm06yxXT9fHNCvGy1U5IVJcet0SDqevZwdZCPegNcAO5D0I9UnMyraSFo/4mgmCLwxWKmc9BwK2XeXMqh/AY93saFtHbNpiEfNyiyc6yp05ZbJ08OWVUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772567318; c=relaxed/simple;
	bh=AbS0Laa3PMhA2cGG17Y9UVqeePxJAoKfQVa1o9qaOkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SyWF+nhvXKvo7x75O3hClSxf9JifBN6JudrE3SjA0kfdUvfSsxknY6CSSHuxp+Y5lGVIOKpzT37IV4WPWr1Rwa4YM7ZHtgRHmuL1xR6SpE08KLWLScQgxjHhqicGlxX8pddMEy/hfDdy4pu7I/mAznFEVPDMGxBQto8OJ77m6Bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=jypmRCNq; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="jypmRCNq"
ARC-Seal: i=1; a=rsa-sha256; t=1772567303; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iBzT/AZno74q9ufaUVldZ1FszURfmWbic8HTEAyLemzzpR1ddhgstTACoUOXV1L8HhDMmx9pwMU/MXuuVG1a25925WezY5gy2zjj0o6zFHiynkbwMGeZtOT1NxGh+CKi/tJ0jFXG1JsvyW2IN1vYVxqboCOMjUBnj8jCvS5HEW4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772567303; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CjpiuMqQ+GrYPxeQjDMei6mX77ZcbG7JJyof4dyGRqc=; 
	b=TZ2zrraT8ZovKop8cC8vURXG1e6kJc36Am7pytnUBuMqU0v/MVmEUI9681+fgf1ocd60JcOTX/5x7d6CMFmBH/aXFo4ko094S3DBz7Vb6usLALRrbD+D4AGP14MgLO6BPwlAyyQDEIGMc5CaqN1SFvDCQ6KpY3ajA2AcT2h/o/k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772567303;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=CjpiuMqQ+GrYPxeQjDMei6mX77ZcbG7JJyof4dyGRqc=;
	b=jypmRCNqJHH05/rf4xUKgq1M1yPjlCDGz1YR+B77yeVO7FKewd3WmvcJHQgyKdWM
	8cZVgTEMKARVeoXL+bYsQAqlCF4hEF7Hub864DnEBECfyHMNfgCDQqAV7qH7//Tv/LT
	lCtKfRusC2k9qEoKJ0TRTmQTq3KC4spmS5+wvt3ctDh2JDOsQjoouqLD73wbKPRuggG
	BBppYHLiZKwFODZO8tReCmY4BEfmpOWGv76OEV6bkB9el8HaEcf6GVyLmw6mxrZ+zt8
	3li3qry9rlUoKI6V031kF0wCo57t0hBXtt9kFMjWoIn3ZLKPTXLgI78D2ZzjUHGe6m+
	6UFtDbF1ww==
Received: by mx.zohomail.com with SMTPS id 1772567302126470.82438079468477;
	Tue, 3 Mar 2026 11:48:22 -0800 (PST)
From: Rong Zhang <i@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Rong Zhang <i@rong.moe>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	Arun Raghavan <arunr@valvesoftware.com>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v3 3/8] ALSA: usb-audio: Improve volume range checks
Date: Wed,  4 Mar 2026 03:47:58 +0800
Message-ID: <20260303194805.266158-4-i@rong.moe>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303194805.266158-1-i@rong.moe>
References: <20260303194805.266158-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Currently the volume range check is only meant to discover quirky
microphone on webcam devices and facing these issues:

- The check is only meaningful for dB volume, but it doesn't check if
  the TLV callback is the corresponding one
- A common quirky pattern "val = 0/100/1" doesn't trigger any warning
- Some modern devices trigger the check, but they are legit
- The warning message doesn't apply to some quirky messages with linear
  volume
- The term "range" in the warning message is confusing. At readers'
  first glance it should be (max - min), but it turns out to be
  ((max - min) / res)

Solve these issues by improving the checking logic to:

- Ignore mixers with non-dB TLV
- Warn on unlikely small volume ranges (max - min < 256)
- Add some heuristics to determine if the volume range is unlikely big
- Rephrase the warning message to mention linear volume
- Rephrase the warning message in correct wording

Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/mixer.c | 54 +++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 48 insertions(+), 6 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index f52ca0d7e665..7007e0c9489b 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1664,20 +1664,62 @@ static bool check_insane_volume_range(struct usb_mixer_interface *mixer,
 				      struct snd_kcontrol *kctl,
 				      struct usb_mixer_elem_info *cval)
 {
-	int range = (cval->max - cval->min) / cval->res;
+	int range, steps, threshold;
 
 	/*
-	 * Are there devices with volume range more than 255? I use a bit more
-	 * to be sure. 384 is a resolution magic number found on Logitech
-	 * devices. It will definitively catch all buggy Logitech devices.
+	 * If a device quirk has overrode our TLV callback, no warning should
+	 * be generated since our checks are only meaningful for dB volume.
 	 */
-	if (range > 384) {
+	if (!(kctl->vd[0].access & SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK) ||
+	    kctl->tlv.c != snd_usb_mixer_vol_tlv)
+		return false;
+
+	/*
+	 * Meaningless volume control capability (<1dB). This should cover
+	 * devices mapping their volume to val = 0/100/1, which are very likely
+	 * to be quirky.
+	 */
+	range = cval->max - cval->min;
+	if (range < 256) {
 		usb_audio_warn(mixer->chip,
-			       "Warning! Unlikely big volume range (=%u), cval->res is probably wrong.",
+			       "Warning! Unlikely small volume range (=%u), linear volume or custom curve?",
 			       range);
 		return true;
 	}
 
+	steps = range / cval->res;
+
+	/*
+	 * There are definitely devices with ~20,000 ranges (e.g., HyperX Cloud
+	 * III with val = -18944/0/1), so we use some heuristics here:
+	 *
+	 * min < 0 < max: Attenuator + amplifier? Likely to be sane
+	 *
+	 * min < 0 = max: DSP? Voltage attenuator with FW conversion to dB?
+	 * Likely to be sane
+	 *
+	 * min < max < 0: Measured values? Neutral
+	 *
+	 * min = 0 < max: Oversimplified FW conversion? Linear volume? Likely to
+	 * be quirky (e.g., MV-SILICON)
+	 *
+	 * 0 < min < max: Amplifier with fixed gains? Likely to be quirky
+	 * (e.g., Logitech webcam)
+	 */
+	if (cval->min < 0 && 0 <= cval->max)
+		threshold = 24576; /* 65535 * (3 / 8) */
+	else if (cval->min < cval->max && cval->max < 0)
+		threshold = 1024;
+	else
+		threshold = 384;
+
+	if (steps > threshold) {
+		usb_audio_warn(mixer->chip,
+			       "Warning! Unlikely big volume step count (=%u), linear volume or wrong cval->res?",
+			       steps);
+		return true;
+	}
+
 	return false;
 }
 
-- 
2.53.0

