Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3731531C9
	for <linux-sound@vger.kernel.org>; Fri, 30 Aug 2024 08:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725007065; cv=none; b=HsHKe1H7FEJBaVHWi6fIMSdyL2mpdRcQr9C51q9vifyixw9wa2KUETffRmvCBiXA9cg+exRq1WigBLtJ3az8CAvfwvVZ3epBXd0UoAKUzW4b3x6xkBAq7z7tGBHr97hrhdoJfxreieDjBvUdv/PTQe9DhdY35/iaTnMF2le7tOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725007065; c=relaxed/simple;
	bh=ghVIUx9TaJyMm4SETqSo3lqEOUOm5837gqrdXGcmX9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RIaNZD6myT0Y3DxYaoMGzELALmfztGpD7JBpnPktRbhKj7jCNvESxOJaqUlOokhkb1KyqBq0nNFSLMLsVq9PXQvE7A+NTyebhLaKhxspyFKMPLWax2QD3H8RMfw1aZES0H6xKZi1PyS0D5ukxREMxWyfTu4DIJCPEPXoSkg/B1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=vJLcx0aX; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="vJLcx0aX"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-58ef19aa69dso1456961a12.3
        for <linux-sound@vger.kernel.org>; Fri, 30 Aug 2024 01:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1725007062; x=1725611862; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tz5xgDVzbjElSEwTue+4JQ6a6tFd6FbY1QoSeaQ1ceo=;
        b=vJLcx0aX1ng52gTR8fxVouBeYaI7CRVJ+/pM53CpY/zwa68XMNfj5y8042L1mdruyw
         9r3zhrGeUqm8oYxln9dDEtZfUNlBlMcjLyF8fBCLuoloct6Zxow6HdMl3PQh4hOv3R0P
         CfvJfCWkLzFOiwNMay04j9z+9Pr6LUjlpX/nzJ9cH7tBxOnuMXwFEGVvmMpEyf3euHaL
         CSS2rd3MAcWvqdQAdDYU+yfEm0xnxo3Mghnd/Wooywt3jvB0g+11s5mPTNXchm8AXZ+J
         lZ4mqSQWGK6L4bFazyzwycvJMJz1T1WHhcYKgDvd8OPAm5Xz1O6dqYJ7yBah3xLmS1pb
         zjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725007062; x=1725611862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tz5xgDVzbjElSEwTue+4JQ6a6tFd6FbY1QoSeaQ1ceo=;
        b=tjpvXjw0JMS5L+nRa+NJKZkz75JdgeTAOl+udYwoWoTDhs3aJn18gRRjkaQpCrWpmn
         2RyXP+l+e5QZfqKO+lljwlNsSibJ7fOxQPq4R/xIwZDt5+/+azzedv1jXE++B7xb2S++
         pxWT5kACXkk5qNxL8lLNdrHDlVf1fcS/EWCkTxV9l0qCRKP9CMvUiJNAvo1qgPTYGt5B
         00n0wpZyNgduXOAJuvyGHo1lVHCUmYrwZMYmCMQUPBBHl0ql7SC/kK7ljFOfa49C7XLt
         UYQfqnarh/Gux7F1khDfYh3+cvKzwc7Aiw8zBq3VgIZnQRUZizYhdloQm8saf8NAd39E
         /a0w==
X-Forwarded-Encrypted: i=1; AJvYcCUKBIfod82UbrEsJWAJcukA3Qtg3vYYelShg0JWIBW7fDa19PqKPXxJ0/pzvDWYfzvAm178RIaRWxrq+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBcCVKanx6I+78wcaFEbJ2PZIkDNHTsaG/YPJfjYptQlgleB5h
	Ku8YWoiqvyA7QSNd8oZyPznLh3AUWfvzCqwHBHv2tYU3gKfPSNZ5RWS5j5yJnzg=
X-Google-Smtp-Source: AGHT+IHoWfq/90PKtaBCC6Uhi6DqQ09Ism7NBj8fzh8R+arnT/DKgjvjTl/SHIkJT75B9ohmJj4xBw==
X-Received: by 2002:a05:6402:3493:b0:5c2:2b1f:f757 with SMTP id 4fb4d7f45d1cf-5c22b1ff81dmr2599958a12.17.1725007061676;
        Fri, 30 Aug 2024 01:37:41 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c7bf90sm1674423a12.43.2024.08.30.01.37.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 01:37:40 -0700 (PDT)
Message-ID: <0fcd3421-8086-44bc-b24f-7fb2262a675c@nexus-software.ie>
Date: Fri, 30 Aug 2024 09:37:39 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: codecs: lpass-va-macro: set the default codec
 version for sm8250
To: srinivas.kandagatla@linaro.org, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, amit.pundir@linaro.org,
 dmitry.baryshkov@linaro.org
References: <20240816091210.50172-1-srinivas.kandagatla@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20240816091210.50172-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/08/2024 10:12, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> sm8250 and sc7280 have lpass codec version 1.0, as these are very old
> platforms, they do not have a reliable way to get the codec version
> from core_id registers.
> 
> On codec versions below 2.0, even though the core_id registers are
> available to read, the values of these registers are not unique to be
> able to determine the version of the codec dynamically.
> 
> Add the version info into of_data, so that driver does not need to use
> core_id registers to get version number for such situations.
> 
> Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec version")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Seems to be fixing the reset I've been seeing on rb5

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

