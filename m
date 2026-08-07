Received: from a4i613.smtp2go.com (a4i613.smtp2go.com [158.120.82.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240EC446C1D
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 06:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.82.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786082842; cv=none; b=bK0GqUudLBVxO42IdtPi1fHXnX4KVNcMziVgm1NTWXSA7crjHOyuqF8h70AM+74wsxSJzR7nk5Nr0yeucowZq+9jNlUdOKHU9dEMx4ZxvffnnXNtvBFV1Dbiw0Wp+rhqr9HNnF4Sf+5SYAhaFJ0R+uLxtpHxrUEyy1/QbcEKKtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786082842; c=relaxed/simple;
	bh=3mw1Jilr0de2pkZKO8imAaYw59OaPjgknYM6tGy5OWg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tYQjKibYDEVUGz2zifswUWPh6jGZjtvVIKI5Klzm2fx4qBwoi81GdN/pz8Vi4/cuKiPBFFq+9/QZAHYxwdb3G1S1TsZvMGwuNA9fHsgxxERmk6+qloM5hJsvzUJ51SPiNBiMcBjlMXOB4tXSJkPYYEYp9wQZL7x71WEr91lszI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shangen.org; spf=pass smtp.mailfrom=em879706.shangen.org; dkim=pass (2048-bit key) header.d=shangen.org header.i=@shangen.org header.b=Nuq0fW0w; arc=none smtp.client-ip=158.120.82.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shangen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em879706.shangen.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shangen.org header.i=@shangen.org header.b="Nuq0fW0w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shangen.org;
 i=@shangen.org; q=dns/txt; s=s879706; t=1786081933; h=from : subject :
 to : message-id : date;
 bh=GVml6N44cFZ7fVppSKaVQs4Vb+brchckfKNwnMvsFxw=;
 b=Nuq0fW0wkMZe9Ar667eU+DuMt0VKdaoOwDgZrJxXOV2v2S/MSz80obfEDgCNx1jciatjz
 DmeYiV6zhwYrHRMSXFmY90qeURelwjqzOPt+GdO1zp9g3hQiGlV9Wop2yj3y8pVkWcu/LNO
 uyYinrjO8BLImmIvFeeThwxYcZfJmP9kl8t8Sm9rVp5YjpWcNarnmcb2PKWqtGnlepo44AI
 qdShdRqDHMV4GSyxrewy8y+HpbmJCH94aPsYbJljMhm9MdK6rJPP9HQrtujqIJeZYOGO0xX
 b4Zr3rGIVUFT/XuAobmGPLlpjwp/7NGAEEPd6qMKAPEtKLJfGDG9BOjsL15A==
Received: from [10.195.244.224] (helo=12458laptop)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.99.4)
	(envelope-from <sim@shangen.org>)
	id 1wsDV4-FnQW0hPxYWz-38Ib;
	Fri, 07 Aug 2026 05:52:10 +0000
From: Shang En Sim <sim@shangen.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	Shang En Sim <sim@shangen.org>
Subject: [PATCH] ALSA: hda/realtek: Enable mute LEDs on HP Spectre x360 16-aa0xxx
Date: Thu,  6 Aug 2026 22:51:27 -0700
Message-ID: <20260807055139.58707-1-sim@shangen.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 879706m:879706aL5FzMA:879706scChRos7KC
X-smtpcorp-track: bw6WsIbxHZoh.qRe9-Grw_1fP.tPSzOgP9qyK

The HP Spectre x360 2-in-1 Laptop 16-aa0xxx with PCI subsystem ID
0x103c:0x8c17 only gets the CS35L41 amplifier setup from
ALC287_FIXUP_CS35L41_I2C_2, so the speaker-mute and mic-mute keyboard
LEDs do not work.

Use ALC245_FIXUP_HP_SPECTRE_X360_16_AA0XXX like subsystem ID 0x8c16 so
the mute LEDs work.

Tested on HP Spectre x360 2-in-1 Laptop 16-aa0xxx.

Signed-off-by: Shang En Sim <sim@shangen.org>
---
 sound/hda/codecs/realtek/alc269.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 48a2e7f2e..250d92d07 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7350,7 +7350,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8bf0, "HP", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8c15, "HP Spectre x360 2-in-1 Laptop 14-eu0xxx", ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),
 	SND_PCI_QUIRK(0x103c, 0x8c16, "HP Spectre x360 2-in-1 Laptop 16-aa0xxx", ALC245_FIXUP_HP_SPECTRE_X360_16_AA0XXX),
-	SND_PCI_QUIRK(0x103c, 0x8c17, "HP Spectre 16", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8c17, "HP Spectre x360 2-in-1 Laptop 16-aa0xxx", ALC245_FIXUP_HP_SPECTRE_X360_16_AA0XXX),
 	SND_PCI_QUIRK(0x103c, 0x8c21, "HP Pavilion Plus Laptop 14-ey0XXX", ALC245_FIXUP_HP_X360_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x8c2d, "HP Victus 15-fa1xxx (MB 8C2D)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c30, "HP Victus 15-fb1xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
-- 
2.55.0

