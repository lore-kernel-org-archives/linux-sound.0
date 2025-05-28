Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0073284686
	for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 12:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748434824; cv=none; b=kuGMNYLxlL/y0EsuzB08rsJBc20aS4TqnK8EDEOeDClGBs5HOgqb8t6U+tI3oTk+TRyNgll2AimQ1+/r8RvVcHDSB1RwB6QCFsNQ6WdY8GxwgV+r7suVRBFetSJ6dvQhvMIk+Kdy51gPyPrWSNA11QrSx3JERHffZI3w1lMd1T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748434824; c=relaxed/simple;
	bh=LgluqXTAQPOxJPKju8Bo8ViAFRC7s0F2a9tFXlqvtIo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=X/gvDv50C+XLKrtDmqMd6r7senSax06QGFtpOEYGdtw8KlhC9PHiUqdai4gykuL7ravZnYf6/FpnrFJX/wR1SBLB7WxAwQl9j2wrA8rz66OvInjb4M+Z3B/nQqmeXj9BvZ1Z4dsf9dLltB0/Djdn7XFbIKnnbE8m2ScgN7vnRZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Up9MwRuH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Up9MwRuH"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-440685d6afcso52885365e9.0
        for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 05:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748434818; x=1749039618; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUiSIyBK9bnL6y5jkIEyCSHfBFQ4eE1Z0A1Z3a6M0aM=;
        b=Up9MwRuHNjPw1rlRQzUew66x7qEPzJiY9UVqJhwvtqIf0Eyo8lBQCHqtWdrA5m9oYE
         cQuPLlhoGUjI1pgVqE+wE/s544dc0VOLMRzLVEmaDPWy9BpuDGjDTlWu7NHnXkeqYYDi
         LS/N2aq0Q5HHtM26h+IwOruFH3o0lEwdzLbpOu8LTAoMEIQUmLpzyomxAMNSLuLFe+l+
         hN1kFmpyq4xM5UYNtEbrl0NZjqmb8dCbT0mXGc0ahpMwuiHfCCMu3MdqvNnqbNRXfM5M
         tx3XGeVV7oXENS2jWvJto04TScoaNtoDRPUeSBNGT2V7MU+bmGc+wOKiTULLKBme1g96
         wzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748434818; x=1749039618;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nUiSIyBK9bnL6y5jkIEyCSHfBFQ4eE1Z0A1Z3a6M0aM=;
        b=MtWIvYijWbS8w0sOvWX6u+HCIuGLx+9ufEmQwFnO+gUmmlweCADxXfqn+P4TxWf/vT
         WXvdAmjrwPSZwaoZC7M8xWVkPWb5iVES1MLVUeSpSaCc5r3vfYwM5jpy0WD/YNM0ZK3t
         3VuLfylhh8jRj0kdeCk/I8GJITjYXOpy+MaEr93uX7jstaL9ed38/lCZPe9YkxPqtDQK
         kwDU/MX2FwwOQeB1KTQVscXh+d4jMkxlyD6sHZFV6vkKh2whULi/6qbykHoYE0weAq53
         Th8M4RjVwR+MROek50W0TNstd5IzwjzYrCSbTjqd6aI/7hoolat8WX7evoeKJbTSYx2k
         cJOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyfM+EZ05yQhKqpahm3dyyzdN5lgnxCN6AAgDC5V30Qdapi7LmXpObZfe8ZKhCdAZ2Jnc3oUYCMTfQcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEtxNu5zT99EtHd1v1Jzxqj5wskNU1G6DgL6AD6DSbjCw6TGu+
	65YZ3CLQ2Mw8NyJ1JWWmxoMw0loxrgCnCRcIioLu8Ssm89l0FUYCkd1rq9WYoanq2IUyQzTFcXd
	BEtMA
