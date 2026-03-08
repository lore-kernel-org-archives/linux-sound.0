Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B4D191F98
	for <linux-sound@vger.kernel.org>; Sun,  8 Mar 2026 14:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.25.134.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772980843; cv=none; b=XmxkFwp6GkLrux2gv6XgF3bfxgj/AzrEtLq6UjlTOAIxQBreIqg65U5odJFGwSJjJ0mQp0cZ79q6qG0rXkmEx7SdXLRfelD5QwVp8pqmtg6ZM/V8J4BY8XiOqXjLulHQHcYmGSCPY6Cq7MuWhVkJJFty5ZonKiFk8AbtvGJreJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772980843; c=relaxed/simple;
	bh=2jWl7Q95SRLJ3rcLFHg5s8Q7uS3lnUQcF3QO7Es4ma4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IzWBkVzVB56Z3RzYHMCK4sepwUlT0BpoDd3rLC6U3KYSszafJ7/echn10/gyeesAZjsV13yZ6NdME7gpx0W3TdxaZN4x1p19Ti5+0Myw8kyeZIB2GIJhpVQ3TpHmAWbN4gx3QbgVr/Nz44YIDIcUon9+BAEZJg4H137dji1y6Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=t-online.de; spf=pass smtp.mailfrom=t-online.de; arc=none smtp.client-ip=194.25.134.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=t-online.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-online.de
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout05.t-online.de (Postfix) with SMTP id A76769BC;
	Sun,  8 Mar 2026 15:34:13 +0100 (CET)
Received: from archboi.fritz.box ([82.135.83.228]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vzFCv-4BbXhA0; Sun, 8 Mar 2026 15:34:13 +0100
From: Frederic Popp <frederic.l.popp@t-online.de>
To: linux-sound@vger.kernel.org
Cc: Frederic Popp <frederic.l.popp@t-online.de>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] ALSA: usb-audio: add Studio 1824 support
Date: Sun,  8 Mar 2026 16:22:16 +0100
Message-ID: <20260308153334.50433-2-frederic.l.popp@t-online.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1772980453-967FE4A1-70B9D35D/0/0 CLEAN NORMAL
X-TOI-MSGID: 6f9afb83-9168-406c-bc2a-37e2de9183b1

Adapt the already implemented support for the Studio 1824c
audio interface to the predecessor Studio 1824.

Basically just a change adding the
different hardware ID in the relevant places.

Tested as much as possible.
All implemented functionality seemingly works.

Signed-off-by: Frederic Popp <frederic.l.popp@t-online.de>
---
 sound/usb/format.c       | 4 ++++
 sound/usb/mixer_quirks.c | 3 +++
 sound/usb/mixer_s1810c.c | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index 1207c507882a..030b4307927a 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -455,6 +455,10 @@ static int parse_uac2_sample_rate_range(struct snd_usb_audio *chip,
 			if (chip->usb_id == USB_ID(0x194f, 0x010d) &&
 			    !s1810c_valid_sample_rate(fp, rate))
 				goto skip_rate;
+			/* Filter out invalid rates on Presonus Studio 1824 */
+			if (chip->usb_id == USB_ID(0x194f, 0x0107) &&
+			    !s1810c_valid_sample_rate(fp, rate))
+				goto skip_rate;
 
 			/* Filter out invalid rates on Focusrite devices */
 			if (USB_ID_VENDOR(chip->usb_id) == 0x1235 &&
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index e97814dc9025..a01510a855c2 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -4477,6 +4477,9 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(0x194f, 0x010d): /* Presonus Studio 1824c */
 		err = snd_sc1810_init_mixer(mixer);
 		break;
+	case USB_ID(0x194f, 0x0107): /* Presonus Studio 1824 */
+		err = snd_sc1810_init_mixer(mixer);
+		break;
 	case USB_ID(0x2a39, 0x3fb0): /* RME Babyface Pro FS */
 		err = snd_bbfpro_controls_create(mixer);
 		break;
diff --git a/sound/usb/mixer_s1810c.c b/sound/usb/mixer_s1810c.c
index 7eac7d1bce64..2e5a8d37ec57 100644
--- a/sound/usb/mixer_s1810c.c
+++ b/sound/usb/mixer_s1810c.c
@@ -362,6 +362,7 @@ static int snd_s1810c_init_mixer_maps(struct snd_usb_audio *chip)
 		snd_s1810c_send_ctl_packet(dev, a, 3, 0, 1, MIXER_LEVEL_0DB);
 		break;
 
+	case USB_ID(0x194f, 0x0107): /* 1824 */
 	case USB_ID(0x194f, 0x010d): /* 1824c */
 		/* Set all output faders to unity gain */
 		a = SC1810C_SEL_OUTPUT;
@@ -685,6 +686,7 @@ int snd_sc1810_init_mixer(struct usb_mixer_interface *mixer)
 			return ret;
 
 		break;
+	case USB_ID(0x194f, 0x0107): /* Presonus Studio 1824 */
 	case USB_ID(0x194f, 0x010d): /* Presonus Studio 1824c */
 		ret = snd_s1810c_switch_init(mixer, &snd_s1824c_mono_sw);
 		if (ret < 0)
-- 
2.53.0

