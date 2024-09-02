Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA0A1714BD
	for <linux-sound@vger.kernel.org>; Mon,  2 Sep 2024 07:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725261162; cv=none; b=qxFhJ0rh9NmaKcKJRE6lFKeX5rON8JrrFAmsgZwcc/bmnj8sTXrudr0TIjJCpyfOy0LQreCVf9Io4k3X1z5z1Fw5rQxH6SAk2klfzn5AUejV9wCY47xGYB2UJWspYxOPr89phZTbD6LMjNSHVtrkJMwMdMzVrQCE7Ag8XOo2858=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725261162; c=relaxed/simple;
	bh=pM4bUcvg+WElk6QvqmY1zeZlsyuC7QL5ZgEg5FGtQtg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C+vLjmfHJVoiMBqnlQiVMFh6XM61AofadB/MEtOzs3qd+PxQcCOWVF95kI0SOv3U5J9jLMH09o0lI4T6gJ9CThPXKOHlKqEwAdADdUFzhK+IPmcQbTfMwuOipxFbfESidKY5YdUwDAJdc4yXp+Zhb1dvaQYzR7zWpXjfb7lzb3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hDjfBx0V; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hDjfBx0V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725261156;
	bh=nYTdMBJTZfaH7Dat/XubgDqU80rskIe2dGgsUMTtGSQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hDjfBx0VlfuN21Z/CmfL9clbEuSm+W7bPZuJI5fjkwIqnQjeiwpHEetHimT3Hcfxg
	 TjPLjNRsjgJQp0/Wuj7cwRa0Wbitd2wJ5jX3MjdzyYFByz6zAVVkpxoQXemrUjasrT
	 sUqo+5QYHTYdSDKh90kt4j4F37z/A8tg4Ym7kD5zPWIp01o2UN5vIZwLZkak4xga1u
	 OxSCKsF9gPXWPQ2xNO1Xvb9fyTrhIO2AmRyvnxU3/NDZXfwrYJO8iE0nkTkynOPTxg
	 6nFNlWXU4Cul/R2PAtmS2G9pUMlApmG3zJ18XCoTDEOmJEMM2Dc0ageznGEY3V94oz
	 1pvDDX7N1lpmg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wy0M839dqz4wd0;
	Mon,  2 Sep 2024 17:12:36 +1000 (AEST)
Date: Mon, 2 Sep 2024 17:12:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm: Fix yet more compile warning at replacement
 with kstrtoul()
Message-ID: <20240902171235.3589800b@canb.auug.org.au>
In-Reply-To: <20240902062217.9777-1-tiwai@suse.de>
References: <20240902062217.9777-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IVr=LNN=1dOI=A_Ev7oTpXy";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IVr=LNN=1dOI=A_Ev7oTpXy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

On Mon,  2 Sep 2024 08:22:16 +0200 Takashi Iwai <tiwai@suse.de> wrote:
>
> The previous fix brought yet another compile warning at pr_debug()
> call with the changed size.
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/20240902132904.5ee173f3@canb.auug.org.au
> Fixes: 43b42ed438bf ("ALSA: pcm: Fix the previous conversion to kstrtoul(=
)")
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>
--=20
Cheers,
Stephen Rothwell

--Sig_/IVr=LNN=1dOI=A_Ev7oTpXy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbVZWMACgkQAVBC80lX
0GxU5gf+Mf9lar/w9GE/3OQ7Irm416MV5EpUwD4VqqZKDyG1IluG6pbwQxk4lEBS
zwnZIqBaQxi4jBSng/HNTtEtHBIky8T3zYN7r6gvq1MVRDsb3d5q6CHUzd8ry/Cy
UxUx8Ige62pSwGj0OtER5AeM/lBzVWJAmpuff5dtYwfcxsybvEoP9MCsZrv5ktbK
EJWjPSW9bk4d2fmBlNw/Fc+zL8WyEupzvxH0nOGLzkxp44SBRxo/fonJTgezewec
pzIsMikpFGtLJoQaq41JYj10cEzgJdDf4vFxG2zIPB7Gp1sOvZi8Hf9N/bjMbHWs
kwmhqgWJR/LICMGDuwf8gY9G5XnoGg==
=HIIa
-----END PGP SIGNATURE-----

--Sig_/IVr=LNN=1dOI=A_Ev7oTpXy--
