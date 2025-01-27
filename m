Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1C018D;
	Mon, 27 Jan 2025 13:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737983358; cv=none; b=rYs6W2k4iS7nVcDj1TBcTTZ9OhuCvIzp0Gd1ebwdXzJPl8lcCfPpzqg4EjdYz+gT7V70Wis39M0SX+39kdwg224LXnCt/G/pcPZcwfMm9nlmU5jX+WecqmW9izOITPk4DrH27LG36hwkTjnpY9nzAlA/YwEHK4hp1mL4Rac7Iak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737983358; c=relaxed/simple;
	bh=u8t/V0hwVuBRKkky0lNszemHisH6sPvfOstAXeH+clg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YehD/B6KGGE4V1hmIIchPlVlvbfszrIVrYJrK3jOY6S/uohNkpTSSCAlslweLxKq/tOsdJ2MMauHcTBOG/3r1YuP4UDhlfC6lV/hzyfihSP19uDSj1DlsZlyYgmCaBtUS3FuQiREUJmHfuUlfnir0XN2xfEQQRBLmiJxlAIO4jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=huw5QFhJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="huw5QFhJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F847C4CED2;
	Mon, 27 Jan 2025 13:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737983357;
	bh=u8t/V0hwVuBRKkky0lNszemHisH6sPvfOstAXeH+clg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=huw5QFhJq7VPaE5GLhu2VN6FsGSIkSTUxRw4r+XbVy3i4Vn2nRU90+lHrqeXEaNVB
	 Zi0PACwvzTPdZcnXA2OFYEXz6vLCQJ9lwN1xZ59dSpDcNZfcBWps6vn2TaqxUyvaLx
	 6QXAxrdbyN+E/+V/Lshpo5kiJlGx0SnTIZvvbTA0cWJsGjpplNT3RIQkNoP1xvibhv
	 t4Ku6PFxQG4MP80VuR7SlNWm868G7Xk4VMhEUbQxrYadJk2CMePyGD8x6YA6zcC/l+
	 /AKP20eWYS/1oC2mSIkMydSWCTeGykzVkgtGrGilY67w0FfM8aR1kBWucGudMeUD3f
	 afdaPXLWTVDfQ==
Date: Mon, 27 Jan 2025 13:09:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: hdmi-codec: dump ELD through procfs
Message-ID: <667efb69-4682-41b2-8e5d-bb82a0b0bc02@sirena.org.uk>
References: <20250124-alsa-hdmi-codec-eld-v1-0-bad045cfaeac@linaro.org>
 <20250124-alsa-hdmi-codec-eld-v1-2-bad045cfaeac@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1MxrKqYgHEy1gT9/"
Content-Disposition: inline
In-Reply-To: <20250124-alsa-hdmi-codec-eld-v1-2-bad045cfaeac@linaro.org>
X-Cookie: Printed on recycled paper.


--1MxrKqYgHEy1gT9/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 24, 2025 at 11:14:31PM +0200, Dmitry Baryshkov wrote:
> Use freshly added API and add eld#n files to procfs for the ASoC cards
> utilizing HDMI codec. This simplifies debugging of the possible ASoC /
> HDMI / DisplayPort audio issues.

Reviewed-by: Mark Brown <broonie@kernel.org>

--1MxrKqYgHEy1gT9/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeXhXcACgkQJNaLcl1U
h9DFZwf/Y0aegKvho94KSTBiXl+MY4NMA5xh7e/ZdMe8Lc6x0PjPPvEPLScxdIJf
6zYTZGyqaUYlKk0y+K/Cq+lJjCkDbU8QR+968SLpHvAtEjP3ofVFAOVpwH40+Z1z
1fattkG+MJYU44wTFCGo7M77BUuJvEcqTmaQVx+JhkKUE7xiTVbJqbG857tQOTbd
l1+DRy/pXM8iXdb/5XXYBnK+VNTdkHvokmmS3YitYHy8NmKC88szL6Frpr411TUQ
sZPziZh9uzuDmSogeKzJ8Y0LqRLwZrqX6DJ1xmTOXXe7SD1L4wBa6rtDt2kyqQi+
y7nb9Idlbber70X+a4WLfUm7QnKF+Q==
=hgdL
-----END PGP SIGNATURE-----

--1MxrKqYgHEy1gT9/--
