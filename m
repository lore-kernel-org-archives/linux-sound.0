Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E453307492
	for <linux-sound@vger.kernel.org>; Tue, 17 Feb 2026 22:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771366468; cv=pass; b=YDIf6//35KD00FeeiLRJwkMWRtxf6ZuxQsm6aK/2yHlnDsiozGrS3CR8qY/FvlQ1HVtLteDVHONtgsIJcePB1Ji5YWQR3NwA6/f8CzE8R/sZocHF4vxzKgCvhc5w24TuW52E67KxcTF80Icm6BBN4r4r0vejGvAmduBlc6OwFwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771366468; c=relaxed/simple;
	bh=S+VUFCu6rlLqwWm0NnnC2mnkLSyVV8nguqsug+kWh3U=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=SV3pz8E23Hxdr/Kj+on4mCnVerfJyod4MxYKCdU0jYsS+ZUQpHJDSG3rq1c7gGYvFgb++OItOUIthyQOYLubcglZQ/IA0vDkK2qVvVo+lEOYvpfiTBG576ZbPDMuyUigfqdVA5AmW9kciaOqXiMCWWcACN13X30rtwzirt3pS3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b=NkYMZ9gb; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b="NkYMZ9gb"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-649df393c04so4207007d50.1
        for <linux-sound@vger.kernel.org>; Tue, 17 Feb 2026 14:14:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771366465; cv=none;
        d=google.com; s=arc-20240605;
        b=JTDJa6YHBsCrh2nMIscUOxJZkVGC9nXZ9foRs6A7nRr7FOsSsfeO1m54jcCWiw7MUl
         nsaO4VOUF8IhN3dntnC7ohe9FPfX5r/leO/Tr+4Q08ah+Sw+GaXjugSKyUYbSXwviuqz
         PdZt9BMBiQ2lD8gsihSzXDCCKgQqS/jg9+tS10+z+90lJmNa5KzEmFeQXknMmcupkTIZ
         MMxmjs+5jv2svbd73+z5Zb9XCK5+s6u8IhfnjDeNQSKEWdkrMhrDX/m2PHJzaXpYcNlq
         Feo//b9wSr5mWkmCpSHHhiWLUTdGUOa9rNhqGsjr1NBjaIr0VIvoWvTMQaFMGQufKy/h
         wszw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=N/Rid5NqxxgBRg/S4kEAGGXjmMFCG2xtP2qbUOz07gY=;
        fh=JrsW5q6BAbaxshaJQM57sz97idGhGD/4Xpj+7yoKctE=;
        b=MSbyfl5k3Lzu/ygbptwfq+oKxbgPc1UqasDLARCNE/z0VH1pXeAlKaW2V+jBwFY/ow
         +dR4c2WlY53mFNDahhCmA6ROITktpgfF0+1u49ikyj9h4LtWIHGqWuZjDSLtTEY3zkCp
         sjmdjyNH6zI6wFnws5bCnzWmvcI15kWK6kIbXgz2jwauMS+twujxolPDYLYalvk36Eug
         NCkEN7pEMivIO5Bg9lF97o4NSL6kB9GkQIvAVoS9q4OAcNs3Wr7rjGmFt9S6RIicZ/WP
         4YEwcprTZ5OXc0iKQUM9GVyRZasNhs6exyK57R296oG2V5jnMTr5NzaGOLDYjg5PCsTT
         XeIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20230601.gappssmtp.com; s=20230601; t=1771366465; x=1771971265; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N/Rid5NqxxgBRg/S4kEAGGXjmMFCG2xtP2qbUOz07gY=;
        b=NkYMZ9gbucMnmBi4Y5d8YV7ytw+4FSjfndM0IklwIcJLHqxsCn+uaM6/3O80Sua+lC
         ujcCT9lcYHXGCE1fbJKpXvXVfJ8KI63bDFb1P5kk16J4Z9dCs7mS99KoF4KU1xp1qFgh
         S5cn57OFzEGhyMrHt0U6CJL2AzxSJU3Q+RaNpnGGCi8wx+aZMuJXmEFteQ/Z3w7Xq3pc
         iewbjaIUqNqb7c2eyM2Bk4v0W3eIefZ6NHzVy7Iig0kAyJg9yQb6iUXQ5FZeUNT6bxwZ
         qsL1PViUnX794YKPMHzqerrtCFTHMVs4UEkhe+i4ka0fVkb5VzYt2gwOCJXUHCMMeDsZ
         py4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771366465; x=1771971265;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/Rid5NqxxgBRg/S4kEAGGXjmMFCG2xtP2qbUOz07gY=;
        b=cvrEB/3V2OTWmSo7B2ZY4Pwpr4/TBZByXhnI4NuGlag9dw96k4CEwkaEBmHN1f3dVP
         EE4W+3dZNv8yxNR5+lN7vCeGRb7AoP/s+LvxqrHMzkvKWEHG5Bb/gINwM8zAWWLYcQzQ
         WgOGy2C77TeosYQTPhlHAfRxW2T97ILRnLNRmiQohIrKdvA2hmmdYnvPLvUbTDtbhPLc
         9oKQICMql0mD/uCaa/UvcFvNmltceZjIEHrC00NlwM2eD29YNE1MFw783tLUk3azIBo0
         wILX3XjkgXbZpJpPoYDJC4xNL+UmO6ToXqdT64JIDf4eylP28PB7hoOCvqOmPVagmGr1
         Fv/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWwV9Hk1zOj0FiPCrtc/aumUhRWdvxljZzUI9Mk29vxldCNwYqAjQeiFTIQ+udRhDFnOKaeofp3zkCLNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0mUqxiJniik8s+hO+XELrmyeMdgUHnyBBRB48bJEQauPhI57g
	XrVbVb1VOh3L3R2RtMAY5jzpKUOYS6zCawKSWTH/vsjdeyczxJdLKFkNpDOakYsdChmBoEgjZyK
	WIQfBdqVjlcI6iqQgTBirJ9hLOMRxtZFKx/hWPm70
