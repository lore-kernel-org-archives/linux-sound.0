Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282F53EC829
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 07:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371808; cv=none; b=Qc73O7ZM1RfAiZKuSCVhtQ4LIbXy5e10l36j57gt7KdSpL6bfmsEzM6NF46v3L5iUJ/L50tYc9YNMH/v7rNHAIcE/7ozW6Mn2B3CdWHEv2+/ooryTJDq/HT13itgR0MLJJ5uQkVXcd6X7SU+iILQfG0NgG/9sTq4dkkjfab6KCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371808; c=relaxed/simple;
	bh=n7fu+Sb2mCNrOfYc1/FQ88AA21MaOhGsdcx1nVUoSyw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oTwcnw0Fs7Xx7M6gke5rDJJ8WgmGoB2zx3CExbQuMhB9N6xc+M+Qm0kyrYg3xoiQFdqCgmfzpTt1iXbl9x9NZNXWRnOlZrgSohH+XyNKYYriQf1NpX2mp3Qu85PfDlJkYmUp1ua96AVtYYD9RNzUqPTfDrg0XCaTdVtOnl+pPkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=OuAYzQf8; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="OuAYzQf8"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso970058a91.2
        for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 00:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789371806; x=1789976606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sg+24kMdlq7WqHjfro/gs2jwHR6xZZQwJPn2I5eBEWY=;
        b=OuAYzQf8CCBbfP/9u3k1xNcS6crbhmQsssTGctfh3Eo1ywXccmn8YT/bEazpZX3aWo
         HZYqmkC4/Era2xu6I6JWbQcSx/9sFAMkPasoY1Aj1KgNaJeG2NtSbY9WVOPQQ7XLD/Au
         a37UKPwIDfnCEAE+IdRx5kyWnSaoyV9dKZ+uE3M44kfTz8J3I5YDTZoveunM55ixo8Hi
         BgA+GvqqStRVybSvaAquWbL7k7nTqWMggbf38uznFQphtdawW+X3NjBqaCuCeKxM6JDU
         uMeLsc1jYRwWYakM0xqGTBoLeWYh/X2jxbYiTvWc1sy4U4brd5WzBF6O4ceihpe0Trq/
         Zalg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371806; x=1789976606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sg+24kMdlq7WqHjfro/gs2jwHR6xZZQwJPn2I5eBEWY=;
        b=TzPGXLMH+ffDChCBEPibHREs3J23eZygN9RgwuIT8wir07VRxNQMJ1CSxFJxtcxFUm
         bgst78isFJ6/4c+LPp/Kh+aYk78rRvpsVFu4sO4RkbwnrUVfAcEJeGCu8yZ72nDeW/JN
         hYtU+yh1cqzcACcbC4BRi1Yp8UypEEkHl4nuIlcbYoSqT2SN3eXPQPngV/3IfC1a6YTk
         YCMhULAwp1DKXJ+jopoJ9K8rel17+1UhQHg5zS/T6vKGfOiznnPufdZ4HtEanIEsKiMD
         X6TSVqDhJcNBNOzhX8pN6RiQpFjLLGw+bPqxAaxfoHaqY2HS8ysqjfHdQ64fE6hwurzA
         SiLg==
X-Forwarded-Encrypted: i=1; AKwUvBy38/GSjiqpnZ9XhwUbEOOVF7Qf2EU91NfxszLAchdlun+dtAN1CMfk5Cdfgho1U0jJm6Bsb3VLrDoNwg==@vger.kernel.org
X-Gm-Message-State: AFuF++lbjbty7QsWL5zzzawTLObbZlYYEvkdmzGBsSGdrK+DR9Amhm3c
	ssQDfzNAdh4Ir6VUO+c7ZJ5OSFoOy6i5B+UnK2soD9GbDc9NLaid41EeGvZvcm9hHg==
X-Gm-Gg: AYBFou3M8Z0CkZxRDKs1Yp1oXEL+GT0c18EEKwpkMxIffTYKRtRdFlHGawZMXHJlftg
	zWAW6YuB1cTao09egXYmZhOHtXHbUGYtMm7VCIp48wJp4oyNWsZi0iKHKgzw58b26ISi/LHv4hW
	W9ytvU2ZuQu0b1EJ1UZt7/amPFzK1AkFPf/w/z1PIYs1jlTR8s8xqRXCAXsvUnUDySfHgh5ziXQ
	kdjAjRKkUyKUC6NwYKguUi4gMSwDP/O48AfU695fi9jGdRhHtJSd9AKMY23Ty5CVb9dieB/0VQu
	TQn9lkKLNSj+kTC2UgDNkCMZexvI04o1YzchDbhUVHNx637FoKweqUN1/ygLTmuPuxeFWZhIrKd
	7Ep0sPtco1d5zqsmtMXGoRkJzwKdGyK/6QDV4Oamk1G1F4kgr+U9NUM5slWpVsG1ekIxxLnoaBQ
	q2V3lqSLCDZIryc74X6cjTur8wegukuqv4pGDwugcvP9dL6mZwU1f6VPsgMHn4GBKIx8gzL5uL2
	/RrvjK7WhfGjgcGJCj8EIpI81wxSYOMaJs5FTtRzFKX7uw7
