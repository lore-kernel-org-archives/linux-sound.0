Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE7A2882A9
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 20:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760991315; cv=none; b=Z0wd8CUw6rAFDeISsZpsn/m3HHhCpkt73JIum/+2CXuF+iMd4Vd3+t9XOO3rjE5AsaWqFits63HYcE6R4Ov4szWZSFi4k2YcQOFVAxV/HzvMjV/7voRupFqwxkStAfHZQvwbmlKl99vgXQ2l4iiZG6ekBY2L/ildSM3xAQyYDq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760991315; c=relaxed/simple;
	bh=Kc5bNmEubZl4sYZkcHdZ6Paz6xgeuvAdGnXOpQCx2+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PlQTp5jbEOItxDWrSUkk9w82oqCBWbWLMEPECxKUe/5h7dt+ED+MYVT0YRMv55y9tD0Z5S10SD2lw2FdYR1m/BXGC2ZTnjdGOaB37dUXVT3my1m5KzSuu/f2XSs14JyTipSxVopcxD3aBA3hjeT8HSWOmEfD44x3d/eugPU5asw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClJuLIEF; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClJuLIEF"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59070c9111eso5244277e87.3
        for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 13:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760991311; x=1761596111; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yx98TmEVarTo1B3jRc5NyV+G055egTLPM+n1lCsyQ6c=;
        b=ClJuLIEFIiJPE69INWvO4e7bPHcCPhR1fXVdLO0oO0qGfZlFRSWLyKx/aUTaTyXIel
         XWO+ipy5vpTTuQ+bs/zZtTa7br4N3wPZyPX/F498lg56coIuzoWetTx5VxOoxtrq6OZA
         uZgG8QZH3YsHbWYcy0buY0+hN6lspj+U4TFHjEgr+R6UHgXjt2atslkDuddiO+3hiqbm
         DOYYZAICmGL3jHOj7QHX25GBH2slcvB7goFlUzcNVMKD6cBck5sRvpcbmv3kqcZiOzfb
         H7SuZ6jTNuDnRXVRDEcAYyl1cxA4Wdz/+fgGlFhom8F6X4equ3sjGWApoUTIi5rCzY/q
         QlOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760991311; x=1761596111;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yx98TmEVarTo1B3jRc5NyV+G055egTLPM+n1lCsyQ6c=;
        b=a91kEyf+W84rFVHDCmwvjhSw+1u79JRt5H1Ht/Btpks6lMUHdD8wDSs+p1CY+2uaRB
         UPsVDaDqdzKia8sK3oilNqDGvicDL6+94+FiMudYrW3ONj8AzEHD4kEqbDEOm+RfNfBw
         u1nas/9/p3xcSn/KtvsjiFIEswitcseFM8xaqt8YWJlcbnhFTmS9DqejStZdwPDP0kPZ
         O35m2vgoTbWTSK92ywQXbeUbiwNaj8sYVpcONIpLB+LzfM/Y9DgOF1Phj0ZaeC2hnMBG
         UPSHqPsngOhI45ldM39b1+YqzdqEdGMscMy2cPh1Mksa/HR8d4a5tujAsQnEbzv+Z73b
         paqg==
X-Gm-Message-State: AOJu0YzFbVaKIDGZI3FrFozZCE4CEFcSLQk4WdCGxdHeekpmm8IhtJnT
	vjgVniBwZW0LPDDHYoj8FPh3DPbPax8ah8ZIMMWUU7zB4YrU7rkUlme2cdh1w4yK
X-Gm-Gg: ASbGnctLTQgYQafHINiPhhXFWUpqcCukGLd/y4bOctaLPulDsf+8w14nVoczlhVqAg7
	9R4UzYbPAmmoOnUuTPmV3BIAl6rktGjrX8StLDW+OSRYjzHXHo93nQ6SAf+vKzv7lFCb/hwbMB7
	uYpG3BuUzNCXdiyLYYxbXA0ar1/VF4aW6ggyIVl94gbOmzKQEil2q/qoQTIOjmS6mn8OTmFmuu4
	afzIqH63SNOsMpxfufd3dDVC3si8k90mDVsBfSta8/u3sqEBkx/7Vq6XpTxOEF63xlyvQEUCkqt
	9vjpPP1dlKuHLT/KK+ng565mB/ocuPwdA5qg1rfJoz+AKroL7af1k9C6aLkhrGZ5qyTmTZo2RSk
	PqcDduwRrKKXXg5WL1IgxOt2/LP7740XFWhAy0KH8eM12DkGO4ExkxfNlmvR2UEXP2x+MijE=
