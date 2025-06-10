Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA49E2253F8
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 11:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749555423; cv=none; b=Q1IpKmtdEcpWyXRO/bwQWUZ/RQb2WUcVdWGwD1TviV4q7f8yzPuCADvvy0NGr+vZaYbz6AXaOPbnmF7bU2fUP2Bk5+l2JxH01Ue2dy7m2PZxcD7BT6Oius9Ee3GVlHNoN7m9gubYD1EAiMl/yxKX+Dk/N+FTJicdmW0ZqGuByVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749555423; c=relaxed/simple;
	bh=IN3Ov1XwYRgzL2QB0WubZ8MEw76hReYvol3yOo4nnWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EwPcCAQz9C6EiGHzTNG2nsYgL9um0h8Cr4ORTMQ+/kAOz53i8KfQMww32/NyrejpT43XsV7/45moM81CudlLXodWjVWCKq7z7u/S0UhSivq6/XMtW+wevkIQ0MRv4SCkxqxCGMW2gYeYT0p2gIFpkDllnYPCBLdsm2uq3Gz/Nxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tordkqJA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tordkqJA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438CAC4CEED;
	Tue, 10 Jun 2025 11:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749555423;
	bh=IN3Ov1XwYRgzL2QB0WubZ8MEw76hReYvol3yOo4nnWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tordkqJAPkB0ruWr5rG79fEZnNCflY8VCX5phGncuol4sox4b9mUFl2ZxGPRpD9zs
	 qECnSDskyo2hRv5TrnXSSFdqEQIxbgJ5PMJpm9C4hRsn2GxN1nlGSawoW/PV/SmVSd
	 Iy3EJvQh2CkaaP34mASCPGurVixkNgbcvevwCMBKwCaF6DinLEYMhYd496X3RIp8FF
	 Eng9J3AQbHNBrdgtRqEU1Ib+TSzyDEIZRLfHHmrLjIo7aIh6LX7OizEAjmwv6qko24
	 /dMVm9AsuVwUycNjP0W+Ph45yHvHYScnes7hpC2/tZ22axJ4KlNyCjx8eMn5PYhj8Q
	 oMAmM0QCqyC9w==
Date: Tue, 10 Jun 2025 12:36:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geraldo Nascimento <geraldogabriel@gmail.com>, wens@csie.org,
	Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/37] ASoC: Standardize ASoC menu
Message-ID: <0ebf280a-ab8d-4993-9d32-b4013c5cacac@sirena.org.uk>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
 <CAGb2v66xb9duevXtZf=YcUM8WvoopG76_yud8PHXOnYD+i=kQQ@mail.gmail.com>
 <aEeqsul4gzxde4Mx@geday>
 <CAGb2v66MU_Sz6bVPrvMacL-wX_XU+JPWxMWjsfN=vPkzRsRoAw@mail.gmail.com>
 <87cybc8d0k.wl-kuninori.morimoto.gx@renesas.com>
 <aEet9HP7WWBTdz6P@geday>
 <87bjqw8c11.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NxUWy45BjCMUx4Xl"
Content-Disposition: inline
In-Reply-To: <87bjqw8c11.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: When in doubt, follow your heart.


--NxUWy45BjCMUx4Xl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 10, 2025 at 04:18:35AM +0000, Kuninori Morimoto wrote:

> > Sorry to intervene again but I think Chen-Yu's concern is about Cc:
> > missing to open list (linux-sound) not his own address.

> > He was referring to the (likely) fact that you forgot to Cc: list...

> Oops, Indeed
> Sorry for my miss, will post again.

I do see a CC to linux-sound in the mails I've got, and lore appears to
have a full copy of the thread which means it should've hit some list.
A bit confused here but I think it's fine?

--NxUWy45BjCMUx4Xl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhIGNsACgkQJNaLcl1U
h9AfMAf/cxAx7YH61VkHdZCeX1k56YmFblO8ufNg5jAuvmwP2R/qimbQ6BZfxotM
z/RBzO8dYhKhYiGrNPZzg7Be35qRgpC+RVuveLG+FD197kOK9CnqPA+jb1YQkksm
97W0QkuXzFm/tKFy3IWIDqNbtZkN+kXHB7IlkPdvZmdA/WiEhIXjk8Y6plp7t0D2
/oO9+h5L5q29HALz4PYMAmhKFscOJaX9FpC0faqVBEEElCMyb32A//hgctYPXpKO
mJH8kQakDHyQ5QqOv4lX6zFpfVOF7Ph9DoMxtZhycafO+EJG0OUedkkDfSjtscCB
iOgroDtLFKoXiKV7G5E1RZWki753Dw==
=tXUz
-----END PGP SIGNATURE-----

--NxUWy45BjCMUx4Xl--
