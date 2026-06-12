Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5568D36A009
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 08:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781253026; cv=none; b=aDTD1O8HqUr1CqJa7p9YVtzSj5unxRwgXzuGINzBNG9GsN06EYPzgFYxcxfFkuvJsPPH3JaIp14+UEGEfba0/26A/WwpsO+MG/opeGyRvxwb9sRgB5VRaTlRfy1hA2ALY5VcDAUiHCKfoZJrv0CBzVBCoPrw9AcW21yo0SdwIIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781253026; c=relaxed/simple;
	bh=WQZeV3uuxuMZ/eFoHnuhbZDCYnboZroqa/RsuKWP158=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Y979aQroyeQiNp17IbV/IGVhIQzJvqrg0TZv+wK8NTmOR1XAnFwl/aiQJd6yjQDtC+69YBwu+JPShXxrZQqhqTmnKWVEr4GKuJRKHIIody76+7ujmXnScIHYZ6oYpK7lNSIKOsZJ3HHnE7dr0HgwhdC3B9Ht2TG6cZ96c2qvL9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TtR+VJcB; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TtR+VJcB"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so528280f8f.2
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 01:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781253024; x=1781857824; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gqvsj5yCApToz/Rg23PwADlEjw5eNlHYXwzCtWvvj/4=;
        b=TtR+VJcBVgikeIMHMvyp3+Ibl5yK1Lt1GG7u9pHItxaSHhOueE8aRAD7Ml6R1lztB7
         DE3n9JtWMPcmMM+QiCJSymtAK50JEByg48lntj34HkaegmxASXcGTmbA4kDUHesYmKfI
         iR1HuKosAC/u4hCgX3q/ckjuo5gxfpV5cN4fH26vRTfzAHCNHrTmOLkAnN5bReZgra9f
         +B/jY4RWgeG1aIYHcqAgXRBPZLAorOaq8vybiR2tmky+NBhJRo1DFLOJWFZ3/B55HWZt
         b0xEPrgsWHk2FDJbe9XzhyJHO5/Tcq1QBzmxiZ7IXlxHIIz9BDpFgTkf7ScNTfkAnNaf
         qEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781253024; x=1781857824;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gqvsj5yCApToz/Rg23PwADlEjw5eNlHYXwzCtWvvj/4=;
        b=kkWq5QAnSRDxCWEKTXeZsMJd4cmkT3aNRncyaC5nMEYiJsWN+CqPYGZ5w+xFUt2FlM
         op9g8l9jerXSaS8TcHneJgOrxfDW3/PJUU8nK31eCMdQqIn/tO74LuwWyx1wTvN0vcS0
         vYxFPn6UjzQ6OyGB5Tn22KrMD6WbKEn2cvbxVEt9mVBx7fLw0Dj4zKw8QUgSQUyladi5
         N5Dny7nbinQNNGbEWeDfWOcjEa+u+EDLc0/aeY17g25doV4ROAVndcQwEPhPWRBepPt2
         djGkIw9RQVEHAQeiAHj8DEHGblMT1+kvFhI6g586jxvp+kpB6RWv66p2fxmCC59bxg7f
         7hog==
X-Forwarded-Encrypted: i=1; AFNElJ8SyBapDJC6fk4N38UkvD5GxmXpAs/4TCUJJH4HEZ1cf2dnaHbrLhUdbBLCrkUrO6sLyR/E8zAHMSv6hA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Ns9X/G5ReA4xFjTFo4v4FKEYrV3H9I32Dv/D7/B7/u5Rf1M7
	UdM/kRyGSlaibHBRszDAP6Kf5HEV0FFp64F08a4WfK9p+ggSqoivoR+Pd2T9g69lLKA=
X-Gm-Gg: Acq92OFJDRT2LK56jhdASTFbUxqtRMv+5uNdGvI4lOAwyLCLARSlhPReARO5b54+ioF
	LWkSQ00etFUG/OGAFu+JpRy6k1JWalCkAdZdvvLl1T2H7J5kXxYFR/q1bm3AmQhjxZeBfqxESSA
	S5oQ1X7cBVoTSAfYAn6DifiOA98IutABEi5Fjb06WvcZy9A+Qmepokp80wzs/EFA2tGRvE31Um8
	dfIvm2hFNfQjzlNFSU+MVSZQBA88o6+ZbS2ZESuToZOh9e86YENeUl55DxbUs0/8Z56pr53SEJV
	do4PTiEySMeBC16m9Huwi4WWz2PwNKbD9z6d26dkfHcpMTUBWE/3CuR9m5rvUPtjMMttLgbDG0V
	SnABGW7VCHJw6FiQByk5Pj0rSYFMja0/t3k+gmIK4UUJa+wstJPDYEIOTVhL5/3Epuwq8Z6LrcW
	dDchPIQQprBeXIGqYlYgdIImO/IzoSyH4IrJNbUCaq2W/Cqgjf4Mo/5CeDqINzCjmPF6f/Y7oib
	WeA4Xk=
X-Received: by 2002:adf:e102:0:b0:45e:e50e:3bc with SMTP id ffacd0b85a97d-4606dba5451mr1747177f8f.29.1781253023511;
        Fri, 12 Jun 2026 01:30:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:fe5a:df12:588e:baae? ([2a01:e0a:106d:1080:fe5a:df12:588e:baae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f3basm3550044f8f.12.2026.06.12.01.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 01:30:22 -0700 (PDT)
Message-ID: <8e1ef34b-7c64-4981-bd5e-33f6341f5aa5@linaro.org>
Date: Fri, 12 Jun 2026 10:30:21 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: switch
 sound card to ayaneo,pocket-s2-sndcard
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, kancy2333@outlook.com, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
 <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-3-18bb19c5ca22@linaro.org>
 <tkgqorjdnvwcx4ddgi5m7j3g6wlawxnm5ugty6y33ftwxzbvv5@uxcai2sgglfs>
 <e7e6d38b-6d80-4c75-bfbf-eef49589ddbe@linaro.org>
 <lm3yngkad2wcw3bfjcsfsmucsekmulhov4c7oygtp3e4f54fhl@lgj7gidpma57>
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
In-Reply-To: <lm3yngkad2wcw3bfjcsfsmucsekmulhov4c7oygtp3e4f54fhl@lgj7gidpma57>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/26 10:23, Dmitry Baryshkov wrote:
> On Fri, Jun 12, 2026 at 09:59:02AM +0200, Neil Armstrong wrote:
>> On 6/12/26 09:57, Dmitry Baryshkov wrote:
>>> On Wed, Jun 10, 2026 at 09:41:47AM +0200, Neil Armstrong wrote:
>>>> Switch to the ayaneo,pocket-s2-sndcard since the hardware layout
>>>> is incompatible with the default SM8650 generic sound card.
>>>
>>> Incompatible, how?
>>
>> As explained on the cover letter, the WAS speakers are not connected
>> on the same lines as the other devices handled by this card.
> 
> The cover letter isn't recorded in the Git history. Somebody looking at
> the commit in a year should not have to look in the mail archive to
> understand what is incompatible.

Will update the commit message aligned with the bindings change.

Neil

> 
> 

