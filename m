Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E4D3BFE4F
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 04:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791950659; cv=none; b=AaSkKueSyQ+u5i+FOy4fGHewQx57vqpa0mdvlQM+I9HZ9R2OHGskKOhJksdGmDqx2Jd/7T06yBMRENxYLTTaG/vGGpMPxTLU/j/3DrkNKFFLl72UiCDymxtRvYZCYfumXBcxdENwpVg+/OYSTQBIkmAbscYq69yGMJxj8QyXBCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791950659; c=relaxed/simple;
	bh=TELD3byFoCzJHt38ueExDSjtqsJaLcUD5OsQqlJ9dpY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=qMdJy4EpjUVFOmrZ1FG6rrgpDL7yn7WxSI2/NkZPkFUK9fqatgIOKCTbNUQz6UdyACyLLyXGH1pvJEHOOlFYGr25EHdGYNAYsz8TeoZgElFUiZ1aL6EpAHsPjI7a52qZkfNEaVfOSPyuIOUTi26bwCG6L4M+Io2iBRC4YpLsEgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cg9egB0m; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cg9egB0m"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-878b44611ffso2384994b3a.3
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 21:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791950657; x=1792555457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+H2FgfTIXFxXOrQjvN5z55LLIoVUW5IktN5x14SgkI=;
        b=cg9egB0mNzDHJVrYvAPkU2oGr/ePzujL1LZl2D6/C9kvqTJ7K68ZCcEQmtEjG+Rrpg
         SQK10CMQmmPCgSt0z5ZC4nTZBWYr2YFjgufmqhXsObX6SHXE4qlr3yKilVITITIvmjy4
         egdQk07sc7vUSH/SPRCtQkrjqOiCPeRzPJ13SkKd/GxJg5AmN8lQWAJVGs6IMfoymqDJ
         +v94PWq2DqR3/4vxW0f+jpo8YshIUP3XfGY64q3qukyKKyKmvCrIGFtS0XJjdW4fH/Q5
         UsZkdsOGDtoJfSv332uc9oEB4zq1NyvAMQjgAOZSMsqr0o7Q2mAxYKWf8AMOK81pM0vi
         MCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791950657; x=1792555457;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c+H2FgfTIXFxXOrQjvN5z55LLIoVUW5IktN5x14SgkI=;
        b=Qr2gwCND5HQW5caCjpMjCRf+4TZAenmk0cZSWYEg+Up1h8twA8zRP+AvL3NvtDZDLi
         JWSVmhEYOEBSgWC3XItyiuCNP5x1LZP4KULVOQEdZeAL8YhruxTN9Hsdk9EnkLqZwKxd
         X8/TtvxGjYAu4D9eN4fvnD77eMREh7ko1MjllXqS6g/OuemuBPc8KY1wL0RbFrysSQZw
         AHVoYp/04gECAdaIw3p/YoG+bPSwmqlBhUF4hxowBj+ydY/52argSx5Pdx0ZYI0rsyfM
         sh/odG5bfN92kcRQrK3d8k8hu2h1pO0aavjSp1KW5fPEluCcYXTfeWuabXRHmDTFoPOr
         59qg==
X-Gm-Message-State: AFq9FYJWSyuHLXFWOSqI+ivg3sGBp6p6IBcn/rhQZHbnc0i3yrzc4Meo
	BTor52YkOX66AVr+CBoPDDIkvQyi3xOA51yPezh/1nVkbaONN/GppyF+
X-Gm-Gg: AYBFou1BnC7hsqztiKkhOJZNQpZ4w9S+dUw+SYHlmoMis1hZluSYBZ4Hg7Mr3zK3cp2
	V8G+mbA7Um5hynieuoEoFuSkhD6LCidxB9Z2iEeYCisiSIp6OLAe5XDF7v1QVSRxYQZx/OXdEzP
	XDKED+VoIReShxQW/ltrtOULU9tMgR9hGMMmRK3DuwGj2oAec89JnBbt8MjYKYG1PdT/OB0Wf4y
	QSn2azZq5o2oUcoHmjAUtng1Fd6ciu3RZPiviLBcqsNceo68WqVH4eDeAdTkhRCUPdv3MMzkVwC
	IkmAKtg2grQx0MK8Vp5rGczJHjlIZr+nUOwV46Fu21WoZdqh7OAxkGHBMeMtfbzzQghBg2x1LT4
	/a2+SHPjld0E6QDvZBxl0sH42m+ta9wckOwHpnSGRR3mh9JSRZAnZpC2OUV5JdMsVltrnhN20ip
	MhAruPo8asl2l67QgAXH6pVqBQ4HCJqihopnzmb4CA2AbRr5w5ZEBzlEWRKpI05nnZsw==
