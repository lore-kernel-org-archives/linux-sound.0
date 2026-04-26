Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0871EEE6
	for <linux-sound@vger.kernel.org>; Sun, 26 Apr 2026 00:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777162783; cv=none; b=FhHjlgKpXef9aaMmzIUgZcSjfy97rmkJ++B3u8Msn6P+m4OWReraIGD04tFiulNP4Rea1GhUbJn9gsZ8indSwQohMkbJIf70qp7KqBz7SYvZvlpI69K29Fg+HsmfD+U19NMCE2xuU7AczVMsL9GHSAk3r4rEnlPh3sUwZgF0C20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777162783; c=relaxed/simple;
	bh=TBZBNRjL9300EGgXJeR2jH8eTHBcpmzXD9vi8+6FltE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pCamwLI9REeMPxlZhBcXeBTDxiysZByp4a51UTXtR15ndeV2QvDCFxooyf7M6ZZXQsLaKu59NP+PNHcKclrSKnD3u8fuOahXz8mRqphKlIQtqtM6S4KBaJ7m/UuYhu47FNxmFBnrc/XMTNNtCHb/ilXKLo6n2znsJi8FNyZt33U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P5P7sgqR; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P5P7sgqR"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso5279999a91.0
        for <linux-sound@vger.kernel.org>; Sat, 25 Apr 2026 17:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777162782; x=1777767582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YJeUWXBvIXV4hGGcorLW+ig5QZrccjQ1ULdApherGFU=;
        b=P5P7sgqReIRck1shXjABa0fnDHslNR6Y/tEeHH/PJsGCVAI619MlEHQ8qq/mhFEt0w
         CVcI/zg2npHFINd1aLphMN+L4H0VAD0rBv5Bg11vhbQ1NhbQoNc14rV1BcojmsAnHdN/
         DqSdXQQatJkLcxUfRqerSivUdKYCLXP2lwHbYutacwlyRtoKLnGnJQ2bTUCO2QaZ2Tdh
         HP5zSIK9QHxCgLMRrT4GDdK+rYWNaxMmAt347Qhzbv73pzXsOsXXo2PoBcLHhy25JQYU
         uydHtXCFPDJ5TCJ2Llgyc4ut7nI6KOanPazgxyIpkzElHi8vCOFIRqx/iPX2AFPVsz/K
         B+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777162782; x=1777767582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJeUWXBvIXV4hGGcorLW+ig5QZrccjQ1ULdApherGFU=;
        b=VVBEq+GdqlvP1uFP3i8vgT4kUhFyJdCTT4dDjkCneAOVpTY8HBxWqcCZMSH7Vhy929
         0BHHH24y/4woqM4LJW1G6wu37jSPCBLP8b6/uZigNea1AO0m5gsYNosXPNaA+dHKyv6m
         dBR8QvZxB/R3Qqua+FewkV7aZdAXfX0InxQz+ygDNwlceeKXOUmccipjdRPcMJTmeVyM
         rHvZjxBGl6xFkW/3c3QOns6BFp6203mGzFbacgjajbuljOulV0/YzS4gGAgIldTjRGp9
         a9mYA4vH7tH/ctEvFp+4yErPhrL0fFY0p86/g5k0IfZslsDpHQyjdFeHDwRbr5/TQhFI
         7fOw==
X-Gm-Message-State: AOJu0YzYq5gYgBBJdzuryZrXpVIIuzcRrKNOHi1ggLoYGwN8vagEMG3r
	I9v3g72TenqzaxHRnaqBY0BrLSVVaDoVNlH3sKHfrIwJ9p4d7krrJcAu
