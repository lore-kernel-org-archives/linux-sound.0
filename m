Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794051029;
	b=yqzqb0hgm2vmqqRwkOnp+8xIQOz06ryHeMKWXbwhGmSDphrlvNwh6vw5RgTWt433p32C
	 Wm1b4rgIM/W4dOJ+kFEzlzAZMBBzn6InSae1J7mEMMAB6BaIfP1pZLA7tN//1JvG0RJk8
	 w/bpWcVZxFb1vDshMOnePfKfB2in0nltMYcLFziblLawqFYuXLvUpUpSy+n18BL048lk/
	 1xsQpQcjkxQThlqavhTwi/6VOHs3VFyW5opRBL/keVnFXKDzDeZVbmTAOqQbmonQ2HQmf
	 wG36dDkcG/6N7c0qQVguT/gM9Oc09TCp1o4RK1HOI9xJx43My+16prRAueu4x0RypLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794051029;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LVW8QJJzAYiWqg2mJe7i6sVeplqHP06zFBAagEtRabU=;
	b=acLha2/wBfiJ1sCvjbCml0UtrxaimSdFChbHc6vEf/u9qAtXFxjjKj+hpiuvsyF2pMc4
	 MvtogwfZtn9y34OrWhgt+ZFgr3eJtCBCF6iPdSzwbn4U8AUdV/pMFZNKe+f3VP1w5QU5k
	 FumHGDDXwh21jTVGYqWxHYYTEJMfIIl743joPHGU0X5CBYZL+TzJOKX0dEClZ+7vy3jDp
	 xEG4njUkPz9J/KgfoBHfnpyhZVqila5+95ejNygsXIjw+XeWH1vaD7WZLvnPIua+34HgB
	 l+Bth9cSKyfB3OiMeiY5ajpEE8xdcFZ9Nig3AZwgbRdhr04dF1klP8+rEoFS/61t2rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="cUkwv/A8";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FF3606A32C
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 11:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cUkwv/A8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C101F0089F;
	Sat,  7 Nov 2026 11:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794051029;
	bh=LVW8QJJzAYiWqg2mJe7i6sVeplqHP06zFBAagEtRabU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cUkwv/A8oiTXgVv07wk0y1PtEjlXWumPBMArsWeNXeoETAjL7AiRqyfLMxYH2dw6H
	 5/qghbtPWSvejzNMsTOpo6FP1y2WMv/k19lyoek+QspjWL7HXu01SwRisjiHVfBrVB
	 mFwZpUqZAsort1sDVpQnNFV+eNNMiH/g1n0zsJGW1c+NGhoWzswudkx82nrq9kBYqw
	 OLklkoxqYi32ESblcBVimR4ngNUi2cL/P5thchDV3Y+n4ghxTi9iDCEWvUKvOUcBTZ
	 mNceqo7TaM8Wkx4CmzEn4fcmNYCWBAuyghTerfwY6jNYVwxOZ7fKinIYjmMxSsJREG
	 66e6gbVGQ1NFA==
Message-ID: <sashiko-outbox-202855@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ALSA: ump: clear stale selectors in sequencer
 conversion
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alyandra Zahran Nadhir" <alyandra5b@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261107111056.667-2-alyandra5b@gmail.com>
References: <20261107111056.667-1-alyandra5b@gmail.com>
 <20261107111056.667-2-alyandra5b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 11:30:28 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] ALSA: seq: SND_SEQ_UMP_KUNIT_TEST depends on KUNIT instead of
  KUNIT=3Dy
- [Medium] ALSA: ump: stale RPN/NRPN MSB/LSB bytes kept on selector
  switch in cc_ev_to_ump_midi2()
- [Low] ALSA: seq: missing Fixes trailer for stale RPN/NRPN selector fix
--

commit 7687b62a51dd971356b5f3418762bb460cd2266c
Author: Alyandra Zahran Nadhir <alyandra5b@gmail.com>

> ALSA: ump: clear stale selectors in sequencer conversion
>
> The sequencer MIDI 2.0 converter tracks RPN and NRPN selection flags
> separately. When the controller stream switches selector type, the
> previous flag remains set; fill_rpn() checks RPN first and can encode
> subsequent NRPN data as RPN.
>
> Flush pending parameter data with the old selector, then clear the
> opposite selector before recording new state in both CC and Control14
> event paths. Add KUnit coverage for both transition directions,
> pending flushes, null RPN, channel isolation, and MIDI 1.0 conversion.
>
> Signed-off-by: Alyandra Zahran Nadhir <alyandra5b@gmail.com>

[Severity: Low]
Should this bug fix include a Fixes tag?

  Fixes: e9e02819a98a ("ALSA: seq: Automatic conversion of UMP events")

