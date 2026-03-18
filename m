Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BD230CDB6;
	Wed, 18 Mar 2026 17:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773855526; cv=none; b=iG72b9yQcfQ3oB78uVqy0utgLjnteOB6qgVgLHSG9L1Z4gkm/kH1f1IvRDLqB8UL+APKVrDfu3Hh+Y3sZrWrviYjnfMGtK5WweE4jBMh+sG0W4wI2bXxVyL2aTfkqIZvq1zGDhc6zh/1bnIKnERzIYpKFfRq3G741S/pnkltYcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773855526; c=relaxed/simple;
	bh=n1Z25atg8AI9ohZCPBLUAHR1CoSL7EHzfwCieaAiFe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=taHlk/gxw41kmXzBvVqjDUxEh8fVpNZcxxSmFIrOmxJTa68GBJ5u2Za4ex+XBAmnkYKbBeQUSzYgwPmPIZeGIG/Lwo7+VcVtEnttP+0onhouR/aNtDCXakgyUviesuVw/se0UAHITf4B05pHl+x7vwFKDjvE6J/2+yyqbqIQPw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFaC8XN0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFaC8XN0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C7BFC19421;
	Wed, 18 Mar 2026 17:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773855525;
	bh=n1Z25atg8AI9ohZCPBLUAHR1CoSL7EHzfwCieaAiFe0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FFaC8XN0wRyT9W8TA4HimEQ0NEWx3NwPGGGX1BB8IyKRUiH1xnOsA5yuej5cGfMjK
	 s6ugMruvUSd/Z06tkDImvCwzj+ljY02lH+RFOqC/vPgXBT4uEjg2rqaNhWJ+iuh1Ci
	 HdjudwxlhEeGh3fOZS0pIWVihXT7MHaAYcWu69OlHMub97ctOC5D7GtZOEsEcBs7eI
	 dROtcuptECD2Uv+png40nMfouedmHn9uVb0MObU8gVCeMdkzgLaNfr47+ZhF7lMCI6
	 czePls60vsEiZRBhc+YXRB673ZJDJwma0Epghns1qzjLI8tMVDjj7QOHtaRkFVDXxx
	 N0WRgiyth+FwA==
Date: Wed, 18 Mar 2026 17:38:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
	lgirdwood@gmail.com, linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
	perex@perex.cz, tiwai@suse.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] ASoC: SOF: sof-audio: pcm_id is __le32
Message-ID: <3a2272ae-97d2-4f62-bb06-900a8831e544@sirena.org.uk>
References: <20260318164800.1086567-1-ben.dooks@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="edMBw8NX9CoL2eHF"
Content-Disposition: inline
In-Reply-To: <20260318164800.1086567-1-ben.dooks@codethink.co.uk>
X-Cookie: The coast was clear.


--edMBw8NX9CoL2eHF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 04:48:00PM +0000, Ben Dooks wrote:
> The pcm_id value is __le32 so convert it before passing to the dev_dbg
> function to be printed. Also fixup some other uses of __le32 data and
> a couple of places where %u should have been used instead of %d
>=20
> Picked up by sparse prototype for variadic and printf
> function checking. Fixes a large number of sparse warnings, such as:

It looks like this needs a rebase against -next.

--edMBw8NX9CoL2eHF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm64x8ACgkQJNaLcl1U
h9Dztgf/RWtsxB87+CGYZheaxFGyyJSm9BgUfvU4o7HsFJRjxFMx3BDKX3dz9I90
E4PvZIsc+QCVjqd5HJoClvUISc4KpFm1R1cGFKRqr/RYKjcajKwlU8K8Apaf6icU
qtTk1OOZcNP5X7JzxYKAtNnwE/jUBoLAjp3cPOJ2VFkA6sGyBsF6P9P7VeY+n/zH
iM8n/4dHruAl0MAd+dbGR+x3UOz3NuRmP6JA5/ENo1SEP2PxUt/Up6jtczD/NGAf
GiwYpveuT+oGEvQreAeqGq8xOzwAkUlPJ0YHLtfg8M3unbS4bK9x4VQqOirsbZfu
RSi9pyu20aPbEabEgIhchGGpJBabng==
=1LZB
-----END PGP SIGNATURE-----

--edMBw8NX9CoL2eHF--
