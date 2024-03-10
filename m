Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586A3BA4D
	for <linux-sound@vger.kernel.org>; Sun, 10 Mar 2024 10:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710066906; cv=none; b=a1UL6sSDwTKH0GVcZ3+8nwEZLpbgExTVy/ePFOHETj77UbbnFu3Ju3t72PGlY3M60Doz8XOfmx3zFeFJagQsEsuDhbMcY7MU6OtXXHHp7TApoIJT/RFPftNcZvUMqb0FmtQt6K3YB0kS9FodfZyKsXkT3pDtc5nNygKNJsrlDGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710066906; c=relaxed/simple;
	bh=13MLU6aIVKd1ZxKtLmHPWIHy29nf4wfRwphRwROUDc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhRMxdR4YtSv7FgmJDj0JILYX41JRKnBdtTwsd9HtUP7qDgBI+fd5Pq+NxVcW70UhFhcXbAIVmikA1guECYptMsA0qaEhhYylxsJmSZpRuDv9q+aCIqa4jhGFfTNovzd09ZGspr1D+Depf40njc6dKRH3vSXQaiufSh/cHFU7A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=r3y4J3Kw; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="r3y4J3Kw"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 062296007738; Sun, 10 Mar 2024 21:05:00 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 062296007738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1710066900; bh=d94w3VA8ii+PgWUSJ8Z803mVI5Ogmt2HynFxeh4HawE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r3y4J3KweDx6xQ6+ObbxtNK0aVH44UWXjfkDmuDbQeQYz/uKg54NK7k0IQ9qZLImB
	 /5YR7n83z44AMkTYwerdDYEeNRDOfWd8MU4rKoFpKKk5+TO4505H9VmOn/yQukb2Sb
	 dMgZKX4p9oXUJ9yc+wE9m5u13OV60OJGWrWkUSP3On514SNnJt2l0w0cM3al3VTJ8L
	 35IpxUr+CgIztPGxet0eX/b5M4qOM8rUv0CafHOxgOdCWG9iRMEqL174nrFXGaxYqP
	 YP0p/kVX/LgA0DBjzI7EoQYtiLXDHijPLpP60dQRf0JoFAtjsnEJduTOQUgdKOEDpV
	 5o6lVycJDXp+g==
Date: Sun, 10 Mar 2024 21:04:59 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 3/3] ALSA: scarlett2: Fix Scarlett 4th Gen input gain range
Message-ID: <9168317b5ac5335943d3f14dbcd1cc2d9b2299d0.1710047969.git.g@b4.vu>
References: <cover.1710047969.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1710047969.git.g@b4.vu>

The input gain range TLV was declared as -70dB to 0dB, but the preamp
gain range is actually 0dB to +70dB. Rename SCARLETT2_GAIN_BIAS to
SCARLETT2_MAX_GAIN and update the TLV to fix.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
Fixes: 0a995e38dc44 ("ALSA: scarlett2: Add support for software-controllable input gain")
---
 sound/usb/mixer_scarlett2.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 3815ce1d216e..ffb8bcebf9ad 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -173,7 +173,9 @@
 
 /* some gui mixers can't handle negative ctl values */
 #define SCARLETT2_VOLUME_BIAS 127
-#define SCARLETT2_GAIN_BIAS 70
+
+/* maximum preamp input gain */
+#define SCARLETT2_MAX_GAIN 70
 
 /* mixer range from -80dB to +6dB in 0.5dB steps */
 #define SCARLETT2_MIXER_MIN_DB -80
@@ -3464,7 +3466,7 @@ static int scarlett2_input_gain_ctl_info(struct snd_kcontrol *kctl,
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
 	uinfo->count = elem->channels;
 	uinfo->value.integer.min = 0;
-	uinfo->value.integer.max = SCARLETT2_GAIN_BIAS;
+	uinfo->value.integer.max = SCARLETT2_MAX_GAIN;
 	uinfo->value.integer.step = 1;
 
 unlock:
@@ -3541,7 +3543,7 @@ static int scarlett2_input_gain_ctl_put(struct snd_kcontrol *kctl,
 }
 
 static const DECLARE_TLV_DB_MINMAX(
-	db_scale_scarlett2_gain, -SCARLETT2_GAIN_BIAS * 100, 0
+	db_scale_scarlett2_gain, 0, SCARLETT2_MAX_GAIN * 100
 );
 
 static const struct snd_kcontrol_new scarlett2_input_gain_ctl = {
-- 
2.43.0

