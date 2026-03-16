Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8B4469D
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 01:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773623294; cv=none; b=QG7iPZ32ykTTJI7UDL1qZfZLb2Gq/7/E2PWbo4NQ3JpwQz8sBQ1fYULIFhCdD6aVgWhfjwAvAKLPzIdaoDwFQtuB7BZPzH0Fw4xvYqtaeB6Epiym50xoh8OLyZGqDZ7jA20Zj5E8PH1N8nXMbZBg4mBT2IbF0HjZHsOkOG6/1Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773623294; c=relaxed/simple;
	bh=c7ScVXyuqXiE2ePaLXunyINVvCKvDDukZnlDyauyvUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ox1RQLVL3ddDXkpACZAF2a2c5IXm2bbCOuGP2H54X493H2LNyNTF+KTSYp8j86WX8kiSed/0O+TXcjV6qYo4+BRWd6YX58UswBgwPT9Wae6miKCK+LClG6p+/3tTQ3vQ0mtWd/yw12fCxnVsujgm17MGMF3c4CTrEnW+rpaO6Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qjfT9acI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qjfT9acI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378EEC4CEF7;
	Mon, 16 Mar 2026 01:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773623293;
	bh=c7ScVXyuqXiE2ePaLXunyINVvCKvDDukZnlDyauyvUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qjfT9acIaFBYITUioMCltr1vRPvrj9uxlI+2bQOOKNY31kVrHYj+j0hgI4cMe+iOG
	 DGBnaqlHYRJBsuT7Q1opLktCsO19kFiPN83IFoTijqW+hQmchxN86ii6qZPUjGDlg4
	 YBJCJryvlQshZj7MaZxBk+S2bJWS2kc0PGvz28pQnXx5EorFojl8iSCEuWi/zlOf7Q
	 JYuyNzj3aHXT5xMtx19VR+HYsh4V+L0vViYHJCWtww/n9mLA763xLYViOFv28UWu0p
	 pgovoMbLAC+1WsTrK4AgMLCZj0luQZ0ZHDyzdksv7OwUtuINlIWGj8U8o2Qtp8jjea
	 hEL4r9DuUhnDg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 993671AC567F; Mon, 16 Mar 2026 01:08:10 +0000 (GMT)
Date: Mon, 16 Mar 2026 01:08:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 22/29] ASoC: sof: name back to pcm_new()/pcm_free()
Message-ID: <abdX-nFZbDInZxXH@sirena.co.uk>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
 <87zf4onmdi.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="66Lj/vmqsYnomhjF"
Content-Disposition: inline
In-Reply-To: <87zf4onmdi.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Identify your visitor.


--66Lj/vmqsYnomhjF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 04, 2026 at 06:23:53AM +0000, Kuninori Morimoto wrote:
> We have been used pcm_new()/pcm_free(), but switched to
> pcm_construct()/pcm_destruct() to use extra parameters [1].
>=20
> pcm_new()/free() had been removed [2], but each drivers are still
> using such function naming. Let's name back to pcm_new()/pcm_free()
> again.

This needs a rebase onto current for-7.1.

--66Lj/vmqsYnomhjF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm3V/kACgkQJNaLcl1U
h9CrIwf+OFGH/JmXvC6r2VLAwixj1pfZeFBBA7L1NeN1Cfhm19iAF1wmnLfP0vz+
CxxG2PiXL+d0Cs0P2JNCmwkjYTG97TkZ1HocOK5x8OAdwChF3hyWOoD9Ry8O89r2
QyL9YUvZV5ZfCJvyuiWWYgYsRptJoN0W3VK667CUgd8tEvKpCQpE11ft+/XHCW68
3Z5L/JHDUVYUEXbS6/8gf0FhDlzRoP2z1thRRCvQfwccT9BZ91RQWnBdNGMxy8CU
5QG7FtU5D2AC9bbqy37KF6oZw8PrqfyKK7FV7TQcXp9bl5zvS+p+H2GV40yGKE5c
cctq8V23TttOFdp/t4pFXm7h2OH7/A==
=mboj
-----END PGP SIGNATURE-----

--66Lj/vmqsYnomhjF--
