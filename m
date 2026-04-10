Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D5A330646
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 04:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775797155; cv=none; b=UAGC4AGXeCQgyvIAIsEvZ2nyBtAoO0tLL07JSljrRf3fE0FSl5X3E5SOcrDpEE38nARe77SI9Lb8/rENgoUgn2cJ4ZzDRojKVUbnjflI+cWI4sMfRkCVegtGlKfX2HakPEWjsijoFOp9ATLYljLeWROovS6MjmagqGbR2Got3EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775797155; c=relaxed/simple;
	bh=tL2l6rudcha7uJpABMbMyiOlHw45CT3iOCE1utMC3Kc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CxbXj9A8U7Fv3R3lZY0uI+7arPDHc2hVYRucYMhyXG2D+d+NYFASXJaA8/6QKZLsk5V35sCq5ws43Qoj9Y6Tic8UV+sEMK6fB+WiLweQQq52x9xoqtmbgafGIvpcUiJ0M9xBtxOAY9bXE+Wsb+iuLtmowO/58l/Ug+Xvq9UViMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pRJpm4eO; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pRJpm4eO"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2adff872068so9235795ad.1
        for <linux-sound@vger.kernel.org>; Thu, 09 Apr 2026 21:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775797154; x=1776401954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+WrzCOorrKiS4eDhHFjIY7pwapnt7HGqp+6pIClih4g=;
        b=pRJpm4eODwERjBUw8I8yMuBrWQhz2Ekv/uRJl6qTw3/lx6Mz0wCPIQRzGleYOWIf3a
         jqEclPjNewwDP1lDSU0wStlD/wuXZl7rBjljOhL+jPo8rIqUFCxiC6XajuGc+15w0hty
         vFcY5HC+A1pzLjev5aVVvtWoah+JG9IKFelz5lUezupc846OQnAswAuqItvPduaPTyS6
         opBUQaLW76yrlTBDA9AVtYhOgIeSBgxX6gb/ZZkNzqoxGBNr3Tp3brjTwHdYb6EYDT2b
         v1lYUN1N+ShqLkzhgxOtANpriwga1b8lM6OYBYDD+XSV1GjcIZZ1KsF4Pa7M3HthmUlJ
         jRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775797154; x=1776401954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+WrzCOorrKiS4eDhHFjIY7pwapnt7HGqp+6pIClih4g=;
        b=WfE3ymYKU6Up4RV4V+sRpUEK0MLJTPZVpH4nOOvUJOclxaj9WEUqrlLZ/Rzf0Cl73k
         +zrPJoWOswS4y6M0veWv1weLMgKUwHc1uAArtO0tCcc3GdjYHpaqqCH5TluP7FyUai8u
         00fE+Ev77KM/xquXfRsSH1Kz24XRVxKsS4FHOpkej9NIRZQ55caOGUtTzlqdofRCN3OK
         e91iIU0ps3pFz0NviOirqJVsGMSWwBL+qifsLJu93HQHIziBUYbIX49K9GEI2lfVeFMf
         SrRaG/6fIaWowI9GxusxKZCraePZnP9wwyeHc779ABoi3rZ4weFn3/FRfyn8yytQuE9h
         46tA==
X-Gm-Message-State: AOJu0YwkH4MskoY1G6YNEX6O3gFCHuGKKyr+tw5w9hzWoZ8QoUENqcVZ
	U6i5/KEJJE2H+/G9EwjlSrAN1E9W6Xy/+Mo7B5mHSGGIXA7n4IhkNR05voMVIrx+
X-Gm-Gg: AeBDietOMToLOzsNd4Y7YZT6N9255rVHo5hdjws9YTtHShsetHjKH6QmbYAEjfYn5vg
	hWd9P0bRnULwQnn7gq3gLMIzj+xa724EXtOAl7A8ejpgWKA9y8MN2YKkKIhHj+E2va9u75oX1VT
	lVW3ZV1VwEwBZmfa9MmcusRarqPRl95osbvV7tEV5yTi6JPc5x4lCgckUpQjdSj6SsOHse0m9aT
	PfwXocK6Vb4yoj628jr/i5FmLukkpaPqoYypcYDnupFR/i+Zz19dwzf19JlEcMMrnLctml21+st
	hl9X4KT6T8TwA5OgJ1IN2zwy7kM/nxJi66ssj9qVIBm/SspAQtd/Ue1OfBlCEwL4ky6TS8pNgwc
	iYr3Uw1c/WIyxbDXsD//k6ix8p+ql5IcufZ0yRuLl9GDVhkseOLLqZs0G9eOpis9bHM3K1UNTJK
	/v1eAZhNBmeoDpp10rFCRAcw+9a8kLZQTo4pzQU423XQA9h6RsFZMGz4PjbVkzt56M1SfsjcX7G
	E5Y9ZKAK1adNbJVLTqnVVlODA8rDS13sw==
X-Received: by 2002:a17:903:1250:b0:2ae:59a9:639d with SMTP id d9443c01a7336-2b2d59764eemr16820455ad.4.1775797153551;
        Thu, 09 Apr 2026 21:59:13 -0700 (PDT)
Received: from localhost.localdomain (59-190-207-251f1.hyg2.eonet.ne.jp. [59.190.207.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f2af90sm13532835ad.64.2026.04.09.21.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 21:59:13 -0700 (PDT)
From: Berk Cem Goksel <berkcgoksel@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Berk Cem Goksel <berkcgoksel@gmail.com>
Subject: [PATCH 0/2] ALSA: caiaq: fix UAF, double-free, and USB refcount bugs
Date: Fri, 10 Apr 2026 07:59:02 +0300
Message-Id: <20260410045904.1064020-1-berkcgoksel@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two bugs in the caiaq USB sound driver, both
reachable via a malformed or malicious USB device using
raw-gadget + dummy_hcd.

Patch 1 adds a missing return after snd_card_free() in setup_card()
when snd_card_register() fails. Without it, execution falls through
to snd_usb_caiaq_control_init() on a freed card (use-after-free),
and the caller then leaves the freed pointer in usb_set_intfdata(),
producing a double-free on disconnect.

Patch 2 takes a proper reference on the parent USB device in
create_card() with usb_get_dev() and drops it with usb_put_dev()
in the private_free callback. It also removes a usb_reset_device()
call from that callback, which was both racing against an
already-freed usb_device and inappropriate in a teardown path.

A related stack out-of-bounds read in init_card() was sent
separately and has already been applied; this series is the
remainder of that investigation.

Tested on 7.0.0-rc5 arm64 with KASAN and lockdep enabled.
Reproducers require CONFIG_USB_RAW_GADGET and CONFIG_USB_DUMMY_HCD
and are available on request.

Berk Cem Goksel (2):
  ALSA: caiaq: fix use-after-free and double-free in setup_card()
  ALSA: caiaq: take a reference on the USB device in create_card()

 sound/usb/caiaq/device.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