X-Gm-Gg: AZuq6aKTRFGI3mHh1rfDhab2+zSmEmIFHJgynXfNvRf/To8mDv0oXD//h4R9M8BPP3i
	QkQMrjO5PlRSLhWPjTpNc4OtQz7Gi1gWHos6hlP0XtLee+/Mkf8CIFdys1cN9n1p/7UEgxOt/VS
	6chbttp1WLlVjNg4WvdK+siW4F+hxrOCySJvfgITyt/Po3WSOEL01nuwGvWxrY/eChw0Zu9zurN
	zvUME71JkZBwr/TPDP4Ab6qlIOuYwWmN437Y3VUOVq1pp7Pr4LMPY3LoJkZUY3YEFu1O0gA0nXO
	LmCO3L4rBe9hs7HLc2vw5NEcI82vH/ScPr+ofA==
X-Received: by 2002:a05:690e:150c:b0:649:ae49:f58b with SMTP id
 956f58d0204a3-64c198c7ac6mr11065944d50.25.1771366464775; Tue, 17 Feb 2026
 14:14:24 -0800 (PST)
Received: from 239600423368 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Feb 2026 14:14:24 -0800
Received: from 239600423368 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Feb 2026 14:14:24 -0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
from: Sean Rhodes <sean@starlabs.systems>
Date: Tue, 17 Feb 2026 14:14:24 -0800
X-Gm-Features: AaiRm50vV7ROzbwZCEB0gZP6KUbFwGf7XDciOrThMx_hJAknP5Fvs0PUmNClGh4
Message-ID: <CABtds-0aHEfz3=i=q_4bNHwfEg1aCFD4=1Js6hZ=FWpB9c8onw@mail.gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighter
To: linux-kernel@vger.kernel.org
Cc: tiwai@suse.com, chris.chiu@canonical.com, edip@medip.dev, 
	kailang@realtek.com, linux-sound@vger.kernel.org, perex@perex.cz, 
	david.henningsson@canonical.com, sbinding@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"

From 278f2646b0942aa2c57f2da1839b6e18adb38ed9 Mon Sep 17 00:00:00 2001
From: Sean Rhodes <sean@starlabs.systems>
Date: Tue, 17 Feb 2026 11:53:41 +0000
Subject: [PATCH] ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighter
To: tiwai@suse.com
Cc: perex@perex.cz,
    sbinding@opensource.cirrus.com,
    kailang@realtek.com,
    chris.chiu@canonical.com,
    edip@medip.dev,
    david.henningsson@canonical.com,
    linux-sound@vger.kernel.org,
    linux-kernel@vger.kernel.org

On Star Labs StarFighter (Realtek ALC233/235), the internal speakers can
emit an audible pop when resuming from runtime suspend.

The speaker amplifier is controlled via EAPD. The generic Realtek shutup
path can toggle EAPD/pin widget control while the amp is still unmuted,
causing the pop.

Mute the speaker output before toggling EAPD on suspend/resume and restore
the previous mute state after resume. Also toggle EAPD for the auxiliary
pin (0x14) so runtime PM can fully power down the codec instead of being
held in D0.

On this machine the internal speaker pin is exposed as a line-out pin with
type speaker, so use the line-out pin as the target for mute/EAPD when
no dedicated speaker pin is present.

Test results: fixes the runtime PM suspend/resume speaker pop. Pops that can
occur on cold boot (G3 exit) and around display manager start/shutdown are not
addressed.