X-Gm-Gg: AeBDieuS6HveYqBs279kJEeqf313oE6C7M8Kd8+RVzhh1vPoxXpVXy+6LUQ1ONJZ5w9
	Sc1tE8uq4NkJ3TKnCs97QfIxZ52SKVpJRQyqqAnkvBFldn9KJ8sbwh6NjSyElKUzJ8KUmS7/197
	I0a0w8/l0PiirM2a/597fccEXYo+dzhsX5M6NFHEJL4MCVmLzL5BguBOsk/kbd3n58/LWinFJh9
	ISwBUaDkrrSQsNGRPxZoouBgF+pA1OINjpQTOOSJYWDLjhHCoYipahds30BF9hwW8lvP1fFd3Yi
	lAzhTe+92WLQSxhVqMk6cXz5Qwf4XLgS2yArbGRmu2/pARy3YtG6Nq9We2SztQLusV7dlXb3NLY
	FHVPaji3vfCmT2WigcIub495fzj+/nC97fXpOFokzYqTGOvVElGcBe16bjOQDZ8WnGA9TEI+G16
	DQb1r7uTZr4I4VfGTW9vj17HjhWBb4haEolmTQKYbaA0sTt5hbYM5ze21hNdFfOe4Xbn3AliOZH
	AT+juLuunjmcPt6mQ==
X-Received: by 2002:a17:90b:1e0b:b0:35d:a542:2dcb with SMTP id 98e67ed59e1d1-3614048a731mr37189556a91.16.1777162781878;
        Sat, 25 Apr 2026 17:19:41 -0700 (PDT)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:383f:421f:2607:ad77:4337])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fae178fsm10212835a91.7.2026.04.25.17.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 17:19:41 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: zonque@gmail.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+2afd7e71155c7e241560@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: caiaq: fix usb_dev refcount leak on probe failure
Date: Sun, 26 Apr 2026 05:49:34 +0530
Message-ID: <20260426001934.70813-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

create_card() takes a reference on the USB device with usb_get_dev()
and stores the matching usb_put_dev() in card_free(), which is
installed as the snd_card's ->private_free destructor.

However, ->private_free is only assigned near the end of init_card(),
after several failure points (usb_set_interface(), EP type checks,
usb_submit_urb(), the EP1_CMD_GET_DEVICE_INFO exchange, and its
timeout). When any of those fail, init_card() returns an error to
snd_probe(), which calls snd_card_free(card). Because ->private_free
is still NULL, card_free() never runs, the usb_get_dev() reference
is not dropped, and the struct usb_device leaks along with its
descriptor allocations and device_private.

syzbot reproduces this with a malformed UAC3 device whose only valid
altsetting is 0; init_card()'s usb_set_interface(usb_dev, 0, 1) call
fails with -EIO and triggers the leak.

Move the ->private_free assignment into create_card(), immediately
after usb_get_dev(), so that every error path reaching snd_card_free()
balances the reference. card_free()'s callees (snd_usb_caiaq_input_free,
free_urbs, kfree) already tolerate the partially-initialized state
because the chip private area is zero-initialized by snd_card_new().

Reported-by: syzbot+2afd7e71155c7e241560@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2afd7e71155c7e241560
Tested-by: syzbot+2afd7e71155c7e241560@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 sound/usb/caiaq/device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
index 8af0c04041ee..ad9f744b496b 100644
--- a/sound/usb/caiaq/device.c
+++ b/sound/usb/caiaq/device.c
@@ -423,6 +423,7 @@ static int create_card(struct usb_device *usb_dev,
 
 	cdev = caiaqdev(card);
 	cdev->chip.dev = usb_get_dev(usb_dev);
+	card->private_free = card_free;
 	cdev->chip.card = card;
 	cdev->chip.usb_id = USB_ID(le16_to_cpu(usb_dev->descriptor.idVendor),
 				  le16_to_cpu(usb_dev->descriptor.idProduct));
@@ -511,7 +512,6 @@ static int init_card(struct snd_usb_caiaqdev *cdev)
 	scnprintf(card->longname, sizeof(card->longname), "%s %s (%s)",
 		       cdev->vendor_name, cdev->product_name, usbpath);
 
-	card->private_free = card_free;
 	err = setup_card(cdev);
 	if (err < 0)
 		return err;
-- 
2.43.0

