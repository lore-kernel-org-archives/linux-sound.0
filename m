Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1298616DEBB;
	Mon,  6 Jan 2025 15:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736177140; cv=none; b=YbeINK1uuCSxNLoljvwtVmUCwZdb4R14gMH8XlpNodtdko2sF2CVt52Ru7bkphShk0ObFg3DsYVHzn9AkerMfg3Z9ee3Z4UFxlQxuNrjKV3leZ55VSQoymYRNSZ3Vx5fX6IvBzOkhCplBrP0s/PCn9Sbhb6c1wPOmW4J13ECT1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736177140; c=relaxed/simple;
	bh=5MTxjH/SM24JNYUfp0qfCiE1zR7AphxEZdpS37+3+HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0tC3HWu7Ms97/bVdRhXlyEkFhCL1yO+gT2py7aeSC7YZu1M8IWfNk0O3fRixjQYSIi/UNMpJK0cI7JiBcLevwzn53OY/h/2i+42ybGeu3ppz+/sU66i+5P7tO457AGTQkl682aYZeZL9hmyZfH/NlUI6TL+wwg3f4V1Pc11RZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SmRunV99; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SmRunV99"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523D1C4CED6;
	Mon,  6 Jan 2025 15:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736177139;
	bh=5MTxjH/SM24JNYUfp0qfCiE1zR7AphxEZdpS37+3+HQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SmRunV99/VzqhvUq0E6k85NEfOZ38k7bfVmNInDqcBPM9Tk/zDT4HDAbMopIqQSJl
	 zt0X+cXzc3EGbtbDUAj+lmtNQ1zx208IXnS/pfICpOmsZiMLV7FiHvXb+En4t2xlKa
	 z892MKSVGC61234PJ3RSMKG+PyX3/iOc8x7oM+FtajpZO8VYmcPinvr/KDv6dTiwMw
	 mlWW1sFy2VYncsQv09NzQxIgsEY1ld348m7M2kyMEi/vSVd9AEujQfcpPJQmHH23M4
	 sacJ7inTL6Kn+7kgk8Ggae138DlXKIAUALBPldZnZazLQ3Zg+SwpAp+qP6LDwwedfk
	 KUUjsaQGtqi9Q==
Date: Mon, 6 Jan 2025 15:25:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-sound@vger.kernel.org, linux-amlogic@lists.infradead.org,
	s.nawrocki@samsung.com, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 2/2] ASoC: dapm: add support for preparing streams
Message-ID: <8379a6ef-f141-408d-bed2-e34fa3850a65@sirena.org.uk>
References: <20250106141316.375984-1-martin.blumenstingl@googlemail.com>
 <20250106141316.375984-3-martin.blumenstingl@googlemail.com>
 <1jy0zo9fu4.fsf@starbuckisacylon.baylibre.com>
 <1jsepw9fl2.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8gE/NcOytn1JDk3Y"
Content-Disposition: inline
In-Reply-To: <1jsepw9fl2.fsf@starbuckisacylon.baylibre.com>
X-Cookie: Do not pick the flowers.


--8gE/NcOytn1JDk3Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 06, 2025 at 03:34:01PM +0100, Jerome Brunet wrote:
> On Mon 06 Jan 2025 at 15:28, Jerome Brunet <jbrunet@baylibre.com> wrote:
> > On Mon 06 Jan 2025 at 15:13, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> >>  	case SND_SOC_DAPM_POST_PMU:
> >> +		snd_soc_dapm_widget_for_each_sink_path(w, path) {
> >> +			sink = path->sink->priv;
> >> +
> >> +			snd_soc_dai_prepare(sink, substream);

> I initially missed it but I think you should do that on the source path
> too

> On Amlogic, the cpu side of the link does not have a .prepare() callback
> but it would be incorrect to do the codec side only if it did.

Yes, symmetry seems sensible.

--8gE/NcOytn1JDk3Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmd79e4ACgkQJNaLcl1U
h9AmuAf/UVLGHmvnOThQYVduJMDR1fc714AbpK5gXiZfnzN7JkxU61CGg5mxRt+2
fF/iFIe9sKqfxlTr6EUJTjxTtXrCyzoEJTj61yvkrAK5VI2HqSbUO/Tcx/d8yzHA
/6Y9YdbVnIoBBkouC6CAjvqwNJV5Ss6yKoVg1wQfyScjKD+GIWMxpT1Po0NRb54V
SeLJ4I6dsBliqgrUUL72Jde8g6mMkDIIY+crVH0fCRlRdZZfvHgrDG2uEAAtmSF1
pY4i2Qeleje9/cjtmqWwIjv32FVIFKYu1m65w0Y+oZ0UsfpkrfrzoQQFVKvbOsDr
zTpo4OfnJ/Ih2qgZSnU4RP8MIiXeOA==
=avAq
-----END PGP SIGNATURE-----

--8gE/NcOytn1JDk3Y--