X-Received: by 2002:a05:6a00:2e16:b0:882:d8c4:17c9 with SMTP id d2e1a72fcca58-897c6c248a9mr13355818b3a.23.1791950657453;
        Tue, 13 Oct 2026 21:04:17 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d802c09b5sm531115b3a.21.2026.10.13.21.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 21:04:17 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	cassiogabrielcontato@gmail.com,
	kees@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: pcm: Reject compat refinement after disconnect
Date: Wed, 14 Oct 2026 12:04:12 +0800
Message-Id: <pm-pmb-b3f7b3445bb11aaa9a7b-v2-a514c1399f30f407d626@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A disconnected PCM stream must reject hardware refinement before
entering its runtime constraint program. The native ioctl path checks
for SNDRV_PCM_STATE_DISCONNECTED, but snd_pcm_ioctl_hw_params_compat()
only checks that the runtime exists before handling HW_REFINE32. The
built-in BUFFER_BYTES rule retains the substream as its private payload
and reads substream->buffer_bytes_max.

An open compat PCM file can therefore enter that rule after the
component has been disconnected, while its owner is about to free the
component. The request must include SNDRV_PCM_HW_PARAM_BUFFER_BYTES for
this rule to run. A late HDA codec probe error on an already registered
card can supply this teardown: snd_card_register() can publish an
earlier PCM before a later registration fails, and
snd_hda_codec_cleanup_for_unbind() then disconnects and frees the PCMs
without the PCM-user drain used by normal codec removal.

The failing order is:

  1. The owner calls snd_pcm_dev_disconnect(), which marks the runtime
     DISCONNECTED and returns.
  2. The compat file enters snd_pcm_ioctl_hw_params_compat() and then
     snd_pcm_hw_refine(), reaching snd_pcm_hw_rule_buffer_bytes_max().
  3. The owner calls snd_device_free(); snd_pcm_free_stream() frees the
     substream while the rule callback is still in progress.
  4. The callback reads buffer_bytes_max through its freed private
     payload, causing a use-after-free.

The runtime and its rules remain allocated in this component-free path.
The disconnect locks do not cover the subsequent free or the synchronous
refinement loop, so they do not prevent this ordering.

Reject compat HW_REFINE32 with -EBADFD when snd_pcm_get_state() reports
a disconnected stream, matching the native ioctl. The existing helper
reads the state under the stream lock. This stops refinement that starts
after disconnect from entering the rule, closing the described window
without changing component teardown.

