Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5260A1BC3F
	for <linux-sound@vger.kernel.org>; Thu, 26 Jun 2025 12:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750939501; cv=none; b=WB/RSvv8lkLAUbSVzOsFspjDXLN+3P/fdrGcA4IOt2Qq0au4i0kFwjdKY1kgjK5uB+Fw8aXBKAg7BTYTZzlDX0qcLDY9L56TdXOXdcPOFBlMxDlfCRgpZwpeMk+mTA2ZDC5qYKYXIcQpRVHh96L1AKZJSFO4pfxot/We5bN8NK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750939501; c=relaxed/simple;
	bh=vGRqJkbHfhzMNtSIx3DcGDNhKaR8+RmiY/ZcIdtivis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ImbLItC4XPrKHu0RshMzeQTguMYC+1Ts+FQEs8p2HRy1LtnHflpWoXI9OR3sb7L4/kfCVKu/zImg0nZjigmnfJ0SoqTMv4fk2pZX8Opkl3bQfAgEtbUImuwz5AjA0q3qGRLpBrug+2r1YKHuI7pU3HkenUmSxhOCUKV0gA+YZsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALosoMGR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALosoMGR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 614C7C4CEEB;
	Thu, 26 Jun 2025 12:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750939500;
	bh=vGRqJkbHfhzMNtSIx3DcGDNhKaR8+RmiY/ZcIdtivis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ALosoMGRyvHVG0zZ5jIYA21+DuHMpNRtCfa8GO6fR00Pqv3rynRaaQ7LdH4zvXwpJ
	 TRuxMngTyxxkLPBcWoy6eb/dNIZ9KUXgvSQ/kOV2A1nLuAPPfS5P3NRfd/uTGxy5li
	 VDhTIcBEBpp2T/VVSCR/0D4+0smlppODAooDJMut/RqqUWQDx4oDxnzgAXqDOxX0zV
	 GJLe/pl0I9CBDezLlZ5PoJrdPqq0noK2VmN3l6uifpYvLkLPqY2691piUsuiSYO7Sq
	 nxwiRnI2Wh4vkFcGPbAgGj2bD5j9cxS/lGo+dmnU7QxMYVCdVTqL8/6k4pg8HsRJPi
	 BMR4YmbyQUyFA==
Date: Thu, 26 Jun 2025 13:04:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 04/11] ASoC: soc-dapm: remove snd_soc_dapm_weak_routes()
Message-ID: <aF03aZsk7bGk2oQh@finisterre.sirena.org.uk>
References: <87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com>
 <87sejn1ca9.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QX6rYE/mWozbA7WO"
Content-Disposition: inline
In-Reply-To: <87sejn1ca9.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Do not cut switchbacks.


--QX6rYE/mWozbA7WO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 26, 2025 at 02:12:30AM +0000, Kuninori Morimoto wrote:

> No one is using snd_soc_dapm_weak_routes(), let's remove it.

I'm vaugely surprised nobody added a phone that uses this...  I guess
not many phone machine drivers make it upstream.

> -	snd_soc_dapm_widget_for_each_sink_path(source, path) {
> -		if (path->sink == sink) {
> -			path->weak = 1;
> -			count++;
> -		}
> -	}

If we are going to delete this we should delete the whole functionality,
so the flag on the path and code that uses it should also go.

--QX6rYE/mWozbA7WO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhdN2YACgkQJNaLcl1U
h9CPaQf9FlHvPbDJQ8pgtnwcBNDqrBlxAGOeO2FuX2bCg/u/BHi3JBOQJFmrMiUW
dURNv9Eo88ciUVCZnJI8sGJfoyx3HOvXqN17kMxMzoKq9OEddwyarmwXEqU/0MkV
bFfwPLyRZQYolsdpYapusgqGCqXFsOEXMWodQJiqj28qWlvR6ymrPeOva4Ivq13k
izkXnQfVCFGCMh31nZbqSL+VRvu0QuRu0hlkbFlw2DINj5qCUg1ncwibUgb+PVp8
aZRGddiYg8ixuY/NGsuI3WStpmafRr2tS+By+L3gS3VcsurTWoWJY8ZUDkdzTczL
beDULXuz/6xi50DwfwbLr5+zOkPXIg==
=UyRN
-----END PGP SIGNATURE-----

--QX6rYE/mWozbA7WO--
