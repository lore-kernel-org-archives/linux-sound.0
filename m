Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD5C3BF685
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 10:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781776955; cv=none; b=I5GPcxucFdsiOlCHdFzogVVkzZlx671KYmM1JKuDXRQ4YLZ1seOBKGC2HZxPsXqlbQUh1Omx3cfeg+J63ZUqNq8RsbYImnPjtK48D9PdQyeh1gHENO5sJhwe5UdQEAgDhbBctRVtrzz5CcpPJphLdLqWSnVJG1LOrh1Y0Jitrgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781776955; c=relaxed/simple;
	bh=rh2IF3Jo9oPeYrUb50HUG/57VAOQx3Xoq2q2HvWToYc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=plrFqk+JJX/idSvUvgW55Tz07rbL9BNLe6fsAGRGr9xte3s4prYK81ABXp6N8MIwnCNgJ43enawDTDRyv2AvtouzKaC6FdKmHPGpkycMTCU/+ADGsvstcK8ucywvOgTwubGqYc15WtjGCk7ojVeFltgU9EmPtduJIrx3rYHhIT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrBv4BeF; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrBv4BeF"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c6ec0af575so3294995ad.1
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 03:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781776953; x=1782381753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JGseavsQPnPByWI47/XbAVzyf2TmwTDT7a9cN4GhGZc=;
        b=IrBv4BeFqvVg3c9qf4IvP1RrSKoOMrCQdYpNYc7YQJdt/J5KgI0YUSQf1HFFxBqyyK
         I915q8UHd9Dk10+qs00lYngz3rDkMR+VP6M12olXsB7IV1G94jk1P/CyGXydpQZXssww
         mue8oVFvuKGrkKFPD7f6UbbKA+1PbKaDnMJwcfEDWq57ofR/MaSbmgKK3plRJtcVZm9n
         n41GTF9SQMq0T84K3R86EkDIKbp9hP69H/L1maEZxWyOjjdi1tWd3vME3AJ3f8P/2vy2
         8cR4NaGi6IPYN1/PW5+H7iVRFlWhxvhXWnWmXYzWLwq+U6KWec/PPgse8Atdeuw03CCt
         2e6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781776953; x=1782381753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGseavsQPnPByWI47/XbAVzyf2TmwTDT7a9cN4GhGZc=;
        b=IbE5seYBs8jeBIM6c2YGNHpCZ4Y+b68WmB0AxjNmHJ681ePrXyO89wX4zHTr0mAXSG
         SBoJBwuy0Yl1MQHwN+0A3OJV2kUqn/QOYMPoefN3wIg0pNrPIVmJudMXiCe0o5nKLi66
         E9NSuwiYsGRkKD6TzOT/WbnIsHG6JzXU2g9DgAe/DQAiAxudYdQdkRwkzmV45BkMHCoQ
         hQoWa07G3iPUxu0jxH1VWm17J8Mm+yCmm99osecU80gzAWFSt3P2xtsDcbdnnSbYmwcy
         guRK6HnKcLFd9JzFlFoy1hYRwh/jWaxi0B3iMdmQ7qHDi5EOqwPqyIXOG1kFC+amQ8l+
         LRgw==
X-Gm-Message-State: AOJu0Yzy3OseFXGgOQ8LTZjbRxr2V8SD7FZ0O9MdRfyV+Z6kE1UQMoZb
	Q0wDeupn0UCPEpXWypqH59NHJv/n3qj692QzpLZTW93PzFazDQ+JHoiO
X-Gm-Gg: AfdE7ckLuiIOE1TGppMD04goPnkfZBhtCzcwM3ofgtVCxh07lyqJqj4aSeM9oht2gdp
	0hvzmnrddTMGAsfos5uJ5VpKXpMgzQUss7TkZrA7QET4p5OFGyUPqyWjHrTt7KcqhKo6lCsgJJw
	x7LNaVOfpif8CaSe4knY2tFVc7/rmjfLxsbSsz3z+PcVG+zkwDojr5xu9R6YFyAMk1vyg5CD7dH
	DgxNbn1+VqdPNX6IuNMT9o+BL5GpRTNChEnHLNYKsXYTlzFgEqczx9G021KGu3uJKFHWhQBDtkD
	5meAsGkr3vUk582k3D8jAzcUofIBCl4Uay+ldpTMYY1GwOI5mB/dhXZef082k/14oxni2Dvuhaw
	qp7LxUKpXhBZobZITFSNLTFXvNzWYuvTKIFb9sT0rxyL2ftCqHkfL8JdEtqziWRXvs4fJ6N1RXn
	rH5Q5EsaI=
