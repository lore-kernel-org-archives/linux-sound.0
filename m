Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749527;
	b=HPleHgc70Jo+b7RodzohUhaf37/N1yMRBBUkbpdfi9SK2fOzIKeYrJcIuU7RyhgBMAnX
	 meyp2hzrzc6PVxZk0J2xBVr6KPg5M/yl3ltoHfB+5FxR54NeiDmziY+7gmRhCDn/pZLcZ
	 iRxK7povtvCj8Yvqw3dJfrCvLfm/3HaQFyaCpWZbRxhEtF7Kna8FJQltY/8pEs2RYcP/a
	 7N0K3fMfAPsiPJgNoCk6TL4lDUitiwg44oGSDzFsjkq0NkL0J7jB14a0HjBCLpe5QPjMh
	 dap+HXROFJr0AHz1ChBMiHVyT9Ara9Qy4vU8Hdc8MT3onsSPqjLcrmuF5dIVUyTcBeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749527;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xkHz4vxH+Z4yHGdgyrUpQKMyrGOHr8hBeMIbQWYvJQs=;
	b=phvEf87RhBuiKU1mFJujyachCIOJq6LrGHvgBeUuOKbQQHig75EZ0e121XvMmnHqN5DO
	 0uySkNQPhWSm9DtYWn02wng8gbUo09TR3PAFIdH8KPFsMII/laQLCUUE6zjnhwE0qPKUZ
	 WsYiaR0kOl7l0GVVm331jfabtv21gT3bUqB4rAOYKnmgERbfnIsDVktn8tKlqB6j/2NhK
	 PGzGsU2NHYjJL86WOXXyOrKkNIOd35IoT+QiPlW9XFJ9oPklWXJoWQUmnaRlIuiu8xrDH
	 8amKuMyI9M2QP4DWSF/w/eUDKDIpGUQLC/4EYbQpN8Tlzqe1qwY/dAqGImvMpVKSfGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VUzrMGGM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FC7606A31D
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 13:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VUzrMGGM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E81F1F000C4;
	Sun, 15 Nov 2026 13:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794749527;
	bh=xkHz4vxH+Z4yHGdgyrUpQKMyrGOHr8hBeMIbQWYvJQs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VUzrMGGMlhNhML6v6kdo9L+DsrjOWZubOaHKA++EZxT3+GPidx2MCyMh0IrYu5sgh
	 38nE2r3RI85/GPtOylfA9hDqdY8aTl+haKEeZH6M3Zs9FpUFoInXyc/4TF55lwyef6
	 0V80djApvkMYLjcpehdVio74me6E2iIIqdM3lw1ENBXTdlvbVsRV0n52xuyuhIUD9U
	 0INjjVzXZO710g/d0Z9ik2XdGH3PV+iq2u96zNprHh9k5h7ZE0PaYO1V8K2hgknA/F
	 fBzDCfCdj72c4/Nr+1mCTTT/Xzq9IwskG+w34YCXgo68BdUaWAN/wexKvFCrXXPJwG
	 RIfNqWvpzv55g==
Message-ID: <sashiko-outbox-215527@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] ALSA: hda/realtek: fix missing chained flag in
 fixup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sungwoo Kim" <iam@sung-woo.kim>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261115132215.4084031-2-iam@sung-woo.kim>
References: <20261115132215.4084031-2-iam@sung-woo.kim>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 13:32:06 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] ALSA: hda/realtek: chaining ALC269_FIXUP_DMIC clobbers board
  pin configs
--

commit c0d3245c2b82a623907d3583db3347a65c5b33dc
Author: Sungwoo Kim <iam@sung-woo.kim>

ALSA: hda/realtek: fix missing chained flag in fixup

This commit sets .chained =3D true on five Loongson-3 pin fixup entries in
alc269_fixups[] that specify .chain_id =3D ALC269_FIXUP_DMIC.

> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek=
/alc269.c
> index 96fa8c2782bb4..1be2e609c28d0 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -6431,6 +6431,7 @@ static const struct hda_fixup alc269_fixups[] =3D {
>  			{ 0x1e, 0x411111f0 },
>  			{ }
>  		},
> +		.chained =3D true,
>  		.chain_id =3D ALC269_FIXUP_DMIC,
>  	},
>  	[ALC269_FIXUP_CZC_TMI] =3D {
> @@ -6449,6 +6450,7 @@ static const struct hda_fixup alc269_fixups[] =3D {
>  			{ 0x20, 0x8000ffff },
>  			{ }
>  		},
> +		.chained =3D true,
>  		.chain_id =3D ALC269_FIXUP_DMIC,
>  	},
>  	[ALC269_FIXUP_CZC_L101] =3D {
> @@ -6467,6 +6469,7 @@ static const struct hda_fixup alc269_fixups[] =3D {
>  			{ 0x1e, 0x411111f0 },
>  			{ }
>  		},
> +		.chained =3D true,
>  		.chain_id =3D ALC269_FIXUP_DMIC,
>  	},
>  	[ALC269_FIXUP_LEMOTE_A1802] =3D {
> @@ -6485,6 +6488,7 @@ static const struct hda_fixup alc269_fixups[] =3D {
>  			{ 0x21, 0x03214020 },
>  			{ }
>  		},
> +		.chained =3D true,
>  		.chain_id =3D ALC269_FIXUP_DMIC,
>  	},
>  	[ALC269_FIXUP_LEMOTE_A190X] =3D {
> @@ -6497,6 +6501,7 @@ static const struct hda_fixup alc269_fixups[] =3D {
>  			{ 0x1b, 0x0201401f }, /* front lineout */
>  			{ }
>  		},
> +		.chained =3D true,
>  		.chain_id =3D ALC269_FIXUP_DMIC,
>  	},
>  	[ALC256_FIXUP_INTEL_NUC8_RUGGED] =3D {

[Severity: High]
Does chaining ALC269_FIXUP_DMIC here overwrite the board-specific pin
configurations on all five machines?

sound/hda/codecs/realtek/alc269.c:alc269_fixups[] {
	[ALC269_FIXUP_DMIC] =3D {
		.type =3D HDA_FIXUP_PINS,
		.v.pins =3D (const struct hda_pintbl[]) {
			{ 0x12, 0x99a3092f }, /* int-mic */
			{ 0x14, 0x99130110 }, /* speaker */
			{ 0x15, 0x0121401f }, /* HP out */
			{ 0x18, 0x01a19c20 }, /* mic */
			{ }
		},
	},
}

When __snd_hda_apply_fixup() applies ALC269_FIXUP_DMIC after the primary
fixup, snd_hda_add_pincfg() replaces any existing pin config for the same
NID in codec->driver_pins.  For example, in ALC269_FIXUP_CZC_L101, pins
0x12 and 0x15 are disabled because headphone out is on 0x1b and 0x14 is
an external line-out jack, so running ALC269_FIXUP_DMIC re-enables 0x12
and 0x15 and turns 0x14 into an internal speaker.

The unused .chain_id =3D ALC269_FIXUP_DMIC initializers appear to be
copy-paste remnants from commit f1ec5be17b9a ("ALSA: hda/realtek: Add
alc269/alc662 pin-tables for Loongson-3 laptops") and should be removed
instead of enabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115132215.4084=
031-2-iam@sung-woo.kim?part=3D1
