Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254683;
	b=fRgvFRibkkZJOmVmSbuDIDKq9rUJzE8dVt99ejDxu8eQPEoow2ifEKv9Qvb0exQNvmVP
	 if4CsHzCd3cZ5XESgBZpT8LykcTBqrG5l6AguXfM71i3GL85PXxQmVFCBaLMv8E7rqNMy
	 ndYcOLbre5cItrA3sydm1A8peQqqznm0r0+h1iaxS47KjcvnZ5KE43xyI7xGd4K9Ylilw
	 DB63u3iIdXI1eevD3yXkkHi5pQcwgPNCP4ctPFGEGKRciHcU4GnT0d/Pp2vfWHyHVXDcK
	 CsuIkyDUHL8U6HlGHNW6WOx43lDY2LRciSc2wrEW2c50tx5WFQ0z7ZErXw/RmeQmUMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254683;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CUZiPeEFVJSxxMFkU+P+u3zf/t1AvkpQ+KPN37E3S5E=;
	b=l8Ik1ZvnSNGpfaHsjWca1O2tNVUOIJZpTiO2bfuCENJm/xw9PN9LQiaQ1VKomDB9VxdG
	 dfQQAbEblBjSShamH8gap+xbYceXmNSWBxskzJat0Gi44GAaJUYclyDzr/6+aGTFSBUSA
	 4hj7y0Cu6dG+bUbPnkUnHR6YSCwkYIgVWyMplxq/peeXPUZwecqaJzgiaqf6q0wYqeRDQ
	 1xxQnwiE6Ub/B8SzKie6zLTADB969vxo2xsww8xC75z4MYByMN/Tgw9qP4XbvHueQSGMc
	 XmnIsaTj6Q/ja3+h6RUitsNl4mE6SNqazAIjKXny07grc9HUMmnxgmKaahUc/QlcbnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SWy6oVtN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DAF606A31C
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 06:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SWy6oVtN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB2C41F01825;
	Thu, 29 Oct 2026 06:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793254682;
	bh=CUZiPeEFVJSxxMFkU+P+u3zf/t1AvkpQ+KPN37E3S5E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SWy6oVtNioEnsg+Gf2KCK1LjmWuhqrKe7nLpCpWqyD7iLSNM/5nMWNzuK4MDE4knm
	 uRPCnuAlwoxgNN2EMwtAyiNBDCJnN9bknEKVq/H/7nHmLgrblqFKh2QMA+ybMONgeF
	 QM97o+D+7RBMnxi/TKP3hyCyDtQzfxbK7dL0Z4qoD8kDFMt1cCEy1hQ1XWnbFmkyNy
	 jEN2O9TC3DpGcFiDHYnsjPEnTsG9w4gvr9LPiDadXHLkGtwDcHJtMnOsFFKAqjUi2c
	 NEIDVGi7oh2eP+ht1TI1kBJKAAdu4QGy+oPOBK1hbvMRH3mLXHkPlOvd1C6/JZ61j9
	 qeB0drtNSfAwA==
Message-ID: <sashiko-outbox-188803@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ALSA: hda/realtek: Add speaker depop sequence to
 alc225_shutup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhang Heng" <zhangheng@kylinos.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261029055945.188723-1-zhangheng@kylinos.cn>
References: <20261029055945.188723-1-zhangheng@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 06:18:02 +0000
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
- [Medium] ALSA: hda/realtek: alc225_shutup() ignores spec->no_shutup_pins =
on speakers
- [Medium] ALSA: hda/realtek: alc225_shutup() misses auto_cfg_speaker_pins(=
) and sleeps
--

commit bcfd970890c43a9ca0666614579d8a6c2d5603c7
Author: Zhang Heng <zhangheng@kylinos.cn>

ALSA: hda/realtek: Add speaker depop sequence to alc225_shutup

This commit mutes speaker pins and disables their pin widgets with 75 ms
delays before cutting EAPD in alc225_shutup() to prevent pop noise on
suspend.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221616

> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek=
/alc269.c
> index 23329d5887a56..67ce5b130f81f 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -665,6 +665,7 @@ static void alc225_shutup(struct hda_codec *codec)
>  	struct alc_spec *spec =3D codec->spec;
>  	hda_nid_t hp_pin =3D alc_get_hp_pin(spec);
>  	bool hp1_pin_sense, hp2_pin_sense;
> +	int i;
> =20
>  	if (!hp_pin)
>  		hp_pin =3D 0x21;
> @@ -698,6 +699,16 @@ static void alc225_shutup(struct hda_codec *codec)
>  		alc_update_coef_idx(codec, 0x4a, 3 << 10, 0);
>  		alc_enable_headset_jack_key(codec);
>  	}
> +
> +	for (i =3D 0; i < spec->gen.autocfg.speaker_outs; i++)
> +		snd_hda_codec_write(codec, spec->gen.autocfg.speaker_pins[i], 0,
> +				    AC_VERB_SET_AMP_GAIN_MUTE, AMP_OUT_MUTE);
> +	msleep(75);
> +	for (i =3D 0; i < spec->gen.autocfg.speaker_outs; i++)
> +		snd_hda_codec_write(codec, spec->gen.autocfg.speaker_pins[i], 0,
> +				    AC_VERB_SET_PIN_WIDGET_CONTROL, 0x0);

[Severity: Medium]
Should this loop check !spec->no_shutup_pins before clearing
AC_VERB_SET_PIN_WIDGET_CONTROL on spec->gen.autocfg.speaker_pins[i]?

Previously, alc225_shutup() only cleared speaker pin widget controls via
alc_shutup_pins() in sound/hda/codecs/realtek/realtek.c:

void alc_shutup_pins(struct hda_codec *codec)
{
	struct alc_spec *spec =3D codec->spec;

	if (spec->no_shutup_pins)
		return;

Other shutup callbacks in sound/hda/codecs/realtek/alc269.c, such as
alc256_shutup(), alc282_shutup(), alc283_shutup(), and alc_default_shutup(),
also guard AC_VERB_SET_PIN_WIDGET_CONTROL =3D 0x0 writes with
if (!spec->no_shutup_pins).

Several quirks for codecs using alc225_shutup() (such as ALC285, ALC287, and
ALC295) set spec->no_shutup_pins via alc_fixup_no_shutup(), including
alc_fixup_thinkpad_acpi() and alc295_fixup_dell_inspiron_top_speakers().
When hda_call_codec_suspend() -> alc269_suspend() -> alc_suspend() ->
alc_shutup() -> alc225_shutup() runs on those machines, clearing the speaker
pin widget controls unconditionally bypasses the no_shutup_pins quirk while
alc_shutup_pins() still returns early without setting codec->pins_shutup, so
restore_shutup_pins() will also skip restoring the pins on early resume.

> +	msleep(75);

[Severity: Medium]
What happens in alc225_shutup() when spec->gen.autocfg.speaker_outs is 0, or
when the speaker pins were moved to line_out_pins by
snd_hda_parse_pin_defcfg()?

In sound/hda/common/auto_parser.c, snd_hda_parse_pin_defcfg() moves
speaker_pins into line_out_pins when no line-out pins are present:

		if (cfg->speaker_outs) {
			cfg->line_outs =3D cfg->speaker_outs;
			memcpy(cfg->line_out_pins, cfg->speaker_pins,
			       sizeof(cfg->speaker_pins));
			cfg->speaker_outs =3D 0;
			memset(cfg->speaker_pins, 0, sizeof(cfg->speaker_pins));
			cfg->line_out_type =3D AUTO_PIN_SPEAKER_OUT;
		}

And in sound/hda/codecs/generic.c, check_auto_mute_availability() only copi=
es
them back to speaker_pins if at least two different output types are present
and suppress_auto_mute is not set. Otherwise, speaker_outs remains 0 while =
the
speaker pins reside in line_out_pins.

Furthermore, because both msleep(75) calls run outside any speaker count
check, systems with no speakers (or with speaker_outs =3D=3D 0) will still =
incur
150 ms of unconditional sleep on every runtime PM and system suspend.

Would it make sense to use auto_cfg_speaker_outs() and
auto_cfg_speaker_pins() from sound/hda/common/hda_auto_parser.h (similar to
snd_hda_gen_shutup_speakers()), and only run the msleep(75) delays when the=
re
are speaker pins to shut up?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029055945.1887=
23-1-zhangheng@kylinos.cn?part=3D1
