Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655E839A04C
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 07:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135903; cv=none; b=sNB8Pb+CqAbJQkd0nDfrekxkhjosuEFvtULbC/ZcW9bAyVa2rQTh/9fXM8Z3l69hq5LxOeIOPpkWUZ4LotrOuJYvZOB9npe7K+0VfjWNqk6/RToZfCtNMYySx3qQ8npgsgBfurGpnd9M1fxpxfqfJy8MNqFb16Arv+Oi1zM2GmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135903; c=relaxed/simple;
	bh=yXiUbJmEnG05tOVB3+pd9iCR0DIZi9X7y2AkwzhYNvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fyq7nhk2jgCS3ROhnTB/sSkbiBGmhUGRqkXp57Ffm0CvH57D+mLIaFmattQ/XULA7JpNQvXGxwsOMjKy7YzuxNUFRtELYH7cV5Eq7zPg0lX8lCDIeY67y0koOZGB3vcaQ1KXH6sun23G2aBZAJP213FCeLfs9rhhP42EbPgM7Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2OtRXgn; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2OtRXgn"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c40f29667e6so23953766b.0
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 00:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792135899; x=1792740699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VuknlnN2QPK15sTCzJsZLa7eytkQBCGkFYFysZF+n5I=;
        b=i2OtRXgn8xOrVYsbasUnYh9J/y1V5t1CCkwPVTvWgH8Bwu+JeSV5ayn4tTHm/A1wSI
         ivij3eiNqHxq8tYChTmfzCsgI5PVZQoGX/yBJr60q4t+F5lIhBmWo832TTucTvR+Xnw7
         1aXljQE5Z7j2As2HXRW1OxKwpUhFllrKij2bclPTecnFBzRM/D7hzaDwm8B3GFP1x0gw
         6lkhx4xYEOcz63Nqn3g+4akhEMy2RZwRUgARvZakmJ0XIs8MzEBhIT06yAWIqOEi2k9v
         dTaGThQumCBFPnpGMtdex6KWtJsVSxTEhiRspuvRk/vJxpTbgHCcochWeAUUq8b5mfDT
         6hZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792135899; x=1792740699;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VuknlnN2QPK15sTCzJsZLa7eytkQBCGkFYFysZF+n5I=;
        b=Ny70EFq3rTJ6cZKQBJA+85xyqHNxLlPad80KFH9wF5BTgtDEsZIutLpqJd2Jol+NmE
         wISO9rv10vrFmZ0u3puZqLfhmKbWFpXNhOMZqZMpCR9RcP7LmK61QDphessplFp2C1Kw
         YZOQgwWKH6NdWfTRc57ii1LOByyFPw0KafuYdlPFFP6mesfmUnwupGHkY9Gq3mai9I1I
         oglg8RNY8bmuaZJXxfHex58eWEgA1RCnDtmV2IsGigE03clEF5E98F55ury3EGTCeuFZ
         DxOdfSXp7GBtPfezybjod6zOsC3liYjZbr/HOBnDHAKu4GsknM3FwV2fX1iEJk0H6fPx
         tGyw==
X-Forwarded-Encrypted: i=1; AKwUvBxx5gnqFWmYc9WU08RohLTyOad5y/mEVGLtn7KdGLdD/TXCm/2hvsqrP5CkJoSiN0DUt92+8Bs3AnIZyw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLbeHgDQWlOdfpXFXNJhxPu7ImivjadTkWtwiHCp8fzloyH5Qqu
	nN+2bEIpWYzrbGnZgoOLmsGDSl+9OrHYErsb4sjuj1rQyp2sgZINz0Ar
X-Gm-Gg: AYBFou0nvdAdQZuyhK1oyh0M+ryo8zEYKfvb8gFbIIvzKxlNWEgWyxZggchYPKCgqOt
	DqDNP9VoX4r3xrElq0YmipMF3lY2wF/DM0CqbhBWTgs5sISu6hXoj/CEeY1muHxJSfSPAsxQuFB
	np9jsYLNVhhYR7yT55G2YR+NVB9HmpKstejkLCkMbWEhYw1i+IHo1O+VKi+tPMUuAdk1PV56G4s
	MZkmQw1C4KgICM1gvuCg3mrG6un1FfAtWqr+r70ayaP48YZw+5C6ptilis/Qqv4nDh0ibJHWcBt
	QWl1QRktnrZYCYK9VGR+6cL29Rqb0p64APB+n5waIU7MZ7N1Q5pEzOxSkTY8E5k0mD0RevyQqPr
	CkDAYFnzvxJSucF9TKbbNr0/TdDJdMRkEqIom76I/oNLwhdHyJfqn5+kOs2LjqOKp38b2PZFqxP
	vZ8EwnOGZi6iDt4UDBra6DKPo31na/YOEBKyYcvsO97bo3HQQS9Tul5UPnqAoF2yBWICCm
