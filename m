Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7562D3727
	for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 15:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779721615; cv=none; b=aANcV3tSY/6EUhEHnRWHH6DG9hm69nfHmKUwaw1mtW/Q8Bf+CPqay2dSAacm6Z9/gQPfTL8DSVa/BQqueYL6CwSJuZNnaxuAV0QFCr9A9n+znotsdpfXwaGJaE6ESSjl6WfjfgadWTR69JqFS7kAoKuQCp0/O1hkW0fF/+qQLak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779721615; c=relaxed/simple;
	bh=qeczKcZp9UJib6rpfn/wasz5tVSRF8sIyHS/qEcF6ZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VeyzOgnoZJ+6Z9+QTPOha9Pc6Vbqoz89wNa2JvXtHV2s3C8S6/cQCDnmzv9irqGJGzUbWqyWhV6pDqW5K7xRH66gH2CtL4taIiOkiPNCJ9zcS73YsMkT/TRyAikprIx9bOe82eih2QTtDMjUKdN72uyIKqEgVB8M7PX9WB6CdhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eRwcu5Yi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRwcu5Yi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B65CE1F000E9;
	Mon, 25 May 2026 15:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779721613;
	bh=tcP5CNUHaa9DenQ6M/06kdqfqeWgr70sg6ygecjR0W8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eRwcu5YiWb6A3th6Gth4vog/c87hzSAYGeB9yMP1GZ2DxbBXSxSZsmCYKlS3zZ5FD
	 /srykjHTk9ARwsYDR0RLyutSSIl1kwPpQyxvGUxzzpn1PbwDUrdvnbzptLJxyF9Rsl
	 TYHgJaeJsEoVha0j1P99ePW64whE2EockR5XtjkFnyrVobkfWs22cJGCdPvldS8ddg
	 xoq/DZFJUgWF8akvb+bTh7xEglVtsSoKELgeQewF6NHoyQLXTZr+O2OI7Is+ZuahnP
	 JcsUyEn6AGMIJ+wnAaNVIAmQKW95NSGrcmEwJ8GFAf1YtNFdUGVP/fo+wY+8PYdE7e
	 /TINnB/JGkp/A==
Date: Mon, 25 May 2026 16:06:49 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com,
	perex@perex.cz, amade@asmblr.net, kuninori.morimoto.gx@renesas.com,
	linux-sound@vger.kernel.org, "Liao, Bard" <bard.liao@intel.com>,
	"Vehmanen, Kai" <kai.vehmanen@intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: Re: [PATCH] ASoC: core: Move all users to deferrable card binding
Message-ID: <d82fa24d-18f9-461d-8535-3266cc92fbb9@sirena.org.uk>
References: <20260430140752.766130-1-cezary.rojewski@intel.com>
 <01d1d642-bf24-4ef4-a30d-56884300407f@linux.intel.com>
 <5d8cbbfb-3884-4c6b-aea8-0c9a76964b3b@intel.com>
 <85045e51-e09b-44c2-9266-3e7ee72c4eb0@sirena.org.uk>
 <b5e82c43-9da1-4a12-af0e-90d4b9feef49@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qf/d6hxJ+jlelhqG"
Content-Disposition: inline
In-Reply-To: <b5e82c43-9da1-4a12-af0e-90d4b9feef49@linux.intel.com>
X-Cookie: Prevent forest fires.


--Qf/d6hxJ+jlelhqG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 03:48:36PM +0300, P=E9ter Ujfalusi wrote:
> On 22/05/2026 17:58, Mark Brown wrote:
> > On Fri, May 22, 2026 at 04:32:03PM +0200, Cezary Rojewski wrote:

> >> The question on the table:  Do we revert the change temporarily, fix t=
he SOF
> >> first and then re-apply the patch again?

> > Given that there's two drivers we managed to turn up bugs in already I'm
> > inclined to leave the patch there so it's more likely that any other
> > issues get found.  It's a bit annoying for SOF CI but I guess a revert
> > can be merged locally there?

> It is not really the SOF CI but the users. it looks like all codecs
> using SDCA infra is affected and will fail to probe audio on boot.

Hang on, are you saying you don't test -next or my ASoC branches at all?
It sounded like this was the result of a merge with some out of tree
stuff you have with Cezary's change but it sounds like you're saying
there are issues independently of the merge.

--Qf/d6hxJ+jlelhqG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoUZYgACgkQJNaLcl1U
h9CR+AgAhT0WuB0L971y4pA7ROnOtYZjkm+l+f20Bsl+jFmLf/XPhwkpj0pTfWgL
UALf6tgfXk+L+iRXRtuQs9Tq5tx5PigPOdF396goU8ilCkw4Y5VgUrW0qQk2OzW7
iQuJVhrbbyMvAlfuL+zijdwVhtDhV0Tk9sLe53Wvd9FlRoTz0vQyS5mKLIE9yie6
+f5j9IzVaxRQTGAvhwOKpRQvXn7qRV6fFocdomV8Z9aJokeWqBNJbLUYqiDnXNqt
Tm/bYEhDYP4Rnjh51GKc0MUqZm1JEsB9ceb2voKbtIWnReOcUCCpKNGacdbUx8de
YIiftJ8H5TZaYJ1yE66VK68OJbF7rw==
=S08O
-----END PGP SIGNATURE-----

--Qf/d6hxJ+jlelhqG--
