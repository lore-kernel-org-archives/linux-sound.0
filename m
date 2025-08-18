Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4921F280035
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519966; cv=none; b=PKjg1T6ZH5Caf+T8etSkuscPwbCEfiOuNm4A0rUodsS+yDdz2ttE8ZG8KhDEhSxGH3pZcItpdRWpixZkIiLGJ6L/iPrn1D4dE9FAKZMnKPb3vIS9l9bY0787ysAGqKC+oBuaBcQjxw7BXUNjSJxi1K+hZcwN1ujBX9d6I8cM1E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519966; c=relaxed/simple;
	bh=7KvajDYvWJjalQ4l/9THQAIY4swE+8ugK9Z1et0TsSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WA/mvCnABJk0EV2fv2q6aSNN/MDt3JQpU4GCDFmGQ5HznkjnG/ZnOsrMpQrc6LSCEfVqZjsPmK/14LFG0YByHJE3JmhqWhyIiGVIpux4gLFin+n1nC8gD4TtgjMESNW8RYKqNE7pMkvHZVQrGbPzhtjfnqu2E5Modwqu+/XoeCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bpsN1Ccf; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bpsN1Ccf"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afcc96bb64eso72223866b.2
        for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 05:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755519962; x=1756124762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tAZmeq8pmlYrW4A5HG1VS0D7sZdBXHMG49sTfa8cmGo=;
        b=bpsN1Ccfqjgh8dFd7VRB4MSDo/s0OaCPz2VVlUlz/YWGd7gacs2eXga12azpZBNSKx
         w9AI0P6FIWj/mjm2Dn4DiSwMxzggKKp6MDGUnn/+GbLTEyOI2sO58qeNQ4ie7CRyXczj
         P1YAi4491r5ZL6eCjmxOK4pKsgrnHdloQfqiOsOExhQiJJtrr40rYKVZTqV0KYbjYajA
         KI6H1lXuDsJ54M5s0Y1w+rI7nyQOHPOOxDP/Ecnd6o3e6B4M5ow3Fs8I5qygotFSqCJw
         J4ISjZUZZ1EaQERjtVBYOEp93q46OvhYQymjhFWGKUSTsuMc4BwSzczvoxVja3PM+X1f
         fGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755519962; x=1756124762;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tAZmeq8pmlYrW4A5HG1VS0D7sZdBXHMG49sTfa8cmGo=;
        b=DJ6oUTCj+3zG801nREwCs4HKpPNsSTwBz4Tk/jB8lcm47GxUM8qT/7ZuaUnJ/dmlxL
         JnYntr8TPmRvgfA7V+hdcVXzcrwVRPTwbDUWQO73EAwc434fxan2f/oDocilvqzHtIwp
         ePWITMIDu7y6sHIdaWmyB4tqFbv0NV9e0/px86QyXf3V3dGxBR6sZ1XOP8CdaHbTXvz8
         HyqyHiYknQ7LUbfwq9pzQnRm+paDU+E12UUe5C1zxlYmcN6zSmw9bmCTUDEGx5yhQeQA
         qKiGZwSYB+64fuq/F+R2JRcvJ5OCr6LY+P/z+BLKpDzgwBHCxjTWDjTl1f0MPjLufIyL
         hKVg==
X-Forwarded-Encrypted: i=1; AJvYcCUOiqWwdfzSJ86z9F2HvHUwIyhxKE+n4SdAp1piGGKdkx+CwdrCQmU3jLqeiAiPeGT2LqbcTbwLnLW4Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC8cIkMK/LR+2YZGkU+oehxrOdzEn0XCNBaXYo6QLSBeoGHwKA
	+wwZbpn76VsMhiuyxPfwV0Rs+NR0qveg3U0XmemHAlQ5Jsx5mmAAF3BRNmMY1v+Be9c=
X-Gm-Gg: ASbGncu++SycCc77c2nLZe+yQPfRv5TBiy7rvLvX47K2WkwD5JUCXZ7WTYT07KkQ35C
	Wnapbp/FATgTnP4fCcRiftGrsY6w7noE4siyT2N9fZYXTBeu9qdTSc3AdbxT5dQxH6v+5xfzwSp
	Lww31pSKL1FP2jhmPF6vRSTjBMa7tkCfjuvzdr8TnuxV+ycFPORXqyiARGZvIUF6FQKvQPeh1y7
	C70Vg27Wrl3Y7Oz2crAZ5GJzBCHeCLLkdy9mHugWRe1G2IcKhk/uuWi5vE8YNdxfJij5NZlObQq
	7+LQK5+cwBSIJaUy4/a79oS3WCRUkNLBBb3I3nqjengCqpq/6cb7ylLNHcPoCXyT3KLNbDbA1WV
	DwIJ9xzLZAEICnZowGaznFyEV/7liisuCAFAD9OgHA7HTYLIr5qgtQw==
X-Google-Smtp-Source: AGHT+IFoRYLvOXd0/rNQvuMSRJ1Y73JHRE4yWCRI+6TS79L5MLfSj0aAF/iDDPk9ov6MtqfUgkTjIg==
X-Received: by 2002:a17:907:9627:b0:af9:a9ea:f42f with SMTP id a640c23a62f3a-afcdc1f4d0emr512427166b.9.1755519962483;
        Mon, 18 Aug 2025 05:26:02 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce73e39sm803578966b.34.2025.08.18.05.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 05:26:01 -0700 (PDT)
Message-ID: <855c21ca-b16b-4af7-8545-992a7b80a562@linaro.org>
Date: Mon, 18 Aug 2025 14:26:00 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] ASoC: qcom: audioreach: sort modules based on hex
 ids
To: srinivas.kandagatla@oss.qualcomm.com, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250818122240.1223535-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250818122240.1223535-6-srinivas.kandagatla@oss.qualcomm.com>
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
In-Reply-To: <20250818122240.1223535-6-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/08/2025 14:22, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> Sort the module defines based on its hex ids.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/audioreach.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
