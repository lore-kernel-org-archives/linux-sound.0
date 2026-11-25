Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795583224;
	b=1vPtVxGeGFLgnSN6Zq9sXMLEayejdwQmn4E9AA/TZmDN5zkkDGdO7m+dssS9jvBqiWZI
	 pk01JP4M9nyPg8+4A7GTLKQSdNT66KrOsGuAvu9QkRwizrNQm/9J7fgIcTEAmpEC4e5L4
	 MCZ2XF0yp/tEQkXH3x05KM0Z9am9FUPBkU58e5nTqTJa0/vsdUqRqzLjW9GxE6f6W6B7V
	 BmTVL5+uZsQeopAFOrtm2Lm0u1J9SzfFWIafVg2KZLA/ukWkRjKX/V7zbLJ4wDjW59wL2
	 S+va1mLswNPk66qxcVCMqDTO0qi1Nx8W5oFZ4Y+bmK3RITPcNsK2mjSh/2tjTZgaFHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795583224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=gZP2Kzfq/7eZ5eq1J+qtS2qduMCDrWMn46kU6b+mHOs=;
	b=v/ZZxpcAJYHdBEUoQvMnlA1LVz0WMqEVervx+NcKm4d6kwvXr2BvDqsJgaSpvRAt1iXa
	 uP1AmrtF9apifmMtA1/2D6msidtEgj6h7sOjx+WUtg8c8kEDsV1MJncVaTbPE4PBH0EbA
	 gGXFl0A6E4wbnP6MNI6u7GyT3hk26FoIYxUOvnhH/REsx9QMqq5pBi58mOEiCBTASwH6i
	 rKWPKSm49hEKtByTfaD2a1Aii8Hj/MW8mx+GPPuaKMy90Zd1SbqdxokWH+fwuVacE2cr7
	 E1Wq8KekKcGqiIaIRDDH70t7Y6nIT6DYXlSa9mruhDenvu17lkpZPH7tvOzC9Q496GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miloslavbrada.cz;
	spf=pass smtp.mailfrom=miloslavbrada.cz;
	dkim=pass header.d=miloslavbrada.cz header.i=@miloslavbrada.cz header.a=rsa-sha256 header.s=google header.b=YOOIATo8;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E350606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 05:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E350606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miloslavbrada.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miloslavbrada.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=miloslavbrada.cz header.i=@miloslavbrada.cz header.a=rsa-sha256 header.s=google header.b=YOOIATo8
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so33523705e9.0
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 21:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miloslavbrada.cz; s=google; t=1795583222; x=1796188022; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gZP2Kzfq/7eZ5eq1J+qtS2qduMCDrWMn46kU6b+mHOs=;
        b=YOOIATo86WdgVReo9RPcCNX8NmH+b54taN7TAETceGrApmmagKeuOgKg5G2unFmPX1
         8QY4laer/Dp3jGMqcYtFbrx5rqfc5PgDG9m5WKJgUiokGPf/IQ/V0mmFAInDYkroV3Ep
         RFs+u61kurpq/K6TWsO5TEWG5N5tn/E+K1hGyQ/FTKXich3S1+vYIR520le4dboVY0mI
         ZNt2YtzX3MlcQtA9OIvxyW20eA9/pZUQeObdT1uPGkeqQUO5TWjUsWsYRuiFWACntwvU
         bxUxK6ggcNe2H/a7hc0Psg8DFeHYKHzk/RRCx8OyZTcO6MPr0jN5CpbcaLJF3WqgJHhC
         JQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795583222; x=1796188022;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gZP2Kzfq/7eZ5eq1J+qtS2qduMCDrWMn46kU6b+mHOs=;
        b=zrYeW4JLRL6bm9iVeJR9DCVP0nTL4d+PWoGmRC7O99fp79BzBRMmhAxRmYkkDCJZUo
         GT7YvSs/n/dEcEMyld1SfmMl0/bTqjdo/NCighw+Czl0X1Fe6H8zUWXemZbKbFk/mRFm
         9H1oqqH3G4/hr6QN9fkdi9NEh2+ZJ/7InexwWFTs0nMW9UXz9J9l73+/adKarcvThvpv
         6/ETTn7ZGMvi+VCISn4lOG43WF1YK9o+mx3jsia2zm+KTCuDkv7TEO6a8imos1rbFSeF
         x/DkrccqdluiKvGvzwSgTMoikXsdLWCb1wOxnFzGhHRWZPSriuMr/cAY0xDCewB6M7Kf
         GImw==
X-Gm-Message-State: APuU4Z/C6BRw9KdwGcHPhUQxoU3VZgUZvL9nORRuirXT7wvphOGvOf5r
	paU985QBeMBlby9CX69/yKycjtT0VbYVODVmJHVv1bs0xgq3YRiuSZgxIu8a6jIKnWKY/ZsTYrs
	ngfhQBeWB
X-Gm-Gg: AZFdTZdn1cfRA/Ib+Kcib4w8XLTTCRuqSaED2LUjCrrLBde8Aeb1WOAQwRMeRmgfcnT
	M2uftW/Q15U3jVzlZ2k+Cj9WFx4XyDS/EPQqnwU3eOl9V206b05jGNr2fQbBTDKpByc1wyQ5MOf
	IDNzISqd6pNMgawTQU4SJvoapdJhgM8F1zNn753TNON/VabGLHFwRUDdshbdvw1+FHKAT1rHOy3
	xUPlR7pLhFMn4Lf3SRZtI7M+P+DLrZGrjDa8JUXRwlD4xERbO6Ar/tgR0X1t3ghmieClcz5mFY5
	Q+IzzzAyki3/yUgF29GkKeCY8Pcpe1vpLx3vwM5XfHmj+Rs+xuMVxIuT9OHntSHNgPveQMvtd50
	zAxVIXQPFIRyg2SIGHVWWAfbxw1cas7uKK/HAOXJ17w8HnMJqYjmDJmqiwiY5pvzTYvPVmBMkhP
	oGsSpmzYWLR2b956/0ZBzEeQMJaz9L3NBuL3/4XGD7exKT5+X7UNPWmP8aAqaHIgKA/D4OJE+VL
	OcX9r3euJJUQWMZvJnIGxTERTGlWQpHCA3VCBwbgeJyP5cbgQ/Y7IM5lKK1lXCX0oHDUH4fmfR/
	ysQx0TfDXLX5K8VEqc89RhmWUEs/OdWxTkAjbRJwhI3Jsm0KzeTP8iiE4/j23kNSbf0=
