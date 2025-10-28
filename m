Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F95255F28
	for <linux-sound@vger.kernel.org>; Tue, 28 Oct 2025 21:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761688685; cv=none; b=XDl5iMFTYc9PMNvf2sibiIGXdaix1rbM21ZpqoAnZnqzX6pt83ngXdH+JW0R38mp4CrrPQWpdbCkzaacki/RBTyAzOb2UXXf9UtCyG+gIUVbj1QBQ6D8thO2HdTHwiZyj83TrpdNcPw93HmQl7SkonrCjMw12/9n3p1I3hSPfvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761688685; c=relaxed/simple;
	bh=0u+hyfJ7Qrs1sX7aDxASQtaTiWOS/Zd0iPyctv01GmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKFVd4sGs1tajazpURHkdVYH3Uc9MsUpcgtrq34UcNrRrEArlMMyZQphM42hLWdpPp5VHgkqs291LfidiNhbbSyVZr+xQ01HklRIC/UCfbcyEThWx2uEdv3WHqO+EreWU4a6gm/gDIMesu2NGWKMYA3v3rvuGCUz6IS+3leN7DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIkGbg3T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nIkGbg3T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D7FC4CEE7;
	Tue, 28 Oct 2025 21:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761688685;
	bh=0u+hyfJ7Qrs1sX7aDxASQtaTiWOS/Zd0iPyctv01GmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nIkGbg3TuXZ0U7Dw2KFMSaJ7iy3gfkuESQcHDowrP+EkkYh2mlET+KeivE+i8Jyxu
	 VOm3yU6TcEzh50XHi4P4VWjKdseo6OzrkRWumAQjccdxGrsuAr5aWUkc9yMhpALTX8
	 UtvghVHKHJ80IQWbAz1SZGdBd6Q2mpzxupqYZYlGd6ZgrCok1Agp0N1JquKECuBR8N
	 6zY5DzSu6/MSjX/ndsnK+KITt5SmP0vXfWzecGfJIRnQk+DeOKvnoRuUxHmHgEMsPK
	 vRLSC3B+iKupmJqQV/A82K9j3ftemXqDgv2pL/CwyoZfM62Hop5b0mXS2ho7A4QGIe
	 uFiyzdiNfstmg==
Date: Tue, 28 Oct 2025 21:57:58 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	lgirdwood@gmail.com, linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
	shengjiu.wang@nxp.com
Subject: Re: [PATCH] ASoC: soc-pcm: Preserve hw parameters from components in
 dpcm_runtime_setup_fe
Message-ID: <ce4ecd1d-b8c6-4f90-a461-c954736a6c28@sirena.org.uk>
References: <20251023081404.3740-1-peter.ujfalusi@linux.intel.com>
 <87pla8oowa.wl-kuninori.morimoto.gx@renesas.com>
 <25cbc999-bb13-453f-8210-c0fd38866d2d@linux.intel.com>
 <87ms5comw9.wl-kuninori.morimoto.gx@renesas.com>
 <198b0f78-da46-4895-8f38-dc1aa398bfc2@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+ZK1obrTg9OkxtAU"
Content-Disposition: inline
In-Reply-To: <198b0f78-da46-4895-8f38-dc1aa398bfc2@linux.intel.com>
X-Cookie: Your canceled check is your receipt.


--+ZK1obrTg9OkxtAU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 09:07:11AM +0200, P=E9ter Ujfalusi wrote:
> On 27/10/2025 08:54, Kuninori Morimoto wrote:

> > Yes, I have noticed about this RFC, and you used other metod
> > 083a25b18d6a.

> I,m not sure what 083a25b18d6a is.

https://lore.kernel.org/r/1678346017-3660-1-git-send-email-shengjiu.wang@nx=
p.com

(that's a commit ID upstream).

--+ZK1obrTg9OkxtAU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkBPGUACgkQJNaLcl1U
h9C/Igf+KceRKWY27/vGPeuWInMtUPG2bato9obqE1PqQ5d2iZ98a2FZfFThLUG+
VoHh+9AA/teC1UgdfMs10VAZ8TjdpycyxTI7Ec/DD7JaTk59Ye8004R8kJw8SByH
ikGct13cFKlgr3SiZ6kUPyQfzp1wtBf3UmAWM3KdfZbfDjhey8+8G692Ovbotb0k
cb63DHJVLk3bX+rxWPsZVgGnTvNUpopvbWcT4aax0O9MNFR6xss8e5NLeC7GAKYP
O9A3s8EUAY2DU/QsYJrigufBzhvgHOK+rF0CVJzvLUcYkwwUwwTygpWEnIBPipdy
4CIMpbj0eL+U0GclLr/B5MDS3AG+ow==
=32p1
-----END PGP SIGNATURE-----

--+ZK1obrTg9OkxtAU--
