Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BAE1CDA2E
	for <linux-sound@vger.kernel.org>; Thu, 22 Aug 2024 16:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724345480; cv=none; b=dzF75pkWKk89GYXw8RhHvMDCw5qEXGFep/y66NGFHWlIQUiMSeCX+Tq8fRA47GRKKpKs3cBtrQmVLOMfVapBPednKSOBOUvDbQ77fC08Eu6bf4RYpBuuuExTrceE8TbjpHwGjcyUwPfiuQDUXx4nFbthArIIJ6xLgaWs4PoT8IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724345480; c=relaxed/simple;
	bh=zCL8BOiSor2S8krSkSQzSMg+Yl4KUmp/Mikep+pQtUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ct/rOEXbPGfidxYPeoDK4Db3EDfi6gJsXzMWGkdldGzl0e3mZ2J1BDfYYFPNDVfgB80ciT0p0H3ZL7dfCQZt4qWf+spGOKfPpQ32Z3Nyq4lnywGj+nSHrYGnopxsVosbkId0mw3qTvR2om/RYSMGGi8sB9Gm0TzYLXk2R5AT4Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kLxVX1/v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kLxVX1/v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA897C4AF0B;
	Thu, 22 Aug 2024 16:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724345480;
	bh=zCL8BOiSor2S8krSkSQzSMg+Yl4KUmp/Mikep+pQtUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kLxVX1/vRZz/4rqoFjsDSvYl8RsXq96QiCjjD9XZUXZo/In85No6he3E+9oP06x6F
	 se4YOv3BJ/05XmDOJpH3AIZZmw94qpo/Xhh3DB1csE/72LUWu4NAxS1gFyTkDdZ8kW
	 m42koYM3qlU7yLMOSda6htbXZgasyk7cspvl6hXx8Z98ZuqQrtSHovwYMXp48QgSAI
	 nmz0CxC6lLcQBq6/Mb7t6ZsmepYqKoDTe0Ldzm6QOWUJ5XJW6HbTyRWHJke6UbPtrz
	 tuS/7uP7ISDLoZh2nose8/9GVjkRFkKAU0iiwmMN2MoqsgfYopWQ0gh2nToSRZp2Ih
	 JDfSya0EHs1oQ==
Date: Thu, 22 Aug 2024 17:51:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com
Subject: Re: [PATCH] [RFC] ASoC: Conditional PCM support
Message-ID: <ZsdshATQbagl5x-x@finisterre.sirena.org.uk>
References: <20240821101816.1494541-1-cezary.rojewski@intel.com>
 <83f81553-6dfa-46a3-9ca2-d42f54295eb1@linux.intel.com>
 <d5db8a15-64c9-45be-8f8c-977fd5ed282b@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1//dFWn0m5G98Ntw"
Content-Disposition: inline
In-Reply-To: <d5db8a15-64c9-45be-8f8c-977fd5ed282b@intel.com>
X-Cookie: Your love life will be... interesting.


--1//dFWn0m5G98Ntw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 22, 2024 at 03:57:22PM +0200, Cezary Rojewski wrote:
> On 2024-08-21 2:43 PM, Pierre-Louis Bossart wrote:

> > The point about dependencies between capture/playback usages is
> > certainly valid, and we've faced it multiple times for SOF - and even
> > before in the mobile phone days. I am not convinced however that the
> > graph management suggested here solves the well-known DPCM routing
> > problems? See notes in no specific order below.

> While at it, do we (Mark perhaps?) have some kind of a list with major
> problems troubling ASoC? I keep seeing "DPCM is problematic" on the
> mailing-list. If DPCM is indeed in such bad state, perhaps we should address
> this sooner rather than later.

Honestly I think DPCM is the only major problem we've got.  The problem
is that addressing it is very non-trivial, we've had a rough design for
what we want to do for about a decade (look for some of Lars-Peter's ELC
presentations for some summaries) but what we're missing is someone with
the required combination of time and enthusiasm to actually implement
it.  A lot of the refactorings that Morimoto-san has been doing which
move everything to be a component rather than distinct CODEC, CPU or
platform types has been preparatory to the main refactoring.

--1//dFWn0m5G98Ntw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbHbIQACgkQJNaLcl1U
h9APRwf/aFPJucbWjf/SZvqRf3Ve0/qKoi4XbIuSlNg7yRapIByAwfLNdp8q2unc
zofsQT/GXQ+52+J+a1dS3MYpbJycIBshgCjO6hJxPPNbB+Jv8V31JGKgdIbAvsqn
AYRDZj7sovpxDhcG1tFx7324pILM4duKfQ7SvLVkh6WXvV69YEGzfaHjjbo1KEC/
p8lUOSCJ9Q1FNtuL/auA6lML8ISYGXtxpsmklBHep7B0I3Xs/egVE2TOsUH1KrGk
dQspA5MtfaJ+g2d/D8SypbIT1/2eQJr623DaFAPS6ynwhRo/kuru5h/fy9sB8qNB
tjHjXnfyw3MQRsqj0azCkVzQipDkDQ==
=EvG7
-----END PGP SIGNATURE-----

--1//dFWn0m5G98Ntw--
