Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153A818A93F
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 01:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785893670; cv=none; b=jOJJh95WOfqcLV12+iIMEmvw36DQfIhOfBpNd/ARBgxvb8jv6Oe5WDembln9B8ewaCQNl4QToq99I+Eb998RVB9tNQ7RBrMgJHCNYjc3bOK888FKaodq39BjP0/DqsFV4udFmq35U4VEfgLNR5ZysBijuySlIU2LTdzqqWjNAe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785893670; c=relaxed/simple;
	bh=ZjGLWnBgJdXztCi0+eXsQfANXaD3thG2wKtA52T+ocw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l3DNlHc1a2DYDkeQmhiWqo5xDdUHJhPTKCalDRDuyjcmB5eZiooVxjIgKhSeDptQ7c9RVo0lNqtvsYX+oY+1UIamOeB2SN65eOOP56T8jF/uGCxQo1iNnomN9qcNg4uiGdb6tod4xApNGoy6jUR2UpvC1xO8L2E31K8H+i9AIo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com; spf=pass smtp.mailfrom=xbow.com; dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b=AJ+itnPq; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xbow.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b="AJ+itnPq"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caed617615so6467055ad.3
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 18:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xbow.com; s=google; t=1785893668; x=1786498468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5bztIpYgBFdztufOLC4DVVQmB06rOwDY249Dx0zbrkI=;
        b=AJ+itnPqAXORxylrcM7uT3rtcMGqSdtYgvv8UvOyFQ4Qb5Um+7JZN6rNWihZj6C6pw
         nSJccEiU2bjds4GCfskMYI5i2PS6zAGhmPIUrhPau5l7C/R6VBPSn3tx7n/6LQWnZJHx
         pp5V0b6/9DgmaKOIjH35NN3iNIBBkzQKz8ZuAaFzTPDQs01BTu+XhVEBasp60kAEy7k4
         /5P1J+zH5kFhNVbpuq/hXHRM1tW//ybN+0W5cRNAuaW4a/twzDPPcoQghwbmWQAfZy6r
         W1KLyFs6UCNVE8gZ8vAGCqh0w+H4HVaShvMDDEO1kgQNmpMb5Ewdj5sICCGPNrBgSdH4
         OY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785893668; x=1786498468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bztIpYgBFdztufOLC4DVVQmB06rOwDY249Dx0zbrkI=;
        b=rZT3YSf7a+P13Nod6pxeUIfGWWAv19VrIjja7zzR3lwFCAGXil1qxmcengBRR2WMh9
         UOPBzOROptLp4VGeIi9eZAaRkHRdC6XTxRk6fJ49o1dl3B6QvYPjyN2srNXDso/M63Vm
         iMV+W6eRvG0VwKMSNI4qBAicdJZ3oGgalMLGACh+st5veelLw5Nds0ieGvuMdkU+A/bv
         lV1Wbw8BWREt1WWR8IZexCXKVM8Nt9eYJ4KScsaE5V2tw4sx1ZjJTM4zvJ2xyMCDYtTS
         wpqOAqsuwfiwHr+b80W5A9o69WsOhY8IVhxJHMsUsohHu7fcZ80+LS6Ta4ziG2hiVTJf
         GEBQ==
X-Gm-Message-State: AOJu0YyFpYifo2srO/iMaiier+F/KjYtm0WHJOJosfH0RFEqpvqEy3Yq
	Y3wOk32CqyuQYwMoJepYC6+BXXmiFsgjrb9+J2Pui1enxdUQKDUCqfwUqbffN6RwpRQ=
X-Gm-Gg: AR+sD11PhwiwIVBj0fqIUzUKn1xamcHExG6Gl5hA3511sLc+cK+jmaesKPgaRgCv1mE
	49WpPAWADScDp9JyoMm9LnJ+69GlijHWPDYUwhcM+8FD/0S95FB8zjb/z1Z068iZZS9w/NFI8aP
	tV+62OZ87tzb6iEoBKRi20A3TQoKpKLTaBHP4PlVYUos/CFItvjn3EugcTg20DVjT8BcWQ0t3fL
	s1szrxMkBx1dp7Yfi8PZXYNIicS3wFSrU3syhmDyM5jSsDSE8DnNsv4EVyzDBKS+Up+qOHtA2cs
	IBXlwrqYXkeoWdMA+QfshSHUts2kU1hZ2TfSMUXuCJqXM7n+JL2XvwN8W8K8hI2ZKCEsDnxy4BB
	NcrgF948jjwsZJTw4Zso6qxW0SEpukoUDZfSM4ZyQ90ZB4+Ht4kQzDaCdPCaqaPZPFHii0prcow
	X9JQesoHAsLTmNShr1lJoCuY/V2FWEmVfsqG397ZLuPnAq6K3T07fje/YMavurUUCKSP0B/3Ept
	EwL5jnxsjdqepod1cQ/fK+5Px4S
