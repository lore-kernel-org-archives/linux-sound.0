Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813F32141A9
	for <linux-sound@vger.kernel.org>; Wed, 30 Oct 2024 17:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730308710; cv=none; b=RCh7dzG8S7a+UpNilcrzy+xHIxSEoijdJko5YuYYExKVhpjpsdu+D47XZrUarhNxBHYd24uQBL9fcZEL8iv3Z69XrfPLisqcE94mZab9kcTIms+iKZdfM2AXvRcU2i5XSta6/2CwbYZKsx3iI64WjJ5BQZ481pfbftSnBk3Rt2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730308710; c=relaxed/simple;
	bh=lk9hkxYpcsFKacPUGz1tDYKTRxXj6UxWAO4fTYmk3AU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GDnbtjH5NAzoXF7bfLPeWWaIcWRfOgQ2bznkdqE93RALGiMA9bzEY9HyV6MiPMdiryyhigk3XWmjhLpdIGbEsF62vzfU6IIWJVYBD8l0zfruonjSjra+YwgrtBHzZDn739W8QUlRHYtcXwaKH09DBmFb6BZ/EJ7rWNXcKlvxwE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ku7VMX5X; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ku7VMX5X"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9a0f198d38so3825366b.1
        for <linux-sound@vger.kernel.org>; Wed, 30 Oct 2024 10:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730308707; x=1730913507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQzwn5z+DUdNWARJfGMnrwwxY1epH+roX2k7ep/4f2w=;
        b=ku7VMX5XdYL3ZZFbRdX9oNScnqR2A+1m+ALzoFHNIF2S5JS1WK0RpXUro/0QwVwiCy
         AZUfZ/Mhk0ErjRxxSp6fJMx5XxWVRFMNnnk7xen2+4vtYZyXHc0lTI6uPK17YNxHGuMp
         1aH+Tjt83C+ZFBoOQoBQfoLRn2AxTL/W7aQUNpAdb/0HWIhZcxlRphYKi3NjGCQ+K3AG
         oDtMOr6vdiq1gm39wN9EFyFiNIM6xWjHSSTeKTA/oyJwd9tetCex73vjFVdHJYEbl0+w
         LeMatkrIBx96uM2c9RGBimZ2V9icr+FEt8KHIY+Yq9xsOQSx0jmRd7onqc35CnG1WWpT
         zkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730308707; x=1730913507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQzwn5z+DUdNWARJfGMnrwwxY1epH+roX2k7ep/4f2w=;
        b=wRJ+1Dzv9PQNB3/8m0b9DNEKKcO/tLN2U2s7ZQvgddZDtrnypH77ByY3ChuxW121PB
         StoL4BU6NNy6ZJHA5FNO3QmuHlqARboxbeS8HX7gLuryyh+jvwMyszYnbAnUPu7VmHPU
         hnU6SsCMQwzH9R7sZr0g5MeUPkVfFWkRf3xkoaaNaEgHNU6YZzkZSrsX/WRGOwtouBkP
         Y4hOiYIWpWe5izKjM/XyJCnMqYXtxwrNiaWB0ilFOTSSl7ZVPiL4CMtSJqMXESDnFs8l
         ggC2sEoezK7DoV181c2m0fYKdBC9xYsrFNFWwFM2IPeHeNL1IbBL4xZInMNsvpNlH/Fv
         xwYA==
X-Gm-Message-State: AOJu0Yw283Xx1cVJB321Fpfn7y0zLxqm1+tMCbYK3kfNdCersE5XEx1R
	aQozgUWnOL9Zh9JWeudxQr7Wsz+61mBI7mgWGP8DG5uWPv0Y9N4l
X-Google-Smtp-Source: AGHT+IHh1pdAu50BWI24z47fkt/0VpVzxLXP8ogO2dSej65zCgfo1HFZH9DEuBIILno5VIpGiOBoJQ==
X-Received: by 2002:a17:906:c148:b0:a9a:a32:bbe4 with SMTP id a640c23a62f3a-a9de5cfd5dcmr1536203766b.12.1730308706400;
        Wed, 30 Oct 2024 10:18:26 -0700 (PDT)
Received: from yaro.. (adlk52.neoplus.adsl.tpnet.pl. [79.185.14.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e214152adsm207582866b.92.2024.10.30.10.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 10:18:26 -0700 (PDT)
From: =?UTF-8?q?Jaros=C5=82aw=20Janik?= <jaroslaw.janik@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	=?UTF-8?q?Jaros=C5=82aw=20Janik?= <jaroslaw.janik@gmail.com>
Subject: [PATCH 1/2] Revert "ALSA: hda/conexant: Mute speakers at suspend / shutdown"
Date: Wed, 30 Oct 2024 18:18:12 +0100
Message-Id: <20241030171813.18941-2-jaroslaw.janik@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241030171813.18941-1-jaroslaw.janik@gmail.com>
References: <20241030171813.18941-1-jaroslaw.janik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 4f61c8fe3520 ("ALSA: hda/conexant: Mute speakers at suspend /
shutdown") mutes speakers on system shutdown or whenever HDA controller
is suspended by PM; this however interacts badly with Thinkpad's ACPI
firmware behavior which uses beeps to signal various events (enter/leave
suspend or hibernation, AC power connect/disconnect, low battery, etc.);
now those beeps are either muted altogether (for suspend/hibernate/
shutdown related events) or work more or less randomly (eg. AC
plug/unplug is only audible when you are playing music at the moment,
because HDA device is likely in suspend mode otherwise).

Since the original bug report mentioned in 4f61c8fe3520 complained about
Lenovo's Thinkpad laptop - revert this commit altogether.

Fixes: 4f61c8fe3520 ("ALSA: hda/conexant: Mute speakers at suspend / shutdown")
Signed-off-by: Jarosław Janik <jaroslaw.janik@gmail.com>
---
 sound/pci/hda/patch_conexant.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index c74f6742c359..b2bcdf76da30 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -205,8 +205,6 @@ static void cx_auto_shutdown(struct hda_codec *codec)
 {
 	struct conexant_spec *spec = codec->spec;
 
-	snd_hda_gen_shutup_speakers(codec);
-
 	/* Turn the problematic codec into D3 to avoid spurious noises
 	   from the internal speaker during (and after) reboot */
 	cx_auto_turn_eapd(codec, spec->num_eapds, spec->eapds, false);
-- 
2.39.5