X-Received: by 2002:a17:903:32c2:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2c6bc224e0amr76213155ad.21.1781776953047;
        Thu, 18 Jun 2026 03:02:33 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6f00b8ecfsm16232315ad.12.2026.06.18.03.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:02:32 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com
Subject: [PATCH] ALSA: usb-audio: Kill MIDI 2.0 URBs before freeing endpoints
Date: Thu, 18 Jun 2026 18:02:27 +0800
Message-Id: <20260618100227.3289790-1-zzzccc427@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MIDI 2.0 input URBs are started during snd_usb_midi_v2_create().
A later setup failure can still jump to snd_usb_midi_v2_free(), which
currently frees each endpoint and its coherent URB buffers without first
stopping the submitted URBs. A completion can then dereference the
embedded URB context and endpoint state after they have been freed, or
try to resubmit from the stale endpoint.

The buggy scenario involves two paths, with each column showing the
order within that path:

probe error path:                         USB completion path:
1. start_input_streams() submits          1. The HCD still owns a
   input URBs.                               submitted input URB.
2. A later setup helper returns           2. input_urb_complete() runs
   an error.                                 with urb->context in ep.
3. snd_usb_midi_v2_free() frees           3. The completion reads ep
   endpoint storage and URB buffers.         state and can requeue URBs.

Make the endpoint destructor follow the same teardown ordering used for
disconnect: publish ep->disconnected, kill the URBs synchronously, and
drain the endpoint before freeing URB buffers and endpoint storage.

Validation reproduced this kernel report:
BUG: KASAN: slab-use-after-free in input_urb_complete+0x37/0x1b0
Workqueue: usb_hub_wq hub_event
RIP: 0010:_raw_spin_unlock_irq+0x2e/0x50
Read of size 8
Call trace:
  dump_stack_lvl+0x77/0xb0
  print_report+0xce/0x5f0
  input_urb_complete+0x37/0x1b0 (sound/usb/midi2.c:186)
  srso_alias_return_thunk+0x5/0xfbef5
  __virt_addr_valid+0x19f/0x330
  kasan_report+0xe0/0x110
  __usb_hcd_giveback_urb+0x112/0x1d0
  dummy_timer+0xaaa/0x19a0
  lock_is_held_type+0x9a/0x110
  __lock_acquire+0x467/0x28b0
  mark_held_locks+0x40/0x70
  _raw_spin_unlock_irqrestore+0x44/0x60
  lockdep_hardirqs_on_prepare+0xbb/0x1a0
  __hrtimer_run_queues+0x101/0x520
  hrtimer_run_softirq+0xd0/0x130
  handle_softirqs+0x15b/0x670
  __irq_exit_rcu+0xd0/0x170
  irq_exit_rcu+0xe/0x20
  sysvec_apic_timer_interrupt+0x6c/0x80
  asm_sysvec_apic_timer_interrupt+0x1a/0x20

Fixes: d9c99876868c ("ALSA: usb-audio: Create UMP blocks from USB MIDI GTBs")
Assisted-by: Codex:gpt-5.5
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 sound/usb/midi2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
index 04aeb9052f13..94c1a52853e0 100644
--- a/sound/usb/midi2.c
+++ b/sound/usb/midi2.c
@@ -470,6 +470,9 @@ static int create_midi2_endpoint(struct snd_usb_midi2_interface *umidi,
 static void free_midi2_endpoint(struct snd_usb_midi2_endpoint *ep)
 {
 	list_del(&ep->list);
+	ep->disconnected = 1;
+	kill_midi_urbs(ep, false);
+	drain_urb_queue(ep);
 	free_midi_urbs(ep);
 	kfree(ep);
 }
-- 
2.43.0

