Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0CD313540;
	Wed, 11 Feb 2026 06:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770792870; cv=none; b=AwuxrgZKSSrfEWgV5rCDS6nVT+I7HYDd3/6VRSyIk1vtXDiPI3cfDwkSfKbZb0ypVO237NEoV9zd4fuCYAqmszt8zEHb4UVzO4wV08CpL0Pg8Z9lXu6+FcdmZ8RrAtn99aYdgvBp1sW03u8E76AyxnzVldd8mmUmyxH59l19up8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770792870; c=relaxed/simple;
	bh=P1u/Pp+pi7d62OR5K59f33zA5SeD4PBBcA4s3/vbBfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4GdvvUisojCAx0ha4oJgISO11x7InUZLGXNQ+BU4zJiggP8JI+uUCNGWdVWCbAEPRwNnBbXGAAq2BVuNHjHE3OIabR5mpAh3Mwvjx0YIGYoSpEHmM8PwnIBOpoQ7+zMyd9I3SeMePavusjwMKWY29jC+uDT/PjDke+N4McARfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cbkwrqju; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cbkwrqju"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A51C4CEF7;
	Wed, 11 Feb 2026 06:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770792870;
	bh=P1u/Pp+pi7d62OR5K59f33zA5SeD4PBBcA4s3/vbBfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CbkwrqjuyCVtbwKB/QWPqPL2wmhg79OAIf75odA96ECZaOqDoh/ILeMySX7RKqGVh
	 xbV9/n8iTzQDMReAD76Tvc1IxiHaDsG54W8wQa4ASWLiT7ndR3uo8NSOq9W27973OM
	 wIHDkE4s26PKPniaYbsbIW50gPLBOUGouwDQbCtX8G26ZZXRneEtpicVzp/vonHeXP
	 2FgEDsiO6YLXL9Gez2E7aBzedHjmdAmYhd1qzapYv7hcbA0hj0OUITckaNdXCh2h4p
	 a1VSF5SfWKwpRMAGXUO7Fsr3qxriuYHTqhl1j16u+xDfAe3TDc9/1IGarEjKCrRkfs
	 pVgUz6bfn27NA==
Date: Wed, 11 Feb 2026 07:54:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Johan Hovold <johan@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	Nickolay Goppen <setotau@mainlining.org>
Subject: Re: [PATCH 03/10] ASoC: dt-bindings: pm8916-analog-codec: Add PM660L
 compatible
Message-ID: <20260211-smiling-rapid-pelican-34dcf0@quoll>
References: <20260211020302.2674-1-mailingradian@gmail.com>
 <20260211020302.2674-4-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260211020302.2674-4-mailingradian@gmail.com>

On Tue, Feb 10, 2026 at 09:02:55PM -0500, Richard Acayan wrote:
> The PM8916 analog codec is also found on PM660L, typically connected to
> the SDM660 internal sound card via the digital codec. Provide a space
> for specific compatibles and add the compatible for PM660L.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../bindings/sound/qcom,pm8916-wcd-analog-codec.yaml      | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

