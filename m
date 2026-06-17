Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AD1340402
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 20:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781728809; cv=none; b=XecqsRbRqE7CLRmmC61pIe5STyhzhBCcoJJzHqKgz0lAcHiXg6v2VbGZwjhq4dT5U+L8QAUF6CQXvZ0h77HgLPc4lTQzASyxFq8YzOX9Ki1QwN66Aqz6SmxqSML6ZdA83Kir6tIPP9r/6kKdR8flMU9fQKHHzoF4yB0BZhaxj80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781728809; c=relaxed/simple;
	bh=8UthGvRTE+cPrsgpIGXKIjTXYGjPUoWjsmUtjaWGpxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t7pO2K1ypQxwyyb4uVnT8gTR+Kbm6GHn7A+BtxhK+0ChC2httbkXuRnvKD/pKtGCYazmPGH2lWAE42xrgtPrDglvvTqJ2hIH1XKkmjUZeMROw4HQE7xH8xBGkqtg+xx9tKlXJJ9HMsqsPjr1e4XaY1HDxCumKG3YD7rRZ0l3sZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pVD7vyt+; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pVD7vyt+"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7fedf0e99bbso3451227b3.3
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 13:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781728804; x=1782333604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02HZRGWatHHvQnmglkWeESllFooF75WVY+SLZNbQRrQ=;
        b=pVD7vyt+3xr3Zm1Jju+CB8q6x5OlUGI94C2XYpiWvP0ZpQgWc1m4dA/BkyctjfVr8I
         BBxd6I7NgvD3+b+dcj+ChQ1DkkV7FiSoI01/nvoXO7QECPZdwQ4rt3nG+iEeTRe90rOY
         a0q8Vup0O4CBXWed0b4xJGGa49tUU5bej3wz5Fkm03jg/m8FNjjqp3hJEnRdQvr2RKky
         L4mL01CSAbF7CJHlcLJP0J+i4q55GHe6G4MZrZft95PLU5eubgr8cT8DCjddX3Ex68HR
         aJVbXHxMreyfr9Gz/yuHagaDgoOrVakC4zMeT3dQ1sAWuMeNuNGGk8+gj8Q8sinInCb8
         JErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781728804; x=1782333604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=02HZRGWatHHvQnmglkWeESllFooF75WVY+SLZNbQRrQ=;
        b=CO3p7yaql/bRYhoyjlsM0+9aT1cY6CAIPkEXA3r6w/Mpp++7qmasDXzje2kinApBoY
         6bZV1svYClgiK1G89ZO1ekO6gIj1vpW9BXB4gKNXH0zo2N4gptXQCRXNBd1MA9E1qMHm
         wtqVAOFjAh2B1X841JAtu9TrQloyTbQEbvEffrNOWf51XzRVziiPMNXATRT7zKpKpyM2
         /rcL4fZ8V76sGUrvpfolhs67Omb2T0puDKi6BmMxK0EK6HfztEJ5BlTkSL0+6epGGc4q
         98Mp3M7QJkDji2+QEv3Hc9Azh5ILnzFe5fkiBiQSXpjBlvbbRAJJwfzv5uI8ItylEh2N
         jh+g==
X-Forwarded-Encrypted: i=1; AFNElJ8JCj6OAoIgtPf3sJba9qkFw7plfIHqhRz7pzjkK68L+hHYljW7cUBkfsqMBN4jlnZxUyhF4xP9DpTFQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbNGbfPlTpMcHkukCzvwjwMQHBEAY4y2R7uOdLX8OBALWklUbD
	iSqvQ9SdUeJI8NfJyaPRd/jWj20AN84XKCkbyQT5ZSyADuhCJAbvNRJs
X-Gm-Gg: AfdE7cnpXZGSv+glfpM6N5YLpoO9GpSmDfzJLSi9oISH+EIJvxBGrm6b1uxzLLacDRI
	+ZO1BssTcemkrTd0J4YWw5KhtuSDKwl0MIYFkdwXr7uLlLw0ZPsEf5qnT2hodcF1aPz2IhWT0u5
	ST31MWM67NNH/4ZGBDSRJeI9j4cln6MXIy9vc+Pvr5qHQ6OBM/dtQJy7Vh1kpHhc6+3LNt5g2x8
	5Yxcq3SH1lQNItS0mLCGCKaZiiAPddUrXX7fXkyX15FE4LfHdBPE9EbSrWH3K6lEHHQyd8nn0oI
	PnDjxhaRBBiTsxlnJxkwwaQT7FU41BF++dw1c1BkGxCq7t2/FK2ty0u9KUSlLTMKxmOxmjCWS0o
	Y0zN+CFWmasEclMrHRMXf6FR43YgNPGdxOo3WaMlbqe6s4a4UhgNBAWHdZpY3X+SFUdOrlDeo+U
	Hg3bq24WZuna9VbCC69QaRPKk2V2LvVZiOZxbKBxELyg60k0MtgmoYj4WrTSDKv7/5tea9aqtTR
	ArtzpPLE0D524uchEhu67On5Ng=
X-Received: by 2002:a05:690c:710a:b0:7d1:eb6c:99bc with SMTP id 00721157ae682-7fe5b0ec6c2mr57073537b3.11.1781728803885;
        Wed, 17 Jun 2026 13:40:03 -0700 (PDT)
Received: from alsa-dev.int.suenodeluz.com.do ([74.244.193.74])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7fcd00da747sm55671227b3.7.2026.06.17.13.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 13:40:03 -0700 (PDT)
From: Frank van de Pol <fvdpol@gmail.com>
To: tiwai@suse.de,
	perex@perex.cz
Cc: fvdpol@gmail.com,
	ramiserifpersia@gmail.com,
	rmxpzlb@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] ALSA: usb: Add support for Reloop Jockey 3 DJ controllers
Date: Wed, 17 Jun 2026 16:39:37 -0400
Message-ID: <20260617203937.1273852-2-fvdpol@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260617203937.1273852-1-fvdpol@gmail.com>
References: <20260617203937.1273852-1-fvdpol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a dedicated repository subdirectory and driver for the Reloop
Jockey 3 Master Edition and Reloop Jockey 3 Remix USB DJ controllers.

Because these devices utilize a non-standard, proprietary Ploytec USB
framing protocol instead of standard USB Audio Class (UAC) mechanisms,
they require specialized handling outside of standard quirks.

This driver provides:
 - 24-bit multi-channel (6x4) audio capture and playback.
 - Support for 44.1, 48, 88.2, and 96 kHz sample rates.
 - ALSA RawMIDI input and output mapping for the integrated control surface.

The custom Ploytec encapsulation and streaming format was successfully
reverse-engineered via USB protocol analysis and is isolated cleanly into
a local hardware-independent codec abstraction.

Signed-off-by: Frank van de Pol <fvdpol@gmail.com>

Updates based on the feedback from code review

address issues from code review, further optimization
---
 MAINTAINERS                       |    7 +
 sound/usb/Kconfig                 |    1 +
 sound/usb/Makefile                |    1 +
 sound/usb/jockey3/Kconfig         |   19 +
 sound/usb/jockey3/Makefile        |    3 +
 sound/usb/jockey3/jockey3.c       | 1025 +++++++++++++++++++++++++++++
 sound/usb/jockey3/ploytec_proto.c |  240 +++++++
 sound/usb/jockey3/ploytec_proto.h |   53 ++
 8 files changed, 1349 insertions(+)
 create mode 100644 sound/usb/jockey3/Kconfig
 create mode 100644 sound/usb/jockey3/Makefile
 create mode 100644 sound/usb/jockey3/jockey3.c
 create mode 100644 sound/usb/jockey3/ploytec_proto.c
 create mode 100644 sound/usb/jockey3/ploytec_proto.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 42feedf526c3..531fa0bf23f6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22539,6 +22539,13 @@ F:	Documentation/filesystems/relay.rst
 F:	include/linux/relay.h
 F:	kernel/relay.c
 
