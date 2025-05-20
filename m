Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C5E288AD
	for <linux-sound@vger.kernel.org>; Tue, 20 May 2025 09:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732796; cv=none; b=jyQZavXoTv7u5NLGQetjJtOw/JPpw17bil8qGmpTf7Nm3viX6utp8IzS6NfH5v1RzfG64CLvIf0/ZhZQ9OG/TdMJhSkEKIbe45VIwEN22HE5NgvVUF3j5hO/aRfxitjkTuPO/6i+O3ahEfBx58TR49axhAilVrzYL/5T+MEqGbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732796; c=relaxed/simple;
	bh=yT/QtvKLeUa8jeXrh71nPfnSeQ3XefPZ6BT+ePGHDck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Au+UOxqOjWAD+mq3xIuJc14nKeOvBzyIA5CmsEGa3mHf/6pSZOct+EVv4tW0QAb4jXtEiC6DsD0Wtm0+EDs8krbzANc2lIJnn/D/sk3Jd4M2BTs8KJ8KqTMDbHrR+JxtvMcfO/0V1jXXKt5aAbuhO9rCRSD8zB7wLpK3B/JGxyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nxFx2pNX; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nxFx2pNX"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a37b5de515so65232f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 20 May 2025 02:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747732792; x=1748337592; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yT/QtvKLeUa8jeXrh71nPfnSeQ3XefPZ6BT+ePGHDck=;
        b=nxFx2pNXGOHxWAfuF0PdXitao9K4sGfYokJQopq2EEuTzAakaYIjoXWWfs+Yl0r+JZ
         UwaMD/YnI7Lqv/omXfr6YMkpNxl7+Yva4xVq8i5HLz9uMm8WnXhhKUYckYyB8OYHXskp
         FMip+ETTaELftkBGcNfVrWef0J1CCVsybdxpbV30I1z+gwlRZIpJaU5XdIYqWHfq/AT8
         wpXVguRO5fOHCriwjJVdSv04mqyZ0EKL8NHJ3nNZzovMD7wkolAR2FMxXvF814VbtShz
         M79cmvWl3n909kbQNz39VDo2l5jKkFqP1tYXvsENVRl4Z+2668Aq/Yd1+QJ2Sqb0J1qP
         CywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747732793; x=1748337593;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yT/QtvKLeUa8jeXrh71nPfnSeQ3XefPZ6BT+ePGHDck=;
        b=hogtCiNVDxYO2lKYbuk659cRpHVxS/vi1hf7epJQ0h+m1NeGyJ0ZL7HYYK2YQW5ApV
         myZ92owTeG8cS6LlNEAHG6EI1fksoMUxuzAbdW1oQ0wTDiWikv6+4FzjI/RGz8p9l+Cx
         u90wMmEUcgF8bDsu+QP0x92Lk7AzYwxBSUS1LLUf3KHbRD4b2b4Co5E/tYMnzMnAJAnl
         UTSwQ83lLcsWsZ9KbWHSZn1fVwAY2Q5eY0ZRx4Kj5FzFv/I3Xiswd3BJ6ncvSvZoggAJ
         nQFTRHjHXijQp9Ar1lGdARqPOA7vKS7kfyTY1SdI7vMLq2ypZ4bNx2vkhq8T8pYeMWAi
         ESmA==
X-Forwarded-Encrypted: i=1; AJvYcCW+d0B/83LNCkrYTn250mLhVUzgDCcB+k867dWxQBUphMHubStpIUR0Pg9aWhK+ye/RojltO/0OQfRKHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC6Ou7oBnAEQRdlAsUcsjfyRaISA104bNObmNL+XNG7sJvtt1D
	yW565zKK2O0k+w8DUxVucd4QCFhsXoxZzhGU1fiTOnrcybKmKv3DoNWl9/sIqUHQHII=
X-Gm-Gg: ASbGnctMbHq36+hpC62ufW3gIip/jQWjmt9DZp50YP+Z3dt8rAaa72BXS2iXIvfINtQ
	0f3OhI6RayCTURRYd1d7L8vcSI3JGoLcw2RqGrM3toEnd1T/qTSA75/w79Xz5snykL3NtaE8V8A
	ECM+RUz7UXuCkIjze89GsuVnQS4C7EI819f5mZp9X9WvARkfjPVdwBu0BBoYzxuW7fQYdV+y8tz
	aokhe0cRKmGac6Wzc+m+NkufFmYxnLYFNGOtEAt6T7E5jPV3oYAgIVMEVEd9KNDZzIGtziBCRLq
	pI1/9ACX5nyuOTn7+FDeNjxRDxh9AUxKf7Q08XMZr/oUuivSmqQpdfRqfJNbw6O2CV8mDx4=
X-Google-Smtp-Source: AGHT+IE0KhG7Byol3rqL9+TUiiilzPQtBPzROXY2nFHPpqSTCakEs3GIZmD5PTaPMzpGGdP9tjEfcw==
X-Received: by 2002:a05:600c:468f:b0:43b:c844:a4ba with SMTP id 5b1f17b1804b1-442fd62fd3amr48271505e9.3.1747732792584;
        Tue, 20 May 2025 02:19:52 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1825457sm24395635e9.1.2025.05.20.02.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 02:19:51 -0700 (PDT)