KASAN report as below:

    BUG: KASAN: slab-use-after-free in snd_pcm_hw_rule_buffer_bytes_max+0x276/0x2a0
    Read of size 8 at addr ffff888111b36870 by task pmbd_alsa_reade/486

    CPU: 2 UID: 0 PID: 486 Comm: pmbd_alsa_reade Tainted: G           O        7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
    Tainted: [O]=OOT_MODULE
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     ? snd_pcm_hw_rule_buffer_bytes_max+0x276/0x2a0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __virt_addr_valid+0x20d/0x410
     ? snd_pcm_hw_rule_buffer_bytes_max+0x276/0x2a0
     kasan_report+0xe0/0x110
     ? snd_pcm_hw_rule_buffer_bytes_max+0x276/0x2a0
     snd_pcm_hw_rule_buffer_bytes_max+0x276/0x2a0
     ? snd_pcm_hw_rule_div+0x16b/0x200
     ? __pfx_snd_pcm_hw_rule_buffer_bytes_max+0x10/0x10
     ? constrain_params_by_rules+0x17a/0xfe0
     constrain_params_by_rules+0x506/0xfe0
     ? __pfx_constrain_params_by_rules+0x10/0x10
     ? __ia32_compat_sys_ioctl+0x289/0x2f0
     ? do_int80_emulation+0x14a/0x5e0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lock_release+0xc8/0x280
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? snd_interval_refine+0x284/0x470
     snd_pcm_hw_refine+0x768/0xcc0
     ? __pfx_snd_pcm_hw_refine+0x10/0x10
     ? _copy_from_user+0x51/0xa0
     snd_pcm_ioctl_hw_params_compat+0x138/0x280
     snd_pcm_ioctl_compat+0x4c5/0x7c0
     ? __pfx_snd_pcm_ioctl_compat+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? selinux_file_ioctl+0xaa/0x280
     ? ksys_write+0x16b/0x200
     ? __pfx_snd_pcm_ioctl_compat+0x10/0x10
     __ia32_compat_sys_ioctl+0x289/0x2f0
     ? srso_alias_return_thunk+0x5/0xfbef5
     do_int80_emulation+0x14a/0x5e0
     asm_int80_emulation+0x1a/0x20
    RIP: 0023:0x8049084
    Code: 80 b8 04 00 00 00 bb 01 00 00 00 b9 43 a0 04 08 ba 2b 00 00 00 cd 80 b8 36 00 00 00 89 f3 b9 10 41 5c c2 ba b8 b0 04 08 cd 80 <85> c0 78 6c b8 04 00 00 00 bb 01 00 00 00 b9 27 a0 04 08 ba 1c 00
    RSP: 002b:00000000ffd35e40 EFLAGS: 00000246 ORIG_RAX: 0000000000000036
    RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00000000c25c4110
    RDX: 000000000804b0b8 RSI: 0000000000000003 RDI: 0000000000000004
    RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
    R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
    R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
     </TASK>

    Allocated by task 486:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_cache_noprof+0x251/0x610
     snd_pcm_new_stream+0x98f/0x1350
     _snd_pcm_new+0x1d1/0x310
     snd_pcm_new+0x43/0x60
     0xffffffffc0401115
     do_one_initcall+0xf3/0x4e0
     do_init_module+0x281/0x8e0
     load_module+0x658c/0x7cc0
     init_module_from_file+0x15b/0x180
     idempotent_init_module+0x22d/0x770
     __x64_sys_finit_module+0xd2/0x160
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    Freed by task 494:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x307/0x580
     snd_pcm_free_stream+0xcf/0x290
     snd_pcm_free+0xb1/0xf0
     __snd_device_free+0x1a1/0x490
     snd_device_free+0xcf/0x190
     case_owner_ioctl+0xb8/0x160 [pmbd_alsa_fixture]
     __x64_sys_ioctl+0x163/0x1d0
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    The buggy address belongs to the object at ffff888111b36800
     which belongs to the cache kmalloc-1k of size 1024
    The buggy address is located 112 bytes inside of
     freed 1024-byte region [ffff888111b36800, ffff888111b36c00)

    The buggy address belongs to the physical page:
    page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888111b35800 pfn:0x111b30
    head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
    flags: 0x200000000000240(workingset|head|node=0|zone=2)
    page_type: f5(slab)
    raw: 0200000000000240 ffff888100042dc0 ffffea0004218610 ffffea00042c6810
    raw: ffff888111b35800 000000000010000f 00000000f5000000 0000000000000000
    head: 0200000000000240 ffff888100042dc0 ffffea0004218610 ffffea00042c6810
    head: ffff888111b35800 000000000010000f 00000000f5000000 0000000000000000
    head: 0200000000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
    head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
    page dumped because: kasan: bad access detected

    Memory state around the buggy address:
     ffff888111b36700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
     ffff888111b36780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
    >ffff888111b36800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                                 ^
     ffff888111b36880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
     ffff888111b36900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
    ==================================================================

Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---

diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index 55ecf87586c4ddc553a82997ddaf30a69ab6627a..f5696ea3a5faf60430a04b792fd77b711fd0d7eb 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -241,6 +241,9 @@ static int snd_pcm_ioctl_hw_params_compat(struct snd_pcm_substream *substream,
 	runtime = substream->runtime;
 	if (!runtime)
 		return -ENOTTY;
+	if (refine &&
+	    snd_pcm_get_state(substream) == SNDRV_PCM_STATE_DISCONNECTED)
+		return -EBADFD;
 
 	struct snd_pcm_hw_params *data __free(kfree) =
 		kmalloc_obj(*data);
