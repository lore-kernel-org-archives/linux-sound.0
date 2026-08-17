Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835E1448B97
	for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 13:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786974966; cv=none; b=jqPSX1FMjez15GW44c+lMK4PVaXkMCBA4c2t/dt4nOPHrzUlDENxrvZ12d6PjuwD2kBKyUylun2h2gOfqRbXrG5XMQAjGztz5BrmQt8UMAV09FVDiSgjPiX3tV0CGGACTLIhopDpVI1olupY7yjGcopGpzt9stAPjDW4dM8eaeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786974966; c=relaxed/simple;
	bh=0qsSVgVwttgDpJJIQKcS1uXyz50s6i1L/i1fuJJfwEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8MFORRw1MkX/UIhexDX8KKN1swL1jlNPojP4X6TQEBP1RCc8xKdiHfnCs32fdqBCRvrpjepXb5zH8LMUXNYcpdGzaKNoFxgbLSycQT5UUzTUrkXKWFTkAaNJ49mlB4FKlsclsGJP0JdHgBC3PAyED+i3c31G0L1i83FLd/yuQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Itv4+BSL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Itv4+BSL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E470C1F00A3A;
	Mon, 17 Aug 2026 13:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786974962;
	bh=0qsSVgVwttgDpJJIQKcS1uXyz50s6i1L/i1fuJJfwEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Itv4+BSLXURkoeUlMP6oZh9Ad5EFEVi0QSOBRR813KfJoAiyAy10cavhnyN5T6eax
	 +4wLWPnCeeFHdbGKYtjn+mGTZy2GKrWmWEqfuVW0SWRK3/MOxf9bKrc2sIlb0lrnxt
	 fWx21yXlv+SfUgom85/1YkmQlEpAUqeWZRGBDYkF6+wz1zYSb8r8Vb1oVnrj/G6SQZ
	 hZK+v+YYE/G2Hk6BTujVelKDVYHN88oK8Mw6vWrT3aL89qJuy25XLcWfT9NK2IxXjO
	 8Wn8+q4+t7TszMvnDGUm8MeN0SlRGinEccjaF8qVeTbr7I5gApZVMVUDwrCVXhh6VY
	 Sfg2LtiRL7pjQ==
Date: Mon, 17 Aug 2026 14:55:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, 13916275206@139.com, perex@perex.cz, lgirdwood@gmail.com,
	linux-sound@vger.kernel.org, baojun.xu@ti.com, k-lu@ti.com
Subject: Re: [PATCH v1] ASoC: tas2781: Refactor calibration start kcontrol
 creation to separate helper
Message-ID: <e255b74e-b6a9-47d7-9e92-1315325b3e56@sirena.org.uk>
References: <20260815023215.1788-1-shenghao-ding@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WG1xCzr7mqglQKep"
Content-Disposition: inline
In-Reply-To: <20260815023215.1788-1-shenghao-ding@ti.com>
X-Cookie: Obey all traffic laws.


--WG1xCzr7mqglQKep
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 15, 2026 at 10:32:14AM +0800, Shenghao Ding wrote:
> Move the tas2781-specific calibration start kcontrol initialization logic
> out of tasdevice_create_cali_ctrls() into a new dedicated helper function
> create_tas2781_cali_start_ktrl().

I already have a change of this subject with similar contents merged as
commit ba5401135aa508f0cb5414f269edba1fe90460da.

--WG1xCzr7mqglQKep
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqDEu0ACgkQJNaLcl1U
h9BnOgf+M6nyxAdyOKqvzxoMK2ff93fn/okz7lQryXC0IfMTVwTNxNvi3Zp+gU1Z
d5D/JCUdPatapv4ytNtXVFkvvFP7YcmNEARCDoFCR+6f+gO1b+9wRuSnsoTf1fmt
t0lqp0+yN4Jba5yUdMphhynNrMR8GxlLM1vO0pk62pJCEnWr93m/udRVBgBnr65O
uAQhMT7EMkXioWvu2T31MBEOMDZn2RiytRLQUhNYM4pYpKP+QWjUhSTR5aD7rMmr
Ch69dfpOSBglBWxCyLVbTAEvIyyJ6esrRk++dLGqPNuxjtb4r1WGeMgJtgw1Zedo
RkpGJgvkkYvBEMF/rjyLA6AS4JTWOg==
=2FVg
-----END PGP SIGNATURE-----

--WG1xCzr7mqglQKep--
