Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6DF265CA2;
	Fri, 17 Jul 2026 09:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278881; cv=none; b=r69izyLVyIe6oD1wXUMmINKOfOZb2M50DnDozPRayNWygetkwQhzkPsywR2jJcSZXL1Kj9PqPGyLOUJYNYYACXIrzP+uPqI0gHh2V5b4dPoDrHyeo3xs7HvOh1E+FR/Jm3a/G7JvOXwnM7GwqApHdTLMkyN9/G8W2bIy66cbldk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278881; c=relaxed/simple;
	bh=gpV7a2a5B/Copc4n/Y78TLsNHu/G2Z1lPcl7IprjQj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=odse/FTfVx43lknhXtGobyZj7Ki/DHWgm2JDiPEp0j2AUv49/XHD5sYfxTFAT1uN18KECE5U4BisSoOFALv77DiWXqTMMEBBz8OdvOTx6EF+iNO8ZJ8wX8L7xG/EvzeURT2Bp2FAB03Y+KjrktANGd6/sHlWJNX7lh+RdMzSpfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mfk5DtTZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mfk5DtTZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82181F000E9;
	Fri, 17 Jul 2026 09:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784278879;
	bh=FYExw+VMJVC7bFatSvjeTfw2RtJrbhlmPYUJgLcmXyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mfk5DtTZd0K/zLJqO3pyO7JeZjWxr5LGLhf0cX7XFML+plN1Cz/LWjhOkl745Ii1z
	 /6h/DJ7JVbQ536yJwXTmNvcanGVeQcGGLZA18JLdwvuOYXhHLKecwZlOyjJk1aVCAG
	 etPzxbvbvj23ShZkNiU2Hjxw8H2VRqmf8du8yJcy1DEfTy9KzHD+5ph5+PEzCl+4dX
	 35hWqybTj8YXocNzUXJFZ7TxD5pmZJC/+f+X9SvdTdaBuvkFQ2Pv37eVRIpl98cKWg
	 XLYR/2zbuzvXxx3tWe1pXpNLyj0CA4npwHyEZwVoQZag6owHVSsNChBi8a80FHRjpw
	 4klCCn6Pow3PQ==
Date: Fri, 17 Jul 2026 11:01:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, prasad.kumpatla@oss.qualcomm.com, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: qcom,lpass-va-macro: Add hawi
 heartbeatpulse clock
Message-ID: <20260717-resolute-dexterous-turkey-3a5bd7@quoll>
References: <20260717-master-v2-0-ae200627ad62@oss.qualcomm.com>
 <20260717-master-v2-2-ae200627ad62@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717-master-v2-2-ae200627ad62@oss.qualcomm.com>

On Fri, Jul 17, 2026 at 01:21:16AM +0530, Sarath Ganapathiraju wrote:
> Extend the qcom,lpass-va-macro to add the qcom,hawi-lpass-va-macro
> compatible, which consumes an additional heartbeatpulse clock
> alongside its existing mclk, macro, and dcodec clocks, for a total
> four-clock constraint.
> 
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> index aea31fbdad..ae4df89678 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> @@ -19,6 +19,7 @@ properties:
>            - qcom,sm8450-lpass-va-macro
>            - qcom,sm8550-lpass-va-macro
>            - qcom,sc8280xp-lpass-va-macro
> +          - qcom,hawi-lpass-va-macro

Put this as first entry, trying to keep alphanumerical sort.

Anyway, where is any user of this? Please carefully read submitting
patches (both documents) since this breaks its rules.

Best regards,
Krzysztof

