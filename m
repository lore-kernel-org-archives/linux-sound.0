Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019484;
	b=ATgf1T1M1FfC7sLR65/oOQD4J040Jbi+DxtBIcN2Bgc5A7R8Q3MatlIzjqvpURAGnePi
	 Zrcdl/U43BCmspB7Kyb3rKXVxbxubWql35KI0ydHrki5RMYiEgCvsVU6hY0GCFK4mfbKm
	 Mq1yae5LDytuSupBuJPnfSG8trYSXUB/48H6qRf2nYRHJgcuEhX1pRHDMR1DAka/MiF1a
	 2hpgviDbIy5C1xAea9MlXdALLSoLqEybjNPyXdqkJ2BeHKHRh12ycl7iWb6Gohj/UvqBh
	 r5pEAhnqx+wDk9CLFzwHINK2zfBlSgL2SeW+8IYgZBMLMok71PYk++vQ1amWluWvjlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CDuCVz07S0qbPUdAIoAtmgasF8yvxzKJyrb8p26CSho=;
	b=2bAL+t+DsBu4uY2+V4UPM6mCjQ8iJAYio5QHnuuWX+JAYrbhWaKTr4j0UhLH6ByQuTMF
	 xu1JNgHHSC7/mvFgQPUvEt4zvLfoNey/pPe1igy59zWxZnkq9KCeRuy9NtT8romr13K5Z
	 5i+tQ4vciDh8lwDWNzEwKqnOuAWWFhM8Hv1O1Un12otXfjAi1eWazFbwgdFzVd7MsDS3N
	 DhbbhZ9+2r9axI+aG4YgU6psSdlhQVql+YNaW+ZXcT/Pyb3lod6MfKRp6oNCb3yrPiWtz
	 dCW5V+c1m0/qCBmKA4OtiwD3T4m2OKLJ8476k0O+lgqh8jQAj+JdkmDqQdaCnru7hEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y+vtiLKj;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D171606A322
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 12:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D171606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y+vtiLKj
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so20432425e9.2
        for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 05:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793019483; x=1793624283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDuCVz07S0qbPUdAIoAtmgasF8yvxzKJyrb8p26CSho=;
        b=Y+vtiLKjJ1N9OgW2m0zh3o2GnfDpPDv9JuQKGv7uung54Kjb4xMG7uhUVywhkef8ef
         7FW7OyD5ub4rNm+tOj/13wlRNWcKwz/QpL18ZLDqkolzpXopBGw1kBKhtfaUdQIE/hww
         O+NZJEkHoFHyzsqEslf+cz7EoteAt5PfaS9zNxcUREt/oHZJ7aLdFZLQH17nIxviN3g7
         TWwPQJzJvImMdezxUUzjflDZtlWULa0MxrpLORzokcSp4NXQd9ldZOOaWmPnvr+QAVaR
         Pu4PKopoX1vg/QJoFFoVg5SznRvshS6dpJ+H8zJ44+B5n0JEnNR1Ik+QDhcGlRSqoJf6
         zOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019483; x=1793624283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CDuCVz07S0qbPUdAIoAtmgasF8yvxzKJyrb8p26CSho=;
        b=CuJHMhgwq1NXkNocF+DO0rbnDUnQrJonDv1UODNtqUhsNOKrXc3Fstouxjj/0AZaU4
         dACqtiXZiWLgTxgYUp3KKI4ZWwbgAiS5u/6EwCd6nS5u5z+55Shv3DFHnwSng3p6ywjk
         ajDSy0935odfTQkL5N3C5w12MzkdgNDjxnlU4H6nZvkyRwHOMbClS7c0RARRjlJbbosM
         LDpxvcUe3zxyuTOivPSqzTj6hEyf3SiuZZLIkpiIzB/zWuvAwds3PGyV+spGFvd8qyZ4
         CKgxM328ZAghOFiqIkDooa5PszhJYni9PMkvjH3CgRdu8Gd0aeF1CBL+HTgRiJmq4XFk
         P+sg==
