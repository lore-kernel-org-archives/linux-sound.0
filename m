Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40963115AF
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 11:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786017172; cv=none; b=r6g3dXiHUtmicMihH6Jw3W2KoMUc2qnJU/mgmwRj7acG8OYJqbGteMvFU+G58AA5Q8QewFDuy+X+VZJQvr/hg0qD4NYQWApNBMmN9OPlqcfj5npxeQKTLFY1UzEcHHm6O+GriwyCZSzCQJ2Ri+NBAxVSIioMJL86204PPl1+4Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786017172; c=relaxed/simple;
	bh=8xznKKfftYwRF6p9iZm/mkP+qT4GtDtUBJfNbSafCrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQd+xli2/u3Aotk5n+bk4wy6t6sAlja1SAv2TV8V8S+iFuiMlH/FHOm5hBCER9zmujlbJlriJeU9LSw5MYah7nKAeGtzNwBNxmnq/W3IBewHlplMKUbU1TtlYqNmuvt9Rpqy0f01YO3e77InOiV/eq0+b0OD/fgjLBJMoGQzhII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YGdgrmy+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YGdgrmy+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0FC91F00A3D;
	Thu,  6 Aug 2026 11:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786017171;
	bh=citqT/AFZi0q9iKZcSG4zvjsUiMmX4AgF6kMtzpFpTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YGdgrmy+w3SAM6AU7nRwBQBqgRh/P2Ft3oGklHx77NaAyHbSEJ9z7cobgiSsiDwcW
	 u5JUXJtdTHAtXsY2R3dKj4mjqqu4lCUn6AgijbpVMZ24wbutNUEXyZ/8dwi6ev+56/
	 8PJ5GFYu123ccuWEnT5dCQvOKbCZR0lFsz1R5xoga50uHgrK6sBlBu8JcFY3R1LAQ0
	 2iQIN2vfOM+bWc0iJ2qNuBmYNV6T20xqaFjH9s6TxNubz3mn2+lmwuTyGis0jpL4Hu
	 rKmVFu9QSSsFPtcsU6GUPiMXVonxLRdX71yjd6ImiS8sTfjL6KFvdbsfXzbQuhGQI8
	 mUCyfcv8KKWcQ==
Date: Thu, 6 Aug 2026 12:52:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [PATCH 13/31] ASoC: rt1320-sdw: Use auto-cleanup for firmware
 loading
Message-ID: <0552108d-13f0-4ae5-b620-a49f5295e9d4@sirena.org.uk>
References: <20260805135247.670693-1-tiwai@suse.de>
 <20260805135247.670693-14-tiwai@suse.de>
 <bed1131f-59a4-4da7-994a-d1d5a6728603@sirena.org.uk>
 <87wlu3em39.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZTX3418R44FO1beC"
Content-Disposition: inline
In-Reply-To: <87wlu3em39.wl-tiwai@suse.de>
X-Cookie: Brain fried -- Core dumped


--ZTX3418R44FO1beC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 06, 2026 at 09:37:14AM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > There's a goto further up that jumps over this which clang warns about,
> > this will break the build.  Landmines like that are why cleanup.h warns
> > about mixing it with goto.

> That's an issue because I moved the declaration of the variable fw;
> if it's left at the beginning of the function as it was, it should
> work fine, like the patch below.  The same applied to the error for
> wm2000.

Yes, it's fine when the declaration is at the beginning IIRC (though not
ideal stylistically) - the warning is generated when a goto jumps over a
declaration.

--ZTX3418R44FO1beC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp0dY8ACgkQJNaLcl1U
h9C6yQf+OMoRXkIq2PP1l3mVKOKAqkpHdj2ktUx0hTYSRlFhB+FViNrzHoYRWCPj
UKfH+BE49GfbPW8EWO/tSuY0795s5+ySq0WU0kEGpoJI5DMWCCDYMymu4BghI2yw
O1tlWyIhOd2/PGxffwElPOcR1Cp3nvmptBXK2MwssiH6DlYOWqYEW2kZcpuP3pjy
Jt/0s6bSWJi3YNJNFyPCd76JN0dRCluMBOsSUGSSz471FBjkqBSWwNy4cj/jvFgt
exm+pkgd6f+jcSyBIXv7NtRV7rHZMbH11bQQz1lI6ilOLikEhcx/wanS6X4bptCY
9YQDDT+uqijgYrEqO7SJjwvG9WfrNA==
=daLm
-----END PGP SIGNATURE-----

--ZTX3418R44FO1beC--
