Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E3D332614
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 04:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775797166; cv=none; b=lqIDcYI7Vx4MW5KrMh6Mi5DvZ9nH+KIkl+EHcOddfCVTUO0NkvQEp6Kes4a4WT0WTufY0gczHETtTngyn03fyVK611Jhww0KY9dUcXfONZf/Qqp6Po9v850QXJASOtiibnE61zq9OpTJ7kX2elpxKvAqEi6CrggguTOK8fjB4/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775797166; c=relaxed/simple;
	bh=H+oGYEs5fchtX3azG4HOYAIJ+1ETOf5iY3TXTfGXYE8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iWUGbeaaM186uM0JPjTB21Di8Z8wAJMKKJmdjk2R/Tl2agwtq4A9M6rjYgoqbHbyYXJaT8e+LfH7HTZ2ZghUisx0mer10+y2b6mEvgKVLKWX+XcYHqroPuweQ8N4XFpyVsS9/Tl82kTAs+wMWxn4MK42KzmlkLTkrn0pnk0ZkMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FZvzEtel; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZvzEtel"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b23f90f53aso15868455ad.0
        for <linux-sound@vger.kernel.org>; Thu, 09 Apr 2026 21:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775797164; x=1776401964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+ccZUVsgwP9j2EfpM2Pvt6St6Icoqel5xtWnUPnC3w=;
        b=FZvzEtelhytr4ZFllvCfAddtReGWJ7kkeaXF49aV9jCvgYnoPZgWiJaHNnCppJ5W2i
         FdPIzNtE2Z0pmjTO7JU4oHOHrwPUnK9p2Nujfclb5jE6YNhWhm+AnI+Jr7rCTKM5Iv16
         +gZjTTPwicrLJFQ8AzeJo70ExjPztxr5HsAFGSBbSFiWcC354GV9g7QGkEWSsV5LduPm
         Dc4LLMgCwHe6eF/WE0LEEaL54PcRduH9bJi1EubaS6csdf6ehFpF5y93lenagpKG7tFb
         NJT0/Xt+d4fdTQBmcBAjEF8YTrL6+ZhV8DE+XMn/IkegoySwRATaT5t+JFdu1/6GT1vp
         Xg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775797164; x=1776401964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4+ccZUVsgwP9j2EfpM2Pvt6St6Icoqel5xtWnUPnC3w=;
        b=e6kFlLmYb3fqicK+2mXyScMadm8y7+roQG8Kp89bptFO9njv0E+PYlVWyWgdYEcNdv
         z2Uh4QaSx/5rpV8CwcxvC2+qIUWTpMDvh90n1RyBv7Vq4AyYO4V66X8rifcAivXhhuFx
         XJaL4/kYA6f2LFbawBWvdc0DWHB8KA+pOZ379kewLDvfEcqrh7pbWHUEDb5gCbXjr7a/
         POKrFror1DTsVFmNxGhNLlyHsd4BnhDKZIngMfHDFB50CaP2W2wfetq3s52IjsUQVdE+
         xYOZmBEL0nV7cXofYp1PikLUpQd2m0nwdmKeVbAvvO9RS1PWAY4LXoOpnbDSH17VHA1H
         KWPw==
X-Gm-Message-State: AOJu0Yx2RCaF3jup3iDfbNjp5PvMKaOXz/QimuQ1WReuQILHpjzT47QR
	n8m1r6ZePUF4/cl8BWDWLHl7xa5L8e3ZVK8bmjJOYW6C2ItDzuvQjjBL
X-Gm-Gg: AeBDies76/gAvwRmv3U7qrY1gNAzjPUfr8Zx+w7O766LDyG1ju3LrvPQO/jvaUJWjTP
	36rA/4pFf6+NNaCoPeWB99Re5VjVD1CyGGBfjkX9miieHPZIFanmLdIvsJ7jLkeHrozzh51zM0s
	AkOYU41i09h+mEc2dH3Yt0Qp9JzTLt9dkgbO9m7y+uvhM0Tl31WlP+MjXHgiPexWkuH5jyuwQXQ
	q0evg/sbxkEjIBCiaZctOAYYFvaL6zl2UfNijH4Yby4BRB2OY3Eu60nYHC0jY9q1Tv9PzDSSFie
	OgCmZ1GTkkTKLD7xdPMM4moZZiYEYDJe+OJn8GjXaLtB/Chc++qaLY491s2n5TAnJZi3mHfyjIf
	oHc9tuJJOglHkNQCGL2TbRTokHUo1Xgrl8HxqAyPG6kAoIf/kYupvVyaILztjp+C7CkuTKV+23r
	e+L+A3zZnoTjzOYTeSyoGDpLnIsbU5YsZ6Mk1NjjGwW/02uVUz8fv/oBZgCvADrbNgdNzguQ45R
	fVvYDxJq+n52oDHJvUCPbmTmRl4eer8kQ==
X-Received: by 2002:a17:902:be03:b0:2b2:71b4:a3cf with SMTP id d9443c01a7336-2b2d59d398emr13488835ad.19.1775797163940;
        Thu, 09 Apr 2026 21:59:23 -0700 (PDT)
Received: from localhost.localdomain (59-190-207-251f1.hyg2.eonet.ne.jp. [59.190.207.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f2af90sm13532835ad.64.2026.04.09.21.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 21:59:23 -0700 (PDT)
From: Berk Cem Goksel <berkcgoksel@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Berk Cem Goksel <berkcgoksel@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] ALSA: caiaq: fix use-after-free and double-free in setup_card()
Date: Fri, 10 Apr 2026 07:59:03 +0300
Message-Id: <20260410045904.1064020-2-berkcgoksel@gmail.com>
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

When snd_card_register() fails in setup_card(), snd_card_free() is
called on the card, but there is no return statement afterwards.
Execution falls through to snd_usb_caiaq_control_init(cdev), which
dereferences members of the just-freed card, resulting in a
use-after-free.

setup_card() is void and init_card() still returns 0 on this path,
so snd_probe() leaves the freed card pointer in the USB interface's
private data via usb_set_intfdata(). When the device is later
disconnected, snd_usb_caiaq_disconnect() calls
snd_card_free_when_closed() on that same pointer, producing a
double-free and slab corruption.

Add the missing return so a failed snd_card_register() cleanly
aborts setup without touching freed memory.

The issue is reachable by any caiaq-compatible USB device whose
descriptors cause snd_card_register() to fail. It was reproduced
with raw-gadget + dummy_hcd on 7.0.0-rc5 (arm64, KASAN).

Fixes: 523f1dce7096 ("ALSA: snd-usb-caiaq: add support for NI Audio Kontrol 1")
Cc: stable@vger.kernel.org
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Signed-off-by: Berk Cem Goksel <berkcgoksel@gmail.com>
---
 sound/usb/caiaq/device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
--- a/sound/usb/caiaq/device.c
+++ b/sound/usb/caiaq/device.c
@@ -369,6 +369,7 @@
 	if (ret < 0) {
 		dev_err(dev, "snd_card_register() returned %d\n", ret);
 		snd_card_free(cdev->chip.card);
+		return;
 	}

 	ret = snd_usb_caiaq_control_init(cdev);
