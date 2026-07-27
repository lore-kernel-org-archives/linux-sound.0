Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E2B403AE8;
	Mon, 27 Jul 2026 13:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158491; cv=none; b=eOkvyWmwf1XCfts+jsITAyd1D/A40hvnECSPHNFAlNXRRvr/MFZcBk82lJI/huGwzseLH7rMIm72fQxRNljZCH5xuf7IgGGkWQ0kO61HitccT2egxEdcP43u/8nt4RyAOcL40sNPf5t42pEynf8YZ4PnjZwaqe9tqjlxAJoy080=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158491; c=relaxed/simple;
	bh=m4Gx2BZQH8lw2nvHQPZbU18vmTmrz7RNLqA5a5lLa34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nIH8CgNLo8lvGT1Xyqi6ZdF/0GzegRhev9gQ82HDt0qbHCgerwtyvTTd5whYrx9HhN86ktnk9euXY+lBOvPECGlxMc4BLSNiujn5vW/aa2XvQM3Sn9TLAEYNHjDgbQ/t1cVJhtnB+/Dk2sE3EG7sYi7ylxx+1Uw/SG9rBjhonXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FXd6Q6X3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FXd6Q6X3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5881F00A3D;
	Mon, 27 Jul 2026 13:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785158490;
	bh=m4Gx2BZQH8lw2nvHQPZbU18vmTmrz7RNLqA5a5lLa34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FXd6Q6X39bBcB40d7LLmsYV2KDajquTim0FSflp7KVGehzeKJ5PBDnn4anK5xAYKH
	 9hux8J3dF5AqrblR4yDKAZyV5j4c/E8Pz7PGE5f7xU35HiuWfgEEr+8S3gf/Vg+HJZ
	 Q2phBFkp/ruqxvUf1q2RTZDZ52AtkapVj/tp6qEMvvfVYw87b4YXIPMKVCbVTpjALs
	 cN947scFJbkkCzpTOqM7+6jVES7emLIfjByyUIc83qScO5SUr1VGPDenmPxXgPzcaL
	 cW34gy/vFAg5gSB8ejE6TiJGUU+whIFlxuS6btqxLyCvlD2U2pKiKrxP0sHMLBn06q
	 1TWdrTw497bdQ==
Date: Mon, 27 Jul 2026 14:21:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: qcom: sc8280xp: support Senary MI2S
Message-ID: <757166fd-862a-4600-b570-00445a2af3d4@sirena.org.uk>
References: <20260705033743.305783-1-jorijnvdgraaf@catcrafts.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7oxtGFK1nulgJnKo"
Content-Disposition: inline
In-Reply-To: <20260705033743.305783-1-jorijnvdgraaf@catcrafts.net>
X-Cookie: To make an enemy, do someone a favor.


--7oxtGFK1nulgJnKo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 05, 2026 at 05:37:43AM +0200, Jorijn van der Graaf wrote:
> Extend the clock-provider DAI fmt setup to Senary MI2S; without it
> q6i2s_set_fmt() is never called, ws_src remains external and the DSP
> does not drive the I2S clocks.

This doesn't apply against current code, please check and resend.

--7oxtGFK1nulgJnKo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpnW1QACgkQJNaLcl1U
h9Cprwf+J6iuXs8xt4+PkmDpxRx3JuVZzhXAPd6AkVMx1vmyCIpWsJESRLEaSit7
4VXBR0ZgG49ZG85/5qIl18csujfZUAs6Qu6oDvcEcz1USVWbQsOS4TKojVygbGNG
CAbkGPr1OtfD40AXqwi4CjjKQkG5MQfY3dPBKLOjKnFo2TFFymZrb/yjvbUEE7zV
zsSQ2PT2iMVPob3K/kP5mkGLS/oxTzzZWWvbqXQX+zhYZKaxQ20vehxrlRWuvYE5
Rllqp7XhuFRQp/z7vWq1trsAsVojbGW28n4q8TSRRIsJxqjgb+Yo9eIZyE5QHLCC
YmlQlx3MxDCgPmR5hbbKwJEjbDMQIw==
=o2Ld
-----END PGP SIGNATURE-----

--7oxtGFK1nulgJnKo--
