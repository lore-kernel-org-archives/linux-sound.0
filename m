Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364893;
	b=h8nJvT6DfmOVZJ7CRLUiRxxZtKeVoxqnhk6Rr29m9x5yYYEPEmN7pHsIfNNjxG00yHSO
	 h02UnEMR5CmlCL2AXIPpichAM9O9rc8vUJZLb4jAFR5rLm868Z090jmCOwGmZQ3XL1+Xi
	 tFtLYQUMqBvSde5Oy7voOjjIWuh6Hb3I4OzMKSwph/ONkAfpeyUiPL/q2zNtOGqJG8UK+
	 iG40MMbv1aCClw1RHeB/c4/FUrS3v4kTa/71r2zpygcId7oIPyjIrT7N8pFaQxPam5uk6
	 AlPtS+SGewPypZdM9E4GUmBczy7TH6tTWLuOSZagW+7YV0YE531vyh6L+z/DCB8DHQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364893;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IHUepnUuapjmmdrCBbxPTwsclQm2fA60Hch+ZJm4ktc=;
	b=bL7oWntF0RKIT9OLBTHWs8nNN76NT701kf9d05Y3ezII/cfNc6WcfFcCCBOVht9ZFsbs
	 xVeUkZH5QLxmoJf8lRfRfUWE+2EzVTI66O2eyeIRzR54yhgZJ6Ufe1MALfoAiQdiGVGvG
	 SQ/GM1KDUZrWP5Rk/v0CnY6LmxfXs1MGxD9tzbRb+2quQj45JBU5eyRNeiqLx31/Ph37V
	 2Ve3W8IORmc/rQFvmZLTwTzLKdEPGzQBUNmnTc5e1Ox5/lY3MaoBpLjkNTtky9DgSuBFc
	 y9txEKb64RehJW6STYeqQCzQREv/oNkNApa/yCb397Z2NeGBLwAlelb9MJkL7HuSOAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i3Ma7xCI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC5A606A320;
	Sun, 22 Nov 2026 16:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i3Ma7xCI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD511F000C6;
	Sun, 22 Nov 2026 16:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795364892;
	bh=IHUepnUuapjmmdrCBbxPTwsclQm2fA60Hch+ZJm4ktc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i3Ma7xCICzGrL+QqEbA18SPI3iS+AL1rDfNiLIF4WEq78vwl2Rk/3B+pZhUa3cx5y
	 kQl80RApl5CYMBF2Gc9wtC1i22eE6zWAcRx6Mlxqio7qJhFCVupcTbjJjw6QX6h2yH
	 RCehRSDfgVEENr8gUHGCANIGP2e5v0N7SLz4aT1+rkc297AhiUtVstx3BTFVrzfYrH
	 /ZEipZ2Bx5hpIbBMnDIAz6//z8nOQ4XAtJR9EVH3HJsdoGCyBnKWCIdwqL0G8wZ8qL
	 pnT8W71XQX6b/kkNcov93VJQwHcZ7ZcrZ9e8Noh7bX0DCmwNJlGUd9yhPlqJLDaT/l
	 cWpubGbmp9n9w==
Message-ID: <sashiko-outbox-228099@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/24] ASoC: codecs: wsa884x: add VI sense capture
 DAI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261122161437.5994-7-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-7-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 16:28:12 +0000
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
- [High] ASoC: wsa884x: skip of sdw_stream_add_slave() in
  wsa884x_vi_hw_params()
--

commit 86734d1c7daee21edd95755415759e0cc7c579d3
Author: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

ASoC: codecs: wsa884x: add VI sense capture DAI

This commit moves the WSA884x VI sense port from the sink port list to a
source port with its own capture DAI, ops, and SoundWire stream runtime.

> diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
> index f58ce92c46d40..91aa004d7137b 100644
> --- a/sound/soc/codecs/wsa884x.c
> +++ b/sound/soc/codecs/wsa884x.c

[ ... ]

> @@ -1767,6 +1774,27 @@ static const struct snd_soc_component_driver wsa88=
4x_component_drv =3D {
>  	.num_dapm_routes =3D ARRAY_SIZE(wsa884x_audio_map),
>  };
> =20
> +static int wsa884x_vi_hw_params(struct snd_pcm_substream *substream,
> +				struct snd_pcm_hw_params *params,
> +				struct snd_soc_dai *dai)
> +{
> +	struct wsa884x_priv *wsa884x =3D dev_get_drvdata(dai->dev);
> +
> +	if (!wsa884x->port_enable[WSA884X_PORT_VISENSE])
> +		return 0;
> +
> +	wsa884x->vi_port_config =3D wsa884x_pconfig[WSA884X_PORT_VISENSE];
> +	wsa884x->vi_sconfig.frame_rate =3D params_rate(params);
> +	wsa884x->vi_sconfig.ch_count =3D 2;
> +	wsa884x->vi_sconfig.bps =3D 1;
> +	wsa884x->vi_sconfig.type =3D SDW_STREAM_PDM;
> +	wsa884x->vi_sconfig.direction =3D SDW_DATA_DIR_TX;
> +
> +	return sdw_stream_add_slave(wsa884x->slave, &wsa884x->vi_sconfig,
> +				    &wsa884x->vi_port_config, 1,
> +				    wsa884x->vi_sruntime);
> +}

[Severity: High]
Does returning 0 early when wsa884x->port_enable[WSA884X_PORT_VISENSE] is
false leave wsa884x->vi_sruntime unconfigured and cause PCM prepare to
fail?

sdw_stream_add_slave() is what transitions a SoundWire stream runtime into
SDW_STREAM_CONFIGURED (as wsa884x_hw_params() does even when active_ports
is 0).  When the VISENSE Switch mixer control is off (its default at
probe), skipping sdw_stream_add_slave() leaves vi_sruntime in
SDW_STREAM_ALLOCATED (or SDW_STREAM_RELEASED after hw_free), so
sdw_prepare_stream() rejects it with -EINVAL; on a multi_direction_codecs
link, qcom_snd_sdw_prepare() then tears down the playback stream as well.
Also, if hw_params is called again after VISENSE Switch is turned off
without an intervening hw_free, the early return leaves the previously
added slave port runtime attached to vi_sruntime.

Passing num_ports =3D 0 to sdw_stream_add_slave() when VISENSE is disabled,
matching wsa884x_hw_params(), would still transition vi_sruntime to
SDW_STREAM_CONFIGURED.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122161437.5994=
-1-srinivas.kandagatla@oss.qualcomm.com?part=3D6
