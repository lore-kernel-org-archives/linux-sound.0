Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2E02EA754
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 05:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775798032; cv=none; b=GYHHOK9qcv0jc8/9FQs1dr0KwXz+4YAh5QLOd1fkWlXGXry9MdXtz42ylhBqIrpTquO52YpipcdOl1YfbiO237iXb7DBc4oGZGXzhD2KPsJe+UxEAz7eu3xqa1FTm/VEbzbqt6o3gcu7NIcDgVljiM67J2e0oQipYJUdR42Yr/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775798032; c=relaxed/simple;
	bh=s5fpXjIkhtlnDKMlfUjkhC0TSxbru1oy54/jPyduY7w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fQgTfpoV20Ok4hK/u0GQRBr433oGUDBaZsDuZr8eOmq8fvva8W7xNTsw5prBDc8LFyfWkxvjU5M0CN0xmVAu6XW/yNLNIz1eGY5cwKUs8/SeCdc3pddfiOjGJ4mloM95SYwyxf2PzDnZ3qCz+iJ84mGNrKX8/MOqdRoLjKuDTpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOsDZn0V; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOsDZn0V"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82d561b3689so745284b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 09 Apr 2026 22:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775798029; x=1776402829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ip96ksr0TNIaLn5SBuG1rHY2Vx5CuZDHx4f8G1URE3U=;
        b=kOsDZn0V8BiixpdX/R5//HWQmoLmutwBGzL2zrtirzc6Lj0n8BrNIXjLGnXK6NkC84
         /qsbN2wVtnrscTdqoTmFq2Kz7bCEvi0rGtQPfR0Gs9Pbe12CKgo7ovsGgO7EhmRwJVLm
         99GcaADJce2S+TyL5lFyw4X2q128r5CXb5VbHaJsslHFzDUDS/deSvjRt/IHSCAoP+ST
         xo5B+8q/HahZzqEXvUTDqpJ/SKu31znGvNq7GASmS8DVuqKREC3nlLclDtejoEckuG2F
         5rQmdZLG3pHqeDhE/Vh1P/gqB9XaR59eGzk190o0f04kaTY50azoRMA9AHg2aMeH2WGY
         rlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775798029; x=1776402829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ip96ksr0TNIaLn5SBuG1rHY2Vx5CuZDHx4f8G1URE3U=;
        b=Ji+u/V188efpGsQmWeQOC1gEgykqAlxK2UKoVxV9njapOMMHlW66ywccAAwKlPr3bc
         6K3FnslEvSxrmHvdWiFAOLFSVa8Z7Q+Wbq9Yyl+0J0P2LuztsEI52Kc4QlQE6wZ8H5ty
         qGbR/M80V3jAIyPKuBCWX7ZsHq4CvASbiw1IQmzgVH34h8sgSKLnFayb34UCxy2i5u4Z
         ESimD+d+lYEUajvFxjKnJs1F+x5fFICYqD8TVdiX80sLoxCdLMQWp9Xc7y1wVSfFHTLB
         E0a8HeDUzu3ce7kdiATwrjJqSSoUvOiuBG1RZV9LS6QG+sACm90nTEU0hsSlG8u484dW
         BIjw==
X-Forwarded-Encrypted: i=1; AJvYcCWw0roOe1WSzRLRmjBX1yubuSkFitk9nvlG4BjadzOb9A4IL0dGRW2+SD0Rq+dTfQNPLH4zi5l1YNVJyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwO0ip/gEGFLGh+/VTVKmoHC5E59xD8YNNOalK3gt0zz2+3qiM5
	fMZ9baDD7SDwFPpqOoHpWPNKX6xuLQbB1gmz/70pob2rtG4Zy/7sENjB
