Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70969286284
	for <linux-sound@vger.kernel.org>; Wed, 19 Feb 2025 01:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739930305; cv=none; b=tpPuub/nJJ97ttSb/CI/YpUFJay9QvDOz/163SkjK6Gph1xix9ARKFn0LMHudcnc4MW5matHjoA5NxOtLq9lBknu5VfoDaYTPGZr28Hf6kZpxcmvRwYnOEhkHkxZyyxAc20padAOSSiTmlvUORP9oentD0Uc8cSMjTl+ageaVaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739930305; c=relaxed/simple;
	bh=4UVkjbtAVV6EAcM87vg7XFzKZlZPXRgEEcQZ1ewMwFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9zY8eKC6CdqyO4qkJffI/nZLv26pMlU/9UXmMWQsKPuewjdS0jgtbfFmkDH5rJvKNVlLxyOeImHNydnJTtvnkcPhGmvBDWVkjsmslhz45SGwsxknAz1uXWamvhS4v1rN2crf9ZBoANfvp1QIR8glmR9XvjFUa+7uPdlWAhCNMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uIecJQP5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uIecJQP5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70DBAC4CEE2;
	Wed, 19 Feb 2025 01:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739930304;
	bh=4UVkjbtAVV6EAcM87vg7XFzKZlZPXRgEEcQZ1ewMwFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uIecJQP5yP4H9NLwe3PxGl3u1g/e6JH3LZxtYlbJSeydYG+tcuqaOzEG9jF3VtiZS
	 Cjlg9RwiGsrqaEWC0VqshHLfjO3aYmbDIxG2wRCtCtqXCBCqH+oSFdlE/UNFxcoSsp
	 uPlUUQGtYbqhRJcfPH/FSXq3eDEIaPjaPHspY6COvL1UEbT1qqZMvaAFFrL6a8RwEi
	 ksxmZjCySZ9O5i1v1Vd2r2hWL/2CDZa//BEZTCnMmt+M9EJxkirmERNDGF9dOc+Uh5
	 DtvcexcuXXaABhnZNnsT3WUkS6D7xVqo4f1WCMjclWUJXv0knHeweTKMCjD9MvbkwM
	 IA67SvJiVKwVw==
Date: Wed, 19 Feb 2025 01:58:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [RFC] ASoC: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
Message-ID: <Z7U6vQBe-BQcmrDX@finisterre.sirena.org.uk>
References: <87jz9mviis.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lRVYS3wQlYeqkkLl"
Content-Disposition: inline
In-Reply-To: <87jz9mviis.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Editing is a rewording activity.


--lRVYS3wQlYeqkkLl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 19, 2025 at 01:18:51AM +0000, Kuninori Morimoto wrote:

> We should not use (A) today, use (B) instead, but we still have (A)
> definition for backword compatibility.
> I think we should full switch to use (B), and remove (A).

> But it will be too big-patch-set. To avoid patch-bomb, I will post
> some of them as sample. I will post full-patch-set if there was no
> objection.

Yes, we should do the conversion - I've been chipping away at this
intermittently myself (mainly for CODECs).  If you want to push through
the remainder that'd be awesome!

--lRVYS3wQlYeqkkLl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAme1OroACgkQJNaLcl1U
h9DCAAf/QLdBcOpYfTAEwgssEE/6a6oUOyYCuabXQ/++Xq9GDFwozi0YK1a7ZlIx
Ufu4gI6gTnbkvCYJH9oPUGaRSFdzKwR+Y2PME01JHd0//JZMGLqcT6frSQNLDsjn
f8Hv1tUCbRItNJMEmzysSNjvT/ZE1XlbNHIBESay4E1KW9/Mkh8PTG+wZJCiCFjW
r4nVUBklflX8cfkiTgh+ouD2/lwOVaXaNGltHpfUDaiH4Z6A+72hnCyA2K7ZlBra
/0c1LVsqatRbWtY/ylyUywEfrLCSwLd4Tmouv6Rufktq7Z6PqKRciYf0+ANLQjwH
k2P+jylA6fd32wW2aLOLyHlhS+mvUw==
=46aW
-----END PGP SIGNATURE-----

--lRVYS3wQlYeqkkLl--
