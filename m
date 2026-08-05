Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5152F9984
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 01:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785893675; cv=none; b=LvEOv4t4cCmlK7htnAVlEtHWPyjw9fwe9Ci7zxDh9Ox15IoWs/XC3wiZHlLtZSvwVIu7urJLhJ7fN3asE+THI1ygTHE6b1ak3iql1ZwXsPZvKqVILTFL4yIfpRXbx6fypVWnT7n1S6wU1DHI4g66mUH7x7mmPSAzNM2XuIA70oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785893675; c=relaxed/simple;
	bh=q823u0njtz+m4plilGlEDplQii7ULrveeIHxp0K8UO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tdDXkBQIGh2DTdM4y+E3ZjPdjmET3EJNQ7c7K3pYI4jyvU4qkbD5vYRZzA+KvY1ZNRkF9dry4wLirHXSgMDijlUBojTaCtL/lhxDnn+e6NUOrwpUacT4tshDgOi7U93K9GcOy9rmtQmDiHtLKExnmjphvFaOs7qBISe2lwoceEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com; spf=pass smtp.mailfrom=xbow.com; dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b=LHIMfK77; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xbow.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b="LHIMfK77"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so466934a91.0
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 18:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xbow.com; s=google; t=1785893673; x=1786498473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xXEGsu4DseU9TknSOGMT/FiZusk6YuzDKEuFzSC1RE4=;
        b=LHIMfK77h/WeRlW09yE0DPKXj3wt7m81Ivf0rXahzC3qlHi/jVuWRs24m9yk3UF7rZ
         mcizCeZuWzCTK6jn37PrLgO/vBp2rdoyJIff44Eo3Uu0jyHHsdhtPJS6asfm+Cq5NnZO
         Vn7YWfVUG06oXhg1WkhvNULlR4BVGy1BLhjaFCDB6IyAHOd+XCzM8tD0zV+K1Zt4go5Y
         vJXSlZ3ayDLQRtCoshGCJQqCLnS11UdV+hKx2FHyej1cPeBy6jGh6UCiFWiUxa1mWka6
         iCC+EXl5n4fDWwL4hbdL4hptMkAGddf3KYX5bEV+hjfNnXoxXXh7Nz67MsXnnarkx6se
         oUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785893673; x=1786498473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xXEGsu4DseU9TknSOGMT/FiZusk6YuzDKEuFzSC1RE4=;
        b=AFv/8NbeFI5X0z2qGl1YZHuR5qgFrYeCRsWG/S7AL9waD/gs8Yjgl/kpAc2/WUZdj8
         WIVvwr2ArBJl9O/K/4WFH6ncolQvsG3NimVVlyZpzQtQfuDLatAwbsFh/hHOUuw3v/Fw
         n3/HqJxgaGjOIhYJ1nbEZ0IfEpmnwvlbDY+BVGhWZExp2z8bbAZqN4K54I9nGusZM4MI
         kaW0JzwEJCkVQnyta7yuoKL4KNbee5uYe0RhtGB+oD5/yoDqhYa6UNYdGwr1VPQm6M7A
         mKlfQNAeCkauQVPQRGKiL2JrqRFSUDQhwSHOwtNScLZzhj2wxcoDxNWwMVcwtuzZTNQe
         YF0Q==
X-Gm-Message-State: AOJu0YwsOOtsUa/H2PsxHlFIH3imxcim6BvIh/uKO8P7CubwRBVxBVCr
	CxxKiLclIRJLab9T0WTomc7DdeDZWrcgfT/V+OcXJeriYJjbD2E31ErUqUNNsBchqpM=
X-Gm-Gg: AR+sD13yyqKnOTfegiM3Hu7BxEON1a4wRP3m66uYIUO2cZt1jIYgkhk6DTMoeZsiCkM
	7hEby0sSQUnaTjHZP25G0N9xLlEG543mgu+tf5eCcwVzA6CoZ8jVjpPW//8YJdQNYyygw0yoZE3
	oG7pVZh1sdvChPUkJtnzc4zp6V014pl7P3pDJJEUJrpDQzBej/vP8cZ7oehNp/2GohQ5oZd5HX+
	GvUKlpGY1zd+KoX8PwBmHrZOEPm7qvaj38ufwaY8w/u2nJYGmK+/M8Qy4Pk4ivQuZZNY7CSn+JC
	8sNYLVhkFvxuPeNREzYupGHM9SLbtkkcBRUXmZb6V8YxRKkd7kmIkwRp79DCjgoD5A2M51/2Jvt
	9lOmNAzc/8uys2i6jMpfXgXrIaihBoayZDZMQlokZWZ0S9vBEHsOpeduwX5AcbrrjFe1GMuKbW6
	lei3XOK//pUd/l2X2DNSuu7jUKWOcWlXpmtQm7LD5oyZFWQc7VvVseiALm5NfNbs4s0vUU/mf29
	J6Lk2jWQzyYCeonUvscSI3bPWJ+
X-Received: by 2002:a17:90b:4c89:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-3903c5aefe9mr2806508a91.15.1785893672930;
        Tue, 04 Aug 2026 18:34:32 -0700 (PDT)
