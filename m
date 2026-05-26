Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09CF33A9F5
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 07:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779780555; cv=none; b=SgZfGUCicpOMfWwZG7qWiJf+SvlHGj3DLp9QL55YZZ4p5GAfa3udLberkHLhnnOD7RzdfpgkHJDHDfokhhLjzWuEjdHBQEVQ+p3Q53tYDauhC0Zm0W9hABQWM70OW66/nVWqUxugR4Of+cE8jmAm8rFHU5thm1K+dlFUJ21E56U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779780555; c=relaxed/simple;
	bh=xvumc7IKqu8Qnwk8AWxZpI8AvAIPSVAsd+6YsJ+3Nfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rcy3XD1aZpwxoIFeckLe4sm9AU19qvdauK0+G5CzOAkchYXcGOaiW42adc652Q4AnR6s7x+L26VM3cl7j1Ep0G3xjx8nSAY3hKPRNPfJXOU+daZ0Iaq12mxl4a1Itj1uoI5l7uhp6wyNskB6JzCttCe9P+VsPCcRLwH3FEQo97A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ss0lak6t; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ss0lak6t"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-134fe980658so11798289c88.1
        for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 00:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779780553; x=1780385353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=duOeqU2aHW72kUeDt2Zev5JrjKN42G9f1OMWDHaWfO0=;
        b=ss0lak6tO23vFfIxatIIyGv4VH4oMqh8gHXODw/3c7oDlkrRyzLlvFO9KmM/m2Wf5M
         nNWkehd1FtZk/VA9Kj1y7Wfef+J6uXtBtp3rh5fZMfJrZ+8NhSq2tylshWEc+g1M+B5w
         GslWZkVPf16+UHWFz5utE4RXS5O4Oyg3HM2VADCHijfQWiX4IkkHZNsAjMO3kMKPzQ+B
         bsZFHMcuuL43HFFgeAzVY5SXn+I14CBQRsNCv4XWNOhpU5KRty5/o82hgn5JNAtXl9yS
         8ziSgHvMZsfjAl5oTcvhpmflXwBi2W1RPbJE08uoYA3/3Hw2SFV8GV9wP/die2sS3b9M
         FFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779780553; x=1780385353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duOeqU2aHW72kUeDt2Zev5JrjKN42G9f1OMWDHaWfO0=;
        b=K1yADMbXJklk2s2qUK4oCMvBrPtrQKmvFb+4GLZEAOlU5p4+M7dKuZ6FDEdlW/Ea+t
         kDWY0Zn4oOsnTecP+al10bjKh8JV64vSBoX0r7fsofyjQ9br8udlweuSwjalFyrPIX/i
         CMgAd6CHxHjRqcXdX6uAJOcEllR+Fjr8OQP23o4T/F64EtnFhvDc6eRscdqxD6ynrEwx
         NIso3HT2f3Xo928o7Qhm/DMjKqLX6ULE/x1lT5qDpvgjzFhtlJYMOHDv1fLr+S8A7RoY
         9ExVS151wfaEMNMI17k5QRxTI8VHdrgTFpTD/iILabbdKj6TP/SMaKBS3tPx3tgkCoh7
         A9OQ==
X-Gm-Message-State: AOJu0Ywdq9SrSxGUHRY2i5QC00jZyuEhygsq4XwiOvfCpH4Kp0DjPka/
	t2M84I4G8XAb8Q5B4bB3w6CcOTdz7AW/gTe4rv/MlqPvOy9G0GBbujHFCAZ+Mq381sc=
