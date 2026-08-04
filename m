Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10255350A18
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 12:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846991; cv=none; b=a7bT63AaCdi4g1beqQuxs3gUNz2ce7C3B80uhb5HP5y7Sf/Hb4nf0wpyotdPAVkUs8EzRritj/jEU4ce/mpfDmAJGJH0BOpSKCSjJjJAWZPpWevqArQ/nx+jBNh1maglYeMQh5yHMLZ6D6RyMDMUaE4y74ae3d8HcWvdhKtqb94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846991; c=relaxed/simple;
	bh=qdKlKt8kJjdbNrzJ/8qfOj944+aR/pnvQRy8cOYbRtg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D6AHDYG7pH0Zj2haTQwV0c7ltXEe2WOGzNUKgv6Nj7TkLwBDhRvKPcBeGFJ2vbrhft5Wpn7vT3S2NhfQJntoGQ49FXR1YWkfN4AYXjIe7Oq1rPbkrQDvtxIeZ+SSl+OmGkJ5Ip+/7i1IopghXgrQnDUVwES8BUoz9BHUxY8xBlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com; spf=pass smtp.mailfrom=xbow.com; dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b=FR4M3N/i; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xbow.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b="FR4M3N/i"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84830c774a0so4338918b3a.1
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 05:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xbow.com; s=google; t=1785846989; x=1786451789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dj+8Zmnm9THrVgODI37CW20tmyKBnrbsYCd2US+H4fo=;
        b=FR4M3N/irA5d0UbJrk6Ml8EOKz6KbMjP2KoPeHq4AFRUyBfvPW88oVV9o72PN9gYdT
         O0BfAxayQVS2RszHz7S+DBnUA+Gq2W9A/JDen8LYF5yELB77Y43kZCiA7wBnwu8Mjdx6
         TbI9OS05FW2bDp3P85u1MpXGf9LPFMCQNa42aY2J1pt1Tu0Ic6OvBFDsG8U/pyfpB3g6
         28gUp0Rn2sa5+HqysKa0Ybk+EMrJj14sjVBPtBFgf4IfqRYp3ICNYojoddTovQKYUCgz
         FS9v6xiBzFP0RcmEqJBh5wCrOqp9Vwa/IjjFXQ8FnwlsVpFKbis9d9e3mGO5U3HCnxFl
         oHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846989; x=1786451789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dj+8Zmnm9THrVgODI37CW20tmyKBnrbsYCd2US+H4fo=;
        b=KG/gZoZQ8yNppecyJ40sRAkYDBfOKUbLKNpwlU9v4u9WB1ByQFtbhRC3cyuU1PcA11
         GaHYEKJ5zvaBPuf2Yiv4SZ/HzsC3hCFFE+72D6LyLgYnzumgva99b8s+VCgsE1EZSzV1
         Po0Lk645hpd7HcPJzDq+kDod7A4tc99vro4/pZ/2JVe4NQ/ymSKATiSU+AFDn9xc+Dqd
         tBFRrUQurpE1yFsnEF/B+t9831Ef2+GtCGZM470X1wWYsdcMByYtbR8WP6sz9jTYZnH0
         lMOMefref6fGKO4J0ITcjtZv4h9yC41tXrvzlKA+n8xqzMvHiUPoCKppKKAbHIL+h5BS
         p5HQ==
X-Forwarded-Encrypted: i=1; AHgh+RoPnivwsz0yCVWBJetZEpvKRfcRZYk++ZWTHTS9Ri2lMxbaHDp7vLjbTWqlFFn+y2jTdObm2pqFE1Ip1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIMszB9dyiwUaWWT4lFWWL4BTTITURIalgaGnWsmy19zuDAoFS
	ls6rUqvZfExo/do0GZrZbWizhjjD2Dcwczz5YypYA6glj0zID6dy/XmA/sPCz2NB9HY=
X-Gm-Gg: AR+sD11JBrXbrN2BY6IxwgWOpR6/76owygpM8ay0a4yrHGcEsND8FkZihY/hryjb/sU
	YX3klXatxBaN7Wkhc2BKDx38LrSX5nPae/l02wrKuop2jWTRNT33ICUEJfPKZJsw6O17H6hmeNI
	VRZkFeU2GGhSH7wZqH3eRxSshPywJAj7I+Y4CtNH014pmmzxVTkxW8zuDys9LzJ9dk00q9YHWAw
	VSmlbhJVt+Trgc35LO7oK6jbdHtuy26gKtFmG1xx2D9rOUeW8Z6VWAUP6psKI9STFnjMIXEHwrn
	XK/iEVwTxB6AZ5+8RZ1yqLbHo7QVsiqaGbiU9oQt/uLU1TG+EI9ap8+0MA5tbSpFiaRiB3n0FCn
	Nvyi0pxjIGOyWmi7k/R0GCNvqEGa1b1AIqec79OeT1vNxKQRxyJ2mXUeGCRO4Dx6uQSEZcqGbxy
	f4/GE8Ta9qQkW+pPYPzHvvRRx3L7gNjhlHVm2vW9dQD2ErYvdfGEubrWlIS323tb20X9pyVRZ6v
	P4qPf6o+R7tRawuweFghaxg/eJg7qjFV0D0hfI=
