Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA16EED8;
	Tue, 18 Aug 2026 15:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787065271; cv=none; b=f8XgsIE75UPyjnleiA3yofR7MQKWr4Jysh4Rmd4+sj45cbDzV1FbSxhifRRgAvnSWCBt4CbIKB/EQt+ZEfPWIYVRS4iG6qcP393Zrdauwawmb0YVYEi5eKIK6buU8cjILvaTXf9auNuiiWTPmoz4flmOlM6lfqbKK55G8/S1yys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787065271; c=relaxed/simple;
	bh=D9KgCjTNFx4El58tXrl+YI1Lr/wKEdqnJt+ifIVzKeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hniAI3x6/eGUeV7vWN843SQEoLNctQbbCFKexm0V21G348ioGOs7oTuzqey8TM6/bpLW/83IQlhxs+4sCxLw2n1jWhTkJnCHCRcLFR5cr6Ttr5zQF30Vj0Mrf23LPjn0HJufDX4sgyQMdKJmGt11d7OFVubTpglCGxrWm3V7gE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EDD8thvp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EDD8thvp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDDCC1F00A3A;
	Tue, 18 Aug 2026 15:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787065270;
	bh=D9KgCjTNFx4El58tXrl+YI1Lr/wKEdqnJt+ifIVzKeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EDD8thvpWwCgly2j3bItzi3pgNMILRmBixfBQuA2V/VbJ/XZfBAcu+Fw4vUv5Usb6
	 g8sgNDExzVQcbRwGrCKNPynXItp0Dr2lP6gBow1HJ5sbsQWN0/W+ZiAEpxJJErJBQH
	 wxR2zIe4rB1VVsNhkMSXsYT4ih1vC9HPsimN0JYxLZEfs8q/rH4Z8dRZ8G95OSG0HU
	 wtfLOFFU06ASeNut4FtGSikZRGd8Ffayw95vFrjDWBT9atQtadWpLuRbU0pfwG6gK7
	 NXTmxpDwe0hQw1vg9WAteqFdQv1dsSVZQBdXS4lDzLGT6wMTnAr4bvBmIwBPdPCGW+
	 STO9xd0UtE2zw==
Date: Tue, 18 Aug 2026 16:01:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Sataporn Saijai <excursively@gmail.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: Intel: soc-acpi-intel-ptl-match: add
 rt721_l3_rt1320_l3
Message-ID: <67f89540-e9ae-484d-9c6a-817c5d88afdf@sirena.org.uk>
References: <20260815182747.8913-1-excursively@gmail.com>
 <c75806b8-7dd1-4cac-b4ba-e457d8aacce4@sirena.org.uk>
 <CAHgGaxwrLQ3+gKSSxnOBYMYFRgcbQG9eHc6xy-i0DsKhVY7zTQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mZfmjbTgYIEfokYy"
Content-Disposition: inline
In-Reply-To: <CAHgGaxwrLQ3+gKSSxnOBYMYFRgcbQG9eHc6xy-i0DsKhVY7zTQ@mail.gmail.com>
X-Cookie: Smile!  You're on Candid Camera.


--mZfmjbTgYIEfokYy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 18, 2026 at 10:53:12AM +0700, Sataporn Saijai wrote:

> By the way, I noticed ptl_rt721_l0 and ptl_rt721_l3 were dropped in
> 7.2 (they were there in 6.18). Was that removed on purpose to use the
> default machine driver? If so I will just send the DMI quirk.

That's the general idea, and if a DMI quirk does the right thing that's
going to be better.

--mZfmjbTgYIEfokYy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqEc7EACgkQJNaLcl1U
h9CyAAf8DTo1VMaeTRC6pNINBk7QhRk8tIOelPd1igeLixz2JOJ+shnGM8vUdq/Q
dPZsYt9mSVul4Ypj3hpsweGyvuhmVCIhX2fylX8Uxp0uY1GCtbqBXx+cGxQzdpbX
HC9mMKS5GgPqOjdIgQnKmu7veTL/ZNspK6HPQ/JHWHctjW91rwr0qDW71LU7i50h
SRiE8BrruHYgZLgp+9cJYBDknM2rVa4iBLbPipm7nQ9CQVxG4fjxU1X78z5iFgLA
yV+m270hbBDhJnlanAk8EA5X1c049G7WOJoFdTrRBuN9ReJFzOF46e0i1f6J041Z
ISwrJdk9GfCD+mHKyV4kHeG9QPqu9A==
=u6P5
-----END PGP SIGNATURE-----

--mZfmjbTgYIEfokYy--