X-Received: by 2002:a05:600c:1d09:b0:4bb:66fd:ad68 with SMTP id 5b1f17b1804b1-4bb888160cdmr356298015e9.14.1795583221727;
        Tue, 24 Nov 2026 21:07:01 -0800 (PST)
Received: from localhost ([2001:41d0:700:348d::1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8538b09bsm899911045e9.4.2026.11.24.21.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 21:06:59 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by localhost [127.0.0.1] (msmtpd) with ESMTP;
	Wed, 25 Nov 2026 06:06:59 +0100
Date: Wed, 25 Nov 2026 06:06:59 +0100
From: Miloslav Brada <email@miloslavbrada.cz>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [BUG] ALSA: usb-audio: list_add corruption in
 push_back_to_ready_list() on 7.3.4
Message-ID: <awZs88beIhMcOchv@genesis.transkript.cz>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="236tkRagWtfu4Dzt"
Content-Disposition: inline


--236tkRagWtfu4Dzt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I am still getting a hard lockup (kernel panic in softirq) in
push_back_to_ready_list() with low-latency playback on 7.3.4. That
kernel already contains dbd9d1cbf970 ("ALSA: usb-audio: fix list_add
double-add in push_back_to_ready_list"). The failure is a "list_add
corruption", not a "double add". I decoded the dump against the v7.3.4
struct layout, and it points to a remaining window where a ctx can
be left on ep->ready_playback_urbs after stop_urbs(). Details are
below.

Oops (from EFI pstore, 7.3.4+deb14-amd64, Debian 7.3.4-1):

  slab kmalloc-8k start ffff890c8f11a000 pointer offset 840 size 8192
  list_add corruption. prev->next should be next (ffff890c8f11b590), but was ffff890c8f11a348. (prev=ffff890c8f11a348).
  ------------[ cut here ]------------
  kernel BUG at lib/list_debug.c:32!
  Oops: invalid opcode: 0000 [#1] SMP NOPTI
  CPU: 7 UID: 0 PID: 0 Comm: swapper/7 Tainted: P        W  OE       7.3.4+deb14-amd64 #1 PREEMPT(lazy)  Debian 7.3.4-1
  Tainted: [P]=PROPRIETARY_MODULE, [W]=WARN, [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
  Hardware name: ASUS System Product Name/ROG CROSSHAIR VII HERO (WI-FI), BIOS 4703 03/01/2022
  RIP: 0010:__list_add_valid_or_report+0xa6/0xb0
  RSP: 0018:ffffd2ea803a4da0 EFLAGS: 00010046
  RAX: 0000000000000075 RBX: ffff890c8f11a058 RCX: 0000000000000027
  RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff891afeddd140
  RBP: ffff890c8f11b65c R08: 0000000000000000 R09: ffff891afeb38b80
  R10: 3fffffffffffe388 R11: ffffd2ea803a4c50 R12: ffff890c8f11a000
  R13: 0000000000000000 R14: ffff890c1bc9ec00 R15: ffff890c80da3180
  Call Trace:
   <IRQ>
   push_back_to_ready_list+0x73/0xb0 [snd_usb_audio]
   snd_complete_urb+0xc8/0x6e0 [snd_usb_audio]
   ? __queue_work+0x15b/0x550
   ? led_trigger_blink_oneshot+0x88/0xc0
   __usb_hcd_giveback_urb+0xa0/0x120 [usbcore]
   usb_giveback_urb_bh+0xb3/0x150 [usbcore]
   process_one_work+0x1d6/0x3d0
   bh_worker+0x1de/0x210
   ? xhci_irq+0x92/0xb0 [xhci_hcd]
   tasklet_hi_action+0x13/0x30
   handle_softirqs+0xd9/0x320
   __irq_exit_rcu+0xaa/0x100
   common_interrupt+0x85/0xa0
   </IRQ>
   <TASK>
   asm_common_interrupt+0x26/0x40
   RIP: 0010:mwait_idle+0x47/0x60
   default_idle_call+0x2e/0x100
   do_idle+0x20b/0x310
   cpu_startup_entry+0x29/0x30
   start_secondary+0x126/0x180
   common_startup_64+0x13e/0x151
   </TASK>

The pstore record ends here. The machine was hard-locked and needed
a reset. The full pstore dump is attached.


Decoding the dump
-----------------

The slab object at ffff890c8f11a000 is the struct snd_usb_endpoint.
The x86_64 layout from v7.3.4 card.h is: urb[] at 0x58,
sizeof(struct snd_urb_ctx) = 0x100, ready_list at +0xf0 in the ctx,
next_packet[] at 0xc58, ready_playback_urbs at 0x1590 and lock at
0x165c. The registers match this layout exactly:

  next = ...b590 = ep + 0x1590 = &ep->ready_playback_urbs   (head)
  prev = ...a348 = ep + 0x348  = &ep->urb[2].ready_list
  RBX  = ...a058 = ep + 0x58   = &ep->urb[0]   (ctx being pushed)
  RBP  = ...b65c = ep + 0x165c = &ep->lock

So list_add_tail(&urb[0].ready_list, &ep->ready_playback_urbs) found:

  - head->prev == &urb[2].ready_list (the next->prev check passed), but
  - urb[2].ready_list->next == &urb[2].ready_list, i.e. urb[2]'s node is
    self-linked (INIT_LIST_HEAD'ed / list_del_init'ed) while the list
    head still points at it.


Suspected mechanism
-------------------

With dbd9d1cbf970 applied, every list operation under ep->lock keeps
the head consistent. So does list_del_init() in stop_urbs() and
snd_usb_queue_pending_output_urbs(). The head itself is initialized only
once, in snd_usb_add_endpoint(). Only one place makes a node
self-linked without updating the head: data_ep_set_params() does

    INIT_LIST_HEAD(&u->ready_list);

for every ctx. It does not hold ep->lock and does not unlink the node
first. If a ctx is still on ep->ready_playback_urbs at that point, you
get exactly the state above.

How a ctx can still be linked after a stop: in snd_complete_urb(), the
low-latency path checks ep_state_running() and then calls
push_back_to_ready_list(). It takes ep->lock only inside that call and
does not check the state again:

  CPU A: snd_complete_urb() (BH)       CPU B: trigger STOP (stream lock)
  ------------------------------       ---------------------------------
  retire_outbound_urb()
  ep_state_running(ep) -> true
                                       stop_urbs():
                                         ep_state_update(RUNNING->STOPPING)
                                         lock; list_del_init() all; unlock
  push_back_to_ready_list(ep, ctx)
    lock; list_add_tail(ctx); unlock   <- ctx re-added after the flush
  snd_usb_queue_pending_output_urbs()
    while (ep_state_running(ep)) -> false, nothing dequeued
  atomic_dec_and_test(&ep->submitted_urbs)
                                       wait_clear_urbs(): 0 -> STOPPED

After that, nothing removes the ctx from the list:

  - release_urbs() -> stop_urbs() returns early because the state is
    no longer RUNNING,
  - release_urb_ctx() does not touch ready_list.

On the next hw_params, snd_usb_endpoint_set_params() calls
release_urbs() and data_ep_set_params(). The latter re-INITs the
still-linked ctx, so the head is left pointing at a self-linked node.
PipeWire triggers that hw_params routinely: it closes the PCM on idle
suspend and reopens it later. On the first open of the endpoint,
snd_usb_endpoint_open() sets ep->need_setup.
If snd_usb_endpoint_start() then submits all URBs (nothing goes through
fill_rest), the first URB to complete is urb[0]. Its push_back hits
the corrupted head. That matches the dump: new = urb[0], and
prev = urb[2], which is self-linked.

The same check-then-lock window exists in
snd_usb_queue_pending_output_urbs() on the -EAGAIN path:
ep_state_running() is checked and only then push_back_to_ready_list()
is called.

dbd9d1cbf970 closes the stale next/prev case. It does not close
this race, because a push that runs after the flush in stop_urbs()
still adds the ctx.

The note on that patch said it was based on static analysis and asked
for verification on real hardware [1]. This report is such a data
point. The patch's scenario needs wait_clear_urbs() to hit its timeout.
My kernel log has no "timeout: still N active urbs" message, neither in
the journal nor in the pstore record, which covers the last ~13 minutes
before the crash. So this crash takes a path that does not need the
timeout.

[1] https://lore.kernel.org/all/20260915163110.58124-1-ngocthang2710.1999@gmail.com/


Possible fix (untested, only a sketch)
--------------------------------------

1) Check the state again under ep->lock. stop_urbs() changes the state
   before it takes ep->lock to flush the list, so any push that takes
   the lock after the flush sees !running:

	static void push_back_to_ready_list(struct snd_usb_endpoint *ep,
					    struct snd_urb_ctx *ctx)
	{
		guard(spinlock_irqsave)(&ep->lock);
		/* don't re-queue after stop_urbs() flushed the list */
		if (!ep_state_running(ep))
			return;
		if (list_empty(&ctx->ready_list))
			list_add_tail(&ctx->ready_list, &ep->ready_playback_urbs);
	}

   (snd_usb_endpoint_start() sets RUNNING before its fill_rest loop,
   so that caller is not affected.)

2) Defensively, flush ep->ready_playback_urbs under ep->lock in
   release_urbs() after wait_clear_urbs(), whatever the endpoint state.
   That way data_ep_set_params() never re-INITs a ctx that is still
   linked.

I am not familiar enough with this code to say whether (1) is
sufficient. I can test patches on this machine. The trigger is rare,
though (see below), so a "no crash for N weeks" result would take a
while.


Occurrences
-----------

  - 2026-11-23, 7.3.4+deb14-amd64, uptime ~16480 s. Dump above.
  - 2026-06-15, 6.18.15 (before dbd9d1cbf970). Same BUG at
    lib/list_debug.c:32, list_add corruption in
    push_back_to_ready_list() <- snd_complete_urb(). The next boot
    crashed again ~25 s after boot, during login, when PipeWire opened
    the devices. That pstore dump has not been kept, unfortunately.

Since 2026-09-09 (as far back as my journal goes) the kernel log has
no snd-usb-audio errors: no "Unable to submit urb", no "timeout:
still N active urbs". I cannot reproduce it on demand.

Workaround: "options snd-usb-audio lowlatency=0" has been active
since 2026-11-23 (no crash since, but that is too short to mean
anything yet).


Environment
-----------

  Kernel:    Debian 7.3.4+deb14-amd64 (7.3.4-1). snd_usb_audio
             lowlatency=Y (default) at the time of the crash. The struct
             layout derived from v7.3.4 card.h matches the dump exactly.
  CPU/board: AMD Ryzen 9 3900X, ASUS ROG CROSSHAIR VII HERO (WI-FI),
             BIOS 4703
  USB audio devices:
    - Topping DX5 II, 152a:8750 (Thesycon UAC2 firmware), high speed,
      on a hub behind the Renesas uPD720201 xHCI (0000:0c:00.0-1.2).
      Playback EP 0x01 async, explicit feedback EP 0x81,
      "Implicit Feedback Mode: No", S32_LE 2ch, 125 us interval.
      This is the normal playback device.
    - Samson C01U Pro Mic, 17a0:0303, full speed, playback + capture,
      on the AMD xHCI (0000:09:00.0-7)
    - Arturia KeyLab mkII 61, 1c75:028b, full speed (MIDI)
  Userspace: PipeWire 1.6.9, WirePlumber 0.5.19, clock.rate 96000,
             allowed rates 44100/48000/88200/96000/192000,
             quantum 1024 (min 32, max 2048), default idle suspend.

Taint: P/O/E come from the proprietary NVIDIA 550.163.01 driver and an
out-of-tree mouse-acceleration module (yeetmouse). W comes from an
unrelated nvidia-drm WARN (nv_drm_revoke_modeset_permission) 13 s
earlier. Neither of them is in the crashing path. The corrupted object is
an snd_usb_endpoint, and every pointer in the report decodes to its
fields. I understand if you would prefer an untainted reproduction, but
with an interval of weeks to months between hits that is hard to
provide.

Thanks,
Miloslav Brada

--236tkRagWtfu4Dzt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="pstore-dmesg-2026-11-23.txt"
Content-Transfer-Encoding: quoted-printable

Oops#1 Part15
<4>[15707.267743]  battery irqbypass vfat sp5100_tco nvidia(POE) squashfs f=
at loop asus_wmi_sensors snd_hda_codec watchdog video rapl wmi_bmof mxm_wmi=
 bluetooth snd_rawmidi ahci cfg80211 snd_hda_core k10temp snd_seq_device i2=
c_piix4 libahci snd_intel_dspcfg snd_intel_sdw_acpi i2c_smbus mc snd_hwdep =
ccp libata cdc_acm ecdh_generic snd_pcm snd_timer rfkill igb crc16 snd scsi=
_mod libarc4 dca i2c_algo_bit soundcore scsi_common drm dm_mod lp parport_p=
c ppdev parport i2c_dev nvme_fabrics configfs efi_pstore autofs4 btrfs libb=
lake2b raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor asy=
nc_tx raid6_pq xor raid1 raid0 md_mod joydev hid_generic usbhid hid xhci_pc=
i_renesas xhci_pci xhci_hcd yeetmouse(OE) aesni_intel nvme gf128mul usbcore=
 nvme_core evdev pcspkr nvme_keyring usb_common nvme_auth gpio_amdpt wmi gp=
io_generic button efivarfs
<4>[15707.267792] CPU: 13 UID: 1000 PID: 43326 Comm: wezterm-gui Tainted: P=
        W  OE       7.3.4+deb14-amd64 #1 PREEMPT(lazy)  Debian 7.3.4-1=20
<4>[15707.267796] Tainted: [P]=3DPROPRIETARY_MODULE, [W]=3DWARN, [O]=3DOOT_=
MODULE, [E]=3DUNSIGNED_MODULE
<4>[15707.267796] Hardware name: ASUS System Product Name/ROG CROSSHAIR VII=
 HERO (WI-FI), BIOS 4703 03/01/2022
<4>[15707.267798] RIP: 0010:nv_drm_revoke_modeset_permission+0x3b8/0x3e0 [n=
vidia_drm]
<4>[15707.267802] Code: bd 58 01 00 00 e8 48 35 5b ed e9 03 fd ff ff 48 8b =
3c 24 be 03 00 00 00 89 44 24 1c e8 31 6e e1 ec 8b 44 24 1c e9 f1 fd ff ff =
<0f> 0b e9 29 fe ff ff be 03 00 00 00 31 ff e8 15 6e e1 ec e9 3f fd
<4>[15707.267804] RSP: 0018:ffffd2eaac233d50 EFLAGS: 00010246
Oops#1 Part14
<4>[15707.267805] RAX: ffff8915ffa09800 RBX: ffff890d27ecbc00 RCX: ffffffff=
c0bc3d86
<4>[15707.267806] RDX: 0000000000000004 RSI: 0000000000000000 RDI: ffff890c=
91a9c958
<4>[15707.267807] RBP: ffff890d27ecbc00 R08: ffff8915ffa09848 R09: 00000000=
00000000
<4>[15707.267808] R10: 0000000000000010 R11: 0000000000000000 R12: ffff890c=
91a9c800
<4>[15707.267809] R13: ffff890c91a9c800 R14: ffff890c02e596a0 R15: 00000000=
00000000
<4>[15707.267810] FS:  00007f84de9ccac0(0000) GS:ffff891b4a71b000(0000) knl=
GS:0000000000000000
<4>[15707.267811] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[15707.267812] CR2: 00007f84ae2f4910 CR3: 000000085348c000 CR4: 00000000=
00350ef0
<4>[15707.267814] Call Trace:
<4>[15707.267816]  <TASK>
<4>[15707.267820]  drm_file_free+0x237/0x2a0 [drm]
<4>[15707.267857]  drm_release+0x5c/0xe0 [drm]
<4>[15707.267881]  __fput+0xf6/0x2e0
<4>[15707.267886]  __x64_sys_close+0x47/0xa0
<4>[15707.267888]  do_syscall_64+0xc1/0x570
<4>[15707.267891]  ? do_syscall_64+0xfe/0x570
<4>[15707.267892]  ? do_user_addr_fault+0x2c7/0x850
<4>[15707.267896]  ? irqentry_exit+0x4a/0x680
<4>[15707.267897]  ? do_syscall_64+0x37/0x570
<4>[15707.267898]  ? __irq_exit_rcu+0x3d/0x100
<4>[15707.267901]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
<4>[15707.267903] RIP: 0033:0x7f84deca6efe
<4>[15707.267927] Code: 08 0f 85 35 4a ff ff 49 89 fb 48 89 f0 48 89 d7 48 =
89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 =
<c3> 90 48 83 ec 08 bf 01 00 00 00 e8 a2 dc 05 00 bf 01 00 00 00 89
<4>[15707.267928] RSP: 002b:00007ffde4480938 EFLAGS: 00000246 ORIG_RAX: 000=
0000000000003
<4>[15707.267930] RAX: ffffffffffffffda RBX: 0000564b8262eb60 RCX: 00007f84=
deca6efe
Oops#1 Part13
<4>[15707.267931] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000=
00000021
<4>[15707.267932] RBP: 00000000beef00a0 R08: 0000000000000000 R09: 00000000=
00000000
<4>[15707.267933] R10: 0000000000000000 R11: 0000000000000246 R12: 00000000=
00000001
<4>[15707.267934] R13: 00007f84afaff620 R14: 0000564b82630d90 R15: 0000564b=
8262eb60
<4>[15707.267937]  </TASK>
<4>[15707.267937] ---[ end trace 0000000000000000 ]---
<6>[15707.269550] ------------[ cut here ]------------
<4>[15707.269553] WARNING: nvidia-drm/nvidia-drm-drv.c:1226 at nv_drm_revok=
e_modeset_permission+0x3b8/0x3e0 [nvidia_drm], CPU#13: wezterm-gui/43326
<4>[15707.269562] Modules linked in: tcp_diag inet_diag rfcomm nls_utf8 cif=
s nls_ucs2_utils cifs_md4 dns_resolver netfs nf_conntrack_netlink xt_nat ve=
th snd_seq_dummy snd_hrtimer nvidia_uvm(POE) snd_seq_midi snd_seq_midi_even=
t snd_seq br_netfilter xfrm_user xfrm_algo xt_set ip_set xt_addrtype xt_CHE=
CKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp nft_co=
mpat x_tables nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ip=
v4 nf_tables bridge stp llc qrtr ovpn ip6_udp_tunnel udp_tunnel overlay alg=
if_hash algif_skcipher af_alg bnep msr nvidia_drm(POE) drm_ttm_helper ttm d=
rm_client_lib drm_kms_helper nvidia_modeset(POE) intel_rapl_msr intel_rapl_=
common rtw88_8822be edac_mce_amd rtw88_8822b rtw88_pci rtw88_core kvm_amd s=
unrpc binfmt_misc mac80211 sd_mod snd_hda_codec_alc882 kvm snd_hda_codec_re=
altek_lib sg snd_hda_codec_nvhdmi btusb snd_hda_codec_generic snd_hda_codec=
_hdmi ee1004 btmtk snd_usb_audio btrtl eeepc_wmi nls_ascii asus_wmi btbcm n=
ls_cp437 sparse_keymap snd_usbmidi_lib btintel snd_hda_intel
Oops#1 Part12
<4>[15707.269599]  battery irqbypass vfat sp5100_tco nvidia(POE) squashfs f=
at loop asus_wmi_sensors snd_hda_codec watchdog video rapl wmi_bmof mxm_wmi=
 bluetooth snd_rawmidi ahci cfg80211 snd_hda_core k10temp snd_seq_device i2=
c_piix4 libahci snd_intel_dspcfg snd_intel_sdw_acpi i2c_smbus mc snd_hwdep =
ccp libata cdc_acm ecdh_generic snd_pcm snd_timer rfkill igb crc16 snd scsi=
_mod libarc4 dca i2c_algo_bit soundcore scsi_common drm dm_mod lp parport_p=
c ppdev parport i2c_dev nvme_fabrics configfs efi_pstore autofs4 btrfs libb=
lake2b raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor asy=
nc_tx raid6_pq xor raid1 raid0 md_mod joydev hid_generic usbhid hid xhci_pc=
i_renesas xhci_pci xhci_hcd yeetmouse(OE) aesni_intel nvme gf128mul usbcore=
 nvme_core evdev pcspkr nvme_keyring usb_common nvme_auth gpio_amdpt wmi gp=
io_generic button efivarfs
<4>[15707.269642] CPU: 13 UID: 1000 PID: 43326 Comm: wezterm-gui Tainted: P=
        W  OE       7.3.4+deb14-amd64 #1 PREEMPT(lazy)  Debian 7.3.4-1=20
<4>[15707.269645] Tainted: [P]=3DPROPRIETARY_MODULE, [W]=3DWARN, [O]=3DOOT_=
MODULE, [E]=3DUNSIGNED_MODULE
<4>[15707.269646] Hardware name: ASUS System Product Name/ROG CROSSHAIR VII=
 HERO (WI-FI), BIOS 4703 03/01/2022
<4>[15707.269647] RIP: 0010:nv_drm_revoke_modeset_permission+0x3b8/0x3e0 [n=
vidia_drm]
<4>[15707.269651] Code: bd 58 01 00 00 e8 48 35 5b ed e9 03 fd ff ff 48 8b =
3c 24 be 03 00 00 00 89 44 24 1c e8 31 6e e1 ec 8b 44 24 1c e9 f1 fd ff ff =
<0f> 0b e9 29 fe ff ff be 03 00 00 00 31 ff e8 15 6e e1 ec e9 3f fd
<4>[15707.269652] RSP: 0018:ffffd2eaac233a50 EFLAGS: 00010246
<4>[15707.269654] RAX: ffff891173f15800 RBX: ffff89130db36a00 RCX: ffffffff=
c0bc3d86
Oops#1 Part11
<4>[15707.269655] RDX: 0000000000000004 RSI: 0000000000000000 RDI: ffff890c=
91a9c958
<4>[15707.269655] RBP: ffff89130db36a00 R08: ffff891173f15848 R09: 00000000=
00000000
<4>[15707.269656] R10: 0000000000000010 R11: 0000000000000000 R12: ffff890c=
91a9c800
<4>[15707.269657] R13: ffff890c91a9c800 R14: ffff890c02e596a0 R15: 00000000=
00000000
<4>[15707.269658] FS:  00007f84de9ccac0(0000) GS:ffff891b4a71b000(0000) knl=
GS:0000000000000000
<4>[15707.269659] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[15707.269660] CR2: 00007f84ae2f4910 CR3: 000000085348c000 CR4: 00000000=
00350ef0
<4>[15707.269662] Call Trace:
<4>[15707.269663]  <TASK>
<4>[15707.269666]  drm_file_free+0x237/0x2a0 [drm]
<4>[15707.269699]  drm_release+0x5c/0xe0 [drm]
<4>[15707.269723]  __fput+0xf6/0x2e0
<4>[15707.269726]  __x64_sys_close+0x47/0xa0
<4>[15707.269727]  do_syscall_64+0xc1/0x570
<4>[15707.269729]  ? __check_object_size+0x1fa/0x220
<4>[15707.269732]  ? _copy_to_user+0x31/0x40
<4>[15707.269735]  ? nvidia_unlocked_ioctl+0x17d/0x910 [nvidia]
<4>[15707.269985]  ? __x64_sys_ioctl+0xd4/0x100
<4>[15707.269988]  ? free_frozen_page_commit+0xa5/0x4b0
<4>[15707.269990]  ? __slab_free+0x207/0x2e0
<4>[15707.269993]  ? __kmem_cache_free_bulk.part.0+0xa5/0xe0
<4>[15707.269995]  ? __pcs_replace_full_main+0x1c2/0x3b0
<4>[15707.269996]  ? up+0x6c/0x110
<4>[15707.269999]  ? __memcg_slab_free_hook+0x16d/0x1c0
<4>[15707.270002]  ? kmem_cache_free+0x286/0x480
<4>[15707.270003]  ? __x64_sys_close+0x47/0xa0
<4>[15707.270004]  ? __x64_sys_close+0x47/0xa0
<4>[15707.270006]  ? do_syscall_64+0xfe/0x570
<4>[15707.270007]  ? exit_to_user_mode_loop+0x11c/0x5a0
<4>[15707.270009]  ? do_syscall_64+0x23a/0x570
Oops#1 Part10
<4>[15707.270011]  ? irqentry_exit+0x4a/0x680
<4>[15707.270012]  ? do_syscall_64+0x37/0x570
<4>[15707.270013]  ? __irq_exit_rcu+0x3d/0x100
<4>[15707.270015]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
<4>[15707.270017] RIP: 0033:0x7f84deca6efe
<4>[15707.270038] Code: 08 0f 85 35 4a ff ff 49 89 fb 48 89 f0 48 89 d7 48 =
89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 =
<c3> 90 48 83 ec 08 bf 01 00 00 00 e8 a2 dc 05 00 bf 01 00 00 00 89
<4>[15707.270039] RSP: 002b:00007ffde4480958 EFLAGS: 00000246 ORIG_RAX: 000=
0000000000003
<4>[15707.270041] RAX: ffffffffffffffda RBX: 00007f84dd3db838 RCX: 00007f84=
deca6efe
<4>[15707.270042] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000=
0000001b
<4>[15707.270043] RBP: 0000564b823b9a90 R08: 0000000000000000 R09: 00000000=
00000000
<4>[15707.270043] R10: 0000000000000000 R11: 0000000000000246 R12: 00000000=
0000a93e
<4>[15707.270044] R13: 00007ffde4480b30 R14: 00007ffde4480b28 R15: 0000564b=
825d3900
<4>[15707.270046]  </TASK>
<4>[15707.270047] ---[ end trace 0000000000000000 ]---
<6>[15773.596550] docker0: port 3(vethcac3544) entered blocking state
<6>[15773.596555] docker0: port 3(vethcac3544) entered disabled state
<6>[15773.596562] vethcac3544: entered allmulticast mode
<6>[15773.596610] vethcac3544: entered promiscuous mode
<6>[15773.621715] eth0: renamed from vethab7dba4
<6>[15773.622111] docker0: port 3(vethcac3544) entered blocking state
<6>[15773.622117] docker0: port 3(vethcac3544) entered forwarding state
<6>[15774.061736] br-dcfb19e52cfc: port 1(vethc291b87) entered blocking sta=
te
<6>[15774.061742] br-dcfb19e52cfc: port 1(vethc291b87) entered disabled sta=
te
Oops#1 Part9
<6>[15774.061750] vethc291b87: entered allmulticast mode
<6>[15774.061793] vethc291b87: entered promiscuous mode
<6>[15774.092776] eth0: renamed from veth46f3887
<6>[15774.093103] br-dcfb19e52cfc: port 1(vethc291b87) entered blocking sta=
te
<6>[15774.093107] br-dcfb19e52cfc: port 1(vethc291b87) entered forwarding s=
tate
<6>[16098.806341] br-dcfb19e52cfc: port 1(vethc291b87) entered disabled sta=
te
<6>[16098.806391] veth46f3887: renamed from eth0
<6>[16098.869321] br-dcfb19e52cfc: port 1(vethc291b87) entered disabled sta=
te
<6>[16098.869690] vethc291b87 (unregistering): left allmulticast mode
<6>[16098.869695] vethc291b87 (unregistering): left promiscuous mode
<6>[16098.869698] br-dcfb19e52cfc: port 1(vethc291b87) entered disabled sta=
te
<6>[16109.762255] docker0: port 3(vethcac3544) entered disabled state
<6>[16109.762329] vethab7dba4: renamed from eth0
<6>[16109.829069] docker0: port 3(vethcac3544) entered disabled state
<6>[16109.829655] vethcac3544 (unregistering): left allmulticast mode
<6>[16109.829659] vethcac3544 (unregistering): left promiscuous mode
<6>[16109.829662] docker0: port 3(vethcac3544) entered disabled state
<6>[16386.959808] docker0: port 3(veth0fe1bf2) entered blocking state
<6>[16386.959814] docker0: port 3(veth0fe1bf2) entered disabled state
<6>[16386.959823] veth0fe1bf2: entered allmulticast mode
<6>[16386.959960] veth0fe1bf2: entered promiscuous mode
<6>[16386.983919] eth0: renamed from veth3360e7a
<6>[16386.984275] docker0: port 3(veth0fe1bf2) entered blocking state
<6>[16386.984279] docker0: port 3(veth0fe1bf2) entered forwarding state
<6>[16387.463940] br-bce342fb9896: port 1(veth895844c) entered blocking sta=
te
Oops#1 Part8
<6>[16387.463945] br-bce342fb9896: port 1(veth895844c) entered disabled sta=
te
<6>[16387.463950] veth895844c: entered allmulticast mode
<6>[16387.464001] veth895844c: entered promiscuous mode
<6>[16387.494932] eth0: renamed from veth981a5f1
<6>[16387.495262] br-bce342fb9896: port 1(veth895844c) entered blocking sta=
te
<6>[16387.495265] br-bce342fb9896: port 1(veth895844c) entered forwarding s=
tate
<6>[16466.677399] ------------[ cut here ]------------
<4>[16466.677404] WARNING: nvidia-drm/nvidia-drm-drv.c:1226 at nv_drm_revok=
e_modeset_permission+0x3b8/0x3e0 [nvidia_drm], CPU#0: wezterm-gui/770481
<4>[16466.677414] Modules linked in: tcp_diag inet_diag rfcomm nls_utf8 cif=
s nls_ucs2_utils cifs_md4 dns_resolver netfs nf_conntrack_netlink xt_nat ve=
th snd_seq_dummy snd_hrtimer nvidia_uvm(POE) snd_seq_midi snd_seq_midi_even=
t snd_seq br_netfilter xfrm_user xfrm_algo xt_set ip_set xt_addrtype xt_CHE=
CKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp nft_co=
mpat x_tables nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ip=
v4 nf_tables bridge stp llc qrtr ovpn ip6_udp_tunnel udp_tunnel overlay alg=
if_hash algif_skcipher af_alg bnep msr nvidia_drm(POE) drm_ttm_helper ttm d=
rm_client_lib drm_kms_helper nvidia_modeset(POE) intel_rapl_msr intel_rapl_=
common rtw88_8822be edac_mce_amd rtw88_8822b rtw88_pci rtw88_core kvm_amd s=
unrpc binfmt_misc mac80211 sd_mod snd_hda_codec_alc882 kvm snd_hda_codec_re=
altek_lib sg snd_hda_codec_nvhdmi btusb snd_hda_codec_generic snd_hda_codec=
_hdmi ee1004 btmtk snd_usb_audio btrtl eeepc_wmi nls_ascii asus_wmi btbcm n=
ls_cp437 sparse_keymap snd_usbmidi_lib btintel snd_hda_intel
Oops#1 Part7
<4>[16466.677453]  battery irqbypass vfat sp5100_tco nvidia(POE) squashfs f=
at loop asus_wmi_sensors snd_hda_codec watchdog video rapl wmi_bmof mxm_wmi=
 bluetooth snd_rawmidi ahci cfg80211 snd_hda_core k10temp snd_seq_device i2=
c_piix4 libahci snd_intel_dspcfg snd_intel_sdw_acpi i2c_smbus mc snd_hwdep =
ccp libata cdc_acm ecdh_generic snd_pcm snd_timer rfkill igb crc16 snd scsi=
_mod libarc4 dca i2c_algo_bit soundcore scsi_common drm dm_mod lp parport_p=
c ppdev parport i2c_dev nvme_fabrics configfs efi_pstore autofs4 btrfs libb=
lake2b raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor asy=
nc_tx raid6_pq xor raid1 raid0 md_mod joydev hid_generic usbhid hid xhci_pc=
i_renesas xhci_pci xhci_hcd yeetmouse(OE) aesni_intel nvme gf128mul usbcore=
 nvme_core evdev pcspkr nvme_keyring usb_common nvme_auth gpio_amdpt wmi gp=
io_generic button efivarfs
<4>[16466.677501] CPU: 0 UID: 1000 PID: 770481 Comm: wezterm-gui Tainted: P=
        W  OE       7.3.4+deb14-amd64 #1 PREEMPT(lazy)  Debian 7.3.4-1=20
Oops#1 Part6
<4>[16466.677504] Tainted: [P]=3DPROPRIETARY_MODULE, [W]=3DWARN, [O]=3DOOT_=
MODULE, [E]=3DUNSIGNED_MODULE
<4>[16466.677505] Hardware name: ASUS System Product Name/ROG CROSSHAIR VII=
 HERO (WI-FI), BIOS 4703 03/01/2022
<4>[16466.677506] RIP: 0010:nv_drm_revoke_modeset_permission+0x3b8/0x3e0 [n=
vidia_drm]
<4>[16466.677510] Code: bd 58 01 00 00 e8 48 35 5b ed e9 03 fd ff ff 48 8b =
3c 24 be 03 00 00 00 89 44 24 1c e8 31 6e e1 ec 8b 44 24 1c e9 f1 fd ff ff =
<0f> 0b e9 29 fe ff ff be 03 00 00 00 31 ff e8 15 6e e1 ec e9 3f fd
<4>[16466.677512] RSP: 0018:ffffd2eab188bdb0 EFLAGS: 00010246
<4>[16466.677513] RAX: ffff890d0ef57800 RBX: ffff891794199a00 RCX: ffffffff=
c0bc3d86
<4>[16466.677515] RDX: 0000000000000004 RSI: 0000000000000000 RDI: ffff890c=
91a9c958
<4>[16466.677515] RBP: ffff891794199a00 R08: ffff890d0ef57848 R09: 00000000=
00000000
<4>[16466.677516] R10: 0000000000000010 R11: 0000000000000000 R12: ffff890c=
91a9c800
<4>[16466.677517] R13: ffff890c91a9c800 R14: ffff890c02e596a0 R15: 00000000=
00000000
<4>[16466.677518] FS:  00007f998e2a0ac0(0000) GS:ffff891b4a3db000(0000) knl=
GS:0000000000000000
<4>[16466.677520] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[16466.677521] CR2: 000055ad1ecedd88 CR3: 00000002082de000 CR4: 00000000=
00350ef0
<4>[16466.677522] Call Trace:
<4>[16466.677524]  <TASK>
<4>[16466.677529]  drm_file_free+0x237/0x2a0 [drm]
<4>[16466.677564]  drm_release+0x5c/0xe0 [drm]
<4>[16466.677589]  __fput+0xf6/0x2e0
<4>[16466.677594]  __x64_sys_close+0x47/0xa0
<4>[16466.677596]  do_syscall_64+0xc1/0x570
<4>[16466.677599]  ? do_syscall_64+0xfe/0x570
Oops#1 Part5
<4>[16466.677600]  ? do_syscall_64+0x37/0x570
<4>[16466.677601]  ? __irq_exit_rcu+0x3d/0x100
<4>[16466.677604]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
<4>[16466.677606] RIP: 0033:0x7f998e6a6efe
<4>[16466.677629] Code: 08 0f 85 35 4a ff ff 49 89 fb 48 89 f0 48 89 d7 48 =
89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 =
<c3> 90 48 83 ec 08 bf 01 00 00 00 e8 a2 dc 05 00 bf 01 00 00 00 89
<4>[16466.677630] RSP: 002b:00007ffc3e441188 EFLAGS: 00000246 ORIG_RAX: 000=
0000000000003
<4>[16466.677632] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f99=
8e6a6efe
<4>[16466.677633] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000=
00000022
<4>[16466.677634] RBP: 00007ffc3e441220 R08: 0000000000000000 R09: 00000000=
00000000
<4>[16466.677635] R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffc=
3e441370
<4>[16466.677635] R13: 000055ad1ece5d50 R14: 0000000000000022 R15: 00000000=
00000000
<4>[16466.677638]  </TASK>
<4>[16466.677639] ---[ end trace 0000000000000000 ]---
<5>[16466.678049] audit: type=3D1400 audit(1795429519.167:452): apparmor=3D=
"ALLOWED" operation=3D"unlink" class=3D"file" profile=3D"Xorg" name=3D"/dev=
/char/195:254" pid=3D2843 comm=3D"Xorg" requested_mask=3D"d" denied_mask=3D=
"d" fsuid=3D0 ouid=3D0
<5>[16466.678055] audit: type=3D1400 audit(1795429519.167:453): apparmor=3D=
"ALLOWED" operation=3D"symlink" class=3D"file" profile=3D"Xorg" name=3D"/de=
v/char/195:254" pid=3D2843 comm=3D"Xorg" requested_mask=3D"c" denied_mask=
=3D"c" fsuid=3D0 ouid=3D0
<5>[16466.688576] audit: type=3D1400 audit(1795429519.179:454): apparmor=3D=
"ALLOWED" operation=3D"unlink" class=3D"file" profile=3D"Xorg" name=3D"/dev=
/char/195:254" pid=3D2843 comm=3D"Xorg" requested_mask=3D"d" denied_mask=3D=
"d" fsuid=3D0 ouid=3D0
Oops#1 Part4
<5>[16466.688585] audit: type=3D1400 audit(1795429519.179:455): apparmor=3D=
"ALLOWED" operation=3D"symlink" class=3D"file" profile=3D"Xorg" name=3D"/de=
v/char/195:254" pid=3D2843 comm=3D"Xorg" requested_mask=3D"c" denied_mask=
=3D"c" fsuid=3D0 ouid=3D0
<4>[16479.883476]  slab kmalloc-8k start ffff890c8f11a000 pointer offset 84=
0 size 8192
<3>[16479.883483] list_add corruption. prev->next should be next (ffff890c8=
f11b590), but was ffff890c8f11a348. (prev=3Dffff890c8f11a348).
<6>[16479.883495] ------------[ cut here ]------------
<2>[16479.883496] kernel BUG at lib/list_debug.c:32!
<4>[16479.883501] Oops: invalid opcode: 0000 [#1] SMP NOPTI
<4>[16479.883505] CPU: 7 UID: 0 PID: 0 Comm: swapper/7 Tainted: P        W =
 OE       7.3.4+deb14-amd64 #1 PREEMPT(lazy)  Debian 7.3.4-1=20
<4>[16479.883509] Tainted: [P]=3DPROPRIETARY_MODULE, [W]=3DWARN, [O]=3DOOT_=
MODULE, [E]=3DUNSIGNED_MODULE
<4>[16479.883510] Hardware name: ASUS System Product Name/ROG CROSSHAIR VII=
 HERO (WI-FI), BIOS 4703 03/01/2022
<4>[16479.883512] RIP: 0010:__list_add_valid_or_report+0xa6/0xb0
<4>[16479.883517] Code: c7 48 89 54 24 08 48 89 04 24 e8 45 8f b7 ff 48 8b =
04 24 48 8b 74 24 08 48 c7 c7 d0 5e 49 b3 48 8b 10 48 89 c1 e8 3a 73 68 ff =
<0f> 0b 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90
<4>[16479.883519] RSP: 0018:ffffd2ea803a4da0 EFLAGS: 00010046
<4>[16479.883521] RAX: 0000000000000075 RBX: ffff890c8f11a058 RCX: 00000000=
00000027
<4>[16479.883523] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff891a=
feddd140
<4>[16479.883524] RBP: ffff890c8f11b65c R08: 0000000000000000 R09: ffff891a=
feb38b80
Oops#1 Part3
<4>[16479.883525] R10: 3fffffffffffe388 R11: ffffd2ea803a4c50 R12: ffff890c=
8f11a000
<4>[16479.883526] R13: 0000000000000000 R14: ffff890c1bc9ec00 R15: ffff890c=
80da3180
<4>[16479.883527] FS:  0000000000000000(0000) GS:ffff891b4a59b000(0000) knl=
GS:0000000000000000
<4>[16479.883528] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[16479.883530] CR2: 00007fc2cee206e8 CR3: 00000001d357f000 CR4: 00000000=
00350ef0
<4>[16479.883531] Call Trace:
<4>[16479.883533]  <IRQ>
<4>[16479.883538]  push_back_to_ready_list+0x73/0xb0 [snd_usb_audio]
<4>[16479.883554]  snd_complete_urb+0xc8/0x6e0 [snd_usb_audio]
<4>[16479.883567]  ? __queue_work+0x15b/0x550
<4>[16479.883571]  ? led_trigger_blink_oneshot+0x88/0xc0
<4>[16479.883574]  __usb_hcd_giveback_urb+0xa0/0x120 [usbcore]
<4>[16479.883593]  usb_giveback_urb_bh+0xb3/0x150 [usbcore]
<4>[16479.883606]  process_one_work+0x1d6/0x3d0
<4>[16479.883609]  bh_worker+0x1de/0x210
<4>[16479.883611]  ? xhci_irq+0x92/0xb0 [xhci_hcd]
<4>[16479.883626]  tasklet_hi_action+0x13/0x30
<4>[16479.883629]  handle_softirqs+0xd9/0x320
<4>[16479.883631]  __irq_exit_rcu+0xaa/0x100
<4>[16479.883633]  common_interrupt+0x85/0xa0
<4>[16479.883637]  </IRQ>
<4>[16479.883637]  <TASK>
<4>[16479.883638]  asm_common_interrupt+0x26/0x40
<4>[16479.883641] RIP: 0010:mwait_idle+0x47/0x60
<4>[16479.883643] Code: 00 f0 80 0e 40 48 f7 06 10 00 00 00 75 22 48 89 f0 =
0f 1f 00 31 c9 89 ca 0f 01 c8 48 f7 06 10 00 00 00 75 0c 89 c8 fb 0f 01 c9 =
<fa> 0f 1f 44 00 00 f0 80 26 bf c3 cc cc cc cc 66 2e 0f 1f 84 00 00
<4>[16479.883644] RSP: 0018:ffffd2ea801afeb8 EFLAGS: 00000246
<4>[16479.883646] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00000000=
00000000
Oops#1 Part2
<4>[16479.883647] RDX: 0000000000000000 RSI: ffff890c00c28000 RDI: 00000000=
10a82fcc
<4>[16479.883648] RBP: ffff890c00c28000 R08: fffffff6ceee5352 R09: 00000000=
007dbe3c
<4>[16479.883649] R10: 00000f063d775dea R11: 0000000000000000 R12: 00000000=
00000000
<4>[16479.883650] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000=
00000000
<4>[16479.883653]  default_idle_call+0x2e/0x100
<4>[16479.883655]  ? arch_cpu_idle_enter+0x10/0x20
<4>[16479.883658]  do_idle+0x20b/0x310
<4>[16479.883660]  cpu_startup_entry+0x29/0x30
<4>[16479.883662]  start_secondary+0x126/0x180
<4>[16479.883664]  common_startup_64+0x13e/0x151
<4>[16479.883667]  </TASK>
<4>[16479.883668] Modules linked in: tcp_diag inet_diag rfcomm nls_utf8 cif=
s nls_ucs2_utils cifs_md4 dns_resolver netfs nf_conntrack_netlink xt_nat ve=
th snd_seq_dummy snd_hrtimer nvidia_uvm(POE) snd_seq_midi snd_seq_midi_even=
t snd_seq br_netfilter xfrm_user xfrm_algo xt_set ip_set xt_addrtype xt_CHE=
CKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp nft_co=
mpat x_tables nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ip=
v4 nf_tables bridge stp llc qrtr ovpn ip6_udp_tunnel udp_tunnel overlay alg=
if_hash algif_skcipher af_alg bnep msr nvidia_drm(POE) drm_ttm_helper ttm d=
rm_client_lib drm_kms_helper nvidia_modeset(POE) intel_rapl_msr intel_rapl_=
common rtw88_8822be edac_mce_amd rtw88_8822b rtw88_pci rtw88_core kvm_amd s=
unrpc binfmt_misc mac80211 sd_mod snd_hda_codec_alc882 kvm snd_hda_codec_re=
altek_lib sg snd_hda_codec_nvhdmi btusb snd_hda_codec_generic snd_hda_codec=
_hdmi ee1004 btmtk snd_usb_audio btrtl eeepc_wmi nls_ascii asus_wmi btbcm n=
ls_cp437 sparse_keymap snd_usbmidi_lib btintel snd_hda_intel
Oops#1 Part1
<4>[16479.883714]  battery irqbypass vfat sp5100_tco nvidia(POE) squashfs f=
at loop asus_wmi_sensors snd_hda_codec watchdog video rapl wmi_bmof mxm_wmi=
 bluetooth snd_rawmidi ahci cfg80211 snd_hda_core k10temp snd_seq_device i2=
c_piix4 libahci snd_intel_dspcfg snd_intel_sdw_acpi i2c_smbus mc snd_hwdep =
ccp libata cdc_acm ecdh_generic snd_pcm snd_timer rfkill igb crc16 snd scsi=
_mod libarc4 dca i2c_algo_bit soundcore scsi_common drm dm_mod lp parport_p=
c ppdev parport i2c_dev nvme_fabrics configfs efi_pstore autofs4 btrfs libb=
lake2b raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor asy=
nc_tx raid6_pq xor raid1 raid0 md_mod joydev hid_generic usbhid hid xhci_pc=
i_renesas xhci_pci xhci_hcd yeetmouse(OE) aesni_intel nvme gf128mul usbcore=
 nvme_core evdev pcspkr nvme_keyring usb_common nvme_auth gpio_amdpt wmi gp=
io_generic button efivarfs
<4>[16479.883762] ---[ end trace 0000000000000000 ]---

--236tkRagWtfu4Dzt--