Tested-by: Sean Rhodes <sean@starlabs.systems>
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 sound/hda/codecs/realtek/alc269.c  | 127 +++++++++++++++++++++++++++++
 sound/hda/codecs/realtek/realtek.h |   2 +
 2 files changed, 129 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c
b/sound/hda/codecs/realtek/alc269.c
index b66965a52107..4fec84b1bf5c 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1017,6 +1017,126 @@ static int alc269_resume(struct hda_codec *codec)
 	return 0;
 }

+#define STARLABS_STARFIGHTER_AUX_EAPD_PIN	0x14
+#define STARLABS_STARFIGHTER_EAPD_DELAY_MS	30
+#define STARLABS_STARFIGHTER_RESUME_DELAY_MS	20
+
+static hda_nid_t starlabs_starfighter_get_spk_pin(struct hda_codec *codec)
+{
+	struct alc_spec *spec = codec->spec;
+	const struct auto_pin_cfg *cfg = &spec->gen.autocfg;
+	const hda_nid_t *pins = auto_cfg_speaker_pins(cfg);
+
+	if (auto_cfg_speaker_outs(cfg) > 0 && pins[0])
+		return pins[0];
+
+	if (cfg->line_out_type == AC_JACK_SPEAKER && cfg->line_out_pins[0])
+		return cfg->line_out_pins[0];
+
+	return 0;
+}
+
+static void starlabs_starfighter_set_mute(struct hda_codec *codec,
+					  hda_nid_t nid, bool mute)
+{
+	snd_hda_codec_amp_stereo(codec, nid, HDA_OUTPUT, 0, HDA_AMP_MUTE,
+				 mute ? HDA_AMP_MUTE : 0);
+	/* sync after issuing the verbs */
+	snd_hda_codec_amp_read(codec, nid, 0, HDA_OUTPUT, 0);
+	snd_hda_codec_amp_read(codec, nid, 1, HDA_OUTPUT, 0);
+}
+
+static void starlabs_starfighter_set_eapd(struct hda_codec *codec,
+					  hda_nid_t nid, bool enable)
+{
+	if (!(snd_hda_query_pin_caps(codec, nid) & AC_PINCAP_EAPD))
+		return;
+
+	snd_hda_codec_write(codec, nid, 0, AC_VERB_SET_EAPD_BTLENABLE,
+			    enable ? 0x02 : 0x00);
+	/* sync after issuing the verb */
+	snd_hda_codec_read(codec, nid, 0, AC_VERB_GET_EAPD_BTLENABLE, 0);
+}
+
+static void starlabs_starfighter_shutup(struct hda_codec *codec)
+{
+	struct alc_spec *spec = codec->spec;
+	hda_nid_t spk_pin = starlabs_starfighter_get_spk_pin(codec);
+	unsigned int amp_l, amp_r;
+
+	if (!spk_pin)
+		return;
+
+	amp_l = snd_hda_codec_amp_read(codec, spk_pin, 0, HDA_OUTPUT, 0);
+	amp_r = snd_hda_codec_amp_read(codec, spk_pin, 1, HDA_OUTPUT, 0);
+	spec->speaker_pop_spk_was_muted =
+		!!((amp_l & HDA_AMP_MUTE) && (amp_r & HDA_AMP_MUTE));
+	spec->speaker_pop_resume_pending = 1;
+
+	/*
+	 * Star Labs StarFighter: the internal speaker amplifier is controlled via
+	 * EAPD. Mute before toggling EAPD on suspend/resume to avoid speaker pops.
+	 */
+	starlabs_starfighter_set_mute(codec, spk_pin, true);
+	msleep(STARLABS_STARFIGHTER_EAPD_DELAY_MS);
+
+	starlabs_starfighter_set_eapd(codec, spk_pin, false);
+	if (spk_pin != STARLABS_STARFIGHTER_AUX_EAPD_PIN)
+		starlabs_starfighter_set_eapd(codec,
+					      STARLABS_STARFIGHTER_AUX_EAPD_PIN,
+					      false);
+	msleep(STARLABS_STARFIGHTER_EAPD_DELAY_MS);
+}
+
+static unsigned int starlabs_starfighter_power_filter(struct hda_codec *codec,
+						      hda_nid_t nid,
+						      unsigned int power_state)
+{
+	unsigned int state;
+
+	state = snd_hda_gen_path_power_filter(codec, nid, power_state);
+	return snd_hda_codec_eapd_power_filter(codec, nid, state);
+}
+
+static void alc233_fixup_starlabs_speaker_pop(struct hda_codec *codec,
+					      const struct hda_fixup *fix,
+					      int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	switch (action) {
+	case HDA_FIXUP_ACT_PRE_PROBE:
+		codec->power_save_node = 1;
+		codec->power_filter = starlabs_starfighter_power_filter;
+		spec->shutup = starlabs_starfighter_shutup;
+		break;
+	case HDA_FIXUP_ACT_INIT: {
+		hda_nid_t spk_pin;
+
+		if (!spec->speaker_pop_resume_pending)
+			break;
+
+		spec->speaker_pop_resume_pending = 0;
+		spk_pin = starlabs_starfighter_get_spk_pin(codec);
+		if (!spk_pin)
+			break;
+
+		starlabs_starfighter_set_mute(codec, spk_pin, true);
+		starlabs_starfighter_set_eapd(codec, spk_pin, true);
+		if (spk_pin != STARLABS_STARFIGHTER_AUX_EAPD_PIN)
+			starlabs_starfighter_set_eapd(codec,
+						      STARLABS_STARFIGHTER_AUX_EAPD_PIN,
+						      true);
+		msleep(STARLABS_STARFIGHTER_EAPD_DELAY_MS);
+		msleep(STARLABS_STARFIGHTER_RESUME_DELAY_MS);
+
+		if (!spec->speaker_pop_spk_was_muted)
+			starlabs_starfighter_set_mute(codec, spk_pin, false);
+		break;
+	}
+	}
+}
+
 static void alc269_fixup_pincfg_no_hp_to_lineout(struct hda_codec *codec,
 						 const struct hda_fixup *fix, int action)
 {
@@ -3802,6 +3922,7 @@ enum {
 	ALC245_FIXUP_CLEVO_NOISY_MIC,
 	ALC269_FIXUP_VAIO_VJFH52_MIC_NO_PRESENCE,
 	ALC233_FIXUP_MEDION_MTL_SPK,
+	ALC233_FIXUP_STARLABS_SPEAKER_POP,
 	ALC294_FIXUP_BASS_SPEAKER_15,
 	ALC283_FIXUP_DELL_HP_RESUME,
 	ALC294_FIXUP_ASUS_CS35L41_SPI_2,
@@ -6238,6 +6359,10 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ }
 		},
 	},
