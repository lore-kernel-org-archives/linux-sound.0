Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C762F361DA7;
	Wed,  4 Mar 2026 07:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772607779; cv=none; b=uKnnGr2rQkV4/EawCaGBDrm3g2HHEcJ8Fh37BE2lMNMxv2f3dXpQzgbCRUHDpTb6v5wsnvYPbUUETJHq5cEw7B4P3KgTrAhlomGL+l0FLd5UdJpkuJk+5vpgY5iJNR6u0uvk6tOJ/VIGE0V+43Cj8NsSKIvV29+BzhwIyEgatoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772607779; c=relaxed/simple;
	bh=GvMglOdzKsSrDLBgpBYjS4qBmRSNMFwnjAcMLeAEctQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Rodt4txLsU8TzgntsnHc8JYCqldjlAep5loRCZ+RYUkaV6NkcvvQmiPs5FN2iQU53EJZ7lNhADyGREl5b3QOTXblmyGKoHKgmeMSNd91FKULNEbGnzG4JQwEK54kdoHl+eFp3KTChSj0tLLG+NZIA8tmxUxRj/t1zcz3FeWAYHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=e8DB1zZG; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="e8DB1zZG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=7I
	kZQjW3QOpf5sjWCcv/xI3Yp2hOfKTaEWHsswUiQts=; b=e8DB1zZGLBXNvNf0l9
	fkGm+m9TMUq621WIgao+WzsJIT2otg9Z09b+Kf59hjJt0h2ORANili3SL3Hc8kiS
	NZR/v153wJKgvZ8DAi+rEgP7nlXDozFvD9jwYJxnCBxbRla/ehjSV32wA+fEe6X8
	fT7EJKdU9i2RT7d+NlgIg6vRk=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wC33Qj92KdpLXgFOA--.8236S2;
	Wed, 04 Mar 2026 15:02:22 +0800 (CST)
From: wangdich9700@163.com
To: bo.liu@senarytech.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] ALSA: hda/senary: Add hardware init verbs and fixup framework
Date: Wed,  4 Mar 2026 15:02:19 +0800
Message-Id: <20260304070219.450083-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wC33Qj92KdpLXgFOA--.8236S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWryfWw4kAFWUGw4kAr1DZFb_yoWrZw4kpF
	4rWFy5GFZrJF4Iyr4rGw1xC3WrWa4rWFW7t3y3tw1fGanIkrykJ3WFq343uF1fArZrK3Wa
	q3WIvFyUG3sFyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jOtxhUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCvx+5CWmn2P8SYwAA3I

From: wangdicheng <wangdicheng@kylinos.cn>

Port the essential hardware initialization logic from the vendor driver
and introduce the standard HDA fixup framework to handle different
machine configurations.

Key changes:

1. Add hardware init verbs:
   - Implement `senary_init_verb` to send the vendor-specific
     initialization sequence required by the SN6186 chip.
   - Override pin capabilities for Node 0x19 to ensure proper headset
     microphone support.

2. Introduce fixup framework:
   - Define a default pin configuration table (`senary_pincfg_default`)
     to provide a fallback for devices with invalid BIOS configurations.
   - Establish a quirk table structure for future machine-specific
     fixes.
   - Since the standard quirk matching relies on Subsystem IDs, we
     manually apply the default fixup if `snd_hda_pick_fixup` does not
     find a specific match.

This ensures the chip is correctly initialized during probe and resume,
and provides a scalable mechanism for supporting specific hardware
quirks.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/hda/codecs/senarytech.c | 63 +++++++++++++++++++++++++++++++++--
 1 file changed, 61 insertions(+), 2 deletions(-)

diff --git a/sound/hda/codecs/senarytech.c b/sound/hda/codecs/senarytech.c
index 6239a25bb8f3..f9a389df3a17 100644
--- a/sound/hda/codecs/senarytech.c
+++ b/sound/hda/codecs/senarytech.c
@@ -36,6 +36,32 @@ struct senary_spec {
 	unsigned int gpio_mic_led_mask;
 };
 
