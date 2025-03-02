Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153A51D5141
	for <linux-sound@vger.kernel.org>; Sun,  2 Mar 2025 08:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740903653; cv=none; b=fU2NDROc7oSIskLVR3bD8jtTFRSYOIT15ktVrEyAyMkjhQ6RWKxqrsiF7mOzb8El+lecDoCdy2yd9SET/fI3MOngKrfxnPFWKWv/ysJvqdqKw8xWzxmQ6Ao3wp1AOXNVX70cZ0qwM3RThjunPtSdsvap7fx/0XRFRCempjw9+yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740903653; c=relaxed/simple;
	bh=dDu98QeMjbKfxBR7tJUCWsuZcwKiTkC6WMI4ZnynukA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YH+tG90j3ryBlO4Sq2cWV9lRw+zWgR6h4rOj1YTmTEjQVDWOatybxeaV4hbkJGUEjTAc8AJtYa+9+P3udJ6dAFsibC9IVMPRpVnc9Isx2vE/4lm0ge3UPHHNUpupPyMk67kRv9m8Jn26aRA9pXKo+cbuv6EetGWu/Ty0ESgFQMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VlRRSIX1; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VlRRSIX1"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30b83290b7bso40731011fa.1
        for <linux-sound@vger.kernel.org>; Sun, 02 Mar 2025 00:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740903648; x=1741508448; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NfKdwYcU8DQiF6AXOruyp9oIUgOHdVpgmFqLr+oBxX8=;
        b=VlRRSIX1MmRT6tvkrkKsR0kUqGvXsBo0Eu/wUoCL0J3T9XyylYOK6SLbcAUhlSXKYo
         SA8OV1PUytzEsKGnjk/DHdoPjyXWq5++qWaz4dAG/5bf4eApWh96s8cg1DvNFOIYbJUh
         kulELKBTTnUV/YGc50Mmp2Vu7faUnvIGXj8OoYr0iTvdG9CwyoQazIloltTaJkFKUCPo
         zWND4F2h9nC9AXnSCGUErsvRIDiwqJWNyXU8gszJVKl/8cVGVGTbOfNgTdWlwLVXhwt8
         0bygA1BlJ4fX9CY7I1DaUfG2eGKU3F0pdt5XxuCIiaqb0h0VZkLHyETrVQksjVUfXoDn
         UarQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740903648; x=1741508448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfKdwYcU8DQiF6AXOruyp9oIUgOHdVpgmFqLr+oBxX8=;
        b=GONCSyY1K1qzln31neMjcPmaDWWNSCHGxvTODDvAOOnkROnsh5cp68GkIYgh63qCBu
         KR74fBGerWGckazpYQpFAJHqSXIV50n6NwhQCuL8A97BHNOs0FvPhiSwPXT986y4/lvM
         SRXr0oGeV48GYxHUw4S6FvillHQgUbsHPa/dROA4lnTmIG66jYh7DbnqHTLqEaVpI4D1
         BPTKP3JtvCPtYC19yWvwX/hqcYcJt5I1yYWa6smRnTNxToS5d33uA9v4IUeR/FvzlXrj
         v1W5disrYPAkh8e8Su/ktCWR+wP/p4/a67pSLYwFojzF/yu9+jQgAc/B66WO3ROxgH5v
         CPnw==
X-Forwarded-Encrypted: i=1; AJvYcCUDIKWQGUDwqNJVFndVuMLK0l6XSzgqcMTTPd5MDIN4MQiyV62jS/AD9pTJRSQr9vLD9Ss0Dcval9Mhgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCi4cN+l+JVJXKuFYl2T1RSww3AaQrHbUx5H5pRcE3Sqyjn7bc
	arCoj3BXd1b+Oj3zAfedR/Sk5X3Wk0PwoaR0Z465yFUAmfRmXcpAusGbLAYqwJc=
X-Gm-Gg: ASbGncukiQWZAAFMaCRNh8KcauGFhK8eZK9/vPv/B+xdU2D4Yhfhvjl9dZxAgp+l/P9
	Q4ReG1hWxeLKv6tYztHr2dBv+vnyeSuvcgI7J/gY9v0oZAhCkQ3gGkaHO7SogI9XriuyinaRhWc
	7k7sBVt/Wo+kfXJrpzAadMzE5UXIvo5mcvLDfBMVLO9y/RUUkyeivZZvoMd1nEL+V0rN6DmTXPJ
	W5pVRL60gdKcjsaUm8F+f+PG5CokEOamiKMF90ciMMChPn+SlYBfd2QK3iLu4ybwlmJIGXaOrLY
	Hoq4Xwn0ktJLWoskDhmUz5XalYhtej2Ps1HUNd4AyQw/LEXI1jDxo3AIQyPuXqrDsKwngTjt1Tj
	3oDlgZMEwyEQMjCtvTcySaNVr
X-Google-Smtp-Source: AGHT+IHg+KAzyy0IsIZM7j3wFAcOrBBOIer88JW2kHinXd24Lajckl9FIBe+oKIlI8/bfiroAOYlRQ==
X-Received: by 2002:a2e:bea7:0:b0:30b:b852:2f77 with SMTP id 38308e7fff4ca-30bb85235a4mr2172901fa.6.1740903648125;
        Sun, 02 Mar 2025 00:20:48 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b8de780a5sm8800941fa.4.2025.03.02.00.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 00:20:46 -0800 (PST)
Date: Sun, 2 Mar 2025 10:20:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: qcm2290: add apr and its services
Message-ID: <zh2hpp73bzylw5aomljqs62k2tay5cmltvgczo7bi4flmvgd6h@g5hzcax2aqd7>
References: <20250302-rb1_hdmi_sound_first-v1-0-81a87ae1503c@linaro.org>
 <20250302-rb1_hdmi_sound_first-v1-3-81a87ae1503c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250302-rb1_hdmi_sound_first-v1-3-81a87ae1503c@linaro.org>

On Sun, Mar 02, 2025 at 02:49:53AM +0000, Alexey Klimov wrote:
> Add apr (asynchronous packet router) node and its associated services

Nit: APR?

> required to enable audio on QRB2210 RB1 board.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 72 +++++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> index f0746123e594d5ce5cc314c956eaca11556a9211..2c90047f7dd867580836284721c60ed5983f3f34 100644
> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> @@ -16,6 +16,8 @@
>  #include <dt-bindings/interconnect/qcom,qcm2290.h>
>  #include <dt-bindings/interconnect/qcom,rpm-icc.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
> +#include <dt-bindings/soc/qcom,apr.h>
> +#include <dt-bindings/sound/qcom,q6asm.h>
>  
>  / {
>  	interrupt-parent = <&intc>;

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