X-Gm-Gg: Acq92OFiiJKgO9LQGGd9SUMZdqH/3AwF+17RSHebyDk+bfjNJmlqvA0iwuGhIfuwSFy
	+RXpSrjLAS3DtCv4sv9D2EOcqRqVrI8EXVe/jEAbYsJfcNK9m2Tw4lizH9uDnv6oJ6k/zNYQb1L
	qDoSJa/kTQnBZQRLLtcU72Q2b/6Sp5fKYWMU+nXgdkm/i/Yg5BBJ018yoqAFqTBRevJvT//VZLE
	PdSHQvZW/25RfU2ZHuXKQhyhH7vlX7HhRyxbJeb314fmYMviwFwlgQoqrUMwPKCqR/aYtYEmMvc
	zxrGS0FARIt537H6lU4NfyBFI3kPID2LqZ733Zu7ogbIpfAPhcYPDl6Q/K2Ug3yQBIYWcxmPij6
	n9eS/tIx6qSg7AqDaPmIOHiLglV/hKp1NN6ACCAIRLfiJIye7Ums1pGuhO+R2MpxrG5D94gaqyZ
	mejGQ75ZroujPyPfLLgRpcP9Bam/lL312uI2SmBmbdiDt/d3ANx1Wkh6KzJujibLJ+a+Q=
X-Received: by 2002:a05:7300:7fa6:b0:2ea:edc0:4fbe with SMTP id 5a478bee46e88-30449095631mr8456932eec.14.1779780552677;
        Tue, 26 May 2026 00:29:12 -0700 (PDT)
