Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED519255F28
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 01:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785893687; cv=none; b=A1d/Ttd7rRY+0HATAe7qzP3ugRT4+KMzY8m5GMVk3Nxzwuq7086yplzUewHMG7PGQRrjMix405iyJn9TJlw6hcUZl2LUkQ3IsQjZrNLiR6HcKvhG4nS5DIh3ZprPhf7RhvHG3qWzDb/d9iR9KfJbx2s7okzjHS6bRiJ5doyGDVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785893687; c=relaxed/simple;
	bh=6ggo468VqCJiBEAW/CY4gRyFscERZZi0d+FSNRqo7fM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sjAVjmt4BY/fixB7OODOp5cZvGDRS+hDMg1MQ0YLL/LTmJkSGHfmY5b0x+JLwJ/B/eYbsXcHvuw1/YOo52U+m3SJvxsV9dG8mnImPFa7CdmYAk5Kfl72TTidmboeKj7pvBJ4NiZLtbBFGbI375URzhVmxWAJGTQ+aGG6mGYA1V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com; spf=pass smtp.mailfrom=xbow.com; dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b=f5IG8uNz; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xbow.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b="f5IG8uNz"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso367067a91.1
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 18:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xbow.com; s=google; t=1785893685; x=1786498485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4cYrPAdGr78t7YkoLwcMiDz4Rg7VzdKjNoh6ElfleWU=;
        b=f5IG8uNzFilA+bx40PllHgen6xCmvCxpPtA5YGpIpz0e/ltOqlvTkHxL2IO35l0Gwb
         ICLo0tlLQ0zJEuiliXsoX9dYAChX9rZDREoueg/RBIGkanujl+uKZrC3wXVwbrDKv/Ua
         oUpeMJF5dwLHmyc8cbHyenvtqBv+7viuTB2UCqy++MzV7H70CHMD6d7CGngZ8N8fmIHU
         f2PoOWaxVfbwOmklUTxI24901jJp0Y7VKAR/sK2sP5CN4N4zeHPu7Jzak2E+ISJW2AJD
         HudQPn7ALTxL//rdvXHIeLMcTQDz7F6G5qTOhcXxthZigqla24PMVMaK0NYsD2b/AE7t
         zafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785893685; x=1786498485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4cYrPAdGr78t7YkoLwcMiDz4Rg7VzdKjNoh6ElfleWU=;
        b=ho5/t0ArM8KuDTvzDL53igsqkMKDCi0UxC9P1N4EeXr4SdvEU3hn2hjyooRCzzL+yg
         hLpQBat9aqjKS6zpcBmwzumlcmKbGaK9u8pPShKb5V3cD++rBqD/KgRSz2NEhOLWOPHo
         wlXK9mxJBsfRgK8ep21tT4M+oCUQh7VxSwQjhJNkmi6Bse1TDk97vYvTDzUDGb2ZkBHa
         B6QUGXiuDsgD+XoSV2EKWzf+sCUrYcpXxza1oYfc+Ik87sTRAtjaT+oVz4YxDsS0UXOa
         M2jLunrwQHnshoEj3zfqWt+yrlI/AuQWJ0nCng+4LjF0OB/yyRZQjP/4djGhxzdG5QGH
         s4dA==
X-Gm-Message-State: AOJu0Yzw+vqlz/dR72/wsi8FiB+1G7YkKDWWvWet/w/wS/T1SXz599Eq
	RbasBRTFR+IUbqQ0uuNUxsLbgHzU9CGp00kLQ4xG3MTpi7GllOUXGO5fD+4JSO31RYg=
X-Gm-Gg: AR+sD103FCiuWmLSrVXvl/n2jL3mwXYQKnFliQjuo/R3oZACCa6mag/veWLxjvmKDL/
	46gg8u/iwQhEW4RXnb3s1tVcuvtI/ZKY9lldxFseCZYAxvpHkbT/aaYbpyCLc6IEFqp6bAfeYh1
	2p8LlJ7SdkSPyqzYjtnwV/I5r0OGMiUIKaCIKSV6Gcn/riP3XhuYZEqIr5aP+rjbiC54pWsMDUR
	ZVG94T0fKQn4PZ04PEv/5yiwZTqAuU447ND7UmIgH1ifstSp26sakDGLjBRDwgVJwU7JpxF74H1
	cmYyvQsTZvtxMxwj6YtboWaImjjTU9bIe3n3edm7F7ANg0dJiayfT94wJSDuYON7M51L4T+dq8J
	Oh6AC+RL4mtq02ac2caNVl+5C95HbrquCuQ0ZizUnedDfBCk5xcGGtedKzIj/32tnOGuh9axg1B
	4kRJCuq7Tz0VvKm+xAEfR7UIyMya8igd93Di228jkQ8NBDC5l8BdiEZZHeEPpFKA+g4ScVqR87C
	G20VAAItf/FERCIlK4uNFIzeq/VBhdhuCcAqkM=