X-Gm-Gg: ASbGncvgwSK72u1zld2fKPK6LHUlf03+uW7b9GmEUNcBa+k9aliFxlC7eX85eVA3JqS
	Bv7HCqKcrxW7nDD3Cs0Q4foeWnKdLbQM54BM268QWvBkK93dUzRdyc1YHryyd1qHusEgCUgovZ6
	1aCr1AuddzDf+LfZ7UEZpPXC4IRRVRHeCUFgT7vYgBW1q83+iyqVoFEp1H6wNGfVoBPUqv0Y+jy
	FPm1TWZawfdfoBewyx1EBQZcAa9fyJSSF3Ie0tTo8RrARjxKTUiQzxQFrp4ki42eDwRKdqv2Ysu
	5l9p5nEO6NEf5S7LUAdVuzW9sqMXHZbC0lf6rXfLD/tu0bbCgwGPBlN+dJOdeKCSZZo=
X-Google-Smtp-Source: AGHT+IGZexNRqILydRhcO4IU4n98EZEdu0fFVjtfd4sxx1IIeEAtAXBTC1Us7iU6PxbqQgpjB0cAjw==
X-Received: by 2002:a05:600c:3109:b0:43d:1b74:e89a with SMTP id 5b1f17b1804b1-44c941884eamr149032045e9.9.1748434817966;
        Wed, 28 May 2025 05:20:17 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4507255b619sm15992525e9.22.2025.05.28.05.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 05:20:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 May 2025 13:20:16 +0100
Message-Id: <DA7SEY5S1F1Z.1LZE7191BKBFM@linaro.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, <cros-qcom-dts-watchers@chromium.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <kernel@oss.qualcomm.com>
Subject: Re: [PATCH v4 7/8] arm64: dts: qcom: qcm6490-idp: Add WSA8830
 speakers and WCD9370 headset codec
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Prasad Kumpatla" <quic_pkumpatl@quicinc.com>, "Mohammad Rafi Shaik"
 <quic_mohs@quicinc.com>
X-Mailer: aerc 0.20.0
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
 <20250527111227.2318021-8-quic_pkumpatl@quicinc.com>
In-Reply-To: <20250527111227.2318021-8-quic_pkumpatl@quicinc.com>

On Tue May 27, 2025 at 12:12 PM BST, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>
> Add nodes for WSA8830 speakers and WCD9370 headset codec
> on qcm6490-idp board.
>
> Enable lpass macros along with audio support pin controls.
>
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts      | 96 +++++++++++++++++++
>  .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 24 +++++
>  2 files changed, 120 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/d=
ts/qcom/qcm6490-idp.dts
> index 7a155ef6492e..884abbda74fd 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -18,6 +18,7 @@
>  #include "pm7325.dtsi"

[..]

> +&swr0 {
> +	status =3D "okay";
> +
> +	wcd937x_rx: codec@0,4 {
> +		compatible =3D "sdw20217010a00";
> +		reg =3D <0 4>;
> +		qcom,rx-port-mapping =3D <1 2 3 4 5>;
> +		qcom,rx-channel-mapping =3D /bits/ 8 <1 2 1 1 2 1 1 2>;
> +	};
> +};
> +
> +&swr1 {
> +	status =3D "okay";
> +
> +	wcd937x_tx: codec@0,3 {
> +		compatible =3D "sdw20217010a00";
> +		reg =3D <0 3>;
> +		qcom,tx-port-mapping =3D <1 1 2 3>;
> +		qcom,tx-channel-mapping =3D /bits/ 8 <1 2 1 1 2 3 3 4 1 2 3 4>;

It will be tremendously useful to add comments that elaborate the {rx,tx}-c=
hannel-mapping
(and port mapping for what it's worth) here like it is done in other dt fil=
es.
For example in the same way as it is done in sm8650-qrd.dts
or like here:
https://lore.kernel.org/linux-arm-msm/20250526-sm8750-audio-part-2-v3-3-744=
29c686bb1@linaro.org/

Best regards,
Alexey