X-Received: by 2002:a05:6a00:1910:b0:848:425a:4e31 with SMTP id d2e1a72fcca58-84ee47e7b44mr13086355b3a.24.1785846989298;
        Tue, 04 Aug 2026 05:36:29 -0700 (PDT)
Received: from Mac.lan ([125.128.148.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d7b97sm5216205b3a.43.2026.08.04.05.36.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 04 Aug 2026 05:36:28 -0700 (PDT)
From: Baul Lee <baul.lee@xbow.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: ramiserifpersia@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	federico.kirschbaum@xbow.com,
	stable@vger.kernel.org,
	Baul Lee <baul.lee@xbow.com>
Subject: [PATCH] ALSA: us144mkii: re-anchor capture URBs on resubmission
Date: Tue,  4 Aug 2026 21:36:25 +0900
Message-ID: <20260804123625.91769-1-baul.lee@xbow.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

capture_urb_complete() resubmits each capture URB without anchoring it:

	usb_get_urb(urb);
	ret = usb_submit_urb(urb, GFP_ATOMIC);

Anchoring is a property of a submission, not of the URB.  The giveback
path calls usb_unanchor_urb() before urb->complete(), so an URB
resubmitted from its own completion handler is off the anchor.  The
capture URBs are anchored once, at stream start, so from the first
completion onward tascam->capture_anchor is empty.

tascam_free_urbs(), tascam_disconnect(), tascam_suspend() and the
stop-work path all call usb_kill_anchored_urbs(&tascam->capture_anchor)
to reap the capture URBs before anything is freed.  With the anchor empty
those calls return immediately and the URBs stay queued on the host
controller.

tascam_free_urbs() then returns the capture transfer buffers with
usb_free_coherent(), and snd_card_free() releases the snd_card
allocation that embeds tascam (card->private_data).  The controller
completes the queued URBs afterwards, writing device-supplied data into
the freed transfer buffer, and capture_urb_complete() dereferences the
freed driver object.

KASAN on 7.2.0-rc5 (arm64):

  BUG: KASAN: slab-use-after-free in dummy_timer
  Write of size 512 at addr ffff000015b62000
   __asan_memcpy
   dummy_timer
   hrtimer_run_softirq
  Allocated by task 64:
   usb_alloc_coherent
   tascam_alloc_urbs
   tascam_probe
  Freed by task 170:
   usb_free_coherent
   tascam_free_urbs
   tascam_disconnect
   usb_unbind_interface

  BUG: KASAN: slab-use-after-free in capture_urb_complete
  Read of size 4 at addr ffff0000170ee878
  Freed by task 170:
   release_card_device
   snd_card_free
   tascam_disconnect

Restore the usb_anchor_urb() between the reference count bump and the
resubmission.  That also makes the handler's usb_unanchor_urb() failure
arm meaningful again and restores usb_kill_anchored_urbs() as a barrier
on the disconnect, suspend and stop-work paths.

The anchoring was removed on the premise that the URB is already anchored
from the initial submission, which does not hold once the first giveback
has run.

Discovered by XBOW, triaged by Baul Lee <baul.lee@xbow.com>

Fixes: 5cff1529a2f9 ("ALSA: us144mkii: capture_urb_complete: redundant usb_anchor_urb corrupts anchor list on each resubmission")
Reported-by: Federico Kirschbaum <federico.kirschbaum@xbow.com>
Reported-by: Baul Lee <baul.lee@xbow.com>
Cc: stable@vger.kernel.org
Signed-off-by: Baul Lee <baul.lee@xbow.com>
---
 sound/usb/usx2y/us144mkii_capture.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/usx2y/us144mkii_capture.c b/sound/usb/usx2y/us144mkii_capture.c
index fa01da98151a..d7cdf9e0f685 100644
--- a/sound/usb/usx2y/us144mkii_capture.c
+++ b/sound/usb/usx2y/us144mkii_capture.c
@@ -302,6 +302,7 @@ void capture_urb_complete(struct urb *urb)
 	}
 
 	usb_get_urb(urb);
+	usb_anchor_urb(urb, &tascam->capture_anchor);
 	ret = usb_submit_urb(urb, GFP_ATOMIC);
 	if (ret < 0) {
 		dev_err_ratelimited(tascam->card->dev,
-- 
2.50.1 (Apple Git-155)

