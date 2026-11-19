Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116142;
	b=G4ujSpvmRC7yYGQw72sD5SHB8j26+8MtyS6Hvj6xVXPg+bDS2pBHfrzP7IknWv9qjyUn
	 mqz0P0QEMot/1ePQR8HaWnHJqKS9ykmyGyrt4mIJkC7BChR3Eq4Ns2NlUvFhs70HFh20s
	 GOzplk6nD+SYRv1SIGWsrvasTOazpA194pQ9HlOEplDEK5GxOycprIk2ZQzDA2JQQMoLX
	 2ECzlrgnoWLLur00hEL8JWOV8rqP3viHporNupGnFmvhbCRit8OvaZES/an9FjUBrm6+f
	 9Yx2qPbhVZIxyU47B4kKwYG0Zl9BTiueCudBohO/T+I238U5t6yG1DjMkP0zt9Vo2gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116142;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=H/f08E3uJEXeSKK1itGvan6vjNPwDfLmBBZVqcKzRgM=;
	b=NLwyYUi6UUsTS2ZE+0drsy+JbU8zEVyu5StgtgzqFvu8e5v151zOzguwnDzmazBAJ5Ae
	 8hLmYVSTiTvVCObqmlIQApv5ozF/vRySbIuN2voAmdLEAuYzmXbixuIZcdX1nrJKVzTNt
	 38bEN9jOrgoy64ulCwS4qdg6m5HG2iCN+exZ5T40B6raCzph0EYQH78JIlVF2idGBVcHp
	 zTaWboyV0ufg6JBgNHT313w4z3PaRtyVS5z13OCZb/ep4kjkKQ21hKNQS/dNKNcxiZOQM
	 QZTSewjVRWs9pLb9/87/eu9PthslECpKyYReG8FXLKdQOKDFxuz0FZGPy8zIvYrAv9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CCj2V77w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8D3606A320;
	Thu, 19 Nov 2026 19:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CCj2V77w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DEF1F000C4;
	Thu, 19 Nov 2026 19:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795116142;
	bh=H/f08E3uJEXeSKK1itGvan6vjNPwDfLmBBZVqcKzRgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CCj2V77wmyjsVBonmc0uU0+rwfz9Ay4UAk0Szipp2SQoV/3VvAq6mZzI+2oKwUEKE
	 uQ6vgAYh/C+E8mSixpUItMWThWHQvZT6++0goUQEgc1ILF7z9j5Ijjai7jzTbgYvWa
	 c/UkdOIRZkUtrSE4Yr8cWhxiVbXI3hCDOGzsIAuQa9TiEm4zbhHmvXCw0xuLUP2Hef
	 +P4H+UcLTVQCQa1uEjH7GKeIKTOOdM6wi17gZtPKEmBVJxiRUTFjPGdVSqgDfvmWLW
	 knYiRr0xdqRnD27gOHqLniS1hPYEuMdSPGrEJu9M6ZMYsPCKd0qXaV0ZwSOEY7NnT2
	 d0XizdQj0ZD1w==
Date: Thu, 19 Nov 2026 13:22:20 -0600
From: Rob Herring <robh@kernel.org>
To: Karthik S <karthik.s@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/5] ASoC: dt-bindings: qcom,sm8250: Add
 shikra-iqs-lt9611uxd-evk sound card
Message-ID: <20261119192220.GA4074534-robh@kernel.org>
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-2-karthik.s@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022094313.1074873-2-karthik.s@oss.qualcomm.com>

On Thu, Oct 22, 2026 at 03:13:09PM +0530, Karthik S wrote:
> Add the shikra-iqs-lt9611uxd-evk sound card compatible so DT can
> describe board-specific audio topology. This Shikra EVK variant does
> not use the MAX98091 codec as the base shikra-iqs does; instead it uses
> the LT9611UXD HDMI bridge as an I2S audio codec. Describing these
> variants explicitly in DT allows the machine driver to select the
> correct DAPM routes, controls, and clocking behavior for each board.
> 
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,sm8250.yaml           | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 1536fcd96d68..d1f948a14c62 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -50,6 +50,7 @@ properties:
>            - qcom,sc7180-qdsp6-sndcard
>            - qcom,sc8280xp-sndcard
>            - qcom,sdm660-sndcard
> +          - qcom,shikra-iqs-lt9611uxd-sndcard
>            - qcom,sdm845-sndcard
>            - qcom,sm8250-sndcard
>            - qcom,sm8450-sndcard
> @@ -247,3 +248,45 @@ examples:
>              };
>          };
>      };
> +
> +  - |
> +    #include <dt-bindings/sound/qcom,q6afe.h>
> +    sound {
> +        compatible = "qcom,shikra-iqs-lt9611uxd-sndcard";

Is this example that different from the existing example(s)? I suspect 
not, so drop it. Your .dts changes provide an example already.

Rob
