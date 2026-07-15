Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295BB382F0A;
	Wed, 15 Jul 2026 14:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784127437; cv=none; b=rqX5JLQqK0nVPvMiptb1sug3QRUxQxrHlcBdzq1qvmz1jct/AGMz00Tolcmh5J3JnzKFkyx20/bxdXNmbTfiFbE2jVKZqmN7lRLAzXa33bfih9bhtXpzZ9o/enx6Ondxmqjlcu4FH/YxlENjfrqZbkWEzehU1ItIiIJiz57EBzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784127437; c=relaxed/simple;
	bh=V/DAweVvw6rRZpDG52S2OTZ65LzxImtC/kJu//6f1vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MxAU+7w0co5p+ZAXalRNDi8O3LUXht/gZgvv6/M8EyRdGFEaq3/2Wka3dqk4RQYfGKWsRjUbuycXnYzNacj86wX2E841HMIzOMMPeotPV05ajq+5EH2+BktMZoHgZe81vgLxPerLQ6VWgZ2QfE7OXTyN8BfVIMjgzZEgt4INUwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2d9Yr+g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2d9Yr+g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B12B1F000E9;
	Wed, 15 Jul 2026 14:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784127435;
	bh=V/DAweVvw6rRZpDG52S2OTZ65LzxImtC/kJu//6f1vc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P2d9Yr+g+70UtGZLNMfMqVidHKw+R7hEcB4qfJhtjBO3zXXR0drJKwvItUHSPnrFJ
	 lO/Pdo9C9pI6OsCzTYgAfIU111Lw3pswsyxgB0hV/3fcRAT0n2ZySfWGbRbKpNUo5B
	 RtLGc/d8FusXxXHM8pGDy2nJjQ0fHDaeEPt+RNyOfdmmOFNrimQJktLktnDarMmzI4
	 z9xzHk1zpgmW3JhU1T9P3wmw5ADLzax57yBfX+u7WpRGnNXqMpf4AKIHsGM2vssGKt
	 Acq2LA4crMgTz5917Ifvg5VCch3Z9OB1rDX3HheMa+1EVVX/Laq2ZRZt7WwQSiLkvg
	 vFB2a3eFxuvOA==
Date: Wed, 15 Jul 2026 15:57:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: Propagate regcache_sync()
 errors
Message-ID: <e434b6b9-f299-479a-84b9-886fedb6d869@sirena.org.uk>
References: <20260704073901.40058-1-pengpeng@iscas.ac.cn>
 <17bcb9be-b1c5-4dbe-9fb7-85745098d35c@sirena.org.uk>
 <20260715135916.24417-3-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AO0k4IjYPui7Elyz"
Content-Disposition: inline
In-Reply-To: <20260715135916.24417-3-pengpeng@iscas.ac.cn>
X-Cookie: Goodbye, cool world.


--AO0k4IjYPui7Elyz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 15, 2026 at 09:59:16PM +0800, Pengpeng Hou wrote:

> I checked the current sound for-next branch. Commit eb667d0fbdd3
> ("ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime
> PM") now propagates regcache_sync() failures from
> va_macro_runtime_resume() and restores the regcache and clock state on
> that error path.

> That covers the issue this patch was intended to fix, so I will not
> resend it. Please drop the original patch.

Great, thanks for checking and following up.

--AO0k4IjYPui7Elyz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpXn8YACgkQJNaLcl1U
h9Aj2Af/cflAu8HnDJeT6hQASnk5y61yj62gZpQz9ZyHgmxv4+nwuIE2jB9GSGrB
EsgrLdaMuSlA034JoNpWZ6VnRD9VjcSjDFWYhwhk/DJJrk9Jpfg6npMCp+vGqMuK
4cPaxY3QWHAJJjXiXk07D4PSSyc69WoG6tb2O+1HSWSfcceUXvoLt2cOtEUkH/D6
DTck54Xr6AwEKtSRyRCdg83kxgF5R0gbw4rk1DkPo9gxTWk70zBbtcgWvpRqredo
RirgQdcU0I1VnbBXI7Au2MzjgLLLran0UwUPKpwORtHtRR2lY1jQn+IX85tAWCR8
q4ILr9s2JhfQQ14At2MFG7UzvuI3Aw==
=EKbS
-----END PGP SIGNATURE-----

--AO0k4IjYPui7Elyz--