X-Received: by 2002:a17:906:630c:b0:c2e:4601:24d7 with SMTP id a640c23a62f3a-c31aa0b038fmr2040191866b.39.1792135899311;
        Fri, 16 Oct 2026 00:31:39 -0700 (PDT)
Received: from keen.lan ([212.75.99.75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd125csm44471366b.26.2026.10.16.00.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:31:38 -0700 (PDT)
From: =?UTF-8?q?Piotr=20Gli=C5=BAniewicz?= <p.glizniewicz@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Torsten Schenk <torsten.schenk@zoho.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Piotr=20Gli=C5=BAniewicz?= <p.glizniewicz@gmail.com>
Subject: [PATCH 3/3] ALSA: 6fire: add S/PDIF output
Date: Fri, 16 Oct 2026 09:31:32 +0200
Message-ID: <20261016073132.109288-4-p.glizniewicz@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016073132.109288-1-p.glizniewicz@gmail.com>
References: <20261016073132.109288-1-p.glizniewicz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The DMX 6Fire USB has a coaxial S/PDIF output, which the driver keeps
disabled. Enable it as playback channels 7 and 8 of the existing PCM
device, the layout chosen in the RFC thread linked below. The
protocol was taken from a usbmon capture of the vendor's Windows
driver and checked against a disassembly of that driver.

The packets of altsetting 3 (176.4 and 192 kHz) have room for the six
analog channels only, so the output is available up to 96 kHz.
hw_params rules allow more than 6 channels only up to 96 kHz, and
prepare rejects more than 6 channels while the other stream runs at
176.4 or 192 kHz. A client that takes channels_max therefore gets 8
channels at up to 96 kHz instead of 6 channels at up to 192 kHz (the
Pro Audio profile of PipeWire 1.6.9 opened the device with 8
channels); a client that asks for 6 channels still gets 192 kHz. A
UCM profile can describe the channels and offer a 6-channel
configuration with 192 kHz. The channel map marks channels 7 and 8
UNKNOWN; a program that ignores the map and assumes the 7.1 order
sends the side pair to the S/PDIF output.

The card has one rate and one frame layout for both directions, set by
the first prepare and kept until the last close, and the register bit
that enables the transmitter is the bit that widens the playback frame
from 6 to 8 slots. The driver therefore sets the bit at every rate up to
96 kHz, whichever direction starts first, so that a playback opened
later can use 8 channels; the transmitter sends what is in
slots 6 and 7, zeros while no playback runs. With "IEC958 Playback
Switch" off (it is on by default), the driver sends zeros in the pair
and omits the block start flag, and the receiver used for testing loses
lock. Two versions in which the switch also cleared the bit were tried
with PipeWire and a UCM profile and dropped. With the bit tied to the
switch, the channel count depended on the switch and a change had to be
refused while a stream ran, which broke profile changes. With the bit
set by the switch or by an 8-channel playback, the frame width depended
on which stream started first, and an 8-channel playback was refused
while a capture ran with the switch off. With the bit tied to the rate,
as in the vendor driver, the coaxial output carries a signal whenever
the card streams at up to 96 kHz; a receiver that selects its input when
it detects a signal was not tested. "Digital Thru Playback Route" has
priority: with it on, the output carries the coaxial input.

The channel status is consumer, 24 bit, with the sample rate and the
channel numbers. "IEC958 Playback Default" sets the non-audio,
copyright and emphasis bits, the category code and the generation bit;
"IEC958 Playback Con Mask" lists these bits. With the non-audio bit
set (AC3, DTS), the validity bit of every subframe is set as well, as
the vendor driver does. A change of "IEC958 Playback Default" or of
the switch takes effect at the next 192-frame block.

Tested on a DMX 6Fire USB at 44.1, 48 and 96 kHz with a second
interface locked to the output: a tagged ramp on channels 7/8 arrived
without a missing, repeated or changed sample for 4.7 s at each rate,
and at 48 kHz a -20 dBFS tone arrived at -20.0 dBFS while a tone on
channel 3 played on Line Out 3. With the switch off from the start,
the second interface did not lock during an 8-channel, a 6-channel or
a capture-only stream.

Link: https://lore.kernel.org/linux-sound/30dcedc7-3b56-4396-af3d-6c2701ef1cb7@perex.cz/
Assisted-by: LLM
Signed-off-by: Piotr Gliźniewicz <p.glizniewicz@gmail.com>
---
 sound/usb/6fire/control.c |  25 +++-
 sound/usb/6fire/pcm.c     | 308 +++++++++++++++++++++++++++++++++++---
 sound/usb/6fire/pcm.h     |   7 +-
 3 files changed, 316 insertions(+), 24 deletions(-)

diff --git a/sound/usb/6fire/control.c b/sound/usb/6fire/control.c
index 020e9676d..da5a2d7ac 100644
--- a/sound/usb/6fire/control.c
+++ b/sound/usb/6fire/control.c
@@ -149,9 +149,14 @@ static int usb6fire_control_set_channels(
 	if (ret < 0)
 		return ret;
 
-	/* disable digital inputs and outputs */
-	/* TODO: use spdif_x to enable/disable digital channels */
-	ret = comm_rt->write16(comm_rt, 0x02, 0x03, 0x00, 0x00);
+	/*
+	 * digital (S/PDIF) input and output: bit 0 adds four slots (4-7) to
+	 * the capture frame, which carry the subframes of the receiver; up to
+	 * two receiver frames arrive per card frame; bit 1 enables the
+	 * transmitter, which encodes the playback pair in slots 6/7 (pcm.c)
+	 */
+	ret = comm_rt->write16(comm_rt, 0x02, 0x03, 0x00,
+			(spdif_in ? 0x01 : 0x00) | (spdif_out ? 0x02 : 0x00));
 	if (ret < 0)
 		return ret;
 
@@ -161,14 +166,26 @@ static int usb6fire_control_set_channels(
 static int usb6fire_control_streaming_update(struct control_runtime *rt)
 {
 	struct comm_runtime *comm_rt = rt->chip->comm;
+	int err = 0;
+	int ret;
 
 	if (comm_rt) {
+		/*
+		 * the digital pairs are enabled only while a stream runs; the
+		 * streaming register is written even if this write fails.
+		 * usb6fire_control_digital_thru_put() holds stream_mutex, so
+		 * this write cannot run after set_channels() and before
+		 * streaming starts in usb6fire_pcm_set_rate()
+		 */
+		if (!rt->usb_streaming)
+			err = comm_rt->write16(comm_rt, 0x02, 0x03, 0x00, 0x00);
 		if (!rt->usb_streaming && rt->digital_thru_switch)
 			usb6fire_control_set_rate(rt,
 				DIGITAL_THRU_ONLY_SAMPLERATE);
-		return comm_rt->write16(comm_rt, 0x02, 0x00, 0x00,
+		ret = comm_rt->write16(comm_rt, 0x02, 0x00, 0x00,
 			(rt->usb_streaming ? 0x01 : 0x00) |
 			(rt->digital_thru_switch ? 0x08 : 0x00));
+		return err < 0 ? err : ret;
 	}
 	return -EINVAL;
 }
diff --git a/sound/usb/6fire/pcm.c b/sound/usb/6fire/pcm.c
index d99395229..f5dfb8c30 100644
--- a/sound/usb/6fire/pcm.c
+++ b/sound/usb/6fire/pcm.c
@@ -9,13 +9,34 @@
  * Copyright:	(C) Torsten Schenk
  */
 
+#include <linux/bitops.h>
+#include <sound/asoundef.h>
+#include <sound/control.h>
+
 #include "pcm.h"
 #include "chip.h"
 #include "comm.h"
 #include "control.h"
 
+/*
+ * Every USB frame is a 4 byte header followed by 32-bit slots, one per
+ * channel: 3 bytes of sample and a marker byte. Analog slots are marked
+ * 0x40. Up to 96 kHz (altsettings 1 and 2) the playback frame carries two
+ * more slots, 6/7, which carry the data for the S/PDIF transmitter in
+ * the FPGA. Their marker byte tells the transmitter how to frame the
+ * sample: 0x10 marks the left subframe and 0x00 the right one; 0x20 marks
+ * the start of the channel status block (left subframe, every 192
+ * frames); 0x04 is the channel status bit of the subframe; 0x01 is the
+ * validity bit, set for non-audio data; 0x08 is the parity bit, which
+ * makes the number of ones in the sample, the validity and channel status
+ * bits and itself even.
+ * At altsetting 3 (176.4/192 kHz) the packets hold the analog slots only.
+ */
 enum {
-	OUT_N_CHANNELS = 6, IN_N_CHANNELS = 4
+	OUT_N_ANALOG = 6, N_SPDIF = 2,
+	OUT_N_CHANNELS = OUT_N_ANALOG + N_SPDIF, IN_N_CHANNELS = 4,
+	SPDIF_OUT_SLOT = OUT_N_ANALOG,
+	SPDIF_BLOCK_FRAMES = 192
 };
 
 /* keep next two synced with
@@ -24,6 +45,15 @@ enum {
 static const int rates_in_packet_size[] = { 228, 228, 420, 420, 404, 404 };
 static const int rates_out_packet_size[] = { 228, 228, 420, 420, 604, 604 };
 static const int rates[] = { 44100, 48000, 88200, 96000, 176400, 192000 };
+static const u8 rates_iec958_fs[] = {
+	IEC958_AES3_CON_FS_44100, IEC958_AES3_CON_FS_48000,
+	IEC958_AES3_CON_FS_88200, IEC958_AES3_CON_FS_96000,
+	IEC958_AES3_CON_FS_176400, IEC958_AES3_CON_FS_192000 };
+/* channel status bits that "IEC958 Playback Default" sets, bytes 0 and 1 */
+static const u8 spdif_ctl_mask[] = {
+	IEC958_AES0_NONAUDIO | IEC958_AES0_CON_NOT_COPYRIGHT |
+		IEC958_AES0_CON_EMPHASIS,
+	IEC958_AES1_CON_CATEGORY | IEC958_AES1_CON_ORIGINAL };
 static const int rates_alsaid[] = {
 	SNDRV_PCM_RATE_44100, SNDRV_PCM_RATE_48000,
 	SNDRV_PCM_RATE_88200, SNDRV_PCM_RATE_96000,
@@ -71,6 +101,7 @@ static int usb6fire_pcm_set_rate(struct pcm_runtime *rt)
 {
 	int ret;
 	struct control_runtime *ctrl_rt = rt->chip->control;
+	bool spdif;
 
 	ctrl_rt->usb_streaming = false;
 	ret = ctrl_rt->update_streaming(ctrl_rt);
@@ -89,8 +120,9 @@ static int usb6fire_pcm_set_rate(struct pcm_runtime *rt)
 		return ret;
 	}
 
-	ret = ctrl_rt->set_channels(ctrl_rt, OUT_N_CHANNELS, IN_N_CHANNELS,
-			false, false);
+	spdif = rt->rate <= CONTROL_RATE_96KHZ;
+	ret = ctrl_rt->set_channels(ctrl_rt, OUT_N_ANALOG, IN_N_CHANNELS,
+			spdif, false);
 	if (ret < 0) {
 		dev_err(&rt->chip->dev->dev,
 			"error initializing channels while setting samplerate %d.\n",
@@ -104,16 +136,108 @@ static int usb6fire_pcm_set_rate(struct pcm_runtime *rt)
 		dev_err(&rt->chip->dev->dev,
 			"error starting streaming while setting samplerate %d.\n",
 			rates[rt->rate]);
+		/* stream_stop() will not run; clear 0x02/0x03 here */
+		ctrl_rt->usb_streaming = false;
+		ctrl_rt->update_streaming(ctrl_rt);
 		return ret;
 	}
 
 	rt->in_n_analog = IN_N_CHANNELS;
-	rt->out_n_analog = OUT_N_CHANNELS;
+	rt->out_n_slots = spdif ? OUT_N_CHANNELS : OUT_N_ANALOG;
 	rt->in_packet_size = rates_in_packet_size[rt->rate];
 	rt->out_packet_size = rates_out_packet_size[rt->rate];
+
+	/*
+	 * consumer channel status, 24 bit samples; bytes 0 and 1 are taken
+	 * from rt->spdif_bits at the start of every block
+	 */
+	memset(rt->spdif_status, 0, sizeof(rt->spdif_status));
+	rt->spdif_status[3] = rates_iec958_fs[rt->rate];
+	rt->spdif_status[4] = IEC958_AES4_CON_MAX_WORDLEN_24 |
+			IEC958_AES4_CON_WORDLEN_24_20;
+	rt->spdif_frame = 0;
 	return 0;
 }
 
+/*
+ * Return the marker byte of one playback slot whose 3 sample bytes are
+ * already in place. The marker is 0x40 for an analog slot and the S/PDIF
+ * framing for a digital slot. With "IEC958 Playback Switch" off, the
+ * function also clears the sample bytes of a digital slot. After the right
+ * subframe, the function advances the channel status position.
+ */
+static u8 usb6fire_pcm_marker(struct pcm_runtime *rt, int slot,
+		u8 *sample)
+{
+	bool right = slot == SPDIF_OUT_SLOT + 1;
+	unsigned int n = rt->spdif_frame;
+	u8 marker = right ? 0x00 : 0x10;
+	u8 status;
+
+	if (slot < SPDIF_OUT_SLOT)
+		return 0x40;
+	if (!right && n == 0) {
+		/* a new block takes the bits of "IEC958 Playback Default" */
+		u32 bits = READ_ONCE(rt->spdif_bits);
+
+		rt->spdif_status[0] = bits & 0xff;
+		rt->spdif_status[1] = bits >> 8;
+		/*
+		 * "IEC958 Playback Switch" off omits the block start flag and
+		 * clears the sample bytes of the digital slots
+		 */
+		rt->spdif_on = READ_ONCE(rt->spdif_switch);
+		if (rt->spdif_on)
+			marker |= 0x20;
+	}
+	if (!rt->spdif_on)
+		memset(sample, 0, 3);
+	status = rt->spdif_status[n >> 3];
+	/* byte 2 holds the channel number: 1 = A (left), 2 = B (right) */
+	if ((n >> 3) == 2)
+		status |= right ? (2 << 4) : (1 << 4);
+	if (status & (1 << (n & 7)))
+		marker |= 0x04;
+	/* V = 1 for non-audio data (AC3, DTS), as the vendor driver does */
+	if (rt->spdif_status[0] & IEC958_AES0_NONAUDIO)
+		marker |= 0x01;
+	/* P makes the number of ones in bits 0-27 (sample, V, U, C, P) even */
+	if (parity8(sample[0] ^ sample[1] ^ sample[2] ^ (marker & 0x07)))
+		marker |= 0x08;
+	if (right)
+		rt->spdif_frame = (n + 1) % SPDIF_BLOCK_FRAMES;
+	return marker;
+}
+
+/* more than OUT_N_ANALOG playback channels need a rate up to 96 kHz */
+static int usb6fire_pcm_rule_channels(struct snd_pcm_hw_params *params,
+		struct snd_pcm_hw_rule *rule)
+{
+	const struct snd_interval *r =
+		hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_RATE);
+	struct snd_interval t = { .min = 1, .max = OUT_N_ANALOG, .integer = 1 };
+
+	if (r->min <= rates[CONTROL_RATE_96KHZ])
+		return 0;
+	return snd_interval_refine(hw_param_interval(params,
+			SNDRV_PCM_HW_PARAM_CHANNELS), &t);
+}
+
+static int usb6fire_pcm_rule_rate(struct snd_pcm_hw_params *params,
+		struct snd_pcm_hw_rule *rule)
+{
+	const struct snd_interval *c =
+		hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_CHANNELS);
+	struct snd_interval t = {
+		.min = 0, .max = rates[CONTROL_RATE_96KHZ], .integer = 1
+	};
+
+	if (c->min <= OUT_N_ANALOG)
+		return 0;
+	return snd_interval_refine(hw_param_interval(params,
+			SNDRV_PCM_HW_PARAM_RATE), &t);
+}
+
 static struct pcm_substream *usb6fire_pcm_get_substream(
 		struct snd_pcm_substream *alsa_sub)
 {
@@ -264,19 +388,21 @@ static void usb6fire_pcm_playback(struct pcm_substream *sub,
 	}
 
 	for (i = 0; i < PCM_N_PACKETS_PER_URB; i++) {
-		/* at least 4 header bytes for valid packet.
-		 * after that: 32 bits per sample for analog channels */
+		/*
+		 * at least 4 header bytes for valid packet.
+		 * after that: 32 bits per slot
+		 */
 		isoc = &urb->instance->iso_frame_desc[i];
 		if (isoc->length > 4)
 			frame_count = (isoc->length - 4)
-					/ (rt->out_n_analog << 2);
+					/ (rt->out_n_slots << 2);
 		else
 			frame_count = 0;
 		dest++; /* skip leading 4 bytes of every frame */
 		for (frame = 0; frame < frame_count; frame++) {
 			memcpy(dest, src, bytes_per_frame);
 			src += alsa_rt->channels;
-			dest += rt->out_n_analog;
+			dest += rt->out_n_slots;
 			sub->dma_off++;
 			sub->period_off++;
 			if (src == src_end) {
@@ -301,6 +427,7 @@ static void usb6fire_pcm_in_urb_handler(struct urb *usb_urb)
 	int channel;
 	int i;
 	u8 *dest;
+	unsigned int spdif_frame;
 
 	if (usb_urb->status || rt->panic || rt->stream_state == STREAM_STOPPING)
 		return;
@@ -344,10 +471,10 @@ static void usb6fire_pcm_in_urb_handler(struct urb *usb_urb)
 					/ (rt->in_n_analog << 2);
 		frames = min_t(unsigned int, frames,
 				       (rt->out_packet_size - 4)
-				       / (rt->out_n_analog << 2));
+				       / (rt->out_n_slots << 2));
 
 		isoc_out->offset = total_length;
-		isoc_out->length = frames * (rt->out_n_analog << 2) + 4;
+		isoc_out->length = frames * (rt->out_n_slots << 2) + 4;
 		isoc_out->status = 0;
 		total_length += isoc_out->length;
 	}
@@ -368,28 +495,38 @@ static void usb6fire_pcm_in_urb_handler(struct urb *usb_urb)
 	if (period_elapsed)
 		snd_pcm_period_elapsed(sub->instance);
 
-	/* setup the 4th byte of each sample (0x40 for analog channels) */
+	/*
+	 * set the 4th byte of each sample (0x40 for analog channels,
+	 * S/PDIF framing for the digital pair)
+	 */
+	spdif_frame = rt->spdif_frame;
 	dest = out_urb->buffer;
 	for (i = 0; i < PCM_N_PACKETS_PER_URB; i++) {
 		isoc_out = &out_urb->instance->iso_frame_desc[i];
 		if (isoc_out->length >= 4) {
 			frame_count = (isoc_out->length - 4)
-					/ (rt->out_n_analog << 2);
+					/ (rt->out_n_slots << 2);
 			*(dest++) = 0xaa;
 			*(dest++) = 0xaa;
 			*(dest++) = frame_count;
 			*(dest++) = 0x00;
 			for (frame = 0; frame < frame_count; frame++)
 				for (channel = 0;
-						channel < rt->out_n_analog;
+						channel < rt->out_n_slots;
 						channel++) {
-					dest += 3; /* skip sample data */
-					*(dest++) = 0x40;
+					dest[3] = usb6fire_pcm_marker(rt,
+							channel, dest);
+					dest += 4;
 				}
 		}
 	}
 
-	usb_submit_urb(out_urb->instance, GFP_ATOMIC);
+	/*
+	 * the frames of an out urb that was not submitted never reach the
+	 * transmitter; the next urb continues the block at the same position
+	 */
+	if (usb_submit_urb(out_urb->instance, GFP_ATOMIC) < 0)
+		rt->spdif_frame = spdif_frame;
 	usb_submit_urb(in_urb->instance, GFP_ATOMIC);
 }
 
@@ -409,6 +546,7 @@ static int usb6fire_pcm_open(struct snd_pcm_substream *alsa_sub)
 	struct pcm_runtime *rt = snd_pcm_substream_chip(alsa_sub);
 	struct pcm_substream *sub = NULL;
 	struct snd_pcm_runtime *alsa_rt = alsa_sub->runtime;
+	int ret;
 
 	if (rt->panic)
 		return -EPIPE;
@@ -420,6 +558,17 @@ static int usb6fire_pcm_open(struct snd_pcm_substream *alsa_sub)
 		if (rt->rate < ARRAY_SIZE(rates))
 			alsa_rt->hw.rates = rates_alsaid[rt->rate];
 		alsa_rt->hw.channels_max = OUT_N_CHANNELS;
+		ret = snd_pcm_hw_rule_add(alsa_rt, 0,
+				SNDRV_PCM_HW_PARAM_CHANNELS,
+				usb6fire_pcm_rule_channels, NULL,
+				SNDRV_PCM_HW_PARAM_RATE, -1);
+		if (ret < 0)
+			return ret;
+		ret = snd_pcm_hw_rule_add(alsa_rt, 0, SNDRV_PCM_HW_PARAM_RATE,
+				usb6fire_pcm_rule_rate, NULL,
+				SNDRV_PCM_HW_PARAM_CHANNELS, -1);
+		if (ret < 0)
+			return ret;
 		sub = &rt->playback;
 	} else if (alsa_sub->stream == SNDRV_PCM_STREAM_CAPTURE) {
 		if (rt->rate < ARRAY_SIZE(rates))
@@ -489,7 +638,17 @@ static int usb6fire_pcm_prepare(struct snd_pcm_substream *alsa_sub)
 				alsa_rt->rate);
 			return -EINVAL;
 		}
-
+	}
+	/* the digital pair is not available at 176.4 and 192 kHz */
+	if (rt->rate > CONTROL_RATE_96KHZ &&
+			alsa_sub->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+			alsa_rt->channels > OUT_N_ANALOG) {
+		dev_err(&rt->chip->dev->dev,
+			"%d channels not available at %d Hz.\n",
+			alsa_rt->channels, rates[rt->rate]);
+		return -EINVAL;
+	}
+	if (rt->stream_state == STREAM_DISABLED) {
 		ret = usb6fire_pcm_set_rate(rt);
 		if (ret)
 			return ret;
@@ -612,11 +771,79 @@ static void usb6fire_pcm_free(struct pcm_runtime *rt)
 	kfree(rt);
 }
 
+static int usb6fire_pcm_spdif_info(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_IEC958;
+	uinfo->count = 1;
+	return 0;
+}
+
+static int usb6fire_pcm_spdif_mask_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	memset(ucontrol->value.iec958.status, 0,
+	       sizeof(ucontrol->value.iec958.status));
+	ucontrol->value.iec958.status[0] = spdif_ctl_mask[0];
+	ucontrol->value.iec958.status[1] = spdif_ctl_mask[1];
+	return 0;
+}
+
+static int usb6fire_pcm_spdif_default_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct pcm_runtime *rt = snd_kcontrol_chip(kcontrol);
+	u32 bits = READ_ONCE(rt->spdif_bits);
+
+	memset(ucontrol->value.iec958.status, 0,
+	       sizeof(ucontrol->value.iec958.status));
+	ucontrol->value.iec958.status[0] = bits & 0xff;
+	ucontrol->value.iec958.status[1] = bits >> 8;
+	return 0;
+}
+
+static int usb6fire_pcm_spdif_default_put(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct pcm_runtime *rt = snd_kcontrol_chip(kcontrol);
+	u32 bits = (ucontrol->value.iec958.status[0] & spdif_ctl_mask[0]) |
+		(ucontrol->value.iec958.status[1] & spdif_ctl_mask[1]) << 8;
+
+	/* the control core serializes puts; the urb handler uses READ_ONCE */
+	if (rt->spdif_bits == bits)
+		return 0;
+	WRITE_ONCE(rt->spdif_bits, bits);
+	return 1;
+}
+
+static int usb6fire_pcm_spdif_switch_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct pcm_runtime *rt = snd_kcontrol_chip(kcontrol);
+
+	ucontrol->value.integer.value[0] = READ_ONCE(rt->spdif_switch);
+	return 0;
+}
+
+static int usb6fire_pcm_spdif_switch_put(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct pcm_runtime *rt = snd_kcontrol_chip(kcontrol);
+	bool on = ucontrol->value.integer.value[0];
+
+	/* the control core serializes puts; the urb handler uses READ_ONCE */
+	if (rt->spdif_switch == on)
+		return 0;
+	WRITE_ONCE(rt->spdif_switch, on);
+	return 1;
+}
+
 /*
  * playback channel map: channel n goes to analog output n, which the
  * manual of the card assigns to FL FR FC LFE RL RR for n = 1..6; a
  * 1-channel stream is MONO, as in snd_pcm_std_chmaps, and plays on
- * analog output 1 only
+ * analog output 1 only; channels 7 and 8 are the S/PDIF pair and have
+ * no position
  */
 static const struct snd_pcm_chmap_elem usb6fire_pcm_chmaps[] = {
 	{ .channels = 1, .map = { SNDRV_CHMAP_MONO } },
@@ -631,9 +858,41 @@ static const struct snd_pcm_chmap_elem usb6fire_pcm_chmaps[] = {
 	{ .channels = 6, .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR,
 				  SNDRV_CHMAP_FC, SNDRV_CHMAP_LFE,
 				  SNDRV_CHMAP_RL, SNDRV_CHMAP_RR } },
+	{ .channels = 7, .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR,
+				  SNDRV_CHMAP_FC, SNDRV_CHMAP_LFE,
+				  SNDRV_CHMAP_RL, SNDRV_CHMAP_RR,
+				  SNDRV_CHMAP_UNKNOWN } },
+	{ .channels = 8, .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR,
+				  SNDRV_CHMAP_FC, SNDRV_CHMAP_LFE,
+				  SNDRV_CHMAP_RL, SNDRV_CHMAP_RR,
+				  SNDRV_CHMAP_UNKNOWN, SNDRV_CHMAP_UNKNOWN } },
 	{ }
 };
 