> diff --git a/sound/core/seq/Kconfig b/sound/core/seq/Kconfig
> index 0d606159103e7..8c08888902a92 100644
> --- a/sound/core/seq/Kconfig
> +++ b/sound/core/seq/Kconfig
> @@ -76,4 +76,16 @@ config SND_SEQ_UMP
>  config SND_SEQ_UMP_CLIENT
>  	def_tristate SND_UMP && SND_SEQ_UMP
> =20
> +config SND_SEQ_UMP_KUNIT_TEST
> +	bool "KUnit tests for ALSA sequencer UMP conversion" if !KUNIT_ALL_TESTS
> +	depends on KUNIT
> +	depends on SND_SEQUENCER=3Dy && SND_SEQ_UMP
> +	depends on SND_UMP=3Dy && SND_UMP_LEGACY_RAWMIDI
> +	default KUNIT_ALL_TESTS

[Severity: Medium]
Does SND_SEQ_UMP_KUNIT_TEST need to depend on KUNIT=3Dy instead of KUNIT?

SND_SEQ_UMP_KUNIT_TEST is a bool option compiled into built-in
seq_ump_convert.o (since SND_SEQUENCER=3Dy and SND_UMP=3Dy are required).
When CONFIG_KUNIT=3Dm and CONFIG_SND_SEQ_UMP_KUNIT_TEST=3Dy, linking vmlinux
fails with undefined references to kunit_kmalloc_array() and the KUnit
assertion helpers residing in kunit.ko.

[ ... ]

> diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_co=
nvert.c
> index ff4ee26adad1f..5e40711303efb 100644
> --- a/sound/core/seq/seq_ump_convert.c
> +++ b/sound/core/seq/seq_ump_convert.c
[ ... ]
> @@ -847,6 +851,7 @@ static int cc_ev_to_ump_midi2(const struct snd_seq_ev=
ent *event,
>  	switch (index) {
>  	case UMP_CC_RPN_MSB:
>  		ret =3D fill_rpn(cc, data, channel, true);
> +		cc->nrpn_set =3D 0;
>  		cc->rpn_set =3D 1;
>  		cc->cc_rpn_msb =3D val;
>  		if (cc->cc_rpn_msb =3D=3D 0x7f && cc->cc_rpn_lsb =3D=3D 0x7f)
>  			reset_rpn(cc);
>  		break;
>  	case UMP_CC_RPN_LSB:
>  		ret =3D fill_rpn(cc, data, channel, true);
> +		cc->nrpn_set =3D 0;
>  		cc->rpn_set =3D 1;
>  		cc->cc_rpn_lsb =3D val;
>  		if (cc->cc_rpn_msb =3D=3D 0x7f && cc->cc_rpn_lsb =3D=3D 0x7f)
>  			reset_rpn(cc);
>  		break;
>  	case UMP_CC_NRPN_MSB:
>  		ret =3D fill_rpn(cc, data, channel, true);
> +		cc->rpn_set =3D 0;
>  		cc->nrpn_set =3D 1;
>  		cc->cc_nrpn_msb =3D val;
>  		break;
>  	case UMP_CC_NRPN_LSB:
>  		ret =3D fill_rpn(cc, data, channel, true);
> +		cc->rpn_set =3D 0;
>  		cc->nrpn_set =3D 1;
>  		cc->cc_nrpn_lsb =3D val;
>  		break;

[Severity: Medium]
Can switching between RPN and NRPN in cc_ev_to_ump_midi2() still leave
stale cc_rpn_msb/cc_rpn_lsb and cc_nrpn_msb/cc_nrpn_lsb values behind?

When no data bytes are pending, fill_rpn() returns early without calling
reset_rpn(), and clearing only rpn_set or nrpn_set leaves the opposite
selector's MSB/LSB bytes intact (and reset_rpn() itself never clears
cc_nrpn_msb or cc_nrpn_lsb).

If a channel sets cc_rpn_lsb =3D 0x7f (such as RPN 0x00:0x7f) without
sending data, switches to NRPN, and later sends a two-message Null RPN
(UMP_CC_RPN_MSB =3D 0x7f followed by UMP_CC_RPN_LSB =3D 0x7f), the first
message sees cc_rpn_msb =3D=3D 0x7f and the stale cc_rpn_lsb =3D=3D 0x7f an=
d calls
reset_rpn() prematurely.  The second message (UMP_CC_RPN_LSB =3D 0x7f) then
sets rpn_set =3D 1 and cc_rpn_lsb =3D 0x7f with cc_rpn_msb =3D=3D 0, leavin=
g RPN
0x00:0x7f active instead of deselecting parameters.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107111056.667-=
1-alyandra5b@gmail.com?part=3D2
