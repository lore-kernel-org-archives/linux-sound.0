Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3343D1CD4;
	Wed, 22 Apr 2026 12:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776862265; cv=none; b=uOLivBiD+jGBfbjpgWr06W4INg8vODaf5gs6Mb2AF82OCWS/kvvVyhZM3LHULlzS8nzo97NaIoi8iZ2AoQz7T/MmSefjer2x7c1oNG1Hp9y/5CQwTN4xQDcsa/X1bQ+hLVUeHTaCeKAcj3XEiKABwpVv/5K3yO+64cpPoV7CcgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776862265; c=relaxed/simple;
	bh=B2WZf5wK0C4bGIYOYzXmLIiaCyaWs8AgxUqbFXs0VlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2Df10xJVYDygDZL3URRL6A2oQIiIsCs8lYApnkC7wkVxiYfF3mdjAhwZGu3k2AjKJID/dpNRR15RIGBd37QgQIHugJSc2n5DfEO+xT4roEasPV17LsY1GHohYuqD7WVOiQWbXYapo3EEsYdG7ZYoKHqEfap2KKHgE4DXFLlE3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LzmKYLpO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LzmKYLpO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A664C19425;
	Wed, 22 Apr 2026 12:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776862264;
	bh=B2WZf5wK0C4bGIYOYzXmLIiaCyaWs8AgxUqbFXs0VlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LzmKYLpOriJemZ0kLqjr5vGdswFlxKplY6mpP9CqcCLzvU++Z2RKpusSRmND3Pm77
	 wG3BHzjDQXV6my40GhbdekzwTb6Y7agUzlz/vazLbssix1eq0TROd+7rZVO6wBiVXp
	 41r/VqdpL2OiFflAGiu7VFnjcVkeP541Botx9ljBsQLy7hDJHQgnSPRYCA3eEEvtCL
	 8DcmCwr1TH6i+6KYXNymkn0RCWJKukv8cJRrfiCiWBekKXwNCcqYkPPOukGASWkD6U
	 lb7qv9y5wNzILnHEVC44wMq///0SBeMkisJOqVYHC5VIeZIqh4zmEBlySnbhy9EQ+p
	 9kL6gZhLvkXYA==
Date: Wed, 22 Apr 2026 13:51:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Tobias Heider <tobias.heider@canonical.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: ops: Log unknown controls in snd_soc_limit_volume()
Message-ID: <197117ad-3060-4921-9566-f91a0c2b1fc7@sirena.org.uk>
References: <20260421-asoc-limit-volume-error-v1-1-dcd0102576a6@kernel.org>
 <CAARv3RQ13+J-rbnAPbdjT4E0YGcXa_AZMUZzAp7ZuWW9HgPEFg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gJcAI4cY27OQmqbi"
Content-Disposition: inline
In-Reply-To: <CAARv3RQ13+J-rbnAPbdjT4E0YGcXa_AZMUZzAp7ZuWW9HgPEFg@mail.gmail.com>
X-Cookie: I'm definitely not in Omaha!


--gJcAI4cY27OQmqbi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 22, 2026 at 12:09:33AM +0200, Tobias Heider wrote:

> One thing I'd be worried about though is the number of false positives
> this might generate.
> The x1e80100 patch we discussed previously handles a  2-speaker and a
> 4-speaker configuration
> by unconditionally adding limits for all of them. Previously the
> missing ones didn't really matter with
> this they also print warnings.

Right.  Ideally the card would know what it was registering but perhaps
that's more trouble than it's worth.  I'll split the difference and
lower the print to a dev_dbg().

--gJcAI4cY27OQmqbi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnoxDQACgkQJNaLcl1U
h9CWCwf+O8KhQoMHsmV8csw1ix0ZP5vgqks81dOu7FemyEaT1YtSUme3Vm3bVnqU
Ajxyje1EafehU2ZeI4rpjdq1ccy7WrhTydoJz1Z1tn3boiXE52dgrCnXBxnr8EG1
7+FAnHotxNSvHjxE2fA/zTLc3+YwqkX7nPO7VrznUPm4BALWgB52pHxmpDGvnKJL
rkf4vH5hyAptb1kTMMNVs9QJS5L83SYd+lGpVpBi1DaedD+K1IqWqplTfvtm0de3
6EeRr6rlb/3DeYY/H6XKSlfVnG8OMwJzBhf3FZkj0ABglDZUOC3CyRA2pGhjaBZB
ZtSOIEwZj4VDOaF2WvGyts4n7CXE2A==
=rOE7
-----END PGP SIGNATURE-----

--gJcAI4cY27OQmqbi--
