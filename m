Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C980F3B774F;
	Mon,  8 Jun 2026 09:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780912758; cv=none; b=brgsWoFJ9MC+VfNY7kVGhsklnEBS5/hAY5xh7593H/mRgFsd6OJ3W8sblHSs01cpy9cRh8Rc6xT40teSIqsgQYvK+h2DZgktzw2th09C5q3XVbaw+mFL/FIRdp/WwiZdFlK5rgR7LdZv6tmoAzzz0dc+vaauyp3yIuZv5lTq3do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780912758; c=relaxed/simple;
	bh=Qd6pVaZX5XJ1Dzk8urOBQgT0feswMcaDf+DzVn6qe6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WiJkiRap7dGRfctuGPezxd7/3jrKowOiCj4mIPknVYqRmTZPth8iY/RCcD823/HrRo9hh4ZLDmkOcGpPWjRokhYorXz18BS9Q1J9Je6rihp+f6FZ1ESov5cW5/NpVnuPhbNwdKDfx22CbLQ/4NU7z5hvZAiEGutDQJhJoEeWdYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WKYK0YX8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WKYK0YX8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E2D1F00893;
	Mon,  8 Jun 2026 09:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780912757;
	bh=rd72SiUVdK8YvF4c4RhaR8WHAjU+LxVMWO4iwBCGpu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WKYK0YX889VaT++bAVBMmbzJmNionovkJ6AN1f7VC9LwzqxU0wKtaKdxl1O0yTaIv
	 IuXrwLljBZogWrLkt0tjLL4ZLO67sl75nHyh5cHHceeDQU94HpRzgb1dslNAtuZLK9
	 cXV5sV19zc5H/nDBJIMK7wfhh5vfeGlvN08bvhfXGVappLeKBilwLSE1acCzMK2UT4
	 QvKZAyEyZqpKQArnxN9wURPKE9xogWsjg6D9kOvuqkzLPez8KOPQjMWPLNk+SIsogK
	 gGdOdQ6BYBRBJ2Yd2CsKBa9+iamTLPjnuXp8wyH9DTzBDSTcxavXRnpX08uHNEECrl
	 fEAfIkZhMjZ2Q==
Date: Mon, 8 Jun 2026 11:59:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais:
 Document DAI subnode
Message-ID: <20260608-energetic-curly-marmoset-ee6fb8@quoll>
References: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608023011.942228-2-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608023011.942228-2-mohammad.rafi.shaik@oss.qualcomm.com>

On Mon, Jun 08, 2026 at 08:00:09AM +0530, Mohammad Rafi Shaik wrote:
> +      clocks:
> +        minItems: 1
> +        items:
> +          - description: MI2S master clock
> +          - description: MI2S bit clock
> +          - description: MI2S external bit clock
> +
> +      clock-names:
> +        minItems: 1
> +        items:
> +          - const: mclk
> +          - const: bclk
> +          - const: eclk
> +
> +    dependencies:
> +      clocks: [ clock-names ]

This you can keep

> +      clock-names: [ clocks ]

But this is not needed, core handles it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