+static const struct snd_kcontrol_new usb6fire_pcm_spdif_controls[] = {
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", PLAYBACK, DEFAULT),
+		.info = usb6fire_pcm_spdif_info,
+		.get = usb6fire_pcm_spdif_default_get,
+		.put = usb6fire_pcm_spdif_default_put,
+	},
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", PLAYBACK, CON_MASK),
+		.access = SNDRV_CTL_ELEM_ACCESS_READ,
+		.info = usb6fire_pcm_spdif_info,
+		.get = usb6fire_pcm_spdif_mask_get,
+	},
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = SNDRV_CTL_NAME_IEC958("", PLAYBACK, SWITCH),
+		.info = snd_ctl_boolean_mono_info,
+		.get = usb6fire_pcm_spdif_switch_get,
+		.put = usb6fire_pcm_spdif_switch_put,
+	},
+};
+
 int usb6fire_pcm_init(struct sfire_chip *chip)
 {
 	int i;
@@ -652,6 +911,9 @@ int usb6fire_pcm_init(struct sfire_chip *chip)
 	rt->chip = chip;
 	rt->stream_state = STREAM_DISABLED;
 	rt->rate = ARRAY_SIZE(rates);
+	rt->spdif_switch = true;
+	rt->spdif_bits = IEC958_AES0_CON_NOT_COPYRIGHT |
+			IEC958_AES1_CON_GENERAL << 8;
 	init_waitqueue_head(&rt->stream_wait_queue);
 	mutex_init(&rt->stream_mutex);
 
@@ -688,7 +950,15 @@ int usb6fire_pcm_init(struct sfire_chip *chip)
 
 	chip->pcm = rt;
 
-	/* on error, rt is freed with the card */
+	/* on error, rt and the controls added so far are freed with the card */
+	for (i = 0; i < ARRAY_SIZE(usb6fire_pcm_spdif_controls); i++) {
+		ret = snd_ctl_add(chip->card,
+				snd_ctl_new1(&usb6fire_pcm_spdif_controls[i], rt));
+		if (ret < 0) {
+			dev_err(&chip->dev->dev, "cannot add S/PDIF control.\n");
+			return ret;
+		}
+	}
 	ret = snd_pcm_add_chmap_ctls(pcm, SNDRV_PCM_STREAM_PLAYBACK,
 			usb6fire_pcm_chmaps, OUT_N_CHANNELS, 0, NULL);
 	if (ret < 0) {
diff --git a/sound/usb/6fire/pcm.h b/sound/usb/6fire/pcm.h
index b586fe220..f1b867b9c 100644
--- a/sound/usb/6fire/pcm.h
+++ b/sound/usb/6fire/pcm.h
@@ -53,7 +53,12 @@ struct pcm_runtime {
 	int in_packet_size;
 	int out_packet_size;
 	int in_n_analog; /* number of analog channels soundcard sends */
-	int out_n_analog; /* number of analog channels soundcard receives */
+	int out_n_slots; /* 32-bit slots per frame the soundcard receives */
+	bool spdif_switch; /* "IEC958 Playback Switch" */
+	bool spdif_on; /* copy of spdif_switch, read at the start of each block */
+	unsigned int spdif_frame; /* position in the channel status block */
+	u8 spdif_status[24]; /* IEC 60958 channel status of the S/PDIF output */
+	u32 spdif_bits; /* status bytes 0 and 1, "IEC958 Playback Default" */
 
 	struct mutex stream_mutex;
 	u8 stream_state; /* one of STREAM_XXX (pcm.c) */
-- 
2.56.0

