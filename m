Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2623845DC;
	Tue, 24 Mar 2026 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774363869; cv=none; b=tlFWtI8z34zuehYul8b2AYS3nHBeGir6uTKkEjYsFkZ6uDvf3YLeD3GEKiszzUnugPPa0iyTSxGoCK6PEjElfiaYrdmFSYipNaDmsu3lTOXgtqWn3wPlewr8GGZ0oprPPienGCH4re/r/9JrUzz+MbxpbaOZWwnrALVWA3mF/5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774363869; c=relaxed/simple;
	bh=FA9b6eKnOQ8UCOftcuwSLj6sU/RJg5GjgvSMFWkocEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qAd3vle6lxtK+CcCTcT6K1phVY27pJbrTDS56saKQeRhPVki5w+HZBGt/J1iycZdVeMRUeq/qtzz5NZc9jE//0vBwso1D4QfKyvod/ZjbllV0L1aINwA0g2mQdiL13C5Y78pJs/70DK5Mdg4BBZLyEhrOLftxCOLP928T043Pqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CF5ODfON; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CF5ODfON"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC4CC19424;
	Tue, 24 Mar 2026 14:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774363869;
	bh=FA9b6eKnOQ8UCOftcuwSLj6sU/RJg5GjgvSMFWkocEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CF5ODfONmN29FT9qC+iN4t1zemrk2d40b0CYbFstqVFdLj64B0UYOH5MIJlJeerj0
	 C4Lz2tj1JnHCb5JPcx8YO1e3O9j8JiBehBar3KEEs7Xh95G/kPLYRRIl+OiHq4k8XE
	 9ri0hLm4sGjXRyKbqZXwwPlgsONmtPR5kdIo1ObsvqvwDozkeIAUEJDEu+7uNysW6G
	 mGdyC0cepnHrngcXpF6wpuNcYhAxchworUoFaDLUGhQKToITpjxVzgIKdwFaj/8D2r
	 yPiNIOTr95WJlDKhAZftM3zSIeRrfepWPnkl3XXV4y8u1SGStazFiZ+jqTmqSErMtw
	 U7w9dvbszJjYg==
Date: Tue, 24 Mar 2026 14:51:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Wenyuan Li <2063309626@qq.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	gszhai@bjtu.edu.cn, 25125332@bjtu.edu.cn, 25125283@bjtu.edu.cn,
	23120469@bjtu.edu.cn, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: uda1380: use dev_err() and %pe for better
 error reporting
Message-ID: <96b34e8a-f770-4501-90a2-881f7bf49c8f@sirena.org.uk>
References: <20260324083607.6914-1-2063309626@qq.com>
 <tencent_A26B55F062F2B9C282A142BFC8BCDB1B9105@qq.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sokhaq4CkUiUTfCJ"
Content-Disposition: inline
In-Reply-To: <tencent_A26B55F062F2B9C282A142BFC8BCDB1B9105@qq.com>
X-Cookie: Forest fires cause Smokey Bears.


--sokhaq4CkUiUTfCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 24, 2026 at 04:36:06PM +0800, Wenyuan Li wrote:
> Convert existing debug and error prints to dev_err() to provide better
> diagnostic information. Use the %pe format specifier to print
> human-readable error strings for I2C failures.

Not your problem but the fact that we've got %pe but not a non-pointer
version of that is obviously not amazing :/

--sokhaq4CkUiUTfCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnCpNcACgkQJNaLcl1U
h9D7XQf/UyR8/YMNQoxLUP58GuywwTyA9PRlInV4nt+hkbZipHQUQKWHB9a6zqNK
qyKPEPi9ut1+C9LpaUC95PLgdeC1mhd/WP0dUkkLDYdFIeEfkpXpgop9HmNs+STe
FcTYV5dEu9OoEPcI9j03V7BVAXiGgMgIoM/uRjVbaZNmgyxo0bkBUmgjOD+84sjG
J9AFTM9LX5TZP8qDXq70og4VrWTMTvWTDoZKBFDcCwfXvjERTmhDeYM/spRVYbvE
TMCaY1ksdwReBfkhuT463vYl8w6ZxbmOOUgUSbdkz7RXy3/JKNz/vKN7/Bd1YHXj
PJy6iS4+oHn/WXWGbNKytz4crUa6Sg==
=jAd/
-----END PGP SIGNATURE-----

--sokhaq4CkUiUTfCJ--
