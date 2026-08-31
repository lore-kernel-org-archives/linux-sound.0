Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B88A3F4845
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 12:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788178462; cv=none; b=HaHWDa/Zc2+OnqhGHziRW92j6l/O0Cl+6CkFbdHPG7mQvlB7hjjIAPyXWzvGDSJd8VFjb/2ln+zUiVZ4edDb3XN6VIpojCyYEDYzCWpc+kwZH+C5mkuDJ/b4GoqRdbM15AGw7T1VTjbx+WI3mZBbxB+5ofhnMDBZNHbhNYxT800=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788178462; c=relaxed/simple;
	bh=j7mwSofyRBIb+2s9EcwuHHLsEm/TGgqrpEbXsP0nfWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kKAtmnYSYhTZjx9vcAf+4xw18XQ9l94HtYRd7n3mHxWOgek0I8wzw0fRCS2zXFLyWPHT6zA3Qt3cKnfRKA4LSz1liTgnxq59qYttIZdJTb5ulH9KbmFhCT93S8MX2s3MdhmqXdfxMpo2QPyZ8cBd/xk2P2ReSKl76Z7EsK0gUX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOVywn2q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MOVywn2q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3BE21F00A3D;
	Mon, 31 Aug 2026 12:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788178460;
	bh=LZ5etioNDv1DUGpUeK1yJrVycEM8lV9AvbfhrYK2Ai8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MOVywn2qKFaMIxlmoO17KR1fwbzicvFll+qkihRTMVPvkxdLMhCULDDDW9FNlIb7e
	 W/VrTnFsjT9JRQ/F64/lyjz5cYFC7JURkzmGgBlqntb6v5GEYqZ8hC/i15xQnzPtvz
	 o6nQRy0ntFv7qOYBKTi2stroyUqEHCSLlRtsz71b4AMekkuVx/Hwm3AH5vDb6gOZuL
	 knbq5V2ZSSdzS9im9zYX8RhPs0wkBgl2qw+3E12SR/Ti4qORTl3TCl3crUL2WbZS9O
	 t7YWNntRK2ZRHGdxStx7XMZ2Uu9mAZ5V2g+fozhBfLNLL/vzhGq90o1JTNDnugdmWD
	 YfTWyV02UnJ0Q==
Date: Mon, 31 Aug 2026 13:14:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 00/11] ALSA/ASoC: Intel: avs: HDAudio bus and general
 fixes
Message-ID: <0ebd78e8-4f82-4721-986d-db0c0bb3d2b6@sirena.org.uk>
References: <20260831093615.1117987-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ojEHj5AtVW9MEt4z"
Content-Disposition: inline
In-Reply-To: <20260831093615.1117987-1-cezary.rojewski@intel.com>
X-Cookie: Sell by date stamped on bottom.


--ojEHj5AtVW9MEt4z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 31, 2026 at 11:36:04AM +0200, Cezary Rojewski wrote:
> The first half of the patchset concentrates on the driver initialization
> procedure - a number of steps do not clean up after themselves when they
> fail.  This is for both, HDAudio bus (ext) and the DSP part (avs) and
> targets following procedures:

This doesn't apply against current code, please check and resend.

--ojEHj5AtVW9MEt4z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqVcBgACgkQJNaLcl1U
h9Dugwf+JRjYwdLKRsh+0hZubH96mdScIASf2G46PDLbYd7WQ1Urlnp9CVn6kZ+u
iV29kFWiZMQlgEh45CpwiNoRck23sS+mw9Teo2Sp5S7nxqEhp2WMpABOXjFFF1BB
59rkCvnOKXooksGPYKk3pL95a6mu3rsso+MaEEo+V4J3BXpHT6e1gZU9H/eL6qV3
1O+JUXRrBZ4HMn6ImCj2YXrL8EbEktYtv8cdN59yAeSY2hY3IYL0uT7IqaA2m1V2
unXGovPxJC8HA9+SbvZSU9J5lx7MxKuB2Zhf3oX9nZNf8zRO/vtmbWTWM6+ne47n
FPub4c0aQ8YQ8vY9uKK6+xQh1mTe3Q==
=Uagv
-----END PGP SIGNATURE-----

--ojEHj5AtVW9MEt4z--