X-Forwarded-Encrypted: i=1; AKwUvBwSKlhVZAeOshSS0xiv9hxCuZs+bC65jwasJvQ+B47KOLXYGuweUlku9gkK45Mts/hHk0aIYxK/BcI7oQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLvM8HCqyFdYso3O+iL5UEkK0OMijy829g4k9UIwrzxP0z87Zq0
	S8XXxHnl4lF9xRDN/CFQKSuGlyuJ1oO+TBgh/ZgigqbaO3L+OKEPbV+RDMh9YLlr18M=
X-Gm-Gg: AYBFou26va2E9nVo1gO4mLf7rxaVR+r8LcW9THXDtjkZnDrzDnNQmU6vpyKIVrCnREm
	3sYRwEZ3T98IEo/Ecp40RP7nEu22lWC51tXxQfKr8ByckfIbkhZajf1F93nPn41EDYSSuKKRpeh
	WW5cZgmo/sN1cWtGlgEhm8EFHMDy3+qw1FLkCKhuKaE05ymw9xLwizNN7xtTO+6hIVlmqblJ6iN
	MGwOusm8+/uUz7GCYV9eA/CywdmEQ3nmHviTlyoNYFNoEGJiHDVkIP3YXtbmhtwu+cV9YPAn9px
	dndQxTW8nnL5Yu4ytl8NuVwxji8CM4MusXlyXntf5LD/ZVI2YIU9+ozf+vxMK5h2cggqtpJ6tOb
	aWH+FvFdgORhr3uM1sPIeZpcSZHWS6qpLeN3ySqIfE+N0KAkXUO56p9cu/4yWZ1X106mhny6B+U
	HtikfxAC//sMYaD+PEtYg82VVuZoEHaZflWG+qh+bwadehTv1FK4sg/yVeyX1mQXLOuj4GwSTf6
	Tb1u3x2QdjJkWPCDrqXMmXm79sFbvungYrg16JKaGIyrHFPzlk7m8uHPRwLT4TR90U4xyH4knNY
	e3KPjjihqhoTTWTJ4eO9wvU=
X-Received: by 2002:a05:600c:1388:b0:4a1:fb01:13 with SMTP id 5b1f17b1804b1-4a35aca74f6mr151054235e9.18.1793019482733;
        Mon, 26 Oct 2026 05:58:02 -0700 (PDT)
