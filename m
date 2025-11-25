Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org [91.198.250.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B438625
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 00:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764115278; cv=none; b=tAwGVredIIFVBycL4Z1Eo7kGPt3L+dcGlY9ijLjVd9kw53q5Stq7+W94KmKj1TLLZm2z9dpybkCSmfSROPhZJY9+ITLNbxrA4Wyph9ct7ffXpt4fNN3A6SJHZIicg7LhD9x1ioT6e9jdqOSeYJ01fN63tKjXoyXRTaBfGSKZ+D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764115278; c=relaxed/simple;
	bh=ewMZGBHf3/lwpabynep3WHoLfEZxXKI5/SV0DfKhEZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=apaNKffLOFz5jKGg9OFDTxvWYGK95OjVKiJM/hdKwG6LXDC42KKyjxEcAXshkyeMWhRBLeHjHaNVip6d4NY23ieLBPIS9Z5oo0RZHjgQCHMFkoMKGF3jts+6JvovW9nGKt5iw6yqR5UQX7TNA5bxApQr0kk3UEmsdDK7XzNTpKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gsnoff.com; spf=pass smtp.mailfrom=gsnoff.com; dkim=pass (2048-bit key) header.d=gsnoff.com header.i=@gsnoff.com header.b=I7lXjFwj; arc=none smtp.client-ip=91.198.250.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gsnoff.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gsnoff.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gsnoff.com header.i=@gsnoff.com header.b="I7lXjFwj"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4dGKLj2jFLzB0ym;
	Wed, 26 Nov 2025 00:55:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gsnoff.com; s=MBO0001;
	t=1764114909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9eE+XzebeA94mQkvn+Cn4NYMVrYa4ARQzuNEZxr+a8c=;
	b=I7lXjFwjOe/5Jvcv+FBZUusUWAR7OSsGPAyEAiQfJxgF79Rnzi0dMewV5yS67fKLguea3p
	MUS0LO/X3Z+hSrXTBuP+Lh79qDwhOwixZHuRIwUontCYOgjTUrm47lAiuLq2QvtHSH+g++
	jAZ5JPr9QtyKkOMTDpNb/8kVttlj7swju/0HAA+a3MmU0KmKq945zZ71pjOOuolHy3zp/H
	CC8QCs0iSzvONndDavwqSP9AfdH+dG/i4MlqfZ4X+xKK79au3wkXbUIt92YQTmnbdBFO2Y
	yEl38oxYWBh9cD2/34aBmaa/s8j+VBsxoiqLwPSVY6LsBajUbf1o7zqLujgDRA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of public@gsnoff.com designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=public@gsnoff.com
From: Ilyas Gasanov <public@gsnoff.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Ilyas Gasanov <torso.nafi@gmail.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH v2] ALSA: hda/realtek: Add quirk for HP ProBook 450 G8
Date: Wed, 26 Nov 2025 03:54:41 +0400
Message-ID: <20251125235441.53629-1-public@gsnoff.com>
In-Reply-To: <CAEo2pzvpEXYZzpLXesDp=wvQJ7VN8yaVZZDkCMvFzKySaezf_A@mail.gmail.com>
References: <CAEo2pzvpEXYZzpLXesDp=wvQJ7VN8yaVZZDkCMvFzKySaezf_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4dGKLj2jFLzB0ym

My laptop, HP ProBook 450 G8 (32M40EA), has Realtek ALC236 codec on its
integrated sound card, and uses GPIO pins 0x2 and 0x1 for speaker mute
and mic mute LEDs correspondingly, as found out by me through hda-verb
invocations. This matches the GPIO masks used by the
alc236_fixup_hp_gpio_led() function.

PCI subsystem vendor and device IDs happen to be 0x103c and 0x8a75,
which has not been covered in the ALC2xx driver code yet.

Signed-off-by: Ilyas Gasanov <public@gsnoff.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 70299e359ba0..97430c993ada 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6590,6 +6590,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8a4f, "HP Victus 15-fa0xxx (MB 8A4F)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a6e, "HP EDNA 360", ALC287_FIXUP_CS35L41_I2C_4),
 	SND_PCI_QUIRK(0x103c, 0x8a74, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8a75, "HP ProBook 450 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a78, "HP Dev One", ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x103c, 0x8aa0, "HP ProBook 440 G9 (MB 8A9E)", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8aa3, "HP ProBook 450 G9 (MB 8AA1)", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.51.0

