Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793848418;
	b=H/uzjyVJtBg/UT1hSaiv9RsY0RmPck5rdsLhO7ABfkVRrBQILF/DKshoDAE5xOMX9lyC
	 UZ1UEPM3MxE8K728DT41zBIENtaC5gJ1vwYj/4gnbzpNnm8WlWz96gdK1NlZFmfQeJGL6
	 b2Gj1K1RTE6ZrhiAOUV4XS9vMJqNAyFwX8jz1zr9T+m16TF9Xyn2Oh8CxwhtxtKGeMyYA
	 zz/t3ZF8r8BAKhoA6GF8DshKenQ4LfrdBtNbIqNzTcwpgi18ROwUNVyihVsMI21l3+DW0
	 BaCRiiE+vIPucKvygERBRSHEIAEt1iBE26gMy2lgP7gj9zKZsEcTUASb5b119IfRxMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793848418;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yEEQYjJ85h/bDBArL66uIBdibP/I/GT6aEdesM9d1TI=;
	b=qV5L8nEnrHSZJSmet+zVLRkF+ESs0zP6rccXp9kiYwYAHks+vnf5XR/j4CMKuu3d4JbH
	 7JX8LLUjbSNLTcF+kH5tTAOT3sEjRUc7JmER8rkk5dJILdQLEob8ugSV8/WQGsdF64Zk8
	 B53y0MBi+xJaHfwDtIxSvEyI9QmA1M6kvmu2Gn6LXYZw5ZEIXusyNSOiNaJZpNfgNNELg
	 nOTQqobkvFJQWOt1BGtrz2cw9Kbmll9kH5039+Xre4UWe0rYQ79+REd6iVBiwqD7sYCpP
	 aBu34Fayk/sxVhsacTPbtnRvicVfFPcN+h/6SauibeR5384Og5+5Grcp3RVhkXkoNsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eTjs1Nii;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD4C606A31B
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 03:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eTjs1Nii
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26021F00A16;
	Thu,  5 Nov 2026 03:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793848418;
	bh=yEEQYjJ85h/bDBArL66uIBdibP/I/GT6aEdesM9d1TI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eTjs1NiiGmRlL46OdQRKbACmrxmTMJIwn0GJ/2Q0kuHb5KcMQN8YROQzEJFWsZS05
	 MfrPGebCfWMCrgi+KLoKief4+SAgXPZHlx9gCsxoAMQCqgYcR5xpheO+WdXL/PDKLV
	 CwjibU+d0KRcGuBUwNn6urAvY8A9tJRk8XO9CbXmHd1W2uLmR8MJosSRQvYButwhq5
	 w17vi5T3xnIHaZ6kzr8t8ZynrNf0kfip/TVfB2CBHud8PLFGTbIvdLDg1yAtFcIVhW
	 FWWHemygxm0UbyMJiyHhO+g3jPFD1WHekRetEbxqv9kp32fVNESDXnfFDfqaGWFWqD
	 lRS9KNhKEN76A==
Message-ID: <sashiko-outbox-198508@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Use inverted mute LED quirk for HP
 ZBook 8 G2a
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Chiu" <chris.chiu@canonical.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261105025647.1116662-1-chris.chiu@canonical.com>
References: <20261105025647.1116662-1-chris.chiu@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 03:13:37 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] ALSA: hda/realtek: inverted quirk masks pre-probe hp_pin bug, dr=
ops LED cdev
- [Medium] ALSA: hda/realtek: inverted mute LED fixup forces LED off on ini=
t and resume
--

commit 23741cb49591f5a79d39e1a48d8231c4b0817ad6
Author: Chris Chiu <chris.chiu@canonical.com>

ALSA: hda/realtek: Use inverted mute LED quirk for HP ZBook 8 G2a

This commit switches four HP ZBook 8 G2a PCI SSIDs (0x103c:0x8f40,
0x103c:0x8f41, 0x103c:0x8f42, and 0x103c:0x8f62) from
ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED to
ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED to fix reversed speaker mute =
LED
behavior.

> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek=
/alc269.c
> index 23329d5887a56..7335b930387e9 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -8106,11 +8106,11 @@ static const struct hda_quirk alc269_fixup_tbl[] =
=3D {
>  	SND_PCI_QUIRK(0x103c, 0x8f3a, "HP EliteBook 6 G2i", ALC236_FIXUP_HP_GPI=
O_LED),
>  	SND_PCI_QUIRK(0x103c, 0x8f3c, "HP EliteBook 6 G2a", ALC236_FIXUP_HP_MUT=
E_LED_MICMUTE_VREF),
>  	SND_PCI_QUIRK(0x103c, 0x8f3d, "HP EliteBook 6 G2a", ALC236_FIXUP_HP_MUT=
E_LED_MICMUTE_VREF),
> -	SND_PCI_QUIRK(0x103c, 0x8f40, "HP ZBook 8 G2a 14", ALC245_FIXUP_HP_TAS2=
781_I2C_MUTE_LED),
> -	SND_PCI_QUIRK(0x103c, 0x8f41, "HP ZBook 8 G2a 16", ALC245_FIXUP_HP_TAS2=
781_I2C_MUTE_LED),
> -	SND_PCI_QUIRK(0x103c, 0x8f42, "HP ZBook 8 G2a 14W", ALC245_FIXUP_HP_TAS=
2781_I2C_MUTE_LED),
> +	SND_PCI_QUIRK(0x103c, 0x8f40, "HP ZBook 8 G2a 14", ALC245_FIXUP_HP_TAS2=
781_I2C_MUTE_LED_INVERTED),
> +	SND_PCI_QUIRK(0x103c, 0x8f41, "HP ZBook 8 G2a 16", ALC245_FIXUP_HP_TAS2=
781_I2C_MUTE_LED_INVERTED),
> +	SND_PCI_QUIRK(0x103c, 0x8f42, "HP ZBook 8 G2a 14W", ALC245_FIXUP_HP_TAS=
2781_I2C_MUTE_LED_INVERTED),
>  	SND_PCI_QUIRK(0x103c, 0x8f57, "HP Trekker G7JC", ALC287_FIXUP_CS35L41_I=
2C_2),
> -	SND_PCI_QUIRK(0x103c, 0x8f62, "HP ZBook 8 G2a 16W", ALC245_FIXUP_HP_TAS=
2781_I2C_MUTE_LED),
> +	SND_PCI_QUIRK(0x103c, 0x8f62, "HP ZBook 8 G2a 16W", ALC245_FIXUP_HP_TAS=
2781_I2C_MUTE_LED_INVERTED),

[Severity: Medium]
Does switching these HP ZBook 8 G2a laptops to
ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED drop registration of the
/sys/class/leds/hda::mute LED classdev while working around a pre-probe bug=
 in
alc245_tas2781_i2c_hp_fixup_muteled()?

In commit 9afbbf490322 ("ALSA: hda/realtek - Enable Mute LED and Tas2781 for
HP platform"), alc245_tas2781_i2c_hp_fixup_muteled() unconditionally called
alc245_fixup_hp_mute_led_coefbit():

sound/hda/codecs/realtek/alc269.c:alc245_fixup_hp_mute_led_coefbit() {
	if (action =3D=3D HDA_FIXUP_ACT_PRE_PROBE) {
		spec->mute_led_polarity =3D 0;
		spec->mute_led_coef.idx =3D 0x0b;
		spec->mute_led_coef.mask =3D 3 << 2;
		spec->mute_led_coef.on =3D 2 << 2;
		spec->mute_led_coef.off =3D 1 << 2;
		snd_hda_gen_add_mute_led_cdev(codec, coef_mute_led_set);
	}
}

With snd-ctl-led, muting sets brightness to 1 (writing 0x08, LED on) and
unmuting sets brightness to 0 (writing 0x04, LED off), which already matches
the HP ZBook 8 G2a COEF polarity.

Later, commit d3be95efc6a1e0 ("ALSA: hda/realtek - Fixed Speaker Mute LED f=
or
HP EliteBoard G1a platform") modified alc245_tas2781_i2c_hp_fixup_muteled()=
 to
branch on alc_get_hp_pin(spec):

sound/hda/codecs/realtek/alc269.c:alc245_tas2781_i2c_hp_fixup_muteled() {
	struct alc_spec *spec =3D codec->spec;
	hda_nid_t hp_pin =3D alc_get_hp_pin(spec);
	static const hda_nid_t conn[] =3D { 0x02 };

	switch (action) {
	case HDA_FIXUP_ACT_PRE_PROBE:
		if (!hp_pin) {
			spec->gen.vmaster_mute.hook =3D alc245_hp_spk_mute_led_update;
			spec->gen.vmaster_mute_led =3D 1;
		}
	...
	if (hp_pin)
		alc245_fixup_hp_mute_led_coefbit(codec, fix, action);
}

However, alc269_probe() runs HDA_FIXUP_ACT_PRE_PROBE before
alc269_parse_auto_config() populates spec->gen.autocfg:

sound/hda/codecs/realtek/alc269.c:alc269_probe() {
	...
	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
	...
	/* automatic parse from the BIOS config */
	err =3D alc269_parse_auto_config(codec);
}

Because spec->gen.autocfg is still zeroed during HDA_FIXUP_ACT_PRE_PROBE,
hp_pin is always 0 at pre-probe even on laptops with a headphone jack, and
since alc245_fixup_hp_mute_led_coefbit() only acts on HDA_FIXUP_ACT_PRE_PRO=
BE,
it is never executed. Every board on ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED
falls into the !hp_pin branch and installs alc245_hp_spk_mute_led_update() =
as
spec->gen.vmaster_mute.hook:

sound/hda/codecs/realtek/alc269.c:alc245_hp_spk_mute_led_update() {
	struct hda_codec *codec =3D private_data;
	unsigned int val;

	val =3D enabled ? 0x08 : 0x04; /* 0x08 led on, 0x04 led off */
	alc_update_coef_idx(codec, 0x0b, 0x0c, val);
}

Since vmaster_mute.hook receives the Master Playback Switch state (enabled =
=3D 1
when unmuted, 0 when muted), alc245_hp_spk_mute_led_update() writes 0x08 wh=
en
unmuted and 0x04 when muted.

Reassigning these laptops to ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED
bypasses snd_hda_gen_add_mute_led_cdev() so no hda::mute LED classdev is
created, and leaves alc245_tas2781_i2c_hp_fixup_muteled() broken for the
remaining boards (0x103c:0x8e8a and 0x103c:0x8f7e). Should
alc245_tas2781_i2c_hp_fixup_muteled() and its Fixes tag (d3be95efc6a1e0) be
addressed instead?

[Severity: Medium]
Will assigning these SSIDs to ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED
also cause the speaker mute LED to be forced off after runtime PM resume or
system suspend/resume while Master Playback Switch is muted?

In alc245_tas2781_i2c_hp_fixup_muteled_inverted(), HDA_FIXUP_ACT_INIT
unconditionally updates the LED using !spec->gen.master_mute:

sound/hda/codecs/realtek/alc269.c:alc245_tas2781_i2c_hp_fixup_muteled_inver=
ted() {
	...
	case HDA_FIXUP_ACT_INIT:
		alc245_hp_spk_mute_led_update_inverted(codec, !spec->gen.master_mute);
		break;
}

In the Realtek driver, spec->gen.master_mute is not updated by the Master
Playback Switch control and remains 0, so !spec->gen.master_mute is always =
1.
During codec init and resume, alc_init() runs HDA_FIXUP_ACT_INIT after
snd_hda_gen_init() has synced spec->gen.vmaster_mute:

sound/hda/codecs/realtek/realtek.c:alc_init() {
	...
	snd_hda_gen_init(codec);
	alc_fix_pll(codec);
	alc_auto_init_amp(codec, spec->init_amp);
	snd_hda_apply_verbs(codec); /* apply verbs here after own init */

	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_INIT);
}

When Master Playback Switch is muted, snd_hda_gen_init() syncs
spec->gen.vmaster_mute (setting COEF 0x0b bits 0x0c to 0x08, LED on), and t=
hen
snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_INIT) calls
alc245_hp_spk_mute_led_update_inverted(codec, 1), which writes 0x04 and tur=
ns
the mute LED off on every runtime or system resume. Previously, under
ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED, the HDA_FIXUP_ACT_INIT call was guard=
ed
by if (!hp_pin), which evaluated to false at init time once
alc269_parse_auto_config() had populated spec->gen.autocfg.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105025647.1116=
662-1-chris.chiu@canonical.com?part=3D1