Message-ID: <eca8721c-305f-4053-8df0-0347cc869325@linaro.org>
Date: Tue, 20 May 2025 11:19:50 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] ASoC: qcom: Use helper function
 for_each_child_of_node_scoped()
To: Ai Chao <aichao@kylinos.cn>, johannes@sipsolutions.net, perex@perex.cz,
 tiwai@suse.com, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, jbrunet@baylibre.com, neil.armstrong@linaro.org,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 srinivas.kandagatla@linaro.org, kuninori.morimoto.gx@renesas.com,
 zhangzekun11@huawei.com, ckeepax@opensource.cirrus.com,
 drhodes@opensource.cirrus.com, alexey.klimov@linaro.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250520091131.4150248-1-aichao@kylinos.cn>
 <20250520091131.4150248-7-aichao@kylinos.cn>
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
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+AhsD
 BQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmgXUEoF
 CRaWdJoACgkQG5NDfTtBYpudig/+Inb3Kjx1B7w2IpPKmpCT20QQQstx14Wi+rh2FcnV6+/9
 tyHtYwdirraBGGerrNY1c14MX0Tsmzqu9NyZ43heQB2uJuQb35rmI4dn1G+ZH0BD7cwR+M9m
 lSV9YlF7z3Ycz2zHjxL1QXBVvwJRyE0sCIoe+0O9AW9Xj8L/dmvmRfDdtRhYVGyU7fze+lsH
 1pXaq9fdef8QsAETCg5q0zxD+VS+OoZFx4ZtFqvzmhCs0eFvM7gNqiyczeVGUciVlO3+1ZUn
 eqQnxTXnqfJHptZTtK05uXGBwxjTHJrlSKnDslhZNkzv4JfTQhmERyx8BPHDkzpuPjfZ5Jp3
 INcYsxgttyeDS4prv+XWlT7DUjIzcKih0tFDoW5/k6OZeFPba5PATHO78rcWFcduN8xB23B4
 WFQAt5jpsP7/ngKQR9drMXfQGcEmqBq+aoVHobwOfEJTErdku05zjFmm1VnD55CzFJvG7Ll9
 OsRfZD/1MKbl0k39NiRuf8IYFOxVCKrMSgnqED1eacLgj3AWnmfPlyB3Xka0FimVu5Q7r1H/
 9CCfHiOjjPsTAjE+Woh+/8Q0IyHzr+2sCe4g9w2tlsMQJhixykXC1KvzqMdUYKuE00CT+wdK
 nXj0hlNnThRfcA9VPYzKlx3W6GLlyB6umd6WBGGKyiOmOcPqUK3GIvnLzfTXR5DOwU0EVUNc
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
 DFH41ZZ3t1Qbk0N9O0FimwUCaBdQXwUJFpZbKgAKCRAbk0N9O0Fim07TD/92Vcmzn/jaEBcq
 yT48ODfDIQVvg2nIDW+qbHtJ8DOT0d/qVbBTU7oBuo0xuHo+MTBp0pSTWbThLsSN1AuyP8wF
 KChC0JPcwOZZRS0dl3lFgg+c+rdZUHjsa247r+7fvm2zGG1/u+33lBJgnAIH5lSCjhP4VXiG
 q5ngCxGRuBq+0jNCKyAOC/vq2cS/dgdXwmf2aL8G7QVREX7mSl0x+CjWyrpFc1D/9NV/zIWB
 G1NR1fFb+oeOVhRGubYfiS62htUQjGLK7qbTmrd715kH9Noww1U5HH7WQzePt/SvC0RhQXNj
 XKBB+lwwM+XulFigmMF1KybRm7MNoLBrGDa3yGpAkHMkJ7NM4iSMdSxYAr60RtThnhKc2kLI
 zd8GqyBh0nGPIL+1ZVMBDXw1Eu0/Du0rWt1zAKXQYVAfBLCTmkOnPU0fjR7qVT41xdJ6KqQM
 NGQeV+0o9X91X6VBeK6Na3zt5y4eWkve65DRlk1aoeBmhAteioLZlXkqu0pZv+PKIVf+zFKu
 h0At/TN/618e/QVlZPbMeNSp3S3ieMP9Q6y4gw5CfgiDRJ2K9g99m6Rvlx1qwom6QbU06ltb
 vJE2K9oKd9nPp1NrBfBdEhX8oOwdCLJXEq83vdtOEqE42RxfYta4P3by0BHpcwzYbmi/Et7T
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250520091131.4150248-7-aichao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/05/2025 11:11, Ai Chao wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically, and
> as such, there is no need to call of_node_put() directly.


I do not see any of_node_put() there, so I don't understand what is the
benefit of this and how this commit msg explains reason behind the change.

Best regards,
Krzysztof
