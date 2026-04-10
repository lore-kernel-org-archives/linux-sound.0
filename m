Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5FB328B7A
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 05:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775797225; cv=none; b=EDMs8FE81L/GKYseN3AOZcvyC76nSCe2eVFvUulUgM/tB3qiLpaOcr7MQEp/VuuhPf3J1ZletAzvdDfVBrwhux5pQV3My59whHZ5lxAGJfGNP6Q1p6MRObeLCc2jnT3R/wHyi4FKFk8KtGhVXNzfv/+KBx0K4gd5R6ni9YA9J/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775797225; c=relaxed/simple;
	bh=BwLOMX36Z3otAQNyGKjCXVwDWH8R7e6eiQH3yP3tVug=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kOkiivM3DgYyGnTAaXPKs+L3f4lBOL4TO8ywq+F6+fGWpcQCD1F3rYfYijqeFtyltRE2ijov9waaZ9Le0pGpByCCcWRZtwBJB1rSP83w7Ydeo+OQGcKDhvSc5ivqOAGfd1SUy15ks3uqcmzoDQXpykzZ14zO/Gvb2Y2ko2YXSDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N9pJ5ri2; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9pJ5ri2"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35da8d037a5so833801a91.0
        for <linux-sound@vger.kernel.org>; Thu, 09 Apr 2026 22:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775797224; x=1776402024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJaSDl2asy+QBwHUG5HTFQEuT3Wu+LftRP1raa/0B04=;
        b=N9pJ5ri2YadLpc115nVcok5/wMU9CCT3bsGHiCIE8f2kkH4ryCoruu8WLOo2L4XA3e
         m9w+3FcVJQkUaQZuiYkr+unb2wkK7qKEMlXGCZICbrLzV1Ml7Zmqc+VVM9PieRLkRkif
         oLVj5ue94mI33YWcAm1hnp2KljRXWBjDpiDNnhVExrDy9VYDdDHQCz9J9DvdRY4SrZCi
         U3RuBym6LTzKdX1Pr7SRiS2I37knd18VBC0QwzC8fW2i6FgEfUnOdCPh6gjATVPeI1+P
         RgW16XN3OOjlA+H+tIeaSYiceaWNxaVFoK++X/DQJ7C6TexoJXR8uZ1yCSOkCtgiYHPC
         H85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775797224; x=1776402024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UJaSDl2asy+QBwHUG5HTFQEuT3Wu+LftRP1raa/0B04=;
        b=E760btgRlk1RFE0kB1nso9G3DEb330G5x4PtbnjnTacfy+poNSQELbPHxw85TqwJr5
         wEgOV+M98fvqlp9pO3JuB7Ry9IO6beU5v46yhz91tOe3qpkMj6wJNwp/da3qttiNVcYd
         dQT+03HnAEBmRrLwX3TbRBvMf7SA8AuG7rQSuD3gVxPebF99Aw+mwkg5x8KBshiq9KTY
         6rbmXjkRLID7P/v1AZliBI5agAd+uxtSQxKWAsKfyl0w7tgHQ6fCsMgttbSwpTQk8ulc
         f6tvB5hIcUQelhLXJf27Ki1iDqmF8g31gnzRKIXQkJqFDpaqVB9lqiD2bYyJ3LDFPRil
         7eMA==
X-Gm-Message-State: AOJu0YwtC2BB7pzdzuTGvz4MtH/ysYSC4YGX7q43Xo5t6+ns/7F4KOdG
	k3s0EKzQMbXpPM+tL/7T1XaCPKDkaXINUCOV8VeUjkCYkujBGY5FJAgR
X-Gm-Gg: AeBDieuhMeyoBnnXV8jhP8dq3qb72CbCoUttUy8+++wSE0BXoqCTyXi/PWAA45vbpge
	KsZ0GdDYYT7wqo5BYFW34uGgJak+L3K9wXTm4uv4n+QnC9tmFKOUmfWew/E68/kTxDOV2KIXpqK
	bDOzQ8X9lJ5FA/l/XFOCE6FX4VXeQiWuhUEEttoaHjdtxVriDxCHDJ/GixrpvaPhMNWBRNs6MgV
	lNLxEm/gs2SDzdyVFnEhy9BbueLQGQyYXxDwVBy6Uro/ePvWsg0kJou8yag3jB0z6S3SR08DMUw
	h3CQ67h9EfqipGOOAjW5xfe7j3SVZmqQFe+F7lbOe0v6iAONQma3MqOfS7ydcPTW4g62wSPe599
	MqItHiufq2AaEv5dEP8Za6vKKl2+f/2jhCddUUCrFPxlgmzatKi5RcYyx8kea+PuZC8NnVuMY9k
	iiJMOWgHu1CMASN1dUoHAsu2gBFvL3QWv46AajO1AQI0L2ekwFRJzvEMMjoc8xrRQ+868P987TF
	QAx2fN6RVx57nuDWdzHCAjF0SEEJSCAlg==
X-Received: by 2002:a17:90b:28c8:b0:35d:9dc8:7191 with SMTP id 98e67ed59e1d1-35e4280cc32mr1907336a91.14.1775797223872;
        Thu, 09 Apr 2026 22:00:23 -0700 (PDT)
Received: from localhost.localdomain (59-190-207-251f1.hyg2.eonet.ne.jp. [59.190.207.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f2af90sm13532835ad.64.2026.04.09.22.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 22:00:23 -0700 (PDT)
From: Berk Cem Goksel <berkcgoksel@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Berk Cem Goksel <berkcgoksel@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] ALSA: caiaq: take a reference on the USB device in create_card()
Date: Fri, 10 Apr 2026 07:59:04 +0300
Message-Id: <20260410045904.1064020-3-berkcgoksel@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260410045904.1064020-1-berkcgoksel@gmail.com>
References: <20260410045904.1064020-1-berkcgoksel@gmail.com>
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

Fixes: 523f1dce7096 ("ALSA: snd-usb-caiaq: add support for NI Audio Kontrol 1")
Cc: stable@vger.kernel.org
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Signed-off-by: Berk Cem Goksel <berkcgoksel@gmail.com>
---
 sound/usb/caiaq/device.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
--- a/sound/usb/caiaq/device.c
+++ b/sound/usb/caiaq/device.c
@@ -385,7 +385,8 @@
 	snd_usb_caiaq_input_free(cdev);
 #endif
 	snd_usb_caiaq_audio_free(cdev);
-	usb_reset_device(cdev->chip.dev);
+	if (cdev->chip.dev)
+		usb_put_dev(cdev->chip.dev);
 }

 static int create_card(struct usb_device *usb_dev,
@@ -411,7 +412,7 @@
 		return err;

 	cdev = caiaqdev(card);
-	cdev->chip.dev = usb_dev;
+	cdev->chip.dev = usb_get_dev(usb_dev);
 	cdev->chip.card = card;
 	cdev->chip.usb_id = USB_ID(le16_to_cpu(usb_dev->descriptor.idVendor),
 				  le16_to_cpu(usb_dev->descriptor.idProduct));
