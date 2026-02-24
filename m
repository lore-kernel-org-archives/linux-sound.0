Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5ADA33A9F9;
	Tue, 24 Feb 2026 07:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771917292; cv=none; b=BjihBKycdSQ7J5M8rVJV1ZTP0Ti8yGLBxEJJY37+vf0RR0V59SaxHmbmbQEpDjQUP94we+/1E8JIcbNf4CMrOwgdgbrhAlf+CPhUFHz5siZFvfMK6zKwxD8AhpQG4kq8u4bJhBysTLkc0571pne0yDgesW/lHGRKEup08Sz5EFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771917292; c=relaxed/simple;
	bh=5Vy6OcIgY7m/3fTGBHDL34Eb3haRAQqvXnqalEgokqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjqpRDrzl1IHeQy09Wz3nnsVYjp6yn7vxnfBQS5wvdbRed/+qaUNx+x3SBTFhlU+sIB1vO670hglfA/C/hZoZh7h0pOGs0rHDv9os5tCzC8gBRlbUSHfkCTxhA+UG9Wv9N3sfuWSbQVniVA7keqB7isUoxJaPc1djZufOC7VbNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPF6Sx6G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPF6Sx6G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6015C116D0;
	Tue, 24 Feb 2026 07:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771917292;
	bh=5Vy6OcIgY7m/3fTGBHDL34Eb3haRAQqvXnqalEgokqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iPF6Sx6GXWRf7WCyCuuCY5hnCTwPt/YnsdK2KIcJFtBGLqfGLGlY3eA9Zf8X3O2xM
	 TP4yDLR/CYuKyVeusomUoaZpAwlGrwqv++Wz0/RNlyLXcKSRt5J8XqAF+7gMaFC7jZ
	 YRlSjmAl+wWUSArSadWvETOqYjyT90B2ZMgxUyHMOOC7QSDxF/o9p8wMn7BJOA7DyH
	 h+ufsxndXAbtzwIEkzS6O0kK1a511kJXcm3U4hzAzPd08y/BQq+GRXloBW++M5xeaY
	 pN6kTcOr+5mV1Hi0UnMYmTI/xVGnPdd+bbCI1eQPVpwoi/U+f6EisDouGFsGeNGZVl
	 u0XsN3EM1tTfg==
Date: Tue, 24 Feb 2026 08:14:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mohammad.rafi.shaik@oss.qualcomm.com, 
	linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, srini@kernel.org
Subject: Re: [PATCH v2 09/14] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add
 Senary MI2S port
Message-ID: <20260224-ethereal-koala-of-health-eab910@quoll>
References: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260223180740.444311-10-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260223180740.444311-10-srinivas.kandagatla@oss.qualcomm.com>

On Mon, Feb 23, 2026 at 06:07:35PM +0000, Srinivas Kandagatla wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Qualcomm platforms support the Senary MI2S interface for audio playback
> and capture. Add a new definitions for the Senary MI2S RX and TX ports,
> which are required for boards that utilize the Senary MI2S interface
> for audio routing.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 2 ++
>  sound/soc/qcom/common.h                            | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index e27a31ece1f2..45850f2d4342 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> @@ -150,6 +150,8 @@
>  #define LPI_MI2S_TX_3		144
>  #define LPI_MI2S_RX_4		145
>  #define LPI_MI2S_TX_4		146
> +#define SENARY_MI2S_RX		147
> +#define SENARY_MI2S_TX		148
>  
>  #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
>  #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
> diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
> index 85ca73408151..ee6662885593 100644
> --- a/sound/soc/qcom/common.h
> +++ b/sound/soc/qcom/common.h
> @@ -7,7 +7,7 @@
>  #include <dt-bindings/sound/qcom,q6afe.h>
>  #include <sound/soc.h>
>  
> -#define LPASS_MAX_PORT			(LPI_MI2S_TX_4 + 1)
> +#define LPASS_MAX_PORT			(SENARY_MI2S_TX + 1)

Same problem as v1. You already changed this. Don't change the same line
multiple times.

Anyway, this belongs to the code patch which uses the new LPASS_MAX_PORT
(e.g. ues new SENARY bindings).

Best regards,
Krzysztof

