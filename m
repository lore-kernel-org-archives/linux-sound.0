Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD8D37FF5C
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 13:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778246566; cv=none; b=HiT4cpN+9XbRArUrKJFCGPPtiNxWYwd7ALvQiFYzxovInMeRBudY/84FeSrSymWVZxv8eoqkI03CBZcsekU3i4GqRJUWOIm0/SFn2X8+imH3RufLRNW/Ds9vVBveQ6wOov0U3lloDWp/9nvA8GmzCUqZvQCUAaZVMXMpHJxAsvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778246566; c=relaxed/simple;
	bh=fnk2WYtspGKK05+6RhoArWdO2sbLJKdVZlrbd2erSBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngBCTiodkZLRtQQcGnB4Ed/f3Dy8hbbnKEboEJ2ZArrDJYph5I33YzPdwPQhYspMRNRfJTGFxOykdisFzEKp++3KvcbukehJIL85POSzcufh6XBvU0IerTEmeXjOmgpKLDlIB9Ks9G6awvC2COGbEGdUEbjWYORNMKcv8SSfX6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dOGsviu4; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOGsviu4"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a283c44478so2715086e87.3
        for <linux-sound@vger.kernel.org>; Fri, 08 May 2026 06:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778246563; x=1778851363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1gbUobD+K/QE4KT+ICDeIySBZSA03dYWML/JHPIkeU=;
        b=dOGsviu4aCNrl2Yu6zXrYQjADBLVS207CfBKc+8aYuSeusLdUSK8hijh4AJpxLmHmH
         EAHKCxc6uWYlMOcwoYR1EH8W62msHgVfNZRabHb5Qf7Bdiuh6BxMq0cCs141k2KuBGz1
         HbZT8xoxSDO1GoYh/etCGdCvcYe61N0nCdLH6/HEDZFXFk4UcrqgC5VszEBU5K7yGh9j
         Ox6IbIelF2wXuOcWp2YI6TtNCnC2j78SRx1A0BDLSYmSI+56e9dVv8DTIGAkb5k6gerY
         XSs52ImH1dthaAm660q+weQFUqriDx0zI3hx8Sd3jg4mDFcoK17vWKS8KBzNyGVhXVh9
         COIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778246563; x=1778851363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z1gbUobD+K/QE4KT+ICDeIySBZSA03dYWML/JHPIkeU=;
        b=IASyW9pE8DV6KuOznqNYYAYehXLxTrydzH34EoZEB+niP189/7uxozPuiczFG2+RVT
         4kNv4o5Ecj5FPz10TX8SeJ2xN8GiLghV7RzvZOyDsoyXDQdbbZOHL6iBrrqCMijlJoQ6
         jo6fBftfOJJp40MOo0z5IfdUxcF9PkcZyrzCrxLBzO3qoG7DrNSS0Vz3ySNPzxPzGsn8
         GpWuRC37tpJRQAJMxH/uATy1ixxi6sviPtoFEWS3L2Kbmmwa3pgqeYr25EMf2rhV+s08
         E1m7UsS57v8apRibheAhbtk0D2NqM6NCohpHy4bbZNopZ7RdR2qXCHL8JX73M4DnV56D
         TA6A==
X-Gm-Message-State: AOJu0Yz1rh2ls5sf7gEdOI/zsT+A/fu0xO32lFDkBLLOdmGFRqPhechh
	psXNgL7WbxpW9nq1p3iRfMoV1O78PF9te7Mp2bTwVWG031fV9QIoJbHo
X-Gm-Gg: Acq92OFYr0rMH9Ps8y0JLO917pelXwPhqOdVkYohD1KVfmrbNCmNEWos8baNlk/R1CX
	aexiohV6lQLY5PkHU6cCdYpsM5ACix3h3HXw/pjElR5b+qt5Xg0B8r0mvxpZ4NpPQ2Yts0muTlh
	NBow1k6D9+0O+tzydylhhHbKfc4jlnWaCAU2EqAzXTewTyGsW7OZM8AiWL7aoKfRDokFUMCNq/A
	R1GRedwzPLq+jXjoWfoc2S8gqhyKCTELtI3hH8Cu6Q6FoV2h3qU2+8sQ8hJAKIlCfuyWzD4eLg3
	sa4qgDUH7CZWXHu76+yXdqSjGLIQ+3Z9fEyaDD8hrclqeoLcJ/0yT90cEkBRExSDhUuTQqfGfJA
	+aw3Vy/7XzyL8L/1HZJzXCLLvkrOKk0Bmu05iHz5NbY1PmcBc4H/ZItp5NwSEVeYbZEuJdN6pII
	qmbFHiUNTSh6ajpy/as6UuDFHuoZlkKLP5Mk8pV2jlnLZi5zscDVlrt6t4PkFEbzahAju8EBr9+
	zT8XWDWErSc4w==
