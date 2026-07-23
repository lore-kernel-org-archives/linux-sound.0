Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F3144C4F3
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 18:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784832403; cv=none; b=IJPrB9n+eMprchzHGvhg/8cv1IDwcI4mW/iKu2pyON4Y85m81uXVFvPWzvmCYlNpcBXKsrmApQj4XUH+5EgGu1relLgQj93FTwrSyAy3L9eB9ES8xXGauCGvvkMQ9tkhiRkPhYDYqr45E3eqPFqezfvlz1zLoZVCP1Y114kEwrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784832403; c=relaxed/simple;
	bh=pC3jMvPYeSyszM8A/kaY0D7/tPIf7nyRWa6KlRbsfEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hw4fBg/c48PBhNqOjz2vsAtoXzrj57OCb3hrE4lVjZBtqHnD0T00n0OxosrIF0vgSsGsfLoKVc9QrdN6lWssQmHUUgmUxd4ihXYSeRdZD+JIdy0YfA9aEo1dXBnfXTnun0jg+KBhdw8+bGFLG8lCjrsSB8zgYI46akxiufScIcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sXXt00zT; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sXXt00zT"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e58034d05so988525a91.2
        for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 11:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784832394; x=1785437194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bRDMoftjJ5LuSOG2BSFEOMESTYAdiLdW60GLICnyHDg=;
        b=sXXt00zT31L7vRa+Soa6xZPX0g2hjFDNeh0iULYKOf2acqU8NeJN/CTEoPHjCq89oG
         L0p3NrkiDkMy/m74uo3NUCWjX6MafmcMw+Ezljhc++i+MNuqx3MOkJ3eVA3q7q/bt8Z+
         1+zUMvwsebIeTVwL/ynelnc4pIpvGJs4EEKRsdw4WZjnTFrjVhi/6VSnQC9f/VKSsMnL
         Qq82EjxV7lLmG7+Sbtf1UxAZek6TPIJ8F9EwslrO0tOORtLcG3LRqIVPSjnbfePHC0nH
         VsWpTP7DcxvV6YtBrsY7rFPiji5zR9GYsepQPfm0PpL/Up9aYFUpL7hQubEt7DBd8IWw
         RzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784832394; x=1785437194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bRDMoftjJ5LuSOG2BSFEOMESTYAdiLdW60GLICnyHDg=;
        b=KbhDSubrdP7dLl+ueA0vUSS2VF8ImClh5pBobJvLo5zcTa667demmwBKoRZvF0zs6O
         Ts1rsHQRg8bZnA4AmsE/VIPsVD0K0uDGH6EnerG0OKXQt57CkhD3VBnexQvQDFqfBTyI
         NF940VWhAVsyehgtHplYF5Q/ff0pcl4qGaxUjp+BHXxaktKRCBXeQ0c5x2uQrTP+CrCN
         XhEvM8Q8bVwSw4CpSiiqkje0rGLWqqK+LkABizrZ0DCQR/f83HxJIjihVwwUS8zwbm6D
         MRMrab8cooq6YQmIyHw7fwPC2ceYVc15Hb57qg28dvHWK0AQjGhCi78lTbefbIJY/Wk1
         tiww==
X-Forwarded-Encrypted: i=1; AHgh+RrA4ae7+gxjhh31MwM//M2VUzaEoS6VL69gAJHhTuMubXmFIsy5ocVOfVFGjjnZFyCGPLfI7Q20BZrpZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPLUoX8pNACK3a+7YHgtt0LF9hOJc961K/qN7bQoKoJaiFDE3m
	xrpxMaNV8I46vm9mW3cIluLkB83uWCgaX+2A3QmcvtRnxYIWOiSGG3cTBb6TmXJ4DRA=
X-Gm-Gg: AR+sD13f7PYOSVfbvyi0Fgl2hNcj685bOyATFrENRk1z+NyFju9BeZrV0VJMW+KaWoR
	0gA+J09YqKV/sR8QIO4ZWvmnQYJlh9ULBAGGsJ6bBSR37InyZRRPxIXPJ9YTXCUSP5qi3VZyOiO
	QiMMyi0p6VFdiry4UKmMxT0s2KdEFV6MMukYD+amrCXn0SB5rzif6GqmG93z4I+iRaSNg2sBEQZ
	mJUPPsFDX0N+EuLzXC4aPs+i5EYcEgARVhDGuoNUEHrOapRm/JUDJtYjKS3l/uFys5yGtfMcUk/
	o1AvvagNp+B65xJjy/lJEHe99aixNIiU/KmsnQgKXza7PnKdU4i1Lfi53VkHMTbCxqPbtWX/wIm
	ls4efaJONpMoCQhGVz1QOUPQT9Yh/WYlx91RzfY2iRkrjz1Mr4wS8/tP/z3+s7Rp0sXKX6Eh1
