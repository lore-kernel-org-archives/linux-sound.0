Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53952DC77E
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 15:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759851546; cv=none; b=N9KT2nYLx/SsLnw2IaR93FR7PNa/Ts6zXNfT54tPBGQbCAIRkIk7GpR/bBcZb7mK+JBx5649ly653kR+WxtiU2wguK10ISBFtVDA1oymjV/S63PESMv6+Hkgz5dXv2o0+r+wOtkmtRiN4k/3KySOA3xJoqHRCh6CMba/eeauFMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759851546; c=relaxed/simple;
	bh=ai4LGPuL3rEMggixLNvM6kWUprS+X4rTlrv1/oQ6sJ8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=cMFK23gjkQBjb/vizD62JqumfvXHXvGIfDtTX7owG56HG6cImJZUSINdAdAVpo0y5tCReLQfnBxEYNdOwgdzC7+DMf58+o3vpkBu9VfVOx/DzOd2jLW2B3pUhUD5Mchgl+qzD5OWUP9juwzD/goPck/0dHtK8ssVueE7tBTnfYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xDm5i9zk; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xDm5i9zk"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3fa528f127fso4887571f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 08:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759851543; x=1760456343; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8DX9q0w9bvA3uWv/K5h42L9FfWuzySG8u4E46pyKaU=;
        b=xDm5i9zkOCUoD7QiwqfKRCqDhRV5uv80wOLiF4mrKd8VDiuFsVyyMCO+vn5+LZRzcd
         kZbTmFYeUFD8QZQnnRR2bSSP4fksoQ3DUHdYtJhK/MZKwi/kqYkxS/Ave8QXSNpw8iHX
         HAOi4zLQzqhRloJUzGrNv8T5ps+yz2YQxm64syS1CDh9R2Nny8bDINY+RmC9OADWDX41
         mZOj2zI7U1CvyBrVJ4EWKHVZVVA11uH0rTS+aguSpqBedbYyZJ78pdx98v+C/ENxvexl
         eQJVX9U60k4ZnSRqxZdjSjtKXTOFwmtmDwOZHBRt3DStY3eVb/RPNaLAuidLZEa2cBR2
         lZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759851543; x=1760456343;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k8DX9q0w9bvA3uWv/K5h42L9FfWuzySG8u4E46pyKaU=;
        b=I3HcR3CU757w/1G4RmdQHlDlyE22lnsREMfidPeZ8rh9qq28SVrqXwILpSx2YMQGXm
         Agpw7f6mcnhqJqD8qexqPtm3rJ/tNC4Tpbm6W2IZJMk09kylF/kZCH1S3hBNqh1fXCzd
         KxCBqFxBdsT8Tlycv5m3T+wKfVBj76GKWm9vnfFXdGeq8JxxjYtbvBrZTViKl3zDXyJi
         rpz+Yw5fyrQGrTvdI/nmkppGrwHA5M9+6vmtAXWkro6d922Ow3NRxwMoi8r+76BUnANi
         qG4nBvTmipl+YZTpLIlir1PWoWZ21rqQTwUuAXERqcij+o9pZ2lgyMeRsUhImBgOHmWx
         IWog==
X-Forwarded-Encrypted: i=1; AJvYcCVuOGfRHRrbKoog3en3RLjzDvSDepbRjax5sr/1h3T6yCx2CXG9nqCgIEUIcmq5hhsou7xRo4PI+k64iQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZiD0cQUWBgSVeZMj61yZwweVQv676QyWKDa1DQ/XQ3i/lpu05
	hIOJikzgJecPmXEGwQbslKtaUQJLqcPBMboBgFBgY2vzQn7s3ffh0TUIayJWUWVi9Wk=
X-Gm-Gg: ASbGncvAaCC7UHcvKMy1LSN1KzOQ8sOLxw2ZaneuSStB6F6zC5tpfxCaZDN9uw3vGeX
	98PzK0W2H+1LGwbq07MqlGu5ii0BskkkY1mjdJxx68tN0qpP/YUqrYQWuSAQOY+WF02Tt8309S6
	IoEtW7UCmgkrL+AcKjiMQVUazTdZy6Joma3e5+jSJGT0wrnEq51Lp/7+vTsEUx1m7LQZmQyJazX
	707r/dXA94TjmLzRGWnPc35duNJjwalKarHqiaNN0xbNOEMlbVsUv+5SP6nQ1uC0sjG3j8/wF3J
	IBXgDf07gItu1i9S0usxO77+xKg/4Mkqw4ksbP0aiOmxZzm14ues+LrsirN4pvhe9/69R/BjHBC
	8LoNhDTVLHTJqxB9eias2oUceyIKygYXaXNty1emC1bOXDFqapeW5r/0uEXH69APGbg==
