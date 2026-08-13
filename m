Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BAE3F0A8C;
	Thu, 13 Aug 2026 19:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786648010; cv=none; b=ZdMNwp1OqtsxeCp1DWRxhl7No2oVqtwGyOkIlHBAU4r1YGvUyRZe8XVhHr0GRoLjuZQsAQzp4UJBUEpq8cBfaUKX9uW+i78C1+7AQgzq0DG8caKZuYPiOmD1n4whp6JisWD50RBl9tXRcgvaYpr4ZSHjkOC095e1e+IzgXyB59I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786648010; c=relaxed/simple;
	bh=oAUsguto55Fq+TRO4wvrWbpzkVLWkKRjBcpm3fP5JtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mgNL23VtY/3ObSgMDnW6YUVD8sp65GiNFMgTNZNkLgzJcquSN/rehoBdWXXRXHCQCV4BffaYonSBNivzcEUMBV4Vo7bK9Enhn16DNPn6YvYglnEPDnJPecwhdtbcXzVGsAWkIRu+4Q5lq6k311aEUd9YJRPq01XSPFk4qQbDZwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pb9AsN/l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pb9AsN/l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11501F000E9;
	Thu, 13 Aug 2026 19:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786648008;
	bh=+5Ew4J2tcju57z6PSGSYxAz1bhdXB+YbKyDzZkt5zEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pb9AsN/lBlVHgNuJS8gNbgU/vNcC0cHTKbnEV8nwsKLdXz3iSK4P+syh3YycVFndo
	 Az8UiFf02s+KYQy60kBJugosdrmJJR6DZTYlG21lvze84F0yNReSOF7nCZyAvZ071g
	 X3cmKXDzQ+XIdXTGJaMlSS2TO7vHNH2dDGq99bd/7lGJZ8ZwWSGgPxGnVA9OD7YSJf
	 x3nTbzzzPBj5GLoMVEH59x3p++VuWvrV3K9suCHZ1cwBtStxGIduiplxRLscHFl3LC
	 EaU5swaARFliSGPQvBvYMC+TmyRBxf4vrNtGqR8eI4h+vrFY1Zy/xEpSU3z5fXmOPK
	 swVoAX9kZGbvg==
Date: Thu, 13 Aug 2026 20:06:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, tiwai@suse.de
Subject: Re: [PATCH v2] ASoC: cs35l56: Fix probe deadlock waiting for
 SoundWire enumeration
Message-ID: <de6bc0e9-bf97-4bd8-9e6d-7b2fd608dcc3@sirena.org.uk>
References: <20260813173702.1534029-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7Z4P0+flDZ3On3Cv"
Content-Disposition: inline
In-Reply-To: <20260813173702.1534029-1-rf@opensource.cirrus.com>
X-Cookie: Immanuel doesn't pun, he Kant.


--7Z4P0+flDZ3On3Cv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 06:37:01PM +0100, Richard Fitzgerald wrote:
> Defer all the parts of cs35l56_component_probe() that require register
> access to a work item. This is to prevent a deadlock where
> cs35l56_component_probe() is waiting for init_completion to be signaled
> but is blocking the code that would signal it.

>  static void cs35l56_wait_dsp_ready(struct cs35l56_private *cs35l56)
>  {
>  	/* Wait for patching to complete */
> +	flush_work(&cs35l56->deferred_component_init_work);
>  	flush_work(&cs35l56->dsp_work);
>  }
> =20

This can be called from asoc_sdw_cs_spk_rtd_init() when limiting the
volume, that's still synchronous while setting up the card - the main
Speaker Volume control uses cs35l56_dspwait_{get,put}_volsw() and when
we set up the volume limit we at least read the current volume.  The
deferred work will block on init_completion and error out if that times
out but init_completion is still signalled in the callback that's
blocked waiting for probe().

AFAICT we always try to limit the volume for these speakers?

I think the component registration needs to be moved out of probe into a
work item...

--7Z4P0+flDZ3On3Cv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp+FcQACgkQJNaLcl1U
h9CS/Qf/XYQvGd45WR6Fw5gxVsmZd5wKzy5yoxl5Kte4buKeCq5PJkkhrxuQJMoK
UOXh+lwu/+ZnD6/emF4zsRW7lwcTRPjT19695Rn5iLxa+eSA1OaPlBQGmXza4pXW
QO2L12p1Gt/mORtZGgRjDO+I5yQRTAro17CNak/I2QPDhvbtT34zTtlzJ9RCEmBy
8dEFfsOURSNpfAyeFktnMzs6oCb5MHYOruWtFwEnXYY11q119ulRVLJr59+wJ4XA
arE1gvSiyn5+gjemxaDteeAQihALRK3OZbe5YhJAxcZ7zvJ7lyTWHB+8LU5K4TbF
5R5ddvADslniJceCuQch44bizRfQFg==
=c3DO
-----END PGP SIGNATURE-----

--7Z4P0+flDZ3On3Cv--
