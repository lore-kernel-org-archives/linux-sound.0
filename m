Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792431997;
	b=Jm1MALl6jd2vhsn/dlawM6Op6QrfeLHdAorA0MFjR1RxIYd9WGkq5cZJCPfXDQCPusgA
	 grn507ZO6Lbw4ckRWZ+fP8ru+eFvUw8t8ie27dd+TUDzwcdkv7Ad/PnOTD8lh1lhlibuq
	 NSB/hr4hwv9l3SpCXTA1JDrplSaeSRkZZ5v2mOqlA13uCzXsTkvgcXP87m32atuIQkGZK
	 V09IZlj6aq3N3zZOqC8JXX5so8PsCQF+SUcTTNy0vUxczXGeQFSWO09z4mZiGnDqwUZIN
	 JwGxx6vEziqliB1OKLFQZtup54Ycdg/csOtdtaT4t6o+XD85yML17OKFEP5pc5ROKSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792431997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=B5W6DsCWFtYZKF0aOXpVSIa5Zd4BJibZGEM2WU5Ugw4=;
	b=IaqGs0z+BMOzgRzCXUHcR8pvr/WDAES3LP8VrRuty4gzX7bMRvwHoA1KQSmS4NELRrBm
	 4u4ouzffiIbwlwEreJpApqYlvbwVQgqJYdeg5UiXXNrQNaMqlb697ZDIHprpWNwEEjY4x
	 yhTk+Nw4o8AXQAsNGB8SqNUUot8PB3XOJQ4BaZHVrq/W02T8nHOaafTuaDxQQ18YSiI7h
	 vv7TvLL6PwDQvafB3qy+jwtIX+aV4Hnd6BgMdRJ9pgYHFUlV/gAS2JfP4vON8uR/AxEi4
	 JA70QkbMkjHFZPCgOafxCPn1Dzpr+7lR6wB9A95n542EsTt2LErh5w+fQeU/G+qDqZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ac1KJ7PC;
	arc=none smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7512160A3831
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 17:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7512160A3831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ac1KJ7PC
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7c6e6822b11so647571137.0
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 10:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792431995; x=1793036795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B5W6DsCWFtYZKF0aOXpVSIa5Zd4BJibZGEM2WU5Ugw4=;
        b=Ac1KJ7PCeOlItLBovwnkjZ9pjZY+juAutygyb0712Nl6r8o3yTssNQVKZsNxC3+wM+
         eIcntaNbIisg1vxm/SNXnaqrwIUFjl0yCDfGxqELJFp1alLwXRBW+qPUXyIsUY+jzMxD
         Z6WtNqJOAqZChhzHiQB+fCQc7o5Nym1c3BeqC/iXhXMtxMB2tZrNgtML5bSZvgJLR2aG
         S2ticH/lcErQ3h2vH3JSiODwn444WNk9w8NfWWyOLasA9j3I1aMryjKiMQfefmNWgsl5
         wHolXnMdE9vUMrd7R/nlSghzydngB9+FAVe/1bMQ2rt6dGskBmiXftwVnr+mX13cR7RR
         dYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792431995; x=1793036795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B5W6DsCWFtYZKF0aOXpVSIa5Zd4BJibZGEM2WU5Ugw4=;
        b=Qsw/yMI8yHZP+ws8QutD5Y1ms8Po5lf210/mIAudrE5g99OKUj1sALMNpxHfpnMvI3
         1tQu7Xg7F/zHQu6PqNNtZ5jfxWqpjQ4ct2suJ2egXDncHjUuKrATmOMtZfI2A/sFpY/R
         IRwXK1v5JwTbpRIk9mDyWKUNyrToNxrModzEp9CzKcgQtoeAA2brLVrLEW7e64/+6b4f
         E7FxPlvHoYLGTGz4I9NK8iMCbME13Xud73oQ68gTlq46NMaMBB48tIKBSGxmg3qczqvR
         UZuUjrJSGwHovpoH3o8WZ73ujWtb6gQBYJkc4s5+L63Vh21HBo94sy6yHp6M9/B3r/0O
         a3fA==
