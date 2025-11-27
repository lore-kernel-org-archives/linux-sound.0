Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E17432C92D
	for <linux-sound@vger.kernel.org>; Thu, 27 Nov 2025 11:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764242029; cv=none; b=cM/+dKYVuRhY/acPpwTucuPwk0l5iaFsKNPQDSbllTf/iJmU5JEdpMRBOltZiYX+8huPBhLOuMw99B8xXkFfrGfFWInfpEPdYGAbhut3wIrizoUyOasz8qn4XN0ZlY4QKoFS81i4SVBjzgpj66WHaLUarCXvAhLcaCkExKmd9RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764242029; c=relaxed/simple;
	bh=hnylFDNiB2RskzMImuvbdxX/ijKlS7OOQ/eMp7B9Xik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhAPRIDmqxIZ63UEPW1kghucKMSISuIQC1UV6PjArocn8KnN0+P/ZS6g2kPYRcwpVk6vWQs8kLGlXnsB9N8Ted/aSkTBzos7gTqbinSjSVCxMc5YTKMa4TUFDXHd9b1aX5/YQFm3Lga+Kz/vQOqMjmvDuUb3sUE1gPTc00K3CfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bb9J9g71; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bb9J9g71"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE09FC4CEF8;
	Thu, 27 Nov 2025 11:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764242027;
	bh=hnylFDNiB2RskzMImuvbdxX/ijKlS7OOQ/eMp7B9Xik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bb9J9g71hk9lklZrbxKpksypwhs8MjjXdtXGvTmsMezYP4147YFMnXftcKwjkxGob
	 j7R/3MwaT4fEskvuOOlmoLv8iQ/mVRTFzX8OaJQMTnRAPQuS4eGtd063BbaPGgM89C
	 zEwEbnM1ZjaEi2dLi5J0g10eHSiwMXWCLeW8s1y+WbQ+nk69abEiH16ZZekmBeqQjK
	 DOd/bmzPrO0aX6MGeBETZpYhiBbIZJ8wWHFJKYJ9PgyRVcSQM22JjsBX8dghOp5fO8
	 gsED1Tfh7cijSD3cbaRWdAIGyLMus7r/0idPra01vHPhX5MYgvlzURXmngraahUjqJ
	 JrQ/E17aeNSAA==
Date: Thu, 27 Nov 2025 11:13:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.18-rc7
Message-ID: <0827deaa-1b97-4902-af08-98bea70487c9@sirena.org.uk>
References: <25d5b5826b2e8d821caf7a37dea59186@kernel.org>
 <87jyzc9erk.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZVKWcNAbUDNYy2F+"
Content-Disposition: inline
In-Reply-To: <87jyzc9erk.wl-tiwai@suse.de>
X-Cookie: But they went to MARS around 1953!!


--ZVKWcNAbUDNYy2F+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 27, 2025 at 07:21:51AM +0100, Takashi Iwai wrote:

> Pulled now.  But not sure whether I'll send another PR for 6.18.
> Might be postponed in the next week for 6.19 merge window.

Either way works, I don't think there's anything there where that'd make
a huge difference.

--ZVKWcNAbUDNYy2F+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkoMmcACgkQJNaLcl1U
h9AO0Qf9FmD6C72FkRelmiKuo5Aq0lKbAzi9T0gUOyblaSYkqHixta+3zS+YWDZI
oxkxDY8pzwRspiYAIno5+je8HBSEpfdybxcAJKnID0UkRlT2gqOiP2gqFEwIpVLo
RvslafLOs36VGzs8/i1UAlkKuhGj12ulpyPONg6wyd2Iu3VxaomoiXw6zfiijTMq
tbak7jQ1dTGPx4zado872SpJZ204oLAmReGp6JZonVgSGyvE88i0N5f1WblwtK0l
AJID0jGzBjgBTYUow3agNMJ7YzKNswHG470tsyr3jf1HCgCogrRVCbN6QNonNajh
KImKvQe+UIRnK8iu2Gr30LL2ySIJRg==
=ysCz
-----END PGP SIGNATURE-----

--ZVKWcNAbUDNYy2F+--
