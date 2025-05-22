Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DAF18CBFB
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 17:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936192; cv=none; b=QHWmZAaa4FdNVCsw4QHO6DH2S0zZ+VypqDWPEkZpE1zk9k+sQ5BPjtN1/lm9w/5KFKGzxQl0mcrBUL7pe6TokiopKlwq23gwMVkgMd8GwBsvpq7tPuxq5jC+FAbnpD0BZxSwAaCDWrTRQ7z9QgXTf6/Mp2KRKsnPGyH+SVuYFZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936192; c=relaxed/simple;
	bh=3xCoibSS2GjC7jn85YEmkoE+y/IIh/Ct7dWcRhJDKdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eu+X//vh28qfUW1Q+rRBAfbUC2nSTt+FjTgL/JtI1rXChwEm599aVFWnXq+1Fyk7FnptuB/rrNXtbBZBYFfk4zfRux1Eld7T+EkRxqBWMXFnWGLQHBQv9vdEGFaz6Zq64gvATr85ehqeRpIKew+yqD5V0aez9O5PeNyg62KMCBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IGtFVTAI; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IGtFVTAI"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a362e099cfso986521f8f.2
        for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 10:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747936189; x=1748540989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UDvuKZ0V2HM7N4I0uIoQAz3MmgtXCoBWW3BfMx/X0Rk=;
        b=IGtFVTAIzKSnFfkiLf21XpjBiglAhSYKhD1ARQ2d0N7ACbQKZzePSNvjMbLXeVe4VG
         hj6f0JmUOUvfYBKcO75b7uYFE4HTONVIaLQGRSCheo6wElVkfFfZBrqv1kFBzc6YJKP7
         RQHu54HJ2dBDrkEXv4SeGPzDS4uxihnXfDYpWI2/mRX2P6Op0F7WZNEueKS2vfn+7tFa
         He107Fxu/2CcAxmUTYtQ4J4dXDVedrKJ3L/uQXml/u8e+xbMtMrNOuWmrEnKyUC/1CXA
         l2lOMuDQCzjgCTOFQlqzXEbL85Z5IAzQhd+7C01rziHKrKV86A9c3bgVKiPOs4Y/2Il9
         WM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747936189; x=1748540989;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UDvuKZ0V2HM7N4I0uIoQAz3MmgtXCoBWW3BfMx/X0Rk=;
        b=wu/4KFK6KXHJog2Goas4yMy+nrrqdRPCl0BR77NJmf2zu5cbhPuBnDRpVIo5ezcNlh
         yIUEeFvW8hyF1qTuJnVXsM+zGebeNGYgSps/XAVcKsRxguPB93GglIDQ8XcZbfZu4r1e
         ayNTCVShHqwYcXKwYBNRoERHVBrw3Kz2764bpkk+RopuBGcJbdONGOrvjk1XxRGsXLAY
         i9b/J1lQnuxbW+Iq8tjr5dHzNLM7nDG1d4tkNt8AiCes8TxNmg6mWhPZCU59QbiecHVS
         vC40BGdjGA1mIV5Jc7ix61pIuiyRyvwDhK5XBeX+mulgmjW9wmJ+9ozb8DkiddgRNcqj
         y2sg==
X-Forwarded-Encrypted: i=1; AJvYcCUAsxqExSukopaAUGWR0vWK6Ce+vJh77fC42lOfqT4lA0co6wBQA1jwsCO8GLXM3Ne3/ws/kVZzwE4iXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6AK7TlLrNRTScu7riyiomYDaSgjA81ekF9LCEcnjIuAsih2LA
	4co1bh5b1hDBkZ21W0hM455ago5bm0kQiANBnmYNIj8UkP1S/xhwjHtErBr57dm8Q5w=
X-Gm-Gg: ASbGncsef6hCzNWd3EvrlKQVENa+UYuWj6L00PO8zoFRAwH/8lpROKeBQk8IYzUwylY
	ZIgnjeq/nmyodv/Ifq2lw6FCBSFH0bxmXM3yo4UgjudBA0P1DgnOqinQj3ybI5s2qs+/7t8LIqE
	r7j+YW7sSrkww9JOGqS5AB46wkwswvQYVuUPPaSsGL0Cp7f1xTGxlWhMqmVqBd9Qm1FpeZu0QkH
	k2eWvoX1x9X+gHBb50hzZkYU0VgRz3HVNX6jPflHglS+hKssyTxT+IjiFf4SaFC09P6X3ubBI9A
	yQPOU8Z5OcOrrXhXZMbO4o72WHN59dYyfmx/ZvUyhN0UB42oXjfHWbT5naB2Xb3fYzdqga8sIUX
	Kr9fxYg==
X-Google-Smtp-Source: AGHT+IE5xsKeN6XcOjH3JKqV5Vj43jG428N0dlFvUT0S4tjCqSHNvz8HttWFGUK6V8j8go/Dclvo1g==
X-Received: by 2002:a05:6000:258a:b0:3a3:591c:40f1 with SMTP id ffacd0b85a97d-3a35c857137mr8072081f8f.16.1747936189352;
        Thu, 22 May 2025 10:49:49 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6ffaa6esm116024555e9.16.2025.05.22.10.49.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 10:49:48 -0700 (PDT)
Message-ID: <45124768-c10f-42ff-a899-6dd6e988b21c@linaro.org>
Date: Thu, 22 May 2025 19:49:46 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] ASoC: codecs: lpass-rx-macro: add sm6115
 compatible
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-4-9eeb08cab9dc@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250522-rb2_audio_v3-v3-4-9eeb08cab9dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/05/2025 19:40, Alexey Klimov wrote:
> Add rxmacro compatible for sm6115.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  sound/soc/codecs/lpass-rx-macro.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index 45a6b83808b277344f17d35a70cd1e3bb89cbaea..3ce7ad758df9fb0b7845a1dfef46cdf0ecf3b8c8 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -3946,7 +3946,9 @@ static const struct of_device_id rx_macro_dt_match[] = {
>  	{
>  		.compatible = "qcom,sc7280-lpass-rx-macro",
>  		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
> -
> +	}, {
> +		.compatible = "qcom,sm6115-lpass-rx-macro",
> +		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>  	}, {
>  		.compatible = "qcom,sm8250-lpass-rx-macro",
>  		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,

So devices are compatible, thus why do we need this change?

Best regards,
Krzysztof