X-Received: by 2002:a17:90a:1056:b0:39d:ec9a:8f8e with SMTP id 98e67ed59e1d1-39dec9a90b5mr2070798a91.8.1789371806376;
        Mon, 14 Sep 2026 00:43:26 -0700 (PDT)
Received: from p1.. (209-147-138-4.nat.asu.edu. [209.147.138.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50efsm27877070eec.28.2026.09.14.00.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:43:25 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: perex@perex.cz,
	tiwai@suse.com,
	torsten.schenk@zoho.com
Cc: co+855929c2df672879@bugs.sh,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH v2] ALSA: 6fire: fix OOB write from device-reported iso length
Date: Mon, 14 Sep 2026 00:43:24 -0700
Message-ID: <20260914074324.3590843-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb6fire_pcm_in_urb_handler() sizes each outgoing isochronous packet as
(actual_length - 4) / (in_n_analog << 2) * (out_n_analog << 2) + 4, where
actual_length is the unsigned length the device reported for the matching
IN packet.  A packet completed with status 0 and actual_length < 4 wraps
the subtraction to 0x7fffffec; a zero-length isochronous packet is legal
on the bus, and the preceding loop rejects only non-zero status.  The sum
reaches memset() on out_urb->buffer, a 4832-byte object from
kcalloc(PCM_MAX_PACKET_SIZE, PCM_N_PACKETS_PER_URB).

Even without the wrap the result is out of bounds: at 88.2/96 kHz the
4-in/6-out scaling turns a full 420-byte IN packet into 628, so eight
packets span 5024 bytes of that buffer.  usb_submit_urb() rejects an
over-long descriptor only after the memset() and the
usb6fire_pcm_playback() copy of user PCM data have run.

Guard the subtraction as the sibling usb6fire_pcm_capture() already does,
and limit the frame count to what fits in rt->out_packet_size, the OUT
endpoint's wMaxPacketSize.  This bounds total_length by the buffer size
while keeping each packet length aligned to a whole output frame.

  BUG: KASAN: out-of-bounds in usb6fire_pcm_in_urb_handler (sound/usb/6fire/pcm.c:338)
  Write of size 18446744073709551456 at addr ffff88802a3d0000 by task vhci_rx/5018
  Call Trace:
   dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
   print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
   kasan_report (mm/kasan/report.c:595)
   kasan_check_range (mm/kasan/generic.c:186 mm/kasan/generic.c:200)
   __asan_memset (mm/kasan/shadow.c:84)
   usb6fire_pcm_in_urb_handler (sound/usb/6fire/pcm.c:338)
   __usb_hcd_giveback_urb (drivers/usb/core/hcd.c:1657)
   usb_hcd_giveback_urb (drivers/usb/core/hcd.c:1741)
   vhci_rx_loop (drivers/usb/usbip/vhci_rx.c:107 drivers/usb/usbip/vhci_rx.c:242)
   kthread (kernel/kthread.c:436)
   ret_from_fork (arch/x86/kernel/process.c:158)
   ret_from_fork_asm (arch/x86/entry/entry_64.S:245)

  Allocated by task 10:
   __kmalloc_cache_noprof (mm/slub.c:5563)
   usb6fire_pcm_init (sound/usb/6fire/pcm.c:560 sound/usb/6fire/pcm.c:595)
   usb6fire_chip_probe (sound/usb/6fire/chip.c:133)
   usb_probe_interface (drivers/usb/core/driver.c:399)

  The buggy address belongs to the object at ffff88802a3d0000
   which belongs to the cache kmalloc-8k of size 8192
  The buggy address is located 0 bytes inside of
   4832-byte region [ffff88802a3d0000, ffff88802a3d12e0)
  Kernel panic - not syncing: Fatal exception in interrupt

Fixes: c6d43ba816d1 ("ALSA: usb/6fire - Driver for TerraTec DMX 6Fire USB")
Reported-by: co+855929c2df672879@bugs.sh
Closes: https://lore.kernel.org/all/gisnub8aWGLbyZLcDCSc7zWsHonMWGcyRgt5%40bugs.sh/
Assisted-by: LLM
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
 sound/usb/6fire/pcm.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/usb/6fire/pcm.c b/sound/usb/6fire/pcm.c
index 21789db6657d..0285d79ace0f 100644
--- a/sound/usb/6fire/pcm.c
+++ b/sound/usb/6fire/pcm.c
@@ -335,11 +335,19 @@ static void usb6fire_pcm_in_urb_handler(struct urb *usb_urb)
 
 	/* setup out urb structure */
 	for (i = 0; i < PCM_N_PACKETS_PER_URB; i++) {
+		unsigned int frames = 0;
+
 		isoc_out = &out_urb->instance->iso_frame_desc[i];
 		isoc_in = &in_urb->instance->iso_frame_desc[i];
+		if (isoc_in->actual_length > 4)
+			frames = (isoc_in->actual_length - 4)
+					/ (rt->in_n_analog << 2);
+		frames = min_t(unsigned int, frames,
+				       (rt->out_packet_size - 4)
+				       / (rt->out_n_analog << 2));
+
 		isoc_out->offset = total_length;
-		isoc_out->length = (isoc_in->actual_length - 4) / (rt->in_n_analog << 2)
-				* (rt->out_n_analog << 2) + 4;
+		isoc_out->length = frames * (rt->out_n_analog << 2) + 4;
 		isoc_out->status = 0;
 		total_length += isoc_out->length;
 	}
-- 
2.43.0