X-Forwarded-Encrypted: i=1; AKwUvBw+mpkKyi1yuqJn9hjPw31CWSs8Tp9GPf+dNy3JiY4UHLBoBIZIg8UfIQIM/cXyGSldBqU9Dhj3eXdTuQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKxLWUGMJpKMC/x0Tiya9CTqJYQO59TfDd9omuPJ+2L3Ka63X0w
	eO7YkKKYsrhwu5iNdUKlG4pOLuBaiTrVVHLb8IXyzvM/6mqYyJNNl3Os
X-Gm-Gg: AYBFou127FODW6pVR7M3B2c7AWyLY36SsXFoaG6kKeC5Wyi3pshBu+4vCb5nBe1LAqo
	YzvgO5fw8zCnBca0PNDRetUiQs8L33UfmAuKfB0ZoSc0hzABoActnoQfrhI/tYm5Pxn2CkYaTtV
	W/gLjoW9dLBkQw7JRfA4X/y7alwsU7Hw++KNgjpGtl1bXsCce0LkvdZ06/twS7BW60fC0E6VVeI
	ZBlRvWkGf0hcOkGwFKIuDfAXJnG8TpHO+TxuzcMHxcVAVeaJnFoIMbUCQFiK6QFswvfsM7ZNfjj
	HXOSn5zHomhtz6aBOMPTO9yHKM2Zv5UtO8jTM1WHGrsvGD8HYisNe8YDJot4WTUqORRD8cS5qeS
	VqNCrUDf/FruQkyZi+688qmijcx5dlXAxSUg/O03IlZLoW2nZg02nSovcKoAakaexiPEyG3JJy6
	d5J2x+5PWHprP6VOUbeEEr21F4Kh6mRiOX3+rx6sySzRqPu0e4frAGi5alabuL7MMGp8F8I+zEv
	ND+0+NcSksgNffWQp4C/TQJZij/GeMV66eIzs9FEFiDnqgGUeA72677MzR0x46+Z0SbxttAh38v
	DUsIV/CLMeXOpmOoeJ3aT3LhBCQtw3E=
X-Received: by 2002:a05:6102:509f:b0:7cb:bbcc:e52 with SMTP id ada2fe7eead31-7cc364ab6c3mr1915373137.0.1792431995265;
        Mon, 19 Oct 2026 10:46:35 -0700 (PDT)
