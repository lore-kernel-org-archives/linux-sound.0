Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947E145D19F;
	Mon, 17 Aug 2026 17:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786988248; cv=none; b=P5vCJedb9kNQ2Fntq0UgT04eQmwDFgWH3sWpVoKFcERZb/9wW6dwWHLNSnnB5c2bRTKCqzoU06JfItYV9lZ64cJZQCkkdcLRg1jHuZGtAhufeeh+6qbrkwER4eXTbnhUqVzXhxEl2kzYKWss5SZVXSUVk6cGV49ZLVzs6djpnw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786988248; c=relaxed/simple;
	bh=hqkURpP2xu+rAfHq37YH60TiEaH45yxDsCoiPQvKikA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kug/me3p/TM1KZ08V5+oW4ThYBO4orGl6ZzAX+MYQ1Rvuc5tFgDHFlEyG+BeRtCfjNzyqhx4cWvTnNSLBrP+xKgc1jZZvZ4Vnaoj/lEp6xy6TPsuYRWkAjgIiukv3r4UwRgBTMcx0iWMGyCPmzaRwUgttl2DxLLemux89t+nd6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q76MxXXD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q76MxXXD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D6A1F000E9;
	Mon, 17 Aug 2026 17:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786988245;
	bh=1QA2H4wkbjCpQ9Aj5ETlD59lRs/QmBB8IJOyWaZvwHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q76MxXXDob+MIjOjdQTNIBdno1IwYjQe+c2UA360C40i+TQpr8MstFA64YwILcOZf
	 OHyRlUvHm2FmDr8b8NWL63YhNVBNmu4HaWQhZ7bv/jFQMSTVNAVJXgwXbz553FA2cR
	 9cxI/Sdg1VtYaKMfRj0hmsMDPQxOLQ9ITyZ3EyQSf15zXYtXyyMFgbocpTaCTj6NNQ
	 wCzKUSUKiTlBV37Fd80shVxw3GIW9LiBYeH54dIm6QBv/1o/WLpxS7tC9okyPi1QW2
	 Kgb66Ta7Z+X7OV1fBOpYgtVhWRm2hnf/Kp26GAff06jnYPjCpqbARVmyVdHdPdRY52
	 272RdklMIznoQ==
Date: Mon, 17 Aug 2026 18:37:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: cs35l45: Adds support for SYNC bus
Message-ID: <0d322627-7a01-4cfe-b09f-368f6b81f322@sirena.org.uk>
References: <20260814223456.611160-1-rriveram@opensource.cirrus.com>
 <20260814223456.611160-2-rriveram@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a9Nj/rsZ9uv0upH+"
Content-Disposition: inline
In-Reply-To: <20260814223456.611160-2-rriveram@opensource.cirrus.com>
X-Cookie: Obey all traffic laws.


--a9Nj/rsZ9uv0upH+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 14, 2026 at 10:34:53PM +0000, Ricardo Rivera-Matos wrote:

> +static int cs35l45_sync_en_put(struct snd_kcontrol *kcontrol,
> +				      struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +			snd_soc_kcontrol_component(kcontrol);

$ git grep snd_soc_kcontrol_component asoc/for-next
$

> +	struct cs35l45_private *cs35l45 =
> +			snd_soc_component_get_drvdata(component);
> +
> +	if (!cs35l45->sync_pin_set)
> +		return -EPERM;

This will result in an unwriteable control on any system which does not
specify a sync pin which is just going to confuse things (eg, does
mixer-test think the control is writable?).  It would be better to only
register the control if it's valid.

--a9Nj/rsZ9uv0upH+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqDRs8ACgkQJNaLcl1U
h9CvQwf+KHDi4bP5FDdWcK9zH4xLrLLlZr9xH5X5UgCbLQVBRnnxEsmPtf9nuHDN
3B7gCUNLOGILiNYIY8epo4tSKuTqpQzT6nZ7oo57mBhMJvF1NWkbR9Co96neqZk1
zoLMLgU3JhwUKxAHHfsV/wByJxF6B5IiiCYcWuqWA78na2TeSY6TGz009Eivil7g
O4at1t8WcJ1xu+oRugHDr9/4OSXk3+kf05tKQvwMONhxN5C9G7eUmF7QXfjfMaoj
Abbg9Rh8/GUuuHDd7pXRHn+bPGwFObrETVK92vbq6Jnm3RhRMda+yhTVz17gNX01
0WPf1EJc1XmcPUVBbQg+B7Sr4HcmNg==
=7m8K
-----END PGP SIGNATURE-----

--a9Nj/rsZ9uv0upH+--
