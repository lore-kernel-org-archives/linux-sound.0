Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1883B369234;
	Fri,  5 Jun 2026 16:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780677182; cv=none; b=rRnRAwXsrWP3IFGyO6ebLRnvleBPkD4OcYYH+Wo+4+lL32BjXmR+T1MwxgOu6Knz6pfC2foqREtEad2RAHgs1wo5gVkSJkMma2ycuDZtCWoV/JAPY0JqqudhpNMqgXJBOZ2pVgcIMrfaugsCxzF7eGgMJgq4izoXGActIOOPsgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780677182; c=relaxed/simple;
	bh=XdaUqpemeJInYjQOAOfUp5vuhcrM6Xvhae72sIx03hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U08KisMIosCe8p5S3t0SVNnBKWihkbjCeMsi5hnfCOarFU6Sbgdqb9IgzGTaaLjzn3OLogtRCsIyF1khZrXEdSK3GGhbjoKlslKSPn3Mz31cRnktwWZQA2+wabk7H3nrSSvpSFY17BK0C3fbfcn3yDf/6BqbNrPRR6ptzIqV7NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MGQusmPV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MGQusmPV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF741F00893;
	Fri,  5 Jun 2026 16:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780677175;
	bh=NUqtLxYe4LXsIZDiLuB+KBJWoypL/aoV76Bd5XEZ0A8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MGQusmPVOkuSkh44NMEIk1Lfh0WBM4wbYRzKkiroZIQtgnwrJ4ggXDF1IhnY3i2tY
	 9ULxqZhalImC35XrmhCRmj3MxV4pzRIv7sU3Yr/mJUWJsbiQRqkUNOVY6XiH5SPc/N
	 0qLdgDjXND8z7HUL0aQfg8otfpBzfmxounWjuBR681lVOBvHcnNll5iR9tuIPN2NBM
	 rI/7YHFT5NN9/uZEA9LQTK7JGVBHTl26U+qwvWarXapKzJwiUWr8BMSu3HsSmgtg91
	 oprZ/Rox6p5NtI6SGGm9ZO0hhmx5mMRI7SJTNBs0zQensb8sw5FxUxEVIu0/jCKw/o
	 5KW+JhAP2lAtw==
Date: Fri, 5 Jun 2026 17:32:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: soc-core: Create device_link to ensure correct
 suspend order
Message-ID: <e2d7793a-c7ae-42b2-a841-c2a9d3ca1200@sirena.org.uk>
References: <20260601142835.282301-1-rf@opensource.cirrus.com>
 <84d162fc-2b0a-4aac-ad40-2203a277d82f@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FV8rLwTNuD/IBVV3"
Content-Disposition: inline
In-Reply-To: <84d162fc-2b0a-4aac-ad40-2203a277d82f@opensource.cirrus.com>
X-Cookie: Error in operator: add beer


--FV8rLwTNuD/IBVV3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 05, 2026 at 09:55:07AM +0100, Richard Fitzgerald wrote:
> On 01/06/2026 3:28 pm, Richard Fitzgerald wrote:

> > I think it would be ok to put this into -next and let it get some wider
> > testing before it goes into 7.1 or older.

> I was looking at the Sashiko review for this patch.
> If Sashiko can be trusted, device_links seems to be thoroughly
> booby-trapped.

> Short summary seems to be: only safe way to use them is with the
> STATELESS flag and do manual cleanup.

Yeah, I saw that but didn't put the time in to confirming how reliable
the specific analysis is.  The booby trapped bit seems about right
though.

--FV8rLwTNuD/IBVV3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoi+jMACgkQJNaLcl1U
h9AoAAf+JLCQAZPDWjPPoDIF/ziOX1MREENUA5lOepNpYlWr9sHn7JDHwdDYz3pJ
bcGOKtvZz2rZapo5XMpsKkwQLnM+iQe/MDQbMlKah7LdPnpJUbxktRiFMeyBEbQK
olhJcMD7YtlpkorfiyEAJvdMHTCtAbib4kgp7URAivyiq6+jn56JyFcm3MordwQx
GvLblk0TJfCsltjQ0LhJntYIATxEmQrsgnJiV15SbBleH4wfrj6YS51JK/rLiQbh
xfSiyVprghnGsng2mI9qZ/rtqGXNu1MfFi9zkru55SwzCZhwC7vVCkgxSxw1n+A3
rb+jR914zvDef4NsXmNi1BEzobXUmg==
=nKHF
-----END PGP SIGNATURE-----

--FV8rLwTNuD/IBVV3--
