Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7854F1F612
	for <linux-sound@vger.kernel.org>; Wed, 22 Nov 2023 11:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WBqiAAQ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EAD1C433C8;
	Wed, 22 Nov 2023 11:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700653350;
	bh=QEKSREZFB9WcaZBZKKMacGvB5GHLDryHAUrK5PwyzeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WBqiAAQ2L28tf9RBZgy3zkdD02qnghFQovUzDCLddDVS/blqqN03OejYwzMPFRTaD
	 aneNmQlPQXa5R41Fm/hNHNUHglVTWWoiNVsV1ijnMeet9atGN10P+HhKBx7SZy3yJR
	 Q2yXF0FIAi8V9bRzDl6HwTY3OGTZIiBKcNOIJl9ggZWfSQfSxwOIk1pawH4fcd/LGe
	 nAOPB9MwDW6P2BpOqu8LN7gd9Iey77qqozVvAq7BQxs9aS+VyiMiOgehCdBEwYqNTq
	 W22N8LsD1LvYo7qJf4esfClOt2IeZabgCiLjDRR30j4PlbDK6sCX1l6ibTmp/Vdr5m
	 KfnCAUISVWmtg==
Date: Wed, 22 Nov 2023 11:42:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, james.schulman@cirrus.com,
	david.rhodes@cirrus.com, rf@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, paul.gortmaker@windriver.com
Subject: Re: [PATCH 2/2] ASoC: cs4270: Remove unused codec
Message-ID: <ZV3pIb1p52CFNsSl@finisterre.sirena.org.uk>
References: <20231122062712.2250426-1-mpe@ellerman.id.au>
 <20231122062712.2250426-2-mpe@ellerman.id.au>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sizIwLURlAo5DBqL"
Content-Disposition: inline
In-Reply-To: <20231122062712.2250426-2-mpe@ellerman.id.au>
X-Cookie: Slow day.  Practice crawling.


--sizIwLURlAo5DBqL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 22, 2023 at 05:27:12PM +1100, Michael Ellerman wrote:
> The only driver to enable SND_SOC_CS4270 was SND_SOC_MPC8610_HPCD, which
> was dropped in the preceding commit. Remove the codec as unused.

There's no real overhead from having extra drivers and we do have
generic drivers that people can attach CODECs to.

--sizIwLURlAo5DBqL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVd6SAACgkQJNaLcl1U
h9AI/Qf+J4DIRnTf3NQShXZHpoX3Pl0SkRoY1ASOBLv/amwIrdoVcjmfHrm8Mth0
cJtFdkyQmmjeem1kXEZm29r1Ro4GyCaRUYQah6JHIbJPJbIOwStqbdI2WmYL8jw1
GO5y4mE6ZVg3dUXwFm6znHoylg3FRrVaLxGxBnXyrL3MMNuz9uPyDR1rFUFTl8WU
lvMR2VOuMawEFJ1GiQ6aaaLu9t8i+8VvoKSn7GD1xTI2tU9PppIT4R0s3CUogNjK
DRx2A9aLQcQmdXN+2LykYfsOw3UZUwOEZGQXZwSNKYXRKu4reowv/ytzO8RaEAxh
h5OlnboVbe6voabyne7F1oieLvRg+w==
=YIcX
-----END PGP SIGNATURE-----

--sizIwLURlAo5DBqL--
