Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96F13F482B
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 12:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781785338; cv=none; b=XFUSyaHbnmkMhGnS5W/CW1p6uAy0FhZtJW/dLGjL6ECkTaYd5ZnphmJ/HeVAXCV5FuQxWCWRIZpc5LDOpvJkdSCYyBYVa1k9g78w85IHYSgLfsXnZHC1BfaGBCwk7snDyyqleKDnYmKQ0QPO4zaNXyRh83c/q26BDhlsx//gx1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781785338; c=relaxed/simple;
	bh=BImtgywMe6U2I/ZN5zzl4qxsk+6PLIwhErT4gXHfC/4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HjGKnTwBkI70l5gnQC2hAl/lB9y0NvALOGiwkf+h4Y3+NWdy/x68mVbcJuZnZOwH+4STbl+jxcqN5cVLQExGEJ/OsdhzrtePlyyiCkbLFkJIZe8MLpJGmkrEJk/u88XI90FSxwRVEkYwFZaDhefRNcvj9nS/d2uUsdzqIcg7H7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3Y/eZJX; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3Y/eZJX"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-845397d1221so510926b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 05:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781785336; x=1782390136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fs2Mt3aRIB3eQlpIXGo5UKfBl+GdfOrbjwro/iPxCqU=;
        b=F3Y/eZJXZAzVku5BlV6CbKxkutRhcYrghuoTvagCcku6qVdujlLzwJGJoaTgHG4ti/
         G0NOJtNM0S8us2j+jJJFtxmkxJ0WsX7pgBnP/EBdNlkpl4JmridMmQdQ7LztaprM6BO7
         84loXcC18/z+fvSpGzuD0gx9RGBUpSjf7TrS0h2+glA4AjeI+br1Eg4rkupQIKngO4la
         5ciwpM1b4eowi65TtSTzgO7qrjpo0HCwMzXJoi5Vyq9skqe6kE19UsE7izdsfgJIX7nn
         S8gLNsNLl9B5zPutEe0v8FzxBVfaaCqprQDzOD25o2H3AEwlEoSAULoYZTyIU6s8ABIk
         0DWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781785336; x=1782390136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fs2Mt3aRIB3eQlpIXGo5UKfBl+GdfOrbjwro/iPxCqU=;
        b=SVZ3VMm7+dAplNaR2+cnz04gPISSeL8aUNZ9bhVfPmRIMbbM76dawLith0hSW3Vr9g
         zw4BVoBxvPFmL+XUk8W/Zlpzte7R12FS0Kc0tJfdklUr9SLsgrWxEHMSk3R/TTVhjmLK
         s1V5KaC+l20KlFX21b5qLMVbUMiU/Mo35S8dXBz7bMGGRub7nFkgrkearMceRvkx4ZZI
         DqtNACSMwW0mBgwth2hdZ8gRv1iIrBgcn6NztO2YFX8uohrtLChhKHJAFMziXSejbgsV
         G7aPYe/huKoIny6ZW3sJc830xYaQE7GEXPbLohms/AD2zRvD1u28KwJdvFhwujD8WWJp
         fX2g==
X-Gm-Message-State: AOJu0YyGy+oWs9gmN/uHtlVrLbLwpZ61WqKkYWF1A0m5Mec3QH/JwbvM
	lnOkY8bVHBre6nlmKR0tMSoIWbenCLojcZo7H3O+jtwWs19zwbHwpxN2
X-Gm-Gg: AfdE7ckxEMfiEDWsBRrYv/4jwzM9pU7AxFMcHVWdJgmXPE4c71AQBVNfimwgrx0/jq3
	grJ1wNKbcTLsQF/8Phrb5CXDB/bkumh/wtXOQHvpUpAZREtJoOuUnAMb+IQ84Mk5ItTBqZVpHjx
	kaeiIeyEXeWKAIR9MhzDQnqE6jAQw2H9ghlGkcxOZooV6wsKMkSHXKtSH4w9qkwucpWUXS6dNX7
	IPQDqtXHKtVd2H5uIGeOUq+63PbTN47vvhjQTr/pCInXQKwzQGgxADsQ3AIx7QSmiTcwlVD11VQ
	1IrSHrGivNjzpshQqRHwUby3kNWanK0dQdb43o3lmlJOMF0zvxmWrYSZU2WO0hGzP7WINmkugB/
	fKeiDv0EdV75tTyr6JMsnNhXC80JPqqNuvi4t/XkoCaF+chFRicNh+V3J/1BDhQa/7goXxCaai7
	eUfQ5vpw0mi5B9y0J7og==
X-Received: by 2002:a05:6a00:1152:b0:835:3949:3c22 with SMTP id d2e1a72fcca58-84524557a5fmr9204089b3a.27.1781785336027;
        Thu, 18 Jun 2026 05:22:16 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b03fd0bsm19113110b3a.50.2026.06.18.05.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:22:15 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2] ALSA: usb-audio: Disconnect components on probe errors
Date: Thu, 18 Jun 2026 20:22:09 +0800
Message-Id: <20260618122209.3655881-1-zzzccc427@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MIDI 2.0 input URBs can be submitted before usb_audio_probe() has
finished building and registering the card.  If a later setup step fails,
cleanup can reach the card or MIDI 2.0 endpoint free path while those URBs
are still owned by the USB core.  The normal disconnect path avoids this by
publishing the disconnected state and killing/draining URBs before endpoint
storage and coherent transfer buffers are released.

