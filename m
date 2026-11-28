Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795828967;
	b=wPUtP8ijOuac/q6rVqnG8jTpV1xyUgrXa8E4RVScgQ8IwaBq1EdFP1vF+geky079wioJ
	 xkP2RBp6JOqd4E+QuiCbNGDA7/4NKjDhntTeJMyz3U+NsHOgbsFTgQUhZoVEjA2YAYLHI
	 eynWK6ZGlKTYDtVPVUZqRjbiLLXPE4ZukFEuyQIdUae1CAgXMRS7+WUMEz4alvx9QY/uC
	 aRteYsyXk7mOViacSTgXFh5RU2lwnudLUJaCSBDDXleRe0S+S0a3v67rtCn/OaZ3pYgbI
	 ZE7FXsBJybFM464togtYtja1uhCM+Xf0BxSqG/t9OF5swVjJlimTs3e+VYgLLyRzq4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795828967;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cFBbiXkN5r28OvuYPToLrq7vCtbDjfKbRh3y/3moQBI=;
	b=AgooQ7UHFX503sfvlXvjEY2GGNhzJfmSWS7N4GCvYXojAlFZmPvFjqiHSwCnIlu+k7AC
	 /XnIL5YjCa+/JWqDVbNbDQMD0HaUjTVwMGWTVi48+VF4CojR20n1wi0YAmVqni3Q6qa9u
	 kn4F/BsOhADBEc/7F00VvQipi59Hz8MYU0wdPmrlo/KFWq1uwwqOYf5dsrkYyucoLbu1e
	 ikBmiNF+gW7Irv7ihPVPUT6qs2QodvkoVuwt/Jso2SslQuWOmH/P8nCPnO/mglSNyvthR
	 FZpDh99OiMoGdnsFS52FbV4TPL9Qo/QR67w7zUreMgnIRl33TB326ke8wfPfnDQM64Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NjlkenYE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CFC606A31C;
	Sat, 28 Nov 2026 01:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NjlkenYE
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795828966;
	b=L7TpsyzMNYrXdSyDzjS30QSdWK0526H0+RsVdrhIGo80+IN5b6qVbMMwO8CB/44+d1It
	 bqDNRayXpYmL0KlPovxHjzjnoJQJr9rKnv8XrW22EMF10gVzvopVonjphoQ7VWMn4weer
	 029pWWLnG4f4uGfHm95Y4ykUPmlpCGDCzRkthmTceIghXxEmElaf0z8gDapA0t7JMylv7
	 5rMZz6KwNwTW5XsQMh/MClNypM7IlRTKK41wdc41kmKliCc6p9gAJiSKDJahmJybrOm0L
	 u2V5IpZI/5gI5G3bKqDTnSjEGHwFH5MZ3DQ+SAmZIvc8RNI9w4hJmjSclVFVXvRpZHA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795828966;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cFBbiXkN5r28OvuYPToLrq7vCtbDjfKbRh3y/3moQBI=;
	b=Psjx8C65Y2NHMaanNvzcEWgPdhALQ+qXOywI2opTOtpqVxt3LODQhdvBi2Ve5svH15O7
	 pd5j2YnWRs5HNCS1CH3rmeGHhjpb5dSU5iVuX4Cfd0zLR+XaLQGpN4u1gu/MGH72WtMz5
	 wevGoS/1sfMsHz9+OVpBhAkHH79fmsAc684PfCMNaDQ5ZCUsZAVOvn4TsZS7EBawph2hd
	 UwbSqv4a4UZ1qCr/3kONC2OnWts6mQVR3mNxX6adu68Ne020TF9e+2TU/id53MaeqkR2f
	 1twRmYQCm9wS5o2D6LIwDVk7EWuMEXCf6gmfoE7l4Cob1kXt/cJrD4UlpcXMOWIhL5w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3B0991F00893;
	Sat, 28 Nov 2026 01:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795828966;
	bh=cFBbiXkN5r28OvuYPToLrq7vCtbDjfKbRh3y/3moQBI=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=NjlkenYEc627NDQ1slSHvi7z1MNX1G6CWPBBuWHwRmdtXHTH4DfxHaUZ0JgVNLJNC
	 MOMRZDzcjvCe1i+hKrKiasxv6U537ISIz6Nl3+xyVzSDGESDKT+7bN2YZ3HaCUgQTf
	 VFnD3U+PuIcDYf/KQBupwHuOSDUij0CAmKzTc5CxWy9K3VgUoHIo8FUlf2aFwnWTHf
	 Tf2uNXL9sfZHCvfvZOMHPIUSThQ699akR/oPUA6KPQ1vyneLH29yn6oW4YMkgwbWWk
	 FeIhorGY1n+Al4g11rIGdQQF5bHzO/3S9G1LBA2fRFqbGaOw1s9e7q9v2Hf/1UAYgd
	 u5LLaIqv4rsdA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 91B1B4DEF4;
	Sat, 28 Nov 2026 01:22:45 +0000 (UTC)
From: Silvio Unkovic via B4 Relay <devnull+silvio.unkovic.pm.me@kernel.org>
Date: Sat, 28 Nov 2026 02:22:30 +0100
Subject: [PATCH] ALSA: usb-audio: Add quirks for Sony PlayStation Eye
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261128-pseye-audio-v1-1-b751d7911847@pm.me>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5EQBBG4atIrXWimkjHVSazQP8oC6SLyYi4u
 8byW7x3kCIIlKrkoICfqMxTBKcJtUM99TDio8lmtmS2ziyKHabevMzGOVuUyJi73FMsloBO/s/
 t832tWzOiXe8FnecFI2Qgg28AAAA=
