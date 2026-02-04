Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38FE31578B
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 12:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770208745; cv=none; b=b4CKn4jFCWjDdNEvs/cnNZCmLwGvzjEd4U8vCPXEkQqX14Y7Rqkq2hGHOhKqk85RWEjVs/78cqRCkLpdBobIBUHpk4ptMTjjcx97QJDhYp0gMD9ZoTAOMceXtgiExlSg7QQyHERMMB2bAX3ds/EVH0X+HWi6aqLlViYhQlDRh1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770208745; c=relaxed/simple;
	bh=cCfHT8Jbr52RE89K6Eh+M+2Kk+MzFklSQTNo5RfCRBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJ1zQhgaO2MF2zdQawqk/EPV06HBjNJGtlir1s0qsE8gmVMLE3keInaIzvM03ay4fLWpgpXhSndp7E4QWW7Htpz04BKTD/enfzKVxc0tP291+HsYKsrg1QTPvSLonB+i1QxD8u/KUgUgy/BiLODf+MTPzly8xoSgPrFuWVnVpmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CCMGfDTy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CCMGfDTy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE723C4CEF7;
	Wed,  4 Feb 2026 12:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770208745;
	bh=cCfHT8Jbr52RE89K6Eh+M+2Kk+MzFklSQTNo5RfCRBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CCMGfDTyWbbtekIw1KKAA+uwdBDwSOvqb0T1tfrchrpiPa0ubPlw1+XqEdoyleC7d
	 4OU6rtSl4rDp63nl5iOI7t3EOJfugG/AEiPsJPtFK3eJJECMvDM6ZC5uJ5wd4qR6Wc
	 o8hlvGY1VZ1IOJ1VDFGduqwxSDpPowCDFvf8rviR9Xa/M9rXIbOQBA0J2oVhx8wdeP
	 dxJVI8Zz/wC0OvIWboUJ5NbBQp9eCQGQx5LiGukBG5wp13g3JosDIefbZwsVYBE+cE
	 DMXKkEgbcTyFLfPq3Na9VFoX5jLAHdl68r5aWHJ6zst7zvsuen8EZphv5xgnjLfFzb
	 23ynAsDRrJb5A==
Date: Wed, 4 Feb 2026 12:39:01 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Linux-ALSA <linux-sound@vger.kernel.org>,
	Lars-Peter <lars@metafoo.de>
Subject: Re: ASoC: soc-pcm2.c ?
Message-ID: <1d1428bb-e49d-4d8d-8016-b637e1ad79a1@sirena.org.uk>
References: <87pl6wub81.wl-kuninori.morimoto.gx@renesas.com>
 <5bf2a9bc-6b38-4d75-9f97-be9b65b09d21@linux.intel.com>
 <f9cfdd9c-3299-4231-8d1f-d014da49700f@sirena.org.uk>
 <235a8a0a-eb3a-4dba-adce-98f9f214976e@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MHEHv77+Ht1NPfmq"
Content-Disposition: inline
In-Reply-To: <235a8a0a-eb3a-4dba-adce-98f9f214976e@linux.intel.com>
X-Cookie: Are you having fun yet?


--MHEHv77+Ht1NPfmq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 04, 2026 at 12:18:13PM +0200, P=E9ter Ujfalusi wrote:
> On 03/02/2026 18:18, Mark Brown wrote:
> > On Tue, Feb 03, 2026 at 09:45:50AM +0200, P=E9ter Ujfalusi wrote:

> >> I'm not sure if I read this right, but the proposal is to create a
> >> parallel and incompatible susbsystem?
> >> How would existing codec drivers be used in there?
> >> The promise of ASoC is that an OEM could pick any SoC and wire it up
> >> with any codec and that will 'just work'.

> > AIUI the idea is to only rework the SoC side.

> Up to DAI, including DSPs?
> SoC side is in simplest term is platform (DMA) + DAI, when it becomes
> more interesting/challenging is when you have platform (DMA) + DSP + DAI
> on the SoC side - and then another DSP on the codec side.

Yes, the problem with the SoC side is that it only really copes with a
simple DMA/DAI combo and struggles with anything like DSPs.

> > We'd have to work out some way to flip the switch for ACPI systems at
> > some point, I guess there it'd be either a command line parameter or a
> > build option (which we'd probably end up with at some point for DT
> > systems once things are more ready).

> My concern is more of a parallel and incompatible ecosystem which might
> force duplicated drivers. This is what is not clear and could cripple
> the benefit of ASoC and we are back in sort of pre ASoC tightly
> integrated world.

I agree it's not ideal, but my expectation is that it's just the SoC
side which is already like that.  The flip side of the concern is that
we've had these ideas for more than a decade and not made much progress
on them, and whenever there's work on DPCM it's been fairly difficult
and error prone with all the different platforms which doesn't bode well
for trying to do in place refactoring.

--MHEHv77+Ht1NPfmq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmDPeUACgkQJNaLcl1U
h9A2Iwf8Dd9HOraZshIBEwjIQrP7jCbnKBuwX6xgc67169tzGJynzxCQSIHBhGd+
gfGn7QoDegwga3bhyTTeofqLByrsKAzJyT4eBkc+miuFNYKzNxcZhChd2JymuSjq
/RCD9ucUV58EIEa5Sic/vzUCBdiBWRbG9XiZjOiaeqMF8Ysnz2a7DbSelwDTfIsv
Vh66B9UfM/PyeClCRNvJlmrRrMak1OPVCU22Bhmbwsnv0i70BDADTYAP9jacmyIG
0Vo8gxrcAHX3C9F/xZPhTNToNWahWLKDskNXBb6maq/p9XGEI+LRxXYRuYqXKncF
y6zSJW+8adcQhle6J5Eo97ITfYEXzg==
=2g/5
-----END PGP SIGNATURE-----

--MHEHv77+Ht1NPfmq--