Received: from Mac.lan ([125.128.148.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903f61ef2esm472369a91.3.2026.08.04.18.34.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 04 Aug 2026 18:34:32 -0700 (PDT)
From: Baul Lee <baul.lee@xbow.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	federico.kirschbaum@xbow.com,
	stable@vger.kernel.org,
	Baul Lee <baul.lee@xbow.com>
Subject: [PATCH] ALSA: bcd2000: clear the URB pointers on disconnect
Date: Wed,  5 Aug 2026 10:34:28 +0900
Message-ID: <20260805013428.38204-1-baul.lee@xbow.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bcd2000_free_usb_related_resources() frees both URBs and leaves the
pointers behind:

	usb_kill_urb(bcd2k->midi_out_urb);
	usb_kill_urb(bcd2k->midi_in_urb);

	usb_free_urb(bcd2k->midi_out_urb);
	usb_free_urb(bcd2k->midi_in_urb);

The rawmidi device outlives that call.  A substream that is still open
when the device is unplugged reaches bcd2000_midi_send() from the
trigger path on close.  That function writes to the freed URB and then
hands it to the USB core:

	bcd2k->midi_out_urb->transfer_buffer_length = BUFSIZE;
	...
	ret = usb_submit_urb(bcd2k->midi_out_urb, GFP_ATOMIC);

usb_kill_urb() does not stop a later submission either, so a submit that
races the disconnect can requeue the URB after it has been reaped.
midi_in_urb is exposed the same way: bcd2000_input_complete() resubmits
it from the completion handler.

KASAN on 7.2.0-rc5 (arm64):

  BUG: KASAN: slab-use-after-free in bcd2000_midi_send [snd_bcd2000]
  Write of size 4 at addr ffff00001827d388 by task bpoc/168
   __asan_store4
   bcd2000_midi_send [snd_bcd2000]
   bcd2000_midi_output_trigger [snd_bcd2000]
   snd_rawmidi_kernel_write1
   close_substream.part.0
  Freed by task 168:
   usb_free_urb
   bcd2000_disconnect [snd_bcd2000]

  BUG: KASAN: slab-use-after-free in usb_submit_urb
  Read of size 8 at addr ffff00001827d3b8 by task bpoc/168

Clear both pointers after freeing and test them on the paths that can
still run.  Poison the URBs before freeing them: usb_poison_urb() waits
for a running completion handler and rejects any later submission, so
after it returns the input path is quiesced and only the rawmidi trigger
path can still reach bcd2000_midi_send().  No unpoison is needed; the
URBs are freed on the next line.

Discovered by XBOW, triaged by Baul Lee <baul.lee@xbow.com>

Fixes: b47a22290d58 ("ALSA: MIDI driver for Behringer BCD2000 USB device")
Reported-by: Federico Kirschbaum <federico.kirschbaum@xbow.com>
Reported-by: Baul Lee <baul.lee@xbow.com>
Cc: stable@vger.kernel.org
Signed-off-by: Baul Lee <baul.lee@xbow.com>
---
 sound/usb/bcd2000/bcd2000.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/usb/bcd2000/bcd2000.c b/sound/usb/bcd2000/bcd2000.c
index bebb48cb9abc..c5c542d17ccc 100644
--- a/sound/usb/bcd2000/bcd2000.c
+++ b/sound/usb/bcd2000/bcd2000.c
@@ -134,6 +134,9 @@ static void bcd2000_midi_send(struct bcd2000 *bcd2k)
 	if (!midi_out_substream)
 		return;
 
+	if (!bcd2k->midi_out_urb)
+		return;
+
 	/* copy command prefix bytes */
 	memcpy(bcd2k->midi_out_buf, device_cmd_prefix,
 		sizeof(device_cmd_prefix));
@@ -178,7 +181,7 @@ static int bcd2000_midi_output_close(struct snd_rawmidi_substream *substream)
 {
 	struct bcd2000 *bcd2k = substream->rmidi->private_data;
 
-	if (bcd2k->midi_out_active) {
+	if (bcd2k->midi_out_active && bcd2k->midi_out_urb) {
 		usb_kill_urb(bcd2k->midi_out_urb);
 		bcd2k->midi_out_active = 0;
 	}
@@ -348,11 +351,13 @@ static int bcd2000_init_midi(struct bcd2000 *bcd2k)
 static void bcd2000_free_usb_related_resources(struct bcd2000 *bcd2k,
 						struct usb_interface *interface)
 {
-	usb_kill_urb(bcd2k->midi_out_urb);
-	usb_kill_urb(bcd2k->midi_in_urb);
+	usb_poison_urb(bcd2k->midi_out_urb);
+	usb_poison_urb(bcd2k->midi_in_urb);
 
 	usb_free_urb(bcd2k->midi_out_urb);
 	usb_free_urb(bcd2k->midi_in_urb);
+	bcd2k->midi_out_urb = NULL;
+	bcd2k->midi_in_urb = NULL;
 
 	if (bcd2k->intf) {
 		usb_set_intfdata(bcd2k->intf, NULL);
-- 
2.50.1 (Apple Git-155)

