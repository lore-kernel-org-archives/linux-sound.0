Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37794657EA;
	Fri, 14 Aug 2026 12:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786711189; cv=none; b=M1gckuEzJrdFzp2xWszHjz5j/scrlfJCsDoPvPuczoG43ps7eQaDB25XChmcqgCIt4khaxgen3TGerp9c42KisQgqcW26a63sh0SbM3u+RmSocDcQAnhnXzr1YvplLDsCyjT0dNSWiyj3kezD29t07UMQsDCAWbYjCFSZsZ3WSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786711189; c=relaxed/simple;
	bh=DZA3FpFzhlFQ/5ZEMjKtMG2AXF2NDCYB9IHdiW1LTDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KoloBXTqbD8qGIxdvpIGAfZUwmKzTLk6UbLqtuziu1mvgPRPkg3tqznBiSufPrjoX2jsfimkyuP4rd58qRWiUToSLKuDROB7LAOrKLU44QSERcFUL46mNs9qo8xGsLZWFhDHw4fma5qO7t50y/kHS0R0aQ3m8Xfyd7p+aCV9C4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RGm5wsIJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RGm5wsIJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D1A1F000E9;
	Fri, 14 Aug 2026 12:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786711185;
	bh=DZA3FpFzhlFQ/5ZEMjKtMG2AXF2NDCYB9IHdiW1LTDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RGm5wsIJ2XEhQm2+O8o5QJu+/PzcnhYddldDK/rIpf9b/fEeq06Yd9sV3gKH2xvIb
	 JnQ3Zh5CTE7NoGEUBhmQ+tF2WDWPLw+CKHKIqLi+E4dULARiD0LOBePAgHnIsarmGC
	 KS+eWDMHk2kiM2UIRTyhWeqzvre3uPq84KoFXgnWSWvxZrYXzTqAjkIO0iOP5ZyXNG
	 VXPwl2dey+RS5jQVhcqs/KBOxVSJdlpWWuvTZL2bTiFsp0SQhFCpovXRM16K4wpqt/
	 y1s5LEo1SkyVzq5wWLCQWa6YRE/b/RLFnneYez1lLAr7fDaP6/x6l+9fXSuzVOUYyx
	 H/Ovf8+YJdaBw==
Date: Fri, 14 Aug 2026 13:39:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, tiwai@suse.de
Subject: Re: [PATCH v2] ASoC: cs35l56: Fix probe deadlock waiting for
 SoundWire enumeration
Message-ID: <39b2e7a2-f788-48ef-9de8-c96296aba890@sirena.org.uk>
References: <20260813173702.1534029-1-rf@opensource.cirrus.com>
 <de6bc0e9-bf97-4bd8-9e6d-7b2fd608dcc3@sirena.org.uk>
 <bf2e87e8-46b5-4733-9af4-c764fb8dc64f@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VDa6feIgNKf7H9OH"
Content-Disposition: inline
In-Reply-To: <bf2e87e8-46b5-4733-9af4-c764fb8dc64f@opensource.cirrus.com>
X-Cookie: Body by Nautilus, Brain by Mattel.


--VDa6feIgNKf7H9OH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 14, 2026 at 10:08:11AM +0100, Richard Fitzgerald wrote:
> On 13/08/2026 8:06 pm, Mark Brown wrote:

> > AFAICT we always try to limit the volume for these speakers?

> > I think the component registration needs to be moved out of probe into a
> > work item...

> That's the smallest code change, but can snd_soc_register_component()
> return -EPROBE_DEFER?

Not right now unless I'm forgetting something, though it's possible that
might change in the future.

--VDa6feIgNKf7H9OH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp/DIwACgkQJNaLcl1U
h9DdKQf+Jb2bOl5/i7lXMGyyEMe67eBUKB6BtRII5RTk6QaMPLd4Av6zYi4lEddR
uVWtfGD5H46l33gTij0PwHNG0vjDRdTY3GOtDz+tUmGF5WNco8zHmbaUEOp281/Q
KjyqsFO9+d3bncILAKwOXvkWFo3fSBidWKF2tRyna59QJc02Srb3Onqltk6zj0Y1
JXoxXGpmNtnfO70UgkPexmFYPUp8sL4FArnUvCko2q/+sIFRv2tdkYX94LQ2KsZu
Pa2lseSlpnT0HQbfxGPRu2ZP94K/zL2Vwv/1cmutYzhdDtW86tsgh9rAq5aaLXjk
csfKOQMJdU0Jn5xTJr+B7XCcoBE61Q==
=bWBX
-----END PGP SIGNATURE-----

--VDa6feIgNKf7H9OH--
