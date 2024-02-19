Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8267F3A1CF
	for <linux-sound@vger.kernel.org>; Mon, 19 Feb 2024 17:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708362124; cv=none; b=qNdaa+3/apt6uOs82HaYRcQwiPTpfyxrOcrYPTt0YZmSV15RBpbpO4Tp0snYzyjSzB+4C+fwH7ks/Z/qY16ZzLHKeFoKh1bkdx2mJlp2iT2fOndP0IQcJq73vrR8aOSmv8YBKcF26nCDtv3d6vzv2Qp/Y7SRr1l9IxyfoGUpp8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708362124; c=relaxed/simple;
	bh=bJOPxxCDkM+K/UtyVWDrsBHz+rgVEgeOy580DrBmBs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kCqmSdiMo7xVs2mE+cbDzVtBd47zlocY2TtKHSYzgeMBqwAPhtdOQDtPjrd/5HloIzyNQ3mYn++aOHgSVsJp7lbfhtAVuxmMYNlkKGAQW9sUGU2DGqGU3FfMnEvofsmx/RC48jsVvmyuSMm1NfwpPqqeAdqeIxQQ6JjSdLr1dnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=usx3a1T1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="usx3a1T1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63CA5C433C7;
	Mon, 19 Feb 2024 17:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708362124;
	bh=bJOPxxCDkM+K/UtyVWDrsBHz+rgVEgeOy580DrBmBs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=usx3a1T1+ZLQ0X1nJph3o4DhJ+e25/W7FcM34hk+WqdODZNO7S5+MpyUy01VrZhXs
	 JFPC/i4jVDKzbJriHmV4s/dzMOpR+xW9YRAZXvgiNmG4AvyGChrFmDQRl7+lJKJd5m
	 QKJprB783lUvuesajXSo10Dvd18XKgrT82jlqv16Qc6JV4wfUc/dG8RRKVfz8ySlOo
	 arB090L11rPVIwGecPm6P3btDAydu0NUTAnz6/JZ4pc4KTfHIQrVovQwAQtQPc2D+9
	 h5BIFnxG6Tpr+8DXNq7VtNOn4McydOnHVYbOEUeUj/39Zy3QOpH/yEg/t1UJNHrvIV
	 n1TFK6UIJj3ug==
Date: Mon, 19 Feb 2024 17:02:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Keigh =?utf-8?B?UmltLCDsnoTqsr3rr7w=?= <keigh.rim@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH] soc/amd/yc: DMI quirk for LENOVO 83BS to fix
 malfunctioning mic
Message-ID: <0819f401-e208-4a69-9ae9-7a7dbf33ee8a@sirena.org.uk>
References: <CABRAKeKJg8H0s88yGH96S1d=vZmGjYa3g34XEkR0PmEjhVLA2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lW//k3n1HaOJLtl6"
Content-Disposition: inline
In-Reply-To: <CABRAKeKJg8H0s88yGH96S1d=vZmGjYa3g34XEkR0PmEjhVLA2A@mail.gmail.com>
X-Cookie: Kleeneness is next to Godelness.


--lW//k3n1HaOJLtl6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 16, 2024 at 10:05:15AM -0500, Keigh Rim, =EC=9E=84=EA=B2=BD=EB=
=AF=BC wrote:
> This patch fixes the built-in microphone in Lenovo 83BS
> (US model: Yoga 7 16" Gen 8 16ARP8),
> another recent AMD SoC laptop that needs a quirk mark-up.

This doesn't apply against current code, please check and resend.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--lW//k3n1HaOJLtl6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXTiYcACgkQJNaLcl1U
h9CMHAf+Mr1UEaRvYR3dBXM6pz/WPbNnIyYOKBf6bZpdhI43U9iHDKb9UaFGawaE
r38r3EvCpSeKYNEgTnGE0TUK8nr73jV+//2JuRa12HMD1bDKqFHyXO+RMpe+IYoi
dp46UhFsLNxRIvGf7GA90CSsQqVp0pr9vswazVbgZSMEOwIgkM+cTAdMkeJP7zVy
n938SYjnYduVyeHJc2ZI4ctFogcD+IJPgFaA+xEeFPHhNnTswynh0aUTi5UtcJbb
Uq1emMB8UQKHYaWr3d7+6B+sXwjRaP6xaO9PTUrenpTnEQU9vaJTOI6jy4uNiSaZ
X5q5vr2qRz1zSLxaKnC14p179FqByg==
=96br
-----END PGP SIGNATURE-----

--lW//k3n1HaOJLtl6--
