Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C4A153569
	for <linux-sound@vger.kernel.org>; Mon,  6 May 2024 14:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715006706; cv=none; b=ksvTJSiW55Ee+ZOFn/rpEIABXaYVOuLzvK5okazmmDn0CYa7GDOA6/Vff8BXuhw2EmXvN1WQY0twxJJp1KtQ0v3WT19hsWlU6KQ5WTsvC/OouN9RqJ1IKUEijsMwc11z8CpqcHG5RKb7ZfWBQJukgLKfg21PjBH6AjqLTsjWq3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715006706; c=relaxed/simple;
	bh=WuSI/Erb+YdvpVlRysKYfgJc0VtPZaAYuckoNHF0PrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P12oA6V9QKQOLv7eyt0l27ZL+PkSb/IBhR6pt8tIcbwaJjjfOa58C08hh3k9R3rmnGyT3rFI7CmKpPtaUK6NqGAE9gmZq/g+SfO/W2LECBjwre3vJHVw/wVZnjWOqHKr+9//QbYOxTQOaZ9KHt/DBQT44rrUMQj9hWg6Aw+JL3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZT1sohq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZT1sohq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53582C116B1;
	Mon,  6 May 2024 14:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715006705;
	bh=WuSI/Erb+YdvpVlRysKYfgJc0VtPZaAYuckoNHF0PrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bZT1sohq6SB+ivGjmmVMO8IFtrjWevL8z8KX1edKx/CWc9PWHamVu6yZ0u2ltlnUk
	 KtuUNObJE3LAVgMrayiw3F7xz4W8a5WKr+Q/PcaEHtXNdO66YpvVAdAcP55nwJrje5
	 D092MMfffVpNsEBJCQrXg1dQpEzBOdQmvEyl6unhnAHQm0sJ1unvHo9+UKRlZXOiPN
	 3vGQ+CNE3ZjLC/+8XfzBe1oMlFIaubts64hgmGrwDgAkO8Y+w09N5nzYJDPKDD2DK8
	 VBgQTBR6GsfGpUFRh13w6pAM64hIfQFq0fBY1SwSa5hdCnbpJyZWFwf9t2wvaFFQBS
	 bddCkOsqZaWrg==
Date: Mon, 6 May 2024 23:45:03 +0900
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>,
	John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH] selftests/alsa: make dump_config_tree() as void function
Message-ID: <Zjjs79x9hF0-YFBm@finisterre.sirena.org.uk>
References: <20240506075419.301780-1-perex@perex.cz>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oM3NpSiJMjLcASJi"
Content-Disposition: inline
In-Reply-To: <20240506075419.301780-1-perex@perex.cz>
X-Cookie: lisp, v.:


--oM3NpSiJMjLcASJi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 06, 2024 at 09:54:19AM +0200, Jaroslav Kysela wrote:
> dump_config_tree() is declared to return an int, but the compiler cannot
> prove that it always returns any value at all. This leads to a clang
> warning, when building via:

Reviewed-by: Mark Brown <broonie@kernel.org>

--oM3NpSiJMjLcASJi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmY47O4ACgkQJNaLcl1U
h9BFgAf/aC1LYWpU7UQf6evBFuaf9qoxD7434YgDgGX9vOnOrj+b7JcVgaUg+VXZ
OSMIOzpXOYyaT7lwPwdkRxmrkbymLArAXf+4QBBuzUy0xgLJDsXztIzu3XKuCaUS
cVhX6fz46OoNhth2QmLPWXu7SCjMYxsqk4R4/3kLGzysWb+GFYJz+eO/fQuTvOE4
s95sOZgeJel4t1TN/HlpqeXmj1KXMFFRkxiV5LDykrbdxsw46Mv8bVz9IxqBZkF5
9K1Qc82ahaAm1PcDCMIeE03tRQ282iHEqsV+MkUCs90t50AMg36SYscuMgonDRFW
OUoN2RskOOW7pbTAzowWJVytY79a5A==
=MfDQ
-----END PGP SIGNATURE-----

--oM3NpSiJMjLcASJi--
