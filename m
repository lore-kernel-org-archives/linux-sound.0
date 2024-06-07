Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9031F1847
	for <linux-sound@vger.kernel.org>; Fri,  7 Jun 2024 06:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717743377; cv=none; b=kLQ74H9eEmoI75XtBeCXVVJbHLudPkZSof+6qNUD89UaVKZtrRThmrbdbwX/2bsG3nKu8p647u3igJZ08ZQRtnsFtTz2aLS6ZdIMueEb1l9OumqVhrC6L8xTBJf2JKgzatahQUapXN0dEI69X0EepkBB0nmyHG+kIt9xq/8awpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717743377; c=relaxed/simple;
	bh=wrTTn6IscAXLTweuB9ogEuvEdMC0oy8USnmI6Umi4iQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AtMEm2juWCawNDNBh55yPUpbuWc2NDVtomxEVt+zQ7Sf7HEV8mWFVB6W/Zeq3t2HCVPDNwXwwGMvksIwSPOYfxxTP0fSV5l/44/CD486GUbLilhS28d8HjN5yDuPch4dzHTNEewk6P43hkuGcgo6yJ6405CdlOiPVmHsIf26F3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=npy3DAGx; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="npy3DAGx"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-356c4e926a3so1642142f8f.1
        for <linux-sound@vger.kernel.org>; Thu, 06 Jun 2024 23:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717743374; x=1718348174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+n1UbeKOejJyQ0EsFqQB0hecGgVTeSZSMyL3P00Ii1E=;
        b=npy3DAGxRua1DGPn0Sv4tFYmbUNm6FG5lxbClogXf5UwfFEOJhZt/QOn+YkbVwJrC1
         ENLwDtItFF4pph+zV3ru75G9Dq6XCZkAzQBSH9VJ71impeVDKlAMj1Z4nirC+kzK9Iif
         GUKYn80TpSHpKMIzyLZdVefSAqUB3BIEKTe0SFS59afkBbHKnH8qg42Kk1DtbjgfN6Uq
         XscCwxP0T6ngwUfqfKX9hmTBVECjFq1l6OQbJzRagUnK8Nd8xztviJoG1zxSEzM7PeRm
         45oMhpWxPuAl+b2TehSU3XezKKsayyiy0Wc+R/3fadyDayZ8OKwDvjDIPp9Z/FoX5YqM
         Nvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717743374; x=1718348174;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+n1UbeKOejJyQ0EsFqQB0hecGgVTeSZSMyL3P00Ii1E=;
        b=c6eivDm1UiTcqAg6KlIFaPohP7vGQJGRQ7ZM5vpvM1Is2CdPTEZbyPO8k2XQDuUFka
         S4nmELDo0Jfu/I4MdQZsJS3kBf6UsWCuooSoYN6LWDnM3ojEJFVGO4BHF6LVnGe5gyHT
         i5t2HSzNzQIExQjDpDxp7iUVzXZ3Qss+R46QM7LLgWYZsrF4C0PZctvujDgYgpVqztx7
         O3kkd78SahsuN7/oqB5TOKuWAlfbBi7/IwgTglJdkZB5f7gHVC3oCqYGFB0UuxL6mhU5
         get058QvSxl5PUs4fvVW5m8V/76YsLmskJnEjjT/FGO+KIEtKppE/6MkPK5kcqjFrtpp
         qcBQ==
X-Gm-Message-State: AOJu0YxMHWDTxth4Kp/OzQDz3Gr2kG4/waarPQ6W9rUEU0qc9kBCoYHA
	fCrxRnBLOzRdf5A8n0GgQKrGKufLrmh1oGKVmSMtKlC+88n6Z8g02JwL8EGv4yY=
X-Google-Smtp-Source: AGHT+IHAnFvsJMX10rtGGRSCWAG59PxgESy1x9MXcjGORvB0Q46JVDA2haec2hIhIh5gy8TVv46KUA==
X-Received: by 2002:adf:ea88:0:b0:354:f359:7355 with SMTP id ffacd0b85a97d-35efed07c42mr1240127f8f.3.1717743373907;
        Thu, 06 Jun 2024 23:56:13 -0700 (PDT)
Received: from [192.168.2.24] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d29c37sm3338413f8f.24.2024.06.06.23.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 23:56:12 -0700 (PDT)
Message-ID: <b98dc404-1cf3-4042-b6aa-45995cc12294@linaro.org>
Date: Fri, 7 Jun 2024 08:56:11 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: dt-bindings: mt6358: Convert to dtschema
To: Kartik Agarwala <agarwala.kartik@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240518081621.63386-1-agarwala.kartik@gmail.com>
 <c05f91f5-a878-4f36-b325-0ac8e038a7e5@linaro.org>
 <c32b902e-0338-436b-85e1-827c48e0ee2b@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <c32b902e-0338-436b-85e1-827c48e0ee2b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/06/2024 16:19, Kartik Agarwala wrote:
>>> +  Must be a child node of PMIC wrapper.
>>
>> Did you update the PMIC wrapper binding with ref to this?
>>
> 
> Hi Krzysztof, 
> 
> I apologize incase this is something obvious but I am still not sure
> if I understand what you expect here. Could you please explain this
> a bit more? I thought that you wanted me to convert the Mediatek PMIC 
> wrapper but it already seems to be in DT-Schema format.[1]
> 
> [1]: https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/soc/mediatek/mediatek%2Cpwrap.yaml

If this is a child of some node (PMIC wrapper), then parent node should
reference this schema. Please make the parent example complete and
validate it. Otherwise above statement - must be a child ...- is false.

Best regards,
Krzysztof