+RELOOP JOCKEY 3 DJ CONTROLLER DRIVER
+M:	Frank van de Pol <fvdpol@gmail.com>
+L:	linux-sound@vger.kernel.org
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
+F:	sound/usb/jockey3/
+
 REGISTER MAP ABSTRACTION
 M:	Mark Brown <broonie@kernel.org>
 L:	linux-kernel@vger.kernel.org
diff --git a/sound/usb/Kconfig b/sound/usb/Kconfig
index b4588915efa1..d7edfbaf099b 100644
--- a/sound/usb/Kconfig
+++ b/sound/usb/Kconfig
@@ -205,6 +205,7 @@ config SND_USB_AUDIO_QMI
 	  will be called snd-usb-audio-qmi.
 
 source "sound/usb/line6/Kconfig"
+source "sound/usb/jockey3/Kconfig"
 
 endif	# SND_USB
 
diff --git a/sound/usb/Makefile b/sound/usb/Makefile
index e62794a87e73..1f045c00dbc9 100644
--- a/sound/usb/Makefile
+++ b/sound/usb/Makefile
@@ -37,3 +37,4 @@ obj-$(CONFIG_SND_USB_US122L) += snd-usbmidi-lib.o
 
 obj-$(CONFIG_SND) += misc/ usx2y/ caiaq/ 6fire/ hiface/ bcd2000/ qcom/
 obj-$(CONFIG_SND_USB_LINE6)	+= line6/
