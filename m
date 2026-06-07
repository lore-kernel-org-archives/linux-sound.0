Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35EC328255;
	Sun,  7 Jun 2026 11:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780830238; cv=none; b=fNlKO8q9jVHg6IIk5LVFHuYS76ZOKZtj104WaTj3ejr93Tt3/LusQbmTeeOlo0wuehMObGDLdeE8gQJHOYBLJbpYL8lwhlRBA55GfTLG7kbRr9NoYAyY02HvwJLWYb2Od4Cbmws6IrLQxmfe7P05I12PLDtPEt3petgN11sDgp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780830238; c=relaxed/simple;
	bh=mlCORkvOR5QtQNYpnN4uIK0V/YH60uw7DRX48WydXVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUnx+rIMRumzw4oagSRYNviZMDBXLJGRT/kDXvvXoF/nV7ky2jy07dz55rRgEwDe1YeG449nOsmVdLQ58GXxFnndA/8BSGeOYopxSk6dYk5hv3JROBe2ivX8hRIAPx+r5k9YA+NNjfmZSD8FoFRfZawhTSQ8nHqm1+8yNfnsVqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fx/XLufu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fx/XLufu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D56D1F00898;
	Sun,  7 Jun 2026 11:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780830237;
	bh=Q51oyDzKzV4MF+Dpy36tXIDeSweiRIeNOPrKn5lzwVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fx/XLufuM2fGLssFvjcAdzj39iqtSnVr7I7JjACZYBavlLEv/9zIbU6+Mztc99/Up
	 FvYlLsDQCcJ2ZlCqx5FBY//Fz+zOGl60arhdSu7LYMbR4Knh3lQc+GSrMkl8ebN6tG
	 B6eVEFj9oDfxUTV2sjGwc9yJudAz+gKahW36y7tNrLIknZdYcIcCiIYlT9I2xE7OWp
	 5fsi53cdISzQSrP+d+y2Fo/XmhySryNe3pG83odo4QMjU0GRiAREiVcqM3NCnarAe5
	 8cuLB/gLTW7tmC3F9EkRSmIWkWdiQUqL0YAECCcovK2Lc+1FrVUMhMwDfkACtfc1Vb
	 UiXt8sxbBmjHw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0F98B1AC5658; Sun, 07 Jun 2026 12:03:52 +0100 (BST)
Date: Sun, 7 Jun 2026 12:03:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ASoC: dt-bindings: cdns,xtfpga-i2s: Convert to
 dt-schema
Message-ID: <aiVQGKwoqc7fqppD@sirena.co.uk>
References: <20260421085635.4490-1-chaitanya.msabnis@gmail.com>
 <98e79ef7-1a0c-4392-aa9d-ccce988593a3@kernel.org>
 <CABjkosFAm17BfURDq2z0AvMNZrz3=QJcLsvxhVZbrZkKwd0rXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B6q4QAZcE9SLkI5h"
Content-Disposition: inline
In-Reply-To: <CABjkosFAm17BfURDq2z0AvMNZrz3=QJcLsvxhVZbrZkKwd0rXA@mail.gmail.com>
X-Cookie: Don't read everything you believe.


--B6q4QAZcE9SLkI5h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 06, 2026 at 12:09:28PM +0530, Chaitanya Sabnis wrote:

> Just a gentle ping on this patch. It received Reviewed-by tags from
> Max and Krzysztof over a month ago.
> Is there anything else required from my side to get this merged into
> the ASoC tree?

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--B6q4QAZcE9SLkI5h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmolUBQACgkQJNaLcl1U
h9D3uwf8DL6wiWU87At9qbpj4KOmRPYR4GdDyS6l4O/ffoX3wPJhhvN9ZsK1BJ9a
SDhyhKUBSd21JOMj0bkYQrH63vIp0i+gW93yjgr2rLOkil9m714mhc+0RBqI9Jni
JVivspJ0E0Rk83rQPFh4jrZ/0W9d/ZNGEDe3JoMRTAerEq+GwtoGAmOqMHYIppCt
GIxSkZP7pVx+UfjileLOZuz9pb8MwkiSs8FRh2sxl+vSQ0xpGOWe+W/1+trZwwRD
XEfbs7c5OgH7R2PpBXzfb/g8MNdpAe9kZxbsXE/Sx+0aDSY/luvu9ARI2EZJMZpc
Lss1QR+zImfmhumQzKc8ct3ZREfqvg==
=nXI2
-----END PGP SIGNATURE-----

--B6q4QAZcE9SLkI5h--