X-Google-Smtp-Source: AGHT+IEvWFgIezwkdDsDDcFHAGSMPNZCPHgwzF87uxW4HDrdSPuRmCiLY4VtPk/SoLk8DdOLGGKxoA==
X-Received: by 2002:ac2:51c8:0:b0:57d:d62e:b212 with SMTP id 2adb3069b0e04-591d8546608mr4170690e87.38.1760991310683;
        Mon, 20 Oct 2025 13:15:10 -0700 (PDT)
Received: from ark ([2a01:799:8db:a400::1002])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def16b31sm2805701e87.60.2025.10.20.13.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:15:10 -0700 (PDT)
Date: Mon, 20 Oct 2025 22:15:08 +0200
From: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>, Xj <xj@wp.pl>
Subject: [PATCH] ALSA: usb-audio: don't log messages meant for 1810c when
 initializing 1824c
Message-ID: <aPaYTP7ceuABf8c7@ark>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The log messages for the PreSonus STUDIO 1810c about
device_setup are not applicable to the 1824c, and should
not be logged when 1824c initializes.

Refactor from if statement to switch statement as there
might be more STUDIO series devices added later.

Fixes: 080564558eb1 ("ALSA: usb-audio: enable support for Presonus Studio 1824c within 1810c file")
Signed-off-by: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
---
 sound/usb/mixer_s1810c.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/sound/usb/mixer_s1810c.c b/sound/usb/mixer_s1810c.c
index 89c652434f71..6e09e074c0e7 100644
--- a/sound/usb/mixer_s1810c.c
+++ b/sound/usb/mixer_s1810c.c
@@ -597,15 +597,6 @@ int snd_sc1810_init_mixer(struct usb_mixer_interface *mixer)
 	if (!list_empty(&chip->mixer_list))
 		return 0;
 
-	dev_info(&dev->dev,
-		 "Presonus Studio 1810c, device_setup: %u\n", chip->setup);
-	if (chip->setup == 1)
-		dev_info(&dev->dev, "(8out/18in @ 48kHz)\n");
-	else if (chip->setup == 2)
-		dev_info(&dev->dev, "(6out/8in @ 192kHz)\n");
-	else
-		dev_info(&dev->dev, "(8out/14in @ 96kHz)\n");
-
 	ret = snd_s1810c_init_mixer_maps(chip);
 	if (ret < 0)
 		return ret;
@@ -634,16 +625,28 @@ int snd_sc1810_init_mixer(struct usb_mixer_interface *mixer)
 	if (ret < 0)
 		return ret;
 
-	// The 1824c has a Mono Main switch instead of a
-	// A/B select switch.
-	if (mixer->chip->usb_id == USB_ID(0x194f, 0x010d)) {
-		ret = snd_s1810c_switch_init(mixer, &snd_s1824c_mono_sw);
+	switch (chip->usb_id) {
+	case USB_ID(0x194f, 0x010c): /* Presonus Studio 1810c */
+		dev_info(&dev->dev,
+			 "Presonus Studio 1810c, device_setup: %u\n", chip->setup);
+		if (chip->setup == 1)
+			dev_info(&dev->dev, "(8out/18in @ 48kHz)\n");
+		else if (chip->setup == 2)
+			dev_info(&dev->dev, "(6out/8in @ 192kHz)\n");
+		else
+			dev_info(&dev->dev, "(8out/14in @ 96kHz)\n");
+
+		ret = snd_s1810c_switch_init(mixer, &snd_s1810c_ab_sw);
 		if (ret < 0)
 			return ret;
-	} else if (mixer->chip->usb_id == USB_ID(0x194f, 0x010c)) {
-		ret = snd_s1810c_switch_init(mixer, &snd_s1810c_ab_sw);
+
+		break;
+	case USB_ID(0x194f, 0x010d): /* Presonus Studio 1824c */
+		ret = snd_s1810c_switch_init(mixer, &snd_s1824c_mono_sw);
 		if (ret < 0)
 			return ret;
+
+		break;
 	}
 
 	return ret;
-- 
2.51.1.dirty