X-Received: by 2002:a17:90b:5905:b0:37f:9ce1:736b with SMTP id 98e67ed59e1d1-38ec6a7a521mr3865959a91.33.1784832393651;
        Thu, 23 Jul 2026 11:46:33 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03af8a45sm308155a91.10.2026.07.23.11.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:46:32 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Julia.Lawall@inria.fr,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: cocci@inria.fr,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 13/36] ALSA: remove conditional return with no effect
Date: Fri, 24 Jul 2026 03:45:15 +0900
Message-ID: <20260723184538.3888637-14-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723184538.3888637-1-ekffu200098@gmail.com>
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both branches of the check return the same value, so the check has
no effect. Remove it and return the value directly.

This is the result of running the Coccinelle script from
scripts/coccinelle/misc/cond_return_no_effect.cocci.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 sound/pci/echoaudio/echoaudio_dsp.c |  6 +-----
 sound/pci/echoaudio/layla24_dsp.c   |  6 +-----
 sound/pci/riptide/riptide.c         |  5 +----
 sound/usb/mixer_scarlett.c          | 26 ++++++++++----------------
 4 files changed, 13 insertions(+), 30 deletions(-)

diff --git a/sound/pci/echoaudio/echoaudio_dsp.c b/sound/pci/echoaudio/echoaudio_dsp.c
index 4dd494508c9b..90d7f364d2b3 100644
--- a/sound/pci/echoaudio/echoaudio_dsp.c
+++ b/sound/pci/echoaudio/echoaudio_dsp.c
@@ -496,11 +496,7 @@ static int load_firmware(struct echoaudio *chip)
 	if (err < 0)
 		return err;
 
-	box_type = load_asic(chip);
-	if (box_type < 0)
-		return box_type;	/* error */
-
-	return box_type;
+	return load_asic(chip);
 }
 
 
diff --git a/sound/pci/echoaudio/layla24_dsp.c b/sound/pci/echoaudio/layla24_dsp.c
index e7b8f5fe7753..6ed485acd618 100644
--- a/sound/pci/echoaudio/layla24_dsp.c
+++ b/sound/pci/echoaudio/layla24_dsp.c
@@ -54,11 +54,7 @@ static int init_hw(struct echoaudio *chip, u16 device_id, u16 subdevice_id)
 		return err;
 	chip->bad_board = false;
 
-	err = init_line_levels(chip);
-	if (err < 0)
-		return err;
-
-	return err;
+	return init_line_levels(chip);
 }
 
 
diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
index 99c00e46ce23..fa9cbeb43f15 100644
--- a/sound/pci/riptide/riptide.c
+++ b/sound/pci/riptide/riptide.c
@@ -1957,10 +1957,7 @@ static int snd_riptide_mixer(struct snd_riptide *chip)
 
 	chip->ac97_bus = pbus;
 	ac97.pci = chip->pci;
-	err = snd_ac97_mixer(pbus, &ac97, &chip->ac97);
-	if (err < 0)
-		return err;
-	return err;
+	return snd_ac97_mixer(pbus, &ac97, &chip->ac97);
 }
 
 #ifdef SUPPORT_JOYSTICK
diff --git a/sound/usb/mixer_scarlett.c b/sound/usb/mixer_scarlett.c
index 673eb8d8724d..b500d6d45e66 100644
--- a/sound/usb/mixer_scarlett.c
+++ b/sound/usb/mixer_scarlett.c
@@ -1383,15 +1383,13 @@ int snd_scarlett_controls_create(struct usb_mixer_interface *mixer)
 		return err;
 
 	/* initialize sampling rate to 48000 */
-	err = snd_usb_ctl_msg(mixer->chip->dev,
-		usb_sndctrlpipe(mixer->chip->dev, 0), UAC2_CS_CUR,
-		USB_RECIP_INTERFACE | USB_TYPE_CLASS |
-		USB_DIR_OUT, 0x0100, snd_usb_ctrl_intf(mixer->hostif) |
-		(0x29 << 8), sample_rate_buffer, 4);
-	if (err < 0)
-		return err;
-
-	return err;
+	return snd_usb_ctl_msg(mixer->chip->dev,
+			       usb_sndctrlpipe(mixer->chip->dev, 0),
+			       UAC2_CS_CUR,
+			       USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_OUT,
+			       0x0100,
+			       snd_usb_ctrl_intf(mixer->hostif) | (0x29 << 8),
+			       sample_rate_buffer, 4);
 }
 
 /*
@@ -1446,11 +1444,7 @@ int snd_forte_controls_create(struct usb_mixer_interface *mixer)
 	}
 
 	/* val_len == 1 and UAC2_CS_MEM */
-	err = add_new_ctl(mixer, &usb_scarlett_ctl_sync, NULL, 0x3c, 0x00, 2,
-			  USB_MIXER_U8, 1, "Sample Clock Sync Status",
-			  &opt_sync, &elem);
-	if (err < 0)
-		return err;
-
-	return err;
+	return add_new_ctl(mixer, &usb_scarlett_ctl_sync, NULL, 0x3c, 0x00, 2,
+			   USB_MIXER_U8, 1, "Sample Clock Sync Status",
+			   &opt_sync, &elem);
 }
-- 
2.43.0

