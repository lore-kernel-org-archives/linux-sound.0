Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793944346;
	b=mXb2I8zb1BbPwB3kahN4NQ8nl+7IR2+0ihCbLXEfAqlz8FTfh0RR0TCY6/vgEBG1cftg
	 4SM+CL99sfgmwgJoYEy3N0t8+WwZhYB4ykfhUwvwm+h0mRNSdqvzgU4a1Q+BxPUW1+Oov
	 42eMyTHPXjeCTHnxjSxyfSTY4CPX7mSzDxuhTUj2qosUFpLrLjstQWFXLlDQdIDGWmjN5
	 7QsPfB6PVFg0xa8M0jouxyV0Rp7AmRPOfZPE2rgJTf+yLogpus2wXZ8TcK/G1C1H8CXz+
	 6/+cbHgd+07XoWWv7nC37zEgFFXEBMdV1OMJaMlsznvWeZzGx6Mlua15uGWZdrtWISQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793944346;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YWpIsmIykPLzSWAxzMFX1XDXfCULtf7neBLXcWYhBQo=;
	b=IrmODNR5np1ky2ADIhgH71NEM3WTgfraUCVDSqfYXoUC/tyr9hBMAvYM7dHIVYs3VigH
	 h20WG2eTZnIZeJ+RG4zwNl/4bQg2deJILgVkcgnTl8tsA1BeIQH+xqlox5Xk/U2oN/W+R
	 PDIR3Uymo3UsbI6pyCgFRyb3b/ImBUafUiaSvPnv9z5exWAWnuVqVTuU9oMPtKTbijrYX
	 PIyHpcCKqeYvdN22wkvzxS6rTx1wqU1Tx2wdSOn1xi9w+mOyCDfYpcGlu/aAnCZe498Yh
	 KF4kN+T2x80CTctsXcRt9Qv8WIMUeykAU0+Xh6vn1daftFLUZ7uZxxXWzrLO99xpcJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AjrwsBbb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51501606A330
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 05:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AjrwsBbb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0EA01F0089F;
	Fri,  6 Nov 2026 05:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793944345;
	bh=YWpIsmIykPLzSWAxzMFX1XDXfCULtf7neBLXcWYhBQo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AjrwsBbb6jn9gUym9UoDoP7XBF5Z6xF3Pg/QxfXO70jIZNwjhMnJV5Z+SNT2fe6LB
	 Ks1py4NdqTtshwsTexMLUvG1SmM6GYaxYkutFMFyHkP07u9lFBm4QcGaTsMwNUOsWw
	 7LMiAKEHp8vUKCsAnCTTaSjCWPt47VV5JqqC5NciKzhzIEJ77ahtNSVjrje6EwDlPN
	 VCUR/ctoH54I+fUC+uWu/8Cm0EBzEmcEjXHLg4hi07rxpoqQtkW3Ori0kx/JS8DQX0
	 Kny8EgwT5DSMoaE0VVe8XMaURh2q9rOpnZProSoCcvRsymhrNCo5cS0TxSQiaOCp/J
	 guktI7N1+Prog==
Message-ID: <sashiko-outbox-200869@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ASoC: soc-core: copy the DAI link names into the
 card
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tyler Baker" <tyler.baker@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261106054333.2748248-2-tyler.baker@oss.qualcomm.com>
References: <20261106054333.2748248-1-tyler.baker@oss.qualcomm.com>
 <20261106054333.2748248-2-tyler.baker@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 05:52:25 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Medium] ASoC: soc-core: memory leak in snd_soc_of_get_dlc() [1]
--

commit fe7efa2dfe30cec1a0e194d20cca010f7a414abc
Author: Tyler Baker <tyler.baker@oss.qualcomm.com>

ASoC: soc-core: copy the DAI link names into the card

This commit duplicates the component DAI name onto the card device in
snd_soc_of_get_dai_link_codecs() and snd_soc_of_get_dai_link_cpus() so the
name remains valid across component unbind and rebind.

> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index f33bece378b61..0e62965e35aaa 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c

[ ... ]

> @@ -3282,6 +3294,8 @@ int snd_soc_of_get_dai_link_codecs(struct device *d=
ev,
>  	/* Parse the list */
>  	for_each_link_codecs(dai_link, index, component) {
>  		ret =3D snd_soc_of_get_dlc(of_node, NULL, component, index);
> +		if (!ret)
> +			ret =3D snd_soc_of_dup_dai_name(dev, component);
>  		if (ret)
>  			goto err;
>  	}

[Severity: Medium]
This problem wasn't introduced by this patch, but does snd_soc_of_get_dlc()
[1] leak the device_node reference in args->np when snd_soc_get_dlc()
fails?

sound/soc/soc-core.c:snd_soc_of_get_dlc() {
	if (!args)
		args =3D &__args;

	ret =3D of_parse_phandle_with_args(of_node, "sound-dai",
					 "#sound-dai-cells", index, args);
	if (ret)
		return ret;

	return snd_soc_get_dlc(args, dlc);
}

of_parse_phandle_with_args() acquires a reference on args->np, which
snd_soc_get_dlc() only transfers to dlc->of_node on success.  When
snd_soc_get_dlc() fails (for example with -EPROBE_DEFER) and the caller
passed a NULL args pointer as done here and in
snd_soc_of_get_dai_link_cpus(), __args goes out of scope without
of_node_put() being called.

[1] https://sashiko.dev/#/bug/linux-11ae6ad5-0cce-4928-9290-e7723e9f7638

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106054333.2748=
248-1-tyler.baker@oss.qualcomm.com?part=3D1
