Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADEB258EE0;
	Wed, 11 Feb 2026 06:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770793047; cv=none; b=DTE+f+IXSWB+iIRKZpQ0FlcZyyeT6WkZ1YW6lujbD8M45KupWSD38WkDKDLZCSBPNA2Hvc3KXVQFMXP189mV4e8U59JbbviFhbGvLd96gCOr5+F3Krh3ftlNmHP72fFIikyeppTmpXDcbVJlQfjjarIBLBXlNMPbV45M6oIeKnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770793047; c=relaxed/simple;
	bh=XhiK/KBLwkYOM+W68oEBw/UPC5xlX/sh5Ht9rNNP8Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uOMBDjzxWLUjzZ3uFef0o9AbVvpf0j5R//Dat1Cm/sKdTqk3kkkm1LT4koAU5n/arNC2WhF/BrTOzt5pn7UMTH/QRHVocffI2U6DR2nMkZEngo5NM6FImjsGO6vLLxZ0tUU06tUMvO/2mC0ylQp8858S4AhvHY0bot+81uuYiOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ipi9uGuF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ipi9uGuF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85AE9C4CEF7;
	Wed, 11 Feb 2026 06:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770793047;
	bh=XhiK/KBLwkYOM+W68oEBw/UPC5xlX/sh5Ht9rNNP8Ik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ipi9uGuFs9DLdR2w4sw2Hy1qxGSEyzU8+jPEC4mcIiVZ6Qv92VgnJ6+2bTN6nut0k
	 skDT4TGw3i8OGCGR2hvt5zpQ61FUfMqGrvXCKD98c24XRNJnjD4ZxwJD1cJqwCF5xA
	 trh+Pi0fA94Y/NbgaWUlEaPyHMXr0Aindi7NLF1fESpA0gGb+KAvQ/eaPd3x4wQjPe
	 e06PlwdeJeXNqXx4nkY+3i4TNTnxuW/mP7so7CSH7U3m40znHh31b1is7XhObnX+9a
	 hOlZrMRmKCK4PdgO2yhUwofkk/etoC8WCjdCZUPhQMks49ORAK/YfPqtpQBKuyt/9Q
	 EyMHyyDGyHInQ==
Date: Wed, 11 Feb 2026 07:57:24 +0100
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
Subject: Re: [PATCH 04/10] ASoC: dt-bindings: msm8916-digital-codec: Add
 SDM660 compatible
Message-ID: <20260211-angelic-pony-of-hurricane-05bd64@quoll>
References: <20260211020302.2674-1-mailingradian@gmail.com>
 <20260211020302.2674-5-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260211020302.2674-5-mailingradian@gmail.com>

On Tue, Feb 10, 2026 at 09:02:56PM -0500, Richard Acayan wrote:
> The MSM8916 digital codec is also found on SDM660, typically connected to
> the SDM660 internal sound card. Provide a space
> for specific compatibles and add the compatible for SDM660.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../bindings/sound/qcom,msm8916-wcd-digital-codec.yaml    | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

