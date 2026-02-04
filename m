Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD453ED10E
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 12:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770209113; cv=none; b=qKMdQJ95m1DTZ+dH+ccIAACkUtlTgmeaId+IOheICDOr75sGSl9T2lQyBGk3iere1Fsa4M8wZ2s6lOhdUNLcLpMOl5wfUiSJTj6Ux+OLMcrhdHi7VFmns1YjgU5gtB0NQDTu4Wlxed4sRi2VM8O/V0Ryiuayna2YTKz+0Eh8YMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770209113; c=relaxed/simple;
	bh=whSC7u6K/hdCF229naPw77xPWIvzKGcOPnXaexeGrGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxoMQvDNmQ1fGcZc2E3CKNJpFrXMgoacRkeoP14DoQzgJGy/UyfsCl6TlCSnmGMU3/ci6JPLbqUcohsi2LGZsb7eGr1AFBDwEV7j/Ndo0O0i40ZjBrpOax7+8KJ9oKsGrZbSM2igoTjLn2GE1IHrN2BsRd1ZBGc0dYpYbdyWPpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jbW1iWmk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jbW1iWmk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2ACC4CEF7;
	Wed,  4 Feb 2026 12:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770209113;
	bh=whSC7u6K/hdCF229naPw77xPWIvzKGcOPnXaexeGrGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jbW1iWmknWdzbp3cGoE1KvkEHGyA6DATM40YNHgS15fjPf7smRh3bNgl9StV//I9F
	 AOFQC4+tP9HQRX1rxszgWOLcyxt7ICgw8RW1XoXQwQKd49JDzo70cVuaVZaYK47Gw0
	 F8OiCpBiZVRHBvVz/J8jDIWcayrodfslHmekpvMxrjcV+JXa8bWbQQX1a6Y4Lo0+b5
	 ZW+XQRp8d5XNDv/qo6+ad4HqQKb/nNa8rlQWHfOMwosoGMVnoIOQqHb2H166CdXMmm
	 /07ickh+phQQlaH9J/afVQOrCvZXVZ9jfvCzDVj3gG3e3eohQ99a81BIU5PxHYkiId
	 bodNmfL/LjtYQ==
Date: Wed, 4 Feb 2026 12:45:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, Liam Girdwood <lgirdwood@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Linux-ALSA <linux-sound@vger.kernel.org>,
	Lars-Peter <lars@metafoo.de>
Subject: Re: ASoC: soc-pcm2.c ?
Message-ID: <d381cb56-c00e-43a7-965b-9fdf1a19fd17@sirena.org.uk>
References: <87pl6wub81.wl-kuninori.morimoto.gx@renesas.com>
 <aX4D1VodQ8Ksrad6@sirena.co.uk>
 <87zf5q1gve.wl-kuninori.morimoto.gx@renesas.com>
 <b55cce82-1bdb-4e99-86ba-024f73a0aef6@gmail.com>
 <45fde0f3-39b3-414e-b866-bb445df369b0@sirena.org.uk>
 <877bssopsk.wl-tiwai@suse.de>
 <d122b672-468c-4122-aa46-5dad427b7a7c@sirena.org.uk>
 <87y0l8r95r.wl-tiwai@suse.de>
 <7380b4dd-91e0-43d0-91ed-e475b03f7559@perex.cz>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VrwTPd4eWm/l9ZR6"
Content-Disposition: inline
In-Reply-To: <7380b4dd-91e0-43d0-91ed-e475b03f7559@perex.cz>
X-Cookie: Are you having fun yet?


--VrwTPd4eWm/l9ZR6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 04, 2026 at 01:33:29PM +0100, Jaroslav Kysela wrote:
> On 2/4/26 13:21, Takashi Iwai wrote:

> > IIRC, the existing mechanism isn't about visibility but accessibility
> > via SNDRV_CTL_ELEM_ACCESS_INACTIVE flag.
> > kcontrols are still exposed to user-space unless they are explicitly
> > removed.

> But do we want to hide those controls completely ? They may be good for
> debugging. The new flag may be just a hint to user space to not show those
> controls by default (and eventually make it read only or locked for the user
> space - depends on the use).

Yes, that was the idea - at least some of the userspaces won't show
those controls to users.  It also avoids reunumbering the controls in
case userspace is relying on the numbers.

--VrwTPd4eWm/l9ZR6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmDP1QACgkQJNaLcl1U
h9Br/wf/QqV5nyBf69Osaz58lmrHNSlxE/QFBqo5xH4pnZGecM8e66FZ/8wCHCPd
MLgys9q2CELWlQJYQzV4WlRy9XrYeE2QXuaioLgaxpxldb7Pcc2GQcTOW5ZzRurT
3QtstTJn67JILEODB14YWuy5vOaCJau9anI5Dl/iivjgKeD6PFzmLgJ0KOiFvcnX
GYZROAHQwVIgeyEHI1k7oHCHtwmFbRm/m8S89Znz9YzUQW8W8sERNnFb5PHAAkKS
2aapDsPvgeRPADfDtZWx1u0FS30ivGIvjOcEHspVP0hkddH+8mQU8FQmpYMvI6Xn
uU3vmd0427FPeZyFvtyVsRrwYfzb4w==
=Irn+
-----END PGP SIGNATURE-----

--VrwTPd4eWm/l9ZR6--
