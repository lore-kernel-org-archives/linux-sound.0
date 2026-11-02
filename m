Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793645060;
	b=1UK7HIAnEczc9Zz01ts1KCmWP7mKagPtO5JURkDwaMvDdfJLfkGdNkRtqT+pqrFDs7il
	 J+CamQv41ICNaI+dZP6F1VLG32289D/4Fuf9lS7ebuOb+A7zfb5OdIiQnXylJxYmPb6rJ
	 9sEEeYad8LEbiacG5+LNyLNGPILpZ0MvDW2HLVag/ggR9h/XEx6ahu5Kz+HfZiQYLrEHn
	 MkShdmxpwZIbZViHzTC3hpsbjhJWyXm34Niaa65CBAUrrOojvRaHOY11Mg/S1Gqbj2APg
	 X+i5HkDT4T2+/D/7b94arTjtXhxUJtBelUF6taAqcU++H8IIpcoDeu3SClhVmofDk2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793645060;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=b6kQ148Fy4zUHUl+hEaZbpz2v7bvJXvEYEphJchoBcM=;
	b=gys3x0Qsu1bwwFI1YudPhXpBpWbbj9Kjz1UvMh/tFxSKrLNHpIMWcS36Xx+dOc0rxCv5
	 vlL0jZMvq05TzaG6jVhosLtsCRfUSlKcwrNK8B9MMA0vwwRTmgPRPffTQNJSVu8GR7yTm
	 xFoyM6vVgZiHf/xO6x4bjX80eFkfpupoeHjqP/ueyT1FQSadnmVKrlYl9BTPpLvO0xQAC
	 mjH+hY7iZ6jQii7cwkvuBhOdjPQ0Dc71vsAsva9Suzs32BzHKOi1C4Lbo5B89bHIzxhm9
	 bjvLVGflYYp6No+rLi5SJ6TgkoQoBzfM0mQEzW6M+G5SzMuXwfY+Ox6KTUo8r6wVEvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dL83H1CS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ACB606A324
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 18:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dL83H1CS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A712B1F00A16;
	Mon,  2 Nov 2026 18:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793645059;
	bh=b6kQ148Fy4zUHUl+hEaZbpz2v7bvJXvEYEphJchoBcM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dL83H1CSb+l5Y5Cy260LKmw/xWZ0KMZ+bWN7oDQD3u3gDxydbWazboM5Rqj8YqxT0
	 WUbfYdv4izHYjOR71nSvG58icMilRP8xGlqI6WMRzygXKpyoPByk2rdU8UK8CeQOAu
	 +41hce4rFaW1IPrKJ2KTOcfUp3lIykzX/bwyDY3LtDbeJsCaabC9G7YP+8o9Wig7Hn
	 AVmmzOyzc5aiNu4t0fxHiCJEea0g55sSDhwoMux0H4IdclBFCLoVKNfcXrq0fDIkan
	 aiziDW310DyikKGiHSD0JdfOj4yVY9WwMx1QXYaxS6UelKVqqT8cRKH6QKUdRRlymU
	 YxAWSyj/BGWVA==
Message-ID: <sashiko-outbox-193962@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: hda/hdmi: Don't share an assigned converter on
 NVIDIA codecs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Razvan Dinculescu" <razvandinculescu@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261102182213.2154560-1-razvandinculescu@gmail.com>
References: <20261102182213.2154560-1-razvandinculescu@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 18:44:19 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ALSA: hda/hdmi: missing active pin mux verification in nvhdmi_pi=
n_cvt_fixup()
--

commit ee77c613ae50ec059d4a1e50bc80fe9f42246e54
Author: Razvan Dinculescu <razvandinculescu@gmail.com>

ALSA: hda/hdmi: Don't share an assigned converter on NVIDIA codecs

This commit implements the pin_cvt_fixup callback for generic NVIDIA HDMI/DP
codecs to move other connected pins off a newly assigned converter so idle
pins do not steal the active audio stream.

