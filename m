Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC43637D03
	for <linux-sound@vger.kernel.org>; Tue, 19 Dec 2023 17:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="GyQqenbQ"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 432C4604B9F7; Wed, 20 Dec 2023 04:06:42 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 432C4604B9F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703007402; bh=w71tYLCSurTXhcu4POdZy7nJlWAOIgIw63TgCjTYSMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GyQqenbQjZ1WXJfzAHedLWE2CsJXMwI+zmf0qoABFBAm81FglS1donj/rCe4Iifpw
	 9BZToDtCMQK2we0ynaLW+JYIOaunU1BeKpQ7LL32vXrB5ifTSuuturw0vGCSoTH+NJ
	 kANqPvRV/2vr9JBoxGVr/9SXJgqQl2tjMkHjWIwvmaZHh/AsT0giCAMWkCSgXJC2B3
	 RHb+4dUJhoMuiC291AqHlQ1mTRZX0asnMAkfuxtmnLcLS4+VkqufHC0liDWCaWXllB
	 9NJGKNMciXVrIj33wEZcOlyOcJCpqDqFt0mevqXkzjs7Ek6SFS0G6x/98hqDzyPrcb
	 bXDUo5q0LCVog==
Date: Wed, 20 Dec 2023 04:06:42 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH 01/11] ALSA: scarlett2: Update maintainer info
Message-ID: <62f32404eaa8663cc304648354b85bcb5914ce72.1703001053.git.g@b4.vu>
References: <cover.1703001053.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703001053.git.g@b4.vu>

Update MAINTAINERS and "enabled" message with GitHub repository links.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 MAINTAINERS                 | 6 ++++--
 sound/usb/mixer_scarlett2.c | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ea790149af79..ae3f72f57854 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8272,11 +8272,13 @@ L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/input/joystick/fsia6b.c
 
-FOCUSRITE SCARLETT GEN 2/3 MIXER DRIVER
+FOCUSRITE SCARLETT2 MIXER DRIVER (Scarlett Gen 2+ and Clarett)
 M:	Geoffrey D. Bennett <g@b4.vu>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
+W:	https://github.com/geoffreybennett/scarlett-gen2
+B:	https://github.com/geoffreybennett/scarlett-gen2/issues
+T:	git https://github.com/geoffreybennett/scarlett-gen2.git
 F:	sound/usb/mixer_scarlett2.c
 
 FORCEDETH GIGABIT ETHERNET DRIVER
diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index f7c57a2c3028..a0dbdf921745 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -4534,7 +4534,8 @@ int snd_scarlett2_init(struct usb_mixer_interface *mixer)
 
 	usb_audio_info(chip,
 		"Focusrite %s Mixer Driver enabled (pid=0x%04x); "
-		"report any issues to g@b4.vu",
+		"report any issues to "
+		"https://github.com/geoffreybennett/scarlett-gen2/issues",
 		entry->series_name,
 		USB_ID_PRODUCT(chip->usb_id));
 
-- 
2.43.0

