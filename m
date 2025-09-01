Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00A22DF129
	for <linux-sound@vger.kernel.org>; Mon,  1 Sep 2025 15:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756742323; cv=none; b=T8UvXZh6YAGF6lZQ1tL/cIsy3bpCVe1mfCXbfo1NCeGtQXdTSHT1X3RhoDfcTPTIEy4o3o6fabscLWR6XF6se5m5FNN3iIUi/CRTXclmwpPEW97LS16zhUxvkdJM8OfhIgCao4i29Hc6glZEhu1CrgyS1KufvibelL92y3YtSR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756742323; c=relaxed/simple;
	bh=OB9oCp1ChEwZiMSQavkRCyMvKR85ajHLR+G6tXdPsfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XIE9lAQChELntRuochRa/5q1p6TWG2HjooKCi59/0qm8ciyRQzzILkRYbtotRiYdAI0zi3N5MPVwglLRZLjlFyD2615KrSTZ1gWUyQcF/dQmpU2WZHE7uEkEFvAkc/OT34ExQxMZwGVPIEkG5bMF+EwcB+p0WC19tad3MD1WSDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nk8NkG3J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nk8NkG3J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46476C4CEF1;
	Mon,  1 Sep 2025 15:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756742322;
	bh=OB9oCp1ChEwZiMSQavkRCyMvKR85ajHLR+G6tXdPsfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nk8NkG3JSM/P5G5BXjEyQHEaoRgv1yIGFQ2afvV+2F2CWZqqBC6v/5WWdmAyn7OCG
	 dOx1zOLz3M2RMdWokZBnyvQNsUP/ua5sHKNG3PLhxqwJProOHvs49NVisXLzknF6dw
	 axlRXAivWj5vxbY33Wttu6kBo+ej2w1kVH9y89yy+7GBVXy5skhejPiACwmgOEKJoJ
	 VdaYRZzChtrBbEzxGmU1SW5kKfOqO9hlvsPak7w2I23gU4CerygsxEf3dLRyQFFuwG
	 MqGFuYKTHm3AUcde8Au81VqWw0XaTg7/nq2gXj+YBuU0nIgJHRH20GsGoIv3arkAS+
	 kohQZw20/hNBg==
Date: Mon, 1 Sep 2025 16:58:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Nathan Chancellor <nathan@kernel.org>, tiwai@suse.com, perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com, linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/5] ASoC: Intel: avs: Cleanup duplicate members
Message-ID: <cf58496e-99ca-4ea9-b4b1-5d3010b3744e@sirena.org.uk>
References: <20250827142229.869139-1-cezary.rojewski@intel.com>
 <20250827142229.869139-3-cezary.rojewski@intel.com>
 <20250829225532.GA400117@ax162>
 <fea2fed2-dfe8-425d-b03d-e0a49d62dce6@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lm7yfcpLTrgNAvvB"
Content-Disposition: inline
In-Reply-To: <fea2fed2-dfe8-425d-b03d-e0a49d62dce6@intel.com>
X-Cookie: Auction:


--lm7yfcpLTrgNAvvB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 01, 2025 at 05:42:39PM +0200, Cezary Rojewski wrote:

> I see two options here:
> a) revert this patchset and I'll simply sent a new, larger series
> b) no revert and I'm sending the rest (~15 patches) to linux-sound

> I believe Mark makes the call here, I'll follow up as required of me.

So long as it's sent promptly and doesn't take too long to review I
don't see any reason not to just do the second option, I'm assuming this
is already well tested internally and it was just the split that wasn't.

--lm7yfcpLTrgNAvvB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi1wq0ACgkQJNaLcl1U
h9B9Pwf/RnshB7WOZ4tPBWgoDSgnw2ydGPhG/C5Q5BZhTnfoXm3tVr7VkNHy6yfo
KRTm0ljnFvaNXarvCOvP0BCFaiElqk+Y97IaN5wxt69b9NxDGfhg7WN+uwmFChgU
+sp0BJogAyPslTQtu2qpI/rq92X7qiWbL6KiZu1NHSUO5/nsMbI/+NZXLb+fHyog
1JHKdLdzQXthvAGHMH8YqGa1yN1SrciR+wuIxSvLgxwjSju+p+IBZZOvSMCccD/N
GVUB5JyskYpyJmcI02nBxnyNeZ5OCn7izU5SZyU+I8xOJQ+oBtSzbxWC8PYU3j5A
7naB47551fzFW9AxWhYscRrgnsYPHQ==
=gdkj
-----END PGP SIGNATURE-----

--lm7yfcpLTrgNAvvB--
