Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FFD38CFF6;
	Mon, 20 Apr 2026 11:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776684045; cv=none; b=SKUlcjRYnJ2NvNA/PemQ738cTXEaLill83P+1ypgbgXWb2rbZ5ulXt5DXUyatQhj1MdkRkOY/gVOKKJAdP0K7TryHjKt+ox2Z/zaKwUU66hcOBqMSaumHo6YnDjUQrEjtOqiB4IuAOETAHcIj4wNHdj/pUrQw/H2tHnECNE3r3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776684045; c=relaxed/simple;
	bh=4Tt3DBVVtKjOcwYE5WG2A8i1GNgjo3Qw0S9zsA1WHAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qECUwQfVbLf8w3gs61dY38xtAO3xlX3SfQbM0Ixyn9ivViJEPvHJSF7/xj4S5vXfJR/g8mcEY5s0bu0n6IIjwsInj2aQv0FcPeH0xPTXSd89S423dDenbLd1gYPRhbrd3kDBFJbaHzOb7mkJBaCZpu7kU2tZrsPUF+6D5bb4Q2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bX/Gzz/c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bX/Gzz/c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D8ABC19425;
	Mon, 20 Apr 2026 11:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776684045;
	bh=4Tt3DBVVtKjOcwYE5WG2A8i1GNgjo3Qw0S9zsA1WHAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bX/Gzz/czL+dQjr+mbJHZs/c1GSUy7dfuqlo/Tx4YuzV+/qXpN3Jb/vQdre3heHXX
	 OqwOiGmCx1l6Pa+6j6CqJHChdqqJ13eh6uku7yiaRkkh8+Zxr5krb3uUGKRF28InlW
	 UN0zHGQG0bfJZrjFcPI404Ht6qa7APjygKq5GPb245/olozUroFx7rQkToNFMd0V/i
	 wGheIs8sV9FYRUDE3foZSfc96qmoWegQkhnVyBgoFSkY8u75EG/mlsHZZ0Hfz2c40a
	 DMWNz74Bi+dqfrgiq4meiPe7tBKC4RtZxTv326fku6wbvLYO4dd6TDKO6thDtXVEBW
	 O9fwlPsoxjpQQ==
Date: Mon, 20 Apr 2026 12:20:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Aaron Ma <aaron.ma@canonical.com>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: sdw_utils: cs42l43: allow spk component names to
 be combined
Message-ID: <faf2f908-cff3-4efd-a80b-531a2060be68@sirena.org.uk>
References: <20260420103722.4175356-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ke99+8KbfDI2ZQhK"
Content-Disposition: inline
In-Reply-To: <20260420103722.4175356-1-mstrozek@opensource.cirrus.com>
X-Cookie: Sales tax applies.


--ke99+8KbfDI2ZQhK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 20, 2026 at 11:37:14AM +0100, Maciej Strozek wrote:
> ---
> Changes in v2: use dai->component instead of snd_soc_rtd_to_codec(rtd, 0)->component
> ---

You say this is v2 but didn't actually send it as a v2 :(

--ke99+8KbfDI2ZQhK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnmDAgACgkQJNaLcl1U
h9CsmQf/QzF+gGz0lN32Xa5FMnRwWkX8pcUfcXK0AvNJnTW4UAolXt6ZlQl+PfWN
6z9sCSrWswKk9aHrz59GUfwcblH3+G0TfHCs84I9zSfOKuYfozT+MVixN91K64kt
DHYnQ+Y2jTF9ZlAf/iqbWMkjHugj57aYYkBOE8o4JYbZhUmMYzQAqEsTSGUTa3I/
Qvl3o5C+eMTk8/z26JqNJT8Z5DXWnK5fPP/1nBuBeRkk9Dz8X07Psi1mA+NeUj6k
fMOhRgac5lMaraeJLNdwXee8NmGELKAEzG9OmkJCV1aejZqsNGHLNKRzFBOwtvj/
Y1qR4TfqiicEA3bpgmCJrR0y+WlE2A==
=70J5
-----END PGP SIGNATURE-----

--ke99+8KbfDI2ZQhK--