+enum {
+	SENARY_FIXUP_PINCFG_DEFAULT,
+};
+
+static const struct hda_pintbl senary_pincfg_default[] = {
+	{ 0x16, 0x02211020 }, /* Headphone */
+	{ 0x17, 0x40f001f0 }, /* Not used */
+	{ 0x18, 0x05a1904d }, /* Mic */
+	{ 0x19, 0x02a1104e }, /* Headset Mic */
+	{ 0x1a, 0x01819030 }, /* Line-in */
+	{ 0x1d, 0x01014010 }, /* Line-out */
+	{}
+};
+
+static const struct hda_fixup senary_fixups[] = {
+	[SENARY_FIXUP_PINCFG_DEFAULT] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = senary_pincfg_default,
+	},
+};
+
+/* Quirk table for specific machines can be added here */
+static const struct hda_quirk sn6186_fixups[] = {
+	{}
+};
+
 #ifdef CONFIG_SND_HDA_INPUT_BEEP
 /* additional beep mixers; private_value will be overwritten */
 static const struct snd_kcontrol_new senary_beep_mixer[] = {
@@ -93,6 +119,19 @@ static void senary_auto_parse_eapd(struct hda_codec *codec)
 	}
 }
 
+/* Hardware specific initialization verbs */
+static void senary_init_verb(struct hda_codec *codec)
+{
+	/* Vendor specific init sequence */
+	snd_hda_codec_write(codec, 0x1b, 0x0, 0x05a, 0xaa);
+	snd_hda_codec_write(codec, 0x1b, 0x0, 0x059, 0x48);
+	snd_hda_codec_write(codec, 0x1b, 0x0, 0x01b, 0x00);
+	snd_hda_codec_write(codec, 0x1b, 0x0, 0x01c, 0x00);
+
+	/* Override pin caps for headset mic */
+	snd_hda_override_pin_caps(codec, 0x19, 0x2124);
+}
+
 static void senary_auto_turn_eapd(struct hda_codec *codec, int num_pins,
 			      const hda_nid_t *pins, bool on)
 {
@@ -136,6 +175,7 @@ static int senary_init(struct hda_codec *codec)
 
 	snd_hda_gen_init(codec);
 	senary_init_gpio_led(codec);
+	senary_init_verb(codec);
 	if (!spec->dynamic_eapd)
 		senary_auto_turn_eapd(codec, spec->num_eapds, spec->eapds, true);
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_INIT);
@@ -181,11 +221,30 @@ static int senary_probe(struct hda_codec *codec, const struct hda_device_id *id)
 	senary_auto_parse_eapd(codec);
 	spec->gen.own_eapd_ctl = 1;
 
-	if (!spec->gen.vmaster_mute.hook)
-		spec->gen.vmaster_mute.hook = senary_auto_vmaster_hook;
+	/* Setup fixups based on codec vendor ID */
+	switch (codec->core.vendor_id) {
+	case 0x1fa86186:
+		codec->pin_amp_workaround = 1;
+		spec->gen.mixer_nid = 0x15;
+		snd_hda_pick_fixup(codec, NULL, sn6186_fixups, senary_fixups);
+
+		/* If no specific quirk found, apply the default pin configuration */
+		if (codec->fixup_id == HDA_FIXUP_ID_NOT_SET)
+			codec->fixup_id = SENARY_FIXUP_PINCFG_DEFAULT;
+		break;
+	default:
+		snd_hda_pick_fixup(codec, NULL, sn6186_fixups, senary_fixups);
+		break;
+	}
 
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
 
+	/* Run hardware init verbs once during probe */
+	senary_init_verb(codec);
+
+	if (!spec->gen.vmaster_mute.hook)
+		spec->gen.vmaster_mute.hook = senary_auto_vmaster_hook;
+
 	err = snd_hda_parse_pin_defcfg(codec, &spec->gen.autocfg, NULL,
 				       spec->parse_flags);
 	if (err < 0)
-- 
2.25.1

