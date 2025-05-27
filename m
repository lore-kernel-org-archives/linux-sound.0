Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D3327F756
	for <linux-sound@vger.kernel.org>; Tue, 27 May 2025 16:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364127; cv=none; b=IA7/Og6BPqheeffMkZwDrM6RZ0J6PdDMLTJLAmzFxtWBBz5H+MbkgB89Nqp5SUk5J2WeQifTRDh5Vk13QF/Wo1WX2wXeVvBw8hCdbgvrZ1TMMdF1beUEQLWhlkNjYiMnnhmRhZzTPo4YoOFm03koxR0uvoWX5JfHOtbKxm2a/e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364127; c=relaxed/simple;
	bh=o6IP1ZSE7iTj86N6LUhJhtCOx5zFOGbL5Y2ity8VNvs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=TcqiqCx1e1MH9jGKJnybdKlVz5OyPS7AMaWN8OLE9E2kU232X9Vuxk3kxPAffFF6vvvQJDXpnfbG5veO05WJurIuwUolHc4RxiTEKRshladCrWZR3PY+pjENfQjBVb1HfPN4qgBB5Q2GxSHRZoOVbQ09MM6snKJlFV6VmMijuSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OxlXVsy4; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OxlXVsy4"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a3758b122cso2306220f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 27 May 2025 09:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748364124; x=1748968924; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gC+Kv6MDihqVMIw1+edFXcpQJgi1ehuY/J0XFAu4/hg=;
        b=OxlXVsy44edlq64sSEGc7JA5szCVGkXupCPcjVt31kSjcrlxI6SwejpaKj0FX3DvWY
         p6roNhIdp6a4y3nqerCKTex/4g8ZiV/btLkd9FcgPxjVtIzKzD0n9l5uVRDVHBpxc5t/
         vBqC4MRniSHRyQpN7Rezxj/wbA0x1/NKv2Atzr7ZpgqvpFsHUD01vsTL8W44I4VTtkLQ
         VITZ2jGWAFnQfStzEA4OACBCnAE4CZQz6CPsmQDD7gnsV6dapMOPSe/Gne1NeaT4TP5u
         /psdeAD/MZZIgWMZtaqsVtrTxOBKXolyGcb4582iitadLeyz6omHAgVtxYiwVwXUhvFL
         Wcgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748364124; x=1748968924;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gC+Kv6MDihqVMIw1+edFXcpQJgi1ehuY/J0XFAu4/hg=;
        b=MQYgApu/yGIsKvahod/VAzSa/WO+Gqz0oRc6MwygzsRGivJNXFV5huB8d1B0m6gKBf
         v9PWheLBjGoG+BP7C50WHrOXCBxQuWZb9PNoIDTi0dA/liFVHUlBp4kaSfYrpEZSw7ov
         hQdu+UTAi/eN/FPVuocm727dCUTsxzRhgpSB2hWl4ikZiqpTSXub0dZ6mzL1GXMrPuOd
         VM1Pq7X6lkmwXAhlkIv1i/DNksUp2FXK1UAnbTprp/OCaAcoceT8imJW+UA/b1mot31c
         KC2WzLN/id/8alOrpJ7SKoHn4jf4OIA+rjpcM7JZ4B76Kv/yvsnAF8anof6tnXyRZ+Dd
         EU/A==
X-Forwarded-Encrypted: i=1; AJvYcCUDmxL49EF5XOKigFEwbXSHZMeX9PkoNokyOHiOJPjBsTy+5WyuYURRtyqbJUWCcNH7JcME1A9iRglMtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyljzZGiaeclBqJPjMBwbLH/Hoa1r4oaO/g7/k0xlm95XQhWhwN
	Usq2/m1YDaMaTNApu2s5i2/SvMx+XPXlDEbTt6Zi4+b7I8al0vMScStU6FQkwziCWgQ=
X-Gm-Gg: ASbGncuB2aMUAhKx8xaj4tjyhttFkX0awWNitL1t3llwqasvr04PuTqaB7NSioo7zmT
	LZANhiE78PmghAc2ATGnI76Zy93LOUj7HlZBA4lo5WUahMI1tWqZPXIuRgb7rwMAANWSwb9u8Vr
	EEcsBTtiIqbqZsiUbPjQKqcxOv+M+Ogl8Oi1qGReh/oo8KT4w6MpxhK60xnSfNa/xqR3Y4mllBy
	SjFarYaofAKd61BxLi7JGXRlMIljZduR2TL/qAFgfEEb6raozA4duYnE/VHKKVXRoGlPqlnGRsx
	z1RggyUnW+/9Gzxa1ZJIFbgzF6IkcU0V9y9FrG20XsT+TjcpteB0Hz3ZBw==
X-Google-Smtp-Source: AGHT+IHOCmeAAiPle45FazpuCrAts2+QCHvGJ68DgsGkOFH6AJFdSzOvGZC9JM9TNpY3pT25HAXqLA==
X-Received: by 2002:a05:6000:2282:b0:3a3:621a:d3c5 with SMTP id ffacd0b85a97d-3a4cb44f91dmr11350352f8f.19.1748364124005;
        Tue, 27 May 2025 09:42:04 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:f024:90b8:5947:4156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4e1fe9430sm2346073f8f.75.2025.05.27.09.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 09:42:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 May 2025 17:42:02 +0100
Message-Id: <DA73CTVYS10G.1O0RVVAHTCEGX@linaro.org>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 04/12] ASoC: codecs: lpass-rx-macro: add sm6115
 compatible
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Srinivas
 Kandagatla" <srini@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 <linux-sound@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-4-9eeb08cab9dc@linaro.org>
 <45124768-c10f-42ff-a899-6dd6e988b21c@linaro.org>
In-Reply-To: <45124768-c10f-42ff-a899-6dd6e988b21c@linaro.org>

On Thu May 22, 2025 at 6:49 PM BST, Krzysztof Kozlowski wrote:
> On 22/05/2025 19:40, Alexey Klimov wrote:
>> Add rxmacro compatible for sm6115.
>>=20
>> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  sound/soc/codecs/lpass-rx-macro.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-=
rx-macro.c
>> index 45a6b83808b277344f17d35a70cd1e3bb89cbaea..3ce7ad758df9fb0b7845a1df=
ef46cdf0ecf3b8c8 100644
>> --- a/sound/soc/codecs/lpass-rx-macro.c
>> +++ b/sound/soc/codecs/lpass-rx-macro.c
>> @@ -3946,7 +3946,9 @@ static const struct of_device_id rx_macro_dt_match=
[] =3D {
>>  	{
>>  		.compatible =3D "qcom,sc7280-lpass-rx-macro",
>>  		.data =3D (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>> -
>> +	}, {
>> +		.compatible =3D "qcom,sm6115-lpass-rx-macro",
>> +		.data =3D (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>>  	}, {
>>  		.compatible =3D "qcom,sm8250-lpass-rx-macro",
>>  		.data =3D (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>
> So devices are compatible, thus why do we need this change?

Ok, I'll link it to sm8250-lpass-rx-macro I guess.
Thanks.

Best regards,
Alexey
