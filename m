Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A8316CD01;
	Tue, 18 Jun 2024 14:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718720745; cv=none; b=JhpXoY4vKfWfcCjXGEaB2JLU6iMVI9ZpC/y+y+m2IgSdTfeAb8TsvdgWiHGnSWd0dSmtbWY4siLNeQ5IplcnNphkURsLE2RmdknvPmAdrIG5RpbVaoXtFiV2zSSOUP66dFqrAyYwTVqrrA9HXTccixUgm2c4bE9sxtL+tKbh5Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718720745; c=relaxed/simple;
	bh=PNRMTUD74gmKWfJoETySIg3SOZ1/vr6Rmzt7WVy4aIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Urnnk147zDDw5IiyPpllW789XEw7Ba6aPQgmlrwYfSZgSCt9jWH2dqBW8B2YSzABtro0nGWkZjdQSOi7yl6vF40ZDGI2/pl7rt42qXViQylKFD+HFOF3u9goE6LNNswud27ohN4UjHNmD9hdSrcfmlxxW5SX8FO7PhUxrUf0Dgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NEmCts+v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NEmCts+v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0AC4C3277B;
	Tue, 18 Jun 2024 14:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718720745;
	bh=PNRMTUD74gmKWfJoETySIg3SOZ1/vr6Rmzt7WVy4aIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NEmCts+vbZSYIXzETqw6UymlUE941lOKAfrIV8H2TwEsmEL7EOh0d8YygpTosA9Q2
	 HjLQ4+0TfiOeCYGyO+3rDVNq5SlhPyOvlLkhZDAc+w3ZSNcpM3JN9xs4rnAygcAv4U
	 jMdSCESaUun2NTKF2PwdpjBmZKpI/D6NeFVN+8yw7J/cGTlLdxIK7g8Xn7fKlpZcBO
	 /dbSjBSF+XVo4twoLW88It73s7uSc1yauAyKbwVXTbRZESsgg/uMVIxBarnv+A952l
	 MukBSLcAGlQq9BQsMLpZ9tnV5jOwGJ4oQkhdR1dewjHz9Roauq+wLile03/4Syd8VG
	 EAa3f4dxCV6pg==
Date: Tue, 18 Jun 2024 15:25:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Paul Handrigan <paulha@opensource.cirrus.com>, lgirdwood@gmail.com,
	linux-sound@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v3 2/2] ASoC: cs530x: Support for cs530x ADCs
Message-ID: <24e1df82-bcad-4b8c-9743-a5ea213807d5@sirena.org.uk>
References: <20240617190102.1010597-1-paulha@opensource.cirrus.com>
 <20240617190102.1010597-2-paulha@opensource.cirrus.com>
 <96162ff4-8c54-4efa-b06a-dc20e358e712@sirena.org.uk>
 <4e192a95-bb3d-41d4-b83f-176f0f8aba6b@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z8J04TvKjfFiqjU6"
Content-Disposition: inline
In-Reply-To: <4e192a95-bb3d-41d4-b83f-176f0f8aba6b@opensource.cirrus.com>
X-Cookie: If you can read this, you're too close.


--Z8J04TvKjfFiqjU6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 18, 2024 at 03:23:07PM +0100, Richard Fitzgerald wrote:
> On 18/06/2024 15:18, Mark Brown wrote:
> > On Mon, Jun 17, 2024 at 02:01:02PM -0500, Paul Handrigan wrote:

> > > +	case CS530X_DEVID:
> > > +	case CS530X_REVID:

> > Are these really volatile?  I would expect them to have no defaults so
> > they must be read from the device, but once read I'd expect we could
> > cache the values.

> If you mark a register non-volatile but without default, a
> regcache_sync() will write it back out to the device. While that
> doesn't necessarily do any harm, that depends on what these
> registers do on write. Generally it makes me nervous to have
> cache syncs writing to registers we don't want to write to.

Marking the register as read only should DTRT there, if not then that's
a regmap bug which should be fixed.

--Z8J04TvKjfFiqjU6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZxmOMACgkQJNaLcl1U
h9CFwQgAhjP9jKcZGxY6WTO/sgbk6V+yXtST57QwNjt57c5LMb6smaKPCoRo/fio
PBkVKYDo+st5rV/UPg1njRtm/XpoiujiIxhb3qNdydAgg7BYZVPhVm76df3ON15a
rIe4iBxJkped4gAMIh2I7zs4tEAJ6eCSuc4HxZByozHn2lcunARg4e/bONjnnT7/
zEmq63N/VDsvvPmQ8Xb2CSi6Tnlzui5GtUM0uDqqEWiYsiXHEbwnwZpcZ6xKBj2J
IOVJNYLIbZchfvaQo8Fiwy7SfG2Rx+iEYNganByUAzf9RTgK2FhI5APuCF5a6iin
Anwy1udeM8J8POG6I0m/6+t4jEkguA==
=fyxu
-----END PGP SIGNATURE-----

--Z8J04TvKjfFiqjU6--
