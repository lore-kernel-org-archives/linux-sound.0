Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793489375;
	b=RwTDr68icIBBXfHD6SMGwcfL6jd0D+t9ORQwQqraIqb3L662ZTZ00UpJiiTy8uQKwX6w
	 6nDHQnQG54ZIq7xW4gw0VYwu2k9FsUoKQki88tBgBpBfV6UD+76Gq8105AOAZKwpEra+H
	 FCUwFKwGq/16GzJPpMDIzGUTi5cL4GWZiZ1JjR0GQ78yCmEzSuDAuxy0/N/3eK0J8lh4f
	 sIwFpdKVIAvR1Ht3i/A0TgwVBd1jV6KOYCtWyFvq0LPATfv1iMnXNVaNzLU26DcdDgUJ8
	 qDovkrG0GG+gnfCe30iMrj6rtXXQRJ2vFy4Pi5biIGa1DnH5UtgbDpVpl5Vxn6OmgNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793489375;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PTHsmSjdx2ekr0uNRSnehHeVup9fVWW5jmVnj1Y9jLI=;
	b=cANlMmaMFeOoU1PWIZMswsRqHRfpXoyevCOigHoHAVNiJPDQ31cmJZ2lzgiira3t43vZ
	 J0BrEDpBLrQz4RZUwcJFPfQw6H+0UaFb/iP1RL4SF933jBJ62uKBBGHLCI8ceCibjb/JY
	 5JS6RgsCe7DmiJ0uGuEjM8TqkDnqvrhvrYT5E+NoQ18W4QisC62ncT9IAM+el50/FedK/
	 FdyBDqRdKypXE/ExVzBbYk7CiW8GaMSZY9fMYRGSga+3uWUWqWJ4JwnCkW6u5LvEP6z1v
	 BnhPuh6Ov45BjAohpko94F/Dwd1lljDie0FlxOdTWbjyJh0tMpN4xxfjbVWrbpgLJkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lG7qF6x2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D86F606A31A
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 23:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lG7qF6x2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D4C1F000C1;
	Sat, 31 Oct 2026 23:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793489374;
	bh=PTHsmSjdx2ekr0uNRSnehHeVup9fVWW5jmVnj1Y9jLI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lG7qF6x2EGV+NAYaKLCu+UUwSN60Bl5mi2M09DHF/8WQVIhgaA57KW5f+LEy+fqaj
	 l+yko2wflrE2d7+Vt9fznuFU9hPDqI/3o1uYGyOoQ0YfqR1DaCZOC6gFYEjtJ/B3Ug
	 ZETKqM6k9JccgxPtgG55ICMWVTMBKc0D/GTv+BaoIo7NjDnfXxYrPyaM6lgKMh5JSU
	 vPnLAabkujSNMeax09cKns0tEpc+k6Xq3HsVbr5gaZFULP6HWpM5mJRGNwmy9rudY1
	 m2X8xnvQ1od3LBsqcwBJvLbG6z0fptb434CgqD4UJwRJNyTB3DJ/uX5u/Dii+l7sq6
	 ShGn4dMQpbwSg==
Message-ID: <sashiko-outbox-192221@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC] ALSA: hda/tas2781: Reload DSP program if the
 amplifiers lost it
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Maidanovych" <devuarpd@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261101-tas2781-reload-if-lost-v1-1-9d336120f1ba@gmail.com>
References: <20261101-tas2781-reload-if-lost-v1-1-9d336120f1ba@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 23:29:34 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] ALSA: hda/tas2781: partial reload in tas2781_hda_reload_if_lost(=
) wipes config
- [Medium] ALSA: hda/tas2781: missing init_profile_id and double load in re=
load_if_lost()
- [Medium] ALSA: hda/tas2781: missing fw_state check in tas2781_hda_reload_=
if_lost()
--

commit 74dce121e5a4c4de7e8754632f2407d57f7750d6
Author: Roman Maidanovych <devuarpd@gmail.com>

