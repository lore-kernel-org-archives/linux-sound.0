Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B73021254B
	for <linux-sound@vger.kernel.org>; Sun, 14 Sep 2025 07:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757835846; cv=none; b=UMBt07dtL8zqm4h2eUCCv2ir8opeGPGaI7NqaLhBci+xIdMlMg65eoumXwChW8v9WdxYe4AQ6wH0vctekRsvkBSWwDlRvskwRpdZB99fbnGZEK8fOy2hzjFhpVX8/PAULEkDThKIIZh9o/RarT8Fro1n7KXLa0hcrv+3tVq7EXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757835846; c=relaxed/simple;
	bh=FVVGQzaae7qgHRAJ9qc0TQO/pudGlm5SrlFLjaIGF0A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=klel4HpQbD47yCQqwuiL4ce6Qeaov8sgW+90Rzet9IbrWmrQSKARdeCDJsCWFWQ4js4A44dgomxKWFsL22EEkPCGpvzDsFI6ALjKadM6ZRMwASWLRKO4yl55iBCfMdMp29rOnjr1oHQXPMdqibMJcNJGsw8mkQK/UCa4f3FEH+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w9oDJDcq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WHksTzJk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w9oDJDcq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WHksTzJk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w9oDJDcq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WHksTzJk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w9oDJDcq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WHksTzJk"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A35ED1F7FD;
	Sun, 14 Sep 2025 07:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757835836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0oh/RC4ex+BTrS9jt2+EkxsHSLMj2VrdGNfctoo3Thk=;
	b=w9oDJDcqb73RtiNAddfMo1gow5/GphF535dWNmPieTIlc/07BbkqCFqA7wQ+lx4VNxIsQj
	gLQ2YX90M/SWfsPAsB+FeKfaHjHAQAAplr+8FNMpB5dgRkVlMt4AsX+Md4W12uLX4YtyMH
	1R5khLd9tpTKeX1Rf4em/ttEIg2q9/U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757835836;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0oh/RC4ex+BTrS9jt2+EkxsHSLMj2VrdGNfctoo3Thk=;
	b=WHksTzJkMFs+ASJq6Mg8Y824ounJORibHHeOwt4FPbbK1H6ggKEsQ0RDbhm9zw1BznYRXx
	HbjuDzyH/pl8HgCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=w9oDJDcq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WHksTzJk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757835836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0oh/RC4ex+BTrS9jt2+EkxsHSLMj2VrdGNfctoo3Thk=;
	b=w9oDJDcqb73RtiNAddfMo1gow5/GphF535dWNmPieTIlc/07BbkqCFqA7wQ+lx4VNxIsQj
	gLQ2YX90M/SWfsPAsB+FeKfaHjHAQAAplr+8FNMpB5dgRkVlMt4AsX+Md4W12uLX4YtyMH
	1R5khLd9tpTKeX1Rf4em/ttEIg2q9/U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757835836;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0oh/RC4ex+BTrS9jt2+EkxsHSLMj2VrdGNfctoo3Thk=;
	b=WHksTzJkMFs+ASJq6Mg8Y824ounJORibHHeOwt4FPbbK1H6ggKEsQ0RDbhm9zw1BznYRXx
	HbjuDzyH/pl8HgCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8603A13419;
	Sun, 14 Sep 2025 07:43:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bdQvHjxyxmgRfQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 14 Sep 2025 07:43:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add ALC295 Dell TAS2781 I2C fixup
Date: Sun, 14 Sep 2025 09:43:33 +0200
Message-ID: <20250914074345.10583-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: A35ED1F7FD
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

From: Donald Menig <djmenig@outlook.com>

This patch adds a new fixup for the ALC295 codec on some Dell
laptops that use the TAS2781 I2C amplifier.

The fixup correctly initializes the amplifier and pins, allowing
sound to work on all speakers of these devices.

The fixup chain is added to the relevant quirk entries for
Dell Polaris models.

[ adjusted for 6.17 kernel code by tiwai ]

Fixes: 1e9c708dc3ae ("ALSA: hda/tas2781: Add new quirk for Lenovo, ASUS, Dell projects")
Link: https://bugzilla.suse.com/show_bug.cgi?id=1249575
Signed-off-by: Donald Menig <djmenig@outlook.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/realtek/alc269.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 85bb8c4d3b17..59cc01079fee 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3702,6 +3702,7 @@ enum {
 	ALC236_FIXUP_DELL_DUAL_CODECS,
 	ALC287_FIXUP_CS35L41_I2C_2_THINKPAD_ACPI,
 	ALC287_FIXUP_TAS2781_I2C,
+	ALC295_FIXUP_DELL_TAS2781_I2C,
 	ALC245_FIXUP_TAS2781_SPI_2,
 	ALC287_FIXUP_TXNW2781_I2C,
 	ALC287_FIXUP_YOGA7_14ARB7_I2C,
@@ -5167,6 +5168,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc294_fixup_gx502_hp,
 	},
+	[ALC295_FIXUP_DELL_TAS2781_I2C] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = tas2781_fixup_tias_i2c,
+		.chained = true,
+		.chain_id = ALC289_FIXUP_DUAL_SPK
+	},
 	[ALC294_FIXUP_ASUS_GU502_PINS] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -6289,8 +6296,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0c1e, "Dell Precision 3540", ALC236_FIXUP_DELL_DUAL_CODECS),
 	SND_PCI_QUIRK(0x1028, 0x0c28, "Dell Inspiron 16 Plus 7630", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
 	SND_PCI_QUIRK(0x1028, 0x0c4d, "Dell", ALC287_FIXUP_CS35L41_I2C_4),
-	SND_PCI_QUIRK(0x1028, 0x0c94, "Dell Polaris 3 metal", ALC287_FIXUP_TAS2781_I2C),
-	SND_PCI_QUIRK(0x1028, 0x0c96, "Dell Polaris 2in1", ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x1028, 0x0c94, "Dell Polaris 3 metal", ALC295_FIXUP_DELL_TAS2781_I2C),
+	SND_PCI_QUIRK(0x1028, 0x0c96, "Dell Polaris 2in1", ALC295_FIXUP_DELL_TAS2781_I2C),
 	SND_PCI_QUIRK(0x1028, 0x0cbd, "Dell Oasis 13 CS MTL-U", ALC289_FIXUP_DELL_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1028, 0x0cbe, "Dell Oasis 13 2-IN-1 MTL-U", ALC289_FIXUP_DELL_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1028, 0x0cbf, "Dell Oasis 13 Low Weight MTU-L", ALC289_FIXUP_DELL_CS35L41_SPI_2),
-- 
2.50.1

