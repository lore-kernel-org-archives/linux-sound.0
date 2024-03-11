Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A59712B70
	for <linux-sound@vger.kernel.org>; Mon, 11 Mar 2024 08:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710146607; cv=none; b=YHFYVJtSchvcdlP1pSBWojRa17tJLffMHrDq2bTV4WmFLBbUGgb7HCEC7MUyyAGdF7FnO07OUcDhK8m+V+kUs+g2MBjjE2oG09x64ZmlUTVVtqR0L1FFAeqx33vmfJm5mDaNROvx9/cq3EcvDiRrR0wLe03zTrVEyMpvOakeX+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710146607; c=relaxed/simple;
	bh=0TVTbZWHIjAowpimd8B4S2HYQ5Kjlc9lFcTrFHkJAIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lizXA9nxNh5UwPxFBH0qL8HtAXmk/g2B/W6k91VzUiG1tEvHpqyDMhz2FHqnYp/CHf/Y/btPB/fAM+rPeO2n10WYYKIm7kZdBlJXwTsjC9IthEz3wZoviRYP3+JL/q7kvCuh6I93/6+yJTGZt4fpQTTstcb7EWWsdzfNiJSbmrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=KbAV8Csa; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="KbAV8Csa"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 02E786062037; Mon, 11 Mar 2024 19:13:22 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 02E786062037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1710146602; bh=P6OnnuQ1yOGL8rJONgAviwn4WsEVPOrI2LzxEtuDD0Y=;
	h=Date:From:To:Cc:Subject:From;
	b=KbAV8CsaveFgoLaZV9/eBkCdIK6GeRQ7vXZ2bBkVaZFdRQo7SYd7kIrq5cFZTqzt4
	 zc3mjrQ3GxB+Q5gPODZP155VRLIBSISk/U6rBXx/W3WHdWxNpB0Tj6ZU0EVNuQfgCb
	 hffThdnXHIl9d6PUX+99nDhPAmuSDwv+VqgJCo9nseZIonNJVkDRvFQkX9PrK45Eg3
	 qaNPIpFpp3Kxb31bYqsjrUK9Cf1EgRNqDmHRZAxGHJXI4iRmWo4jnqwr9HWdGNzzof
	 DEaWVmxAIGlwh1KkKe1w9tAFchdAeRoaswtvyil5YMiyBpkIEC1RyCyzwySON9QcI4
	 AhEXT3w26iEJQ==
Date: Mon, 11 Mar 2024 19:13:21 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH v2] ALSA: scarlett2: Fix Scarlett 4th Gen input gain range
Message-ID: <d6d2fcbd09a5b79690b416dbb21490aed412d1d3.1710144174.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The input gain range TLV was previously declared as -70dB to 0dB, but
the preamp gain range is 0dB to +69dB, set with values ranging from 0 to
70. Replace SCARLETT2_GAIN_BIAS with SCARLETT2_MAX_GAIN_VALUE and
SCARLETT2_MAX_GAIN_DB, and update the TLV.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
Fixes: 0a995e38dc44 ("ALSA: scarlett2: Add support for software-controllable input gain")
---
 sound/usb/mixer_scarlett2.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 3815ce1d216e..bd114be537d7 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -173,7 +173,12 @@
 
 /* some gui mixers can't handle negative ctl values */
 #define SCARLETT2_VOLUME_BIAS 127
-#define SCARLETT2_GAIN_BIAS 70
+
+/* maximum preamp input gain and value
+ * values are from 0 to 70, preamp gain is from 0 to 69dB
+ */
+#define SCARLETT2_MAX_GAIN_VALUE 70
+#define SCARLETT2_MAX_GAIN_DB 69
 
 /* mixer range from -80dB to +6dB in 0.5dB steps */
 #define SCARLETT2_MIXER_MIN_DB -80
@@ -3464,7 +3469,7 @@ static int scarlett2_input_gain_ctl_info(struct snd_kcontrol *kctl,
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
 	uinfo->count = elem->channels;
 	uinfo->value.integer.min = 0;
-	uinfo->value.integer.max = SCARLETT2_GAIN_BIAS;
+	uinfo->value.integer.max = SCARLETT2_MAX_GAIN_VALUE;
 	uinfo->value.integer.step = 1;
 
 unlock:
@@ -3541,7 +3546,7 @@ static int scarlett2_input_gain_ctl_put(struct snd_kcontrol *kctl,
 }
 
 static const DECLARE_TLV_DB_MINMAX(
-	db_scale_scarlett2_gain, -SCARLETT2_GAIN_BIAS * 100, 0
+	db_scale_scarlett2_gain, 0, SCARLETT2_MAX_GAIN_DB * 100
 );
 
 static const struct snd_kcontrol_new scarlett2_input_gain_ctl = {
-- 
2.43.0