Received: from stjepan-Aspire-F5-573G ([2a00:1bb8:118:d39e:4868:f22e:b51d:7cb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb99esm15827381f8f.23.2026.10.26.05.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:58:02 -0700 (PDT)
From: Stjepan Poljak <stjepan.poljak@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Clemens Ladisch <clemens@ladisch.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: reset a MIDI device whose input is stuck
Date: Mon, 26 Oct 2026 13:57:51 +0100
Message-ID: <20261026125751.1700779-1-stjepan.poljak@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switching a bus-powered USB keyboard off and on can be too quick for the
hub to report a disconnect. The device comes back unconfigured at the old
address, and its input endpoint then fails forever:

  - with -EPIPE, which snd_usbmidi_urb_error() logs and treats as
    "continue", so the URBs are resubmitted at once and the log fills
    with "urb status -32" every few milliseconds;
  - or with -EPROTO/-ETIME/-EILSEQ, retried silently every 100 ms.

Either way the rawmidi device stays, reads never fail and no data ever
arrives, so the instrument goes silent until the cable is replugged.

Retry a stalled input endpoint through the error timer like the other
errors, and when input stalls, or keeps failing for 2 s with no
successful URB, queue a USB reset. snd-usb-audio has no pre_reset or
post_reset, so the reset unbinds and re-probes the card, and userspace
sees an ordinary unplug and replug. A real unplug normally reaches
disconnect() long before 2 s. If the host misses that as well, as
dwc_otg does behind a hub, the input stalls and the reset finds no
device, which ends in the same disconnect.

The queued reset is dropped without a word if usb_lock_device_for_reset()
fails (e.g. -EBUSY when the device lock is held for over a second), so
while input keeps failing, queue another one every 2 s.

Output endpoints are left as they are.

Tested on a Raspberry Pi 3B+ (dwc_otg, Raspberry Pi 6.12.61 kernel) with
a Nektar Impact LX49+ (2467:2015) behind the on-board hub. Without this
patch, switching the keyboard off and on left it silent, with "urb
status -32" logged every few milliseconds. With it, each off/on cycle
logged a single "MIDI input not recovering (urb status -32), resetting
device", and the keyboard was re-enumerated and playing again 2.8-4.0 s
later, including two cycles 9 s apart. Left switched off for 3 minutes,
it was reset, disconnected cleanly and enumerated normally when switched
back on. Unplugging the cable went the same way: the input stalled, the
reset found no device and disconnected it, and plugging it back in
enumerated it normally. No warnings while playing normally over about
three hours.

Also tested on x86_64 (xHCI, 7.0 kernel): there the host sees both the
off/on cycle and an unplug as ordinary disconnects, so no reset is
queued and input resumes after re-enumeration as before.

Assisted-by: LLM
Signed-off-by: Stjepan Poljak <stjepan.poljak@gmail.com>
---
 sound/usb/midi.c | 45 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index e3d157554061..7f93df66e55b 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -70,6 +70,12 @@
  */
 #define ERROR_DELAY_JIFFIES (HZ / 10)
 
+/*
+ * how long input may keep failing before we reset the device (a real unplug
+ * reaches disconnect() well before this), and the least time between resets
+ */
+#define RESET_DELAY_JIFFIES (2 * HZ)
+
 #define OUTPUT_URBS 7
 #define INPUT_URBS 7
 
@@ -162,6 +168,10 @@ struct snd_usb_midi_in_endpoint {
 	bool in_sysex;
 	u8 last_cin;
 	u8 error_resubmit;
+	u8 failing;		/* no successful URB since the last error */
+	u8 reset_queued;	/* at reset_at */
+	unsigned long failing_since;
+	unsigned long reset_at;
 	int current_port;
 };
 
@@ -234,6 +244,36 @@ static void dump_urb(const char *type, const u8 *data, int length)
 #define dump_urb(type, data, length) /* nothing */
 #endif
 
+/*
+ * A device that was power cycled without the hub noticing (e.g. a bus
+ * powered keyboard switched off and on again) has lost its configuration:
+ * it stalls the input endpoint or stops answering, and resubmitting the
+ * URBs never recovers it. Reset it instead; snd-usb-audio has no
+ * pre_reset/post_reset, so this unbinds and re-probes the card.
+ * A queued reset is skipped if usb_lock_device_for_reset() fails, so if
+ * we're still here a while later, ask again.
+ */
+static void snd_usbmidi_in_error(struct snd_usb_midi_in_endpoint *ep,
+				 int status)
+{
+	if (!ep->failing) {
+		ep->failing = 1;
+		ep->failing_since = jiffies;
+	}
+	if (ep->reset_queued &&
+	    time_before(jiffies, ep->reset_at + RESET_DELAY_JIFFIES))
+		return;
+	if (status != -EPIPE &&
+	    time_before(jiffies, ep->failing_since + RESET_DELAY_JIFFIES))
+		return;
+	ep->reset_queued = 1;
+	ep->reset_at = jiffies;
+	dev_warn(&ep->umidi->dev->dev,
+		 "MIDI input not recovering (urb status %d), resetting device\n",
+		 status);
+	usb_queue_reset_device(ep->umidi->iface);
+}
+
 /*
  * Processes the data read from the device.
  */
@@ -242,13 +282,16 @@ static void snd_usbmidi_in_urb_complete(struct urb *urb)
 	struct snd_usb_midi_in_endpoint *ep = urb->context;
 
 	if (urb->status == 0) {
+		ep->failing = 0;
 		dump_urb("received", urb->transfer_buffer, urb->actual_length);
 		ep->umidi->usb_protocol_ops->input(ep, urb->transfer_buffer,
 						   urb->actual_length);
 	} else {
-		int err = snd_usbmidi_urb_error(urb);
+		/* a stalled endpoint stays stalled: don't resubmit at once */
+		int err = urb->status == -EPIPE ? -EPIPE : snd_usbmidi_urb_error(urb);
 		if (err < 0) {
 			if (err != -ENODEV) {
+				snd_usbmidi_in_error(ep, urb->status);
 				ep->error_resubmit = 1;
 				mod_timer(&ep->umidi->error_timer,
 					  jiffies + ERROR_DELAY_JIFFIES);

base-commit: 5deb9c57ba93d28a52871a96f3d8794d2cbed035
-- 
2.53.0