Received: from alsa-dev.int.suenodeluz.com.do ([74.244.193.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb3adfd0sm790707241.12.2026.10.19.10.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:46:34 -0700 (PDT)
From: Frank van de Pol <fvdpol@gmail.com>
To: tiwai@suse.de,
	perex@perex.cz
Cc: corbet@lwn.net,
	khan@linuxfoundation.org,
	rdunlap@infradead.org,
	fvdpol@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 11/13] ALSA: jockey3: Add MIDI support
Date: Mon, 19 Oct 2026 13:44:43 -0400
Message-ID: <20261019174445.1931263-12-fvdpol@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019174445.1931263-1-fvdpol@gmail.com>
References: <20261019174445.1931263-1-fvdpol@gmail.com>
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

Add a rawmidi device for the control surface.

MIDI OUT is multiplexed into the playback stream, one byte per packet.
A leaky bucket holds the output to about 2500 bytes per second. The
device communicates internally with the control surface at the full
MIDI rate of 3125 bytes per second, but the control surface stops
responding under sustained traffic at that rate.

The device does not accept and handle MIDI Running Status, so
ploytec_midi.c expands it before the bytes are sent.

MIDI IN arrives on its own bulk endpoint, which has been polled since
the transport patch. The completion handler now strips the padding
bytes the firmware inserts and passes the rest to the rawmidi core.

Assisted-by: LLM
Signed-off-by: Frank van de Pol <fvdpol@gmail.com>
---
 sound/usb/jockey3/.kunitconfig   |   1 +
 sound/usb/jockey3/Kconfig        |   1 +
 sound/usb/jockey3/Makefile       |   2 +-
 sound/usb/jockey3/jockey3.c      | 217 ++++++++++++++++++++++++++++++-
 sound/usb/jockey3/ploytec_midi.c |  83 ++++++++++++
 sound/usb/jockey3/ploytec_midi.h |  36 +++++
 6 files changed, 332 insertions(+), 8 deletions(-)
 create mode 100644 sound/usb/jockey3/ploytec_midi.c
 create mode 100644 sound/usb/jockey3/ploytec_midi.h

diff --git a/sound/usb/jockey3/.kunitconfig b/sound/usb/jockey3/.kunitconfig
index a562106b37b8f..a9681c891f096 100644
--- a/sound/usb/jockey3/.kunitconfig
+++ b/sound/usb/jockey3/.kunitconfig
@@ -3,6 +3,7 @@ CONFIG_KUNIT=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_PCM=y
+CONFIG_SND_RAWMIDI=y
 
 CONFIG_USB_SUPPORT=y
 CONFIG_USB=y
diff --git a/sound/usb/jockey3/Kconfig b/sound/usb/jockey3/Kconfig
index b61a11738e9bf..4b40a962417dd 100644
--- a/sound/usb/jockey3/Kconfig
+++ b/sound/usb/jockey3/Kconfig
@@ -2,6 +2,7 @@
 config SND_USB_JOCKEY3
 	tristate "Reloop Jockey 3 support"
 	select SND_PCM
+	select SND_RAWMIDI
 	help
 	  Say Y here to include support for the Reloop Jockey 3 DJ controllers.
 	  These devices utilize a non-standard, proprietary Ploytec USB
diff --git a/sound/usb/jockey3/Makefile b/sound/usb/jockey3/Makefile
index 381f006134930..3f339608f4d23 100644
--- a/sound/usb/jockey3/Makefile
+++ b/sound/usb/jockey3/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_SND_USB_JOCKEY3) += snd-reloop-jockey3.o
-snd-reloop-jockey3-y := jockey3.o ploytec_proto.o ploytec_codec.o
+snd-reloop-jockey3-y := jockey3.o ploytec_proto.o ploytec_codec.o ploytec_midi.o
 
 # The codec functions are not exported, so the KUnit tests are
 # linked into the driver module rather than built as a separate test module.
diff --git a/sound/usb/jockey3/jockey3.c b/sound/usb/jockey3/jockey3.c
index 90458f5d9245e..17c014f2e69d0 100644
--- a/sound/usb/jockey3/jockey3.c
+++ b/sound/usb/jockey3/jockey3.c
@@ -25,10 +25,12 @@
 #include <linux/cleanup.h>
 #include <sound/core.h>
 #include <sound/initval.h>
+#include <sound/rawmidi.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include "ploytec_proto.h"
 #include "ploytec_codec.h"
+#include "ploytec_midi.h"
 
 #define RELOOP_VENDOR_ID         0x200c
 #define RELOOP_JOCKEY3_ME_PID    0x1019
