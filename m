Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6E3373C17;
	Mon,  2 Mar 2026 18:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772477971; cv=pass; b=M2Zq+tQ5IskTgFTKkv9S60HJHVROMH3oUuU6BnLG3G3k+dn5RYh+/BDGlO4zLUZHrxaNv0iKNAkX/55ouQxunVZTQZCBDPmwmuon8plWoQAhfLxUgj5rpMm5ckDvR+HskkebZAYaty/ZEbWsccMso5iIFeV/6IH9vLueWeqoTNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772477971; c=relaxed/simple;
	bh=bwsJSfMDmrTaxkbp/XYlbzcwS+2yEhdoPtsODrAUjJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KvEKGVlFXWPnTwUXbT8Of4x/p9HftUKvOQR1RRGWmqzPhGIsRGrbPSvlrQZyUKDZUTW9V5OFOKYgAXROUsYn7/AVpuX1jR8s14zkcXg9xeFjz8yYmyONopK+lZ5Hqeki5Mths76omrLsG3pDRk1g6lJ+P8Ld0mGUlJqEZSt7MI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=BOWvaVyR; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="BOWvaVyR"
ARC-Seal: i=1; a=rsa-sha256; t=1772477957; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HZw6HfouYnHMSyPDUorLLPAD8R79kSAVY7bPGS9bG/2sEfOhcbwYPQ/S9Dxhsc7elFLUHHcPJ24YFvFhcLzyAsAht7EI7OjHc+q3KI/N124dPdOjOywhB7XVduud9RkxjFduP4MED49xB/J7ubVs2eA1YJqs2R4w18RcvGdLihw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772477957; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9lmwt1a5i7dWGlVNbXzYeTJ7RIriT+tawyy94Ui5hSg=; 
	b=Hldu0miMK1n2bx+0MjO8RO+3KaIYar05q9cwpD8BmW5zmsl/6iAoNuAXs+Rq1yN0KLf4ZAVBA5z91lim/1mNPc/wczc20P6K60VhEjjk0OCd4NivdWO8KT/GPNcvC0PJXT0QfEd6+Fbl0p88/2JYe7wqV8BgG5stlj7NuZdS9yA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772477957;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9lmwt1a5i7dWGlVNbXzYeTJ7RIriT+tawyy94Ui5hSg=;
	b=BOWvaVyRsmCHEbt22mII5JeAIymbpggIJ7xjDyA2Pr2QerhmuvGq+zuml6ymIx2n
	faEi+QIw5f78VotOuHEANNck4mqQiOqASgHUUvVR+EYL5o1bhWZAcqozbDo2ifvOyKT
	0XKdqnz0XJoIaMfYCjxHEFXhrfDIsuAEesDUxApR0icDMKJii1oKgQFhoQnBzhv9sFB
	F/DOcSmzxL6roNCcVskGFz/TLsBpijWO3L9mIdgUaEI2HuBUvdXzX4O7Lw7heI2RVo3
	2uK2PS7JzGTRtr5ZmHTzCPc6GnNbOiYYkXCoq423HNXi5xRjDsTOOS6hoWjboO//HK8
	/1KnkqmhBw==
Received: by mx.zohomail.com with SMTPS id 1772477956122902.5162994222561;
	Mon, 2 Mar 2026 10:59:16 -0800 (PST)
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
Subject: [PATCH v2 3/8] ALSA: usb-audio: Improve volume range checks
Date: Tue,  3 Mar 2026 02:58:54 +0800
Message-ID: <20260302185900.427415-4-i@rong.moe>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302185900.427415-1-i@rong.moe>
References: <20260302185900.427415-1-i@rong.moe>
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
index f52ca0d7e6653..7007e0c9489b4 100644
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
2.51.0

