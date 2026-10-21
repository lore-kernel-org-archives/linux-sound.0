Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792618537;
	b=ua2SS78tcuAMKIl5HGgIHFqA5zRwIJEtHLA0/Mn+0WczLUYdphaXnXDrmmQ/sfAFuDM0
	 X15hKUTHGW1kSNQvqI5gGIRgxU8x1PcHJFxURxf27oFDJ5lX6hWf7fmmy+ajFUfA+N/Y6
	 TElWo2i9gLTghvVIRZ6idlEXgwkyBhjnW13XG6lP6Gx5UFtcUNFM9n2ByYvw+MJkrK5m3
	 +FL8O7/djU3W+FRzW7ZCt/iBMzJRppYDZfuW+nBl3or+16r93XxqA/k6/Zc7l9uc168I6
	 D+1bWL2SOsgRpdvrVH4ci4MOeGdXb13zgwQMduDb51PK33ntO5YWJrjfztDu23LErTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792618537;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yyzCYPa+BQPr6y1YEXJetzJwEFpfQFLDJOrTLkaINIM=;
	b=j3oTpGQN2OLseNxHVmU/gozJ9VQsVWxj/VSWBveFm44l3z9vVtnfXCFjuiC/Pogn0q16
	 F7oOYWkXNEIhXFqfNOGZy8Z3RqPejyi8wwBZ0V6a50QIVPlBOlUsu9SpdQpWL2MxBRuNY
	 ivUDvJ/gxUer5sX6WOuHgtAjCKJipeG8hc5hv7T0sE6flfKhraxRyNmWWy6NPobTsCZ97
	 56Ugt+USAF22rf08ahlgNQQQrpFc+oM7ZruB9NhtjY+uEHEtHoLY1Wel988VTpGIESBzR
	 o17dp01lAv6l2btzatD76fGwDkDmp/wKPCOydQGint/85kqOuUrnW58s7Ij/MIpV/iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cDomCMxz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E712C606A319
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 21:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cDomCMxz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ABBF1F000C1;
	Wed, 21 Oct 2026 21:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792618536;
	bh=yyzCYPa+BQPr6y1YEXJetzJwEFpfQFLDJOrTLkaINIM=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=cDomCMxzyPlcFWr5F4CB3jvGHHYNyaboQpyeGrGB2VshHYLwVh19NmRKpz3YJsoZC
	 t3/KLkx/zrxg9HgfZepnDC80WNfVAFI82+QFdKie/lCHmPFG6WodH7WcJ7Oa5Z91/h
	 Spk6bWUbiEBH+MNXI3MtruLUD3x46BRcrsK5f+6ZBx1aApACCe/E3gaK3FAFiTk/IJ
	 WwtbS/wtiF+Q++W0rkTPbyJuLv9Ej9jB3OLyljSrHg5GwbtLB+Sb4VPKZxXDC3/Qyl
	 tHOIBKAPyHswisfdCJjiU7zXxXNdS7OHx7wT8r5RfdHYUnSX/0pt/lO6fH/LkDTtoV
	 zfhRXd8QOGikQ==
Message-ID: <sashiko-outbox-180709@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] ASoC: es9356-sdca: Modify the Initialization
 Configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhang Yi" <zhangyi@everest-semi.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261021075136.16155-4-zhangyi@everest-semi.com>
References: <20261021075136.16155-1-zhangyi@everest-semi.com>
 <20261021075136.16155-4-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 21:35:35 +0000
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
- [Medium] ASoC: es9356: missing regcache_cache_only() restore in es9356_sd=
ca_io_init()
--

commit b446d528859126e747930f027bd832991ca056fd
Author: Zhang Yi <zhangyi@everest-semi.com>

ASoC: es9356-sdca: Modify the Initialization Configuration

This patch updates es9356_register_init() to read the chip version from
ES9356_VERSION and apply version-specific register initialization settings,
propagating read errors to es9356_sdca_io_init().

> diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
> index a22e92d1e5ccd..e0df501007ad8 100644
> --- a/sound/soc/codecs/es9356.c
> +++ b/sound/soc/codecs/es9356.c
> @@ -749,58 +749,97 @@ static const struct regmap_config es9356_sdca_regma=
p =3D {
>  	.use_single_write =3D true,
>  };
> =20
> -static void es9356_register_init(struct es9356_sdw_priv *es9356)
> +static int es9356_register_init(struct es9356_sdw_priv *es9356)
>  {
> +	unsigned int version;
> +	int ret;
> +
> +	ret =3D regmap_read(es9356->regmap, ES9356_VERSION, &version);
> +	if (ret < 0) {
> +		pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
> +		return ret;
> +	}

[ ... ]

> @@ -821,11 +860,14 @@ static void es9356_register_init(struct es9356_sdw_=
priv *es9356)
>  		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_VO=
LUME, CH_L), ES9356_DEFAULT_VOLUME);
>  	regmap_write(es9356->regmap,
>  		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_VO=
LUME, CH_R), ES9356_DEFAULT_VOLUME);
> +
> +	return 0;
>  }
> =20
>  static int es9356_sdca_io_init(struct device *dev, struct sdw_slave *sla=
ve)
>  {
>  	struct es9356_sdw_priv *es9356 =3D dev_get_drvdata(&slave->dev);
> +	int ret;
> =20
>  	if (es9356->hw_init)
>  		return 0;
> @@ -840,7 +882,9 @@ static int es9356_sdca_io_init(struct device *dev, st=
ruct sdw_slave *slave)
>  		/* update count of parent 'active' children */
>  		pm_runtime_set_active(&slave->dev);
> =20
> -		es9356_register_init(es9356);
> +		ret =3D es9356_register_init(es9356);
> +		if (ret < 0)
> +			return -EINVAL;
>  	}
>  	pm_runtime_get_noresume(&slave->dev);
> =20

[Severity: Medium]
In sound/soc/codecs/es9356.c, es9356_sdca_io_init() disables cache-only mode
before calling es9356_register_init():

sound/soc/codecs/es9356.c:es9356_sdca_io_init() {
	...
	regcache_cache_only(es9356->regmap, false);

	if (es9356->first_hw_init) {
		regcache_cache_bypass(es9356->regmap, true);
	} else {
		/* update count of parent 'active' children */
		pm_runtime_set_active(&slave->dev);

		ret =3D es9356_register_init(es9356);
		if (ret < 0)
			return -EINVAL;
	}
	...
}

If regmap_read(es9356->regmap, ES9356_VERSION, &version) fails in
es9356_register_init() during es9356_sdw_update_status() ->
es9356_sdca_io_init(), this early return leaves es9356->regmap with
cache-only mode disabled while es9356->hw_init and es9356->first_hw_init
remain false, allowing subsequent mixer control accesses to issue SoundWire
bus transactions to an uninitialized device.

Should this error path restore regcache_cache_only(es9356->regmap, true) and
return ret instead of masking the error code with -EINVAL?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021075136.1615=
5-1-zhangyi@everest-semi.com?part=3D3
