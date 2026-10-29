Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793293036;
	b=ihBOcQbh3Jnc9eNHzWLwT/eX3yVYP7PEMWMxNUTHCpDuCZyzRg8bgu+b5eXMc9dG/i0Z
	 03bzJChHHJc6WLH7tt7YAm0LhA6mnAGgQ+xlLt56SOy8CS8FFcT+DhLk5qljOpfZjdUpd
	 qaV53xs8W+w+kEQMB6sM2ywFWk56omI23qGBBTMMMaoKBI5XyhMuJ50SNa9u17tNd7JPe
	 /o0lHeP00MFk3dJ1YeitdPSyjTJoDpKJnfyTZlwcqBJvblzXmBhhhsh7/hyLFIYSsiuh7
	 z1R/pjvsB1y3yCb7uWngdzyWSUSgHETLHqCnEE+TAQUVJB3kdHnvuVce8kZSbY1nZqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793293036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cyFkeSoD7QBapusNRRYnZYh0f6fgzoNNczOjrCuvgyY=;
	b=Pp/6UcrxP70LuI+2U+yxLabW1ncHOcXt2JcIXoCV7kT4NnDYmUkxH0WSuGQiVPLkcvUE
	 kIo/Dc79bv1yt4zysmEDCs9jMkLowxUSvWUinXPyfTc9oEd6NLnr4096nOOGJMXt0pe+S
	 zRoik4iDWvYhRhj0shodKz8lxr9kewp2lM7pKdGrbQU1wgJM0lV+xXs4pSCxbMRG6DRER
	 bwEivATBGnHJSH2gYkCRd3VzcpCUiNL4F5oryPpZ+zNy7OmnUHlakjme1kLb+V+o56QKx
	 D+iTUIObr9wdeQUckFLZV2dCjJyjr4z7emOuDHq8jD6uE5hMIs+vj/Bf4aWZVPBgsEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xbXFhVIF;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB43606A31E
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 16:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EB43606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xbXFhVIF
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1935850f8f.0
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 09:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793293034; x=1793897834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cyFkeSoD7QBapusNRRYnZYh0f6fgzoNNczOjrCuvgyY=;
        b=xbXFhVIFuwAjMEOiX7TC/apqjVa6tAuU4PZW8wem3ThjCpBNkEdcTMDzLHaRnGAYAh
         CHO/faPXG/1C8D+O8qkNyM8Dv8t/baf+a7v0WxUIHx+GIiczxqSrttFHVpKxva3NpbsQ
         oZrm4nI2RyCxC+hbh/U/T2GOq1oT+0ILNNybYGcPb1Yl8veboLvKCsuFcYSr+N4n++Mu
         7tmVPnNlSPGsaP3m6WBRtEx9+u2zMGIILTXxRrepMrZSgc1kv412BEr0verE2y8TQ3T3
         OacGGPdydqMJfY97A0J2yq5SpY0a8HcEqLM4Ob0whCAJTEO7t/kpAQmTz0Cok6QN/VgW
         hoog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793293034; x=1793897834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyFkeSoD7QBapusNRRYnZYh0f6fgzoNNczOjrCuvgyY=;
        b=m5lvs79F4javrKY/2Y/r0CTLMJ4+tszsQOJxLpTMz2XIJkdfD8ZAa8bjALSePiX+59
         8R5UQf9/6+bgefbkHZNNn8PjKNZrZDe/IuXH9OVhzz0A9Ikp19OTjfz6UWOqgdD4ruM+
         4WRIFTOfk49CcmCn1mlH8Z4Z40EUVGnWqYKPOXKQNTkzhFoBPoyEpfOocSM0lVO6VQaf
         c4v0Rv2RXFXdOkXaRBuxjoHTtK8yKUDn3NoWsyGltszeml0q8aD+XPOpCm/LMlNhE0Wk
         Fneyqegkx6bpC8+2BWqzpFutWuOiHXepanDGRDm/oWG+4LmFvKN7hYwFnQp8c9gekszw
         9YCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEj6t7+zQXZnrubd+RkNK6pXOKzw4Ik2XOAtcjxbQdxfssmkYiN935v1rvGyMaHQjJAj4hIEiwzQW9wA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIdt8UQtqL8VTauof1upu4AxgU6kJ620j8Vuh8+ggv0GlJbC83d
	EhPmPvNqR4NoSEbOpyZDFzkBk92bem4uavPYmTbBw7PAEakbTyXdj6cx
