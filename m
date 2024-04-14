Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FA415E9B
	for <linux-sound@vger.kernel.org>; Sun, 14 Apr 2024 07:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713080759; cv=none; b=Jd/BHIbQ7U5csyGytkfXzK1uGguZtcPpYIAB2Pz1BcMOfp66hEos431OTceNudY1gXR7nxAaiLDi4X3fxgLoE+luOooa1hVUJ2qR25ydUouL6aA/izjpbkRyD9+AQk+evi5d20dgMQRDYiPftRQl6CbsdrA0TdCYUwCRTnfCpHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713080759; c=relaxed/simple;
	bh=3sbhqWfLgMRISw0ujNQdXYwNSUrBkKeEp9OhKPGEABo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZfUzYEcv2WFeq5WtFFcPyv9rph4s6tkMdfCaZ1b32A2v7o3fYW2vu+IEo4q8zA8oygNiwKWU8oX8APei9M5UGmxppmjqNBmpH+S5f3IXp4eOkB/yEFffiC3CjqAM3/VaFXyimNwWYW/5LDqX3mNWraFY0WlltQgElkMQbDmEsuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l4Sv60XH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l4Sv60XH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B60FC072AA;
	Sun, 14 Apr 2024 07:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713080759;
	bh=3sbhqWfLgMRISw0ujNQdXYwNSUrBkKeEp9OhKPGEABo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l4Sv60XHbjRzwllRQAkgRKWrvcgYtd/TkopYt6wJ1r2R94mAvpqw/FIS+sNFkBAoZ
	 9daxryu2bwtVH8ceeElzFRp+ZQbQYxn7Q8yQmVdda6Ii8zL78zd80gGX1lgc8+GcBl
	 aWnEH30TBS1NeO9AEvw3mGfiHT7c7ALVXd+lJzFbJz1MCBcE2mlXOv+qj0R7yV7YqK
	 tOwhx9Jru2dHVXE03K/DgITikrovx5NF16QMukFEXMtt4vqQXmmQOtGjuc0SzCU8E3
	 mqvf3OX76oUYBnN6a4P58R4UVVIc+5JQ0zM3uYYkpm+3M4kFo1Vo2Uxgg+Be3EZW5E
	 oaSCiZ1q9JJdw==
Date: Sun, 14 Apr 2024 16:45:53 +0900
From: Mark Brown <broonie@kernel.org>
To: James Ogletree <James.Ogletree@cirrus.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>,
	Jeff LaBundy <jeff@labundy.com>,
	"open list:CIRRUS LOGIC HAPTIC DRIVERS" <patches@opensource.cirrus.com>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>
Subject: Re: [PATCH RESEND v10 5/5] ASoC: cs40l50: Support I2S streaming to
 CS40L50
Message-ID: <ZhuJsc5YaM+Hk7es@finisterre.sirena.org.uk>
References: <20240408153214.42368-1-jogletre@opensource.cirrus.com>
 <20240408153214.42368-6-jogletre@opensource.cirrus.com>
 <F09C19F7-F3BC-44A8-B3F8-3064DF8E666F@cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kIsN4V49kzr/aXLT"
Content-Disposition: inline
In-Reply-To: <F09C19F7-F3BC-44A8-B3F8-3064DF8E666F@cirrus.com>
X-Cookie: You might have mail.


--kIsN4V49kzr/aXLT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 04:40:34PM +0000, James Ogletree wrote:
> Hi Mark,
>=20
> All feedback to date has been addressed, and reviews have died down. Is t=
here
> something more you=E2=80=99d like to see here or discuss before consideri=
ng ACK'ing this?
> It will be going in the MFD tree.

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--kIsN4V49kzr/aXLT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYbibAACgkQJNaLcl1U
h9CpTwf/Z5e0MlMw1/qLf1FrMnWuqbXA0wvK9GNK1CLAsRDzFMmsEgM6EdceQXYE
HDh8lh5h+bT24o6NrbyZXpSLeLdMtJMne6ATX+qk70t8yuxblcK0mx5xNfJ6cg1H
lxhQ0gMrl6hnOLp/jZ1PJEUhg3O3sS3SPe4SzGt31R6Czi3aMiG9Ba0IHUKzpv6z
17lMkQrzKLowxiTWLC+dAcYD/h5MJkxl2g6Hq+wKBSCN7JzEg1d5/doMbAE7AEBE
4tCsUWBIiByno1RHrT/dF/UU3LjWlBlYN9GPJ1ixuzHjaQhl3HlvSSqFwAJHG8qK
0dFf02g5tEcAVvx0akYFE1aAHlA+fQ==
=AX0E
-----END PGP SIGNATURE-----

--kIsN4V49kzr/aXLT--
