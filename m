Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A4E38E100;
	Fri, 14 Aug 2026 16:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786723548; cv=none; b=rk4IedelQ2KXyO3CDUJZ1GXVsqCzujMNIIl1jv/DuawrRRjjtLzMQIq8x+JlWcaMzrlhvUfjI+wHk0RrUYjBuQXd0/Xe2/KbEWMazdmoeJyTfqIM6ZG8d7dOV+J/AgSYMps8ciYyjrtZTrsOIR4EHs6ag3yUUvfxlI0JKSb5zqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786723548; c=relaxed/simple;
	bh=vt+rQy7nBjZ2kwpsZLzacs1KoUbIFLeoMEvU7vOmfhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e0nq/zVG0jE2119jwRUB7yqnfF2g2aY8+8/jSLI3pEOGh/0nUpOSmx+wXCe/PA9y9UkvP0wfaHx/9tsUbusNolpbVmqcVggUCwRCRf79IuxzleVoYp4u7/GBvxrSCWessHX52ipzS+eQiR3FvsjHN0mTDtQeUYC/KUBBzR1vhcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kT/Nka0S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kT/Nka0S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66121F00A3A;
	Fri, 14 Aug 2026 16:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786723538;
	bh=w5BL/q3M3/wO6Ojb4vvt+4QVTXNZMmPhLhaRKntlmCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kT/Nka0SGdeVTQ4AP7A5ZGk6wcbCCON0sj9m2qqWOts7hCeAr9hP+Dcr1NpLVjxa3
	 +yYZA/x8MFzTDCe3aDecLQ4o89HJLVh03CcI+lUmbeomF+5TxO7tec7loSRPbyne4u
	 Szm2AMstcIYbop5XmC6P4W0Fl8GTl6oRTMBz3rZLb0PzTbPMOA2/WmmTBZ+GfSZXYH
	 TJb3SbBPM38TkXcOz+N55JCb4FIwDUK8NiBZ6yn5UouxEBJj8lhdbcYDySl6J+f5JH
	 OM8k6qtYIkO/YjRyVlObwJF9G3LPKR1q8Iah0PWtc2vWNht9y9WCsWOuq3BwqI7r7x
	 6qGtpmc/KebTA==
Date: Fri, 14 Aug 2026 17:05:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for HP OMEN by HP Gaming
 Laptop 16-n0xxx
Message-ID: <acbab754-7fc6-41a8-b9b3-3fec70fb6340@sirena.org.uk>
References: <20260814131441.805406-1-zhangheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oOl6DJYwR8+U4O6H"
Content-Disposition: inline
In-Reply-To: <20260814131441.805406-1-zhangheng@kylinos.cn>
X-Cookie: Body by Nautilus, Brain by Mattel.


--oOl6DJYwR8+U4O6H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 09:14:41PM +0800, Zhang Heng wrote:
> Add a DMI quirk for the HP OMEN by HP Gaming Laptop 16-n0xxx fixing
> the issue where the internal microphone was not detected.
>=20
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D218997
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

I think we already have a quirk for this laptop:

   https://patch.msgid.link/20240807170249.16490-1-tiwai@suse.de

which shoiuld be in v7.2 when that gets released?

--oOl6DJYwR8+U4O6H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp/PM4ACgkQJNaLcl1U
h9Bc1ggAgMA9Ga0SbpfDWN+wOMPY4A1T/z/PvFGrAU6dvPohfPbZTMNrnjhwPzzA
Oqi+bTQn6biych38+A8RbMUL/HvrZTMhhsqVBHVBxbukXhcwO6DhR/eT5w5BKKYN
5dRHXode0ZdyVXjmOgE2cEzHGZfQ2ds5H/vfRgfgTsRPx449voUV1rQ45IjdjBoi
Xw/Oqveosattc3ncoM76V6McIZ9lJ4eVgVnHbUv0mWFZrCputo3EtvgkrPNEN6cD
UWwthg2cXKPT8KMvcZB5h7liKsJVIMCPP7N87mq4BCwJHLDr236z3qwlMq7RDc8H
fV3RHb2v/JCgY0erfkNFd/ak1yuwrQ==
=uO3J
-----END PGP SIGNATURE-----

--oOl6DJYwR8+U4O6H--
