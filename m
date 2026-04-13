Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491AA37C10A
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 03:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776052238; cv=none; b=V+xutl1COmPuJfXebj89BHt/G5UZRMMpkswg5jEBYSB72ande0yakBSo4leYck/ZR8KhkMbdUpEoBMJRIsuXkrj2O21PZ+uEv9juCq5/UqjdaP47YDptfvrAt/YJ+GeHR8QX1jhhB8KGcWnZE9w6LRfkZadEI5NWkKkM3ngiWZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776052238; c=relaxed/simple;
	bh=Wrj+gdpP6ITRJA8dSWGbh5zoUNshnIIubPM7stoPbPA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PiEkpPuQgG8rDISmZIMeAUumdiv4PTMtC4g8oL6N4W20asB+37Kh6wmN5GTdn3M6LolxcYlHvj/P9r4nIFTh3Y0rDc8YojoFZYIFlx2/Was92PJH8XqTSTOgaa8WxhBPCPTqz6uYX6PVvt82Q6g4QygtUYTANXNHr+ritBFxfCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5LjrD+j; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5LjrD+j"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35d99031e4eso2245305a91.1
        for <linux-sound@vger.kernel.org>; Sun, 12 Apr 2026 20:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776052237; x=1776657037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5SGpOXoxl9RjzaYVEFaZVgctA66UXg9R08vi8wYY78=;
        b=X5LjrD+joWY6G4BF5W2RDofpPng1J0woMsnwEf9gMgwc+3vJJaBfYumhv6yaWlBmYF
         E//PCVfm75W1mis95sxzVK6dqLPZ+XsBlHNC6Pqls9IterP0m0HtHpH4rz3QgR8TPI8Q
         9XbTxmunvAg5nfCIpcGiW228Ry4FSrHzgdGjbkTaX8V9Jta/Js7iTiLwq/d/cldAsbrm
         Owe+stzvrBud4svOGH0WAm/E0T+td99F7gn/ljryW7u+Ctr/u5QR0mTh4cnksUo8ogaO
         7Y9XZ+9zisNxX8yCp8Gm3BqcKi5tUc5Wqjudxf7fozWV3NqVhLNTWyRIDb9DQ0aM18aO
         LhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776052237; x=1776657037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T5SGpOXoxl9RjzaYVEFaZVgctA66UXg9R08vi8wYY78=;
        b=TROO+8u4eMsRGT7O90cVHpjzTX5jKgbG4G+R22BcPeYOQ1zMOpGLQETIt0WVGeD5eK
         WURKlDyhX2p2G450m4ujE8tYM2MV2LpF/OMOMcQjDa26CEVe4lV3Sn95sIrjxE4nYia6
         Y47mGzOxFCNBvgH+7K0ZnLVG4JJ1TNFPIi90us2/vVUiasIM3/rvuEcZMnIPjy5DpeIK
         qs30gUy0w3Vw6ci/QRr7k/osu9FeBI0ZlIaZJVUSznZAl917GjJ3HnXSfqhosHhOGp4D
         V5EdIc6TaFl65dl2eTfLJ+ta8ocdRZf23Ln/A63pkWDe3wIehlGU6A028Th4KfdduxrH
         WZpw==
X-Gm-Message-State: AOJu0Yw6YQDq7sYYQR4aOxe1ogiLsK3v3mUfZfDDJevyU73B+iUHM6rL
	pAQ2imS+jVSl0r+h5G4+vYa1vi2Sx3CFPuBfgjYGBIkOJ1gi/J7k6VIJ
