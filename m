Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CF0376A14;
	Fri, 10 Jul 2026 06:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783666158; cv=none; b=F9mSLGz9G10epRAHtQjhl/FjeqJWSM/JDxcmr/yfCzS/Dx/RMeP0pqQnEl+A8r/H+OCWNcf9CT4KgtFGcml2QhWDIdfOIWDKqgZTW/XYxtDMXXat1Hw0PXJ+U+2stBl6WJ2E5Ouhyxxz7kfeQ1EAVwTR1kOfm0DXrJNo+BWVACI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783666158; c=relaxed/simple;
	bh=vVr1uJDfuyoA1SvRFXbwTzWpg2eJMBPIhqnqJ7g7dWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4g5s0ZNbp/v8hxUOgl4wGWeYjE/V3i0IfKKgRlj/LqHBjS/lvyElGHSx/7JFKSQVEyarP1+/2GlbCdSdq3PHrWmOJXVHtA7MYyzBTZRLAzBQILZguMXtuDa0KJLQywC+1DiGkx1yThi3aaw+gEr3Gsc7AmKkqBN/LNsvYFUeQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JqOd6Avf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JqOd6Avf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108EE1F000E9;
	Fri, 10 Jul 2026 06:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783666156;
	bh=6oAdhzaAuRMYdEvKNDBaztOD5HPKtd1DAWVsV2R72yM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JqOd6AvfUNOVDcIHEFOKxGbHMhWK/M6gQLv2iqc7a/bGg9vKV1cGPMRAq5QHrPv7r
	 DFBpA1XvlaygWTEru4XKSpOyibfYI9VkCkwTICTrMMXWivUjivOjbxszishWYzNi9h
	 Ax35Lwk+al/KuwMMOc26/XpLO1A+Ccfga13iuxMcObFjyPyKspeKuilHSLOjtwLoHE
	 gYm9cOxIHAV+qjN2dOqQs6XbNzTh+wM+nbjUXKQ/3Rp1T21uGQyXEkkYKCXaIgJrL7
	 FIKnAIP7gs/OgXJP1Zz11qnWci32meZhtKlak3BwfkZ9Jze2ute70rRBaWg/Hbkv4t
	 LCLGkoIJxGlsA==
Date: Fri, 10 Jul 2026 08:49:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neo Chang <YLCHANG2@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, 
	robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org, neo.chang70@gmail.com, 
	kchsu0@nuvoton.com, sjlin0@nuvoton.com
Subject: Re: [PATCH v6 1/2] ASoC: dt-bindings: nuvoton,nau8360: Add NAU83G60
Message-ID: <20260710-fervent-squid-of-speed-b0d078@quoll>
References: <20260708093506.895481-1-YLCHANG2@nuvoton.com>
 <20260708093506.895481-2-YLCHANG2@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260708093506.895481-2-YLCHANG2@nuvoton.com>

On Wed, Jul 08, 2026 at 05:35:05PM +0800, Neo Chang wrote:
> Add device tree bindings documentation for the Nuvoton NAU83G60
> audio amplifier.
> 
> Signed-off-by: Neo Chang <YLCHANG2@nuvoton.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

