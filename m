Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E57A3909A4
	for <linux-sound@vger.kernel.org>; Sun, 16 Aug 2026 09:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786873358; cv=none; b=Ns/8MUdk30Uokb/oe3/mGB8VFUIcFjmT2DqxHrcoJJQ49f7McfYBG/pV0KrbtBuVD3bm5wvTChu1K+i835r3pLsO05umZtfgRmwaho7MCAPbVP5vSYxRNr9zQG3jGm+cnAjUGK2w/ECUgN7K7jtJJFOcB7tEpdc9F+pOpEEK7IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786873358; c=relaxed/simple;
	bh=HX+De9aeUShyKYyHUClMApJdR+d9gEk8SQ1M2bH69OM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tm9jrP13RoSxeTbWeWKHi9wxc7xHFdl5KXO4qiGcjmRjBAEefRAGsxrwGvIiyM8YcsSc/rB10sl1UtY2tbrtmDfOOOncSdZJzYTDHbRost5yXJ+vL5sHmgsv7P+zcnZlvnxZ8+oXxIJIbW0sO1Xc18BW3OilwEOLi9JaFL07Axg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=SyaIzjDa; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=SyaIzjDa; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="SyaIzjDa";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="SyaIzjDa"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hN9x55xyBzMl2k;
	Sun, 16 Aug 2026 11:42:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786873353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sCZ5cUxQOjD4YRmCfzmps3JLaRWg4Yf/FCdMuMkj6YQ=;
	b=SyaIzjDadCtjcM7rn40TiO5VrR+QB2GyhqkzZ5/rfCp5aU4mql9JCpbWxyH2HYCiU9gQYn
	0bvPlZcO1Sh/nZYAEdsbrnxkKz3wuaYzaWuPOSrVklAt68ZqshbQ4nxBE77oJrDmoWGURl
	E5Q0JzRLhU5L7eK9cE5RjwrbE856Zc13Xrgu2trAGQJ8RA9kDgrqKHmVyugRaYhX6v+XGf
	S+KHGwXedMDtMFKgPS4nSnXg9Hlkjdfgim/AxuF+HoXVljf4x7M/TOjjrtwF4xuqvApS0Z
	aXiUJW2juY1HyIJCdh+uBw2zZj/7eTfolOoTDTGm6C0fpLb8NXQnHAq6/x1y4A==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=SyaIzjDa;
	spf=pass (outgoing_mbo_mout: domain of ggualtierotti.dev@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=ggualtierotti.dev@mailbox.org
From: Giulio Gualtierotti <ggualtierotti.dev@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786873353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sCZ5cUxQOjD4YRmCfzmps3JLaRWg4Yf/FCdMuMkj6YQ=;
	b=SyaIzjDadCtjcM7rn40TiO5VrR+QB2GyhqkzZ5/rfCp5aU4mql9JCpbWxyH2HYCiU9gQYn
	0bvPlZcO1Sh/nZYAEdsbrnxkKz3wuaYzaWuPOSrVklAt68ZqshbQ4nxBE77oJrDmoWGURl
	E5Q0JzRLhU5L7eK9cE5RjwrbE856Zc13Xrgu2trAGQJ8RA9kDgrqKHmVyugRaYhX6v+XGf
	S+KHGwXedMDtMFKgPS4nSnXg9Hlkjdfgim/AxuF+HoXVljf4x7M/TOjjrtwF4xuqvApS0Z
	aXiUJW2juY1HyIJCdh+uBw2zZj/7eTfolOoTDTGm6C0fpLb8NXQnHAq6/x1y4A==
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	Giulio Gualtierotti <ggualtierotti.dev@mailbox.org>
Subject: [PATCH] ALSA: hda/realtek: Add micmute LED quirk for Acer Aspire A515-57
Date: Sun, 16 Aug 2026 11:42:23 +0200
Message-ID: <20260816094223.36617-1-ggualtierotti.dev@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: hbapn8dde64fau6xwa6ar8je3xu6t7dz
X-MBO-RS-ID: 91564f42324f88ef741
X-Rspamd-Queue-Id: 4hN9x55xyBzMl2k

The Acer Aspire A515-57 with subsystem ID 1025:1616 and Realtek
ALC256 uses GPIO2 (0x04) for the microphone mute LED. Without a
quirk, the GPIO mask and direction are not configured and the LED
does not follow the microphone mute state.

Reuse ALC256_FIXUP_ACER_SFG16_MICMUTE_LED, which configures GPIO2
as the microphone mute LED.

Tested on an Acer Aspire A515-57 with ALC256 (10ec:0256,
subsystem 1025:1616). GPIO mask and direction are 0x04 and GPIO
data switches between 0x00 and 0x04; the LED device is registered
and follows the microphone mute state.

Signed-off-by: Giulio Gualtierotti <ggualtierotti.dev@mailbox.org>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 3f0e276fc606..0ebbf91921c5 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7063,6 +7063,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x1597, "Acer Nitro 5 AN517-55", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x159e, "Acer Nitro 5 AN515-46", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x160e, "Acer PT316-51S", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1025, 0x1616, "Acer Aspire A515-57", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x161f, "Acer S40-54", ALC256_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x1640, "Acer Aspire A315-44P", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x166c, "Acer Predator PH16-71", ALC2XX_FIXUP_HEADSET_MIC),
-- 
2.43.0

