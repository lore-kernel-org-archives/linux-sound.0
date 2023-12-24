Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6E6D517
	for <linux-sound@vger.kernel.org>; Sun, 24 Dec 2023 19:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="bHwT+nGa"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 5B893604B9CB; Mon, 25 Dec 2023 05:57:34 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 5B893604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703446054; bh=kQ11xVrvoNcwhwuFNR1E2VAblkB3uYQV1k35Q3b0EgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bHwT+nGakoU7fIIgAvd1cQ2oz5aJGBtUp+3yGdAA3rNRGnn2h5p4DGn0Iw1zcNp1F
	 FjC7g+GgAzlOcSwigMkWC/QWgJCKs+ZwtvXyVlQ4nNh2tPDd4or3h56WIQtb+UPcLJ
	 +HZurIYgEloKltCrecdws8bd7Nwv/h+4Q1RiiN7WiO0bG5++V7U/d0YyXEl5Le3DuT
	 GoTaPd15ix33fRhFonmEds7bIGqSloNeda/it+mT4AzQgR/3MnyNSCKllGnntZoSKs
	 iXPhpvvqn4PxZecwo3n7AL8ykEfJs/yCsCmCYGujs6kw3V5dXqhees29otqyNJX95S
	 6Ctx1JRx2prjw==
Date: Mon, 25 Dec 2023 05:57:34 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 11/23] ALSA: scarlett2: Formatting fixes
Message-ID: <72be568b02eea12621b0c4a96f8e8cc65b0c13c0.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>

Add missing blank line before comment.

For consistency with other functions that have few parameters, move
the parameters onto the same line as the function name.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index f15ee9e6c2eb..0fd919490cc6 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -2149,6 +2149,7 @@ static int scarlett2_add_firmware_version_ctl(
 	return scarlett2_add_new_ctl(mixer, &scarlett2_firmware_version_ctl,
 				     0, 0, "Firmware Version", NULL);
 }
+
 /*** Sync Control ***/
 
 /* Update sync control after receiving notification that the status
@@ -3373,8 +3374,7 @@ static const struct snd_kcontrol_new scarlett2_speaker_switch_enum_ctl = {
 	.put  = scarlett2_speaker_switch_enum_ctl_put,
 };
 
-static int scarlett2_add_speaker_switch_ctl(
-	struct usb_mixer_interface *mixer)
+static int scarlett2_add_speaker_switch_ctl(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
@@ -3542,8 +3542,7 @@ static const struct snd_kcontrol_new scarlett2_talkback_map_ctl = {
 	.put  = scarlett2_talkback_map_ctl_put,
 };
 
-static int scarlett2_add_talkback_ctls(
-	struct usb_mixer_interface *mixer)
+static int scarlett2_add_talkback_ctls(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
@@ -4611,8 +4610,7 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 }
 
 /* Notify on sync change */
-static void scarlett2_notify_sync(
-	struct usb_mixer_interface *mixer)
+static void scarlett2_notify_sync(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 
@@ -4623,8 +4621,7 @@ static void scarlett2_notify_sync(
 }
 
 /* Notify on monitor change */
-static void scarlett2_notify_monitor(
-	struct usb_mixer_interface *mixer)
+static void scarlett2_notify_monitor(struct usb_mixer_interface *mixer)
 {
 	struct snd_card *card = mixer->chip->card;
 	struct scarlett2_data *private = mixer->private_data;
@@ -4650,8 +4647,7 @@ static void scarlett2_notify_monitor(
 }
 
 /* Notify on dim/mute change */
-static void scarlett2_notify_dim_mute(
-	struct usb_mixer_interface *mixer)
+static void scarlett2_notify_dim_mute(struct usb_mixer_interface *mixer)
 {
 	struct snd_card *card = mixer->chip->card;
 	struct scarlett2_data *private = mixer->private_data;
@@ -4677,8 +4673,7 @@ static void scarlett2_notify_dim_mute(
 }
 
 /* Notify on "input other" change (level/pad/air) */
-static void scarlett2_notify_input_other(
-	struct usb_mixer_interface *mixer)
+static void scarlett2_notify_input_other(struct usb_mixer_interface *mixer)
 {
 	struct snd_card *card = mixer->chip->card;
 	struct scarlett2_data *private = mixer->private_data;
@@ -4704,8 +4699,7 @@ static void scarlett2_notify_input_other(
 /* Notify on "monitor other" change (direct monitor, speaker
  * switching, talkback)
  */
-static void scarlett2_notify_monitor_other(
-	struct usb_mixer_interface *mixer)
+static void scarlett2_notify_monitor_other(struct usb_mixer_interface *mixer)
 {
 	struct snd_card *card = mixer->chip->card;
 	struct scarlett2_data *private = mixer->private_data;
-- 
2.43.0

