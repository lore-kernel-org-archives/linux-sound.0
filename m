Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154683EF0DC
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 03:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791950399; cv=none; b=DP8oUYewP1y27hhsUNu2cDftCYZI81YhPHHEWcUU9cMc50+A2+i0i7862L+/uZG6IrUFDNppPXwNlJwwHZDm+govG0k2YZa0QBOF8GDKX4fDSpeNxJ1jT7T8kSz6LuhHKdEf8gPrzzYMeyi/MzrN2qE63ybsRUAbzH+/2JqZAtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791950399; c=relaxed/simple;
	bh=wDWK2HNlsi6fLvrOSl8xuQy7QcV5azN1G+qgRg6pjdA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=AHYUxJA+bhLoCoVCbomOK1Fyezh0kvYnDQA7Ll9+6jaqmd7nw6c/L7HxSpUDDLtzb9goUUequWdwmttIrRlS2OoR3JJKMFpOzPGG/f2W1ajpXy/xgk2boywZUmrRbrVHsquRCuFw8M+FnySGBEY736W2f1ZieA/2BCN42BjEEJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DN3N5ESf; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DN3N5ESf"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso11327a91.3
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 20:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791950397; x=1792555197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E812qST8XoP2CZq7AeoKIlORhwZhP9bvYGkx9M1/lXM=;
        b=DN3N5ESfqzL/0/Os/MNWa75CSxrToMV4QlWHn1VLOTN1mcE/6YdXxk0hdFJLwC55xQ
         /rKbUIsWkCnIV/dEJC9r/FV6GrLB/BgNmA/wO5Uh82B5dTAGfDyCR3v8peJHeAJP5+W4
         YBO8fL3lK8rXY70fszpCAUTjqffO2JX8eWNVPVAf3ZZevbQfz2K1j5Oy1nJc4gkqPc2U
         /5fd9zetjzR1rYncu+buyjJStdUlQIiIbRL+IeCSg03bjum2diFFJtGjXtvoylEVAmB8
         fVdWnkjqNS4npVOzFF8aXj6VXh0qyYqM2/NC0bXZ/yqQvMIlvs21HM7X3rNiTdP/Fz6w
         RXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791950397; x=1792555197;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E812qST8XoP2CZq7AeoKIlORhwZhP9bvYGkx9M1/lXM=;
        b=dNGiROlycvfs49UhHBVkIzKLuEJufEmF/HPBJFVEAZ19LpHFDV4meS9jqCP80sNDio
         gZPhaoRcRAe/V1z0OqRgFxx4A776urO9UR6Ecxfp3e9dn6zitTPnLXJq7shV4p0teOwS
         sCsWLisAltmMnD/T/bwcu3VbMnzNgvmLGY7JrE9hp/Q1OVmHTVzr1gDKuWeBgrd+6hmf
         SSiOWuqmj4WOZYYedUdaGQX0XdGktN9dR46ZtLPL0jHOVukGjbV8+pPlkX1u237mj2eI
         5hMvJzbE9viSqQtswzDpQ5+VsIg/H5nix6xvgi67zDStEHhhi46/O8sc9PH6whFcVN98
         utWQ==
X-Gm-Message-State: AFq9FYL+6fIqrIipHcubSryBr7lNcwBhWMIHXpij4AGSXbBJGkeOpxyt
	Q9eotO40Cs7lVnhaffOthcIGop20Xpeolbko5CPicgZtEveKc34Hs6BO
X-Gm-Gg: AYBFou3FP4VXpGFaiCd0YqifhpbqQ/0LbS5VLA8CRB6tJ9ZLrD6Eua1l2Kx+iTMBDIC
	SG8WEThx1bf57yXmig9mutBLwW3AaTtLs6USgLsfAaLuCw67F2BG2KxeRJFn0JQ/JZomkEovkgF
	jq/1T5PNxSX7PuibeVHoR7zx//WusDEeLa9jRBgh0CqedDBKXTsQsNY/jpf4+TAT8lH8LK605bf
	Lf+5/wednxj9VkxNTny0vB+WBuVLfJ4L3yXk22FMvfdUL+69uh94r4FFxoCnreusN/a85f8ORFf
	HYtDlpAKJHyt+CEsyqWKYhIpM0zzxHSJGrSaGDOjzL7P2hZW2acEGq1Gd+i8EVRIPDSxTA6Ql13
	IkR0oTeMXdgYTVnfpDEHFUO90fFz5aV5sfxt0wk92EfDAAAvP3iyDCDs6GFmjdZNl6qYWSoQ7h/
	AUhQBqN0BUGGGJIg1ZwCNBQLe2N4Y5yblHT5htIYPIUzFy2iVK+rSkPpinnsvpq5asTw==
