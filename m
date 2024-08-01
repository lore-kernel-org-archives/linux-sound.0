Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664271B3F25
	for <linux-sound@vger.kernel.org>; Thu,  1 Aug 2024 16:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722530317; cv=none; b=F8IMWu7SFzKKWKlXkvYA3tGePyEbrT1LEdW3M8GXt8Jc3Ef61Zj31AJYomJUMpxjglpIH9gjtSfqNYlXZ1I5PUBIzTI5nNmiqrznPSEJW4QGKAe27ZPkflIJo1ljSelvIGNZRAJI3/plePON5p+ZsafJDt7YIfiB8lP40gJU9Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722530317; c=relaxed/simple;
	bh=pdy/MIhliY+lu5Q8bDIfNiCCNFh8h4zd3ooCjFyvgHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tm0iNUmMdBT0fT64nK2NDDp8NAwA7DvG4QM7Pr0lyJNq9rk05BqheiaYIZcrjy4+Z4YXAeRR1aC+QpMDhCdJbbxVDCF+yVuTrKRaSZujiOnp2XPBCofcv528VeqIrKu3MM2cjfFpi1fnzELzfbZBugReUa1E6g0iCQhkah3fp6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=muZjGF5P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="muZjGF5P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E589C32786;
	Thu,  1 Aug 2024 16:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722530317;
	bh=pdy/MIhliY+lu5Q8bDIfNiCCNFh8h4zd3ooCjFyvgHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=muZjGF5PGJXlYheQAUhaMoPEovmsagjoiNRQ5YTU+lWGUnHYihFH/dtakJcaKVGjx
	 Ly6+9JcqsXOv6VBRB2yshZJs1sCsQYEdJQLansoN6j1DIO1irRF0l58kfGxCIHI5/2
	 xG3w38nA0/PZaQ3NkPMQQ/kXwm1gqaXEV8tYyCz0xucnPDOQ2Zx2f1nEu+QVts/KUD
	 shvhR/AIR0FBzIaUuZ80MKcHY5e8LwCJ0I9RqHt9TOR7vvOpa2jdfWx8dpiWsFsHaj
	 t8tvZkGjh88Uh514HBaOSJSBE88vx3zWefZBOd6pwAiAqKdpXPchk7HCwlv805NObn
	 1UUgN9/xA25FA==
Date: Thu, 1 Aug 2024 17:38:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v3 3/4] ASoC: cs35l45: Use new
 snd_soc_component_get_kcontrol() helper
Message-ID: <c4712e65-2914-4fa5-900c-e85edb7246d8@sirena.org.uk>
References: <20240801100413.1620481-1-ckeepax@opensource.cirrus.com>
 <20240801100413.1620481-3-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l4wefJZHnBqvI+o4"
Content-Disposition: inline
In-Reply-To: <20240801100413.1620481-3-ckeepax@opensource.cirrus.com>
X-Cookie: Keep on keepin' on.


--l4wefJZHnBqvI+o4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 01, 2024 at 11:04:12AM +0100, Charles Keepax wrote:
> No longer any need to hard code the addition of the name prefix, use the
> new helper.

> -	kcontrol = snd_soc_card_get_kcontrol_locked(component->card, name);
> +	kcontrol = snd_soc_component_get_kcontrol_locked(component->card, ctl_name);

That's not the helper that the subject line references, nor the one
added by the prior patch - did you test this?

Please use cover letters for patch serieses too.

--l4wefJZHnBqvI+o4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaruggACgkQJNaLcl1U
h9CDWAf/fTuOyr3u+E6XW4FIFD2a3vy5AklQo06afZB1f/xec1iAeIXYXXVkLzpA
PSuAxqe0ErdamSCXA0+QxVprcTbl/h9XSH0Z5dcu92H7M6J2/JKWmcz4w8f7uU0f
p3gEEUv8wF+ea7SE2roSEBbZpoHEvMOZLGSQa0va1sOmU80yOiOJoMdWqi+pJoPr
3LcM+QmgWwn1QKIW7LjETE7PEecVQqRhGkUGVBs6ROddmOErcUR9PenyOAv12tlX
c3DLJCa8FfQgGAZ/lenRHg7atXSdMEqFAyPgqk7ctLJEAoXl+D+GoP6/9fWors5i
30DG2upAPe6bbJkPFouHE/nEwsJHqQ==
=KL3O
-----END PGP SIGNATURE-----

--l4wefJZHnBqvI+o4--
