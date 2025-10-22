Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5942C1589
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 12:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761134680; cv=none; b=k/2V354FQtpZR83nfmeHPuLVfBzcKgiSMWsjY6M6rnQhFn1uAWAtLpz5We5Mlw1k5Bqy/tEkrPQBYJez8T6GHcxvipfkhfCAnYRhZ7HS0eZG2gPwftM6Yyk0c3ZUUE/aHeZEXwRBGzEhoff1RmlTutPAyWQ22UMxuQfC4tlGUqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761134680; c=relaxed/simple;
	bh=JF776cK8s5vRqCcd2HDE35fbmvBRgjqw+WxkskKwa9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ItOhxfBXMFtr2sQpzoWlFuSgvXRjihv6LMVv4BFakp/xwESa//mPBImOgXwA7b7NSIhrNECxDRSMmdWfPomXZTJjY1cf0EmWKWAAxYt8Bppl3nNIeaApAJf0nZmkioHzjeHPZWq6GiDSK3XyG0xH7htu1HK73MU9WtDz4XYSO1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tvhdKlBx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tvhdKlBx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 480DEC4CEE7;
	Wed, 22 Oct 2025 12:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761134678;
	bh=JF776cK8s5vRqCcd2HDE35fbmvBRgjqw+WxkskKwa9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tvhdKlBxb1aQm9tUZMhNGBZVvvKKzhPEdpkg9506VzXAoYfq658N1Ew7evQ9QB/4H
	 EOIBUWEegi3/BgUggn9h/6JtBuHdHuyplRwYJrAuv/Xdatac16YFyK84NpHp9q3WiK
	 FUDt5gnhTsOSOfj44+8x703n6t/xFVoTfYXW4PEyUQJ/mkRMnjP3acvS6NdBkhOgAs
	 mv9q++56I8Z1HKU9oPI7TdmT1Kt+XbECiEkHqj3aH40pcsDk9qhJ8u8GG00Wf53u6j
	 ib4eMPyd4t+aOshRjr0rtpiM/PSoNF6MN5Aanv2VelrHDPuNzOiURf5MxraaYAXeqe
	 oZfCb+y8ruDIQ==
Date: Wed, 22 Oct 2025 13:04:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: tiwai@suse.de, linux-sound@vger.kernel.org, bard.liao@intel.com,
	shumingf@realtek.com
Subject: Re: [PATCH] ASoC: sdw_utils: add name_prefix for rt1321 part id
Message-ID: <d7f93bbd-29cc-4c81-8e76-7b47f59b4e2d@sirena.org.uk>
References: <20251022073952.327451-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cGvFhGSVIsIuRJYb"
Content-Disposition: inline
In-Reply-To: <20251022073952.327451-1-yung-chuan.liao@linux.intel.com>
X-Cookie: Remember the... the... uhh.....


--cGvFhGSVIsIuRJYb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 03:39:52PM +0800, Bard Liao wrote:
> From: Shuming Fan <shumingf@realtek.com>
>=20
> This patch adds name_prefix for rt1321 part id in the codec_info_list.

It's OK this time but this changelog just says what the patch does, it
doesn't explain why the change is being made.

--cGvFhGSVIsIuRJYb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj4yFEACgkQJNaLcl1U
h9D2twf+L4hG1Q22zZXwz0QSki/z8b0PDQy9+ONiQa04/GRAzfQg8ebpxLMm5Khr
lX9raUUTXAZ+HTKl9ju8XQKjQbRZoUI4LZj+dwpiBXd/XEcd4RJp/kOgtZZV0ag7
BlSAg5q9AH0jG0Qo81VCXRfdVc67SgTKyYFMuLoc7+jewRUrrIzhPFae1qE6L0Wc
ppRuuqEXG4sfJAqdgmmGzpgUju+l3XPPaCNzJZ79aD05jUFKy+zP7/ZSgVXO/LQc
oJpFsJI6UllRWql9nQDu1R2B6ztoR1tvVMwqP9JZGqcdJeVyudLUhBT6WWT1jvAg
KtmyOOjISzytkwOOb1KY8CT3ep/r2w==
=/BRr
-----END PGP SIGNATURE-----

--cGvFhGSVIsIuRJYb--
