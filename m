Received: from mail.athaariq.my.id (unknown [117.53.144.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B620D4C9D
	for <linux-sound@vger.kernel.org>; Fri,  8 Mar 2024 01:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.53.144.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709859748; cv=none; b=l9uoCVZ4Wg9kXfMYLPXMRKAAHVCPrO2N4MnidEfTbQgI7RGmhvOfcGsgSD7B4iCm/sgi5WjTjicFXH3IqoNo/ndqw3UmaXbRXAt4aes6p/OTqYz58M+/jG/JrCH1J1JPUUSyiOg1RyW0IczQ5SAcqXkaaT3J+/BKEdT52v4bklw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709859748; c=relaxed/simple;
	bh=/gWYRn9UM9Co0DRrJHpojNz+BfMLnDRYgolQARxjl3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CAf+0VAk6LPjyKVymjZmYUxWdWyR1tzmz8IpEuhzEfX8zEvBDPETunvlGoTbqcTAZavFqHo2CR1FdL0dOiUqJFRJOwFy9Sq+Jq3nziaSR/TQSt8On07nLx2HxzGDGaMZu9/avNweJDuteucO+Z4adqci+4pNUngsOZ4go7e5GDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=athaariq.my.id; spf=pass smtp.mailfrom=athaariq.my.id; dkim=pass (2048-bit key) header.d=athaariq.my.id header.i=@athaariq.my.id header.b=JRX2Ok/E; arc=none smtp.client-ip=117.53.144.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=athaariq.my.id
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=athaariq.my.id
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=athaariq.my.id header.i=@athaariq.my.id header.b="JRX2Ok/E"
Received: from localhost (localhost [127.0.0.1])
	by mail.athaariq.my.id (Postfix) with ESMTP id 6A4A83E8B3;
	Fri,  8 Mar 2024 01:02:23 +0000 (UTC)
Authentication-Results: mail.athaariq.my.id (amavisd-new);
	dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
	header.d=athaariq.my.id
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=athaariq.my.id;
	 h=content-transfer-encoding:mime-version:x-mailer:message-id
	:date:date:subject:subject:from:from:received; s=dkim20240121;
	 t=1709859743; x=1711069344; bh=/gWYRn9UM9Co0DRrJHpojNz+BfMLnDRY
	golQARxjl3k=; b=JRX2Ok/ELfIknfvQpbGWs2Yk2Cl/F4iOvo9/O2Rev27k/qM/
	lEK/ZQXfXvb6V/6x+FEJVSsWompzE+a2V76bdOEWcqdZ+ZQRi04PSbAuhFNgQnzz
	okKhH488tKC81JI3wBgM888q1L+3o6sTAF/vE+Ma27TzsSwXMp6LP5VtyqxIeENi
	kRUcJgzZetrBL9aQWEi/9ZA3ZmsoBOQPwEPq7cr31PmOiXqTHIeASWwSJDE5LpTy
	PBYomT0/uyubA1frpfbBkObz3AYeQaLTuhNb+ymnAz9aDWR75as6UlVUGglkqwEP
	DrlKLJI1AO4FFXQK0+UNfHQQmwpR5EZG7b7zfQ==
Received: from localhost.localdomain (unknown [192.168.100.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail.athaariq.my.id (Postfix) with ESMTPSA id AAB1A3EFE4;
	Fri,  8 Mar 2024 01:02:20 +0000 (UTC)
From: Athaariq Ardhiansyah <foss@athaariq.my.id>
To: linux-sound@vger.kernel.org
Cc: kailang@realtek.com.tw,
	pshou@realtek.com.tw,
	tiwai@suse.de,
	jwoithe@just42.net,
	Athaariq Ardhiansyah <foss@athaariq.my.id>
Subject: [PATCH 1/1] ALSA: hda/realtek: fix ALC285 issues on HP Envy x360 laptops
Date: Fri,  8 Mar 2024 07:59:12 +0700
Message-ID: <20240308005912.456727-1-foss@athaariq.my.id>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Realtek codec on HP Envy laptop series are heavily modified by vendor.
Therefore, need intervention to make it work properly. The patch fixes:

- B&O soundbar speakers (betweed lid and keyboard) activation
- Enable LED on mute button
- Add missing process coefficient which affects the output amplifier
- Volume control synchronization between B&O soundbar and side speakers
- Unmute headset output on several HP Envy models
- Auto-enable headset mic when plugged

This patch was tested on HP Envy x360 13-AR0107AU with Realtek ALC285

The only unsolved problem is output amplifier of all built-in speakers
is too weak, which causes volume of built-in speakers cannot be loud
as vendor's proprietary driver due to missing _DSD parameter in the
firmware. The solution is currently on research. Expected to has another
patch in the future.

Potential fix to related issues, need test before close those issues:

- https://bugzilla.kernel.org/show_bug.cgi?id=3D189331
- https://bugzilla.kernel.org/show_bug.cgi?id=3D216632
- https://bugzilla.kernel.org/show_bug.cgi?id=3D216311
- https://bugzilla.kernel.org/show_bug.cgi?id=3D213507

Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>
---
 sound/pci/hda/patch_realtek.c | 63 +++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.=
c
index e3096572881d..a07c0650b5f1 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6695,6 +6695,60 @@ static void alc285_fixup_hp_spectre_x360(struct hd=
a_codec *codec,
 	}
 }
=20
+static void alc285_fixup_hp_envy_x360(struct hda_codec *codec,
+				      const struct hda_fixup *fix,
+				      int action)
+{
+	static const struct coef_fw coefs[] =3D {
+		WRITE_COEF(0x08, 0x6a0c), WRITE_COEF(0x0d, 0xa023),
+		WRITE_COEF(0x10, 0x0320), WRITE_COEF(0x1a, 0x8c03),
+		WRITE_COEF(0x25, 0x1800), WRITE_COEF(0x26, 0x003a),
+		WRITE_COEF(0x28, 0x1dfe), WRITE_COEF(0x29, 0xb014),
+		WRITE_COEF(0x2b, 0x1dfe), WRITE_COEF(0x37, 0xfe15),
+		WRITE_COEF(0x38, 0x7909), WRITE_COEF(0x45, 0xd489),
+		WRITE_COEF(0x46, 0x00f4), WRITE_COEF(0x4a, 0x21e0),
+		WRITE_COEF(0x66, 0x03f0), WRITE_COEF(0x67, 0x1000),
+		WRITE_COEF(0x6e, 0x1005),{ }
+	};
+
+	static const struct hda_pintbl pincfgs[] =3D {
+		{ 0x12, 0xb7a60130 },  /* Internal microphone*/
+		{ 0x14, 0x90170150 },  /* B&O soundbar speakers */
+		{ 0x17, 0x90170153 },  /* Side speakers */
+		{ 0x19, 0x03a11040 },  /* Headset microphone */
+		{ }
+	};
+
+	switch (action) {
+	case HDA_FIXUP_ACT_PRE_PROBE:
+		snd_hda_apply_pincfgs(codec, pincfgs);
+
+		/* Fixes volume control problem for side speakers */
+		alc295_fixup_disable_dac3(codec, fix, action);
+
+		/* Fixes no sound from headset speaker */
+		snd_hda_codec_amp_stereo(codec, 0x21, HDA_OUTPUT, 0, -1, 0);
+
+		/* Auto-enable headset mic when plugged */
+		snd_hda_jack_set_gating_jack(codec, 0x19, 0x21);
+
+		/* Headset mic volume enhancement */
+		snd_hda_codec_set_pin_target(codec, 0x19, PIN_VREF50);
+		break;
+	case HDA_FIXUP_ACT_INIT:
+		alc_process_coef_fw(codec, coefs);
+		break;
+	case HDA_FIXUP_ACT_BUILD:
+		rename_ctl(codec, "Bass Speaker Playback Volume",
+			   "B&O-Tuned Playback Volume");
+		rename_ctl(codec, "Front Playback Switch",
+			   "B&O Soundbar Playback Switch");
+		rename_ctl(codec, "Bass Speaker Playback Switch",
+			   "Side Speaker Playback Switch");
+		break;
+	}
+}
+
 /* for hda_fixup_thinkpad_acpi() */
 #include "thinkpad_helper.c"
=20
@@ -7290,6 +7344,7 @@ enum {
 	ALC280_FIXUP_HP_9480M,
 	ALC245_FIXUP_HP_X360_AMP,
 	ALC285_FIXUP_HP_SPECTRE_X360_EB1,
+	ALC285_FIXUP_HP_ENVY_X360,
 	ALC288_FIXUP_DELL_HEADSET_MODE,
 	ALC288_FIXUP_DELL1_MIC_NO_PRESENCE,
 	ALC288_FIXUP_DELL_XPS_13,
@@ -9244,6 +9299,12 @@ static const struct hda_fixup alc269_fixups[] =3D =
{
 		.type =3D HDA_FIXUP_FUNC,
 		.v.func =3D alc285_fixup_hp_spectre_x360_eb1
 	},
+	[ALC285_FIXUP_HP_ENVY_X360] =3D {
+		.type =3D HDA_FIXUP_FUNC,
+		.v.func =3D alc285_fixup_hp_envy_x360,
+		.chained =3D true,
+		.chain_id =3D ALC285_FIXUP_HP_GPIO_AMP_INIT,
+	},
 	[ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP] =3D {
 		.type =3D HDA_FIXUP_FUNC,
 		.v.func =3D alc285_fixup_ideapad_s740_coef,
@@ -9862,6 +9923,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[=
] =3D {
 	SND_PCI_QUIRK(0x103c, 0x880d, "HP EliteBook 830 G8 Notebook PC", ALC285=
_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8811, "HP Spectre x360 15-eb1xxx", ALC285_FIXUP=
_HP_SPECTRE_X360_EB1),
 	SND_PCI_QUIRK(0x103c, 0x8812, "HP Spectre x360 15-eb1xxx", ALC285_FIXUP=
_HP_SPECTRE_X360_EB1),
+	SND_PCI_QUIRK(0x103c, 0x85de, "HP Envy x360 13-ar0xxx", ALC285_FIXUP_HP=
_ENVY_X360),
 	SND_PCI_QUIRK(0x103c, 0x881d, "HP 250 G8 Notebook PC", ALC236_FIXUP_HP_=
MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8846, "HP EliteBook 850 G8 Notebook PC", ALC285=
_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8847, "HP EliteBook x360 830 G8 Notebook PC", A=
LC285_FIXUP_HP_GPIO_LED),
@@ -10509,6 +10571,7 @@ static const struct hda_model_fixup alc269_fixup_=
models[] =3D {
 	{.id =3D ALC295_FIXUP_HP_OMEN, .name =3D "alc295-hp-omen"},
 	{.id =3D ALC285_FIXUP_HP_SPECTRE_X360, .name =3D "alc285-hp-spectre-x36=
0"},
 	{.id =3D ALC285_FIXUP_HP_SPECTRE_X360_EB1, .name =3D "alc285-hp-spectre=
-x360-eb1"},
+	{.id =3D ALC285_FIXUP_HP_ENVY_X360, .name =3D "alc285-hp-envy-x360"},
 	{.id =3D ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP, .name =3D "alc287-ideapad-b=
ass-spk-amp"},
 	{.id =3D ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN, .name =3D "alc287-yoga=
9-bass-spk-pin"},
 	{.id =3D ALC623_FIXUP_LENOVO_THINKSTATION_P340, .name =3D "alc623-lenov=
o-thinkstation-p340"},
--=20
2.44.0

