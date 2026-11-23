Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423746;
	b=GQF9l5H6F824K4RlmYyR8/PTvMeEINetKqQUFsg1EG8CM5uxYbEy6sH1ufgfRqxTnuRv
	 T2vlw7Sla0PUJ4l4jA8CAzDRZ+cgbar0xhb1kLKRP4dmpilm17gCwFnfdSf5cjDRtKxGk
	 59hbc9NnqkUba65GoqdLhA/YCJ8gguFZrG62nNOHd2BJEraUvG61lgC16U5DJPlj3l+GM
	 9mulIjTTYI73IOvVBKORVep32aifP3u51wm+BiZF57de5HXZU0l89sGGooG1CS9rYBSda
	 VEOEUB21rVGM7+tRQacN9GgQAKkB8b/+VBaY15bthkc8m3cqMTdnUGBpIGkr/g6TTCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423746;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=tLrluSW3jrZY00az6/oW0bRer7Zth3LKmMHtAQlRENU=;
	b=qZSNnJpAHy2yZaFsVX5dVnppt5FOZIq8rlPJthRVdV3iuWu2AGO4FJoVdSrvjfQhdWca
	 wNZmZahpdrrRUBZjmeefBwYJjqvdoZ+YWraJGE6yw1TaYWH+Th4OAThIXitIkbSi4fmLA
	 zvRBiA/nBQFoxMxrqA1fwAzIT2HOnwlbXeriAhb1MOR1TecAkM+qCNyfZCJavGAAIHfdb
	 MvSQ68W1Ihrw7JfTOb7VZ5/XRn2P716c/mKT3qFfwmHWaDD/6TK36ksUV6wJmzyWIq0ne
	 IGUMWZA098ZsMT+3JAjN9/8B8nKiX5VZ1QP4lcV5HSWMKfa7hH09i7BkkFUT9EOmmFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=stu.xidian.edu.cn;
	spf=pass smtp.mailfrom=stu.xidian.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A66606A331;
	Mon, 23 Nov 2026 08:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1A66606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=tLrluSW3jrZY00az6/oW0bRer7Zth3LKmM
	HtAQlRENU=; b=4wEVsDc3QDMG8EiqDcDIwhsyDnJfDpxkGvaUcf4EwO1H/eH4Rw
	RV1CqD+Dn1s1z7dV3mi76Ey1zDJ8/tbSpeejo2pG7ATkhD3HVBfKhXFoOedb3g3u
	pN83/hzSNo7ChvEEefOSwwYperBrqqeDX+RSvIqCfe0SJtvfMgSQRiYjs=
Received: from user-virtual-machine.localdomain (unknown [113.200.174.33])
	by hzbj-edu-front-3.icoremail.net (Coremail) with UTF8SMTPA id BbQMCkC2ufzv_QNrKK0aAg--.14474S3;
	Mon, 23 Nov 2026 16:48:53 +0800 (CST)
From: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>
Subject: [PATCH 1/2] ALSA: 6fire: Don't resubmit an active MIDI URB
Date: Mon, 23 Nov 2026 16:48:45 +0800
Message-Id: <20261123084846.7700-2-25031212351@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123084846.7700-1-25031212351@stu.xidian.edu.cn>
References: <20261123084846.7700-1-25031212351@stu.xidian.edu.cn>
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
X-CM-TRANSID:BbQMCkC2ufzv_QNrKK0aAg--.14474S3
X-Coremail-Antispam: 1UD129KBjvJXoWxAr47WF47uFyxZryDZr4xZwb_yoW5uFWxpF
	ZYg3Z8KFZrJFn8Z3y7JF1rZFyFk3Z3Gay8CayI93s0yr45Jw1qqa1DKan8KrWrJFyF9FyU
	ZrWYvrZxGr45Gw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPlb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26r4UJVWxJr1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcV
	AaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0E
	x4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x
	0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC2
	0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
	0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv2
	0xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2js
	IE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZF
	pf9x07jrL0nUUUUU=
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAQUFD2sDBVgdigAGsq