X-Received: by 2002:a17:90b:5823:b0:38e:485c:ebd3 with SMTP id 98e67ed59e1d1-3903c5b727cmr3065888a91.15.1785893685187;
        Tue, 04 Aug 2026 18:34:45 -0700 (PDT)
Received: from Mac.lan ([125.128.148.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903d2f9807sm545246a91.1.2026.08.04.18.34.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 04 Aug 2026 18:34:44 -0700 (PDT)
From: Baul Lee <baul.lee@xbow.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	federico.kirschbaum@xbow.com,
	stable@vger.kernel.org,
	Baul Lee <baul.lee@xbow.com>
Subject: [PATCH] ALSA: usb-audio: fix OOB write on Type II inbound URBs
Date: Wed,  5 Aug 2026 10:34:41 +0900
Message-ID: <20260805013441.38245-1-baul.lee@xbow.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

data_ep_set_params() sizes each URB transfer buffer before it adds the
Format Type II transfer delimiter:

	u->packets = urb_packs;
	u->buffer_size = maxsize * u->packets;

	if (fmt->fmt_type == UAC_FORMAT_TYPE_II)
		u->packets++; /* for transfer delimiter */
	u->urb = usb_alloc_urb(u->packets, GFP_KERNEL);

buffer_size is computed from the pre-increment packet count and never
recomputed, so for a Type II endpoint the buffer is one packet short of
the packet count the URB is built with.

prepare_inbound_urb() then lays out one iso frame per packet and never
consults buffer_size:

	offs = 0;
	for (i = 0; i < urb_ctx->packets; i++) {
		urb->iso_frame_desc[i].offset = offs;
		urb->iso_frame_desc[i].length = ep->curpacksize;
		offs += ep->curpacksize;
	}

	urb->transfer_buffer_length = offs;
	urb->number_of_packets = urb_ctx->packets;

The last descriptor therefore points one packet past the end of the
transfer buffer, where the host controller writes device data on every
inbound transfer.  prepare_silent_urb() and prepare_playback_urb() bound
their fill loops by ctx->buffer_size, so only capture is affected.

fmt_type comes from the device's audio streaming descriptors, so any
device advertising a Type II capture format hits this once userspace sets
hw_params on the stream.

KASAN on 7.2.0-rc5 (arm64) with a dummy_hcd/raw-gadget device, one report
per inbound transfer:

  BUG: KASAN: slab-out-of-bounds in dummy_timer
  Write of size 64 at addr ffff0000186171c0 by task cons02/166
   __asan_memcpy
   dummy_timer
   hrtimer_run_softirq
  Allocated by task 166:
   usb_alloc_coherent
   snd_usb_endpoint_set_params
  The buggy address is located 0 bytes to the right of
   allocated 64-byte region [ffff000018617180, ffff0000186171c0)

Compute buffer_size after the delimiter packet has been accounted for,
and bound the fill loop by buffer_size, as prepare_silent_urb() already
does on the outbound side.  This grows every Type II URB allocation by
one maxsize packet.

Discovered by XBOW, triaged by Baul Lee <baul.lee@xbow.com>

Fixes: 8fdff6a319e7 ("ALSA: snd-usb: implement new endpoint streaming model")
Reported-by: Federico Kirschbaum <federico.kirschbaum@xbow.com>
Reported-by: Baul Lee <baul.lee@xbow.com>
Cc: stable@vger.kernel.org
Signed-off-by: Baul Lee <baul.lee@xbow.com>
---
 sound/usb/endpoint.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index dca06ba1c67e..a1d449f2a342 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -385,13 +385,15 @@ static int prepare_inbound_urb(struct snd_usb_endpoint *ep,
 	case SND_USB_ENDPOINT_TYPE_DATA:
 		offs = 0;
 		for (i = 0; i < urb_ctx->packets; i++) {
+			if (offs + ep->curpacksize > urb_ctx->buffer_size)
+				break;
 			urb->iso_frame_desc[i].offset = offs;
 			urb->iso_frame_desc[i].length = ep->curpacksize;
 			offs += ep->curpacksize;
 		}
 
 		urb->transfer_buffer_length = offs;
-		urb->number_of_packets = urb_ctx->packets;
+		urb->number_of_packets = i;
 		break;
 
 	case SND_USB_ENDPOINT_TYPE_SYNC:
@@ -1243,10 +1245,10 @@ static int data_ep_set_params(struct snd_usb_endpoint *ep)
 		u->index = i;
 		u->ep = ep;
 		u->packets = urb_packs;
-		u->buffer_size = maxsize * u->packets;
 
 		if (fmt->fmt_type == UAC_FORMAT_TYPE_II)
 			u->packets++; /* for transfer delimiter */
+		u->buffer_size = maxsize * u->packets;
 		u->urb = usb_alloc_urb(u->packets, GFP_KERNEL);
 		if (!u->urb)
 			goto out_of_memory;
-- 
2.50.1 (Apple Git-155)