X-Received: by 2002:a17:90b:3a48:b0:3ab:413:49b6 with SMTP id 98e67ed59e1d1-3ab3a79a2d8mr12591987a91.41.1791950397256;
        Tue, 13 Oct 2026 20:59:57 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f24b74csm2683575a91.7.2026.10.13.20.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 20:59:56 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	kees@kernel.org,
	2022090917019@std.uestc.edu.cn,
	nfraprado@collabora.com,
	cezary.rojewski@intel.com,
	cassiogabrielcontato@gmail.com,
	songxiebing@kylinos.cn,
	sammiee5311@gmail.com,
	hemanth.selam@gmail.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com,
	tiwai@suse.de
Subject: [PATCH v2] ALSA: vmaster: Serialize hook registration with control callbacks
Date: Wed, 14 Oct 2026 11:59:49 +0800
Message-Id: <pm-pmb-c2667fb9cc42fbb7943c-v4-b7bc2fe90e950accb3f7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

An HDA virtual-master hook must have its private argument initialized
before a control callback can invoke it. snd_hda_add_vmaster_hook()
installs the trampoline through snd_ctl_add_vmaster_hook(), which stores
master->hook before master->hook_private_data without serialization.

When a codec with a vmaster mute hook binds to an already registered
card, snd_hda_gen_build_controls() publishes and initializes the Master
Playback Switch before installing the hook. A native write that changes
the switch can then run in the following order:

  1. The codec bind path publishes and initializes the master control in
     __snd_hda_add_vmaster(), then calls snd_hda_add_vmaster_hook().
  2. The hook setter stores master->hook, but has not yet stored its
     private argument.
  3. SNDRV_CTL_IOCTL_ELEM_WRITE takes controls_rwsem and calls
     master_put() while the setter remains between those stores.
  4. master_put() sees the callback and invokes vmaster_hook() with a
     NULL argument. The trampoline dereferences it before the setter
     can complete publication.

The write lock held by snd_ctl_elem_write() does not exclude the hook
setter, so this can cause a NULL pointer dereference. Take the same
controls_rwsem for writing inside snd_ctl_add_vmaster_hook() so the
callback and its argument are installed together with respect to
native control callbacks. Pass the card into the helper and update
the HDA caller, keeping the lock in the ALSA core. Release it when
registration returns, before the caller synchronizes the hook.