+obj-$(CONFIG_SND_USB_JOCKEY3) += jockey3/
diff --git a/sound/usb/jockey3/Kconfig b/sound/usb/jockey3/Kconfig
new file mode 100644
index 000000000000..a1ac80f04450
--- /dev/null
+++ b/sound/usb/jockey3/Kconfig
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config SND_USB_JOCKEY3
+	tristate "Reloop Jockey 3 support"
+	default m
+	depends on SND_USB && USB
+	select SND_PCM
+	select SND_RAWMIDI
+	help
+	  Say Y here to include support for the Reloop Jockey 3 DJ controllers.
+          These devices utilize a non-standard, proprietary Ploytec USB
+          protocol.
+
+	  Supported devices:
+
+            * Reloop Jockey 3 Master Edition
+            * Reloop Jockey 3 Remix
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called snd-reloop-jockey3.
diff --git a/sound/usb/jockey3/Makefile b/sound/usb/jockey3/Makefile
new file mode 100644
index 000000000000..85f9c6dcba14
--- /dev/null
+++ b/sound/usb/jockey3/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_SND_USB_JOCKEY3) += snd-reloop-jockey3.o
+snd-reloop-jockey3-objs := jockey3.o ploytec_proto.o
diff --git a/sound/usb/jockey3/jockey3.c b/sound/usb/jockey3/jockey3.c
new file mode 100644
index 000000000000..6ae763c20480
--- /dev/null
+++ b/sound/usb/jockey3/jockey3.c
@@ -0,0 +1,1025 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *   ALSA driver for Reloop Jockey 3 devices
+ *
+ *   Copyright (c) 2026 by Frank van de Pol <fvdpol@gmail.com>
+ */
+
+#include <linux/module.h>
+#include <linux/usb.h>
+#include <linux/slab.h>
+#include <linux/delay.h>
+#include <linux/bitops.h>
+#include <sound/core.h>
+#include <sound/initval.h>
+#include <sound/rawmidi.h>
+#include <sound/pcm.h>
+#include <linux/mutex.h>
+#include <linux/cleanup.h>
+#include "ploytec_proto.h"
+
+#define RELOOP_VENDOR_ID         0x200c
+#define RELOOP_JOCKEY3_ME_PID    0x1009
+#define RELOOP_JOCKEY3_REMIX_PID 0x1037
+
+enum { JOCKEY3_ME, JOCKEY3_REMIX };
+
+#define JOCKEY3_N_URBS 8
+
+/* Chip flags */
+#define JOCKEY3_FLAG_DISCONNECTED 0
+
+static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
+static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR;
+static bool enable[SNDRV_CARDS] = SNDRV_DEFAULT_ENABLE_PNP;
+
+#define CARD_NAME "Reloop Jockey 3"
+
+module_param_array(index, int, NULL, 0444);
+MODULE_PARM_DESC(index, "Index value for " CARD_NAME " soundcard.");
+module_param_array(id, charp, NULL, 0444);
+MODULE_PARM_DESC(id, "ID string for " CARD_NAME " soundcard.");
+module_param_array(enable, bool, NULL, 0444);
+MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
+
+struct jockey3_chip {
+	/* Core ALSA and USB handles (Mostly read-only after probe) */
+	struct snd_card *card;
+	struct usb_device *dev;
+	struct usb_interface *intf0;
+	struct usb_interface *intf1;
+	struct snd_pcm *pcm;
+	struct snd_rawmidi *rmidi;
+	unsigned char *xfer_buf;
+	struct mutex rate_mutex; // serializes sample rate changes and active stream tracking
+	unsigned long flags;
+	unsigned int current_rate;
+	int active_streams;
+
+	/* MIDI Path */
+	struct snd_rawmidi_substream *midi_in_substream;
+	struct snd_rawmidi_substream *midi_out_substream;
+	struct urb *midi_in_urb;
+	unsigned char *midi_in_buf;
+	spinlock_t midi_lock; // protects MIDI substreams in completion handlers and rate-limiting
+	unsigned int midi_out_acc;
+	int midi_expected_data;
+	u8 midi_last_status;
+	u8 midi_queued_byte;
+	bool midi_has_queued_byte;
+
+	/* Playback Path */
+	struct snd_pcm_substream *playback_substream;
+	struct usb_anchor playback_anchor;
+	struct urb *playback_urbs[JOCKEY3_N_URBS];
+	unsigned char *playback_bufs[JOCKEY3_N_URBS];
+	spinlock_t playback_lock; // protects playback stream state and buffer offsets
+	unsigned int dma_off;
+	unsigned int period_off;
+	bool stream_running;
+
+	/* Capture Path */
+	struct snd_pcm_substream *capture_substream;
+	struct usb_anchor capture_anchor;
+	struct urb *capture_urbs[JOCKEY3_N_URBS];
+	unsigned char *capture_bufs[JOCKEY3_N_URBS];
+	spinlock_t capture_lock; // protects capture stream state and buffer offsets
+	unsigned int capture_dma_off;
+	unsigned int capture_period_off;
+	bool capture_running;
+};
+
+static bool jockey3_process_out_packet(struct jockey3_chip *chip, u8 *urb_buf)
+{
+	struct snd_pcm_substream *substream = chip->playback_substream;
+	struct snd_pcm_runtime *runtime;
+	unsigned int pcm_buffer_size;
+	unsigned int alsa_frame_size;
+	int f;
+
+	if (unlikely(!substream || !substream->runtime))
+		return false;
+
+	runtime = substream->runtime;
+	if (unlikely(!runtime->dma_area))
+		return false;
+
+	pcm_buffer_size = snd_pcm_lib_buffer_bytes(substream);
+	alsa_frame_size = runtime->channels * 3;
+
+	for (f = 0; f < PLOYTEC_PLAYBACK_FRAMES; f++) {
+		ploytec_encode_s24_3le(urb_buf + f * PLOYTEC_PLAYBACK_FRAME_SIZE,
+				       runtime->dma_area + chip->dma_off);
+		chip->dma_off += alsa_frame_size;
+		if (chip->dma_off >= pcm_buffer_size)
+			chip->dma_off -= pcm_buffer_size;
+		chip->period_off += alsa_frame_size;
+	}
+
+	if (chip->period_off >= runtime->period_size * alsa_frame_size) {
+		chip->period_off %= runtime->period_size * alsa_frame_size;
+		return true;
+	}
+
+	return false;
+}
+
+static bool jockey3_process_in_packet(struct jockey3_chip *chip, const u8 *urb_buf)
+{
+	struct snd_pcm_substream *substream = chip->capture_substream;
+	struct snd_pcm_runtime *runtime;
+	unsigned int pcm_buffer_size;
+	unsigned int alsa_frame_size;
+	int f;
+
+	if (unlikely(!substream || !substream->runtime))
+		return false;
+
+	runtime = substream->runtime;
+	if (unlikely(!runtime->dma_area))
+		return false;
+
+	pcm_buffer_size = snd_pcm_lib_buffer_bytes(substream);
+	alsa_frame_size = runtime->channels * 3; // 6 * 3 = 18 bytes
+
+	for (f = 0; f < PLOYTEC_CAPTURE_FRAMES; f++) {
+		ploytec_decode_s24_3le(runtime->dma_area + chip->capture_dma_off,
+				       urb_buf + f * PLOYTEC_CAPTURE_FRAME_SIZE);
+		chip->capture_dma_off += alsa_frame_size;
+		if (chip->capture_dma_off >= pcm_buffer_size)
+			chip->capture_dma_off -= pcm_buffer_size;
+		chip->capture_period_off += alsa_frame_size;
+	}
+
+	if (chip->capture_period_off >= runtime->period_size * alsa_frame_size) {
+		chip->capture_period_off %= runtime->period_size * alsa_frame_size;
+		return true;
+	}
+
+	return false;
+}
+
+static void jockey3_capture_callback(struct urb *urb)
+{
+	struct jockey3_chip *chip = urb->context;
+	struct snd_pcm_substream *substream = NULL;
+	bool period_elapsed = false;
+	int ret;
+
+	if (urb->status) {
+		if (urb->status == -ENOENT || urb->status == -ECONNRESET ||
+		    urb->status == -ESHUTDOWN)
+			return;
+
+		/* Fatal error: stop resubmitting to prevent interrupt storm */
+		dev_err(&chip->intf0->dev, "Capture URB fatal error: %d\n",
+			urb->status);
+		set_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags);
+		return;
+	}
+
+	if (unlikely(test_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags)))
+		return;
+
+	scoped_guard(spinlock_irqsave, &chip->capture_lock) {
+		if (chip->capture_running && chip->capture_substream) {
+			period_elapsed = jockey3_process_in_packet(chip, urb->transfer_buffer);
+			substream = chip->capture_substream;
+		}
+	}
+
+	if (period_elapsed && substream)
+		snd_pcm_period_elapsed(substream);
+
+	usb_anchor_urb(urb, &chip->capture_anchor);
+	ret = usb_submit_urb(urb, GFP_ATOMIC);
+	if (ret < 0) {
+		usb_unanchor_urb(urb);
+		if (ret != -ENODEV && ret != -EPERM)
+			dev_err(&chip->intf0->dev, "Failed to resubmit capture URB: %d\n", ret);
+	}
+}
+
+static u8 jockey3_get_next_midi_out_byte(struct jockey3_chip *chip)
+{
+	struct snd_rawmidi_substream *substream = chip->midi_out_substream;
+	u8 byte = PLOYTEC_MIDI_IDLE_BYTE;
+	u8 b;
+
+	/*
+	 * Rate limit MIDI to ~3125 bytes/sec. Sending at higher rates causes buffer
+	 * overflows and message truncation in the device.
+	 */
+	chip->midi_out_acc += 3125;
+	if (chip->midi_out_acc < (chip->current_rate / 10))
+		return PLOYTEC_MIDI_IDLE_BYTE;
+
+	chip->midi_out_acc -= (chip->current_rate / 10);
+
+	if (chip->midi_has_queued_byte) {
+		byte = chip->midi_queued_byte;
+		chip->midi_has_queued_byte = false;
+		dev_dbg(&chip->intf0->dev, "MIDI OUT: 0x%02x\n", byte);
+		return byte;
+	}
+
+	if (!substream)
+		return PLOYTEC_MIDI_IDLE_BYTE;
+
+	if (snd_rawmidi_transmit(substream, &b, 1) != 1)
+		return PLOYTEC_MIDI_IDLE_BYTE;
+
+	/*
+	 * Running Status Expansion:
+	 * The Ploytec firmware's internal MIDI parser does not
+	 * support Running Status (omitting the status byte when
+	 * it hasn't changed). It expects every message to be
+	 * complete (e.g., [Status, Data, Data]).
+	 * Here we track the message state and re-inject the last
+	 * status byte if a data byte is received when a message
+	 * was already complete.
+	 */
+	if (b >= 0x80) { // Status byte
+		if (b < 0xf8) { // Not a real-time message
+			chip->midi_last_status = b;
+			/* Determine expected data bytes based on MIDI opcode */
+			if ((b & 0xf0) == 0xc0 || (b & 0xf0) == 0xd0)
+				chip->midi_expected_data = 1; // PC, Channel Pressure
+			else if (b < 0xf0)
+				chip->midi_expected_data = 2; // Note On/Off, CC, etc.
+			else
+				chip->midi_expected_data = 0; // System messages
+		}
+		byte = b;
+		dev_dbg(&chip->intf0->dev, "MIDI OUT: 0x%02x\n", byte);
+	} else { // Data byte
+		if (chip->midi_expected_data > 0) {
+			byte = b;
+			chip->midi_expected_data--;
+			dev_dbg(&chip->intf0->dev, "MIDI OUT: 0x%02x\n", byte);
+		} else if (chip->midi_last_status >= 0x80) {
+			/* Message is complete but we got a data byte -> expand Running Status */
+			byte = chip->midi_last_status;
+			chip->midi_queued_byte = b;
+			chip->midi_has_queued_byte = true;
+
+			/* Set expectation for the remainder of the expanded message */
+			if ((byte & 0xf0) == 0xc0 || (byte & 0xf0) == 0xd0)
+				chip->midi_expected_data = 0; // 1 total, 1 already queued
+			else
+				chip->midi_expected_data = 1; // 2 total, 1 already queued
+
+			dev_dbg(&chip->intf0->dev, "MIDI OUT: 0x%02x (Running Status)\n", byte);
+		}
+	}
+
+	return byte;
+}
+
+static void jockey3_playback_callback(struct urb *urb)
+{
+	struct jockey3_chip *chip = urb->context;
+	unsigned char *buf = (unsigned char *)urb->transfer_buffer;
+	struct snd_pcm_substream *substream = NULL;
+	bool period_elapsed = false;
+	int i, ret;
+
+	if (urb->status) {
+		if (urb->status == -ENOENT || urb->status == -ECONNRESET ||
+		    urb->status == -ESHUTDOWN)
+			return;
+
+		/* Fatal error: stop resubmitting to prevent interrupt storm */
+		dev_err(&chip->intf0->dev, "Playback URB fatal error: %d\n", urb->status);
+		set_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags);
+		return;
+	}
+
+	if (unlikely(test_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags)))
+		return;
+
+	scoped_guard(spinlock_irqsave, &chip->playback_lock) {
+		if (chip->stream_running && chip->playback_substream) {
+			period_elapsed = jockey3_process_out_packet(chip, buf);
+			substream = chip->playback_substream;
+		} else {
+			ploytec_prepare_out_packet(buf);
+		}
+	}
+
+	if (period_elapsed && substream)
+		snd_pcm_period_elapsed(substream);
+
+	scoped_guard(spinlock_irqsave, &chip->midi_lock) {
+		buf[PLOYTEC_MIDI_OUT_OFFSET] = jockey3_get_next_midi_out_byte(chip);
+	}
+
+	/* Ploytec Sync byte and gap padding */
+	buf[PLOYTEC_SYNC_BYTE_OFFSET] = PLOYTEC_SYNC_BYTE_VALUE;
+	for (i = PLOYTEC_SYNC_BYTE_OFFSET + 1; i < PLOYTEC_PKT_SIZE; i++)
+		buf[i] = 0x00;
+
+	usb_anchor_urb(urb, &chip->playback_anchor);
+	ret = usb_submit_urb(urb, GFP_ATOMIC);
+	if (ret < 0) {
+		usb_unanchor_urb(urb);
+		if (ret != -ENODEV && ret != -EPERM)
+			dev_err(&chip->intf0->dev, "Failed to resubmit playback URB: %d\n", ret);
+	}
+}
+
+static void jockey3_midi_in_callback(struct urb *urb)
+{
+	struct jockey3_chip *chip = urb->context;
+	unsigned char *buf = (unsigned char *)urb->transfer_buffer;
+	int i, ret;
+
+	if (urb->status) {
+		if (urb->status == -ENOENT || urb->status == -ECONNRESET ||
+		    urb->status == -ESHUTDOWN)
+			return;
+
+		/* Fatal error: stop resubmitting to prevent interrupt storm */
+		dev_err(&chip->intf0->dev, "MIDI IN URB fatal error: %d\n", urb->status);
+		set_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags);
+		return;
+	}
+
+	if (unlikely(test_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags)))
+		return;
+
+	scoped_guard(spinlock_irqsave, &chip->midi_lock) {
+		if (chip->midi_in_substream) {
+			for (i = 0; i < urb->actual_length; i++) {
+				if (buf[i] != PLOYTEC_MIDI_IDLE_BYTE && buf[i] != 0xF9) {
+					dev_dbg(&chip->intf0->dev, "MIDI IN: 0x%02x\n",
+						buf[i]);
+					snd_rawmidi_receive(chip->midi_in_substream,
+							    &buf[i], 1);
+				}
+			}
+		}
+	}
+
+	ret = usb_submit_urb(urb, GFP_ATOMIC);
+	if (ret < 0 && ret != -ENODEV && ret != -EPERM)
+		dev_err(&chip->intf0->dev, "Failed to resubmit MIDI IN URB: %d\n", ret);
+}
+
+static void jockey3_stop_urbs(struct jockey3_chip *chip)
+{
+	dev_dbg(&chip->intf0->dev, "Stopping all URBs\n");
+	usb_kill_urb(chip->midi_in_urb);
+	usb_kill_anchored_urbs(&chip->playback_anchor);
+	usb_kill_anchored_urbs(&chip->capture_anchor);
+}
+
+static void jockey3_start_urbs(struct jockey3_chip *chip)
+{
+	int i, ret;
+
+	if (test_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags))
+		return;
+
+	dev_dbg(&chip->intf0->dev, "Starting all URBs\n");
+	for (i = 0; i < JOCKEY3_N_URBS; i++) {
+		usb_anchor_urb(chip->playback_urbs[i], &chip->playback_anchor);
+		ret = usb_submit_urb(chip->playback_urbs[i], GFP_KERNEL);
+		if (ret < 0) {
+			usb_unanchor_urb(chip->playback_urbs[i]);
+			dev_err(&chip->intf0->dev, "Failed to submit playback URB %d: %d\n",
+				i, ret);
+		}
+
+		usb_anchor_urb(chip->capture_urbs[i], &chip->capture_anchor);
+		ret = usb_submit_urb(chip->capture_urbs[i], GFP_KERNEL);
+		if (ret < 0) {
+			usb_unanchor_urb(chip->capture_urbs[i]);
+			dev_err(&chip->intf0->dev, "Failed to submit capture URB %d: %d\n",
+				i, ret);
+		}
+	}
+	ret = usb_submit_urb(chip->midi_in_urb, GFP_KERNEL);
+	if (ret < 0)
+		dev_err(&chip->intf0->dev, "Failed to submit MIDI IN URB: %d\n", ret);
+}
+
+static int jockey3_set_rate(struct jockey3_chip *chip, unsigned int rate)
+{
+	int ret;
+
+	if (test_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags))
+		return -ENODEV;
+
+	dev_dbg(&chip->intf0->dev, "Setting rate to %u Hz\n", rate);
+	ret = ploytec_set_rate(chip->dev, chip->xfer_buf, rate);
+	if (ret < 0) {
+		dev_err(&chip->intf0->dev, "Failed to set rate: %d\n", ret);
+		return ret;
+	}
+	dev_dbg(&chip->intf0->dev, "Rate set OK\n");
+	return 0;
+}
+
+static int jockey3_pcm_open(struct snd_pcm_substream *substream)
+{
+	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	int ret;
+
+	dev_dbg(&chip->intf0->dev, "PCM open stream %d\n", substream->stream);
+
+	if (test_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags))
+		return -ENODEV;
+
+	runtime->hw.info =
+		SNDRV_PCM_INFO_MMAP |
+		SNDRV_PCM_INFO_INTERLEAVED |
+		SNDRV_PCM_INFO_BLOCK_TRANSFER |
+		SNDRV_PCM_INFO_MMAP_VALID;
+	runtime->hw.formats = SNDRV_PCM_FMTBIT_S24_3LE;
+	runtime->hw.rates =
+		SNDRV_PCM_RATE_44100 |
+		SNDRV_PCM_RATE_48000 |
+		SNDRV_PCM_RATE_88200 |
+		SNDRV_PCM_RATE_96000;
+	runtime->hw.rate_min = 44100;
+	runtime->hw.rate_max = 96000;
+	runtime->hw.buffer_bytes_max = 1024 * 1024;
+	runtime->hw.period_bytes_min = 64;
+	runtime->hw.period_bytes_max = 512 * 1024;
+	runtime->hw.periods_min = 2;
+	runtime->hw.periods_max = 1024;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		runtime->hw.channels_min = 4;
+		runtime->hw.channels_max = 4;
+		chip->playback_substream = substream;
+	} else {
+		runtime->hw.channels_min = 6;
+		runtime->hw.channels_max = 6;
+		chip->capture_substream = substream;
+	}
+
+	scoped_guard(mutex, &chip->rate_mutex) {
+		if (chip->active_streams > 0) {
+			/* Force the new stream to match the existing hardware rate */
+			ret = snd_pcm_hw_constraint_single(runtime,
+							   SNDRV_PCM_HW_PARAM_RATE,
+							   chip->current_rate);
+			if (ret < 0)
+				return ret;
+		}
+		chip->active_streams++;
+		dev_dbg(&chip->intf0->dev, "active_streams incremented to %d\n",
+			chip->active_streams);
+	}
+
+	return 0;
+}
+
+static int jockey3_pcm_close(struct snd_pcm_substream *substream)
+{
+	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
+
+	dev_dbg(&chip->intf0->dev, "PCM close stream %d\n", substream->stream);
+
+	guard(mutex)(&chip->rate_mutex);
+	chip->active_streams--;
+	dev_dbg(&chip->intf0->dev, "active_streams decremented to %d\n", chip->active_streams);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		guard(spinlock_irqsave)(&chip->playback_lock);
+		chip->playback_substream = NULL;
+		chip->stream_running = false;
+	} else {
+		guard(spinlock_irqsave)(&chip->capture_lock);
+		chip->capture_substream = NULL;
+		chip->capture_running = false;
+	}
+	return 0;
+}
+
+static int jockey3_pcm_prepare(struct snd_pcm_substream *substream)
+{
+	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
+
+	dev_dbg(&chip->intf0->dev, "PCM prepare stream %d\n", substream->stream);
+
+	if (test_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags))
+		return -ENODEV;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		guard(spinlock_irqsave)(&chip->playback_lock);
+		chip->dma_off = 0;
+		chip->period_off = 0;
+	} else {
+		guard(spinlock_irqsave)(&chip->capture_lock);
+		chip->capture_dma_off = 0;
+		chip->capture_period_off = 0;
+	}
+	return 0;
+}
+
+static int jockey3_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
+{
+	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
+
+	dev_dbg(&chip->intf0->dev, "PCM trigger stream %d, cmd %d\n", substream->stream, cmd);
+
+	if (test_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags))
+		return -ENODEV;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		guard(spinlock_irqsave)(&chip->playback_lock);
+		if (cmd == SNDRV_PCM_TRIGGER_START)
+			chip->stream_running = true;
+		else if (cmd == SNDRV_PCM_TRIGGER_STOP)
+			chip->stream_running = false;
+	} else {
+		guard(spinlock_irqsave)(&chip->capture_lock);
+		if (cmd == SNDRV_PCM_TRIGGER_START)
+			chip->capture_running = true;
+		else if (cmd == SNDRV_PCM_TRIGGER_STOP)
+			chip->capture_running = false;
+	}
+
+	return 0;
+}
+
+static snd_pcm_uframes_t jockey3_pcm_pointer(struct snd_pcm_substream *substream)
+{
+	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
+	unsigned int dma_off;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		scoped_guard(spinlock_irqsave, &chip->playback_lock) {
+			dma_off = chip->dma_off;
+		}
+	} else {
+		scoped_guard(spinlock_irqsave, &chip->capture_lock) {
+			dma_off = chip->capture_dma_off;
+		}
+	}
+	return bytes_to_frames(substream->runtime, dma_off);
+}
+
+static int jockey3_handshake_step(struct jockey3_chip *chip)
+{
+	int ret;
+
+	if (test_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags))
+		return -ENODEV;
+
+	ret = ploytec_handshake_step(chip->dev, chip->xfer_buf);
+	if (ret < 0) {
+		dev_err(&chip->intf0->dev, "Ploytec handshake failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int jockey3_pcm_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *hw_params)
+{
+	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
+	unsigned int rate = params_rate(hw_params);
+	int ret = 0;
+
+	dev_dbg(&chip->intf0->dev, "PCM hw_params rate %u, active_streams %d\n",
+		rate, chip->active_streams);
+
+	if (test_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags))
+		return -ENODEV;
+
+	scoped_guard(mutex, &chip->rate_mutex) {
+		if (chip->current_rate == rate) {
+			dev_dbg(&chip->intf0->dev, "Rate already set to %u, skipping change\n",
+				rate);
+			return 0;
+		}
+
+		/*
+		 * If multiple streams are active, the ALSA core should have
+		 * enforced the constraint from jockey3_pcm_open. We still
+		 * sanity check here to be safe.
+		 */
+		if (chip->active_streams > 1) {
+			dev_err(&chip->intf0->dev, "Cannot change rate while other stream is active\n");
+			return -EBUSY;
+		}
+
+		jockey3_stop_urbs(chip);
+		msleep(50);
+
+		ret = jockey3_set_rate(chip, rate);
+		if (ret != 0) {
+			dev_err(&chip->intf0->dev, "Rate change to %u failed: %d\n", rate, ret);
+			jockey3_start_urbs(chip);
+			return ret;
+		}
+		chip->current_rate = rate;
+	}
+
+	dev_dbg(&chip->intf0->dev, "Rate changed to %u successfully, resetting device\n",
+		rate);
+	/*
+	 * Ploytec firmware re-synchronization:
+	 * Ploytec firmware require a full USB reset to re-synchronize the internal
+	 * engine after a sample rate change. Without this, the Capture EP (0x86)
+	 * often stalls or stops transmitting data, leading to EIO errors in ALSA.
+	 *
+	 * TODO: This behavior is currently kept as-is to match observed traces.
+	 * There is an opportunity to improve or replace this once we have a
+	 * better understanding of the Ploytec firmware interaction through
+	 * further protocol analysis or reverse engineering.
+	 *
+	 * pre_reset/post_reset callbacks handle the URB lifecycle.
+	 * We call this outside the rate_mutex to allow pre/post_reset to acquire it.
+	 */
+	usb_reset_device(chip->dev);
+
+	return 0;
+}
+
+static const struct snd_pcm_ops jockey3_pcm_ops = {
+	.open = jockey3_pcm_open,
+	.close = jockey3_pcm_close,
+	.hw_params = jockey3_pcm_hw_params,
+	.prepare = jockey3_pcm_prepare,
+	.trigger = jockey3_pcm_trigger,
+	.pointer = jockey3_pcm_pointer,
+};
+
+static int jockey3_midi_in_open(struct snd_rawmidi_substream *substream)
+{
+	struct jockey3_chip *chip = substream->rmidi->private_data;
+
+	if (test_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags))
+		return -ENODEV;
+	return 0;
+}
+
+static int jockey3_midi_in_close(struct snd_rawmidi_substream *substream)
+{
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
+	if (test_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags))
+		return -ENODEV;
+	return 0;
+}
+
+static int jockey3_midi_out_close(struct snd_rawmidi_substream *substream)
+{
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
+static int jockey3_handshake(struct jockey3_chip *chip)
+{
+	int ret;
+
+	ret = jockey3_handshake_step(chip);
+	if (ret < 0)
+		return ret;
+
+	chip->current_rate = 44100;
+	ret = jockey3_set_rate(chip, 44100);
+	if (ret < 0)
+		return ret;
+	msleep(20);
+
+	dev_dbg(&chip->intf0->dev, "Handshake complete.\n");
+
+	jockey3_start_urbs(chip);
+
+	return 0;
+}
+
+static const struct usb_device_id jockey3_ids[] = {
+	{ USB_DEVICE(RELOOP_VENDOR_ID, RELOOP_JOCKEY3_ME_PID), .driver_info = JOCKEY3_ME },
+	{ USB_DEVICE(RELOOP_VENDOR_ID, RELOOP_JOCKEY3_REMIX_PID), .driver_info = JOCKEY3_REMIX },
+	{}
+};
+MODULE_DEVICE_TABLE(usb, jockey3_ids);
+
+static struct usb_driver jockey3_driver;
+
+static void jockey3_release_intf1(void *data)
+{
+	struct usb_interface *intf1 = data;
+
+	usb_driver_release_interface(&jockey3_driver, intf1);
+}
+
+static void jockey3_free_urb_action(void *data)
+{
+	usb_free_urb(data);
+}
+
+static void jockey3_kfree_action(void *data)
+{
+	kfree(data);
+}
+
+static void jockey3_stop_urbs_action(void *data)
+{
+	jockey3_stop_urbs(data);
+}
+
+static int jockey3_init_playback_urbs(struct jockey3_chip *chip)
+{
+	struct usb_device *dev = chip->dev;
+	struct usb_interface *intf = chip->intf0;
+	int i, ret;
+
+	for (i = 0; i < JOCKEY3_N_URBS; i++) {
+		chip->playback_bufs[i] = kzalloc(PLOYTEC_PKT_SIZE, GFP_KERNEL);
+		if (!chip->playback_bufs[i])
+			return -ENOMEM;
+		ret = devm_add_action_or_reset(&intf->dev, jockey3_kfree_action,
+					       chip->playback_bufs[i]);
+		if (ret)
+			return ret;
+
+		chip->playback_urbs[i] = usb_alloc_urb(0, GFP_KERNEL);
+		if (!chip->playback_urbs[i])
+			return -ENOMEM;
+		ret = devm_add_action_or_reset(&intf->dev, jockey3_free_urb_action,
+					       chip->playback_urbs[i]);
+		if (ret)
+			return ret;
+
+		ploytec_prepare_out_packet(chip->playback_bufs[i]);
+
+		usb_fill_bulk_urb(chip->playback_urbs[i], dev,
+				  usb_sndbulkpipe(dev, PLOYTEC_EP_PCM_OUT),
+				  chip->playback_bufs[i], PLOYTEC_PKT_SIZE,
+				  jockey3_playback_callback, chip);
+	}
+
+	return 0;
+}
+
+static int jockey3_init_capture_urbs(struct jockey3_chip *chip)
+{
+	struct usb_device *dev = chip->dev;
+	struct usb_interface *intf = chip->intf0;
+	int i, ret;
+
+	for (i = 0; i < JOCKEY3_N_URBS; i++) {
+		chip->capture_bufs[i] = kzalloc(PLOYTEC_PKT_SIZE, GFP_KERNEL);
+		if (!chip->capture_bufs[i])
+			return -ENOMEM;
+		ret = devm_add_action_or_reset(&intf->dev, jockey3_kfree_action,
+					       chip->capture_bufs[i]);
+		if (ret)
+			return ret;
+
+		chip->capture_urbs[i] = usb_alloc_urb(0, GFP_KERNEL);
+		if (!chip->capture_urbs[i])
+			return -ENOMEM;
+		ret = devm_add_action_or_reset(&intf->dev, jockey3_free_urb_action,
+					       chip->capture_urbs[i]);
+		if (ret)
+			return ret;
+
+		usb_fill_bulk_urb(chip->capture_urbs[i], dev,
+				  usb_rcvbulkpipe(dev, PLOYTEC_EP_PCM_IN),
+				  chip->capture_bufs[i], PLOYTEC_PKT_SIZE,
+				  jockey3_capture_callback, chip);
+	}
+
+	return 0;
+}
+
+static int jockey3_probe(struct usb_interface *intf, const struct usb_device_id *usb_id)
+{
+	struct usb_device *dev = interface_to_usbdev(intf);
+	struct usb_interface *intf1;
+	struct snd_card *card;
+	struct jockey3_chip *chip;
+	char *jockey3_type;
+	int ret;
+	static int dev_idx;
+
+	if (intf->cur_altsetting->desc.bInterfaceNumber != 0)
+		return -ENODEV;
+
+	intf1 = usb_ifnum_to_if(dev, 1);
+	if (!intf1)
+		return -ENODEV;
+
+	while (dev_idx < SNDRV_CARDS && !enable[dev_idx])
+		dev_idx++;
+
+	if (dev_idx >= SNDRV_CARDS)
+		return -ENODEV;
+
+	ret = snd_devm_card_new(&intf->dev, index[dev_idx], id[dev_idx], THIS_MODULE,
+				sizeof(struct jockey3_chip), &card);
+	if (ret < 0)
+		return ret;
+
+	chip = card->private_data;
+	chip->card = card;
+	chip->dev = dev;
+	chip->intf0 = intf;
+	chip->intf1 = intf1;
+	chip->midi_out_acc = 0;
+	chip->flags = 0;
+	spin_lock_init(&chip->midi_lock);
+	spin_lock_init(&chip->playback_lock);
+	spin_lock_init(&chip->capture_lock);
+	mutex_init(&chip->rate_mutex);
+
+	init_usb_anchor(&chip->playback_anchor);
+	init_usb_anchor(&chip->capture_anchor);
+
+	chip->xfer_buf = kmalloc(64, GFP_KERNEL);
+	if (!chip->xfer_buf)
+		return -ENOMEM;
+	ret = devm_add_action_or_reset(&intf->dev, jockey3_kfree_action, chip->xfer_buf);
+	if (ret)
+		return ret;
+
+	chip->midi_in_buf = kmalloc(PLOYTEC_PKT_SIZE, GFP_KERNEL);
+	if (!chip->midi_in_buf)
+		return -ENOMEM;
+	ret = devm_add_action_or_reset(&intf->dev, jockey3_kfree_action, chip->midi_in_buf);
+	if (ret)
+		return ret;
+
+	chip->midi_in_urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!chip->midi_in_urb)
+		return -ENOMEM;
+	ret = devm_add_action_or_reset(&intf->dev, jockey3_free_urb_action, chip->midi_in_urb);
+	if (ret)
+		return ret;
+
+	ret = jockey3_init_playback_urbs(chip);
+	if (ret < 0)
+		return ret;
+
+	ret = jockey3_init_capture_urbs(chip);
+	if (ret < 0)
+		return ret;
+
+	usb_fill_bulk_urb(chip->midi_in_urb, dev,
+			  usb_rcvbulkpipe(dev, PLOYTEC_EP_MIDI_IN),
+			  chip->midi_in_buf, PLOYTEC_PKT_SIZE,
+			  jockey3_midi_in_callback, chip);
+
+	/* Stop all URBs on disconnect */
+	ret = devm_add_action(&intf->dev, jockey3_stop_urbs_action, chip);
+	if (ret)
+		return ret;
+
+	ret = snd_pcm_new(card, CARD_NAME " Audio", 0, 1, 1, &chip->pcm);
+	if (ret < 0)
+		return ret;
+
+	strscpy(chip->pcm->name, CARD_NAME " Audio", sizeof(chip->pcm->name));
+	chip->pcm->private_data = chip;
+	snd_pcm_set_ops(chip->pcm, SNDRV_PCM_STREAM_PLAYBACK, &jockey3_pcm_ops);
+	snd_pcm_set_ops(chip->pcm, SNDRV_PCM_STREAM_CAPTURE, &jockey3_pcm_ops);
+	snd_pcm_set_managed_buffer_all(chip->pcm, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
+
+	ret = snd_rawmidi_new(card, CARD_NAME " MIDI", 0, 1, 1, &chip->rmidi);
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
+
+	strscpy(card->driver, "snd-reloop-jockey3", sizeof(card->driver));
+	strscpy(card->shortname, CARD_NAME, sizeof(card->shortname));
+
+	switch (usb_id->driver_info) {
+	case JOCKEY3_ME:
+		jockey3_type = "Master Edition";
+		break;
+	case JOCKEY3_REMIX:
+		jockey3_type = "Remix";
+		break;
+	default:
+		jockey3_type = "Unknown";
+	}
+	snprintf(card->longname, sizeof(card->longname),
+		 "%s %s at USB %s", CARD_NAME, jockey3_type, dev_name(&dev->dev));
+
+	if (card->id[0] == '\0')
+		snd_card_set_id(card, "RJ3");
+
+	ret = usb_driver_claim_interface(&jockey3_driver, intf1, chip);
+	if (ret < 0)
+		return ret;
+	ret = devm_add_action_or_reset(&intf->dev, jockey3_release_intf1, intf1);
+	if (ret)
+		return ret;
+
+	usb_set_intfdata(intf, chip);
+	ret = jockey3_handshake(chip);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_card_register(card);
+	if (ret < 0)
+		return ret;
+
+	dev_idx++;
+	return 0;
+}
+
+static void jockey3_disconnect(struct usb_interface *intf)
+{
+	struct jockey3_chip *chip = usb_get_intfdata(intf);
+
+	if (chip && intf == chip->intf0) {
+		chip->stream_running = false;
+		chip->capture_running = false;
+		set_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags);
+		/*
+		 * Card cleanup, URB stopping/freeing, and interface release
+		 * are all handled automatically by devres.
+		 */
+	}
+	usb_set_intfdata(intf, NULL);
+}
+
+static int jockey3_pre_reset(struct usb_interface *intf)
+{
+	struct jockey3_chip *chip = usb_get_intfdata(intf);
+
+	if (chip && intf == chip->intf0) {
+		mutex_lock(&chip->rate_mutex);
+		jockey3_stop_urbs(chip);
+	}
+	return 0;
+}
+
+static int jockey3_post_reset(struct usb_interface *intf)
+{
+	struct jockey3_chip *chip = usb_get_intfdata(intf);
+
+	if (chip && intf == chip->intf0) {
+		jockey3_handshake_step(chip);
+		jockey3_start_urbs(chip);
+		mutex_unlock(&chip->rate_mutex);
+	}
+	return 0;
+}
+
+static struct usb_driver jockey3_driver = {
+	.name = "snd-reloop-jockey3",
+	.probe = jockey3_probe,
+	.disconnect = jockey3_disconnect,
+	.pre_reset = jockey3_pre_reset,
+	.post_reset = jockey3_post_reset,
+	.id_table = jockey3_ids
+};
+
+module_usb_driver(jockey3_driver);
+
+MODULE_AUTHOR("Frank van de Pol");
+MODULE_DESCRIPTION(CARD_NAME " ALSA Driver");
+MODULE_LICENSE("GPL");
+MODULE_SOFTDEP("pre: snd-pcm snd-rawmidi");
diff --git a/sound/usb/jockey3/ploytec_proto.c b/sound/usb/jockey3/ploytec_proto.c
new file mode 100644
index 000000000000..1a88ef29a1ca
--- /dev/null
+++ b/sound/usb/jockey3/ploytec_proto.c
@@ -0,0 +1,240 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *   ALSA driver for Reloop Jockey 3 devices
+ *   Ploytec USB Protocol Handling
+ *
+ *   Copyright (c) 2026 by Frank van de Pol <fvdpol@gmail.com>
+ */
+
+#include <linux/delay.h>
+#include "ploytec_proto.h"
+
+/**
+ * ploytec_encode_s24_3le - Encode 4-channel S24_3LE to 48-byte Ploytec frame
+ * @dest: 48-byte destination buffer
+ * @src: 12-byte source buffer (4 channels * 3 bytes)
+ *
+ * Ploytec Bit-Plane Interleaving (Playback):
+ * The firmware uses a non-standard "bit-plane" format where bits from different
+ * channels are interleaved into the same byte.
+ * - Each 48-byte frame contains 8 samples for 2 pairs of channels.
+ * - Bytes 0-23: ALSA Channels 1 & 3
+ * - Bytes 24-47: ALSA Channels 2 & 4
+ * - Within each 24-byte block, bits are grouped by significance:
+ *   - [0-7]: Most significant bits
+ *   - [8-15]: Middle bits
+ *   - [16-23]: Least significant bits
+ * - bit 0 of each byte corresponds to the first channel in the pair.
+ * - bit 1 of each byte corresponds to the second channel in the pair.
+ */
+void ploytec_encode_s24_3le(u8 *dest, const u8 *src)
+{
+	int i;
+
+	/* First 24 bytes: odd channels (ALSA Ch 1 & 3) */
+	for (i = 0; i < 8; i++) {
+		dest[i] = (((src[2] >> (7 - i)) & 1) << 0) |
+			  (((src[8] >> (7 - i)) & 1) << 1);
+	}
+	for (i = 0; i < 8; i++) {
+		dest[8 + i] = (((src[1] >> (7 - i)) & 1) << 0) |
+			      (((src[7] >> (7 - i)) & 1) << 1);
+	}
+	for (i = 0; i < 8; i++) {
+		dest[16 + i] = (((src[0] >> (7 - i)) & 1) << 0) |
+			       (((src[6] >> (7 - i)) & 1) << 1);
+	}
+
+	/* Second 24 bytes: even channels (ALSA Ch 2 & 4) */
+	for (i = 0; i < 8; i++) {
+		dest[24 + i] = (((src[5] >> (7 - i)) & 1) << 0) |
+			       (((src[11] >> (7 - i)) & 1) << 1);
+	}
+	for (i = 0; i < 8; i++) {
+		dest[24 + 8 + i] = (((src[4] >> (7 - i)) & 1) << 0) |
+				   (((src[10] >> (7 - i)) & 1) << 1);
+	}
+	for (i = 0; i < 8; i++) {
+		dest[24 + 16 + i] = (((src[3] >> (7 - i)) & 1) << 0) |
+				    (((src[9] >> (7 - i)) & 1) << 1);
+	}
+}
+
+/**
+ * ploytec_decode_s24_3le - Decode 64-byte Ploytec frame to 6-channel S24_3LE
+ * @dest: 18-byte destination buffer (6 channels * 3 bytes)
+ * @src: 64-byte source buffer
+ *
+ * Ploytec Bit-Plane Interleaving (Capture):
+ * Similar to encoding, the capture path interleaves 3 pairs of channels
+ * into bit-planes (bit 0, 1, and 2 of each byte).
+ * - Bytes 0x00-0x17: Pair 1 (bits 0,1,2)
+ * - Bytes 0x20-0x37: Pair 2 (bits 0,1,2)
+ */
+void ploytec_decode_s24_3le(u8 *dest, const u8 *src)
+{
+	int i;
+
+	/* Channel 1: odd channel 1 (bit 0 of bytes 0x00-0x17) */
+	dest[0x00] = 0;
+	dest[0x01] = 0;
+	dest[0x02] = 0;
+	for (i = 0; i < 8; i++) {
+		dest[0x00] |= ((src[0x10 + i] & 0x01) << (7 - i));
+		dest[0x01] |= ((src[0x08 + i] & 0x01) << (7 - i));
+		dest[0x02] |= ((src[0x00 + i] & 0x01) << (7 - i));
+	}
+
+	/* Channel 2: even channel 2 (bit 0 of bytes 0x20-0x37) */
+	dest[0x03] = 0;
+	dest[0x04] = 0;
+	dest[0x05] = 0;
+	for (i = 0; i < 8; i++) {
+		dest[0x03] |= ((src[0x30 + i] & 0x01) << (7 - i));
+		dest[0x04] |= ((src[0x28 + i] & 0x01) << (7 - i));
+		dest[0x05] |= ((src[0x20 + i] & 0x01) << (7 - i));
+	}
+
+	/* Channel 3: odd channel 3 (bit 1 of bytes 0x00-0x17) */
+	dest[0x06] = 0;
+	dest[0x07] = 0;
+	dest[0x08] = 0;
+	for (i = 0; i < 8; i++) {
+		dest[0x06] |= (((src[0x10 + i] & 0x02) >> 1) << (7 - i));
+		dest[0x07] |= (((src[0x08 + i] & 0x02) >> 1) << (7 - i));
+		dest[0x08] |= (((src[0x00 + i] & 0x02) >> 1) << (7 - i));
+	}
+
+	/* Channel 4: even channel 4 (bit 1 of bytes 0x20-0x37) */
+	dest[0x09] = 0;
+	dest[0x0A] = 0;
+	dest[0x0B] = 0;
+	for (i = 0; i < 8; i++) {
+		dest[0x09] |= (((src[0x30 + i] & 0x02) >> 1) << (7 - i));
+		dest[0x0A] |= (((src[0x28 + i] & 0x02) >> 1) << (7 - i));
+		dest[0x0B] |= (((src[0x20 + i] & 0x02) >> 1) << (7 - i));
+	}
+
+	/* Channel 5: odd channel 5 (bit 2 of bytes 0x00-0x17) */
+	dest[0x0C] = 0;
+	dest[0x0D] = 0;
+	dest[0x0E] = 0;
+	for (i = 0; i < 8; i++) {
+		dest[0x0C] |= (((src[0x10 + i] & 0x04) >> 2) << (7 - i));
+		dest[0x0D] |= (((src[0x08 + i] & 0x04) >> 2) << (7 - i));
+		dest[0x0E] |= (((src[0x00 + i] & 0x04) >> 2) << (7 - i));
+	}
+
+	/* Channel 6: even channel 6 (bit 2 of bytes 0x20-0x37) */
+	dest[0x0F] = 0;
+	dest[0x10] = 0;
+	dest[0x11] = 0;
+	for (i = 0; i < 8; i++) {
+		dest[0x0F] |= (((src[0x30 + i] & 0x04) >> 2) << (7 - i));
+		dest[0x10] |= (((src[0x28 + i] & 0x04) >> 2) << (7 - i));
+		dest[0x11] |= (((src[0x20 + i] & 0x04) >> 2) << (7 - i));
+	}
+}
+
+/**
+ * ploytec_prepare_out_packet - Prepare a playback packet with default sync/MIDI padding
+ * @buf: 512-byte destination buffer
+ *
+ * Sets the initial pattern: MIDI slot (480) is idle (0xFD), sync byte is
+ * set to 0xFF at offset 481, and the padding gap (482-511) is zero-filled.
+ */
+void ploytec_prepare_out_packet(u8 *buf)
+{
+	memset(buf, 0, PLOYTEC_PKT_SIZE);
+	buf[PLOYTEC_MIDI_OUT_OFFSET] = PLOYTEC_MIDI_IDLE_BYTE;
+	buf[PLOYTEC_SYNC_BYTE_OFFSET] = PLOYTEC_SYNC_BYTE_VALUE;
+}
+
+/**
+ * ploytec_handshake_step - Perform the Ploytec handshake sequence
+ * @dev: USB device
+ * @xfer_buf: Temporary transfer buffer
+ */
+int ploytec_handshake_step(struct usb_device *dev, void *xfer_buf)
+{
+	u8 *buf = xfer_buf;
+	u8 status;
+	int ret;
+
+	ret = usb_set_interface(dev, 0, 1);
+	if (ret < 0)
+		return ret;
+	msleep(20);
+
+	ret = usb_set_interface(dev, 1, 1);
+	if (ret < 0)
+		return ret;
+	msleep(20);
+
+	/*
+	 * Read Firmware (Request 0x56):
+	 * This request often fails on the Reloop Jockey3 devices but appears
+	 * to be a necessary "poke" that advances the internal state machine.
+	 *
+	 * TODO: This behavior is currently kept as-is to match observed traces.
+	 * There is an opportunity to improve or replace this once we have a
+	 * better understanding of the Ploytec firmware interaction through
+	 * further protocol analysis or reverse engineering.
+	 */
+	ret = usb_control_msg_recv(dev, 0, PLOYTEC_REQ_FIRMWARE, 0xC0, 0, 0,
+				   buf, 15, 2000, GFP_KERNEL);
+	msleep(20);
+
+	/* Read Status (Request 0x49) */
+	ret = usb_control_msg_recv(dev, 0, PLOYTEC_REQ_STATUS, 0xC0, 0, 0,
+				   buf, 1, 2000, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+
+	status = buf[0];
+	msleep(20);
+
+	/* Enable device if READY bit is not set */
+	if (!(status & PLOYTEC_STATUS_READY)) {
+		ret = usb_control_msg_send(dev, 0, PLOYTEC_REQ_STATUS, 0x40,
+					   (uint16_t)((status | PLOYTEC_STATUS_READY) & 0xFF),
+					   0, NULL, 0, 2000, GFP_KERNEL);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * ploytec_set_rate - Set hardware sample rate
+ * @dev: USB device
+ * @xfer_buf: Temporary transfer buffer
+ * @rate: Sample rate in Hz
+ */
+int ploytec_set_rate(struct usb_device *dev, void *xfer_buf, u32 rate)
+{
+	u8 *buf = xfer_buf;
+	int ret;
+
+	buf[0] = rate & 0xFF;
+	buf[1] = (rate >> 8) & 0xFF;
+	buf[2] = (rate >> 16) & 0xFF;
+
+	/* Set rate on Capture EP 0x86 */
+	ret = usb_control_msg_send(dev, 0, PLOYTEC_SET_RATE, PLOYTEC_SET_RATE_VAL,
+				   0x0100, 0x0086, buf, 3, 2000, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+
+	msleep(50);
+
+	/* Set rate on Playback EP 0x05 */
+	ret = usb_control_msg_send(dev, 0, PLOYTEC_SET_RATE, PLOYTEC_SET_RATE_VAL,
+				   0x0100, 0x0005, buf, 3, 2000, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+
+	msleep(50);
+	return 0;
+}
diff --git a/sound/usb/jockey3/ploytec_proto.h b/sound/usb/jockey3/ploytec_proto.h
new file mode 100644
index 000000000000..b9c22303ad6f
--- /dev/null
+++ b/sound/usb/jockey3/ploytec_proto.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *   ALSA driver for Reloop Jockey 3 devices
+ *   Ploytec USB Protocol Handling
+ *
+ *   Copyright (c) 2026 by Frank van de Pol <fvdpol@gmail.com>
+ */
+
+#ifndef PLOYTEC_PROTO_H
+#define PLOYTEC_PROTO_H
+
+#include <linux/types.h>
+#include <linux/usb.h>
+
+/* Ploytec Protocol Constants */
+#define PLOYTEC_PKT_SIZE 512
+#define PLOYTEC_MIDI_IDLE_BYTE 0xFD
+
+/* Playback & MIDI Out (EP 0x05) */
+#define PLOYTEC_EP_PCM_OUT 0x05
+#define PLOYTEC_PLAYBACK_FRAMES 10
+#define PLOYTEC_PLAYBACK_FRAME_SIZE 48
+#define PLOYTEC_MIDI_OUT_OFFSET 480
+#define PLOYTEC_SYNC_BYTE_OFFSET 481
+#define PLOYTEC_SYNC_BYTE_VALUE 0xFF
+
+/* Capture (EP 0x86) */
+#define PLOYTEC_EP_PCM_IN 0x86
+#define PLOYTEC_CAPTURE_FRAMES 8
+#define PLOYTEC_CAPTURE_FRAME_SIZE 64
+
+/* MIDI In (EP 0x83) */
+#define PLOYTEC_EP_MIDI_IN 0x83
+
+/* Protocol Commands */
+#define PLOYTEC_REQ_FIRMWARE 0x56
+#define PLOYTEC_REQ_STATUS   0x49
+#define PLOYTEC_SET_RATE     0x01
+#define PLOYTEC_SET_RATE_VAL 0x22
+
+/* Status Bits */
+#define PLOYTEC_STATUS_READY 0x20
+
+/* Bit-shuffling codec for S24_3LE (3 bytes per sample) */
+void ploytec_encode_s24_3le(u8 *dest, const u8 *src);
+void ploytec_decode_s24_3le(u8 *dest, const u8 *src);
+
+/* Protocol Helpers */
+void ploytec_prepare_out_packet(u8 *buf);
+int ploytec_handshake_step(struct usb_device *dev, void *xfer_buf);
+int ploytec_set_rate(struct usb_device *dev, void *xfer_buf, u32 rate);
+
+#endif /* PLOYTEC_PROTO_H */
-- 
2.47.3