X-Gm-Gg: AeBDievJdNoOQgkSloL8Nl2yrrs8g1QpKTY8lvJvGKIUVTGSLUXn4nTgOxy2mh4pRK3
	h1Rp8Qlu9p6nYKsr8G/HRoXlp2TeQWXWZXR7B388FwMouV+RBXJVwxYndwqkiAay6KeXhu7F++w
	dV/Atq6RDYkkReAsG+qzjA7OEjY3rV302t1E5VMcJqhk3GvSesH5PMXqfUDlPc33X03vdd2Twvh
	/c3+TgIKd0SyuUPGuDEHUVWD5CuziIUDd3mKmubjpBkSz9IDpBHu4BxfoqPvRewFqbJec4Xws16
	xXJXDxXqODZ8uz7GeJAEbN63USNYju6cZ8iI7GoZQI2RkKLYhtSrAvqtRuXw0NT2kvynRqPKDiX
	NBXWjS4E5fH7WBHnuOehKCKuzBbc9x/AzIyMRoCA2286nXrX+TaB0ydaapR2OeTKmpAsq6iZFWj
	0/GfxhHgtE/nhqDV5/xlMATRLv+qgI74V+ZsOUpxuegk+BCYaYXZSVdZ09euGLMu6syfX4PNjLY
	tnA0XtNLksf1xd9uXu0AHquKCO0N/F0vg==
X-Received: by 2002:a05:6a00:124a:b0:81f:be3c:9c9e with SMTP id d2e1a72fcca58-82f0c297e11mr1989065b3a.33.1775798028953;
        Thu, 09 Apr 2026 22:13:48 -0700 (PDT)