X-Gm-Gg: AeBDietz3MJCQbkdRTRRxR1LfRk720NVR03pr6p16Djkot0yXJnsLxCs5d0faALIHOX
	KkX2eGMXWLlzXCPmM4nGj2E8oj3iPxAc5t03Dr/kM4q5NvFdi2v9A0oEUi1hTKFWlS9kmbDj/33
	VSSARsHv+I9aYoD3xGghqkbmt+HFWXZPZh63k/MIozzMrnr9cpb2IVUk/4QIuTMGHqIfB7+Jrob
	Q1hRz8VgPDNGKp8vDj7qWG6usQmKBHkQY6FxJpXt3khOfXlpmkTGQDcaO4f7M+7Td2v7Mg9BeYS
	8JvwMLbZHUGw7ua+UghoNHeR8YzBdLHq8JZDTV/r5RNP79HrAX7oGeb3FdcySzQs+E47GGndO0n
	DTDUuBGl33MybA9UsZXv9uU4173Y+SSoQB5RC4e4uxQMtcqTaABUbVxaBHYVKRwLxJVytL+/iHV
	EFw9bIO66qb2yJ/mIZug7X5W1Q/B8jP6cca3/eD2ZOy7TN8/TKiG8Z+/UnwMEFkyCgENfoCswaD
	w==
X-Received: by 2002:a17:90b:5185:b0:35a:18b1:c245 with SMTP id 98e67ed59e1d1-35e4250f241mr11933562a91.3.1776052236668;
        Sun, 12 Apr 2026 20:50:36 -0700 (PDT)
Received: from localhost.localdomain ([2405:6580:9cc0:8700:96ae:8c3d:9c98:97d9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e4e2dbf47sm7030644a91.0.2026.04.12.20.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 20:50:36 -0700 (PDT)
From: Berk Cem Goksel <berkcgoksel@gmail.com>
To: zonque@gmail.com,
	tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andreyknvl@gmail.com,
	stable@vger.kernel.org,
	Berk Cem Goksel <berkcgoksel@gmail.com>
Subject: [PATCH v2 2/2] ALSA: caiaq: take a reference on the USB device in create_card()
Date: Mon, 13 Apr 2026 06:49:41 +0300
Message-Id: <20260413034941.1131465-3-berkcgoksel@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413034941.1131465-1-berkcgoksel@gmail.com>
References: <20260413034941.1131465-1-berkcgoksel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The caiaq driver stores a pointer to the parent USB device in
cdev->chip.dev but never takes a reference on it. The card's
private_free callback, snd_usb_caiaq_card_free(), can run
asynchronously via snd_card_free_when_closed() after the USB
device has already been disconnected and freed, so any access to
cdev->chip.dev in that path dereferences a freed usb_device.

On top of the refcounting issue, the current card_free implementation
calls usb_reset_device(cdev->chip.dev). A reset in a free callback
is inappropriate: the device is going away, the call takes the
device lock in a teardown context, and the reset races with the
disconnect path that the callback is already cleaning up after.

Take a reference on the USB device in create_card() with
usb_get_dev(), drop it with usb_put_dev() in the free callback,
and remove the usb_reset_device() call.

Fixes: b04dcbb7f7b1 ("ALSA: caiaq: Use snd_card_free_when_closed() at disconnection")
Cc: stable@vger.kernel.org
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Signed-off-by: Berk Cem Goksel <berkcgoksel@gmail.com>
---
v2:
 - Correct "Fixes:" tag
 - Remove null check before the usb_put_dev() call in card_free()

 sound/usb/caiaq/device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
index d52f3b9a2bac..fa734fa61052 100644
--- a/sound/usb/caiaq/device.c
+++ b/sound/usb/caiaq/device.c
@@ -385,7 +385,7 @@ static void card_free(struct snd_card *card)
 	snd_usb_caiaq_input_free(cdev);
 #endif
 	snd_usb_caiaq_audio_free(cdev);
-	usb_reset_device(cdev->chip.dev);
+	usb_put_dev(cdev->chip.dev);
 }
 
 static int create_card(struct usb_device *usb_dev,
@@ -411,7 +411,7 @@ static int create_card(struct usb_device *usb_dev,
 		return err;
 
 	cdev = caiaqdev(card);
-	cdev->chip.dev = usb_dev;
+	cdev->chip.dev = usb_get_dev(usb_dev);
 	cdev->chip.card = card;
 	cdev->chip.usb_id = USB_ID(le16_to_cpu(usb_dev->descriptor.idVendor),
 				  le16_to_cpu(usb_dev->descriptor.idProduct));
-- 
2.34.1

