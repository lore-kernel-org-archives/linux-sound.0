Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84301F3B93
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 14:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743776855; cv=none; b=Tec7iMQzgQVqN56Iqf5RTUAiF1dJhQfM4djXBEXaYVL4Eo05vpTL4mqa+pS65XZTHK3oRLaBeeMxytcm2FwAJA9lXqYU+IP3B17cdadQRRn0nhzxf251TW0uejv2TT+FnkpZ9vJQ3Jm2UNsC+0WBvcx9DUsSdEKzeoYCumRs/Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743776855; c=relaxed/simple;
	bh=UzJgl9BrCvsVvKvbs1dPm597JDK2ZfJrL48p4Vu43Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CenvYTNBQRcAEUYZux/lVawVWqNBtG40IX8JFph3A0qu709wVW8dawc2kjP5hMuAnLCIJ1SSiWIqOe9764ZZ59aMQR5OHFXsEHfAdr7Co14qqzNYhXBOUogAkIfbvK7XWJvatAjnvw1eboe3eK0vhOgaUFpn6kpJwwVD5zKbRCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YwUjdeDu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YwUjdeDu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DDA7C4CEDD;
	Fri,  4 Apr 2025 14:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743776854;
	bh=UzJgl9BrCvsVvKvbs1dPm597JDK2ZfJrL48p4Vu43Yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YwUjdeDu/tW10tGauZLolsdjAAv689/N7SYGSPbBEEVFCE8t+4QeIvTGGIxP7J9v/
	 0ujSdP5QAEjhozbd/V5XQkGl+aT+s7pzB3Wm22Eqf3L8yWCX+r52HFqB14DFaLL5mh
	 dRmMVT0V11lvksnudQ5hM/fHtkLvoD3a8scqkvXIE5XCVenjkdR63Fm1J+Z+tq3qDn
	 8VR5BA6r/+Ia3sGhBK7qJUgzoy+J/flGAh8ivRqbvikUfBkVCAbxgonbitFrbpP4ry
	 MskufU2WNpvs7sz804lx+hBiSSp/puSTmdpeJfriJzM/4W9UbkONInH/oJQeJMa6LX
	 PMjFgnMMmEkeA==
Date: Fri, 4 Apr 2025 15:27:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH 2/8] ALSA: hda: Allow for 16 channels configuration
Message-ID: <2d90f263-ab3b-4e6d-b8b8-03e03a15ced0@sirena.org.uk>
References: <20250404090337.3564117-1-cezary.rojewski@intel.com>
 <20250404090337.3564117-3-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZMUv4rJBVNWxRFLV"
Content-Disposition: inline
In-Reply-To: <20250404090337.3564117-3-cezary.rojewski@intel.com>
X-Cookie: You will soon forget this.


--ZMUv4rJBVNWxRFLV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 04, 2025 at 11:03:31AM +0200, Cezary Rojewski wrote:
> As per HDAudio specification, up to 16 channels are supported. Reflect
> that in the code.

Takashi, is this OK to merge via ASoC?

--ZMUv4rJBVNWxRFLV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfv7FEACgkQJNaLcl1U
h9AQEwf/e8O61eNgXkYhbpylpyiMIAVCcn4Z8cbHj/J3RAoj3MtW3egzOJDEGTKZ
+6Al/MBCPejthFiiGvHLmc6UQ7bkRhKQzptDFSG10pdDBnZwTKIbrDN2zsI5xGxz
CChH40eOQf6Kk+5462i06vwIDIU5FQ0li1Eqks6QkEmTlpKVy4vQ2eJbpmp4dwTZ
S+dPAX9qaYI7MZGidJC8BoPbgRKCh2qudV62owFgn+GgJIqebw0N/VhAVAg3J7qX
RCX/N+FiW8sgNcohgNmszKKZsmKEH0AXLyQWwzibx60x+cgsaQorp4WJGPIoDf0b
NeghG5EFKj9Z333PjI84uH6cO08kVQ==
=X3xn
-----END PGP SIGNATURE-----

--ZMUv4rJBVNWxRFLV--