Received: from localhost.localdomain ([24.249.245.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045245d6aesm9292001eec.26.2026.05.26.00.29.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 26 May 2026 00:29:12 -0700 (PDT)
From: Gordon Chen <chengordon326@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org,
	Gordon Chen <chengordon326@gmail.com>
Subject: [PATCH] ALSA: usb-audio: add IFB_SILENCE_ON_EMPTY quirk for Behringer Flow 8
Date: Tue, 26 May 2026 15:29:06 +0800
Message-ID: <20260526072906.90106-1-chengordon326@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Behringer Flow 8 (1397:050c) is an 8-channel USB mixer that
declares OUT EP 0x01 with implicit feedback from capture EP 0x81 via
its UAC2 endpoint companion descriptor. After 5-35 minutes of
continuous playback, the device occasionally returns a capture URB in
which every iso_frame_desc has a non-zero status (-EXDEV bursts,
visible as rate-limited "frame N active: -18" lines in dmesg from
pcm.c).

In that case snd_usb_handle_sync_urb() at endpoint.c counts bytes==0
and falls into the early "skip empty packets" return originally added
for M-Audio Fast Track Ultra. As a result the playback EP loses its
sole IFB-driven feeder and the OUT ring starves permanently: hw_ptr
stops advancing while substream state remains RUNNING. Only USB
re-enumeration recovers.

Three independent ftrace captures (taken at the moment of stall via a
userspace watchdog) consistently show:

  - 60-70 capture URB completions in the 70ms window before the marker
  - 0 retire_playback_urb / queue_pending_output_urbs /
    snd_usb_endpoint_implicit_feedback_sink calls
  - every usb_submit_urb in the window comes from
    snd_complete_urb+0x64e (capture self-resubmit), none from the
    queue_pending_output_urbs path

Add a new opt-in quirk QUIRK_FLAG_IFB_SILENCE_ON_EMPTY: when set, the
early return is skipped and we fall through to enqueue a packet_info
whose packet_size[i] are all 0 (the existing loop already maps
status!=0 packets to size 0). prepare_outbound_urb then emits a
silence packet, the OUT ring keeps moving, and the device rides
through the glitch.

The default behaviour (early return) is preserved for all existing
devices including M-Audio Fast Track Ultra. Only Flow 8 opts in here.

Cc: stable@vger.kernel.org
Signed-off-by: Gordon Chen <chengordon326@gmail.com>
---
 sound/usb/endpoint.c | 10 +++++++++-
 sound/usb/quirks.c   |  3 +++
 sound/usb/usbaudio.h |  8 ++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 6fbcb1175..24cd7692b 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1780,8 +1780,16 @@ static void snd_usb_handle_sync_urb(struct snd_usb_endpoint *ep,
 		/*
 		 * skip empty packets. At least M-Audio's Fast Track Ultra stops
 		 * streaming once it received a 0-byte OUT URB
+		 *
+		 * However, on devices where bytes==0 means every sync-source
+		 * packet errored (e.g. Behringer Flow 8 returning -EXDEV bursts
+		 * for entire capture URBs), an unconditional return starves the
+		 * IFB-fed OUT ring permanently. Such devices set
+		 * QUIRK_FLAG_IFB_SILENCE_ON_EMPTY to fall through and enqueue a
+		 * packet_info with size 0 packets, so playback emits silence
+		 * and the OUT ring keeps moving.
 		 */
-		if (bytes == 0)
+		if (bytes == 0 && !(ep->chip->quirk_flags & QUIRK_FLAG_IFB_SILENCE_ON_EMPTY))
 			return;
 
 		spin_lock_irqsave(&ep->lock, flags);
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 31cbe383a..e2c95be38 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2365,6 +2365,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_PLAYBACK_FIRST | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x1397, 0x0509, /* Behringer UMC404HD */
 		   QUIRK_FLAG_PLAYBACK_FIRST | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
+	DEVICE_FLG(0x1397, 0x050c, /* Behringer Flow 8 */
+		   QUIRK_FLAG_IFB_SILENCE_ON_EMPTY),
 	DEVICE_FLG(0x13e5, 0x0001, /* Serato Phono */
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x152a, 0x880a, /* NeuralDSP Quad Cortex */
@@ -2602,6 +2604,7 @@ static const char *const snd_usb_audio_quirk_flag_names[] = {
 	QUIRK_STRING_ENTRY(SKIP_IFACE_SETUP),
 	QUIRK_STRING_ENTRY(MIXER_PLAYBACK_LINEAR_VOL),
 	QUIRK_STRING_ENTRY(MIXER_CAPTURE_LINEAR_VOL),
+	QUIRK_STRING_ENTRY(IFB_SILENCE_ON_EMPTY),
 	NULL
 };
 
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 58fd07f8c..9afcad8f1 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -236,6 +236,12 @@ extern bool snd_usb_skip_validation;
  * QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL
  *  Similar to QUIRK_FLAG_MIXER_PLAYBACK_LINEAR_VOL, but for capture streams.
  *  Overrides QUIRK_FLAG_MIXER_CAPTURE_MIN_MUTE
+ * QUIRK_FLAG_IFB_SILENCE_ON_EMPTY
+ *  In implicit feedback mode, when an entire capture URB returns with
+ *  all iso_frame_desc[i].status != 0 (bytes==0), do not silently return
+ *  from snd_usb_handle_sync_urb. Instead fall through and enqueue a
+ *  packet_info containing only size-0 packets, so the OUT ring keeps
+ *  moving (emits silence). Needed by Behringer Flow 8 (1397:050c).
  */
 
 enum {
@@ -268,6 +274,7 @@ enum {
 	QUIRK_TYPE_SKIP_IFACE_SETUP		= 26,
 	QUIRK_TYPE_MIXER_PLAYBACK_LINEAR_VOL	= 27,
 	QUIRK_TYPE_MIXER_CAPTURE_LINEAR_VOL	= 28,
+	QUIRK_TYPE_IFB_SILENCE_ON_EMPTY		= 29,
 /* Please also edit snd_usb_audio_quirk_flag_names */
 };
 
@@ -302,5 +309,6 @@ enum {
 #define QUIRK_FLAG_SKIP_IFACE_SETUP		QUIRK_FLAG(SKIP_IFACE_SETUP)
 #define QUIRK_FLAG_MIXER_PLAYBACK_LINEAR_VOL	QUIRK_FLAG(MIXER_PLAYBACK_LINEAR_VOL)
 #define QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL	QUIRK_FLAG(MIXER_CAPTURE_LINEAR_VOL)
+#define QUIRK_FLAG_IFB_SILENCE_ON_EMPTY		QUIRK_FLAG(IFB_SILENCE_ON_EMPTY)
 
 #endif /* __USBAUDIO_H */
-- 
2.54.0