X-Received: by 2002:a05:6512:3195:b0:5a2:c4f1:2635 with SMTP id 2adb3069b0e04-5a887cec51cmr5030150e87.41.1778246562820;
        Fri, 08 May 2026 06:22:42 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a9565401sm503421e87.57.2026.05.08.06.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:22:41 -0700 (PDT)
Date: Fri, 8 May 2026 15:22:38 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] ASoC: tegra: tegra210-mixer: Use div_u64() for 64-bit
 division
Message-ID: <af3jjg4z77TIpFeV@orome>
References: <20260507232131.438589-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6e4xp2knzxedgfuf"
Content-Disposition: inline
In-Reply-To: <20260507232131.438589-1-rosenp@gmail.com>


--6e4xp2knzxedgfuf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ASoC: tegra: tegra210-mixer: Use div_u64() for 64-bit
 division
MIME-Version: 1.0

On Thu, May 07, 2026 at 04:21:31PM -0700, Rosen Penev wrote:
> A MIPS allmodconfig build with LLVM fails during modpost:
>=20
>   ERROR: modpost: "__udivdi3"
>   [sound/soc/tegra/snd-soc-tegra210-mixer.ko] undefined!
>=20
> tegra210_mixer_configure_gain() divides a 64-bit BIT_ULL() value by the
> fade duration. On 32-bit MIPS, clang emits a call to __udivdi3 for that
> plain C division, but that compiler helper is not exported to modules.
>=20
> Use div_u64() for the inverse duration calculation so the driver uses the
> kernel's 64-bit division helper instead of emitting a compiler runtime
> call.
>=20
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  sound/soc/tegra/tegra210_mixer.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--6e4xp2knzxedgfuf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmn9454ACgkQ3SOs138+
s6G3sQ//eW7jTS8DwLqJPErEu/uNx+44KbrkCa6KCZ1CuzzSJGgTtCgkI/TqPto2
sBta/eSpFQWwWl8w6SDvdgtpZK4Dy+0cB9C9yfwLH0UcvcG//rA3znW8SmjclGMu
T3zD7HwyNtJfSMxbLBc1oEw6PkvNMuDVXD8L5X+PR0Yj9mUVNIEzyY2Tp0EDl8ra
u1nwej+8rDpXokACkmNLnnTOfRUQT/gbVwpIpl7+ekcf0GGdAJtfxCYA35BteE/F
fws6hCqz4i1Bjp6PWuHvhGuNqAP7yMlY+L7HOAOykKJAs7vOF6GTYyiJJKXQMQRh
u1o3BVQJsrrNY3gpXc5xcoXuDYmL35q+7spqMaYHlAvbzi1uDcmXS0ZOnM1NnQod
9S0DOZejxA2dIO94sSrelz49K0MkJpBxRWW+YAStC86OwfEjetcoitDbJzrCLIhB
uKGfKQe/8kfdY9An8BipfIt/B+jussJ1x73KsuTjACqiAWnC846iACtEUlyE8tu5
Jv5MJKGpE/sJS78MKigEGdg5Y4Dako0Dq1bkM/QV1v2JoCR5NUPASNBfz4cBXx0r
NQD3++YOCtD0onHPk8NNZ8/c3p7bDWBWB3VgUeVPUrngLDuuh74FrP0cfRDnWe3R
+WQF2Il5x9IjK0LbghmnCD7hx+uMvg7MCaWlL+Pricc1yTOqMLo=
=dCDE
-----END PGP SIGNATURE-----

--6e4xp2knzxedgfuf--
