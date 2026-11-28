Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.233.34.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795883823;
	b=H1ClbPFCwma9yIc2ffNtUYLOJ3XBugEXemD1WP9UMJkxR/YSM8uOFR0+Dmm7boQRA8jh
	 /aHjb7x/5EU7865JLOEKpUYf7PByNr7vqBLYkLqI/YKvDCu4J8rwF5HQm0GSqykVyrNlr
	 2e+ZH5SI2B59BYtywxmcVvS6tSUUzLgxCLSqihslEVpM53qHo4bdKqb/VFWOMRjUmrz+x
	 XUYdc22qbgylgkpTn+uyEdvDGZVowYm4MJzoNNCL8LF9KnglzADUdIocetTD17RO1j9Nx
	 DYIX7/yicbFXOUriVmPR6hhpCklD5mdHcOUfFAck2bpx4nTpQ0YrLyrwwO+J5o8NuYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795883823;
	h=DMARC-Filter:Received:Received:DKIM-Signature:X-CM-Envelope:
	 X-Soverin-Id:From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:X-Spampanel-Class;
	bh=n4THUCxRZthKMbnPa6luKf83PRZIke0GCNyq41nFDx0=;
	b=v9hviFi41TPEFuW9j3UyFwF+9PAjzFoYGX/OfAViTTC5xpWXeuTX2hxTkD0Vowy8zYqs
	 AHFK42B8/opXKw/ipa0H1RgAbQ7RuMNulLbInszJ0LI46K9b6NxXSlVzAzGPQnSITPmy9
	 lorXsDRJxI/R/B31N9fGLxapMDGvXy8qpQfWqyCNvSArx5nFRRbkme4A/MVI8HOAZW+Yh
	 mhfMa5UDaKWOk5qbjaKxDadUzAnQqAwoWUifDxUkqYz29c0G5N9aK5d022+JySuLSn1Wx
	 EFzN6Dn3VWf/4vhloINzvFN7YG/L+TyMAUX9LxBrxVmXb4VSGCAwj50T0OOQJjr3MHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=reeltoreel.nl;
	spf=pass smtp.mailfrom=reeltoreel.nl;
	dkim=pass header.d=reeltoreel.nl header.i=@reeltoreel.nl header.a=rsa-sha256 header.s=soverin1 header.b=paz3UCi8;
	arc=none smtp.remote-ip=185.233.34.146
Received: from outbound.soverin.net (outbound.soverin.net [185.233.34.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7ED606A31C;
	Sat, 28 Nov 2026 16:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B7ED606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=reeltoreel.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=reeltoreel.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=reeltoreel.nl header.i=@reeltoreel.nl header.a=rsa-sha256 header.s=soverin1 header.b=paz3UCi8
Received: from smtp.freedom.nl (c03cst-smtp-frd01.int.sover.in [10.103.10.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id 4jcGC94zWHz5c4;
	Sat, 28 Nov 2026 16:36:53 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.103.10.152]) by freedom.nl (Postfix) with ESMTPSA id 4jcGC93gcczZXp;
	Sat, 28 Nov 2026 16:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=reeltoreel.nl;
	s=soverin1; t=1795883813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=n4THUCxRZthKMbnPa6luKf83PRZIke0GCNyq41nFDx0=;
	b=paz3UCi86hE6a7ezvCJJZjhlZ0Rvi30He78/hQHf5bEuq02Bi/Y+lt/uEzKF1Y4txwmOUX
	7ij6w8Ft62TUqf53QeKmQK1L8V7IovYlu+OJl9vo7/Cm3P2hGsSYbUT8NMOS/KICJh4hf4
	Uocs/t9G2UaRkIzwokMiwO0f9LXRXNh9M9lLPBo5B/wsmIIEfGRpVH087fT290+5V76qex
	9OUo8v2BG6Pk+3HZdDgyWzTDOgy+cBLWoQ3+HVFOgHxBwCfC++VcfHd6A0EtRlfJvzARBi
	1V32BjA9woVTyru9ZtSY43J6Pjkt66sTmIyUpKEBmSC8hPwJMv8SqOaa/WeI2A==
X-CM-Envelope: MS4xfC4QFxdgkGr3jujdBWjeSJsrWoCo2BtTXjFdHRazYm1RcC/zSKuPhkApY+niJBdMUc8+QTt5Ov4eOW2JB+ovlHOSa69zPrrwk+GgmzURZK5D7fZUDbHM lVAVsFsysHSwUka+goko9HRn0GpuYRYS4zNA2uAfvjRh100TTU8p/cQJWJnuBTXE88BfNxvYTGZhusZhm3w2W8LUGMJzN8Zffuk6fBeH4xAsCabXMNShThc3 3+s7TAO1KGe5OcEph6pbN0/eG77y5F8CRcarZyZrXmo+mXfNGiYc+qBGho1HuTFRp7U3taJXl1Xu1K+/7hUzHQ==
X-Soverin-Id: 01a22304-4888-7334-9580-23edfa686b3f
From: Philip van der Matten <kernel@reeltoreel.nl>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Philip van der Matten <kernel@reeltoreel.nl>
Subject: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP OmniBook 5 16-ag1xxx
Date: Sat, 28 Nov 2026 17:36:41 +0100
Message-ID: <20261128163641.135876-1-kernel@reeltoreel.nl>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spampanel-Class: ham

The HP OmniBook 5 Laptop 16-ag1xxx (board 8DF4, ALC245, subsystem ID
103c:8df4) has no quirk entry, so the speaker mute LED (F5) and the
mic mute LED (F8) are not driven.

ALC245_FIXUP_HP_X360_MUTE_LEDS matches the hardware: the mute LED is
controlled by COEF 0x0b bits 3:2 and the mic mute LED by GPIO 0x04.

Tested on kernel 7.3.5 with "options snd-hda-intel model=,103c:8756",
which selects the same fixup: both LEDs work. This patch itself has
not been build-tested.

The register layout was found and this patch was prepared with the help
of an AI assistant (Claude); the LEDs were verified on the machine by
the submitter.

Signed-off-by: Philip van der Matten <kernel@reeltoreel.nl>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index a4b4333..bf4e755 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8198,6 +8198,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8def, "HP EliteBook 660 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8df0, "HP EliteBook 630 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8df1, "HP EliteBook 630 G12", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8df4, "HP OmniBook 5 Laptop 16-ag1xxx", ALC245_FIXUP_HP_X360_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x8df7, "HP Z66 G6", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8dfb, "HP EliteBook 6 G1a 14", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8dfc, "HP EliteBook 645 G12", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.56.1