The MIDI output keeps the transmission state in rt->out and submits
rt->out_urb from the rawmidi trigger callback.  Stopping the stream,
for example through the SNDRV_RAWMIDI_IOCTL_DROP ioctl, only clears
rt->out; the URB itself stays queued until the device has accepted the
pending data, which can take a while when the device delays the
transfer.

If the stream is started again before that happens, the trigger callback
passes the still-active URB to usb_submit_urb() a second time.  The USB
core rejects it and the new data is not sent:

  URB 00000000c6cd6557 submitted while active
  WARNING: drivers/usb/core/urb.c:379 at usb_submit_urb
  ...
  usb6fire_midi_out_trigger
  snd_rawmidi_kernel_write1
  ...
  usb 1-1: midi out urb submit failed: -16

Track whether the URB is queued separately from the substream that owns
it, and let the completion handler send the data queued by a restart
while the URB is still in flight.

Fixes: c6d43ba816d1 ("ALSA: usb/6fire - Driver for TerraTec DMX 6Fire USB")
Co-developed-by: Bin Yu <byu@xidian.edu.cn>
Signed-off-by: Bin Yu <byu@xidian.edu.cn>
Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
---
 sound/usb/6fire/midi.c | 21 +++++++++++++++++----
 sound/usb/6fire/midi.h |  1 +
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/sound/usb/6fire/midi.c b/sound/usb/6fire/midi.c
index 279b449936e7..ae8a0d48eb41 100644
--- a/sound/usb/6fire/midi.c
+++ b/sound/usb/6fire/midi.c
@@ -25,6 +25,7 @@ static void usb6fire_midi_out_handler(struct urb *urb)
 	int ret;
 
 	guard(spinlock_irqsave)(&rt->out_lock);
+	rt->out_urb_active = false;
 
 	if (rt->out) {
 		ret = snd_rawmidi_transmit(rt->out, rt->out_buffer + 4,
@@ -39,6 +40,8 @@ static void usb6fire_midi_out_handler(struct urb *urb)
 				dev_err(&urb->dev->dev,
 					"midi out urb submit failed: %d\n",
 					ret);
+			else
+				rt->out_urb_active = true;
 		} else /* no more data to transmit */
 			rt->out = NULL;
 	}
@@ -74,6 +77,14 @@ static void usb6fire_midi_out_trigger(
 		if (rt->out) /* we are already transmitting so just return */
 			return;
 
+		rt->out = alsa_sub;
+		/*
+		 * The urb is still in flight from the previous transmission;
+		 * the completion handler sends the queued data instead.
+		 */
+		if (rt->out_urb_active)
+			return;
+
 		ret = snd_rawmidi_transmit(alsa_sub, rt->out_buffer + 4,
 				MIDI_BUFSIZE - 4);
 		if (ret > 0) {
@@ -82,13 +93,15 @@ static void usb6fire_midi_out_trigger(
 			urb->transfer_buffer_length = ret + 4;
 
 			ret = usb_submit_urb(urb, GFP_ATOMIC);
-			if (ret < 0)
+			if (ret < 0) {
+				rt->out = NULL;
 				dev_err(&urb->dev->dev,
 					"midi out urb submit failed: %d\n",
 					ret);
-			else
-				rt->out = alsa_sub;
-		}
+			} else
+				rt->out_urb_active = true;
+		} else
+			rt->out = NULL;
 	} else if (rt->out == alsa_sub)
 		rt->out = NULL;
 }
diff --git a/sound/usb/6fire/midi.h b/sound/usb/6fire/midi.h
index 8716ab8a863a..221361442435 100644
--- a/sound/usb/6fire/midi.h
+++ b/sound/usb/6fire/midi.h
@@ -23,6 +23,7 @@ struct midi_runtime {
 	spinlock_t out_lock;
 	struct snd_rawmidi_substream *out;
 	struct urb *out_urb;
+	bool out_urb_active; /* out urb is still queued in the HCD */
 	u8 out_serial; /* serial number of out packet */
 	u8 *out_buffer;
 	int buffer_offset;
-- 
2.34.1