Received: from localhost.localdomain (59-190-207-251f1.hyg2.eonet.ne.jp. [59.190.207.251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c33de57sm1295283b3a.21.2026.04.09.22.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 22:13:48 -0700 (PDT)
From: Berk Cem Goksel <berkcgoksel@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>,
	stable@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: 6fire: fix use-after-free on disconnect
Date: Fri, 10 Apr 2026 08:13:41 +0300
Message-Id: <20260410051341.1069716-1-berkcgoksel@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In usb6fire_chip_abort(), the chip struct is allocated as the card's
private data (via snd_card_new with sizeof(struct sfire_chip)).  When
snd_card_free_when_closed() is called and no file handles are open, the
card and embedded chip are freed synchronously.  The subsequent
chip->card = NULL write then hits freed slab memory.

Call trace:
  usb6fire_chip_abort sound/usb/6fire/chip.c:59 [inline]
  usb6fire_chip_disconnect+0x348/0x358 sound/usb/6fire/chip.c:182
  usb_unbind_interface+0x1a8/0x88c drivers/usb/core/driver.c:458
  ...
  hub_event+0x1a04/0x4518 drivers/usb/core/hub.c:5953

Fix by moving the card lifecycle out of usb6fire_chip_abort() and into
usb6fire_chip_disconnect().  The card pointer is saved in a local
before any teardown, snd_card_disconnect() is called first to prevent
new opens, URBs are aborted while chip is still valid, and
snd_card_free_when_closed() is called last so chip is never accessed
after the card may be freed.

Fixes: a0810c3d6dd2 ("ALSA: 6fire: Release resources at card release")
Cc: stable@vger.kernel.org
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Signed-off-by: Berk Cem Goksel <berkcgoksel@gmail.com>
---
Patch applies to 7.0-rc6 (upstream master 5619b098e2fb).
Tested on 7.0.0-rc5 (arm64) with KASAN:

[   11.274798] BUG: KASAN: slab-use-after-free in usb6fire_chip_abort sound/usb/6fire/chip.c:59 [inline]
[   11.274798] BUG: KASAN: slab-use-after-free in usb6fire_chip_disconnect+0x348/0x358 sound/usb/6fire/chip.c:182
[   11.275503] Write of size 8 at addr ffff000013230a98 by task kworker/0:1/12
[   11.276469] CPU: 0 UID: 0 PID: 12 Comm: kworker/0:1 Not tainted 7.0.0-rc5-g663cf2b1ad64-dirty #10 PREEMPT
[   11.276485] Hardware name: linux,dummy-virt (DT)
[   11.276504] Workqueue: usb_hub_wq hub_event
[   11.276562] Call trace:
[   11.276582]  show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:499 (C)
[   11.276616]  dump_stack_lvl+0x138/0x1c8 lib/dump_stack.c:120
[   11.276666]  print_report+0x118/0x5d4 mm/kasan/report.c:482
[   11.276669]  kasan_report+0xc0/0x100 mm/kasan/report.c:595
[   11.276678]  __asan_report_store8_noabort+0x20/0x2c mm/kasan/report_generic.c:386
[   11.276684]  usb6fire_chip_abort sound/usb/6fire/chip.c:59 [inline]
[   11.276688]  usb6fire_chip_disconnect+0x348/0x358 sound/usb/6fire/chip.c:182
[   11.276692]  usb_unbind_interface+0x1a8/0x88c drivers/usb/core/driver.c:458
[   11.276697]  device_release_driver_internal+0x450/0x63c drivers/base/dd.c:1367
[   11.276699]  bus_remove_device+0x2a0/0x4f4 drivers/base/bus.c:657
[   11.276701]  device_del+0x31c/0x870 drivers/base/core.c:3880
[   11.276720]  usb_disable_device+0x2e8/0x6ec drivers/usb/core/message.c:1476
[   11.276737]  usb_disconnect+0x294/0x8d8 drivers/usb/core/hub.c:2345
[   11.276776]  hub_event+0x1a04/0x4518 drivers/usb/core/hub.c:5953
[   11.276836]  process_one_work+0x8a4/0x1dc0 kernel/workqueue.c:3276
[   11.276850]  worker_thread+0x57c/0xcac kernel/workqueue.c:3440
[   11.276888]  kthread+0x3e4/0x494 kernel/kthread.c:436
[   11.276890]  ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:860

[   11.339324] Allocated by task 12:
[   11.339765]  kasan_save_stack+0x3c/0x64 mm/kasan/common.c:57
[   11.340193]  kasan_save_track+0x20/0x3c mm/kasan/common.c:78
[   11.340615]  __kasan_kmalloc+0xb8/0xbc mm/kasan/common.c:415
[   11.341108]  snd_card_new+0x70/0x11c sound/core/init.c:184
[   11.341555]  usb6fire_chip_probe+0x298/0x864 sound/usb/6fire/chip.c:120

[   11.353835] Freed by task 12:
[   11.354171]  kasan_save_stack+0x3c/0x64 mm/kasan/common.c:57
[   11.354599]  kasan_save_track+0x20/0x3c mm/kasan/common.c:78
[   11.355023]  kasan_save_free_info+0x4c/0x78 mm/kasan/generic.c:584
[   11.355505]  __kasan_slab_free+0x5c/0x88 mm/kasan/common.c:285
[   11.355945]  kfree+0x164/0x61c mm/slub.c:6483
[   11.356285]  snd_card_do_free sound/core/init.c:597 [inline]
[   11.356778]  release_card_device+0x16c/0x1fc sound/core/init.c:153
[   11.357221]  snd_card_free_when_closed+0x30/0x44 sound/core/init.c:612
[   11.357696]  usb6fire_chip_abort sound/usb/6fire/chip.c:58 [inline]
[   11.358103]  usb6fire_chip_disconnect+0x298/0x358 sound/usb/6fire/chip.c:182

 sound/usb/6fire/chip.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/sound/usb/6fire/chip.c b/sound/usb/6fire/chip.c
index 5ff78814e687..874f6cd503ca 100644
--- a/sound/usb/6fire/chip.c
+++ b/sound/usb/6fire/chip.c
@@ -53,11 +53,6 @@ static void usb6fire_chip_abort(struct sfire_chip *chip)
 			usb6fire_comm_abort(chip);
 		if (chip->control)
 			usb6fire_control_abort(chip);
-		if (chip->card) {
-			snd_card_disconnect(chip->card);
-			snd_card_free_when_closed(chip->card);
-			chip->card = NULL;
-		}
 	}
 }
 
@@ -168,6 +163,7 @@ static int usb6fire_chip_probe(struct usb_interface *intf,
 static void usb6fire_chip_disconnect(struct usb_interface *intf)
 {
 	struct sfire_chip *chip;
+	struct snd_card *card;
 
 	chip = usb_get_intfdata(intf);
 	if (chip) { /* if !chip, fw upload has been performed */
@@ -178,8 +174,19 @@ static void usb6fire_chip_disconnect(struct usb_interface *intf)
 				chips[chip->regidx] = NULL;
 			}
 
+			/*
+			 * Save card pointer before teardown.
+			 * snd_card_free_when_closed() may free card (and
+			 * the embedded chip) immediately, so it must be
+			 * called last and chip must not be accessed after.
+			 */
+			card = chip->card;
 			chip->shutdown = true;
+			if (card)
+				snd_card_disconnect(card);
 			usb6fire_chip_abort(chip);
+			if (card)
+				snd_card_free_when_closed(card);
 		}
 	}
 }
-- 
2.34.1

