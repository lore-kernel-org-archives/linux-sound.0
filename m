Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C2033509B
	for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 23:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790031783; cv=none; b=tfDidUVKG2QjXBqiRyGaUwWY3rB9Hcv9amvvh/KiWxbOSXeeINDaGUqL0nrBGWYBaBa+a9E5FwRScobEpV751kXqaZ63EJ+9bEurvI54kXv+lzwtQ8wE3VFsM0sjNOabESnI4ILhWJmls3xyBPzR4tTzICgTwtuXOLfPUWU2fuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790031783; c=relaxed/simple;
	bh=CpNVuQQxaLMGLZLzAMlpQ1X0LRGLskBKSU4x3H+TOJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cjvkO7gqWKYSOo+ULD2CBFFhHwf7RM04gql+xSlXy7mTZD01R4RNvkFCtrUPZgQKEwleS4nvd3sCKIlfP5gof+Zmz31yc6fA9Yv17wwUawha2X6ttl1g0KWBVJ3N/eErTpKcvg7E1eHvp8XerX+zSyvusKcxEGbG0gMjvikt49k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLsOmgTA; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLsOmgTA"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so18487345e9.1
        for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 16:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790031780; x=1790636580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=38fEDIl4nyM2EG6gN77rRbJvzYvv8oP+axJ0oOB0XQI=;
        b=GLsOmgTArCvVtlz8B8X9jQQ+9CzENu3mDdQqBjrdflKxdpKsZM2u5lEr37fDjFPvOf
         An8nvEwAJV6uBFhX4Ze1H1bgEUK1A5SSc7N4qNY0Pr4kLyHOLrHKNvx84pcmw0iK+OBo
         HhUo1Qgdc0ro5wlKk2cENpTaCuACJF9i8nG9xWWTEc6F+f+UqKpW0QWSJ4pVuCqB1Gnn
         RtbKIEdiGviTtEgCoqLwkD3FdvDD9OJUnqxOSvFBlj9oCzdSbqZ34kFxX4ksLSwnUKsh
         Nh+byfay0Bs8nYrXR1e4ZY0NE7mDPBNNxXtsKhMeN2q8B9GIWwz7GA4oEUI9kIRFGE6T
         u3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790031780; x=1790636580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=38fEDIl4nyM2EG6gN77rRbJvzYvv8oP+axJ0oOB0XQI=;
        b=Ej9fH6QuYFT3GyBuDgyAoXHcvn0P137KOdNORiERXqOSPYC8XbbeO0auFSDTSYFuwQ
         sWG+sTDrHLGa2Zz2uhAoIjJI9mbrjgAlWF6iLoF0Xka9B63qdiQR6bg/zGhcgtJqMyOA
         jAA2NRXxZhBdBOaNdGeV8OMHXlamLdXx+FjDaUZRHzOk9DdZHaBQnafbvcXKxQRBt3qC
         q8tXqR3TEsJNPHN1wyMbqddzqbTCJVzqsrvAm0SdjQ7o1aSw3klPpv/OV0Kgl8RhUsCB
         PX20MoMHsPq1zsXXFPMjGEZ0973v0P4aQ/zFeuywUtop22K3dR147Lws5IrR3WCPVtgU
         i0AQ==
X-Gm-Message-State: AFuF++mRE8xWfaemXTbTsJqiJ5VrbHqV9t9H/gg5R6169x2RZzpCJ200
	mI2MM0AtJVdp1hgb3+uHd7gGApJ57s6CujXRV8g6bGOZCwJSo61aNl8p
X-Gm-Gg: AYBFou0TiKHZ3ghMPhnha1PSLzgHIJyW3L57+lx5eUUpXaqPHUC1LXw22hNI9SdCGoG
	FJ9sVn6/kWI7PqWAQ4ljKGAJM9lKM3TsmTypfYk8TcLebINJvqT2KfgZA/bvDzJgYUH+ffbke5h
	BbHwhtLxykUg712APvZg2rcxOmR2tHsMOuOYNDkwL81d6BJjiWPZmgHl5dSGY2qx9bCMbEBsuzA
	ep1HeLxl5fmCThAkKkiEjQrb0g3F+qRnlbd/SfqLoePKd0gD9WLnIqyW2H6I1YHq0bvdx6J+bLY
	CCLikeQu0bJ8DgEhlL0fjzRfVXF0ysrczKK4bL3MxatBUidmPZm+nIYui8gjgMWEdoSIYMHjjup
	CO2XXxUqTeJudEtpR/vvtaMj+sKGI6EY0eqK9Q+PPd7AW2eFCqEWn/io/WMkP7sEMaab6VsUtZF
	Wfyi4TVcsBVk4U2IxriDVkfycf6hp4+OxcbXyiyXvJ+bm3e1RH9ifFg0ATRsulLW4psgVoH0F9o
	cOwSwRIzazw
X-Received: by 2002:a05:600c:1986:b0:49e:7d25:f397 with SMTP id 5b1f17b1804b1-49fc56b60d7mr163760275e9.15.1790031779792;
        Mon, 21 Sep 2026 16:02:59 -0700 (PDT)
Received: from nixos.lan ([2001:818:eb2c:ea00:a196:3a20:d9e2:3f91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaab0497sm3844715e9.3.2026.09.21.16.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 16:02:59 -0700 (PDT)
From: Luis Banha <luisbanha26@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luis Banha <luisbanha26@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Pavilion 15-ec1xxx
Date: Tue, 22 Sep 2026 00:01:05 +0100
Message-ID: <20260921230105.16844-1-luisbanha26@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mute LED on the HP Pavilion Gaming Laptop 15-ec1xxx (103c:87b2)
does not work automatically. Add the ALC285_FIXUP_HP_MUTE_LED quirk
to fix this behavior.

Signed-off-by: Luis Banha <luisbanha26@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index c31fed171..097a41a1e 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7187,6 +7187,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8786, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8787, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8788, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
+	SND_PCI_QUIRK(0x103c, 0x87b2, "HP Pavilion Gaming Laptop 15-ec1xxx", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x87b7, "HP Laptop 14-fq0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87cb, "HP Pavilion 15-eg0xxx", ALC287_FIXUP_HP_GPIO_LED),
-- 
2.55.0