+	[ALC233_FIXUP_STARLABS_SPEAKER_POP] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc233_fixup_starlabs_speaker_pop,
+	},
 	[ALC294_FIXUP_BASS_SPEAKER_15] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc294_fixup_bass_speaker_15,
@@ -7370,6 +7495,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x2782, 0x1705, "MEDION E15433", ALC269VC_FIXUP_INFINIX_Y4_MAX),
 	SND_PCI_QUIRK(0x2782, 0x1707, "Vaio VJFE-ADL", ALC298_FIXUP_SPK_VOLUME),
 	SND_PCI_QUIRK(0x2782, 0x4900, "MEDION E15443", ALC233_FIXUP_MEDION_MTL_SPK),
+	SND_PCI_QUIRK(0x7017, 0x2014, "Star Labs StarFighter",
ALC233_FIXUP_STARLABS_SPEAKER_POP),
 	SND_PCI_QUIRK(0x8086, 0x2074, "Intel NUC 8", ALC233_FIXUP_INTEL_NUC8_DMIC),
 	SND_PCI_QUIRK(0x8086, 0x2080, "Intel NUC 8 Rugged",
ALC256_FIXUP_INTEL_NUC8_RUGGED),
 	SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", ALC256_FIXUP_INTEL_NUC10),
@@ -7466,6 +7592,7 @@ static const struct hda_model_fixup
alc269_fixup_models[] = {
 	{.id = ALC298_FIXUP_TPT470_DOCK_FIX, .name = "tpt470-dock-fix"},
 	{.id = ALC298_FIXUP_TPT470_DOCK, .name = "tpt470-dock"},
 	{.id = ALC233_FIXUP_LENOVO_MULTI_CODECS, .name = "dual-codecs"},
+	{.id = ALC233_FIXUP_STARLABS_SPEAKER_POP, .name = "starlabs-starfighter"},
 	{.id = ALC700_FIXUP_INTEL_REFERENCE, .name = "alc700-ref"},
 	{.id = ALC269_FIXUP_SONY_VAIO, .name = "vaio"},
 	{.id = ALC269_FIXUP_DELL_M101Z, .name = "dell-m101z"},
diff --git a/sound/hda/codecs/realtek/realtek.h
b/sound/hda/codecs/realtek/realtek.h
index b2a919904c4c..293fc0f3373f 100644
--- a/sound/hda/codecs/realtek/realtek.h
+++ b/sound/hda/codecs/realtek/realtek.h
@@ -119,6 +119,8 @@ struct alc_spec {
 	unsigned int has_hs_key:1;
 	unsigned int no_internal_mic_pin:1;
 	unsigned int en_3kpull_low:1;
+	unsigned int speaker_pop_resume_pending:1;
+	unsigned int speaker_pop_spk_was_muted:1;
 	int num_speaker_amps;

 	/* for PLL fix */
-- 
2.51.0
