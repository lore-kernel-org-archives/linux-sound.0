Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD297374CB;
	Wed,  2 Oct 2024 06:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727850888; cv=none; b=XZkPCYD4YoYlIDZ1zzO2kF5cH9gkQk6wP9pG7hWXD4iTuVSuRW7bcWmQq8JUw19ZLgckdRNmNmH7ApmpLFovxp0yh2xpEU2JldSw0xbzoICTs58Ek8cesJm6ADNc+P2STLscFmiC4w6SjpDu4g9rtM6yFUoGoh2jPDG3ZqqUFcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727850888; c=relaxed/simple;
	bh=kZactbzkGLvIf55iTrfvDZUTnZYhhrM6fam3OYt5M60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qKhs0VK6BPJ+wBrXklXVIKS+rdjPAD5CavXidURNEjq4yigqJNIMpb7qvkSVnbunvkudi5o4xNDYdRSice22tmSXGiK5LuLY7WFvvUvWByV3i1EH2dMLNHJaMOoJAetz+s/1GMnC1LPWZ/RrJNUO2/5yDPuGRFiL3tMGtYymdM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BGhF7yqn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BGhF7yqn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41DF4C4CEC5;
	Wed,  2 Oct 2024 06:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727850888;
	bh=kZactbzkGLvIf55iTrfvDZUTnZYhhrM6fam3OYt5M60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BGhF7yqnJ4N9URaNogLV1xTP6Ja1d18GsaE0NpThtLb8t9SFOuHx36Dch+NIbarDP
	 EVLW1+APOzu3H6q1BoSxDpYHTV1IwhNYWielXKWvEdML3iJx7WpxVRfeqaMAqKgRiK
	 Pejze5Jh9FGCkyWBpLRM1+7VtNH6zwD7YgjCxWpXKI5euN06grBQ7M+PRSB2lhhb9s
	 bV6wbY02W9yMe5jgAUTfyrUbfDxT1x/8Zr9slkTP0RAZdahmcvvKEHev44I73W2rzR
	 a4YNunCY9i4botDsNVMtKjNyk8LA0kcOTHYbMjibXYeQXsgjyA/9DS7WwmlLhQU0oM
	 SORzAASIKqJxg==
Date: Wed, 2 Oct 2024 08:34:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jayesh Choudhary <j-choudhary@ti.com>, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ASoC: dt-bindings: davinci-mcasp: Fix interrupts property
Message-ID: <7f5wtbnn32l6l76z2yjjfponrysr55yi7hgfmtdegilg7dcc4h@pkupvwap4up4>
References: <20241001204749.390054-1-miquel.raynal@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241001204749.390054-1-miquel.raynal@bootlin.com>

On Tue, Oct 01, 2024 at 10:47:49PM +0200, Miquel Raynal wrote:
> My understanding of the interrupts property is that it can either be:
> 1/ - TX
> 2/ - TX
>    - RX
> 3/ - Common/combined.
> 
> There are very little chances that either:
>    - TX
>    - Common/combined
> or even
>    - TX
>    - RX
>    - Common/combined
> could be a thing.
> 
> Looking at the interrupt-names definition (which uses oneOf instead of
> anyOf), it makes indeed little sense to use anyOf in the interrupts
> definition. I believe this is just a mistake, hence let's fix it.
> 
> Fixes: 8be90641a0bb ("ASoC: dt-bindings: davinci-mcasp: convert McASP bindings to yaml schema")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> ---
>  .../devicetree/bindings/sound/davinci-mcasp-audio.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> index 7735e08d35ba..ab3206ffa4af 100644
> --- a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> +++ b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> @@ -102,7 +102,7 @@ properties:
>      default: 2
>  
>    interrupts:
> -    anyOf:
> +    oneOf:


You need to change interrupt-names as well.

Best regards,
Krzysztof