X-Received: by 2002:a05:6300:670b:b0:3c0:ac0f:6558 with SMTP id adf61e73a8af0-3cb85e99259mr3406754637.2.1785893668375;
        Tue, 04 Aug 2026 18:34:28 -0700 (PDT)
Received: from Mac.lan ([125.128.148.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe707f037dsm457614a12.12.2026.08.04.18.34.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 04 Aug 2026 18:34:28 -0700 (PDT)
From: Baul Lee <baul.lee@xbow.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	federico.kirschbaum@xbow.com,
	stable@vger.kernel.org,
	Baul Lee <baul.lee@xbow.com>
Subject: [PATCH] ALSA: 6fire: bound the MIDI event length from the device
Date: Wed,  5 Aug 2026 10:34:23 +0900
Message-ID: <20260805013423.38175-1-baul.lee@xbow.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb6fire_comm_receiver_handler() forwards a MIDI event using a length
byte the device supplies, with no bound and no check that the transfer
delivered that many bytes:

	if (!urb->status) {
		if (rt->receiver_buffer[0] == 0x10) /* midi in event */
			if (midi_rt)
				midi_rt->in_received(midi_rt,
						rt->receiver_buffer + 2,
						rt->receiver_buffer[1]);
	}

receiver_buffer is a 64-byte kzalloc() buffer (COMM_RECEIVER_BUFSIZE), so
only 62 bytes follow the two-byte header.  receiver_buffer[1] is a u8 the
device chooses, so a device that answers with 0x10 and a length of 0xFF
makes snd_rawmidi_receive() read 255 bytes starting two bytes into a
64-byte object.  The bytes past the buffer are handed to userspace
through the rawmidi read path.

urb->actual_length is not consulted either, so a short transfer leaves
both the type byte and the length byte at their previous values and the
handler acts on stale data.

The receiver URB is submitted from usb6fire_comm_init() at probe, so the
read happens on plug with no user action; forwarding to userspace also
needs a MIDI input substream open, since usb6fire_midi_in_received()
only calls snd_rawmidi_receive() when rt->in is set.

KASAN on 7.2.0-rc5 (arm64), single packet from an emulated device:

  BUG: KASAN: slab-out-of-bounds in snd_rawmidi_receive
  Read of size 255 at addr ffff000009f64682 by task bash/183
   __asan_memcpy
   snd_rawmidi_receive
   usb6fire_midi_in_received [snd_usb_6fire]
   usb6fire_comm_receiver_handler [snd_usb_6fire]
  Allocated by task 11:
   usb6fire_comm_init [snd_usb_6fire]
   usb6fire_chip_probe [snd_usb_6fire]
  The buggy address is located 2 bytes inside of
   allocated 64-byte region [ffff000009f64680, ffff000009f646c0)

Reject the event when the length exceeds the bytes that follow the
header, and require the transfer to have delivered the header plus that
many bytes.  The receiver URB is submitted with a 64-byte
transfer_buffer_length, so a genuine device cannot deliver an event
longer than those 62 bytes and nothing valid is dropped.

Discovered by XBOW, triaged by Baul Lee <baul.lee@xbow.com>

Fixes: c6d43ba816d1 ("ALSA: usb/6fire - Driver for TerraTec DMX 6Fire USB")
Reported-by: Federico Kirschbaum <federico.kirschbaum@xbow.com>
Reported-by: Baul Lee <baul.lee@xbow.com>
Cc: stable@vger.kernel.org
Signed-off-by: Baul Lee <baul.lee@xbow.com>
---
 sound/usb/6fire/comm.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/usb/6fire/comm.c b/sound/usb/6fire/comm.c
index 9a0b85653c61..d3b7cab85699 100644
--- a/sound/usb/6fire/comm.c
+++ b/sound/usb/6fire/comm.c
@@ -33,17 +33,20 @@ static void usb6fire_comm_init_urb(struct comm_runtime *rt, struct urb *urb,
 static void usb6fire_comm_receiver_handler(struct urb *urb)
 {
 	struct comm_runtime *rt = urb->context;
 	struct midi_runtime *midi_rt = rt->chip->midi;
 
 	if (!urb->status) {
-		if (rt->receiver_buffer[0] == 0x10) /* midi in event */
+		u8 len = rt->receiver_buffer[1];
+
+		if (rt->receiver_buffer[0] == 0x10 && /* midi in event */
+		    len <= COMM_RECEIVER_BUFSIZE - 2 &&
+		    urb->actual_length >= len + 2)
 			if (midi_rt)
 				midi_rt->in_received(midi_rt,
-						rt->receiver_buffer + 2,
-						rt->receiver_buffer[1]);
+						rt->receiver_buffer + 2, len);
 	}
 
 	if (!rt->chip->shutdown) {
 		urb->status = 0;
 		urb->actual_length = 0;
 		if (usb_submit_urb(urb, GFP_ATOMIC) < 0)
-- 
2.50.1 (Apple Git-155)

