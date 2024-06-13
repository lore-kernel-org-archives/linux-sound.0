Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FC8142E7E
	for <linux-sound@vger.kernel.org>; Thu, 13 Jun 2024 11:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718276694; cv=none; b=lUeu3zKxC5sh+KBYXeEmQvXocQY2oxqFDAAqo5tDoUbx4Es2NSS0LpdKU5X2MbLUKXFawLTQ+rGId0kXiGwSnDKhWe5m0DopZpisUkdoF7fbTx6BpreDJeBx9uANcX1s1dSjJWHbY/CR9gLe6/F6Gr6+TTTzmzfyPO3mIYnMgSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718276694; c=relaxed/simple;
	bh=tAcSgvKXqfnSUFX2CtxDigGjnUYTBy78IoinGdlH2fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gk5ywmqPD6vvkv1yV9PxcN9tqh8zyTxyGIxwjTFQet3NRz9sj5GZg7zu6/qWrruU8iP1KSgVySC/08VNiBvj511kIl/94CyKTnELOj1PJMRwKdm+5CsPk6c8PpiIGvNBk99wdqxalyTgdser6fsckoemLenIoKhwjSjt/7pdfWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w4xBmUY1; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w4xBmUY1"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5751bcb3139so843254a12.1
        for <linux-sound@vger.kernel.org>; Thu, 13 Jun 2024 04:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718276690; x=1718881490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r05GSGoeixdTdrkrNQk/uUV5myauBem2SPDkvyRDYgc=;
        b=w4xBmUY1ZJlIjBu16PzN8sZaXgkMZqijgAdXFvQWwFJBZ2towBcf+TEUgIUNrLAD4U
         1cvWhBKoj8wd7QY3XyPGjA+HmL2OUzXk2np8ayObVlZw8UKfOptdXsVmnIVxmi+kOOhv
         KEAPweB709bz/I/N6lVo8b6fiwDS+Xi+HYL3fqwXRTOPtjmJlndtIm+UoyFSjUzdRoAS
         HPs3nVNcc4hFM3K8qv9r62e5AqK35r7HquKA20Tqh8Ey97mRsMmgdvsyHWkRUly3AbRA
         WvMCd61dPGvXp6IttJsP2Tn+NMa5TKqSE5W6rJPVXBlo5VQmtMzd7sCZGfpwvHjxjIvi
         PWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718276690; x=1718881490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r05GSGoeixdTdrkrNQk/uUV5myauBem2SPDkvyRDYgc=;
        b=Guz672D3NrjWA4XPQCCGBCvM1yhvwkidwwQ/Akobs4PlmHD1Bs2lxZ4uC/5OjCz0U7
         C0ldpB9a7LE5uD5e129KbzBsBfP8I4i1Jc7iWdudrX6wvz78bEbBVE732eDTcK7va9uX
         lF7JwR5RozAnHyRpOksB8JnP0cvlx6WqpvhBm1yH6nzMsFGklY4Hjp0pc8JfYUbmJAnB
         JFvDGAh1cnnKrUSLLdY4w0AS68vmKAuLEMNbU4lqxm7JRneaX7fKL987DLq98j0qK22t
         qcqpnzaynx6VqeaaQa9khSstM1bIhvNmR78u8/CMnRfY17LwDVDolDyAF85Kf2LHo7Qb
         NQHg==
X-Forwarded-Encrypted: i=1; AJvYcCVCLU8YHslLknDiEFDVdZvHTIgnrwBiTZTvbBkh1MoXzbRcd3DpK9hfoAvFkb9qZnlWiBbL3fCG32zvPkz/33SX2seQ8Nb7njYYKRM=
X-Gm-Message-State: AOJu0YzeCWpuQsHqxxh3VgbeSXAhkOj2rSzfpr5DOZR5COFpohrBGSfG
	fUzpRbSN7VW0m1dsvWW8OiQLE9yapF6g7lbI+aVrLFg/lcM2NkYPNfe6mtSFalQ=
X-Google-Smtp-Source: AGHT+IFZMCZjqTdFJ+VphErIaK9g4laFVqVLl8sNw4G7xzHX0fkq7AQsk5RVkxZ0AbcMTIBCZQzPyg==
X-Received: by 2002:a50:d7d9:0:b0:57c:5f22:f9c1 with SMTP id 4fb4d7f45d1cf-57ca976a4e8mr3004561a12.21.1718276689646;
        Thu, 13 Jun 2024 04:04:49 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72da37csm768974a12.27.2024.06.13.04.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 04:04:49 -0700 (PDT)
Message-ID: <93b2de4e-dc2d-4781-9c1b-d6ad6d888eb2@linaro.org>
Date: Thu, 13 Jun 2024 12:04:48 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] ASoC: codec: lpass-rx-macro: add support for 2.5
 codec version
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240612-lpass-codec-v25-v4-0-f63d3676dbc4@linaro.org>
 <20240612-lpass-codec-v25-v4-3-f63d3676dbc4@linaro.org>
 <a6793126-ba1c-4679-a2c2-eabad4f5a506@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <a6793126-ba1c-4679-a2c2-eabad4f5a506@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/06/2024 12:00, Krzysztof Kozlowski wrote:
> On 13/06/2024 12:49, Srinivas Kandagatla wrote:
>> LPASS Codec v2.5 has significant changes in the rx register strides.
>> Due to this headset playback on SM8550, SM8650, x1e80100 and all SoCs
>> after SM8450 have only Left working.
>>
>> This patch adjusts the registers to accomdate 2.5 changes. With this
>> fixed now L and R are functional on Headset playback.
> 
> I was just about to respond, are you sure this is suitable for sm8450? I
> looked now at registers and sm8450 (which should have codec v2.5) has
> old style register layout.
> 
from 2.5 the layout has changed, I have verified it on SM8450, with and 
without this patch, This fixes the issue one speaker issue.


--srini
> 
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> I tested earlier version of patchset on SM8550 and X1E80100.
> Best regards,
> Krzysztof
> 
