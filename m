Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CD03DEFE2
	for <linux-sound@vger.kernel.org>; Mon,  4 May 2026 14:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777905941; cv=none; b=TFQdeYTGVVsjsouIOsAlEqjpVYmwaTyplVQEbbxrzA6dFR0OgdI/LuoULmvZ196NuGzBy5CMRV46S0qiflDmm70++cAJrpa67AxnRXuu8whuxQP3Lw4hd5VjXUvJ+ckD58wy3vIih9xSsnhIXnn3Y/Jor+2kSRL0K7/Z2c0HZM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777905941; c=relaxed/simple;
	bh=vz7C4bwaSFfLhKG9gF3cmKLpQFT3PfcjksWFrcQpjpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=J8aZXKwxH/Jx87GjfrHGCu+hTRvJGLeGNjRO739yYw+ARjwplh8j9JYZbyePaVoO4lmgY6fIZroSSxNCOAr2gn9k+vSxLhyqGEuOF6j5v/51VFpPqTk9iAJTdkwVukGPD0JesjmF3YQ65/3i5weWlBm4IcqjR5q/Y56p12j2rQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XcZOt15s; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcZOt15s"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9382e59c0eso666168466b.0
        for <linux-sound@vger.kernel.org>; Mon, 04 May 2026 07:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777905939; x=1778510739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=636wrJxyrEfAh6bHhln+FR+4YriOY+vbd6ZYe/7NrIM=;
        b=XcZOt15sG7x25N45ATnMMFI329CY1CQI7CWehHiVF1MQZdrOoHSCezAzKSyFHl5tGQ
         /ga5mombJzsDGsB3Lq1llLWGEtTmcFjHj1B8AO6yKL5dOtJxk8hSxGDPkvO7wXk98gpI
         7r/u6lb78NOmdjIhLGEHollJnjS0JhSWFC90/M4Viqi6bXEpX/jXYkeIOtl4xEiZYwkN
         8CszYLYFpG2V6VLVcHVmv/MsypUk/btWkXg5NLU43Pbmc8jo3yHJLmuT5Udj4TRRV8pF
         ptKm4fT7RDlJl3mz3c/iAJxiDqfZgHEW/Lo6jFVJ/XSTaGrW2fQy5DQHHil5Nw7YkGDl
         oSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777905939; x=1778510739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=636wrJxyrEfAh6bHhln+FR+4YriOY+vbd6ZYe/7NrIM=;
        b=DOnq58H6J0XlgYO/Qfe3ckOl5+CQBxTHS1Z8CCUWlOWoVRx9G8yI2lHpmwQhBIDEUf
         Me4Zs8MXEIxItqt1CwlCVP1YksC25CqQS6ezmgn644F+gOGDMlcDHl07TJsnav7myPuC
         RvU40z7TmbfsfueUAbKGx7ZXTsXW1hQ95BBVxuUmPIwTs0jITx2gb8lRPTpIRUQ5k5O2
         nrdm0i2T09X0EwTkIEYspC8iDDKYPafqS1s10r1toMVkEdm6AjggvMwJpGyvJHuR3oLx
         XbA1BWGCNH63SVxyMTamZq3YjKUHbJ/x+DnMDQQ7tnM44wpOzaUafl8/95CNGp+cQ1st
         7YRQ==
X-Gm-Message-State: AOJu0YwkyciYRh855QG+ouD1lyCSbj6f4UcxtmlZURG8y0YlKO1PD5Lq
	gW48abm7Y1T05OeREo7MBnednbxEz/atz9uWb90JObqtW4h7RGhxkYGG
X-Gm-Gg: AeBDievvfqWl9QccFbv41AI3kXVNZ/O2up0rfgfaX5oUX8CYPc0NY/UVJs1HXfM0N2q
	9Mm7bxSerMz0P3C8EerGdGfbTQGESr+FbpgFQKYegBS3ATq5li9uYjaclTlEYWig7qh5flT9VI4
	hIHUvtiFPVrNkqkXSq+QNFKP2vmt4dbm8vmnt8nE6ni9mqNU7YshyaNRBgt3iFdIJCCJAIuT0B/
	liU0/I4aXGr/S8MvJ1rWM+dAQqSur+nilVS/d9Ucshl1olbgJSyyf2n0GKnEZcxRi3Ef6c8LLSd
	Cs3dXJrA/Iw7p0aimhoGum+PYIvceAfXbaRp8hH28viA07JVBYy+ANZ+VYlSg3aRSQL1yuuCVyn
	ZzKdm9n2i0czoZR0DH9a6Rc9QINgk2VFZZob/tskZqj7DanplAPoi0YfUUl8ze9GbJbVJNDZ5rv
	1GxlMmT49yo9YFmss5NHMg6dyWJIO+sOQI9WYtm+qbJ0jjqdtoluCxr7UtbiLGHRSnAIO72ojvv
	z/Xsy8kKnB/GxODolAYPke1vkpf6115GzUDgWEZFE+aRZDs/zHkIJ0zLvuxAlT/S9ij
X-Received: by 2002:a17:906:9fce:b0:b9d:6cef:95fc with SMTP id a640c23a62f3a-bbffdbca512mr534069366b.35.1777905938255;
        Mon, 04 May 2026 07:45:38 -0700 (PDT)
Received: from nick-GTR-Pro.arnhem.chello.nl (2001-1c00-3281-1680-7a55-36ff-fe02-cdba.cable.dynamic.v6.ziggo.nl. [2001:1c00:3281:1680:7a55:36ff:fe02:cdba])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6ab4fbe7sm405761366b.28.2026.05.04.07.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:45:37 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Nicola Lunghi <nick83ola@gmail.com>
Subject: [PATCH] ALSA: usb-audio: add clock quirk for Motu 1248
Date: Mon,  4 May 2026 16:45:20 +0200
Message-ID: <20260504144520.699522-2-nick83ola@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Motu 1248 (and probably other older Motu AVB interfaces) take more
than 2 seconds to switch clock. During the clock switching process the
device return that the clock is not valid. This is similar to what
already implemented for the Microbook II interface. Add the Motu
1248 usb id to the existing Motu quirk.

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 sound/usb/clock.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 656cfdc95c48..af71e4b02070 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -208,11 +208,18 @@ static bool uac_clock_source_is_valid_quirk(struct snd_usb_audio *chip,
 	}
 
 	/*
-	 * MOTU MicroBook IIc
-	 * Sample rate changes takes more than 2 seconds for this device. Clock
-	 * validity request returns false during that period.
+	 * Quirk for older MOTU AVB / hybrid interfaces
+	 *
+	 * These devices take more than 2 seconds to switch sample rate or
+	 * clock source. During this period the clock validity request
+	 * returns false, causing ALSA to fail prematurely.
+	 *
+	 * Affected models (all use vendor 0x07fd):
+	 *   - MicroBook IIc          → 0x0004
+	 *   - 1248, 624, 8A, UltraLite AVB, 8M, 16A, ... → 0x0005
 	 */
-	if (chip->usb_id == USB_ID(0x07fd, 0x0004)) {
+	if (chip->usb_id == USB_ID(0x07fd, 0x0004) ||  /* MicroBook IIc */
+	    chip->usb_id == USB_ID(0x07fd, 0x0005)) {  /* 1248 / 624 / 8A / UltraLite AVB / ... */
 		count = 0;
 
 		while ((!ret) && (count < 50)) {
-- 
2.51.0

