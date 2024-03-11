Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955F322318
	for <linux-sound@vger.kernel.org>; Mon, 11 Mar 2024 09:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710149173; cv=none; b=jTz8y/bRXRAF/mMQjm6kWBss16UJJPFpKdqoKRDhr7I46DWgbdM6veMvSvxDMouxUig7pj+bZSyCtLiUwmThC80dCWrx32tYye46qmQCgh4KiwC2+4/21V528cN0pM2zYNZYGp5NIoM8KgcPXd9K2Tfx97tXpkOkvilNhn590lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710149173; c=relaxed/simple;
	bh=WxkHeHp/1uSPN65r++0a9qD4l9NXl+R4+U4Y9UgwCV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EIIjBvm2InHcaKF5vOXGzCdWczipfB6GPqTVgaKOjZ0r9CxJX3fioKN1hkpTW2tiYfNDu4Vk16/cGAIxtzq3CQJip0r3t6EA1ntLjsi3/DcP7XRmil8rX8i2DEjpPQylgRMzbpqhbOoIBD9pT9821/hoDOMfVbm7kOcdPPi27Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=ZMHDDYyc; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="ZMHDDYyc"
Received: by m.b4.vu (Postfix, from userid 1000)
	id B04596028493; Mon, 11 Mar 2024 19:56:08 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu B04596028493
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1710149168; bh=9ehYfnuvahx0/6J68gvxPFdtG8bqr1DYsxjmF3NbHA4=;
	h=Date:From:To:Cc:Subject:From;
	b=ZMHDDYycwFMrAWQdids1/eL/ghSLPeOYroYE6UZQq5Z7+OoII5+gE4dsZ7daoTjMX
	 SUr4wFUn1AkIk8k5lFS54oTbqH8RcIsBAZ0Vc0zOsl+LT1BhlUkcNhQpObwL6+tvtV
	 +ovdqN62rzjK+QLuOCJ1RjFE7/RP7NpcmhneQAdLWRyZEm7ObEf2yHVK0iDwKJik8v
	 Ox+cP+GK1hcflCH1seDInk2kohfRpFTu2iYRKEOHrRS/xSGe00NtIZvQ4m4T3Mxwhl
	 5WQ3lOd4pKMOfmdJSeXc1s32U0YqJdxHqeoPnN1HNfM5sh7nBkJhVA7tUSnA3/XiX8
	 26zUmhB9C+HLA==
Date: Mon, 11 Mar 2024 19:56:08 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: scarlett2: Fix Scarlett 4th Gen input gain range again
Message-ID: <Ze7OMA8ntG7KteGa@m.b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The 4th Gen input preamp gain range is 0dB to +69dB, although the
control values range from 0 to 70. Replace SCARLETT2_MAX_GAIN with
SCARLETT2_MAX_GAIN_VALUE and SCARLETT2_MAX_GAIN_DB, and update the TLV
again.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
Fixes: a45cf0a08347 ("ALSA: scarlett2: Fix Scarlett 4th Gen input gain range")
---
 sound/usb/mixer_scarlett2.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index ffb8bcebf9ad..bd114be537d7 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -174,8 +174,11 @@
 /* some gui mixers can't handle negative ctl values */
 #define SCARLETT2_VOLUME_BIAS 127
 
-/* maximum preamp input gain */
-#define SCARLETT2_MAX_GAIN 70
+/* maximum preamp input gain and value
+ * values are from 0 to 70, preamp gain is from 0 to 69 dB
+ */
+#define SCARLETT2_MAX_GAIN_VALUE 70
+#define SCARLETT2_MAX_GAIN_DB 69
 
 /* mixer range from -80dB to +6dB in 0.5dB steps */
 #define SCARLETT2_MIXER_MIN_DB -80
@@ -3466,7 +3469,7 @@ static int scarlett2_input_gain_ctl_info(struct snd_kcontrol *kctl,
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
 	uinfo->count = elem->channels;
 	uinfo->value.integer.min = 0;
-	uinfo->value.integer.max = SCARLETT2_MAX_GAIN;
+	uinfo->value.integer.max = SCARLETT2_MAX_GAIN_VALUE;
 	uinfo->value.integer.step = 1;
 
 unlock:
@@ -3543,7 +3546,7 @@ static int scarlett2_input_gain_ctl_put(struct snd_kcontrol *kctl,
 }
 
 static const DECLARE_TLV_DB_MINMAX(
-	db_scale_scarlett2_gain, 0, SCARLETT2_MAX_GAIN * 100
+	db_scale_scarlett2_gain, 0, SCARLETT2_MAX_GAIN_DB * 100
 );
 
 static const struct snd_kcontrol_new scarlett2_input_gain_ctl = {
-- 
2.43.0

