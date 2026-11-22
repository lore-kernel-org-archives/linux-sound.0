Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378254;
	b=TUui1J1wrETqplSxvX0i6Y9+HbDQ2L5watdH+bkgr2JhVFUbNV72hAqk00lOFwS3YXgN
	 M86vax/kzaChaKRV2UtXBGVXo5BlSPq0XxP9LZt1JJYWTQRmdVihWcc65suf8H6upctiE
	 FHPNxg1pEafy+vNtdjt/Z1QeGsvZ+/ktMI1bCw1/9eI6JFZdbwbJCOp36VXggPdNkUgUu
	 iFNAAZOq84dF9gGGqj19ksW4N2B7N04AsQyc/ZWBJIgsXWvInSSR3oHm/LQ2IO/UMvYh+
	 ShKPpNMQ8QqTAIFbYMLOlSmEn8/SBWZLjh/cBjiUCHI811WPlabv5uT6Onrvzs2z1bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378254;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3SCwB9gjboiaFQOjcUOZpy5EViJft48SYBNMJPGk01M=;
	b=teaB7gqudFaMC+b5ALUuGLRBR9NoqdPyAEne3QkKLA49BK357V+hVTC1neuT4Da+xI5j
	 F5rf+X++tlDnI+mDkEAAvcsPhi+wDn9ncnCUN/mes/3MKDENLGzr37JP6Rcywtd0M9uUu
	 3YtTm2jy5Gm2cgyi4xcDTOpiIoEIlkrs7uMTt5z+XNWKRgrGXKjznYbA0BFfeFCZE/UJT
	 KL9i2Jpitt0q322oVuUtOmBKN+oj+MQTBNRzcf8LTzOWLyKE3w1rHeUlVX+FxKP4pXlw3
	 6VJi1fHKppF3z86qmkMxeAEfvR6ODBlqGO7WybR8JFJz3gm8RxgiM6GXVbjsrTRqDGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nJhI2RK+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67ED606A31E;
	Sun, 22 Nov 2026 20:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nJhI2RK+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B3E1F000C6;
	Sun, 22 Nov 2026 20:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795378253;
	bh=3SCwB9gjboiaFQOjcUOZpy5EViJft48SYBNMJPGk01M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nJhI2RK+uJ2DjKI+edqSGBFqfAhORH0RvPa+kyhS82zTc2L2YF4wCxJJzL0anTnno
	 mUak9/Qk8XFSrXInloeh/VFip+U+hFH7MJNbhjKogN7h8M1KXXmdI8Dv7l+zf+g4Ah
	 SzeiBzAIUTcm3fZAIrVjACMvXDlRc9iaOJaR7V3y1nfQM3Z6AZpIvRl/k8GhTS4wfr
	 N5Ib0njckQjBkeucP69WZnudCD9bUR5bTh2Gge+IaiktfSjZyuGO7XrwQC8X2r0rup
	 hQwXAYEIYx/ZhASv6wN9XnTHKXWNBAAACMTnf6C0cHOgUYyRvMaR4o7ZYO5KylylcY
	 Eyw0EYW8bnS9g==
Message-ID: <sashiko-outbox-228310@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/5] ASoC: qcom: sc8280xp: add Shikra backend
 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-shikra-machine-v3-2-e5d074264428@oss.qualcomm.com>
References: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
 <20261123-shikra-machine-v3-2-e5d074264428@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 20:10:52 +0000
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
- [Medium] ASoC: qcom: sc8280xp: num_codecs check in
  sc8280xp_add_be_ops() matches FEs
--

commit c0216a2b49790ae6ec3eaaa0b8959c3342929be7
Author: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

ASoC: qcom: sc8280xp: add Shikra backend handling

This commit adds per-DAI CPU format overrides, VA_CODEC_DMA_TX_1 handling,
and an option to attach backend operations to codec-backed links on
sc8280xp sound cards.

> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index ac4dfb2c2182c..ff8ccd3065eb9 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
[ ... ]
> @@ -540,11 +549,13 @@ static const struct snd_soc_ops sc8280xp_be_ops =3D=
 {
> =20
>  static void sc8280xp_add_be_ops(struct snd_soc_card *card)
>  {
> +	struct sc8280xp_snd_data *data =3D snd_soc_card_get_drvdata(card);
>  	struct snd_soc_dai_link *link;
>  	int i;
> =20
>  	for_each_card_prelinks(card, i, link) {
> -		if (link->no_pcm =3D=3D 1) {
> +		if (link->no_pcm =3D=3D 1 ||
> +		    (data->priv->codec_link_be_ops && link->num_codecs > 0)) {
>  			link->init =3D sc8280xp_snd_init;
>  			link->exit =3D sc8280xp_snd_exit;
>  			link->be_hw_params_fixup =3D sc8280xp_be_hw_params_fixup;

[Severity: Medium]
Does checking link->num_codecs > 0 attach backend ops to codeless DPCM
frontend links as well?

card->dai_link is populated by qcom_snd_parse_of(), which sets
num_codecs =3D 1 on DPCM frontend links using the dummy codec:

sound/soc/qcom/common.c:qcom_snd_parse_of() {
    ...
		if (codec) {
			ret =3D snd_soc_of_get_dai_link_codecs(dev, codec, link);
			if (ret < 0) {
				dev_err_probe(card->dev, ret,
					      "%s: codec dai not found\n", link->name);
				goto err;
			}

			if (platform) {
				/* DPCM backend */
				link->no_pcm =3D 1;
				link->ignore_pmdown_time =3D 1;
			}
		} else {
			/* DPCM frontend */
			link->codecs	 =3D &snd_soc_dummy_dlc;
			link->num_codecs =3D 1;
			link->dynamic =3D 1;
		}
    ...
}

Because num_codecs is at least 1 for every link, enabling
codec_link_be_ops attaches sc8280xp_be_ops to DPCM frontend links too.
If a card defines frontend links whose CPU DAI IDs (such as
MSM_FRONTEND_DAI_MULTIMEDIA3..16) overlap with the SLIMBUS_0_RX..SLIMBUS_6_=
TX
IDs matched by qcom_snd_is_sdw_dai(), opening and closing the frontend
stream calls qcom_snd_sdw_startup() and leaks a struct sdw_stream_runtime
because snd-soc-dummy-dai returns -ENOTSUPP for set_stream and
get_stream.

Checking !link->dynamic (or link->codecs !=3D &snd_soc_dummy_dlc) would
restrict this to links backed by real codecs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-shikra-mac=
hine-v3-0-e5d074264428@oss.qualcomm.com?part=3D2