@@ -441,6 +443,7 @@ struct jockey3_pcm_urb_stream {
  * @intf0: interface 0, which the driver is bound to; read-only after probe
  * @intf1: interface 1, claimed explicitly because it owns EP 0x86
  * @pcm: the PCM device; read-only after probe
+ * @rmidi: the rawmidi device; read-only after probe
  * @xfer_buf: bounce buffer for EP0 control transfers, USB_XFER_BUF_SIZE bytes.
  *	Serialized by @rate_mutex once the card is live. The one exception is
  *	jockey3_initialize(), which runs from probe before the card is
@@ -486,9 +489,16 @@ struct jockey3_pcm_urb_stream {
  *	the shared ring for both directions at once. Plain bool, written by
  *	jockey3_start_urbs() and read unlocked by the watchdog via
  *	WRITE_ONCE()/READ_ONCE().
+ * @midi_in_substream: open MIDI IN substream, or NULL; @midi_lock
+ * @midi_out_substream: open MIDI OUT substream, or NULL; @midi_lock
  * @midi_in_urb: the single MIDI IN URB; not anchored, killed directly
  * @midi_in_buf: transfer buffer for @midi_in_urb
  * @midi_lock: protects the MIDI fields; IRQ-safe leaf
+ * @midi_out_acc: accumulator for the MIDI OUT rate limiter; @midi_lock
+ * @midi_rate_divisor: current_rate / PLOYTEC_PLAYBACK_FRAMES; @midi_lock.
+ *	Derived from @current_rate and published here because the rate limiter
+ *	runs in URB completion context and cannot take @rate_mutex.
+ * @midi_state: Running Status expander state; @midi_lock
  * @midi_stopping: see jockey3_pcm_urb_stream.stopping; @midi_lock
  * @midi_consec_errors: consecutive MIDI IN URB errors; @midi_lock
  * @playback: playback streaming state
@@ -500,6 +510,7 @@ struct jockey3_chip {
 	struct usb_interface *intf0;
 	struct usb_interface *intf1;
 	struct snd_pcm *pcm;
+	struct snd_rawmidi *rmidi;
 	unsigned char *xfer_buf;
 	struct mutex rate_mutex;	/* serializes rate changes; outermost lock */
 	unsigned long flags;
@@ -513,9 +524,14 @@ struct jockey3_chip {
 	bool warm_start;	/* set by jockey3_start_urbs(): warm vs cold, for dev_dbg() only */
 
 	/* MIDI Path */
+	struct snd_rawmidi_substream *midi_in_substream;
+	struct snd_rawmidi_substream *midi_out_substream;
 	struct urb *midi_in_urb;
 	unsigned char *midi_in_buf;
 	spinlock_t midi_lock;	/* protects the MIDI fields; IRQ-safe leaf */
+	unsigned int midi_out_acc;
+	unsigned int midi_rate_divisor;
+	struct ploytec_midi_running_status midi_state;
 	bool midi_stopping;
 	unsigned int midi_consec_errors;
 
@@ -580,11 +596,22 @@ static inline bool jockey3_is_resetting(const struct jockey3_chip *chip)
 	return test_bit(JOCKEY3_FLAG_RESETTING, &chip->flags);
 }
 
+/*
+ * Publish a new sample rate.
+ *
+ * chip->current_rate is protected by rate_mutex, but the MIDI OUT rate limiter
+ * runs in URB completion (atomic) context and cannot take it. Rather than have
+ * that path read current_rate unlocked, the value it actually needs is derived
+ * here and published under midi_lock -- which also gets the division off the
+ * per-URB hot path.
+ */
 static void jockey3_set_current_rate(struct jockey3_chip *chip, unsigned int rate)
 {
 	lockdep_assert_held(&chip->rate_mutex);
 
 	chip->current_rate = rate;
+	scoped_guard(spinlock_irqsave, &chip->midi_lock)
+		chip->midi_rate_divisor = rate / PLOYTEC_PLAYBACK_FRAMES;
 }
 
 /*
@@ -1156,6 +1183,58 @@ static void jockey3_capture_callback(struct urb *urb)
 		jockey3_resubmit_failed(chip, ret, "capture");
 }
 
+/**
+ * jockey3_get_next_midi_out_byte() - pick the MIDI byte for one playback packet
+ * @chip: driver state
+ *
+ * Every outgoing playback packet reserves one slot for MIDI. This returns the
+ * byte for it, through a leaky-bucket limiter holding the stream to roughly
+ * 2500 bytes/sec. The hardware carries the full MIDI line rate of 3125
+ * bytes/sec, but sustained traffic at it makes the control surface stop
+ * responding to updates, so the limit sits below that. The idle byte is
+ * returned when there is nothing to send or no budget.
+ *
+ * midi_lock is held across snd_rawmidi_transmit() so
+ * chip->midi_out_substream cannot change under us. The order is safe because
+ * the rawmidi core calls snd_rawmidi_output_trigger() without substream->lock,
+ * and holding a driver lock there is the established idiom (sound/usb/midi.c
+ * does it under ep->buffer_lock).
+ *
+ * Called from the playback URB completion handler, so this runs in atomic
+ * context.
+ *
+ * Return: the byte to place in the packet's MIDI slot.
+ */
+static u8 jockey3_get_next_midi_out_byte(struct jockey3_chip *chip)
+{
+	u8 b;
+
+	guard(spinlock_irqsave)(&chip->midi_lock);
+
+	/*
+	 * Rate limit MIDI to ~2500 bytes/sec -- see the kernel-doc above for why
+	 * this sits below the device's 3125 bytes/sec MIDI line rate.
+	 */
+	chip->midi_out_acc += 2500;
+	if (chip->midi_out_acc < chip->midi_rate_divisor)
+		return PLOYTEC_MIDI_IDLE_BYTE;
+	chip->midi_out_acc -= chip->midi_rate_divisor;
+
+	/* Handle queued byte from Running Status expansion first before consuming from ALSA */
+	if (chip->midi_state.has_queued_byte) {
+		chip->midi_state.has_queued_byte = false;
+		return chip->midi_state.queued_byte;
+	}
+
+	if (!chip->midi_out_substream)
+		return PLOYTEC_MIDI_IDLE_BYTE;
+
+	if (snd_rawmidi_transmit(chip->midi_out_substream, &b, 1) != 1)
+		return PLOYTEC_MIDI_IDLE_BYTE;
+
+	return ploytec_midi_running_status_expand(&chip->midi_state, b, &chip->intf0->dev);
+}
+
 /*
  * Fill the sample area of a playback packet with silence, for when there is
  * no PCM data to send.
@@ -1255,13 +1334,17 @@ static void jockey3_playback_callback(struct urb *urb)
 	}
 
 	/*
-	 * Every packet reserves one slot for a MIDI OUT byte. Nothing feeds it
-	 * yet, so it carries the idle byte.
+	 * The outgoing MIDI data is encapsulated in the playback stream, one
+	 * real (rate-limited) byte per packet: jockey3_get_next_midi_out_byte()'s
+	 * leaky-bucket limiter is calibrated on @midi_rate_divisor, which
+	 * assumes exactly one call per packet interval. Calling it once
+	 * per URB instead of once per packet would silently divide MIDI
+	 * OUT throughput by the chosen N.
 	 */
 	for (sp = 0; sp < submit_pkts; sp++) {
 		u8 *sub = buf + sp * PLOYTEC_PKT_SIZE;
 
-		sub[PLOYTEC_MIDI_OUT_OFFSET] = PLOYTEC_MIDI_IDLE_BYTE;
+		sub[PLOYTEC_MIDI_OUT_OFFSET] = jockey3_get_next_midi_out_byte(chip);
 
 		/* Ploytec Sync byte and gap padding */
 		sub[PLOYTEC_SYNC_BYTE_OFFSET] = PLOYTEC_SYNC_BYTE_VALUE;
@@ -1309,9 +1392,10 @@ static void jockey3_playback_callback(struct urb *urb)
 static void jockey3_midi_in_callback(struct urb *urb)
 {
 	struct jockey3_chip *chip = urb->context;
+	unsigned char *buf = (unsigned char *)urb->transfer_buffer;
 	unsigned int errors;
 	bool stopping;
-	int ret;
+	int i, n = 0, ret;
 
 	switch (jockey3_urb_check(urb)) {
 	case JOCKEY3_URB_STOPPED:
@@ -1335,6 +1419,8 @@ static void jockey3_midi_in_callback(struct urb *urb)
 				"MIDI IN stopped after %u consecutive URB errors\n", errors);
 			return;
 		}
+		/* Transient: resubmit, but there is no usable data in this buffer */
+		urb->actual_length = 0;
 		break;
 	case JOCKEY3_URB_OK:
 		scoped_guard(spinlock_irqsave, &chip->midi_lock)
@@ -1346,11 +1432,29 @@ static void jockey3_midi_in_callback(struct urb *urb)
 		return;
 
 	/*
-	 * Nothing consumes the payload yet, but the endpoint is kept polled: the
-	 * device is only ever run with all three bulk endpoints serviced.
+	 * Compact the payload in place, dropping the padding the device emits
+	 * between real MIDI bytes. The transfer buffer is ours, so this needs no
+	 * lock; doing it up front turns the delivery below into a single locked
+	 * call instead of one per byte.
+	 *
+	 * For different devices (firmware revision) different padding bytes have
+	 * been observed: 0xF9, 0xFB, 0xFD, 0xFF. Since the device is not sending
+	 * any MIDI system or real-time messages, we can safely ignore any byte
+	 * 0xF0..0xFF received from the device.
 	 */
+	for (i = 0; i < urb->actual_length; i++)
+		if (buf[i] < 0xF0)
+			buf[n++] = buf[i];
+
 	ret = 0;
 	scoped_guard(spinlock_irqsave, &chip->midi_lock) {
+		/*
+		 * Deliver under midi_lock so the substream cannot be cleared by
+		 * jockey3_midi_in_close() while we are dereferencing it.
+		 */
+		if (n && !chip->midi_stopping && chip->midi_in_substream)
+			snd_rawmidi_receive(chip->midi_in_substream, buf, n);
+
 		if (!chip->midi_stopping && !jockey3_is_disconnected(chip))
 			ret = usb_submit_urb(urb, GFP_ATOMIC);
 	}
@@ -3101,6 +3205,81 @@ static const struct snd_pcm_ops jockey3_pcm_ops = {
 	.pointer = jockey3_pcm_pointer,
 };
 
+static int jockey3_midi_in_open(struct snd_rawmidi_substream *substream)
+{
+	struct jockey3_chip *chip = substream->rmidi->private_data;
+
+	if (jockey3_is_disconnected(chip))
+		return -ENODEV;
+	return 0;
+}
+
+/*
+ * Normally trigger(0) has already cleared the pointer, but the rawmidi core can
+ * reach close without it (an interrupted drain, or close_substream() with
+ * cleanup suppressed), so drop it here too rather than leave a dangling
+ * reference for the URB callback.
+ */
+static int jockey3_midi_in_close(struct snd_rawmidi_substream *substream)
+{
+	struct jockey3_chip *chip = substream->rmidi->private_data;
+
+	guard(spinlock_irqsave)(&chip->midi_lock);
+	if (chip->midi_in_substream == substream)
+		chip->midi_in_substream = NULL;
+
+	return 0;
+}
+
+static void jockey3_midi_in_trigger(struct snd_rawmidi_substream *substream, int up)
+{
+	struct jockey3_chip *chip = substream->rmidi->private_data;
+
+	guard(spinlock_irqsave)(&chip->midi_lock);
+	chip->midi_in_substream = up ? substream : NULL;
+}
+
+static int jockey3_midi_out_open(struct snd_rawmidi_substream *substream)
+{
+	struct jockey3_chip *chip = substream->rmidi->private_data;
+
+	if (jockey3_is_disconnected(chip))
+		return -ENODEV;
+	return 0;
+}
+
+/* See jockey3_midi_in_close() for why the pointer is cleared here as well. */
+static int jockey3_midi_out_close(struct snd_rawmidi_substream *substream)
+{
+	struct jockey3_chip *chip = substream->rmidi->private_data;
+
+	guard(spinlock_irqsave)(&chip->midi_lock);
+	if (chip->midi_out_substream == substream)
+		chip->midi_out_substream = NULL;
+
+	return 0;
+}
+
+static void jockey3_midi_out_trigger(struct snd_rawmidi_substream *substream, int up)
+{
+	struct jockey3_chip *chip = substream->rmidi->private_data;
+
+	guard(spinlock_irqsave)(&chip->midi_lock);
+	chip->midi_out_substream = up ? substream : NULL;
+}
+
+static const struct snd_rawmidi_ops jockey3_midi_in_ops = {
+	.open = jockey3_midi_in_open,
+	.close = jockey3_midi_in_close,
+	.trigger = jockey3_midi_in_trigger
+};
+
+static const struct snd_rawmidi_ops jockey3_midi_out_ops = {
+	.open = jockey3_midi_out_open,
+	.close = jockey3_midi_out_close,
+	.trigger = jockey3_midi_out_trigger
+};
+
 static int jockey3_initialize(struct jockey3_chip *chip, int model)
 {
 	int ret;
@@ -3241,6 +3420,9 @@ static int jockey3_init_midi_urb(struct jockey3_chip *chip)
 {
 	struct usb_device *dev = chip->dev;
 
+	memset(&chip->midi_state, 0, sizeof(chip->midi_state));
+	chip->midi_out_acc = 0;
+
 	chip->midi_in_buf = kmalloc(PLOYTEC_PKT_SIZE, GFP_KERNEL);
 	if (!chip->midi_in_buf)
 		return -ENOMEM;
@@ -3411,6 +3593,23 @@ static int jockey3_init_pcm(struct jockey3_chip *chip)
 				      jockey3_capture_chmap, 6, 0, NULL);
 }
 
+static int jockey3_init_midi(struct jockey3_chip *chip)
+{
+	int ret = snd_rawmidi_new(chip->card, CARD_NAME " MIDI", 0, 1, 1, &chip->rmidi);
+
+	if (ret < 0)
+		return ret;
+
+	chip->rmidi->private_data = chip;
+	strscpy(chip->rmidi->name, CARD_NAME " MIDI", sizeof(chip->rmidi->name));
+	snd_rawmidi_set_ops(chip->rmidi, SNDRV_RAWMIDI_STREAM_INPUT, &jockey3_midi_in_ops);
+	snd_rawmidi_set_ops(chip->rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT, &jockey3_midi_out_ops);
+	chip->rmidi->info_flags = SNDRV_RAWMIDI_INFO_INPUT |
+				  SNDRV_RAWMIDI_INFO_OUTPUT |
+				  SNDRV_RAWMIDI_INFO_DUPLEX;
+	return 0;
+}
+
 static void jockey3_setup_card_names(struct jockey3_chip *chip, int driver_info)
 {
 	/*
@@ -3555,6 +3754,10 @@ static int jockey3_probe(struct usb_interface *intf, const struct usb_device_id
 	if (ret < 0)
 		goto err_free_card;
 
+	ret = jockey3_init_midi(chip);
+	if (ret < 0)
+		goto err_free_card;
+
 	jockey3_setup_card_names(chip, usb_id->driver_info);
 
 	if (card->id[0] == '\0')
@@ -3814,4 +4017,4 @@ module_exit(jockey3_module_exit);
 MODULE_AUTHOR("Frank van de Pol <fvdpol@gmail.com>");
 MODULE_DESCRIPTION(CARD_NAME " ALSA Driver");
 MODULE_LICENSE("GPL");
-MODULE_SOFTDEP("pre: snd-pcm");
+MODULE_SOFTDEP("pre: snd-pcm snd-rawmidi");
diff --git a/sound/usb/jockey3/ploytec_midi.c b/sound/usb/jockey3/ploytec_midi.c
new file mode 100644
index 0000000000000..3eebc706bb301
--- /dev/null
+++ b/sound/usb/jockey3/ploytec_midi.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *   Generic MIDI 1.0 Running Status expander
+ *
+ *   Copyright (c) 2026 by Frank van de Pol <fvdpol@gmail.com>
+ */
+
+/*
+ * The logic here is generic MIDI 1.0 Running Status handling: it operates
+ * purely on a byte stream, with no dependency on USB or on the rest of this
+ * driver. It carries the ploytec_ prefix and lives in the Ploytec layer
+ * because that firmware is what requires it -- the device does not accept a
+ * Running Status stream and needs every message fully status-prefixed.
+ *
+ * Should a second driver ever need the same behavior, this would be a
+ * reasonable candidate to migrate into a shared kernel library rather than
+ * duplicating it.
+ */
+
+#include "ploytec_midi.h"
+
+/**
+ * ploytec_midi_running_status_expand() - Expand MIDI 1.0 Running Status
+ * @state: expander state, zero-initialized by the caller before first use
+ * @b: the next raw MIDI byte from the source stream, in stream order
+ * @dev: struct device for diagnostic logging (currently unused)
+ *
+ * MIDI 1.0 allows the status byte of a Channel Voice Message to be omitted
+ * when it repeats the previous message's status ("Running Status"). Some
+ * MIDI receivers don't implement Running Status and require every message
+ * to carry its status byte explicitly; this function expands a Running
+ * Status stream back into fully status-prefixed messages.
+ *
+ * Call this once per raw input byte. Most calls simply return @b unchanged.
+ * When a data byte arrives while Running Status is active, the synthesised
+ * status byte is returned immediately for the caller to send first, and @b
+ * itself is queued in @state->queued_byte (with @state->has_queued_byte set)
+ * for the caller to retrieve and send on the next output opportunity, ahead
+ * of consuming any further input.
+ *
+ * Return: the next byte to send to the receiver.
+ */
+u8 ploytec_midi_running_status_expand(struct ploytec_midi_running_status *state,
+				      u8 b, struct device *dev)
+{
+	u8 byte;
+
+	if (b >= 0x80) { // Status byte
+		if (b < 0xf0) { // Channel Voice Message (0x80-0xEF)
+			state->running_status = b;
+			/* Determine expected data bytes based on MIDI opcode */
+			if ((b & 0xf0) == 0xc0 || (b & 0xf0) == 0xd0)
+				state->expected_data = 1; // PC, Channel Pressure
+			else
+				state->expected_data = 2; // Note On/Off, CC, etc.
+		} else if (b < 0xf8) { // System Common Message (0xf0-0xf7)
+			/* System Common messages clear Running Status */
+			state->running_status = 0;
+			state->expected_data = 0;
+		} else { // System Real-Time Message (0xf8-0xff), do not affect Running Status
+			return b;
+		}
+
+		state->data_count = state->expected_data; // initialize expected data byte count
+		return b;
+	}
+
+	/* Data byte */
+	if (state->data_count > 0) {
+		state->data_count--;
+		return b;
+	} else if (state->running_status >= 0x80) {
+		/* Message is complete but we got a data byte -> expand Running Status */
+		byte = state->running_status;
+		state->queued_byte = b;
+		state->has_queued_byte = true;
+		state->data_count = state->expected_data - 1; // already 1 byte queued
+		return byte;
+	}
+
+	/* No running status expansion active, just send the data byte */
+	return b;
+}
diff --git a/sound/usb/jockey3/ploytec_midi.h b/sound/usb/jockey3/ploytec_midi.h
new file mode 100644
index 0000000000000..079bce519e9d9
--- /dev/null
+++ b/sound/usb/jockey3/ploytec_midi.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *   Generic MIDI 1.0 Running Status expander
+ *
+ *   Copyright (c) 2026 by Frank van de Pol <fvdpol@gmail.com>
+ */
+
+#ifndef __SOUND_USB_JOCKEY3_PLOYTEC_MIDI_H
+#define __SOUND_USB_JOCKEY3_PLOYTEC_MIDI_H
+
+#include <linux/types.h>
+
+struct device;
+
+/**
+ * struct ploytec_midi_running_status - MIDI 1.0 Running Status expander state
+ * @expected_data: number of data bytes expected for the current @running_status message
+ * @data_count: number of data bytes still to be consumed for the in-progress message
+ * @running_status: the currently active Running Status (Channel Voice) opcode, or 0 if none
+ * @queued_byte: data byte held back when a Running Status byte had to be synthesised
+ * @has_queued_byte: true when @queued_byte holds a byte still to be delivered
+ *
+ * Zero-initialize before first use.
+ */
+struct ploytec_midi_running_status {
+	int expected_data;
+	int data_count;
+	u8 running_status;
+	u8 queued_byte;
+	bool has_queued_byte;
+};
+
+u8 ploytec_midi_running_status_expand(struct ploytec_midi_running_status *state,
+				      u8 b, struct device *dev);
+
+#endif /* __SOUND_USB_JOCKEY3_PLOYTEC_MIDI_H */
-- 
2.47.3