> diff --git a/sound/hda/codecs/hdmi/nvhdmi.c b/sound/hda/codecs/hdmi/nvhdm=
i.c
> index 94671ad24b5eb..95ae7730eed5b 100644
> --- a/sound/hda/codecs/hdmi/nvhdmi.c
> +++ b/sound/hda/codecs/hdmi/nvhdmi.c
> @@ -66,6 +66,81 @@ static const struct drm_audio_component_audio_ops nvhd=
mi_audio_ops =3D {
>  	.master_unbind =3D snd_hda_hdmi_acomp_master_unbind,
>  };
> =20
> +/*
> + * All pins of these codecs share one connection list, as on Intel.  An =
idle
> + * pin left selecting the converter that another pin streams on takes th=
at
> + * stream: the display that plays stays silent and the audio goes to the
> + * other display instead.  Seen on GB202 (0x10de00aa) with an HDMI TV an=
d a
> + * DP monitor: whenever the monitor's PCM was opened first (PipeWire pro=
bes
> + * every PCM at start-up), its pin kept the converter the TV got next.
> + *
> + * Move every other connected pin off the converter just assigned, to a
> + * converter nobody uses.
> + */
> +static void nvhdmi_not_share_assigned_cvt(struct hda_codec *codec,
> +					  hda_nid_t pin_nid, int dev_id,
> +					  hda_nid_t cvt_nid)
> +{

[ ... ]

> +}
> +
> +static void nvhdmi_pin_cvt_fixup(struct hda_codec *codec,
> +				 struct hdmi_spec_per_pin *per_pin,
> +				 hda_nid_t cvt_nid)
> +{
> +	if (per_pin)
> +		nvhdmi_not_share_assigned_cvt(codec, per_pin->pin_nid,
> +					      per_pin->dev_id, per_pin->cvt_nid);
> +	else
> +		nvhdmi_not_share_assigned_cvt(codec, 0, 0, cvt_nid);
> +}

[Severity: Medium]
Should nvhdmi_pin_cvt_fixup() also select per_pin->dev_id and verify that
per_pin's own AC_VERB_GET_CONNECT_SEL matches per_pin->mux_idx when per_pin
is non-NULL?

In sound/hda/codecs/hdmi/hdmi.c, snd_hda_hdmi_generic_pcm_prepare() does not
write AC_VERB_SET_CONNECT_SEL directly; it relies on pin_cvt_fixup() to
verify and restore the active pin's converter selection (for example, after
S3 resume or a display reset where hardware resets pin converter selections
to the default converter):

sound/hda/codecs/hdmi/hdmi.c:snd_hda_hdmi_generic_pcm_prepare() {
	...
	/* Verify pin:cvt selections to avoid silent audio after S3.
	 * After S3, the audio driver restores pin:cvt selections
	 * but this can happen before gfx is ready and such selection
	 * is overlooked by HW. Thus multiple pins can share a same
	 * default converter and mute control will affect each other,
	 * which can cause a resumed audio playback become silent
	 * after S3.
	 */
	pin_cvt_fixup(codec, per_pin, 0);
	...
}

On Intel codecs, i915_pin_cvt_fixup() in sound/hda/codecs/hdmi/intelhdmi.c
selects per_pin->dev_id and calls intel_verify_pin_cvt_connect() to restore
per_pin->mux_idx before moving other pins off the converter:

sound/hda/codecs/hdmi/intelhdmi.c:i915_pin_cvt_fixup() {
	if (per_pin) {
		haswell_verify_D0(codec, per_pin->cvt_nid, per_pin->pin_nid);
		snd_hda_set_dev_select(codec, per_pin->pin_nid,
			       per_pin->dev_id);
		intel_verify_pin_cvt_connect(codec, per_pin);
		intel_not_share_assigned_cvt(codec, per_pin->pin_nid,
				     per_pin->dev_id, per_pin->mux_idx);
	} else {
		intel_not_share_assigned_cvt_nid(codec, 0, 0, cvt_nid);
	}
}

Because nvhdmi_pin_cvt_fixup() only calls nvhdmi_not_share_assigned_cvt() a=
nd
skips per_pin itself, if hardware resets pin connections while two PCMs are
open (say pin A assigned to converter 0x08 and pin B assigned to converter
0x09, with both reset in hardware to 0x08), preparing pin A first will cause
nvhdmi_not_share_assigned_cvt() to move pin B to an unassigned converter
(such as 0x0a, since 0x09 is marked assigned), and preparing pin B next will
never restore pin B's AC_VERB_SET_CONNECT_SEL back to per_pin->mux_idx for
converter 0x09.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102182213.2154=
560-1-razvandinculescu@gmail.com?part=3D1