ALSA: hda/tas2781: Reload DSP program if the amplifiers lost it

This patch checks bit 7 of B0_P0_R0x44 on TAS2781 amplifiers when a PCM str=
eam
is opened and reloads the DSP program if the amplifier lost its program dur=
ing
HDA codec runtime suspend.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221735

> diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/c=
odecs/side-codecs/tas2781_hda_i2c.c
> index 44855f593daf8..177a2194aeb70 100644
> --- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
> +++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c

[ ... ]

> @@ -162,6 +165,38 @@ static int tas2781_read_acpi(struct tasdevice_priv *=
p, const char *hid)
>  	return ret;
>  }
> =20
> +/*
> + * The amplifiers can lose their DSP program while the HDA codec is runt=
ime
> + * suspended, without the chip being reset. The cached program/configura=
tion
> + * then makes tasdevice_tuning_switch() skip the download and the speake=
rs
> + * stay silent. Bit 7 of B0_P0_R0x44 is set in that state: invalidate the
> + * cache and download the program again.
> + */
> +static void tas2781_hda_reload_if_lost(struct tasdevice_priv *tas_priv)
> +{
> +	bool lost =3D false;
> +	int i, ret, val;
> +
> +	if (tas_priv->chip_id !=3D TAS2781)
> +		return;

[Severity: Medium]
Should tas2781_hda_reload_if_lost() also check that tas_priv->fw_state is
TASDEVICE_DSP_FW_ALL_OK before checking TAS2781_REG_DSP_LOST and calling
tasdevice_prmg_load()?

In tas2781_hda_bind(), tascodec_init() schedules asynchronous firmware load=
ing
via request_firmware_nowait() and registers comp->playback_hook while
tas_priv->fw_state is still TASDEVICE_DSP_FW_PENDING and tas_priv->fmw is N=
ULL.
Similarly, if tasdevice_dsp_parser() fails in tasdevice_dspfw_init(),
tas_priv->fw_state is set to TASDEVICE_DSP_FW_FAIL without freeing a partia=
lly
populated tas_priv->fmw:

sound/hda/codecs/side-codecs/tas2781_hda_i2c.c:tasdevice_dspfw_init() {
	...
	ret =3D tasdevice_dsp_parser(tas_priv);
	if (ret) {
		dev_err(tas_priv->dev, "dspfw load %s error\n",
			tas_priv->coef_binaryname);
		tas_priv->fw_state =3D TASDEVICE_DSP_FW_FAIL;
		return;
	}
}

Previously, tas2781_hda_playback_hook() only called tasdevice_tuning_switch=
(),
which returns early unless fw_state is TASDEVICE_RCA_FW_OK or
TASDEVICE_DSP_FW_ALL_OK. Without checking fw_state =3D=3D TASDEVICE_DSP_FW_=
ALL_OK
here, opening a PCM stream before firmware loading finishes, in RCA-only mo=
de,
or after a DSP firmware parse error can read TAS2781_DSP_LOST as set on the
unprogrammed amplifier and call tasdevice_prmg_load() with NULL or partially
parsed firmware.

> +
> +	for (i =3D 0; i < tas_priv->ndev; i++) {
> +		ret =3D tasdevice_dev_read(tas_priv, i, TAS2781_REG_DSP_LOST, &val);
> +		if (ret || !(val & TAS2781_DSP_LOST))
> +			continue;
> +
> +		tas_priv->tasdevice[i].cur_book =3D -1;
> +		tas_priv->tasdevice[i].cur_prog =3D -1;
> +		tas_priv->tasdevice[i].cur_conf =3D -1;
> +		lost =3D true;
> +	}

[Severity: Medium]
What happens if only a subset of channels have TAS2781_DSP_LOST set (or if
tasdevice_dev_read() fails transiently on one channel while succeeding on
another)?

Earlier calls to tasdevice_select_cfg_blk() leave
tas_priv->tasdevice[chn].is_loading set to true on all channels:

sound/soc/codecs/tas2781-fmwlib.c:tasdevice_select_cfg_blk() {
	...
			for (; chn < chnend; chn++)
				tas_priv->tasdevice[chn].is_loading =3D true;
	...
}

When tas2781_hda_reload_if_lost() then calls tasdevice_prmg_load(), the loop
only updates channels where cur_prog !=3D prm_no and does not clear is_load=
ing
to false on the remaining channels:

sound/soc/codecs/tas2781-fmwlib.c:tasdevice_prmg_load() {
	...
	for (i =3D 0, prog_status =3D 0; i < tas_priv->ndev; i++) {
		if (prm_no >=3D 0 && tas_priv->tasdevice[i].cur_prog !=3D prm_no) {
			tas_priv->tasdevice[i].cur_conf =3D -1;
			tas_priv->tasdevice[i].is_loading =3D true;
			prog_status++;
		}
	}
}

Because is_loading is still true on the non-lost channel,
tasdevice_load_data(tas_priv, &(program->dev_data)) downloads the DSP progr=
am
(including its software reset commands) to that channel as well, wiping its
hardware state. However, because cur_conf was never reset to -1 on that
channel, the subsequent tasdevice_tuning_switch() ->
tasdevice_select_tuningprm_cfg() call sees cur_conf =3D=3D cfg_no and skips
reloading the configuration and calibration data on that channel, leaving it
unconfigured.

> +
> +	if (lost) {
> +		dev_dbg(tas_priv->dev, "DSP program lost, reloading\n");
> +		tasdevice_prmg_load(tas_priv, tas_priv->cur_prog);
> +	}
> +}

