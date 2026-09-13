Received: from mail-pz2-f32.google.com (mail-pz2-f32.google.com [74.125.228.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000EC1862
	for <linux-sound@vger.kernel.org>; Sun, 13 Sep 2026 00:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789257927; cv=none; b=T2E2Zb86s/JW5eRZnusaii6WvnmWdh6r7fQWX5OsdKIp6G2d+5ePqTxODxD2VsswKWN+NSqDRpaZRDvRO90dXXlsKQXHxvNr+C6BJL3852gM3GwO8BMpRa04Z+8Lvm5Wx/49wl3gQKWNv/8J6saCShyMgs7GIXctXXTZHMQkLBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789257927; c=relaxed/simple;
	bh=Zisplu70v8bQ8iKPwlbm8R3au2UxFrC+ZJyhTO28l+c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MUsLTL6K9HhL1/O8cz4eyGOVMDGq+yJPqHIGzWRfibkFSJor0CboRBPdL61jRZLNlZWVS0OKEZiqxUwx+bOtcbt1TQXNEQTGR5v4uPCuB5ymyfQMCrWlUTCCCOEnjT4YJc423LabphbtoRmZyL/DH7HPT6tKOXbR/V+XgISv7No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=NS8fpvgV; arc=none smtp.client-ip=74.125.228.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="NS8fpvgV"
Received: by mail-pz2-f32.google.com with SMTP id 41be03b00d2f7-cc4d04d73b8so668480a12.1
        for <linux-sound@vger.kernel.org>; Sat, 12 Sep 2026 17:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789257925; x=1789862725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qbI3SSdNBuOxMT+Ol+aiKZ4lfv4BiwzaZgmKnA8XI5A=;
        b=NS8fpvgVxzfR7uGTjBpmqdLzbvJxuY/PKXL6L5Q7Oz2KhufwSftB6XPsg06kDyEPKa
         31DQ68IaBMAbjXF/Q7GbN8gpXZlAtOZrcsZtL8WUxH7GVSsVQa629gluPi3o19lpAyWC
         ZFLtMCX5sawJWNfWTxIX10YkXb4bPVSxHUqfJTdo85pRHDaPR6oQpYiBcFBdQJmrwW8X
         31FThoEYbhVsrvejwr8KnXOVOuMdedrnbOCizkKX4IxxbFgyEx1zXB0T8iOw/scv+sm4
         j905DcDXJ5aey33WOXPKs3OYaXLELiMGajEMqCf2zWzaPXqnjEd1V77cWLeXtHWM7Dhv
         20ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789257925; x=1789862725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qbI3SSdNBuOxMT+Ol+aiKZ4lfv4BiwzaZgmKnA8XI5A=;
        b=XRRlKhpR2epbIrZ2a7p0nxaZdp6ls11zKQ+yiIyHWBvbz+uz21oMT2Tl/QschMT5NV
         YVHCB2D1nQJLB2ZmMj+lICkLHyDZFjjCYlL1rDumyt9anxSl5jjt3SEDiutWrGUbkRB0
         CY/80TBEHt58Eh5KCO647AO6Pn1VkG3Oxo86os2DJmbQx2f+KmgqflLqutRPOq/4Q6Gz
         OG5K1FJ582XwYjp4D8RQAA8o8wL+hJWQx8BDgoPjq+0zY0cse1Qq1OxotR1xRVJ5lXc9
         UV1PNDcytrqNp4qYFmb+v6g60EN4y0FoKWLG6mPouze/7Mx3SUpRjQ4LugOYCHM4CIT5
         HABA==
X-Forwarded-Encrypted: i=1; AKwUvBzTlhE+KFiHwbnyUFdVXi5fTlJz/mBJa0PZf6AmHvLu1yHHZVDw7xQ9z/jKwcP9M9Q7NqRP+HmbCuRF+Q==@vger.kernel.org
X-Gm-Message-State: AFuF++lwgi0TDBx+bpVMLwgphK8Ny3zJyVpklgWiB78IogyZTLnvV1gy
	d01FlVCMUzF7p+HeeObsE8tcxV8UIWkgpRPfk0VXJqNhD7iEvUooiFyP42GNoyzXhk3TVOvE8HM
	Cp9yXlw==
X-Gm-Gg: AYBFou1o/DeZHpgNMJ1HLvMEHcLJP2DXPH254gaPc0TQ1WoBpzqTPCoOQd/XCfPdWu+
	RjJ7nRIUw3dW6ay2wncKwFzgB00UwX+lts1s7pqW6/Ci+h4bFggrchDztZ7K04V1IeKHQlZxdDL
	wIuolUlxUyLivfG0VVh4y7eKmvD8mL+CQZGA51SBRKTs6ZjzFwaspvWKh5VvDeZb+yww5y550QH
	pLaNmGG4iyNowp7e/YYIDiQ4bhUfd6RQ7RlT/l9BnujsuN1A3KZXsxS61dtveHLx2wDnXK+QL1n
	S+CionwI0xPdgbO8Vgv+7PCV+E8EOmRkYzfgH2IOWCxswX2UkB3toKDk9LErS/3XgVFlTkjh6jY
	kK2j83x/uU1xeQsc+xaIvhZpBt+byCyCzga0ikKjeMbWW+tlSaBiphqFTFwU8cUf/OZ0SOjx5T6
	Vo6K7VJPtiE+6U8+uRigy5W5IRG1qdSGh3ckgq8cltk8i0UsvgxJJ/ZeYfmN94/Zl50aTAefGPn
	/ogPdXW2oFWPx3bmP0kTwu0nToyamnR5lQx/A==
X-Received: by 2002:a17:90a:d88b:b0:398:9bd5:490c with SMTP id 98e67ed59e1d1-39dbc6f0775mr9044453a91.19.1789257925267;
        Sat, 12 Sep 2026 17:05:25 -0700 (PDT)
Received: from p1.. (209-147-138-4.nat.asu.edu. [209.147.138.4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b78d59sm14819353c88.8.2026.09.12.17.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 17:05:23 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: perex@perex.cz,
	tiwai@suse.com,
	torsten.schenk@zoho.com
Cc: co+855929c2df672879@bugs.sh,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH] ALSA: 6fire: fix OOB write from device-reported iso length
Date: Sat, 12 Sep 2026 17:05:15 -0700
Message-ID: <20260913000515.2344562-1-xmei5@asu.edu>
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
and clamp to rt->out_packet_size, the OUT endpoint's wMaxPacketSize,
which bounds total_length by the buffer size.

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
Assisted-by: Claude:claude-opus-5
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
 sound/usb/6fire/pcm.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/usb/6fire/pcm.c b/sound/usb/6fire/pcm.c
index d2e274b731fe..b3ecf9fa4951 100644
--- a/sound/usb/6fire/pcm.c
+++ b/sound/usb/6fire/pcm.c
@@ -328,10 +328,16 @@ static void usb6fire_pcm_in_urb_handler(struct urb *usb_urb)
 
 	/* setup out urb structure */
 	for (i = 0; i < PCM_N_PACKETS_PER_URB; i++) {
+		unsigned int length = 4;
+
+		if (in_urb->packets[i].actual_length > 4)
+			length = (in_urb->packets[i].actual_length - 4)
+					/ (rt->in_n_analog << 2)
+					* (rt->out_n_analog << 2) + 4;
+
 		out_urb->packets[i].offset = total_length;
-		out_urb->packets[i].length = (in_urb->packets[i].actual_length
-				- 4) / (rt->in_n_analog << 2)
-				* (rt->out_n_analog << 2) + 4;
+		out_urb->packets[i].length = min_t(unsigned int, length,
+						   rt->out_packet_size);
 		out_urb->packets[i].status = 0;
 		total_length += out_urb->packets[i].length;
 	}
-- 
2.43.0

