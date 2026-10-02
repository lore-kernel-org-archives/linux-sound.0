Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87CF31E858
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 23:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790982043; cv=none; b=cmcWSz+jCFbi2MWBdwEWzO24apRhZ5wtzMMTz03T5fpHRHdSompp6TDuQ32jh+ID8WS/V1GKyVV8zcHvwEVNUBk7FMoNt9G++6y7y1S/L0HT0OksrmcCzb2RyNBKc5sWszkrsJquWlHpLSOJ0BTzYBD4xnxgcvO+I73XZB65p/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790982043; c=relaxed/simple;
	bh=fNCzgE1usvPQ3olz23KsoB/AKPE3hrA21/SrfLq7X5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nDjw2Rg4M2bjg/FfriyOLiDOgseNNiPkUPdo5qYXEtlXGTvNYMpwphQ3QCyoscLuijXcElmVL1Z9A9lEMNWfiUqE2u3PLUVd5auW+9zs6/PuyC8UTNwdfIxvfI+QHJ2Qnyo1DAH4n2/mKAnn/vGGpU45CJebzLpsAHxfKqHzL1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UqcTiGX9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UqcTiGX9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E6401F000FF;
	Fri,  2 Oct 2026 23:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790982042;
	bh=aGY5EhsTlLPg/vADEEsaClx1T/ujWnX81q7VW3xtogE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UqcTiGX9okKvPObtUuCBvBOtW9hoBfAE8BWpUrK8ZR6LMWP/BPRb8v83sv80xHYia
	 wocmTmuEcjfqCrjQV9DQFxWEPgK0+DyhYGQu+8LBQHfRX4iPrU5Ma8vzP8FcfSlkzK
	 7khwCXv4PpkjMze2oDB2ACSMB9yQ4fKH50AkbADWZfsmB/HxE2mQqMrhE3YMmIUAwz
	 GQ+IwTgH9PMcy3A0sSKOnU69EH3ACDZWRM4cEwuen7gZGduNG0MgZL8BLuxxx8jwIJ
	 JJQiJFo5V8uSc9xmuZ6+5/k/V5dNQpZUd7X/8v0IMUE+r2txaY7ifRs+vekyquLqJG
	 zJllrvTGYsT/g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 931331AC57CE; Sat, 03 Oct 2026 00:00:38 +0100 (BST)
Date: Sat, 3 Oct 2026 01:00:38 +0200
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Arun Raghavan <arun@accosted.net>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: Linux-audio BoF at Linux Plumbers Conference?
Message-ID: <asA3lugtjtwhVoxG@sirena.co.uk>
References: <871pbsnce8.wl-tiwai@suse.de>
 <5f459099-4364-46f9-a3b4-1c629aa91209@perex.cz>
 <87se48lv6z.wl-tiwai@suse.de>
 <8733uoys02.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o1Vj1YKOgLndhWH+"
Content-Disposition: inline
In-Reply-To: <8733uoys02.wl-tiwai@suse.de>
X-Cookie: revolutionary, adj.:


--o1Vj1YKOgLndhWH+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 02, 2026 at 06:41:33PM +0200, Takashi Iwai wrote:

> If anyone has NO-GO time slots (Monday AM/PM, Tuesday AM/PM, Wednesday
> AM/PM), let us know.  Or, since there aren't so many people, we can
> just have a lunch or dinner meeting, too.  If you have any preference,
> speak up, please.

I'm on the committee for Plumbers so I'll mostly be busy in sessions,
I've also got a dinner booked on Tuesday.  Breaks or the Monday or
Wedneday evening events should be better for me.

--o1Vj1YKOgLndhWH+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasA3lgAKCRAv73Ows9A4
iS0NAQCF/ATshXqNCJF1vR39u9R42dncP1eBHbvK+1lDdh+62wD/WWQWCrnKACh+
9PxkQrRmidU2erU9Gyzi1+5QEa+fEQo=
=quiU
-----END PGP SIGNATURE-----

--o1Vj1YKOgLndhWH+--
