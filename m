Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7822EBDDE
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 00:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783385796; cv=none; b=IVIO5f8FDHMdlFu22axR4Rw0RCSPvdTKAxxjxOFARfzTOI6v0JUR1fR3Tc7SBEeuurJmJnCdgOBjEViiRddCFKYm626Votq35hqyEKqW3F93GB7zry2oNzeRiRps/+G6D+pdQwXwlp5vYId895k2sILPwFss5fVO2n4BiGIqQcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783385796; c=relaxed/simple;
	bh=fZ2f+zHAqjKGhEjMi1P8P+jH6v0ozEWeHw4+sb+AhjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rfBqLDYYBTgSnp24KZUB2YhMIzWiNQ7V/Bvz19eGEl9BXjMbOV6nUioLZfO/OGV5WEFYQ0C2QCos+heEzfNT+Xt/RqyJ0ljYHXOMWKwhv64dCwSB6Ob/gy7pSYpRyQ3lNFyMf643+rtjSzkNuMetngpHSlJMbuPF1B2yRv/kYrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ly7NKR8C; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ly7NKR8C"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783385792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IN+QuJm9oNpEGfOQBL1utXwBroiPmPGHMh63fLinsio=;
	b=Ly7NKR8C14O8DS0Nv5/khB/A3guacvQGMYRj3gTsj2rvn/OVOAED5amxXedieaH7SrZ1mb
	Zvt2JinRcyAj6KJ1qi/YPPloUdKeoLxPNxdvbKdIhHSmcdZsiwjM9Anam3Cs5CcnKXzbW2
	EEsZf+2OM8ZvVvEC2uAKuE2Rwdg3xXg=
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: [PATCH 1/2] ALSA: hda/realtek: Fix headphone output on ASUS ROG Ally X
Date: Mon,  6 Jul 2026 17:56:14 -0700
Message-ID: <20260707005615.52889-1-matthew.schwartz@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The ASUS ROG Ally X (RC72LA, PCI SSID 0x1043:0x1eb3) with an ALC294
codec produces no sound from the headphone jack, and unplugging the
headphones can leave the speakers muted too.

The device uses ALC287_FIXUP_TAS2781_I2C, which chains into the
ThinkPad fixup chain. alc285_fixup_thinkpad_x1_gen7() makes the
headphone (pin 0x21) and speaker (pin 0x17) share DAC 0x03. That is
correct for a ThinkPad, but here the shared DAC is exposed as a
"Line Out" control that defaults to zero, so the headphones stay
silent when plugged in.

Add a dedicated fixup chain for the Ally X that sets up the TAS2781
amplifier and the headset jack without the ThinkPad DAC sharing, and
routes the speaker to DAC 0x02 so the headphone and speaker get
independent DACs.

Also, fixup the wrong product code (it's RC72LA, not RCLA72).

Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
 sound/hda/codecs/realtek/alc269.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index d9e2384fc0ba..cb385b6c1788 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4117,6 +4117,8 @@ enum {
 	ALC236_FIXUP_DELL_DUAL_CODECS,
 	ALC287_FIXUP_CS35L41_I2C_2_THINKPAD_ACPI,
 	ALC287_FIXUP_TAS2781_I2C,
+	ALC287_FIXUP_ASUS_ALLY_X,
+	ALC287_FIXUP_ASUS_ALLY_X_I2C,
 	ALC295_FIXUP_DELL_TAS2781_I2C,
 	ALC245_FIXUP_TAS2781_SPI_2,
 	ALC287_FIXUP_TXNW2781_I2C,
@@ -6476,6 +6478,18 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK,
 	},
+	[ALC287_FIXUP_ASUS_ALLY_X] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc285_fixup_speaker2_to_dac1,
+		.chained = true,
+		.chain_id = ALC287_FIXUP_ASUS_ALLY_X_I2C,
+	},
+	[ALC287_FIXUP_ASUS_ALLY_X_I2C] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = tas2781_fixup_tias_i2c,
+		.chained = true,
+		.chain_id = ALC225_FIXUP_HEADSET_JACK,
+	},
 	[ALC245_FIXUP_TAS2781_SPI_2] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = tas2781_fixup_spi,
@@ -7459,7 +7473,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1e83, "ASUS GA605W", ALC285_FIXUP_ASUS_GU605_SPI_SPEAKER2_TO_DAC1),
 	SND_PCI_QUIRK(0x1043, 0x1e8e, "ASUS Zephyrus G15", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1e93, "ASUS ExpertBook B9403CVAR", ALC294_FIXUP_ASUS_HPE),
-	SND_PCI_QUIRK(0x1043, 0x1eb3, "ASUS Ally RCLA72", ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x1043, 0x1eb3, "ASUS Ally RC72LA", ALC287_FIXUP_ASUS_ALLY_X),
 	SND_PCI_QUIRK(0x1043, 0x1ed3, "ASUS HN7306W", ALC287_FIXUP_CS35L41_I2C_2),
 	HDA_CODEC_QUIRK(0x1043, 0x1ee2, "ASUS UM6702RA/RC", ALC285_FIXUP_ASUS_I2C_SPEAKER2_TO_DAC1),
 	SND_PCI_QUIRK(0x1043, 0x1ee2, "ASUS UM6702RA/RC", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.55.0

