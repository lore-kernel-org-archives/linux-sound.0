Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45323BFE2A;
	Mon, 30 Mar 2026 11:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774868764; cv=none; b=ACzOX65HJNI/UlIBpd9718zz07M1HWQVw2FJKlit/ELga6WZg2vUPH3+t3ZHRE2PcZjbaWdnFA3XyoQMlr2S6OlEXTnbePmt7Hp6HGiZ9rVHZNoa16A6KIVDaGXLVThe7ECzeU1KQaVywA/EIauZmtO2JCDmbTWVnUPVdcWzyT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774868764; c=relaxed/simple;
	bh=gm7L9Jb0a7ZqAAJZoi5Jj7/ichfQ4DlOp3LYFKERn6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kEPIN1mkO+MiHGZOi/HAp1oPzDpU/Ns0b0Bp7yMcZLczTzu1YnKMTwgFIu3N0uJV1br8hPQ/sqkY7VQo4dy5rDXtI71fIe/87TnHWAhteoeO591fnNyjU+EK5xPaPapBkmiFIg0ztviJzCZHyMx2dMpX+K9Mi1Qf5K/ymU3MdoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DWTvQxEh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DWTvQxEh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79111C2BCB0;
	Mon, 30 Mar 2026 11:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774868764;
	bh=gm7L9Jb0a7ZqAAJZoi5Jj7/ichfQ4DlOp3LYFKERn6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DWTvQxEhKt6KfFWswJEOlpWNi95djAR8/elLEzE5pzlDX2p3Lx1j/mhzzcYPAUvWj
	 rZbbs6HrZMRVAP1Fgkei9hJ68+eWRSVL9BZf+bFxkXS3FRQerFUyzCo0c3XGJluzzf
	 aEsSCM65f5JjUBNaJoe3txUbwGDApDwVip7gFZXGA5vnBltyIn7YbjO6vN4e1rSwhx
	 CtDejVCj1LgW1fLw4LFhtqpSJZLOC/CGuTKz9++84PqnjA29rMVjla57/GVp3nikgx
	 y8GbwVgyHYb6PLJ1KRy5EdGCKl1zAn8QssNKNcLArSk7QsrlEMBfSm+81CVZeEQRM1
	 B9LX7wA1KgzkA==
Date: Mon, 30 Mar 2026 12:05:58 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Paul Olaru <paul.olaru@oss.nxp.com>,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] ASoC: SOF: Don't allow pointer operations on
 unconfigured streams
Message-ID: <bf12ef77-0d28-4454-a910-59bf915b5048@sirena.org.uk>
References: <20260326-asoc-compress-tstamp-params-v1-1-3dc735b3d599@kernel.org>
 <3cd96fe7-4575-40f9-a1f2-610fb1fac5c1@linux.intel.com>
 <aca1sW6ca1QJBN9V@sirena.co.uk>
 <e3c69a0a-5ed1-45f7-9180-9268bd671df0@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EaVZ8DXArvOa0+dF"
Content-Disposition: inline
In-Reply-To: <e3c69a0a-5ed1-45f7-9180-9268bd671df0@linux.intel.com>
X-Cookie: HUGH BEAUMONT died in 1982!!


--EaVZ8DXArvOa0+dF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 10:01:59AM +0300, P=E9ter Ujfalusi wrote:

> Should this be fixed in core level to avoid repeating the same check in
> every driver?

I did wonder about that but wasn't sure if there might be some viable
use case, especially for things proxying through to a DSP or something.
We don't generally guard calls based on the state the stream is in, and
not every implementation is going to try to do the division.

--EaVZ8DXArvOa0+dF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnKWRUACgkQJNaLcl1U
h9BHxgf/ZcJf9N2lYb/EcQk1zcBLD6jdEoU8c3XVDSJQDu9NI091uVRX+pk0qPaJ
A/hpgRPK1yIh2PodRx5V2zF2xdHez3kaCShoFCHjVqrOk+Ia2lt/d4P45Y08iBHd
xwaiLBaMBoxAuZSqghHUud7egJrDgjBEZhMMcqcVS/rZtCENgpLFmtuRH+vvojdg
/+qP2OQ1A6ny2GEo/Z141KELFDYyFD2dPQFalSpB7gPQc/pvbH+0+nzUR8S2M3tq
CdekvzlN93cHb4xUEe9A6dPZ9oiFsEjOK5UKamSBOswPjcumgd+OF6cqvkw/Du4X
GuWyJxTPrHdLVa2/mTYqLy17PcJNDQ==
=qYoT
-----END PGP SIGNATURE-----

--EaVZ8DXArvOa0+dF--
