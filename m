Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CAD393DC7;
	Tue,  4 Aug 2026 20:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874607; cv=none; b=RVPdqJYi/qmhmgfmT9AQziVMYtbEEUHnjhNdymQVXtv0cc2vYejZJONish+WRAtUgyV22kGs7qiNujLFHwkBcDAG75UuVaRpPXv6QacQoaKzzgqgeWQvkrulpqPxJhp/lWnw8mocj8FhsuJN1ulI+/JkqbgoqLthDotIRKA8a5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874607; c=relaxed/simple;
	bh=ddvCW5TpTrmawZnwkCT94vPmm/PM8poYMvhogbDNdY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEmrPyg1UrCFYNLok4LsJFs6aHVNab2afU7ajdXCDut5JI3zoE08p3AnAoa7sVsl4ckVLLbTNzsF/s9nfMDX0vHArfRPdMPb7kcN6m1la3wXp4PACzNFwlwMpzZBBjz2GNNZeq7pTfMRMdsGJx7A297uvMtGs/5P4JTsYOg8gOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2V6kbZu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2V6kbZu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95EA41F000E9;
	Tue,  4 Aug 2026 20:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785874605;
	bh=qu0CT8rG9jZzpQDEGzamjnzM80udV5r2s0XEsYufbQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q2V6kbZuhNexW96LIqVkqSK6PilMy3/GJ0YUGxoSZL6ttS/51lUaxI8vwXtcyc+IM
	 SniuDuY3MXKKHDF1gM25LNGtfju0TbEBRoBjrePGfFeec2GUnOziJ+U1wSttf/Os7L
	 Jjz3JS0RRk8QMGrc/4qh3NDJYotx+0b/tnmB0O5W9HSJ8kDKnzLc5ImUMHuHI/byo3
	 DGePCt6xycatA8KGl6+VRgInPfC3ffISKqluMe6iB4EznIlvJLmpjW0bVQsup9aPd9
	 TmUoPJXsH0MnheYOjcBTTmhCSOsW01njEi8EmuekiQNnsOHq6ldyeA528wh2awz3u+
	 3SyQ8d9ubI8Gg==
Date: Tue, 4 Aug 2026 15:16:45 -0500
From: Rob Herring <robh@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v7 3/7] dt-bindings: sound: qcom,q6dsp-lpass-ports: add
 Audio IF clocks
Message-ID: <20260804201645.GA1781336-robh@kernel.org>
References: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
 <20260804070307.117119-4-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804070307.117119-4-prasad.kumpatla@oss.qualcomm.com>

On Tue, Aug 04, 2026 at 12:33:03PM +0530, Prasad Kumpatla wrote:
> Add the LPASS Audio IF clock IDs used by newer backend interfaces.
> 
> Platforms using Audio IF module backends request the interface bit
> clocks through q6prm. Add the Audio IF IBIT and EBIT IDs to the binding
> header so these clocks can be referenced from device trees.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  .../sound/qcom,q6dsp-lpass-ports.h            | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index ca84952c3884..2e879a3c09ae 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> @@ -237,6 +237,35 @@
>  /* Clock ID for RX CORE MCLK2 2X  MCLK */
>  #define LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK	70
>  
> +#define LAPSS_CLK_ID_QAIF_IF0_IBIT		71

LPASS_ as saskiho points out.
