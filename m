Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486F5453A5D
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 20:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789159868; cv=none; b=SUBL7+TUesyTNHYBRJ8Qkb+y3e2PJaBdWnpNRjMxV/iegaBjBu+euzXMkksRh7LDqyKrKGBS/lldb5jZ/703xeES96R0FSV1Ppw5iOX3cp11DR53JUcmKLDosqPm5a1lH1yr5DV75eZ+YOatS9WyF5/TsXmuLRllmX5mXCSp08g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789159868; c=relaxed/simple;
	bh=eQOUuTdT+APQoE3vIfxEQgBPrSMtidIIb9a2VSFC2mU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ElvWL7lhpz8fdJeskENpJZuE3qxwBVkTZCEdONj28xrXsC2J2s9d9+JOMXrshMBDFMMsnq11VfuZgv5u4iZk10THO2TIw+HRb/9ZeDo9wHEPU8qoOmi+VksrKwMJIvWydzlSeM+SFzjqNrGmoh65cdAt2/sbg2wJAJAr+Vr7NLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVNJTTqx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVNJTTqx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 181841F000FF;
	Fri, 11 Sep 2026 20:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789159864;
	bh=+YZYQdCFDO3ooAkPFCLWeLH7o8l1WJ45cW/WERztv5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nVNJTTqxOzcNcho5FA5dLytwwQQcf4aoPHp1lDzf0xr3CeH/jK+hLHcW50oaVviM2
	 MvrOyrIiSgv19fY/u0y2g1aMXecvyPYzFL73QsFTZxN0LrVApRthwmpRYRFiS9DAx+
	 xQQ9bVL8eMoDZ4RP2D+sw14JITaEQH1O/tmAvoOSCgl9x/y19ZL4mPgM62LWyTbYOS
	 NssS/rMBxwDO5ySDWwYk5hl4+Hz2J7cBAST21aISnFVsUa8im4kEnx9u2q9/Spiw8+
	 74uw7IuCYIKLpOV4/ShanPVUyE1JtOXchdjoYTmCJMvaTMXmIiu9eHIv2khuIrQLVF
	 LiQrECmM+CV6Q==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 7FEBCDE29CD; Fri, 11 Sep 2026 21:50:47 +0100 (BST)
Date: Fri, 11 Sep 2026 21:50:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, daniel.baluta@nxp.com
Subject: Re: [PATCH v3 22/26] ASoC: SOF: Add support for IPC4 compressed
Message-ID: <aqRpp_AZseE86hhn@sirena.org.uk>
References: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
 <20260911112152.28528-23-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UG3glgYSpNSNhk/E"
Content-Disposition: inline
In-Reply-To: <20260911112152.28528-23-peter.ujfalusi@linux.intel.com>
X-Cookie: Orders subject to approval.


--UG3glgYSpNSNhk/E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 11, 2026 at 02:21:48PM +0300, Peter Ujfalusi wrote:

> Set and define the compressed ops for IPC4.
> The initial implementation supports basic features: PAUSE PUSH/RELEASE,
> DRAIN and progress reporting.
> Tested with PCM, MP3, AAC and VORBIS codec.

> +static int sof_ipc4_compr_set_params(struct snd_soc_component *component,
> +				     struct snd_compr_stream *cstream,
> +				     struct snd_compr_params *params)
> +{

> +	/* Use correct format based on the used codec */
> +	switch (params->codec.id) {
> +	case SND_AUDIOCODEC_PCM:
> +		snd_mask_set_format(fmt, (snd_pcm_format_t)params->codec.format);
> +		break;

snd_mask_set_fmt() ends up as:

  #define MASK_OFS(i)     ((i) >> 5)

  ...

  static inline void snd_mask_set(struct snd_mask *mask, unsigned int val)
  {
          mask->bits[MASK_OFS(val)] |= MASK_BIT(val);
  }

but we have done no validation on the format and snd_mask only has 63
elements in the array.  That looks like we're allowing writes to go off
beyond the end of the buffer unless I'm misreading things.

--UG3glgYSpNSNhk/E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqkaaYACgkQJNaLcl1U
h9AWTgf/ZdPaF7PeUp3uNgUzMWRa6ly6Mgc8p3zQbm4wSzFMVcmnIJa7jKPxk7J6
eNcZEH0JDOPcXTjda2eHkFi6Va6emygrC7855LbpXKYSrY4/RZf+fsb0uwsKbeFU
ao7+Fg5snxglNKtSiyirgoHn46pgyVemud74G/qxhZ0t50746PY4463I8OqXZWll
vz+cI8l6p19WcVtxu/PSqetlPwONZPcIUtDt855NM4hLVQuTmZ6ZtNhqKK1gRbbx
ji6EIDVvG4KnjlPP2GTRS9vu7bFFKztdYakqY81R1GWKBuGy3hBa5f18foWYbiDF
5M2w15219113FUKSPNcs1tMrdwhTzw==
=gRXS
-----END PGP SIGNATURE-----

--UG3glgYSpNSNhk/E--
