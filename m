Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815121;
	b=2LQXMdp+JmeUFZv85+PjYfU0fsWXEwI9MJxJRnmD0f23UJfinG7hcJGWipXBF8Aoho9c
	 h/I3Gp0Uo+O+EVIlKt/M7Eip/S3lb5IKF2LAcnDMKbLKRuj6UPnNG+S6c0EcLBzz7Xyry
	 oEj3VTp0V4Mcqf8m+nu+ctSsp/vMzRpAH9VqWhGS1iRk559iMNEl0urPrY6CqFqRqa1py
	 8k/fQYJocWlaU938sh/TgXOoFJ/ydk6osa2SMjtZM3Dw+CqGSVATVn0Jx1eS4c6rxQ+Jj
	 aSLLkFVzP2984raEUBr9eO9kgoCKiHdQMGSU7/rRDg0Gz5JFHNdgxCFREM3AUlehC3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Hmm2pR6aFCenUcCKosKBbhm7/p1v3WTAnxJNhw15gtQ=;
	b=1PQEiHhNnw1AUdlr9ifWUgKiY7krjAwC8JckIkzOVm/dDF+lN/EU2IwjASGMMMlkmk7g
	 fXkP5R9I+y/VvCe9yc5e7zSvM7KfNgPoufZPFgW774+TUy/jpYqdJxhKcFZr9pSRT/gUx
	 gScOpsmlGF6OwO7gQCKhINwInzHb/fhNwT2UL7lgqPDAIXLWmYWRByYX5rbtS1TZWxl+E
	 tDraf06VfKKXVZ5O3gCgP0mFljFJ+O0KJBzCOfDztjrcCj8Sw9kUuUTsGkSDRePZUDETh
	 yf6/wHSWf//4OHUXpufwy5wED5TgcoimHEKfHtk8R1iv6HqNnr8x6AGYcLY0kwd2dew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JWs6vy6T;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E97606A335
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 07:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66E97606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JWs6vy6T
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-49465892f7bso2557753f8f.1
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 23:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794815120; x=1795419920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hmm2pR6aFCenUcCKosKBbhm7/p1v3WTAnxJNhw15gtQ=;
        b=JWs6vy6TMMIsDRVSnv3QauUtvNIGyUnrJHjyD00p4NY8uCkqSIoqzJZIUkMBFUogNo
         u+Zs1/CnTQRGeFMiW7bmLvY3N6yo13drRKvXNnl6WcfWk7yoeko+TefFLGrNvxO+BaZ+
         XIihgGquU/ejG+wq5fKaH2uokS9qRmEWoM/YMcFoRKlay2hZiSl314PzNVa1xZFl5CFn
         KS+HO26bDwjcatUMnaF/8r0cevjW2bSrdwnT+0ki9PdoKsbbm2t/e4WAQKO7PxLZsuml
         qdx3TmnmaMjvWzRtuGdhQDKznd7JSXldhwavrB3Th2J21PyMbmikrn5fM7fHbiXGXZEV
         Pj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815120; x=1795419920;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hmm2pR6aFCenUcCKosKBbhm7/p1v3WTAnxJNhw15gtQ=;
        b=Q8tBS+HPojm1q7tPRl9GWq9LH7YxvfbDSIuezJjkDQQuy4Dny/CPUmQZA9GbB/iSba
         2tDn9065LOdYIJxVnaOXezNnqaBpWflli5I2U+T0NsmwYWPR8FNlcVB17T6E6eQVoTF9
         vvqf0JH80KgTIJp7CbHuIIQz7lAtQpQeNQB++L2ulTr+7lz2phJRn57hbswTFl8KJ7RI
         vci5tHMldfAV4ZljJgTGgA312l2nRDcwzNsGVrH+cxjSCnGiik13XAu+1T5JUCc1FxAX
         dfjD8cnH8SQMLiqdIucsvWeJpsxlTbnHnuh7DfW1eSMzYGbwFPrRJUPBFMvZ/9VXA0S3
         2c2A==
X-Gm-Message-State: APuU4Z8eATHNdPlQtKYHGtcdwlrV+kcMpTeOgVoz2OzOyOMpjTCJFHDz
	jv23Cl21Ipbgk9gDwfsv54LwWcp0GgqImZnj9G22MsKZu4q1gKpUNeWuglaTi74ly6I=