The buggy scenario involves two paths. Each column shows path order:

probe error path:                         USB completion path:
1. start_input_streams() submits          1. The HCD still owns a
   input URBs.                               submitted input URB.
2. A later setup helper returns           2. input_urb_complete() runs
   an error.                                 with urb->context in ep.
3. Cleanup frees endpoint storage         3. The completion reads ep
   and URB buffers.                          state and can requeue URBs.

Factor the component release sequence out of __usb_audio_disconnect() and
call it when usb_audio_probe() is about to free a card that never claimed
an interface.  The helper preserves the existing disconnect release order,
including snd_usb_midi_v2_disconnect_all().

Also make the MIDI 2.0 endpoint destructor perform the local disconnect,
kill and drain sequence only when the endpoint has not already been
disconnected, so the internal MIDI 2.0 create-error cleanup is synchronized
without repeating the stop sequence after normal disconnect.

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
v2:
Factor USB-audio component disconnect into the probe error path and guard
MIDI 2.0 endpoint kill/drain with ep->disconnected, per maintainer feedback.

 sound/usb/card.c  | 70 +++++++++++++++++++++++++----------------------
 sound/usb/midi2.c |  5 ++++
 2 files changed, 43 insertions(+), 32 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 6a3b576fb067..b36f513dccb9 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -905,6 +905,40 @@ static int try_to_register_card(struct snd_usb_audio *chip, int ifnum)
 	return 0;
 }
 
+static void usb_audio_disconnect_components(struct snd_usb_audio *chip)
+{
+	struct snd_usb_stream *as;
+	struct snd_usb_endpoint *ep;
+	struct usb_mixer_interface *mixer;
+	struct list_head *p;
+
+	/* release the pcm resources */
+	list_for_each_entry(as, &chip->pcm_list, list) {
+		snd_usb_stream_disconnect(as);
+	}
+	/* release the endpoint resources */
+	list_for_each_entry(ep, &chip->ep_list, list) {
+		snd_usb_endpoint_release(ep);
+	}
+	/* release the midi resources */
+	list_for_each(p, &chip->midi_list) {
+		snd_usbmidi_disconnect(p);
+	}
+	snd_usb_midi_v2_disconnect_all(chip);
+	/*
+	 * Nice to check quirk && quirk->shares_media_device and
+	 * then call the snd_media_device_delete(). Don't have
+	 * access to the quirk here. snd_media_device_delete()
+	 * accesses mixer_list
+	 */
+	snd_media_device_delete(chip);
+
+	/* release mixer resources */
+	list_for_each_entry(mixer, &chip->mixer_list, list) {
+		snd_usb_mixer_disconnect(mixer);
+	}
+}
+
 /*
  * probe the active usb device
  *
@@ -1077,8 +1111,10 @@ static int usb_audio_probe(struct usb_interface *intf,
 		 * decrement before memory is possibly returned.
 		 */
 		atomic_dec(&chip->active);
-		if (!chip->num_interfaces)
+		if (!chip->num_interfaces) {
+			usb_audio_disconnect_components(chip);
 			snd_card_free(chip->card);
+		}
 	}
 	return err;
 }
@@ -1091,48 +1127,18 @@ static bool __usb_audio_disconnect(struct usb_interface *intf,
 				   struct snd_usb_audio *chip,
 				   struct snd_card *card)
 {
-	struct list_head *p;
-
 	guard(mutex)(&register_mutex);
 
 	if (platform_ops && platform_ops->disconnect_cb)
 		platform_ops->disconnect_cb(chip);
 
 	if (atomic_inc_return(&chip->shutdown) == 1) {
-		struct snd_usb_stream *as;
-		struct snd_usb_endpoint *ep;
-		struct usb_mixer_interface *mixer;
-
 		/* wait until all pending tasks done;
 		 * they are protected by snd_usb_lock_shutdown()
 		 */
 		snd_refcount_sync(&chip->usage_count);
 		snd_card_disconnect(card);
-		/* release the pcm resources */
-		list_for_each_entry(as, &chip->pcm_list, list) {
-			snd_usb_stream_disconnect(as);
-		}
-		/* release the endpoint resources */
-		list_for_each_entry(ep, &chip->ep_list, list) {
-			snd_usb_endpoint_release(ep);
-		}
-		/* release the midi resources */
-		list_for_each(p, &chip->midi_list) {
-			snd_usbmidi_disconnect(p);
-		}
-		snd_usb_midi_v2_disconnect_all(chip);
-		/*
-		 * Nice to check quirk && quirk->shares_media_device and
-		 * then call the snd_media_device_delete(). Don't have
-		 * access to the quirk here. snd_media_device_delete()
-		 * accesses mixer_list
-		 */
-		snd_media_device_delete(chip);
-
-		/* release mixer resources */
-		list_for_each_entry(mixer, &chip->mixer_list, list) {
-			snd_usb_mixer_disconnect(mixer);
-		}
+		usb_audio_disconnect_components(chip);
 	}
 
 	if (chip->quirk_flags & QUIRK_FLAG_DISABLE_AUTOSUSPEND)
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

