Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DECE328B62
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 20:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775767647; cv=none; b=Svfj2W7GkhqtlZBdCMb7mPu0Ev8xR374Jf6ihaRK8E1icaPPB13W0OT315VD959dhZC4PUIt+x7HszvCKGV0Rj7PjLEAiPRs4PvQaMC/TeTxZBvf09TUdVQgOj08T2XKPNWytdy3sOJNdhfq/wPSPrGMEnNVN4aJOaDn+llgZ6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775767647; c=relaxed/simple;
	bh=mg8N1NLN+2Q3jpwxItmT8JwXVXwo84rUnmuP/Gusv/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b+0qTxDAi4aOzONsSIGWr+gkr15e4nqQvIQ5HqW60xTWUN8gg7W1PuQXyYlbpdiNyTg5TFCrYsykMkqfaQoYNtDiYcc5q2MBbtJWBeoV24Wdq7QVjpZjjZeTjtaIAIIvmieeHqwUfTBNyymleyaePikdQDe9BYn4ymH5kzLt1P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TlJnxAV7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TlJnxAV7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC19BC4CEF7;
	Thu,  9 Apr 2026 20:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775767647;
	bh=mg8N1NLN+2Q3jpwxItmT8JwXVXwo84rUnmuP/Gusv/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TlJnxAV7AtYiDZRKQ2r+kJBFvzMA1rP1yy/7lWEMJS2sB+ZqZM6lLbJhkaAjcX1qa
	 hR3LtQP1OtVV4hFgh/XQqlEIsnSDs67/dYJZIv1VktE9a9ieiJ2rWwn4DO+yBBAX7H
	 GieMdj/EiCRVnvB+Dr4+JPVxeqnau0zNMoAltEYfEnWPgv4jDn5gwGrGajWASvHtta
	 a4Q7Uh5tcQfu847UW+vOMfq3mMlynY1Gzj2oh74RAFnhAO+YWCYt9KfDugmvQGHDUX
	 h5ZLdvcVfdGOzugeVUU0nrBQnuxyLiApayUPXoPUHrLrzWeBvL38CmcKIvni83r4Y+
	 Xp+RbeOnjqjSQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 5623F1AC58A7; Thu, 09 Apr 2026 21:47:20 +0100 (BST)
Date: Thu, 9 Apr 2026 21:47:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [RFC][PATCH 0/3] ASoC: remove card->pop_time
Message-ID: <adgQWGqAtN7Yv19F@sirena.co.uk>
References: <87h5pkda1r.wl-kuninori.morimoto.gx@renesas.com>
 <871pgolnch.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TtgXsJb5p03F3c0S"
Content-Disposition: inline
In-Reply-To: <871pgolnch.wl-tiwai@suse.de>
X-Cookie: You will be divorced within a year.


--TtgXsJb5p03F3c0S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 09, 2026 at 07:22:22AM +0200, Takashi Iwai wrote:
> Kuninori Morimoto wrote:

> > With off-list talk with Mark, this card->pop_time is is much less of a
> > problem.

> Hmm, are you sure?  IIUC, it's used for a flag in the modem desc for
> cx81801, and a bunch of setup seems depending on it, and your second
> patch removes the whole of those without alternative.

> > So let's remove it. But it needs Acked-by from OMAP1 member.
> > I added [RFC] on Subject.

> So the actual question is whether the modem is utterly broken for this
> hardware or not.  If yes, it'd be a good reason to drop and apply this
> cleanup.

> But if it's not, we'd need an alternative implementation, e.g. move
> the flag and its handling to the modem's own object instead of the
> ASoC core, instead.

Yeah, we need to figure out if there's any actual users of this still
and if so how are they using it.  It looks like you need some custom
userspace to drive them model which is fun...  There's also some
more references to the timer which need to be cleaned up/updated if the
setup is removed.

--TtgXsJb5p03F3c0S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnYEFMACgkQJNaLcl1U
h9CB6Qf/csJnNVO+NuN/XbZuhucKO9wGWbsYETP/GyW60lsa/qnxPgVmfrNNaJM2
4th7M3tQzB9Vlfuf95e4W2txXS6myyJp16YbDjlpUtwtoCKbjalucImyUt8zSU30
pd8K0fwdm3wMQqEb//C065pqRRrmOySoLzkjHeZO1H9RVrmsucZZQmaecM19dZkU
k2w8yMjnsXDtqHkZfIOI3OmxS0K9K2TFarvXpKizThSBld2vPVukRTOYbpju+Aog
CljV/GohY7IssD8gK0YaOhLnxvhibV6cTtVl4I+yYWrNfs94njg4zXNrskF0g9rh
Pk2KEp4HHw35TUI2GjuB7JbnzuQRjg==
=gE5+
-----END PGP SIGNATURE-----

--TtgXsJb5p03F3c0S--