X-Gm-Gg: AYBFou36ToLENPkiNHkuDC/lpfD4YDB0bFMFh00T5OlMNqV1UIQXP0guYWTjwi3K0y+
	6SfSr9kGRIlwwfFIxXvaTGLGo0WNWrJcBR3tsA8PvL8soBV/XkLHHmD6Wr/xqPqrY7wKGj6xWoN
	P2HblRW1EpzoMUDfiKLinHkDyvcW58p7/YtPyCm+NT+IWY9xZJhbVBB/uKL8KjO6dblseVsMgaD
	nCCuwAEO36lwQmaCj1D4uWYBfsFcfCSPhj60TIGmk0t/3HtBVgLDF35sEQ9YZNThHLWBnijs/LY
	MMHY9eia8g+hJ++QAg8OcBcpTVG5JjAyUYodJSBjAJRMWWgFBuYjdyVZld40TNXLawhG+B6sixn
	VfmL4NqNrbeG0xuPeXnri8WtZsp/wRXlMTWFaUXZLJBc2IuCfIat/N5qiwQKgqzwRWLMyV3AHIC
	utI2WucaRsOsEkmPs/uvI3BGikWnv+Y5LU7BSH53uK6Gwy9fPtW45dgyPXEbTPnHOq1uoyW0U2O
	PSVpdyWuMoC6ARYfxehtzmK4YFgdWkW/zQSvA2jaH+8HKZeRvlO2m5mv58yYNSIpFrvZq0LpO8b
	FXoiaW+TKsfErMf5oHC3asCoLGjCigrx6K3HSXdD7eYtez+LHwIy6/4qWN7cqIFPIES2w1M1tIU
	NEEpPmfq7
X-Received: by 2002:a05:6000:2407:b0:491:6a7:b4ac with SMTP id ffacd0b85a97d-49c73351512mr19406434f8f.56.1794815119670;
        Sun, 15 Nov 2026 23:45:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm21048578f8f.56.2026.11.15.23.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:45:19 -0800 (PST)
Message-ID: <d27f1aa7-9765-4a22-ac78-e6dfc0c97556@linaro.org>
Date: Mon, 16 Nov 2026 08:45:18 +0100
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 03/23] dt-bindings: pinctrl:
 qcom,sm8650-lpass-lpi-pinctrl: document clocks and power domaines when ADSP
 is not used
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-3-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213493@kernel.org>
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
In-Reply-To: <sashiko-outbox-213493@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 20:02, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] dt-bindings: pinctrl: qcom,sm8650-lpass-lpi-pinctrl: redundant
>    oneOf in clocks
> --
> 
> commit d8422bb265d6e088cce5d6024805eb9ced00d38a
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> dt-bindings: pinctrl: qcom,sm8650-lpass-lpi-pinctrl: document clocks and power domaines when ADSP is not used
> 
> This commit updates the SM8650 LPASS LPI pinctrl DT binding schema to
> allow a single core clock and add power-domains properties for platforms
> where the ADSP is bypassed.
> 
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
>> index 1bf08860a4baf..4c54f873199cc 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
>> @@ -29,11 +29,25 @@ properties:
>>         - description: LPASS LPI TLMM Control and Status registers
>>   
>>     clocks:
>> -    items:
>> -      - description: LPASS Core voting clock
>> -      - description: LPASS Audio voting clock
>> +    oneOf:
>> +      - items:   # for ADSP based platforms
>> +          - description: LPASS Core voting clock
>> +          - description: LPASS Audio voting clock
>> +      - items:   # for ADSP bypass based platforms
>> +          - description: LPASS Core voting clock
>>   
>>     clock-names:
>> +    oneOf:
>> +      - items:   # for ADSP based platforms
>> +          - const: core
>> +          - const: audio
>> +      - items:   # for ADSP bypass based platforms
>> +          - const: core
> 
> [Severity: Low]
> Could clocks and clock-names set minItems: 1 alongside the two-entry
> items list instead of using oneOf?  Because the single-entry ADSP bypass
> list is a strict prefix of the two-entry list, minItems: 1 avoids
> duplicating the first item in both properties.
> 

Will switch to that
