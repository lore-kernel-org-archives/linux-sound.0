Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D635333F587;
	Wed, 11 Mar 2026 16:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245355; cv=none; b=ij5sgSIeoVCx1MbgkTpfACbH8vsccEY4Cyb6lC1IoSmTqbPALyCz7AA5jzD3i96JGnzKvK/LhEAzcjBCvmqNk86ASpgNV1I7fRpf9TBLthvh13t/RCMqsOac8cnz8jSb1kF6ovRTKGerW+6CCBsIWvRhDaND9DuGYsB5TTMuDmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245355; c=relaxed/simple;
	bh=SzTkUH1raesE10Ra9omumVtue6JTzR1kD7xlZbxtVz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lBN+f89d/dtfM5q4InsrjyN5w8k0ztWJiOU1OH/EbBrHvY8bCBpXvQJqngueqfYCUJvb34bNdANGIqtl2MSED3sfz9MK+p1Grq4ssgZl63BjPQPXogcNnRVNJ2eJujafWBLGYS4M/eBW1jbcrrpxXct+cihLdd5ObAYUkgxXlDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sB7hfVIn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sB7hfVIn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D9EC4CEF7;
	Wed, 11 Mar 2026 16:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773245354;
	bh=SzTkUH1raesE10Ra9omumVtue6JTzR1kD7xlZbxtVz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sB7hfVInC8EvNKqMsDxVyVNvUuuhflvYq67Z8g4zUWXVInKrXtUjvvKmYEJX0PQ9q
	 hpDj5U/gkpgo0YDpA9atTy2CZviKeK2i2mCFGoOcim4hEUj2XfD93zfKqaFjRgMiJm
	 k7x/JAazCCLSQ+K1WeYoJy2HOxnki6EdcgG/IQlRNgZ3D0oYz5KXgLEvXyv5oQcryP
	 S+gCtjAtpjLXdbgeki4RFGH7CzB4lTfFkinNpKsIqFeBNs8fyToQuYBzDKwwo4vB8O
	 KuzzHK1xXAj+JFaEwK/+U5Fb7t0bdac3dCBQ0I4os4hk5Cd/ur72+r6BxaGVNVxW5r
	 tYYiIHNqnLw+g==
Date: Wed, 11 Mar 2026 16:09:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: cs35l56: Support clock stop mode 1 if enabled in
 ACPI
Message-ID: <6a3aad9b-c6cd-4c2e-951f-1f62d7997ba1@sirena.org.uk>
References: <20260311142153.2201761-1-rf@opensource.cirrus.com>
 <80ba7c33-7949-4940-a72c-582ba749b2e7@sirena.org.uk>
 <efbbabe3-b42e-4f54-bef4-d27744f4309f@opensource.cirrus.com>
 <4976ec0c-f4d9-456e-81a9-55fcafa30b9d@sirena.org.uk>
 <7afba327-89b6-49c0-ba56-83da00e0d51e@opensource.cirrus.com>
 <5e12ba28-de41-466c-ae58-aaa32c72955b@sirena.org.uk>
 <c6b8c5e8-fdb6-45a9-aaab-d028e87a90ea@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gaxmdjjv09Vms5WE"
Content-Disposition: inline
In-Reply-To: <c6b8c5e8-fdb6-45a9-aaab-d028e87a90ea@opensource.cirrus.com>
X-Cookie: When all else fails, EAT!!!


--Gaxmdjjv09Vms5WE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 11, 2026 at 03:58:35PM +0000, Richard Fitzgerald wrote:
> On 11/03/2026 3:50 pm, Mark Brown wrote:
> > On Wed, Mar 11, 2026 at 03:34:54PM +0000, Richard Fitzgerald wrote:

> > > mipi-sdw-clock-stop-mode1-supported
> > > This optional Boolean Property shall indicate whether or not Clock-stop
> > > is supported on this Device.
> > > Integer (Boolean)
> > > Values:
> > > False (zero): Clock-stop mode1 is not supported on this Device.
> > > True (nonzero): Clock-stop mode1 is supported on this Device.

> > Oh dear, cute enterprise nonsense hacks :(

> The ACPI spec says that each property must be a {key,value} pair.

> If you always need a value there's the possibility that someone will
> create it with value 0 and expect that to mean false. So relying on its
> presence to indicate true is dodgy, safer to define that the value
> has meaning.

But of course we have the default bool operation doing the just check
for presence thing, and probably people looking at that for a good way
to do these things.

--Gaxmdjjv09Vms5WE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmxk6YACgkQJNaLcl1U
h9D+Kgf/aeVw3jPnhyHC5r+Ko7/Y/cf89E8C2o+JNxLVdJo4a/8d+blGMhUp0dGA
vs7IAT9JAzlTg3aI3yMembc0NU53PRkoWVXBvLFkQajhnsaBtqpTWgx03Vd0672I
iCskrUZRw6kCyuf+Zu90GgZdnIrpCt8xtmRBZRWDf29cfsv7zMkU4ln2DHorPI1z
8Qm66y1M65H2eSst9KZ6uaPvTHpqRJn+ek/0kl7VSbje4qif56lWOEvT9m1/lIWA
SfQVFLjgqg3Vx5vNvc8z1rPcnaYB3u4rD+UNgriy7ls7bAGlijpQzW7IBmsO5gPm
rJWClLRxgJ8imgezYpM+pgGXewbEbQ==
=+KyD
-----END PGP SIGNATURE-----

--Gaxmdjjv09Vms5WE--