X-Google-Smtp-Source: AGHT+IGPYTEBM7rthUf88Ia5HZrtFvZ/rrQd5/6C2vMcuGkG3ki1p9x7pdGI+whXVL1GGpI4sFIxqg==
X-Received: by 2002:a05:6000:240b:b0:3eb:ad27:9802 with SMTP id ffacd0b85a97d-425829a5a91mr2835454f8f.2.1759851542939;
        Tue, 07 Oct 2025 08:39:02 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:22ae:baa0:7d1a:8c1f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e97fbsm25787403f8f.34.2025.10.07.08.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 08:39:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Oct 2025 16:39:01 +0100
Message-Id: <DDC7B1BDTZCN.D7JXN4RVKYHM@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC 4/6] sm8650-hdk: Enable I2S for HDMI
X-Mailer: aerc 0.20.0
References: <20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org> <20251006-topic-sm8x50-next-hdk-i2s-v1-4-184b15a87e0a@linaro.org> <DDBPGIDN8SKS.2GF6TZC6KGXVI@linaro.org> <de955ab3-26de-43ed-a450-d58ffe0df7af@linaro.org>
In-Reply-To: <de955ab3-26de-43ed-a450-d58ffe0df7af@linaro.org>

On Tue Oct 7, 2025 at 8:04 AM BST, Neil Armstrong wrote:
> On 10/7/25 03:39, Alexey Klimov wrote:
>> On Mon Oct 6, 2025 at 7:37 PM BST, Neil Armstrong wrote:
>>> Add the necessary nodes to configure the right I2S interface
>>> to output audio via the DSI HDMI bridge.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 30 ++++++++++++++++++++++++=
+
>>>   arch/arm64/boot/dts/qcom/sm8650.dtsi    | 40 ++++++++++++++++++++++++=
+++++++++
>>>   2 files changed, 70 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/=
dts/qcom/sm8650-hdk.dts
>>> index 87d7190dc991b11f5d1162aabb693dcadd198c51..1286ce95235d5544322a187=
7292cbdd426298c11 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
>>> @@ -171,6 +171,19 @@ sound {
>>>   				"TX SWR_INPUT1", "ADC2_OUTPUT",
>>>   				"TX SWR_INPUT3", "ADC4_OUTPUT";
>>>  =20
>>> +		pinctrl-0 =3D <&i2s0_default_state>, <&audio_mclk0_default_state>;
>>> +		pinctrl-names =3D "default";
>>> +
>>> +		clocks =3D <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_=
COUPLE_NO>,
>>> +			 <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>>> +		clock-names =3D "pri-mi2s",
>>> +			      "pri-mclk";
>>> +
>>> +		assigned-clocks =3D <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_A=
TTRIBUTE_COUPLE_NO>,
>>> +				  <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>>> +		assigned-clock-rates =3D <1536000>,
>>> +				       <24576000>;
>>> +
>>>   		wcd-playback-dai-link {
>>>   			link-name =3D "WCD Playback";
>>>  =20
>>> @@ -218,6 +231,22 @@ platform {
>>>   				sound-dai =3D <&q6apm>;
>>>   			};
>>>   		};
>>> +
>>> +		pri-mi2s-dai-link {
>>> +			link-name =3D "Primary MI2S Playback";
>>=20
>> Is it HDMI only audio playback or does it have switches to playback it a=
s raw i2s
>> (when external DAC is needed)?
>
> The HDK has i2s lines of the secondary i2s on the LS connector, but witho=
ut any additional
> boards connected it has no on-board i2s dacs.

Ah, like on RB3 and RB5 boards.

In such case the suggestion is to add mention of HDMI here in the link name=
,
otherwise it might be not clear what this multi i2s playback is about.
Maybe "Primary MI2S/HDMI Playback" will do.

Thanks,
Alexey

