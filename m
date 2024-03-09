Received: from mail.athaariq.my.id (unknown [117.53.144.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7072C692
	for <linux-sound@vger.kernel.org>; Sat,  9 Mar 2024 10:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.53.144.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709981494; cv=none; b=EPZ+WzQUtyY1OfwIwl5WyjPn724hESGLlFTM9fG6oPrDeU8wfGFWSytHxdKsP2QsCCdIxfkoYjjfzsIhxDnzp97t+pmFq6eU2G1EYIDGXTNN3ctlMKtkkkWxaE0y8yEU5kiGo9+toj2j2FmdREgTtyZiRbUmdnj8Uz3S3MFwMdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709981494; c=relaxed/simple;
	bh=tcheApITBGeJS6H3brX1MyDnyTd1+5b01BuUAgHXivM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fTwkZRdc3mOjPM3uxCWyIMp6JycejS0FSGs+NOpd+YRhd8tvtHqmVMvs+LUcB/vaT2jkeVi/PBH6f8+Gj/zBpWK2C/wftwFvCRYr6y65qWOYudHnfBMuNQN2Zi3hm8HN9pfcso88TZ54y0LHMHII0ylSE5eSeHtSbvUyiV9kkS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=athaariq.my.id; spf=pass smtp.mailfrom=athaariq.my.id; dkim=pass (2048-bit key) header.d=athaariq.my.id header.i=@athaariq.my.id header.b=IjiO3SIC; arc=none smtp.client-ip=117.53.144.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=athaariq.my.id
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=athaariq.my.id
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=athaariq.my.id header.i=@athaariq.my.id header.b="IjiO3SIC"
Received: from localhost (localhost [127.0.0.1])
	by mail.athaariq.my.id (Postfix) with ESMTP id 322D23FBA4;
	Sat,  9 Mar 2024 10:51:23 +0000 (UTC)
Authentication-Results: mail.athaariq.my.id (amavisd-new);
	dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
	header.d=athaariq.my.id
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=athaariq.my.id;
	 h=content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received; s=dkim20240121; t=1709981482; x=1711191083; bh=tcheAp
	ITBGeJS6H3brX1MyDnyTd1+5b01BuUAgHXivM=; b=IjiO3SICZRW7xr1VPayp+y
	jx8hVsyxHoYy8+VpUckCXreUxRwlw2eWqG/2QjBI4HlMZP/bsDR6FDThN7x84DIw
	U7KMujgTQ4fyni7QQUlW/tbpLIQrzQcaP6rNcfzOXItZtkHD+jDYrJFm9fkAdzRK
	S5NWBmS6LrjQXC/SKVc7yCNNq1nqug7ff0cKGEaOWuxzZMrKZ4wVjDFLOxwRLAq9
	br5QUjoqng+I9or1ELrkNh7Hs/P8SDttT924S6SmkIV8RCYDsFh49ucsggYI4KMs
	Jujvgf9aYf4AEY94qWPy8LEiHORm8FFXD8cwOkoQHFCBOjECa/b77kI8HDM8JU+A
	==
Received: from localhost.localdomain (unknown [192.168.100.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail.athaariq.my.id (Postfix) with ESMTPSA id DEC7C3FB99;
	Sat,  9 Mar 2024 10:51:19 +0000 (UTC)
From: Athaariq Ardhiansyah <foss@athaariq.my.id>
To: linux-sound@vger.kernel.org
Cc: kailang@realtek.com.tw,
	pshou@realtek.com.tw,
	tiwai@suse.de,
	jwoithe@just42.net,
	Athaariq Ardhiansyah <foss@athaariq.my.id>
Subject: [PATCH v2] ALSA: hda/realtek: fix ALC285 issues on HP Envy x360 laptops
Date: Sat,  9 Mar 2024 17:46:25 +0700
Message-ID: <20240309105007.6826-1-foss@athaariq.my.id>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <877cidxhny.wl-tiwai@suse.de>
References: <877cidxhny.wl-tiwai@suse.de>
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

Changes in v2:
- Re-order SND_PCI_QUIRK based on its PCI SSID
- Fix missing whitespace

---
 sound/pci/hda/patch_realtek.c | 63 +++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.=
c
index e3096572881d..04f959fd9689 100644
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
+		WRITE_COEF(0x6e, 0x1005), { }
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
@@ -9821,6 +9882,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[=
] =3D {
 	SND_PCI_QUIRK(0x103c, 0x84e7, "HP Pavilion 15", ALC269_FIXUP_HP_MUTE_LE=
D_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x8519, "HP Spectre x360 15-df0xxx", ALC285_FIXUP=
_HP_SPECTRE_X360),
 	SND_PCI_QUIRK(0x103c, 0x8537, "HP ProBook 440 G6", ALC236_FIXUP_HP_MUTE=
_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x85de, "HP Envy x360 13-ar0xxx", ALC285_FIXUP_HP=
_ENVY_X360),
 	SND_PCI_QUIRK(0x103c, 0x860f, "HP ZBook 15 G6", ALC285_FIXUP_HP_GPIO_AM=
P_INIT),
 	SND_PCI_QUIRK(0x103c, 0x861f, "HP Elite Dragonfly G1", ALC285_FIXUP_HP_=
GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x869d, "HP", ALC236_FIXUP_HP_MUTE_LED),
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

