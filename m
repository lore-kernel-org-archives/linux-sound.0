Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ABA13A868
	for <linux-sound@vger.kernel.org>; Thu, 28 Nov 2024 11:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732792930; cv=none; b=U1lufEMkW5UW1qzqMe0pbLNn5VpSSMtOZylfbaOJ2FNHiQCcqo71hJQfD7qJq82Yh8xH60E5PdUz+cF8neM/IK/8qeE8MsUpg+uEW4GuyLOJQk+bX53szKQGbq3d+1Fb1X1b0yzhJxTpV5z8LKEAlzZH/prCytW3w1802691DMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732792930; c=relaxed/simple;
	bh=VgFy2b77LrZjXObi9xVO+OEfcfgIfyXX4jAZRF9vbXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PC74fj4WaMwRyYRVAlVuVPYZQiE9Y+YZ7WLKGYKONYXf4MhHBQ0zFOn1jk2jvSaOryuYVhWgi+pvflZJ2Z4zYUwg3JIoVJC5mktY94FSXuMeG1Esj3+7DKmbIkOSAZk9wirGTwmYYKzUha6qBAhSl1C7R0Mpx7HVG0+lTlgKtRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=fGDgsnQZ; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="fGDgsnQZ"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5FAE23A3AC;
	Thu, 28 Nov 2024 12:22:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5FAE23A3AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1732792922; bh=KkAjyup3pKZ0i1zFDSmDqcEzhu5/46NfQhEbE2vFK6w=;
	h=From:To:Cc:Subject:Date:From;
	b=fGDgsnQZFvLPpv388WSYnj/2AXdrAn0hrFo0cbg7xVQ9lTQxn2rKQahPVQ4UTAGUp
	 798tlxA9EOImDKdS23gA0PnwUWB+G4mlCbEMmVRf/WOkkU8ioeN+Vfk8NGuaI3xQ0j
	 x5bfE0tzWhu0UMLE8r/40Btk6/NiQzjzHPiP9W+M=
Received: from p1gen4.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu, 28 Nov 2024 12:21:59 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: Linux Sound ML <linux-sound@vger.kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] ALSA: hda: improve bass speaker support for ASUS Zenbook UM5606WA
Date: Thu, 28 Nov 2024 12:21:45 +0100
Message-ID: <20241128112145.3409492-1-perex@perex.cz>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This hardware has ALC294 codec with speaker NID 0x17 and bass speaker
NID 0x15.

This patch removes DAC NID 0x06 (without volume control) from
the connection list for bass speaker NID 0x15. Both speaker PINs
are routed to DAC NID 0x03 with this change.

Link: https://github.com/alsa-project/alsa-ucm-conf/issues/467
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/pci/hda/patch_realtek.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 56a3622ca2c1..c10a803b98db 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6502,6 +6502,16 @@ static void alc285_fixup_speaker2_to_dac1(struct hda_codec *codec,
 	}
 }
 
+/* disable DAC3 (0x06) selection on NID 0x15 - share Speaker/Bass Speaker DAC 0x03 */
+static void alc294_fixup_bass_speaker_15(struct hda_codec *codec,
+					 const struct hda_fixup *fix, int action)
+{
+	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
+		static const hda_nid_t conn[] = { 0x02, 0x03 };
+		snd_hda_override_conn_list(codec, 0x15, ARRAY_SIZE(conn), conn);
+	}
+}
+
 /* Hook to update amp GPIO4 for automute */
 static void alc280_hp_gpio4_automute_hook(struct hda_codec *codec,
 					  struct hda_jack_callback *jack)
@@ -7782,6 +7792,7 @@ enum {
 	ALC256_FIXUP_CHROME_BOOK,
 	ALC245_FIXUP_CLEVO_NOISY_MIC,
 	ALC269_FIXUP_VAIO_VJFH52_MIC_NO_PRESENCE,
+	ALC294_FIXUP_BASS_SPEAKER_15,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -10074,6 +10085,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_LIMIT_INT_MIC_BOOST
 	},
+	[ALC294_FIXUP_BASS_SPEAKER_15] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc294_fixup_bass_speaker_15,
+	},
 };
 
 static const struct hda_quirk alc269_fixup_tbl[] = {
@@ -10582,6 +10597,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1d42, "ASUS Zephyrus G14 2022", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1d4e, "ASUS TM420", ALC256_FIXUP_ASUS_HPE),
 	SND_PCI_QUIRK(0x1043, 0x1da2, "ASUS UP6502ZA/ZD", ALC245_FIXUP_CS35L41_SPI_2),
+	SND_PCI_QUIRK(0x1043, 0x1df3, "ASUS UM5606WA", ALC294_FIXUP_BASS_SPEAKER_15),
 	SND_PCI_QUIRK(0x1043, 0x1e02, "ASUS UX3402ZA", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1e11, "ASUS Zephyrus G15", ALC289_FIXUP_ASUS_GA502),
 	SND_PCI_QUIRK(0x1043, 0x1e12, "ASUS UM3402", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.47.0

