Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDCB1D9A74
	for <linux-sound@vger.kernel.org>; Fri,  4 Oct 2024 14:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728053415; cv=none; b=rF0axVNP8TaIQOnQIj7QBN2mv36qtdY1/Y41nho7qz38hU7xDocZ0sDW8tz8AilcX/QmqVPoW1Hr4hHJZ/n//ozH28za1mnS+798UXrh0WCgZGmABqaRSGmhPx+xiCQelvlM8ossLlyqYRXr30xFzXEFhOIo2ntF0C/sAgzo0qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728053415; c=relaxed/simple;
	bh=Yz2WKEs5JKzMFngVQWLTNZ4WwJlmpb/O/oE0G1GqrIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B5yWT/SlZ+26piPS0FW3HIy+CxOEQYHG+NTGuU5GvH1hjqMHh+EzR97Gg5B61fhwbq7ylA24tm0P3wLuORWxNATZ5ayFbIZONtv3Lx00aAl+5sbqlvH++cH4GcGt2cQwLkwB89KhJIyNmYmTvLVcbxYh0UBdjwxVLjY13Oq/+k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uBv9TR/E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uBv9TR/E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB91DC4CEC6;
	Fri,  4 Oct 2024 14:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728053415;
	bh=Yz2WKEs5JKzMFngVQWLTNZ4WwJlmpb/O/oE0G1GqrIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uBv9TR/ETEp7HCpzqyoseNb7rbm0S+HFDcwnB3a4QkiGRv8O+QTTynNDWYhbKsKMk
	 CWBtyfNUhD7Yu9/5jVbdKjyicC4u4yzDC7WouyQFladI30nK+a4oBiYXCDjPK7IvSE
	 lnPwjLrCIpAscRMzk10mUlN/QnUtyipkVoRtAPgZ++TCL+LisGNtRYxg2tWlc3Aipa
	 ANImvR9OaPdxKvJSPVga2wEkJdyC+YDlEKezP8s/lY1hB5RZRydqVFQJgISB+mUUTG
	 Ztg8HRaLD7EcskQhBwjvQpnpZkz+wbiELnAh02cUDb32LX+5t+tjexNKV/cqESHW4m
	 EGTe8XtVAHDWQ==
Date: Fri, 4 Oct 2024 15:50:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Advait Dhamorikar <advaitdhamorikar@gmail.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.orgs, skhan@linuxfoundation.org,
	anupnewsmail@gmail.com
Subject: Re: [PATCH] Fix unsigned int compared against 0
Message-ID: <1bae2b5e-b9fb-4c21-9364-452f9a6a6daa@sirena.org.uk>
References: <20241004141046.61265-1-advaitdhamorikar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+8tEJtJ8YA5fPvdg"
Content-Disposition: inline
In-Reply-To: <20241004141046.61265-1-advaitdhamorikar@gmail.com>
X-Cookie: A bachelor is an unaltared male.


--+8tEJtJ8YA5fPvdg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 04, 2024 at 07:40:46PM +0530, Advait Dhamorikar wrote:
> An unsigned value held by offset can never be
> negative, so this test will always evaluate
> the same way and is therefore redundant.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--+8tEJtJ8YA5fPvdg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcAAKEACgkQJNaLcl1U
h9DdYgf+KN0f/pQLCvoWXEiRjFWJWeIcRJ+8ruGF7J8U/FvqN/yzJkgJHVTjlMgm
Y84lmov8Qk9Is+k2Drdnvlve6xY7hoFc56wCvGnh8PMAq48hGedzqddaNJAyAwMR
seXLfPO/oFjl42ba3e19je68Ws8NyKTEq6OXOoCvqgix72JEUUpVwHiylnb5BC/X
Fsn0v3dbbojM82yinMH+VHCdI+cpJvEkD5hK5E5QJtvGTDnaPH81xaWjzsfYEZaW
yLAI6KvAupIoab1WHHXWB5eZU/08bSULLxpTMtQNgen5fDwz6s9TEkmkIiSaoOop
N4gNlPBFiEhYGOcYXTxxJTCjKB45mg==
=NvRR
-----END PGP SIGNATURE-----

--+8tEJtJ8YA5fPvdg--
