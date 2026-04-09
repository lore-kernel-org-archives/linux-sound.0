Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD7A26FA5A
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 19:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775761880; cv=none; b=TzhqUOi9a7vKchE1lBXAa60hHXVWDb1pKLSFLJGlRbVWQAFGvIm/KDOD6XMetWg7CIGX0OSNgQeeNU1qbksQ4N1WvTVlrEvNCIvKG/V0PGq4dN85IRtiH5HbYDdhu9NVdKEQWog0nB1awldukxiFGRyn7CsxTsp8HfZtYSRrQ5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775761880; c=relaxed/simple;
	bh=bSqTERlEJrB7NZDk7eikgHKHnBtU07q1lYWoeruOlgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gy+tnFIHnJAQl56jFjY77B5z1YrsU786W0+FcrQeV9yfTYkPUOr+b0JP5vs2ZqcwPD/knmKGBkjQ8w9B47AZX6gga9lJ0+85BWrp1qhcQyK5OFcIi0m9VNbpq+e/6i8jHPfSRR1Vt4Q4LFZfvTAH16Yal1iaA3SXJlDMFYPfO9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dpJGh3fM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dpJGh3fM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F38C4CEF7;
	Thu,  9 Apr 2026 19:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775761880;
	bh=bSqTERlEJrB7NZDk7eikgHKHnBtU07q1lYWoeruOlgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dpJGh3fMm1Fn3j/FeuS/oWP7A2AA/s/2VJs3aKgn9RsoGns3aVu2InWFyd53+Okey
	 yVeovQjtxThfMrKrZkIBYwvZEq8LDqMgVba8YMa1clTMQ5svZ+2tRe1qSuhnQKYMej
	 2YnVikFL0bXiT5EUb8nF+jTvGXb75BAV0nabvgFT2dpVZEwMXJ+eOYazfkJa1d0UCj
	 oOpbcMZKLnqAlYIEQ3DWnZiOm6NvC/BMLDMG67pt5BC2+46sboEMtAl9jxYy8OugGn
	 ApiM7FOwJPO2LF5TcOWdT3YLIFTIQLx78LTnvnZCuout72r+ypnDINaSiTWOAX7byK
	 JKGfUEsVYn8YQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 6BCDC1AC589E; Thu, 09 Apr 2026 20:11:12 +0100 (BST)
Date: Thu, 9 Apr 2026 20:11:12 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [RFC][PATCH 0/3] ASoC: remove card->pop_time
Message-ID: <adf50GLs7me92fvV@sirena.co.uk>
References: <87h5pkda1r.wl-kuninori.morimoto.gx@renesas.com>
 <82c256e5-0af8-4ea3-ba5a-913a576b25cd@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JR1+KvxBkKFt09Ia"
Content-Disposition: inline
In-Reply-To: <82c256e5-0af8-4ea3-ba5a-913a576b25cd@linux.intel.com>
X-Cookie: Are we not men?


--JR1+KvxBkKFt09Ia
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2026 at 11:14:08AM +0300, P=E9ter Ujfalusi wrote:
> On 09/04/2026 07:36, Kuninori Morimoto wrote:

> > I'm now trying to cleanup snd_soc_card, and noticed that card->pop_time=
 is used
> > only from OMAP1 board-ams-delta.

> The pop_time is an amazingly good tool to debug pop noise and is mostly
> used via the debugfs.
> You set the pop_time to non 0 and DAPM will 'slow down' and you can
> identify the step which produces the pop.

> Please, don't remove it!

For Morimoto-san's purposes I think it's sufficient to just make it not
card specific so we could just have a global control in debugfs that
applies to all cards instead.  That's likely sufficient for debugging
use?

--JR1+KvxBkKFt09Ia
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnX+c8ACgkQJNaLcl1U
h9AlLwf+M9HzPoDh2QQOH+mmeN45qTu+iBxmINNio29vEYz4EZeVOpg11J66YLHc
FY6vvicE5ezpYsW0T8C6Hl/lgrgDgn9dt6hvzSdSFh9lmIpp6FeMb84Q7MvD2cTR
uokulexxxUCefp9rWgVnPaqVOgdwWE4broisVXfve0LSJD8LSDQvO5f9Z1NJ/IC6
Cnp/NKRiOx71LWHUg79I19dBIfx/MeeWJpuOt1BzAbooZ8nncnXsaqc1OAh1kQSv
3L9gCD27rgUJaV+pnGTZUOEiy0HmVpwUTkwhaJJ8zQDluqtZhIIY24NyEfSQu2LX
b/5oStTdfpUwWyQJGPmq4fOpJhkYVQ==
=1Zk+
-----END PGP SIGNATURE-----

--JR1+KvxBkKFt09Ia--
