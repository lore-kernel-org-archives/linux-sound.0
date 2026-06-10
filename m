Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6451898FB;
	Wed, 10 Jun 2026 06:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781073991; cv=none; b=L1O6i71hggVAfxjVnPjfXMZMX7wb8eq3RdDhd5ksEHMETFqo6pehzH02hkfPYEPW7O47JKpFQoYx2kRF/z6RpW7ZSQHXT6SEijkMjvuWppfTTz2bBQF1BUiCkLlFKHmdIXG7MSLDmac8b97388ULEqW2OYE0MFWLQfHM4p/pFzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781073991; c=relaxed/simple;
	bh=u7YOelhDPOkEe+ygseQFg3HIJ9G3EzeUC1EcSXKcsZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hav0Uf/zTQ1trNNWD9i/phj179Kj1Zxn9X5bNjY1sVwQS/Thyl7YH41ibdWdloLQd+CZxBYoI4i7y8Eddg2icQVF7EqvLtYCzOdtKZPdQd6yFjQ9AYDtxp1ltBOLqtvL4y7HTTkje+n8efXgY8A8F2jSdz2ppZwuRgeHcrEaHUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZG+TaM2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZG+TaM2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C889B1F00893;
	Wed, 10 Jun 2026 06:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781073989;
	bh=FkPXCepqRUy7nsilnfQjzTEdRMA/rcS9qrVjc1EIpEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EZG+TaM2xOpdStnA9Jj0JTI/bmcAeK3mjLG8WjJExrqA2egzTyv0tNIjZT61T19q8
	 MG2LSopad03konOE+mIhicx3PuVrYs9NGDOoBTLxAVQbgwv4Jwo23dFFqNxfnX2eJm
	 q8PCh4E3IYadW1IBXgfyahbmAy0Xawt+sb0wJ3ciQKIcqBnZfs1nC3sQIZ2k+x16MM
	 pK8Q85vFWeob3fIQCYvnB+N+R+RAMM7226gvfwC0dHHNi0yiO8AQJzzZMjghfL27Dk
	 Lmo2jD/uB0b6dJBS5D0EJHsUCBejUVkgDIzFISPnE2C41sbWnFckLx9ssaoIIvCKlw
	 bHunyZPs8QICA==
Date: Wed, 10 Jun 2026 08:46:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, Nickolay Goppen <setotau@mainlining.org>, 
	Adam Skladowski <a39.skl@gmail.com>, Vladimir Lypak <vladimir.lypak@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v5 02/15] ASoC: dt-bindings: qcom: q6dsp: add support for
 lpi mi2s ports 5-6
Message-ID: <20260610-humorous-shrewd-lizard-e54276@quoll>
References: <20260609162255.31074-1-mailingradian@gmail.com>
 <20260609162255.31074-3-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609162255.31074-3-mailingradian@gmail.com>

On Tue, Jun 09, 2026 at 12:22:42PM -0400, Richard Acayan wrote:
> There are 7 internal MI2S ports per direction found on devices with the
> internal sound card for Snapdragon 660. This is similar to the LPI MI2S
> ports, and the LPI MI2S bindings can be reused for internal MI2S. Extend
> the bindings for LPI MI2S ports to accommodate the internal MI2S ports.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml     | 4 ++--
>  include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h            | 4 ++++
>  2 files changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

