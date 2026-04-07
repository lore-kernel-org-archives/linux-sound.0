Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003592236EE
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 14:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775572587; cv=none; b=A6+wrJe2B4+q4FbElsv+jCB27w+7PMN9nLMax0gK9gziNBE4q8TYQkZ6CbshMLPHM6GW/wxHELkQlMDuh5jgHzQwlOXvnICui50/nLEsEIUmNWn564slXxObCuT6bAUs5/0SK03ABrfoCkvm1iec5i4vuVPW3WfhYY86glkISH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775572587; c=relaxed/simple;
	bh=zCpV+P3/xFtU9xkugpX5gYjzX9xl9lPL5MPfbOCQ/JM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YbfmhOq7Z87S28rJXq53pFNX+PQEYKghP2y5BwOoO8e7KgowvpgkS81J1omsRudhGZiCzr29ne3qd2LRabt0Y4otCbw6Lcd8vRYnm1P5WwLHn3Dj999qqiVAvOk2LqGF7uolYu/XrTgzThSIaGFWvO8nv6eXCeMJGX3daxCTgDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aSIGt/jN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aSIGt/jN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80276C116C6;
	Tue,  7 Apr 2026 14:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775572586;
	bh=zCpV+P3/xFtU9xkugpX5gYjzX9xl9lPL5MPfbOCQ/JM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aSIGt/jNVYlOi60nbC47tTFoetRAr7EKEGCFZ5NNbnnUFNrGvjj4OIUURTPDySzYF
	 aFDCWHuBYNExk1DBtzEGrcSjX0y7j1D43FSToxZpiHaELdFSoGcK99zOuQmaBhkiWd
	 F7TeZxbV8g4huueAdIVvhWmN4w2e7JC9e1B8p40eLiNwpk+90gXXIzdo5KXs+GPU+w
	 zAPpVs2iiHG6LpMkk1rbbkZmqbmqnejraMxvJK5QwIEbC9ZzSTKDqmYWI1WLSGxJW7
	 9iybpeo9Ta7UenpZDQntF5ncuiZ3BEukympSsYXia7WlgH1HOGs3CJ/vXJwn1fiobi
	 Ylcf1wshInkYg==
Date: Tue, 7 Apr 2026 15:36:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: Intel: avs: Fix type warning in
 avs_probe_compr_set_params()
Message-ID: <0d556e6a-fecc-4713-b1ba-ddfafeaa3120@sirena.org.uk>
References: <20260407085459.400628-1-cezary.rojewski@intel.com>
 <20260407085459.400628-2-cezary.rojewski@intel.com>
 <416e2b85-f0a1-4dac-9e36-5ae31551539b@sirena.org.uk>
 <86dc9c88-2b12-4a4c-b640-cb29c9b84264@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t/XukHvLV5OOr9Ge"
Content-Disposition: inline
In-Reply-To: <86dc9c88-2b12-4a4c-b640-cb29c9b84264@intel.com>
X-Cookie: Now, let's SEND OUT for QUICHE!!


--t/XukHvLV5OOr9Ge
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 07, 2026 at 03:16:18PM +0200, Cezary Rojewski wrote:
> On 2026-04-07 1:28 PM, Mark Brown wrote:

> I don't mind either version.  This is basically an incremental update which
> I should have sent long ago.  The warning keeps bothering us in the scans.

> Are you suggesting we should squelch the warning instead of forcing the
> conversion here?  The use of __force is present within
> include/sound/pcm_params.h, params_format().

No, it's fine - it's ugly but whatever.

--t/XukHvLV5OOr9Ge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnVFmUACgkQJNaLcl1U
h9CQOwf9F2it/jsRdItVGRGRVv0kYYsQHZ1/xXVxlvEGd2D903UqbAjQfYruLCUU
oc4M7pBHqUOrhHrGyqf+I40UGcGc1OT5bp86SNi4A4EuLyXiWwcU4v8MOSESfg9T
gr6jR/FaK569ZcjAOUpOwt87YonA4hBFyy+f4lBFAEIcrKH+EJyBbCincVuRlAgK
QNjlVFHEeZnT/O9YmJtsGYmYoJeQGzsigWUMu2Mm6JKn81xtHTGIsN3u73vOtT33
8uxMVYGtungM9OBbh31UB2umCzau0HEDBMle83OLrBRgNb5v6Tn+4mZxsjlvWHt7
09dIX0v4BGNdF7pi6pY1UvnYqZPplQ==
=7S2+
-----END PGP SIGNATURE-----

--t/XukHvLV5OOr9Ge--
