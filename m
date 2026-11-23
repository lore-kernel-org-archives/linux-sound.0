Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423745;
	b=jIqua4+OJzi9rTP6aoJ9j2X6mAg3BI9n3blZTwfd0eUONv80h700NwxcmFD53UQFdUlO
	 abQHm7c8ptEsu1q0/v24igbkBqpWtQwFHU2lRfEodIJkjcyeGAiO6M08PO0GPKIWb3sOL
	 IhGLhJJNS/13N65HGZanxTu0KgRFvs+ukKWjwG5QJlCy801yB5LIWt49cDHJypRwaVnZM
	 Y6L+Xe9qOXFFRC1kNO4DHmrlq7DnvlbUNjmTmE45aL5hO9X4lMg4aIQBuruNcgz7odXx9
	 C07j/pxMajRgxbeslNR6m2C7Kk2dR6f64FU15l6jj+fWplBAyMxL1jy6gExOrgkC5lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423745;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=5UC5NqbAgeY8hJ5v/pqmINB4KiOCUEtYaS0Huh0Opio=;
	b=eucaIhETcWcH2WxhFQQWCWqnUtk0qCUhiLZ1rLThheIendivdbf9vMPGNcMbMUAGfXZh
	 RX8hPA9jQcKsDX8TfhAwxhoP+wTkyL78DPxw69AYyc39JncG8PC2GfvAgMRdizpYbGZrg
	 JBB2XOgDiuPA3ahDXKxDPbs5OTK1vGuq7TI6HXbsRTkn33QVfhEJTynK3vM6Z4DGEZR6k
	 KMz+8v18l6a6Fu9DgyCljQwulI4IW8LDBX4MY/iAVWUYRSI32P5el2DtQoUVXCy7a5+BK
	 b2LUX4Mk2g7NSr01G0IfBmcpCkpkzPXL07mHcDXnDCMa3VoNaOaom4ugtEbE0r6sgnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=stu.xidian.edu.cn;
	spf=pass smtp.mailfrom=stu.xidian.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71CAF606A31A;
	Mon, 23 Nov 2026 08:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71CAF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=5UC5NqbAgeY8hJ5v/pqmINB4KiOCUEtYaS
	0Huh0Opio=; b=ISqkBow+ZmSGfP3mIAi60Azn1OczWKkttt6bmRk+YNC/LRFscV
	K2Mps/EueXhVsdTnNsQIxI87glAj5Dr2jUlSzk5qvMSu+NFtWK2r77sFig0UQJAU
	KaY3DxamnMCNjNC91W0q0GiTfTLlYv19V5obRlXohWMD3k06TFyQ46W1M=
Received: from user-virtual-machine.localdomain (unknown [113.200.174.33])
	by hzbj-edu-front-3.icoremail.net (Coremail) with UTF8SMTPA id BbQMCkC2ufzv_QNrKK0aAg--.14474S4;
	Mon, 23 Nov 2026 16:48:58 +0800 (CST)
From: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>
Subject: [PATCH 2/2] ALSA: 6fire: Don't resubmit an active PCM out URB
Date: Mon, 23 Nov 2026 16:48:46 +0800
Message-Id: <20261123084846.7700-3-25031212351@stu.xidian.edu.cn>
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
X-CM-TRANSID:BbQMCkC2ufzv_QNrKK0aAg--.14474S4
X-Coremail-Antispam: 1UD129KBjvJXoWxuF4kurWrWFWUWr4Uur17ZFb_yoW5uFWDpF
	Z5W3Z8GFykJan0ywsrJr4vva1rAan3Cay3Kw4fX3yYkr13Jw1SvasI9FW5KrWrAFykZFy7
	JF4jvrW5Gr45C37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPlb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26r4UJVWxJr1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcV
	AaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0E
	x4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x
	0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC2
	0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
	0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv2
	0xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2js
	IE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZF
	pf9x07jsl1kUUUUU=
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAQUFD2sDBVgdigAHsr

