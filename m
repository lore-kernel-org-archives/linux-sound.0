Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B874538D6B1
	for <linux-sound@vger.kernel.org>; Sun,  7 Jun 2026 11:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780831113; cv=none; b=Art7OO2fahIwSPEsmtElOGKBlXASenSXJHcUOraLoZYXoJgdTSvbsJhYX7RRkB+EZKsVn8Cgw1620/dGFpI48jjpm+41XGEAuQSmIMtBlMAZCP+yHyjEBkOllpQxtXm9a2Yltxl6gx1YriHclXIWg6a87ng9woosBdVdldVyvus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780831113; c=relaxed/simple;
	bh=qNFAAFsOvlUQG/1oQ5qRT9yH89ObCEpLROIiFTGmrI8=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=O+Xjf281uI/quVnjGIpmtI8TIWs+CVezuUP5l9M3jGeEFiVPxE7+seyakYI7EvBIJfJSNXhwkv0gdGs67Q3L862ofBhEltUnNbYXw/Cevt0FX7N3yy+LIWkIIFpsNcBehxRpRE6ksxR6eBPq5OwDbjrHISrJ/UY9295yAXZ3iCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=HJqJ2ho4; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="HJqJ2ho4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1780831101; x=1781090301;
	bh=XNgrcmC+WZoXM4rcn1YzBjqlJenFIAKen3lwh6dHJa8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=HJqJ2ho4bHGH6UiA1+qTvIEJJWVrNP5aJCmIEzkgaMJJCEV/If6LFiVVWzRlKJr60
	 bLg13ovUqL+dHkLGTJlrcCYTdTIEN62uxg3a0sHPPGjgp8AXvn8k8etNUHEPIdnM/a
	 GkVJCBLKCrzD34ZpotUYOmztAlYBf3K1iwhftMm3hRtQXz3fhMwhGStvuwXNSJ27mX
	 E24fV4OSHD2ELymIAemOLjVLJtOVaKUG5fqPe6a2IHpkcU/3tltSoEU9fJsHpSYPxT
	 Ecj73jK1eLkXaSO6kh18qkVZItn/x8Jv3zlqkFhso1iLnw7e0bOWvZFET7qQcSf2KL
	 ubFmuHRNHYTvA==
Date: Sun, 07 Jun 2026 11:18:15 +0000
To: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
From: Christoffer Appeltofft <chrisappel@proton.me>
Cc: "shenghao-ding@ti.com" <shenghao-ding@ti.com>, "tiwai@suse.com" <tiwai@suse.com>
Subject: TAS2781 on Lenovo Yoga Pro 9 16IMH9: DSP config not loaded at init, kernel or firmware fix?
Message-ID: <8N6Ji-GsGo5FvU0wbbyyO1xjMPm2Ti-aQAAqIFWVTsujPbUQvekIykX1Z3g3tjxwSATtc-qoj1cw6YShTKwuSJJQGs4qRpf2ocOVZnE215Y=@proton.me>
Feedback-ID: 49305302:user:proton
X-Pm-Message-ID: cc6b13ba2208e3541988bd961a7b36298c07ac16
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I've been chasing a bass-speaker problem on a Lenovo Yoga Pro 9 16IMH9.
I have a working userspace workaround and a code-level suspicion, but I
can't tell which layer the real fix belongs in, so I'm hoping someone
who knows the firmware internals can point me the right way.

The machine:
  - Lenovo Yoga Pro 9 16IMH9 (DMI product name 83DN)
  - Intel Core Ultra 9 185H (Meteor Lake)
  - Realtek ALC287, codec SSID 17aa:38d6
  - 2x TI TAS2781 over I2C (ACPI HID TIAS2781)
  - SOF stack (sof-audio-pci-intel-mtl), PipeWire
  - Fedora 44, kernel 7.0.11-200.fc44, linux-firmware 20260519
  - Relevant code looks the same in current for-next.

One prerequisite: the 16IMH9 shares PCI SSID 17aa:3811 with the Legion
S7 15IMH05, so it needs the codec-SSID quirk from commit 56722cfbb78d,
which isn't in 7.0.x stable yet. I applied that locally and the amp
binds fine:

    ALC287: picked fixup for codec SSID 17aa:38d6
    bound i2c-TIAS2781:00 (ops tas2781_hda_comp_ops [snd_hda_scodec_tas2781=
_i2c])

The actual problem is separate. The amp binds, but the DSP tuning never
gets loaded, so the woofers play without their profil: thin and a bit
distorted. With dynamic debug on, every playback start gives:

    tas2781_hda_playback_hook: action =3D 0
    tasdevice_select_tuningprm_cfg: Unneeded loading dsp conf 0

Enabling the "Speaker Force Firmware Load" mixer control works around it
outright:

    amixer -c 0 cset numid=3D3 1

With that enabled the amp loads its actual tuning profile and the sound
quality jumps to roughly what you get on Windows. One side effect worth
noting: after the amp has been idle, the first bit of playback is
delayed by ~2-3s (presumably the full config reload on resume). I
haven't pinned down whether that's the firmware reload specifically or
the stream coming back up.

For context, the existing community workarounds for this machine poke
the TAS2781 registers directly over I2C and then layer an EasyEffects
correction profile on top to compensate for the missing tuning, e.g.:

    https://github.com/maximmaxim345/yoga_pro_9i_gen9_linux

In my testing, Force Firmware Load gives noticeably better results than
that approach: less clipping, and no EasyEffects EQ profile needed,
since the amp is running its real DSP tuning rather than being
EQ-corrected after the fact.

My best guess at where it's going wrong, though I'm not sure this is
the right layer, is in tasdevice_dspfw_init() (tas2781_hda_i2c.c,
around line 469 here):

    if (tas_priv->fmw->nr_configurations > 0)
        tas_priv->cur_conf =3D 0;

    if (tas_priv->rcabin.init_profile_id >=3D 0)
        tasdevice_select_cfg_blk(tas_priv,
            tas_priv->rcabin.init_profile_id,
            TASDEVICE_BIN_BLK_PRE_POWER_UP);

cur_conf gets set to 0 before anything is actually loaded. First
playback then calls select_tuningprm_cfg() with cfg_no =3D 0, sees
cur_conf =3D=3D 0, decides it's already loaded, and skips it, that's the
"Unneeded" message.

On this box init_profile_id seems to be -1 (no "init" profile in the
RCA bin; from tas2781-fmwlib.c that's only picked up for
binary_version_num >=3D 0x105 with an "init"-named profile). So the
select_cfg_blk() call above is skipped too, and nothing loads any
config state at init, but cur_conf is still left at 0. The resume path
a few hundred lines down uses cur_conf =3D -1, which wouldn't hit this.

What I can't tell from the outside:

  - Whether this should be fixed in the driver (e.g. cur_conf =3D -1 at
    init, or only setting it when an init profile was actually loaded).
    I'm not sure -1 is right versus the conditional, and I noticed
    init_profile_id is ncfgs - 1 (the last config, not 0), so what
    cur_conf is meant to hold at init isn't obvious to me.

  - Or whether this is really a firmware-side issue e.g. my RCA/DSP
    blob simply not having an init profile, in which case the driver
    is behaving as intended and the fix is a firmware update. My
    linux-firmware (20260519) seems current, so I'm not sure.

Mainly I'd like to know which layer this belongs in. Happy to test
patches, try firmware variants, or send the full dmesg with tas2781
debug enabled.

Thanks,
Christoffer Appeltofft