X-Gm-Gg: AYBFou2lRS0MBz/LiYXowZvQzvIvKs8IQjBPopNVYqkzfnDF+E04eGawojZItmwRIff
	vW3T/jBHnXBtEAvgzdFLW2IlDUYRKcf14IL5vx5vY+zXH+pjRKYQJgp5X744LFQ5q8egolvDrh6
	FoCdmunEOW00Ol8srpBf247vFXKiYoJuPamPceIlAK+1ZxmJaEsEWztwvf/2MD7W5acDUpcScur
	zmo5psZgMcCae/jYWQwHLgt9DJqFu+GKqsPJohRoaKe0y3u6uf4sWfp0vlMYPQTfS6Pc6cfdh8S
	ISGtneM5X82fCp+mg3FPiM1LEqrd59hhyhgC4LAncIcnn7Nh8btQn8KvR1ZwBmp/stcyn997q0m
	HfPNxePM50T7ih91mVu9VBWfW1Hx870vubKg6gpCdw7jyKZjEmXiEuo0pzozufVJ0RjC0l20mI/
	52wE4IIu1yaoOz6P0nWbnlkzPIWNDj5Yvt0uv1fNUNBsYkN5EatTOVT/g9JQZxyTNEDi//cbPPD
	74mlGY6G0gFUOCDhMymeEl38gveNncSpStgAkDFHxBGQWJnQpjg6ruc39ifs1CTlmQVOfXs5N6P
	p2K8nDlB4DrHB7WW1esrpj3NNtIBwJnfEZySkwcraMCzjCGCKSY=
X-Received: by 2002:a05:6000:2086:b0:48b:118e:7454 with SMTP id ffacd0b85a97d-48e5d5a45e2mr13646899f8f.31.1793293034323;
        Thu, 29 Oct 2026 09:57:14 -0700 (PDT)
Received: from stjepan-Aspire-F5-573G ([2a00:1bb8:118:d39e:4868:f22e:b51d:7cb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6dfac9d9sm325680f8f.44.2026.10.29.09.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:57:13 -0700 (PDT)
From: Stjepan Poljak <stjepan.poljak@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Clemens Ladisch <clemens@ladisch.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: don't resubmit MIDI URBs at once on -EPIPE
Date: Thu, 29 Oct 2026 17:57:01 +0100
Message-ID: <20261029165701.2004391-1-stjepan.poljak@gmail.com>
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

When a USB MIDI device answers with a stall, as a bus-powered keyboard
does while it is being switched off, snd_usbmidi_urb_error() falls
through to the default case: it logs "urb status -32" and returns 0, so
the completion handler resubmits the URB at once. That fails the same
way, so the URBs loop, logging every failure, until the disconnect is
processed.

On a Raspberry Pi 3B+ with a keyboard behind the onboard hub, that
disconnect is never processed. Printing to the framebuffer and serial
consoles holds the loop to about 250 messages a second, and all
interrupts are handled on CPU 0, so the hub's port change isn't handled:
the keyboard stays silent until it is replugged. With loglevel=3, the
same kernel processes the disconnect 0.04-0.24 s after the first error
and the keyboard works again.

Treat -EPIPE like the other errors seen while a device goes away: retry
from the error timer after ERROR_DELAY_JIFFIES, without a message. An
endpoint that is really halted wasn't cleared before either; it is now
retried every 100 ms instead of continuously.

Tested on the Raspberry Pi 3B+ (rpi-6.12.y, dwc_otg) with the default
console settings: after each off/on the disconnect is processed, the
keyboard re-enumerates and plays, and nothing is logged for the stall.

Assisted-by: LLM
Signed-off-by: Stjepan Poljak <stjepan.poljak@gmail.com>
---
This replaces "ALSA: usb-audio: reset a MIDI device whose input is stuck"
(v1: https://lore.kernel.org/linux-sound/20261026125751.1700779-1-stjepan.poljak@gmail.com/
 v2: <20261027152034.1871962-1-stjepan.poljak@gmail.com>). As Takashi
said, resetting the device was the wrong place to fix it. The disconnect
wasn't lost by the USB stack either: on mainline dwc2 and on dwc_otg
with loglevel=3, the same unpatched kernel gets it. It was this driver's
own resubmit loop starving the CPU that handles the interrupts.

The patch is against for-next; on the Pi I tested the same change on
rpi-6.12.y.

 sound/usb/midi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index e3d157554061..5604c3fdbe3b 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -194,10 +194,11 @@ static int snd_usbmidi_urb_error(const struct urb *urb)
 	case -ESHUTDOWN:
 	case -ENODEV:
 		return -ENODEV;
-	/* errors that might occur during unplugging */
+	/* errors that might occur during unplugging or switching off */
 	case -EPROTO:
 	case -ETIME:
 	case -EILSEQ:
+	case -EPIPE:
 		return -EIO;
 	default:
 		dev_err(&urb->dev->dev, "urb status %d\n", urb->status);

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
-- 
2.53.0