usb6fire_pcm_in_urb_handler() refills the playback URB paired with the
capture URB that has just completed and submits it unconditionally,
although the comment right above expects "a free out urb was found".
Both URBs carry the same number of isochronous packets and are rearmed
at the same time, so the playback URB can still be queued when the next
capture completion arrives.  The handler then rewrites a transfer buffer
that is still owned by the host controller and submits the active URB
again:

  URB 000000003ec29e65 submitted while active
  WARNING: drivers/usb/core/urb.c:379 at usb_submit_urb
  ...
  usb6fire_pcm_in_urb_handler
  __usb_hcd_giveback_urb
  ...

The resubmission fails and the playback data of that period is lost.
This is observed when the completion of the playback URB is delayed, for
example by missed isochronous services on the host controller.

Check whether the out URB has completed and skip it for the period
otherwise; the next capture completion retries.

Fixes: c6d43ba816d1 ("ALSA: usb/6fire - Driver for TerraTec DMX 6Fire USB")
Co-developed-by: Bin Yu <byu@xidian.edu.cn>
Signed-off-by: Bin Yu <byu@xidian.edu.cn>
Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
---
 sound/usb/6fire/pcm.c | 16 +++++++++++++++-
 sound/usb/6fire/pcm.h |  2 ++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/usb/6fire/pcm.c b/sound/usb/6fire/pcm.c
index f5dfb8c3096a..d6ef8ffa97a9 100644
--- a/sound/usb/6fire/pcm.c
+++ b/sound/usb/6fire/pcm.c
@@ -460,6 +460,15 @@ static void usb6fire_pcm_in_urb_handler(struct urb *usb_urb)
 	if (period_elapsed)
 		snd_pcm_period_elapsed(sub->instance);
 
+	/*
+	 * The out urb is submitted again from here, but the previous one may
+	 * still be queued in the HCD.  Its transfer buffer is owned by the
+	 * HCD until it completes, so skip it for this period and retry at
+	 * the next capture completion.
+	 */
+	if (atomic_xchg(&out_urb->active, 1))
+		goto submit_in;
+
 	/* setup out urb structure */
 	for (i = 0; i < PCM_N_PACKETS_PER_URB; i++) {
 		unsigned int frames = 0;
@@ -525,8 +534,11 @@ static void usb6fire_pcm_in_urb_handler(struct urb *usb_urb)
 	 * the frames of an out urb that was not submitted never reach the
 	 * transmitter; the next urb continues the block at the same position
 	 */
-	if (usb_submit_urb(out_urb->instance, GFP_ATOMIC) < 0)
+	if (usb_submit_urb(out_urb->instance, GFP_ATOMIC) < 0) {
 		rt->spdif_frame = spdif_frame;
+		atomic_set(&out_urb->active, 0);
+	}
+submit_in:
 	usb_submit_urb(in_urb->instance, GFP_ATOMIC);
 }
 
@@ -535,6 +547,8 @@ static void usb6fire_pcm_out_urb_handler(struct urb *usb_urb)
 	struct pcm_urb *urb = usb_urb->context;
 	struct pcm_runtime *rt = urb->chip->pcm;
 
+	atomic_set(&urb->active, 0);
+
 	if (rt->stream_state == STREAM_STARTING) {
 		rt->stream_wait_cond = true;
 		wake_up(&rt->stream_wait_queue);
diff --git a/sound/usb/6fire/pcm.h b/sound/usb/6fire/pcm.h
index f1b867b9c468..b5d1f5106d2c 100644
--- a/sound/usb/6fire/pcm.h
+++ b/sound/usb/6fire/pcm.h
@@ -28,6 +28,8 @@ struct pcm_urb {
 	u8 *buffer;
 
 	struct pcm_urb *peer;
+
+	atomic_t active; /* urb is queued in the HCD */
 };
 
 struct pcm_substream {
-- 
2.34.1

