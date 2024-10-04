Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96F93D97F;
	Fri,  4 Oct 2024 06:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728024517; cv=none; b=fLMPv8j/7QBi1drKBfN9Ub1ksHOXC8HEg4rNQamsx16N5wvSj1RMBuYUD1V2Rut/Asx8GLcFbKjSEEp9mYzCROqQ02Oy5W+QLtw6ZBCOexs3XV4KNEOhbrtdHSRbJLqOQeB2VpFJEDrCfxMqgKJyFuoGJs3NiC2retMNSPgX/zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728024517; c=relaxed/simple;
	bh=vCBFmwrwEM2IvMCGAvBLAn1VRX2l5WyxHG1L61LQmt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SdUk4szYC2V7fj/kyZdmKdpDVvNeD75xH1tyabszq9sP/FiRwRk2Dr3jJJPqhzRf2p+Y7T8I7aVtgaeltLhucn9u3Ss1DSCrwo6okngPbK2YbDbMXAwGvXzN9vpZ+jNxG/XbcZ+LSPfFngXEzF1gxvN6db5pX4HAYr0vc0EGGT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k0humdPx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k0humdPx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CDDAC4CEC6;
	Fri,  4 Oct 2024 06:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728024517;
	bh=vCBFmwrwEM2IvMCGAvBLAn1VRX2l5WyxHG1L61LQmt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k0humdPxRvytD7mZEhX5AyjV/Z97RFJYmH2tEBfootMIcuK8Y/R9oXfPIsDlZexKK
	 36xgkxH6/glxgMVqJHfJNjZNMoN7vbinKgPRpTKb0CJoWsQSrf48mT15gPEVAh13hI
	 a97Ipsp4BAjVo3UZst5WQEQON8yGSe9dtSrcexDcvPqHVhkJd1wngojnQCm0rDVBJs
	 MHxOMNBMNLq2eSHwK42m3RZ1A30Ks2I7LXVZkhIJDVO8uy2fgP5Ddmlofy1TXmWCXf
	 E0DKGjmjYB2L7GKoin2ungllImHj8FjtF5cLTi+HWiHxUMsuhvcr+HAasmeNROABTM
	 gGxS+PL9SIU3Q==
Date: Fri, 4 Oct 2024 08:48:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jayesh Choudhary <j-choudhary@ti.com>, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ASoC: dt-bindings: davinci-mcasp: Fix interrupt
 properties
Message-ID: <zhxowgwhddl6ywhnbhts6bgzfcwrb3zxrpqxqtjghg3s56u5ps@kw2hbogcm2nh>
References: <20241003083611.461894-1-miquel.raynal@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241003083611.461894-1-miquel.raynal@bootlin.com>

On Thu, Oct 03, 2024 at 10:36:11AM +0200, Miquel Raynal wrote:
> Combinations of "tx" alone, "rx" alone and "tx", "rx" together are
> supposedly valid (see link below), which is not the case today as "rx"
> alone is not accepted by the current binding.
>=20
> Let's rework the two interrupt properties to expose all correct
> possibilities.
>=20
> Cc: P=C3=A9ter Ujfalusi <peter.ujfalusi@gmail.com>
> Link: https://lore.kernel.org/linux-sound/20241003102552.2c11840e@xps-13/=
T/#m277fce1d49c50d94e071f7890aed472fa2c64052
> Fixes: 8be90641a0bb ("ASoC: dt-bindings: davinci-mcasp: convert McASP bin=
dings to yaml schema")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

