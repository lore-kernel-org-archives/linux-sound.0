Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B960936657B
	for <linux-sound@vger.kernel.org>; Sun, 13 Sep 2026 21:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789333973; cv=none; b=JuTsS8VOpjQDbBV8uTKzKJ2YcgYaO7FPaHvHGRtJXtKsL+7a0KHqL9GODFmliO8+0rX8NLqZWJjXMHBtGUXnaQF2JkSIU+zu+4J5CGh5KQado4sgBl9ATkUJUGYC9/FWrrm5tIQvl5L7ZzneCNvVx7P+EbzXD2XHvhq+VIgEV1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789333973; c=relaxed/simple;
	bh=N14cczHO95fxHQxfMYYOu5mhkirSNBHnDBwAdyPdHrw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KmDrGD+5E7+bmqRTIpGjCK6iF+3Id3Cw6GZsEu+nrkFBPl0NFxVmzK3FrfZ//fmt0/EUl8rVW9XdMANqpVy6LKU9+1HQJDjdT5pm0oebMJE8xtjiR1P1SoiYfeHngcy3bzXlGz+BIQLonlY1vZmd1TnrQ2Sbrgwym44daB8sY/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n6NussvO; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n6NussvO"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6aac7fb4so582125e9.0
        for <linux-sound@vger.kernel.org>; Sun, 13 Sep 2026 14:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789333970; x=1789938770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JS+qPf0mbq4XivtIkwGZKmERtu/KAziqoiTI0kiBBk4=;
        b=n6NussvOCUjQNIsbgeRF2b2O4NQGX0abxewLfdNTlh2zvbF8elHjaa1rZ1Z7SExgCG
         jympzZl7IUp21f1SmB/PN9Ev4Ih5oEsb/wHc6KlQgtL32E3z9qsMugx7t91yso5fKmrr
         BrR+L36UCpActgNUGKQHx4FWGmeislOmioxGX002CNDAFB54k4SeMAJr9DkNImRs1oHr
         w+OedauCk4hR7kL8QfnyvLzXkQeh3CRBJQfmXHVwpYyQ+t9ONu0BUycSqWzzSpT/bIP2
         /YE4U5xJ900BO8jPFtJ3+e0owwsAdQ6u89g6iT92tDYCaITzr95Hto+JP45sTnXO/6y/
         AnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789333970; x=1789938770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JS+qPf0mbq4XivtIkwGZKmERtu/KAziqoiTI0kiBBk4=;
        b=GS7xnNprbgd7UWqnqhBGxrTZv4eiNKCaq1+FhslWyEmhk8wZKuwhkJcpcpJeg+MJku
         5wuBJixwsqyZfRDUltnPGhD9Mmsyq3WaMbEiylK0lMM4qGHK/CkutAmwCiF+wCc6Ng2V
         GquxHToFvRYxDcgQksrnk2jHCRnLEIaEbb8V3daL9oUkzZOnI2C962PQpt7Q0ZuPyICm
         JJBCYLAsDjDoHfFhWjrSMzcdI3bje+6lK368R5nKWYukztWZuGl7Iu+Ok+SWn3PsV9mu
         2SdhAAhR3KWmqrCQkG8yMfva5gYj+QrrANrq9OSvEjzlwjubxd2eNRKtQqt6PE1CLNXk
         CGxw==
X-Gm-Message-State: AFuF++nS/lPgKNNvNPqwzcCFot7IJpovO+dJSeG+G37WA/XHyVLfUT/N
	uzhmJKZU0PHOLPpN+IX5QciuJHWuFf/D9b7mg/u+ZOd1SbIMYM6WDdyr8EEw4TLN
X-Gm-Gg: AYBFou1GlWHAaYGfyeJhwbqqLk+z9TER5glWrBEQ1byHGwM4iF0e2fWM9x3zbSmpU3A
	fPJKP0z7gA612EeoGr4Izuuh0dyuKo84aTWW0MH+kOVSB/HyosS5YpTZpYh58Vf4SNftHYDUg6F
	1O/GA2+pyU/LI9yLSTLSI7Abv9lon7Ei/IjOReA8DcTfMJs1VoyCY4S9Fs0IWVUep6M44/LMQVz
	lVy/1HRPm75+vOT65ZpeICE2iOzskCMhRz6DqU4rZqLBgb17mnRCOIiTCWHSkVzAE/TwuQCvr+n
	WavPwCGnNKbpX9aFKMTbboDn0EGHRykEVmrUkjC0xLEdcYTSuc6sn6YNoYe9hw+wrIKIxpCiYD6
	zKMhwhexiCCi7ZLHx8m1En9Bu38cJ8J7Q52bOw8nE/t2DUQyDBBapqh57z7y76Iag5O6CG0GkLS
	oBLXDKASFzKZVHrtZ8/gSyqNkr3YhouAkDa5KkDzaZjigMEcIRNFozKLGYSalTt/hj7TNssuRX1
	Erc7egEVZhRwcjOfYUkERP9ofrqDfLL6jGaYAJ29g==
X-Received: by 2002:a05:600c:8b6d:b0:49e:716b:d2e0 with SMTP id 5b1f17b1804b1-49e716bd4f0mr66344595e9.2.1789333969801;
        Sun, 13 Sep 2026 14:12:49 -0700 (PDT)
Received: from pop-os.. (82-66-165-200.subs.proxad.net. [82.66.165.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7548d99bsm91457275e9.1.2026.09.13.14.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:12:49 -0700 (PDT)
From: Xavier Goffin <xaviergoffin42@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	Xavier Goffin <xaviergoffin42@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP OMEN 15-ax
Date: Sun, 13 Sep 2026 23:11:55 +0200
Message-ID: <20260913211155.20305-1-xaviergoffin42@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the HP OMEN 15 ax-202nf, the keyboard mute LED is exposed through
NID 0x1b rather than 0x18. This reuses the existing quirk
(ALC269_FIXUP_HP_MUTE_LED_MIC3) to allow the keyboard LED to reflect
the built-in speaker mute state.

Tested on HP OMEN 15 ax-202nf with Realtek ALC295:
- hda::mute/brightness properly follows mute state
- mute/unmute via keyboard shortcut or via GUI volume control
- state is kept on suspend & resume, and reboot
- plugging a 3.5mm jack headset reflects the headset mute status
- unplugging reverts the LED to the speaker mute status
- USB/Bluetooth headsets are not covered

Signed-off-by: Xavier Goffin <xaviergoffin42@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 95b40a177d2b..f8f2cc141cda 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7358,6 +7358,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8158, "HP", ALC256_FIXUP_HP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x103c, 0x820d, "HP Pavilion 15", ALC295_FIXUP_HP_X360),
 	SND_PCI_QUIRK(0x103c, 0x8256, "HP", ALC221_FIXUP_HP_FRONT_MIC),
+	SND_PCI_QUIRK(0x103c, 0x8259, "HP OMEN 15-ax202nf", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x827e, "HP x360", ALC295_FIXUP_HP_X360),
 	SND_PCI_QUIRK(0x103c, 0x827f, "HP x360", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x82bf, "HP G3 mini", ALC221_FIXUP_HP_MIC_NO_PRESENCE),
-- 
2.43.0