KASAN report as below:

    Oops: general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] SMP KASAN NOPTI
    KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
    CPU: 1 UID: 0 PID: 499 Comm: alsa-vmaster-tr Not tainted 7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    RIP: 0010:vmaster_hook+0x35/0xb0
    Code: f5 53 48 89 fb 48 83 ec 08 e8 57 f0 9a fc eb 50 e8 50 f0 9a fc 48 8d 7b 08 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 75 59 48 8d 7b 10 48 8b 43 08 48 ba 00 00 00 00 00 fc
    RSP: 0018:ffff888117647cd0 EFLAGS: 00010212
    RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff84e9ff50
    RDX: 0000000000000001 RSI: 0000000000000000 RDI: 0000000000000008
    RBP: 0000000000000001 R08: 0000000000000001 R09: 0000000000000001
    R10: ffffffff89427457 R11: ffff888115ad1d00 R12: ffffffff84e9ff30
    R13: ffff888114943ca0 R14: 0000000000000000 R15: 0000000000000001
    FS:  00007fe8167b3780(0000) GS:ffff88826b7e3000(0000) knlGS:0000000000000000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 0000557c8c2842a8 CR3: 000000011579f005 CR4: 0000000000770ef0
    PKRU: 55555554
    Call Trace:
     <TASK>
     master_put+0x20e/0x2b0
     snd_ctl_elem_write+0x37f/0x5e0
     snd_ctl_ioctl+0x997/0xdd0
     ? __pfx_snd_ctl_ioctl+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? selinux_file_ioctl+0xaa/0x280
     ? __pfx_snd_ctl_ioctl+0x10/0x10
     __x64_sys_ioctl+0x163/0x1d0
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    RIP: 0033:0x7fe8168c291b
    Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
    RSP: 002b:00007fffab0cb150 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
    RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007fe8168c291b
    RDX: 00007fffab0cb310 RSI: 00000000c4c85513 RDI: 0000000000000003
    RBP: 00007fffab0cb310 R08: 0000000000000000 R09: 0000000000000000
    R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
    R13: 00007fffab0cb1c0 R14: 0000000000000001 R15: 0000557c4f71fd10
     </TASK>
    Modules linked in:
    ---[ end trace 0000000000000000 ]---

Fixes: ee52e56e7b12 ("ALSA: hda - Fix mute-LED fixed mode")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
Assisted-by: LLM

---
Link to v1: https://lore.kernel.org/r/pm-pmb-c2667fb9cc42fbb7943c-v2-d4b95981cdbb696491c5@gmail.com

diff --git a/include/sound/control.h b/include/sound/control.h
index 37e9c545503e..8e24b668d796 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -289,7 +289,7 @@ snd_ctl_add_follower_uncached(struct snd_kcontrol *master,
 	return _snd_ctl_add_follower(master, follower, SND_CTL_FOLLOWER_NEED_UPDATE);
 }
 
-int snd_ctl_add_vmaster_hook(struct snd_kcontrol *kctl,
+int snd_ctl_add_vmaster_hook(struct snd_card *card, struct snd_kcontrol *kctl,
 			     void (*hook)(void *private_data, int),
 			     void *private_data);
 void snd_ctl_sync_vmaster(struct snd_kcontrol *kctl, bool hook_only);
diff --git a/sound/core/vmaster.c b/sound/core/vmaster.c
index cd3dcaaf9f72..3d57182031d9 100644
--- a/sound/core/vmaster.c
+++ b/sound/core/vmaster.c
@@ -463,6 +463,7 @@ EXPORT_SYMBOL(snd_ctl_make_virtual_master);
 
 /**
  * snd_ctl_add_vmaster_hook - Add a hook to a vmaster control
+ * @card: the card instance
  * @kcontrol: vmaster kctl element
  * @hook: the hook function
  * @private_data: the private_data pointer to be saved
@@ -470,13 +471,17 @@ EXPORT_SYMBOL(snd_ctl_make_virtual_master);
  * Adds the given hook to the vmaster control element so that it's called
  * at each time when the value is changed.
  *
+ * Takes the card's controls_rwsem lock internally.
+ *
  * Return: Zero.
  */
-int snd_ctl_add_vmaster_hook(struct snd_kcontrol *kcontrol,
+int snd_ctl_add_vmaster_hook(struct snd_card *card, struct snd_kcontrol *kcontrol,
 			     void (*hook)(void *private_data, int),
 			     void *private_data)
 {
 	struct link_master *master = snd_kcontrol_chip(kcontrol);
+
+	guard(rwsem_write)(&card->controls_rwsem);
 	master->hook = hook;
 	master->hook_private_data = private_data;
 	return 0;
diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index 18838a45e6f7..31e5fad78b0f 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -2025,7 +2025,7 @@ int snd_hda_add_vmaster_hook(struct hda_codec *codec,
 	if (!hook->hook || !hook->sw_kctl)
 		return 0;
 	hook->codec = codec;
-	snd_ctl_add_vmaster_hook(hook->sw_kctl, vmaster_hook, hook);
+	snd_ctl_add_vmaster_hook(codec->card, hook->sw_kctl, vmaster_hook, hook);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_hda_add_vmaster_hook);
