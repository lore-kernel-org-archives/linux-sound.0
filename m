Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C3831E820
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 17:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781802017; cv=none; b=lCEJhcMQWZL8KS3qRKpsIN0J/quCXDiNIrq9OqA4viscnZFHWxnwLRB+FBZyGAAZg15sf/WuquNFWnCzODIw9nI72/nl09KI/mqXLdK5WAf4kAWnOqkVuAD3h8uwT7bnbGmGCQfhSeeyno9dxeC+tAG9WgUVdU9irOhpORCQbLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781802017; c=relaxed/simple;
	bh=8i6rnHT8h8cpy7K3Jf6lSbPkXondffZ3tpL0kdAcTfU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=odB9JIGpPKxe2AR0oTwKKMknx/77pyoOB+I49Ob3bU1ea+HJfzrIcWTS74h35rBsc7ESKpsknX8ip8PfKcGL/MjPm/svdbCug5RlqxCTs5RBnJXN2cEGV+aBdx7HudEw40JazjNwDGErG40qt0PLbpksTgbBaffGIEHmpY82bhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4Cr733D; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4Cr733D"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c88d1d4543fso844087a12.0
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 10:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781802015; x=1782406815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nsHSLMMotOY4uePVTEbKQ5VSsYg3aXbvu2XuMkfpzs4=;
        b=S4Cr733DNIRIkGGyyOt/LKDRUo8YhRT71niDZwApLH9FglColGqJ4jr86ejPpe/tRp
         B+Bef2JD45TOvEtjhFvZr2ClTijJPKA8f22oDxph97nBcQNpfO2HATWFtI/RSR/mant8
         XZooNTEI1/R5cVT8RsybGf4O1js99/x9xL0r96DybOMdyJ73zJhfISpZY2N4KmQfMpS7
         vpEDHJDBVvXBm0ARYrgFxTQt0tD/FnQVflu0QdpOmTm4en2lzKAmZli3eBxBuPEgJ5rZ
         cowA/mCjGdxaZ9jy5R0Z1Pj6o0uN9wuJGXjcDNVyb9fvrLdihlhKwk/7/8RbKiT3QDj+
         4OIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781802015; x=1782406815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsHSLMMotOY4uePVTEbKQ5VSsYg3aXbvu2XuMkfpzs4=;
        b=Kz0sEJWGrES5GnJ6Za9zLpfTI81+26ikBoUVyep3CIwIM2MBOR659SjE52AZSGfYSg
         fseNyf850nub4Tf2LZd0dpVgq9BalvbocDZbh08qjcyIhh6mxgBFXtHhyJEH2NVrmKSu
         vrp0U+0zvL8c38KVE09UQ6w98VDJqXfNrhVfVpM6sJgsTJ7CYzb1ewPamsWKGWoV78vw
         cR8HImCSvSpdl49fs2chPFrM79xZxRx5RI5YvoJStUbpGP3lm5tvCK6GZ0LQI3VUNLcI
         Ai1zgzwwDZy3/Hng6c3Lm5cU7HMtnVRMA8kKaTD051Q4Bd+/qT9PUahF0E6rnzgaXwWy
         y5PA==
X-Gm-Message-State: AOJu0YzKJ3ngkbxoKbmwrkD38Un6lru221wn6Fx0HuN1OmpXkGrhdcww
	CkFZEnckRe/cr5kULwVM0tISkoU24w/FeWhFR8WkeYZR5s8iv0NfLuRE
X-Gm-Gg: AfdE7ckQLSwlOFTvmGpc8/WaL8mUAZ6HDUqj4WDNpLyKmPQSyaEsBA+x+pll6zj0u3a
	Gr/5ewTNexJO9WP6uXXRAgl3fU2B8ysYZzmlcxjEA9HRzTkQq9nCkG+YadRb7SvH/qi0y8+jsw6
	6o0cl9NI/hH2Zn747o3hkmWl2ihu4LC+xq4qfqKsTS0HFqyMpGNI37scvZZ2GWE+JSwpajAOQ9R
	utnOf9HTO7kN3Uz6b3+18n9p8CSh/EE+3qFJST39PkHW3qaM1+zl/mKGThqHDY2W6ZdqMgRGflP
	aTN7umyvlSzMeHvGPCShi28hO9U5bEWdrpIbO44Dj/C+Us0h1QLLZ76kBpMwlAziTOA+PJdXy6u
	eIDPZMNYOJE8g/Q8oX0UKFjluS0TVyQ4g5VbklO0pg2Sm05l2s7tVPN3swnKmJKDeYIkmycJJYm
	YGURWnSJg=
X-Received: by 2002:a05:6a20:72a9:b0:3b9:5efb:cb2e with SMTP id adf61e73a8af0-3b9e28cf9abmr4519723637.21.1781802014994;
        Thu, 18 Jun 2026 10:00:14 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c88fbaff137sm3534622a12.28.2026.06.18.10.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 10:00:14 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3] ALSA: usb-audio: Kill MIDI 2.0 URBs before freeing endpoints
Date: Fri, 19 Jun 2026 01:00:10 +0800
Message-Id: <20260618170010.191433-1-zzzccc427@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MIDI 2.0 input URBs are started during snd_usb_midi_v2_create(). A
later setup failure can still jump to snd_usb_midi_v2_free(), which
currently frees each endpoint and its coherent URB buffers without first
stopping the submitted URBs. A completion can then dereference the
embedded URB context and endpoint state after they have been freed, or
try to resubmit from the stale endpoint.

This was observed as a KASAN slab-use-after-free in
input_urb_complete().

The buggy scenario involves two paths, with each column showing the order
within that path:

probe error path:                         USB completion path:
1. start_input_streams() submits          1. The HCD still owns a
   input URBs.                               submitted input URB.
2. A later setup helper returns           2. input_urb_complete() runs
   an error.                                 with urb->context in ep.
3. snd_usb_midi_v2_free() frees           3. The completion reads ep
   endpoint storage and URB buffers.         state and can requeue URBs.

Make the endpoint destructor follow the same teardown ordering used for
disconnect when the endpoint has not already been disconnected: publish
ep->disconnected, kill the URBs synchronously, and drain the endpoint
before freeing URB buffers and endpoint storage. The guard avoids
repeating the stop sequence after the normal
snd_usb_midi_v2_disconnect_all() path, while still synchronizing the
direct MIDI 2.0 create-error free path.

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
 sound/usb/midi2.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
index 04aeb9052f13..3ec633291772 100644
--- a/sound/usb/midi2.c
+++ b/sound/usb/midi2.c
@@ -470,6 +470,11 @@ static int create_midi2_endpoint(struct snd_usb_midi2_interface *umidi,
 static void free_midi2_endpoint(struct snd_usb_midi2_endpoint *ep)
 {
 	list_del(&ep->list);
+	if (!ep->disconnected) {
+		ep->disconnected = 1;
+		kill_midi_urbs(ep, false);
+		drain_urb_queue(ep);
+	}
 	free_midi_urbs(ep);
 	kfree(ep);
 }
-- 
2.43.0

