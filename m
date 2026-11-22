Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364892;
	b=DEHFmeGcB0cgnz2CT0pYUHpxfK9VekZoUZYHq9J4RAy3Tsg9Ndvge8VBdumFii0jLC74
	 WiP+gwwEWDJsQi7DXMNMLiKrplllFpEHP5Cnup7sDSnzjTcs64Pbt+3SFf7i7JLQeTT2I
	 L7FqUfVuS2zMI4CRDnwepVw7NN0iRA2kA77vwT+7/mzYYTRVyOy9Uxw300bzuRgOY/hBS
	 CRCIvQJwLbi/x7acUg6oxa+wc8fGZ48NkQRvPZqGGa6GkeT8HLfKj/ERACVpZn+kLzpJg
	 /bw9lukhTxp9oB5GCOGbSdUo8t1/CmPGiETYgn49M9ONvfJtnlqmtPtOfiwOS8EHuhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364892;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=w2jJbbjxqi3Ud6TAa04LKDmCAGuSmeUyHMDl5hTbDcw=;
	b=FT/6jEfw73ru/N/zA2QbWgssxk5+63lZG+FiMBurIEk3wMA3Sn9vM7gL913awVWv82dL
	 4A5nPM45QCTctq/Kvk8ixHRP8o9GVuT4I7UYV51vrygzIzquSeKZUIiP7MNe03yNGszlc
	 VAqnfe22oNntN+UezhK6j3cEp4VGRJYSDuNZN1aynm8gzrTSFaOknpW7YZvC4Ya4kwNSG
	 4ACa2TZlcvAfd4RfTtsrUtF/Rf3+H9Dg7mZVLsW9r8ljJ3TVkYo4Wit1Yp/kvYGGyiUVs
	 1D4cd1isBMvl6V9MDJNe2hwNffIMBq03agUGjoxPPgthuyb/F/UwzEubxnxac50jjrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=axafC6tG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B1C606A320;
	Sun, 22 Nov 2026 16:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=axafC6tG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D11C1F000CF;
	Sun, 22 Nov 2026 16:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795364891;
	bh=w2jJbbjxqi3Ud6TAa04LKDmCAGuSmeUyHMDl5hTbDcw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=axafC6tGGgO6c19nmtvdrER4Uf95U+CjzXDNzQZvFCqphKUxWOkHCRLBEQdP644Rt
	 ABSAtNNhmltPiOqOl07+pW37YGdjZt+3FSm6Xh33JMFxQStzJMWsQJOoe6SNMEWFgd
	 5yKLqsF/aXt9x3/Yf8P3ekn4JJFIFaIO5KsouPWj9ftCRbIXv4LxwgjYnVlT8nEc0B
	 2ldYStiYuW99sZpqKr8LSOWXWBaexKmDDxtXUgXP4Zth8zNOnNYlyBGzZJNltpSv6k
	 4aeLB4/2nInxyC+h70ZGUVG/hkosAwGpf84/xQU08Ty/1RnOeEZygGn2PnUvt1XEUN
	 hciXBDB++Ho2w==
Message-ID: <sashiko-outbox-228098@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/24] ASoC: codecs: wsa883x: add VI sense capture
 DAI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261122161437.5994-8-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-8-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 16:28:10 +0000
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
- [Medium] ASoC: codecs: wsa883x: missing port_enable check in
  wsa883x_vi_hw_params()
--

commit 82c65105b12aa380210860d9001570f29fccfcce
Author: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

ASoC: codecs: wsa883x: add VI sense capture DAI

This commit moves the visense port to the SoundWire source port mask, adds
a dedicated capture digital audio interface and stream runtime for it, and
programs the host clock divider in bus_config.

> diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
> index 64391d654a08b..6de669288d6aa 100644
> --- a/sound/soc/codecs/wsa883x.c
> +++ b/sound/soc/codecs/wsa883x.c

[ ... ]

> @@ -1335,6 +1351,25 @@ static const struct snd_soc_component_driver wsa88=
3x_component_drv =3D {
>  	.num_dapm_routes =3D ARRAY_SIZE(wsa883x_audio_map),
>  };
> =20
> +static int wsa883x_vi_hw_params(struct snd_pcm_substream *substream,
> +				struct snd_pcm_hw_params *params,
> +				struct snd_soc_dai *dai)
> +{
> +	struct wsa883x_priv *wsa883x =3D dev_get_drvdata(dai->dev);
> +
> +	wsa883x->vi_port_config =3D wsa883x_pconfig[WSA883X_PORT_VISENSE];
> +	wsa883x->vi_sconfig.frame_rate =3D params_rate(params);
> +	/* VISENSE carries the V and I sense pair */
> +	wsa883x->vi_sconfig.ch_count =3D 2;
> +	wsa883x->vi_sconfig.bps =3D 1;
> +	wsa883x->vi_sconfig.type =3D SDW_STREAM_PDM;
> +	wsa883x->vi_sconfig.direction =3D SDW_DATA_DIR_TX;
> +
> +	return sdw_stream_add_slave(wsa883x->slave, &wsa883x->vi_sconfig,
> +				    &wsa883x->vi_port_config, 1,
> +				    wsa883x->vi_sruntime);
> +}
> +
>  static int wsa883x_hw_params(struct snd_pcm_substream *substream,
>  			     struct snd_pcm_hw_params *params,
>  			     struct snd_soc_dai *dai)
> @@ -1344,6 +1379,9 @@ static int wsa883x_hw_params(struct snd_pcm_substre=
am *substream,
> =20
>  	wsa883x->active_ports =3D 0;
>  	for (i =3D 0; i < WSA883X_MAX_SWR_PORTS; i++) {
> +		/* VISENSE is driven by the separate VI capture DAI */
> +		if (i =3D=3D WSA883X_PORT_VISENSE)
> +			continue;
>  		if (!wsa883x->port_enable[i])
>  			continue;

[Severity: Medium]
Should wsa883x_vi_hw_params() check wsa883x->port_enable for the visense
port before calling sdw_stream_add_slave(), the same way
wsa884x_vi_hw_params() does?

Skipping this port before the port_enable[i] check in wsa883x_hw_params()
removes the only reader of that entry, which makes the visense switch
mixer control a no-op and unconditionally adds the port and its two-channel
bandwidth to the SoundWire capture stream even when disabled on an
inactive speaker.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122161437.5994=
-1-srinivas.kandagatla@oss.qualcomm.com?part=3D7
