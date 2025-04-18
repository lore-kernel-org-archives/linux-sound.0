Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181352777E9
	for <linux-sound@vger.kernel.org>; Fri, 18 Apr 2025 13:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982417; cv=none; b=ciF3NziW6V2PD3/LtR1S2yWuA55KRVuYH5ROpfsh9db9gr2fCNl8o4UvkOnLy0SPAyvLjRm9XY9N6qm9uGlqzq3urrWs2zBP1iDHFidHv0h6nG+zK0Bi2Rse4x4WUxMyLxz0Cjc2n1iarmXc19hlRuSjPlLTKJqomjmpEgrCiNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982417; c=relaxed/simple;
	bh=b5jeH9RfjTDXcfZcMSWZB1gj325j1QVlUQZ24/q2PO4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gWwQi2Weq7TsudVewSYdD8v0lYb4jTD4GaYyNm3H9AY/0D/BhBFoXfOO0HGXVs8BePUM5BepBobRH8m4SxUrBeRECTQg0990+s1wmv3Z67TIKlzDfAYJO7CMSxJj6zXZIy7Ka4Lgh2BMCHiHPpDtPxEk0kI8JSFa0m6t/Bz0GHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M62bv4nK; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M62bv4nK"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf848528aso14266195e9.2
        for <linux-sound@vger.kernel.org>; Fri, 18 Apr 2025 06:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744982413; x=1745587213; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IlCq1wzYbj7ZD9Rq/YTc1zUdp9qyRnppuYJZ74zXERg=;
        b=M62bv4nKGBmNXcvXESSWzM3X1nHS3cnrfhodg9imzGBGzstZboEwUq9uQjcn7Rg6z3
         TWSTuRh1+eexDYYSIZ5R6whlQWokO594ZXWEqkiPqHifoMXm0sHpQpqNoj+79b3Yc+8r
         XNrJRqXGLNarDXhVxDACf6cfZ2cDh6XwdBeVclIK1wLL9bwa2zGx3QxyKbwmbhgyat2J
         jQu8YMjlQnTGju8JSM4FSbX11YUAFviebNLpo540J0xo3TPRk65OCiDMEHCKtxqVK2lr
         H488iSK5jvt+BAYEXQBnrK9mobs6KOOFKAPKh8QIJ/6hIPQycUO35uXR5f1tNbMAgMeN
         4L+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982413; x=1745587213;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IlCq1wzYbj7ZD9Rq/YTc1zUdp9qyRnppuYJZ74zXERg=;
        b=UnKaw4pW9nQqEhwi2OoxeTRNGroSHJpVHJ/lLDf6SaqWFmMRkQHLXS/+IohszmbCrs
         9y+piYZqfD3v4N3ew86racIz/+9sZJJXAyjghlH/uCftYLNjuQE16zT3J2ugGxlcwO4Y
         fFkLx5c0eEA/5VCk7OepRNKzg5zcInpmV4xptV8ZmXUoR+lmCThse82MqTO99vn8PI9n
         +23mjH3q8WfOMzTaZLOv3PNSu5IVU6T1uiTp1NW5BvMQe3x9g0zUNiLwVf8OYUf1b51G
         mt6EqPtUwmIeQJfGLpqWM18ECC+OFAckZzjY27V2AQWntj9Tj/HeW/XpWGFugZXTMoMM
         xKEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLjBIcWVOoAtWW5JCu9JD/iRfQFv9SkdIA5V6dlncPfIcG0aWC8gWi1HEzgw/aTAGkJC6F7HFztATFJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEBqw1v3UIHgjG7kqVsr+pihmadVI6CMHEN3y7RUM7pN0yElXH
	bphf1l5dKIXGtHqfD5ei2eHS1mtQkF4JhOHBAe8Sm7joTgMSIacGWx2pycMY9fo=
X-Gm-Gg: ASbGncv+1jbva7jsA1cfs2I0s+qVc1WQomOVYiY9sQ20gO7/Rrvqxt8BLGVhSsDf2RN
	OlnskiUivrIQXWN1ex4nywsDUnjxpM3Gq/YIfB6kblfEF9uPZFbwppDRW5UrM0ZBDOQlQgZWZ9o
	FUDyJVmVPUpbzbS8DUy0gmonmwvXDqBRCTLKfhT8YO2pzt56iVcYany8c29etQ5iLVqNEOiNbR6
	P4kwX7AeuWPQkXGRQKDuKJviSHJ3ln2JZoqb+vYKCnO+3MFs/QBAUHMzgW8QGFQ2R0l/wauwjXb
	SeMiDW77dALddqHC4se5frUddiEwzyJonrCKumzDhGIBMQ/6mkt6UvgSwc9gGUGjovl/ILkTFir
	+JajxvEREWQ6d44+IEoh+0XnRgIXu
X-Google-Smtp-Source: AGHT+IGbBFeZOLZYbp2zUOGKIZnaoUgakmGI4693FYmJp7XCaEK+0cCe61fN3YDSelUXfVPQxuwn8Q==
X-Received: by 2002:a05:6000:22c6:b0:39e:e682:e01f with SMTP id ffacd0b85a97d-39efbaf10e8mr2139190f8f.51.1744982413311;
        Fri, 18 Apr 2025 06:20:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f8ba:7c24:7066:d010? ([2a01:e0a:3d9:2080:f8ba:7c24:7066:d010])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa433104sm2764052f8f.29.2025.04.18.06.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 06:20:12 -0700 (PDT)
Message-ID: <9084b75a-b4fa-4159-9246-824723df657f@linaro.org>
Date: Fri, 18 Apr 2025 15:20:12 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 4/5] ASoC: qcom: sm8250: Add Fairphone 5 soundcard
 compatible
To: Luca Weiss <luca.weiss@fairphone.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
 <20250418-fp5-dp-sound-v2-4-05d65f084b05@fairphone.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250418-fp5-dp-sound-v2-4-05d65f084b05@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/04/2025 15:13, Luca Weiss wrote:
> Add a compatible for the QCM6490-based Fairphone 5 which can use this
> machine driver.
> 
> As a note, QCM6490 RB3 board is using audioreach architecture while
> Fairphone 5 uses pre-audioreach.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   sound/soc/qcom/sm8250.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index aa3b4bc3fcc7b8a8dccc75ef1309bb26a2a8105a..ec5372e18a9c9bc6a80412adcc5ec473e9730620 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -211,6 +211,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
>   }
>   
>   static const struct of_device_id snd_sm8250_dt_match[] = {
> +	{ .compatible = "fairphone,fp5-sndcard", .data = "qcm6490" },
>   	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm8250" },
>   	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
>   	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
