Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076EB3C3BE2;
	Fri, 20 Mar 2026 15:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774021479; cv=none; b=Zg6fDyOkGqbVUpUk5anF2ORNqa5ziPmPoQrNpNpzxJZd5sokNS7jIgAiySiABS7yq2oLRFnyqxwXQpQVgzwJld+CnC0AaS9fJodEDBK118uCrgkAdnYyjHQrJNjN3t4FNhRrJI2tgMEE+kDDMkpv6voXycaTaoOxyYXfSPo0U0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774021479; c=relaxed/simple;
	bh=qGDOFtoRam0qDZqkUxUgUbUMjgX1zpiSVnttcBOP+GI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Us8NGrpL5mO+Yi54pKw1HsmfCF3CaWeiH9bo+Kvj8yROoi3nb+sALDs++Rdi7KzhmeSJy5L9K4YsDIE78pdsdHgUCZAvxnFZRqovMn5UbpFUfU1D3rajREUjfbvNXrBV4CJUNyioc4z0FnfhbanHz3L/QLVaIwWM4ilOY2mQ8vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L8+vfiuG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L8+vfiuG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC31DC4CEF7;
	Fri, 20 Mar 2026 15:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774021478;
	bh=qGDOFtoRam0qDZqkUxUgUbUMjgX1zpiSVnttcBOP+GI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L8+vfiuGpwiujAefzRju0KvqJMemMGSD1aNLG3sR3GcrPAuqvkLJIPpr2HV3qzrtv
	 yulHYZeDhcjLerKL1nucKSo8Gf+zPvVG3B7C9rs1XIb3bJ3XgJvJvIg0OMDOKNgH5/
	 4rCQ3UWm2KC/64a5y/TsDQoqgmA1XK9tJzvrxPlaCnX98fma+/sRdwOLvS5v4ppnP+
	 Oe/Cm92e2AMmFCXFMbS4/JfbN9snAR4WWmbfJ34oLZxb2tGv9YtIZ5IsYnRirOWQvc
	 JQPt65rNpEoLyESlGDV9jfeMpfUSrFl5RAsg4+q8XJ4mX54fo15EnMXJIcFXHy/aUK
	 aZuiyRjYgIKMg==
Date: Fri, 20 Mar 2026 15:44:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	srini@kernel.org, val@packett.cool, mailingradian@gmail.com
Subject: Re: [PATCH v6 13/13] ASoC: qcom: q6apm: Add support for early buffer
 mapping on DSP
Message-ID: <73bbc9b3-d71e-4161-8d21-496433c24300@sirena.org.uk>
References: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260320144918.1685838-14-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/X3HQbfPQWzV2Jl4"
Content-Disposition: inline
In-Reply-To: <20260320144918.1685838-14-srinivas.kandagatla@oss.qualcomm.com>
X-Cookie: Who's on first?


--/X3HQbfPQWzV2Jl4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 20, 2026 at 02:49:18PM +0000, Srinivas Kandagatla wrote:

>  static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc_pcm_runtime *rtd)
>  {

> +	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
> +		substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
> +		q6apm_dai_memory_map(component, substream, graph_id);

This doesn't assign ret...

> +		if (ret)
> +			return ret;

...which means this isn't doing the right thing.

--/X3HQbfPQWzV2Jl4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm9a18ACgkQJNaLcl1U
h9BLmgf/cc5ZzP5gkrnbCTXnp7sLtMtNbNsIrmLfW7nn4i1rhYbYTl7lAOiNTK6+
OnPJ22p60KMhyQWGmlmfUAGFoYuS0wObmi77A7oQSmuLzUKwsOsNJTSkTtq7qb8K
Vm9RTKA4L1uaHte6hdCSNFPzghp48f5txDqEd23NhMpjdC4dtFSToL8mduu7TBSH
Avic6vkK2FJdlVJjy06ze0zfEGuyxq7yWsMZvMN0kA3YBPUsuGoJFF4iCpYhXzBL
qnpX3RJw7DQ4hv0W7APEU8aMtmugxUu9nfvBW4UbqYXCoyuFpqEPW4alV3Wo9rz5
VpRSVtRWb/bh1X9iF9C59/PAQvVImQ==
=hc8p
-----END PGP SIGNATURE-----

--/X3HQbfPQWzV2Jl4--
