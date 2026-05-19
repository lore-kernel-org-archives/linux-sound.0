Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEDE24DCF9;
	Tue, 19 May 2026 14:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779199554; cv=none; b=hChAA2PP0LkmkgefkWMO5rogkJ8rrFBY5GWkDEInDOZdTHICU6UqvCXIyKdGki4b1+Lsh8/hWipVMWBhhwk2dIvQahNbXZoM5E0QwAnXXq4Igs+A5Up2TiJSqbO/maLtkdry75xysjXBOBh4NaS2iv9IMs5wn2bKHfoNMWkHVTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779199554; c=relaxed/simple;
	bh=wjAR1ko1MOpRRbLdw69ZObcL3O6POYqPdEv+j6MwzYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DKpJtfQqKkd0wTYzzSoakqn5kjBBftufwjNsQxqEJJE4HRZuRQZcxvHwWLEz//XCMxzs4gC67sbVMODjUCkQ38MP6FIPi8a+7H4DXGBX0APlPR6jpsr48WmXgTR2fVB7jMhft+7RsA8Q/5gDCO93YMcvLWZ66WF6i6LjCPUzZqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mariushoch.de; spf=pass smtp.mailfrom=mariushoch.de; dkim=pass (2048-bit key) header.d=mariushoch.de header.i=@mariushoch.de header.b=uWPvZ6Mf; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mariushoch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mariushoch.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mariushoch.de header.i=@mariushoch.de header.b="uWPvZ6Mf"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gKbzw3vzQz9vhd;
	Tue, 19 May 2026 16:05:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mariushoch.de;
	s=MBO0001; t=1779199548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zfjqby6DX+DJj8RiXAdZJgm+FHwn4E1D2Z+sxmcHBs4=;
	b=uWPvZ6Mfyj50UJq18qcUXLaXfOwyxasq55w5GPUwx4Ul77nsVwoNxyt67KJUv6XId1jifw
	DG4emqxEOjaa/lgQiOkUPldjOBV4AqBq5yR7NdW/B2HoG1+n4TJy4RRBJw9mFYAQGgf848
	95+sVCpaK/ruiWxj8yQ3bkkTbUpvYHhgYVdlTdLkxpoRNr8+En09EBiL2X9Y4aC+UTaS+7
	oP0Gfoj+Bb6Gb/jPIYhOeaXDHsFqijCBe4oOQzBIPUrROmIm98MqYi2N0j93XWArALngbQ
	jQOXabw6bGXJdZKrxa5D5+snBnl1Poaxfw4PGtLkeRX/G8phjcof9YBW9C3Xxg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of mail@mariushoch.de designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=mail@mariushoch.de
From: Marius Hoch <mail@mariushoch.de>
To: linux-kernel@vger.kernel.org
Cc: Marius Hoch <mail@mariushoch.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Heng <zhangheng@kylinos.cn>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add LED quirk for HP ProBook 430 G6
Date: Tue, 19 May 2026 16:01:29 +0200
Message-ID: <20260519140248.4211-2-mail@mariushoch.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4gKbzw3vzQz9vhd

Like the HP ProBook 440 G6, the HP ProBook 430 G6 needs
the ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF quirk for its
mute and microphone mute LEDs.
Tested on a HP ProBook 430 G6.

Signed-off-by: Marius Hoch <mail@mariushoch.de>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 2f5d13032fd7..a1384432bbe7 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6955,6 +6955,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x84da, "HP OMEN dc0019-ur", ALC295_FIXUP_HP_OMEN),
 	SND_PCI_QUIRK(0x103c, 0x84e7, "HP Pavilion 15", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x8519, "HP Spectre x360 15-df0xxx", ALC285_FIXUP_HP_SPECTRE_X360),
+	SND_PCI_QUIRK(0x103c, 0x8536, "HP ProBook 430 G6", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8537, "HP ProBook 440 G6", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8548, "HP EliteBook x360 830 G6", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x854a, "HP EliteBook 830 G6", ALC285_FIXUP_HP_GPIO_LED),
-- 
2.54.0

