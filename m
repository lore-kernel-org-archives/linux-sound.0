Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E0C3A5E64;
	Fri, 10 Apr 2026 14:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775829760; cv=none; b=oxVZKo8VWvN6KOlaS9CLzhJ8eRVnBAXvBWQuVCiGin9AoXjYxu7zcLUoQIAZVH9gRLO6hsfeUHYfC90RPUcGWysj9QbmVIh45XQD5n8yjB3sFG2N1A3Pcf59RDzkpua2VyhQUxkxjczicDrmzOECNphDZLg0Adw8KJft/xrWPrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775829760; c=relaxed/simple;
	bh=YM+Xp5k7P4xI92Cvh49e8JIyBMD4mLT6NvX3vJR/HdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UT1T9Y/yshCohQ+qrpxqavOZX6xWU03tSn5oFc2XtAlFMHSI2oWy9iewzYPZ77M5C9bHpgNb0WQTayv1L3KQ1YrcV7UHbvsRw+GZRz5WLXxbfkf7CROUwRvQxuPXaDb+RmeEhvva3MHmy9hwGt+TVIrDpCrX002KyFfFgZdS4EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jp9HoCgI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jp9HoCgI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7AB0C19421;
	Fri, 10 Apr 2026 14:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775829760;
	bh=YM+Xp5k7P4xI92Cvh49e8JIyBMD4mLT6NvX3vJR/HdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jp9HoCgIPw+R0MB8KnL7f+CzSztlDT97xF9g4k666nggRO1H2GOz/LVb5jf5MeQ06
	 G2BxZo2+YP313L2y6Ar/n7WhvGbf9KrdEA+OE5ruZ7qdgqKhG6IWgCIbZC87ypi6Uc
	 hOUs0QbJvyoOE6SUJOnZACNAJdRhh50o19PtucSre9GpEa708PHWisEn6koU0OvpiQ
	 FG2aHsrytKppfwMpNzjlGKA0zAb6397vPoHh6GvJRePFLjRjLwbOfxh9ouBKuVdEGn
	 S/Pf1l48YB35ce9y1mHlA+MFQAj2YHCYUBRj5UrQK1cw3XKbxPBGMGjHI8jItoKYB4
	 b3hkeIAaobJ/g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 88A761AC58B6; Fri, 10 Apr 2026 15:02:37 +0100 (BST)
Date: Fri, 10 Apr 2026 15:02:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Sen Wang <sen@ti.com>
Cc: linux-sound@vger.kernel.org, lgirdwood@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	perex@perex.cz, tiwai@suse.com, shenghao-ding@ti.com,
	kevin-lu@ti.com, baojun.xu@ti.com, niranjan.hy@ti.com,
	l-badrinarayanan@ti.com, devarsht@ti.com, v-singh1@ti.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4] ASoC: codecs: Add TAS67524 quad-channel audio
 amplifier driver
Message-ID: <adkC_fNHcpRA_ffo@sirena.co.uk>
References: <20260409220607.686146-1-sen@ti.com>
 <20260409220607.686146-3-sen@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5jCXmS2XuCUHVIPK"
Content-Disposition: inline
In-Reply-To: <20260409220607.686146-3-sen@ti.com>
X-Cookie: You will be divorced within a year.


--5jCXmS2XuCUHVIPK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 09, 2026 at 05:06:04PM -0500, Sen Wang wrote:
> The TAS675x (TAS6754, TAS67524) are quad-channel, digital-input
> Class-D amplifiers with an integrated DSP, controlled over I2C.
> They support I2S and TDM serial audio interfaces.

This looks mostly good, but one issue I see is that AFAICT we only stop
fault_check_work during runtime suspsend - if runtime PM is disabled, or
if the driver is removed, the work will be left running.

--5jCXmS2XuCUHVIPK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnZAvwACgkQJNaLcl1U
h9Dwegf/SGVdCH3TdouqMdpKCqM13OIqC00vzYVmkQ5vJfu4OFBLfkUD4xtrj5Wu
zkH6qL/CAr9d8md4dDl/AoiFH9LuAfA5s0EDrtXkP9ZTIlZLcahyRlvINW1+929l
97YX+k+s2mJ8AjEpjYzRmm1AUG/TVbHZYDwuqRrZKdzig7PAo9wVvccsBJNGp4qA
CMvLIQRDZOme7KGdCwHiFqIfRbdj/pKNfE9kK1qQPNwoDfDnkdYDAjKRXiU8QT/9
Vu04oYte7IaFh8TnfCAddmqaPqKhRnvMhBVKEXCA83ponIrhdt2TxQ4n6DQA4mDW
7G5Pzb5QmRS4BFgmtxxIIXTTHS8/Dg==
=7QzL
-----END PGP SIGNATURE-----

--5jCXmS2XuCUHVIPK--
