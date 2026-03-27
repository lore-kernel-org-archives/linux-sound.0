Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBFC3624A6;
	Fri, 27 Mar 2026 16:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774630326; cv=none; b=ACWQ85KhxqEkKItK18QoRVnaryZg9+AGape7O5uW1zWaK9RxBlYIcKHYF+lz8QEHQiAG0UIUj4tdM1rNQ+d7UMiVQbxORnyD5Rr/LQx3xogkhHRIrjeTF8NbLTnVReOmEMQ5f62URjwVy5hPAOj+ybtIMK0PVX8Xz+iIuFoVRQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774630326; c=relaxed/simple;
	bh=4GjB0d5rfB+aUyCSr6L7WqYQtyigK8QCGHxX5vpTwPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VzCJfca957L7txdofcrRDDj4XV0cPQjTlwJyy8bNDisntsi0Pud2Mp0nuYPvh+GURGL5qVTMVLKtqRcZy9GNK4jXQFiAkKF9kI1OWC5cTiFh9Awu+cMhPnVAOdZeE6x/G0hj1YBDtfyk8uZcTIc8lhFodaHT/fF6O1Y77u1DHJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kUGcAE1L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kUGcAE1L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD09C19423;
	Fri, 27 Mar 2026 16:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774630325;
	bh=4GjB0d5rfB+aUyCSr6L7WqYQtyigK8QCGHxX5vpTwPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kUGcAE1LSPn3NhTIgj+2ZdOC0uuHw9RXP1sgnl2/qSvlIFg2dspBySDs17BWRCZmK
	 ixg0yOQPOUqZikMad9tBb80UnYSwdFRbu+Rg07r4T/9b2FFy5YLQ4IV+z9Vtmw/DJh
	 pUIdu+XPkfHTpSntLo1ASfmBowE5BbU9LXaZXNGLhIHVfM2JnsidsD6By9VZI98usw
	 +VnFlzkL7PYbzY/IPtjEW7MV6UV0QfMmpb2B5na6xedAcFEAtYkY5u+Se3m/ktAlwb
	 rHuCOMdcTycCQyulOloBPtAoVr7qg3Mr3HXWOQRKCTw40lxLuEX++d5arseZKXlD8J
	 7DcBk0QELr+6A==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id B6D491AC5731; Fri, 27 Mar 2026 16:52:01 +0000 (GMT)
Date: Fri, 27 Mar 2026 16:52:01 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Paul Olaru <paul.olaru@oss.nxp.com>,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] ASoC: SOF: Don't allow pointer operations on
 unconfigured streams
Message-ID: <aca1sW6ca1QJBN9V@sirena.co.uk>
References: <20260326-asoc-compress-tstamp-params-v1-1-3dc735b3d599@kernel.org>
 <3cd96fe7-4575-40f9-a1f2-610fb1fac5c1@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="53uCW/DUaT0Hdwke"
Content-Disposition: inline
In-Reply-To: <3cd96fe7-4575-40f9-a1f2-610fb1fac5c1@linux.intel.com>
X-Cookie: Identify your visitor.


--53uCW/DUaT0Hdwke
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 11:49:41AM +0200, P=E9ter Ujfalusi wrote:
> On 26/03/2026 16:52, Mark Brown wrote:

> > +	if (!sstream->channels || !sstream->sample_container_bytes)
> > +		return -EBUSY;
> > +

> Is this a theoretical fix?
> I don't think this can happen in real world as set_params would need to
> fail and if that failed then applications would not ask for a pointer as
> the compress stream cannot be even started.

Yes, it's not something that would happen in the real world with a non
buggy (or hostile) userspace.  Still, we shouldn't leave this stuff
open.

--53uCW/DUaT0Hdwke
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnGtbAACgkQJNaLcl1U
h9C7zwf8C2xOVPB9+xX34A5NFFpQDM2Ulx5IGmD0V4g42YrXuq6rb03GUwllo0AA
NTKFUlsgz8HuvX9l9zQm/nUJH6NhBBbsX0uOFOa3402+1Q8EZYXIQTjdOacTMRA4
yWkTScUVPFMJSVmMiat+T/fWwTU+OdIDlnjgiPa2HxyGWWr2CmL3AU3r1k/BwlaG
9UxLuV6vK78940Ha+RD9+TnGSzu1HwjNYNgJ0f8cJ11EDz2wGw+A9ldH3EmzJ4vI
tm4sPdlCbu4Qunb+pic1ILPJHGYVGkuCxCaqc7HgsNU60/ezFojLVdrrry6Y8LVY
KcruSQV/dl4pGgrz69LTLPQV+7oc0w==
=ZLlh
-----END PGP SIGNATURE-----

--53uCW/DUaT0Hdwke--