X-Change-ID: 20261128-pseye-audio-88246e011f3d
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Silvio Unkovic <silvio.unkovic@pm.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795828965; l=3921;
 i=silvio.unkovic@pm.me; s=20261128; h=from:subject:message-id;
 bh=JrLnAEHr27j9SpqNizQ3trGT7b8Z6DBmJXWrIsAhv18=;
 b=PDxWC7aricQBhCiifOAYidPVGV3Hgzfp56TCkwXuwUR8T6pHIwgr19ZkDOIjmcEKE8ZH9N7di
 hjC7+Cvw6jMBH5X5A1ven+shB6IcgvYxZfFp4ABmGtcPlyJ11W7zHd+
X-Developer-Key: i=silvio.unkovic@pm.me; a=ed25519;
 pk=EnRsDjntfFouyIMyaboNgoB+wQ65iMW873YmPIjPiII=
X-Endpoint-Received: by B4 Relay for silvio.unkovic@pm.me/20261128 with
 auth_id=1673
X-Original-From: Silvio Unkovic <silvio.unkovic@pm.me>
Reply-To: silvio.unkovic@pm.me
Content-Transfer-Encoding: 7bit

From: Silvio Unkovic <silvio.unkovic@pm.me>

The Sony PlayStation Eye camera (1415:2000) has a UAC1 four-microphone
array capture interface with a single 16 kHz rate.

Reading back the sampling frequency from its endpoint returns garbage
(e.g. 33186, 17004 or 2199316 instead of 16000), producing a "current
rate ... is different from the runtime rate" warning on every stream
start.  This was already reported in 2012 [1].  Set
QUIRK_FLAG_GET_SAMPLE_RATE to skip the read.

Its feature unit 3 advertises a per-channel volume control, but the
device answers GET_MIN, GET_MAX, GET_RES and GET_CUR with a single zero
byte instead of two bytes, so the driver logs "cannot get min/max
values" and creates a "Mic Capture Volume" control with a fallback 0..1
range that returns -EINVAL on read.  SET_CUR is accepted for any value,
but the capture level does not change: with a fixed range forced in the
driver, recordings stayed at the same level for every setting from
-80 dB to +60 dB.  Skip the control via a mixer map.

[1] "Usb audio - unsuported sampling rates", alsa-devel, 2012-07-10

Assisted-by: Claude:claude-fable-5-2
Signed-off-by: Silvio Unkovic <silvio.unkovic@pm.me>
---
Tested on a PlayStation Eye (1415:2000, bcdDevice 2.00, product string
"USB Camera-B4.09.24.1") on 7.3.4 with snd-usb-audio rebuilt with this
patch: no "current rate" or "cannot get min/max values" messages on
plug-in or stream start, the control is gone, and 4-channel 16 kHz
capture works as before.

The volume findings come from sending the FU 3 requests through usbfs
with the control interface unbound, and from a test build that gave the
control a fixed -80..+60 dB range and stepped it with amixer while
recording, in a quiet room and with music playing.

Tool use: an AI coding assistant (Claude Code) did the investigation of
the driver code, wrote the patch and the test scripts, and drafted this
changelog, working on my machine with the camera attached.  I ran the
tests on the hardware and reviewed the change and the results.
---
 sound/usb/mixer_maps.c | 16 ++++++++++++++++
 sound/usb/quirks.c     |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 9218ca631..26319ed0a 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -562,6 +562,17 @@ static const struct usbmix_name_map avermedia_gc553pro_map[] = {
 	{}
 };
 
+/*
+ * Sony PlayStation Eye: FU 3 advertises per-channel volume for the four
+ * microphones, but the device answers GET_MIN, GET_MAX and GET_CUR with a
+ * single zero byte, and SET_CUR is accepted without changing the capture
+ * level.  Skip the control.
+ */
+static const struct usbmix_name_map sony_ps_eye_map[] = {
+	{ 3, NULL, UAC_FU_VOLUME },
+	{}
+};
+
 /*
  * Control map entries
  */
@@ -640,6 +651,11 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 		.id = USB_ID(0x13e5, 0x0001),
 		.map = scratch_live_map,
 	},
+	{
+		/* Sony PlayStation Eye */
+		.id = USB_ID(0x1415, 0x2000),
+		.map = sony_ps_eye_map,
+	},
 	{
 		.id = USB_ID(0x200c, 0x1018),
 		.map = ebox44_map,
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index bd00db820..ff2bfe850 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2713,6 +2713,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_PLAYBACK_FIRST | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x13e5, 0x0001, /* Serato Phono */
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
+	DEVICE_FLG(0x1415, 0x2000, /* Sony PlayStation Eye */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x152a, 0x85dd, /* SMSL USB DAC */
 		   QUIRK_FLAG_DSD_RAW | QUIRK_FLAG_DISABLE_AUTOSUSPEND |
 		   QUIRK_FLAG_SKIP_IFACE_SETUP),

---
base-commit: e1aff4d4241057636394751508e633a92f1cbbab
change-id: 20261128-pseye-audio-88246e011f3d

Best regards,
--  
Silvio Unkovic <silvio.unkovic@pm.me>


