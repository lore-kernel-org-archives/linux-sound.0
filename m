Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84F641C311;
	Tue, 26 May 2026 17:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779817814; cv=pass; b=S3GKiXgbhGLkzQhVLJ27/jVfS1pKdt7+pBwQmyN6zr1bi4ykqNdQDRBXnKmFuCbbj3A0A3OMz8Guk+vAOuCC2PSPX+l2vg8kzP0gyH3Q/drEdQ3Sc3CwtOfP9gZhCmN6k3pWplPf+yqphNS9mt7SJgZwoBdrres09ai2JNt056Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779817814; c=relaxed/simple;
	bh=vH7FauxUkp45yBL/ew16wMzMQf+NbBEHQ1nFF3xNEB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SL0RJFErQDErgQ9qbwJghwLrQKvgYRnHggyeQWbA4H36Jhx0XEYo0a2pn5UjqASIgo9o6bgwYlOpMAaxbwNilfgucph1xGT15JSyYxYCfxBq7vHz0tIpVRbQ61k2mPfJYtnmpxczClK/T3Qml7aZv3eXv/CWLk3kBn0GJtl3u70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=p/6AsAQR; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="p/6AsAQR"
ARC-Seal: i=1; a=rsa-sha256; t=1779817801; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GoR+SOxvMZ+U0y6OOJr/l2BbUGpWGVp4+Yk1V4kxp01gdBhvpbWfqy9q5paImUxFqp3TG71vLQtyITYt6gTgVLvPLyFHl9AfrqWug1vms+xkTg10M/8R4MYOOG18QEf56jWGoSWR1vlzmF1RlwRQGjjck2pMEMiMicDM4npkGUk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779817801; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VLrDT377GASBLn5Fv+sCaTen+2wMN2viBJCcFAipBEU=; 
	b=QJN3N2tG90meN/Xlc9/+2JtQysaMscGFqcinOMgh3B6pwDG9hVP545API8ZPtiz12N4YKA5mAfsKSmaapFofBs4xBwgM6X3I4GyVEbYsHjBlMVrT1JIhIbXE5V7t57TYNXB2F6RGV5lTAFZL7nPkF8l5d3zF7gX6cjpzhDewVpI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779817801;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=VLrDT377GASBLn5Fv+sCaTen+2wMN2viBJCcFAipBEU=;
	b=p/6AsAQREqvp5lqyXRilbxmM/oAn4BKzz2FlD9xR/7Cfy3HZ0kbZzqac2J/G5mV+
	aoQCbZVTPfRfFcrmsVCeuyoH6Ei9qumfPTf9kfm5KAtpVmTAkFhA/MuX4kHKkIxcvZK
	cAGJD4m5Nx8YpFk9LQKb1cULZ84LhYZtQe+WIXB8gBQpIvgb1FtNrBr5zIayUF12feD
	Sks197s07XO9H+UAlF5vnCp1PDwLfFDWovZYjNeJICVMwHLcZrOLYKiSC1BzgZtqYvM
	wHHgXs0bkSRxCr0rclul7HaqI1Dm8I8XtaMVODM1+9Aml4dqap8ObUGMcV0jVLbO/d8
	OLk9EaBGiw==
Received: by mx.zohomail.com with SMTPS id 177981780023181.57790475533602;
	Tue, 26 May 2026 10:50:00 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Wed, 27 May 2026 01:49:24 +0800
Subject: [PATCH 2/3] ALSA: usb-audio: Add QUIRK_FLAG_MIXER_SKIP_GET_CUR_VOL
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-uac-quirk-get-cur-vol-v1-2-e9362b712e5e@rong.moe>
References: <20260527-uac-quirk-get-cur-vol-v1-0-e9362b712e5e@rong.moe>
In-Reply-To: <20260527-uac-quirk-get-cur-vol-v1-0-e9362b712e5e@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Gordon Chen <chengordon326@gmail.com>, linux-sound@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-d5d98
X-ZohoMailClient: External

