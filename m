Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14460180A85
	for <linux-sound@vger.kernel.org>; Wed, 29 May 2024 11:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716983288; cv=none; b=sSmFdxGre3x9KLubRyaB7FvwNugQtq6UPD9zo2j/2i6tu5guD26h8w2vpivtRPDwi6DAsZj7eVYUgVDAUTe5bghAuP8h0FHAX1qTPfxspnCGDlVEjGWm4Gg4lrUmdRbC2PCtyDZp/wV1Niyn4oIXBZFdKhvjppDQqfgagtDxSCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716983288; c=relaxed/simple;
	bh=PQZkVSO/Ncn/xo+ulzs+PIVS4b+LrB4lsLHY3Wj0Cwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DcNAAsfAv35GF+l+jJBvJLBq/mz9I7YZdsX6qmlmjTUJZS9TSfFNRrGl7zvPQBsQmgEMQULtGYrvcdeHgFNXAypJDFSJlfxhFMhrIuw17Hj3yUkzpFU/nmhCYD/CY5IsN047sR2CokC4JruWCc2ZigyyK7QJ0Kba1jWuDOqzaHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKAB14fj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKAB14fj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E28C32781;
	Wed, 29 May 2024 11:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716983287;
	bh=PQZkVSO/Ncn/xo+ulzs+PIVS4b+LrB4lsLHY3Wj0Cwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dKAB14fj9MSMRzQCKMe9zTMpK8CWgwUShmHbwEG+5B0v1rCUcZJh8u+qf7Zwcwycs
	 PPo1hQrNPY93UekDNQoMpAvV5OlIROqsQFSLXNQP8aIE49PxsXIvxWPqqppFE9omNu
	 SO9zy9KSoDofoGjfB7OJw4XrpuzMBi3FC2BoTjNzSfgpimo2c8h02kRdz19kpXvE5B
	 2uQEjglYlavFVNxMcE3hs/IkNe64rp/HKYypIavhfrHf0CGVdXXGl1lgClmWmz4spJ
	 DoNv1h4UUirkZ74Va1A3w38EhW3aYqx94IgdRNxw1OVSNMEm/9Wq34tNBoNShVGlEN
	 0P38DqEZlYsaQ==
Date: Wed, 29 May 2024 12:48:01 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com, seppo.ingalsuo@linux.intel.com
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Add support for NHLT with
 16-bit only DMIC blob
Message-ID: <3a7fa9d4-dd14-4b29-b977-3ba9c5b4ade7@sirena.org.uk>
References: <20240516075611.18018-1-peter.ujfalusi@linux.intel.com>
 <d4c5e7a3-710b-4ff1-95a3-395dd780fed3@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KmrS+WhTTVoMmRo5"
Content-Disposition: inline
In-Reply-To: <d4c5e7a3-710b-4ff1-95a3-395dd780fed3@linux.intel.com>
X-Cookie: Everybody gets free BORSCHT!


--KmrS+WhTTVoMmRo5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 02:19:37PM +0300, P=E9ter Ujfalusi wrote:
> On 16/05/2024 10:56, Peter Ujfalusi wrote:

> > The ACPI NHLT table always had 32-bit DMIC blob even if 16-bit was also
> > present and taken as a 'rule' which obviously got broken and there is at
> > least one device on the market which ships with only 16-bit DMIC
> > configuration blob.
> > This corner case has never been supported and it is going to need topol=
ogy
> > updates for DMIC copier to support multiple formats.

> Please ignore this patch, I will send it again along with few more patch
> building on this to close the gaps with the logic of selecting the NHLT
> blob.

Sorry, it's already been applied and published with more stuff in CI now
based on it.

--KmrS+WhTTVoMmRo5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZXFfEACgkQJNaLcl1U
h9CNTwf/U1lVnh9TaZGSyvU2SXRVQ7QatuHbz7W/y/UN0b48rcjapYXd9so+Z435
TEUCSQUnpse1b6mkUklZNF/yRKOoMkhPqWs2L4hCn7AXNo3QinIISqyrejlJdcrn
SzFAIAU+7oC2jRUHyL2bOfyhZcy7Ta/GH0zGEFHODiBGwW1FQLStuk93PCxh9JUj
NH422JJcSW4pjrZ4Vbj4mxu1U+XaDevj833qH8vy8YzpcAQmwd0Wd3R2yNbzM+98
0iJN/60CbSUYXtYOaAJGVeCOPc2QqMlTxonC2vBQ6aGPb3ZNcQBxLUaqpC5Erwrc
POCx2YjXPNr6QpwD/K4P2zSrEw/p6w==
=uugG
-----END PGP SIGNATURE-----

--KmrS+WhTTVoMmRo5--