[Severity: Medium]
Does reloading the program here miss applying tas_priv->rcabin.init_profile=
_id,
and can it cause a double program download when force_fwload_status is enab=
led?

In both tasdevice_dspfw_init() and tas2781_system_resume(), calling
tasdevice_prmg_load() is immediately followed by applying init_profile_id
before tasdevice_tuning_switch():

sound/hda/codecs/side-codecs/tas2781_hda_i2c.c:tas2781_system_resume() {
	...
	tasdevice_prmg_load(tas_hda->priv, tas_hda->priv->cur_prog);

	/* Init common setting for different audio profiles */
	if (tas_hda->priv->rcabin.init_profile_id >=3D 0)
		tasdevice_select_cfg_blk(tas_hda->priv,
			tas_hda->priv->rcabin.init_profile_id,
			TASDEVICE_BIN_BLK_PRE_POWER_UP);
	...
}

Without that step in tas2781_hda_reload_if_lost(), common profile settings
from init_profile_id are not restored after tasdevice_prmg_load() reloads t=
he
DSP program.

In addition, tasdevice_tuning_switch(tas_hda->priv, 0, false) runs immediat=
ely
after tas2781_hda_reload_if_lost() in tas2781_hda_playback_hook() and calls
tasdevice_select_tuningprm_cfg(), which reloads the DSP program whenever
cur_prog !=3D prm_no || tas_priv->force_fwload_status:

sound/soc/codecs/tas2781-fmwlib.c:tasdevice_select_tuningprm_cfg() {
	...
			if (prm_no >=3D 0
				&& (tas_priv->tasdevice[i].cur_prog !=3D prm_no
				|| tas_priv->force_fwload_status)) {
				tas_priv->tasdevice[i].cur_conf =3D -1;
				tas_priv->tasdevice[i].is_loading =3D true;
				prog_status++;
			}
	...
}

If the "Speaker Force Firmware Load" control (force_fwload_status) is enabl=
ed,
calling tasdevice_prmg_load() in tas2781_hda_reload_if_lost() and then call=
ing
tasdevice_tuning_switch() will download the full DSP program twice in a row=
 on
PCM open.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-tas2781-re=
load-if-lost-v1-1-9d336120f1ba@gmail.com?part=3D1
