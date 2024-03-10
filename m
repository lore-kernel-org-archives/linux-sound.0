Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5BA8475
	for <linux-sound@vger.kernel.org>; Sun, 10 Mar 2024 10:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710066885; cv=none; b=VvbNL9Mjbm58EwiUiwZphZg+M6MABaONs06rMZOmfx6QLXUSvvMp4VLKPMriZLcm1+xfkIq0qCMoGWFBHQyIQ/G6l4RGjPFJ2OI67J+TuKjW7le3CvmAH7BmZ9EbbecbS3Hwju1Xvm4wmx06TEaLzAClDyo/BP6l3X2f2NoCDMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710066885; c=relaxed/simple;
	bh=hMoVhJEkwpldmNhim4/TJ9WepGQrKmmYJRI1ofyA+88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D75t7cuvq6EBm0JxF+l/70yaDzGIWpl7ohP0x8zmHFvTgLc6UjjXdJYyCUEpoBZwzi8s6184by57tdBo+iX84c2oGn0XdSyesvc8c5cW+PU0esVsAYroRXmzK05GVlAfjO8suovfgdfG+uUvXN4ZFne7izB1e/vl2tc5uMr45TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=GlNPYF/R; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="GlNPYF/R"
Received: by m.b4.vu (Postfix, from userid 1000)
	id ABA806028493; Sun, 10 Mar 2024 21:04:41 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu ABA806028493
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1710066881; bh=345QHE5pTforqtd8/VrINFhJxee5FEbEJWkD0ZcbIeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GlNPYF/RpFVqKcdJHeDOwpSnsrdVa6ed9awFcJdjESHVjssgWzncBrvhfouTaTEyW
	 IBsDsgNLC21eJj/bQl95hm3Sfwzie6nOjqzbHbq11BOZo448ynVtRWCdDWUzh58S+N
	 /FNwkVZvkXfJqSjeCv0xHJOgUCKZ6zlYmdoCMbWXpSI+CbkGnoQYaETTBSdiU3croo
	 lpVcJ0meOdMbMo8h6o77qNMpCHLRpezsSvbmMPoO8ByIiIRZygp5CeYyzRhRsaI4FU
	 XNqGUgLUx8i6kk3lQtC99G34bvj0PVnIuoEYFCgaZn3k5HHAJ4atLMTycSepa9HRE6
	 Lrux3H8YbbZwg==
Date: Sun, 10 Mar 2024 21:04:41 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 2/3] ALSA: scarlett2: Fix Scarlett 4th Gen autogain status
 values
Message-ID: <8bd12a5e7dc714801dd9887c4bc5cb35c384e27c.1710047969.git.g@b4.vu>
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

The meanings of the raw_auto_gain_status values were originally
guessed through experimentation, but the official names have now been
discovered. Update the autogain status control strings accordingly.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
Fixes: 0a995e38dc44 ("ALSA: scarlett2: Add support for software-controllable input gain")
---
 sound/usb/mixer_scarlett2.c | 62 ++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 28 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index bce69a78c505..3815ce1d216e 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -284,14 +284,22 @@ static const char *const scarlett2_dim_mute_names[SCARLETT2_DIM_MUTE_COUNT] = {
 	"Mute Playback Switch", "Dim Playback Switch"
 };
 
-/* Autogain Status Values */
-enum {
-	SCARLETT2_AUTOGAIN_STATUS_STOPPED,
-	SCARLETT2_AUTOGAIN_STATUS_RUNNING,
-	SCARLETT2_AUTOGAIN_STATUS_FAILED,
-	SCARLETT2_AUTOGAIN_STATUS_CANCELLED,
-	SCARLETT2_AUTOGAIN_STATUS_UNKNOWN,
-	SCARLETT2_AUTOGAIN_STATUS_COUNT
+/* The autogain_status is set based on the autogain_switch and
+ * raw_autogain_status values.
+ *
+ * If autogain_switch is set, autogain_status is set to 0 (Running).
+ * The other status values are from the raw_autogain_status value + 1.
+ */
+static const char *const scarlett2_autogain_status_texts[] = {
+	"Running",
+	"Success",
+	"SuccessDRover",
+	"WarnMinGainLimit",
+	"FailDRunder",
+	"FailMaxGainLimit",
+	"FailClipped",
+	"Cancelled",
+	"Invalid"
 };
 
 /* Power Status Values */
@@ -2835,9 +2843,9 @@ static int scarlett2_autogain_is_running(struct scarlett2_data *private)
 {
 	int i;
 
+	/* autogain_status[] is 0 if autogain is running */
 	for (i = 0; i < private->info->gain_input_count; i++)
-		if (private->autogain_status[i] ==
-		    SCARLETT2_AUTOGAIN_STATUS_RUNNING)
+		if (!private->autogain_status[i])
 			return 1;
 
 	return 0;
@@ -2867,25 +2875,25 @@ static int scarlett2_update_autogain(struct usb_mixer_interface *mixer)
 		return err;
 
 	/* Translate autogain_switch and raw_autogain_status into
-	 * autogain_status
+	 * autogain_status.
+	 *
+	 * When autogain_switch[] is set, the status is the first
+	 * element in scarlett2_autogain_status_texts[] (Running). The
+	 * subsequent elements correspond to the status value from the
+	 * device (raw_autogain_status[]) + 1. The last element is
+	 * "Invalid", in case the device reports a status outside the
+	 * range of scarlett2_autogain_status_texts[].
 	 */
 	for (i = 0; i < info->gain_input_count; i++)
 		if (private->autogain_switch[i])
+			private->autogain_status[i] = 0;
+		else if (raw_autogain_status[i] <
+				ARRAY_SIZE(scarlett2_autogain_status_texts) - 1)
 			private->autogain_status[i] =
-				SCARLETT2_AUTOGAIN_STATUS_RUNNING;
-		else if (raw_autogain_status[i] == 0)
-			private->autogain_status[i] =
-				SCARLETT2_AUTOGAIN_STATUS_STOPPED;
-		else if (raw_autogain_status[i] >= 2 &&
-			 raw_autogain_status[i] <= 5)
-			private->autogain_status[i] =
-				SCARLETT2_AUTOGAIN_STATUS_FAILED;
-		else if (raw_autogain_status[i] == 6)
-			private->autogain_status[i] =
-				SCARLETT2_AUTOGAIN_STATUS_CANCELLED;
+				raw_autogain_status[i] + 1;
 		else
 			private->autogain_status[i] =
-				SCARLETT2_AUTOGAIN_STATUS_UNKNOWN;
+				ARRAY_SIZE(scarlett2_autogain_status_texts) - 1;
 
 	return 0;
 }
@@ -3111,12 +3119,10 @@ static int scarlett2_autogain_switch_ctl_put(
 static int scarlett2_autogain_status_ctl_info(
 	struct snd_kcontrol *kctl, struct snd_ctl_elem_info *uinfo)
 {
-	static const char *const values[SCARLETT2_AUTOGAIN_STATUS_COUNT] = {
-		"Stopped", "Running", "Failed", "Cancelled", "Unknown"
-	};
-
 	return snd_ctl_enum_info(
-		uinfo, 1, SCARLETT2_AUTOGAIN_STATUS_COUNT, values);
+		uinfo, 1,
+		ARRAY_SIZE(scarlett2_autogain_status_texts),
+		scarlett2_autogain_status_texts);
 }
 
 static const struct snd_kcontrol_new scarlett2_autogain_switch_ctl = {
-- 
2.43.0

