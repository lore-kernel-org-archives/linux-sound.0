Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E182F215F7D
	for <linux-sound@vger.kernel.org>; Fri, 26 Sep 2025 15:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758901010; cv=none; b=eDzpU9TBM6aowIDlDzCkDzoMECQupceNr9hUwRNvMcPYYTqN7EEz61AsywN6JpJzkR4lN328viJtSkxkuYxfExRizFVbWlJ8M93bgMcMGu7JX7MLbJuAxX2Gkv02Svtp7fO9lk1/+uXgzKBd7RgJslwvWBb/pt2sfgUWEfhKXe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758901010; c=relaxed/simple;
	bh=KoiUbmXi/sfd8S2kNOTwnDjKBbTu4UDV/gsmXP3EMxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=towHDiERhFeBzXC+xHoxZMTgE7sMro/FeVbol7x4uJdwnVwSC4Hs4mRtlfUhh2eMRCNg+RZKSCMGIv//PRXS7N0pOL+uS7p5vJiaqiFXzylJrzmpGF3AEabIwXhTZFnOSUBklCnFZ5kzH5JSCGuFBx7EPdt0njSk/mxcvQSqe9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LqnjXH1s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LqnjXH1s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F1CC4CEF4;
	Fri, 26 Sep 2025 15:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758901009;
	bh=KoiUbmXi/sfd8S2kNOTwnDjKBbTu4UDV/gsmXP3EMxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LqnjXH1sTj/UNLXjdkgnSM/o1yIKpDHjEVzws7I9FsHyXVk/gKcPJFRpgx3ZHu1AY
	 73DI0G0OciZM22bgKx4v3BtgPC0hh2tInC23rbcjfychIQRDTUWSEdVqpyb8vyq8Dw
	 y+FKDT3MSxy2fBP5FXfjNewgk4VsEGAtRak5xZFF8xgs0wFujBKS86Qe2agrDJv6Mc
	 NPp6fUVc8msqOn8rHHXdC45KG8Bxz/N/Yi9pcK6TQ8kLhfavstt0C1zMZrg6+VnvCY
	 zWzS3R+TgB7iIRHydB1yg/bcRAxjlTm0NVpoS5Wjxs+FqCxDR1aVJ9NGclwV0aOuXE
	 1LabwgmPMIKng==
Date: Fri, 26 Sep 2025 16:36:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [RFC][PATCH 0/3] ASoC: use snd_kcontrol_chip() instead of
 snd_soc_kcontrol_component()
Message-ID: <99a56e97-4f56-489a-8c16-424f97a29575@sirena.org.uk>
References: <87ms6jz47x.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4tODIeI/Y1pWp2w1"
Content-Disposition: inline
In-Reply-To: <87ms6jz47x.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Your canceled check is your receipt.


--4tODIeI/Y1pWp2w1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 25, 2025 at 01:54:42AM +0000, Kuninori Morimoto wrote:

> I would like to post cleanup (A). Patch itself is very simple but it will
> be very huge patch-set.
> To avoid patch-bomb, I will post some of them as sample for reviewing.
> If there was no objection, I will post full-patch-set after merge window.

This seems good to me, most of the examples look neater than the current
code.

--4tODIeI/Y1pWp2w1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjWsw0ACgkQJNaLcl1U
h9BvFwf/eZIIzQTmVFAkT119NUT+KR3sK0S/JOxfWE0NNCAp3Xdxc3bw29SF2Shj
iBT6l+Zwt1YZQUgTqifTv4YrBUARuL/y/RkkgkLBrnL//3VjVxzCxRZUsFh+6Kxd
a3lJc2Ytn+dCp2JImlFm3xbTvc+wtwjeN2nbwRvccZqiN0XgZACjN60EYRLJyL06
iuNxpHTq6Ybas5+QGHRyX5K6KNmaXPZB/jsgrjw3ey0W98iFrKLsIlsSmah5DyfS
iUb6HqpV0h8jjeHQ2vU/b1XxirscsUTsPg8/2X/d1pU9DtG1+T1WMdHS+CVfjNn1
Z/BpiHr3nKhm7dSux5xzzYlea50VYg==
=zv8s
-----END PGP SIGNATURE-----

--4tODIeI/Y1pWp2w1--