Since commit 86aa1ea1f15c ("ALSA: usb-audio: Do not expose sticky
mixers"), the UAC mixer core utilizes volume SET_CUR and GET_CUR to
identify devices with sticky mixers. Unfortunately, even though most
devices with sticky GET_CUR also have corresponding sticky SET_CUR,
which I actually met more since the commit had been merged, there is
also a rare case that some devices may have volume mixers that responds
to SET_CUR properly but with its GET_CUR stubbed. This cause the sticky
check to consider the mixer to be sticky and unnecessarily disable it.

Add QUIRK_FLAG_MIXER_SKIP_GET_CUR_VOL to prevent sending GET_CUR to
mixers by returning -ENXIO early. The error effectively skips the sticky
check as it's only meaningful when the mixer has some sort of self-
awareness. Similar to QUIRK_FLAG_GET_SAMPLE_RATE, this should also help
if some unmet devices can't tolerate volume GET_CUR in other ways.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 Documentation/sound/alsa-configuration.rst | 4 ++++
 sound/usb/mixer.c                          | 5 +++++
 sound/usb/quirks.c                         | 1 +
 sound/usb/usbaudio.h                       | 6 ++++++
 4 files changed, 16 insertions(+)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index 4b30cd63c5a5..bc3bc65c379a 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2389,6 +2389,10 @@ quirk_flags
           from snd_usb_handle_sync_urb. Instead fall through and enqueue a
           packet_info containing only size-0 packets, so the OUT ring keeps
           moving (emits silence). Needed by Behringer Flow 8 (1397:050c).
+        * bit 30: ``mixer_skip_get_cur_vol``
+          Skip reading current volume for mixers, as some devices return
+          constant values or errors but otherwise works fine, i.e., setting
+          volume takes desired effect.
 
 This module supports multiple devices, autoprobe and hotplugging.
 
diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index d61bde654219..3b745aebb181 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -420,6 +420,11 @@ static int get_cur_ctl_value(struct usb_mixer_elem_info *cval,
 static inline int get_cur_mix_raw(struct usb_mixer_elem_info *cval,
 				  int channel, int *value)
 {
+	struct snd_usb_audio *chip = cval->head.mixer->chip;
+
+	if (chip->quirk_flags & QUIRK_FLAG_MIXER_SKIP_GET_CUR_VOL)
+		return -ENXIO;
+
 	return get_ctl_value(cval, UAC_GET_CUR,
 			     (cval->control << 8) | channel,
 			     value);
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index e2c95be38aca..fbd44baace68 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2605,6 +2605,7 @@ static const char *const snd_usb_audio_quirk_flag_names[] = {
 	QUIRK_STRING_ENTRY(MIXER_PLAYBACK_LINEAR_VOL),
 	QUIRK_STRING_ENTRY(MIXER_CAPTURE_LINEAR_VOL),
 	QUIRK_STRING_ENTRY(IFB_SILENCE_ON_EMPTY),
+	QUIRK_STRING_ENTRY(MIXER_SKIP_GET_CUR_VOL),
 	NULL
 };
 
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 9afcad8f143a..f4e048788f0b 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -242,6 +242,10 @@ extern bool snd_usb_skip_validation;
  *  from snd_usb_handle_sync_urb. Instead fall through and enqueue a
  *  packet_info containing only size-0 packets, so the OUT ring keeps
  *  moving (emits silence). Needed by Behringer Flow 8 (1397:050c).
+ * QUIRK_FLAG_MIXER_SKIP_GET_CUR_VOL
+ *  Skip reading current volume for mixers, as some devices return constant
+ *  values or errors but otherwise works fine, i.e., setting volume takes
+ *  desired effect.
  */
 
 enum {
@@ -275,6 +279,7 @@ enum {
 	QUIRK_TYPE_MIXER_PLAYBACK_LINEAR_VOL	= 27,
 	QUIRK_TYPE_MIXER_CAPTURE_LINEAR_VOL	= 28,
 	QUIRK_TYPE_IFB_SILENCE_ON_EMPTY		= 29,
+	QUIRK_TYPE_MIXER_SKIP_GET_CUR_VOL	= 30,
 /* Please also edit snd_usb_audio_quirk_flag_names */
 };
 
@@ -310,5 +315,6 @@ enum {
 #define QUIRK_FLAG_MIXER_PLAYBACK_LINEAR_VOL	QUIRK_FLAG(MIXER_PLAYBACK_LINEAR_VOL)
 #define QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL	QUIRK_FLAG(MIXER_CAPTURE_LINEAR_VOL)
 #define QUIRK_FLAG_IFB_SILENCE_ON_EMPTY		QUIRK_FLAG(IFB_SILENCE_ON_EMPTY)
+#define QUIRK_FLAG_MIXER_SKIP_GET_CUR_VOL	QUIRK_FLAG(MIXER_SKIP_GET_CUR_VOL)
 
 #endif /* __USBAUDIO_H */

-- 
2.53.0

