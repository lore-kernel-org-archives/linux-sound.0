Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6772165E3
	for <linux-sound@vger.kernel.org>; Mon, 17 Feb 2025 10:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739788099; cv=none; b=tXeFvJwee5Jm6uwGgttIu2Qnzg9LaC77E08N67zuo/s48KxtUcsWKpbPAfiALoSi//BCPT61B49KoOqtIc/zO77/DX8gEeRQ7W4uElszB+Q33XiMYLLJaWecXTMggsSHMkce8mXiufwX6H2+j4uHSmMUTwQ9gn/YuqTfD2J4YIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739788099; c=relaxed/simple;
	bh=/tbE/6bofLFvTTFaIWPVlRkXqkLFjJy/iQGfTIefy5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q4U8A2MZtqaAC/T7suiHPbGJjT1+Z7OCpQ7E0Vos6EkssvFPN5FXWz9gJOglRyUY81NBpoiUZ7afupL0yt6A33srIkCx9YCxTEh5xw2WaCD3ZXRpP51v4+HAYJAMR8vtv+Azps4D4XmtQYu1MS9dHpv6zvO88wygleagVfSdoCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c9BqSAYQ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c9BqSAYQ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38f2b7ce2f3so2445255f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 17 Feb 2025 02:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739788094; x=1740392894; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x5k0YAQWlcMkdFoy5wN4OYZdW7RLZWqkzJWRxM1XOHM=;
        b=c9BqSAYQJNbTdRubzSqeZTAydVyhjf7FZqJ7sL1WEAw3FmHBeEtb4dBloU029u0IkP
         KznupS+NgmhZhrQ1TxI/Tza4PPGQ4ybAAy+x7qIqml7XAb7sHpwtsr7HNllRRjyTwFH9
         lZX2o5M/rzyNEpzYoeJc9uJcIuItvoQA5RevC6lpKI8dryRoOKznB+J+i9FSVwyceDJE
         AX8vD1L4oogT3K39I5O0adejfYyP8Ya5NFgnpzsjMbCLsDWGMBYaUPDP5YUL4FId/B1M
         Uxo+vfi+VJM89jtmsiGJDH2eDqXvyX8xpjFiF5r+CDXON7l9SpJ7God9ktJvIiXYNqCA
         R85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739788094; x=1740392894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x5k0YAQWlcMkdFoy5wN4OYZdW7RLZWqkzJWRxM1XOHM=;
        b=HxhjvdIPYM8gyMRLytsfnTVcyg+gF0Z1YRY6cdd7lqB6Gv9rspdfoHgo3CdXIUwh52
         GttWmG9lBUzsD5eCAmVC0QcO4TowA9Keggti12babWkKi4pkYOuIR8ZRL9OtjfCthvTN
         7XfAAGSySdwGnriJdvP8lmoYeYi9PqiOIvuZtDhZtNzsbi6TW6s5rOoATYG4n06qDn6i
         5F+Itct08kOr5jamKkr8rqJvns6Fdjh1Io9nuM2+O3rNG3DAr3iKSXVE8x6rHG/diw7L
         pQtYXfbQUrKJxqwe1NDdBBjXk8MwNnfFltIF8Rt2POzrZxz/NTdVczPajLYYk46kdqj1
         3jcg==
X-Forwarded-Encrypted: i=1; AJvYcCV0zJEDYYosy5sFP7Y8HZ29tquWZePAbFONBwIhQPiVBslFMJX+M0eGO3Fm4jKl/ekVjFDqcEot1nGGbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVAjphpT8m+AyJTQSCKHrwkPaR1zlNLb2y9FVLBNg4/FldXhIE
	+O6/eFZaWwy+dAVtJLk3uO92+EC/9oBpPnNY2pBU/jn3CpTX6+k7CJFvuTHDXhuXvAeRkaJdKlH
	T
X-Gm-Gg: ASbGncsFtIKvfad9pCi07B1ooiY7tlxdjm0ItyHRZD3pz6UZVtUONA/bVMIvkw1pbh9
	y+X+FLMK1JmZB+3MVdM56yrMFQ8WIH05QDiamPs5rzkRLwj7rdX0opMIaCn5WB/EEa0pMJlUIpk
	UAOmSS3uzOjTBet2dK3xFJPRW4oo0e8m2aPm74B+LcV/uWMmbk6lzZhllI5rbS7T/9mCtvXckwA
	BBkYd3oBMW2MooGyhlTm7W1CuCU3kC+wvg5uJaGKpE6DlPIdXOrQ+umirPscq41PAQ2vBJFKRTh
	ohtGPjSeOJ+wFFM/ypb0q2wKKMBfhJY60w==
X-Google-Smtp-Source: AGHT+IHpqsdVbmm/HQGzzmmgtWuf6jaTYYJyq1nnyX8GcmtaTiwQE7xQqrOfOpDXWHSh+HLHHuaqog==
X-Received: by 2002:a05:6000:1f87:b0:38f:2c10:da07 with SMTP id ffacd0b85a97d-38f340735d8mr8822723f8f.45.1739788094465;
        Mon, 17 Feb 2025 02:28:14 -0800 (PST)
Received: from [192.168.68.111] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-439831f626dsm22252005e9.0.2025.02.17.02.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 02:28:14 -0800 (PST)
Message-ID: <a84d675e-3b42-4251-b575-9e6a28cf20bf@linaro.org>
Date: Mon, 17 Feb 2025 10:28:13 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: slimbus: Inquiry on Additional SLIMbus Drivers and User Space
 Test Utilities
To: Muni Sekhar <munisekharrms@gmail.com>, linux-sound@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>
References: <CAHhAz+hmga0hLQcGtOjxuB+xoOsJ9xvFvXXUWfe9HpFcMRNUpw@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <CAHhAz+hmga0hLQcGtOjxuB+xoOsJ9xvFvXXUWfe9HpFcMRNUpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/02/2025 15:30, Muni Sekhar wrote:
> Hi all,
> 
> I need to work on the SLIMbus interface on a Linux platform. As part
> of my study, I see that in the Linux kernel, the SLIMbus interface is
> managed by the drivers/slimbus directory.
> 
> I would like to inquire if there are any additional device drivers
> required to comprehensively test the SLIMbus interface on a Linux
> platform beyond those listed in the drivers/slimbus directory.

SLIMbus is used as audio transport interface on some of the Qualcomm SoCs.
Qualcomm Codecs (WCD9335, WCD934x and some of the BT Codecs) use SLIMBus 
as primary interface.

w.r.t to testing, its audio end-to-end usecase.

> 
> Additionally, I am seeking information on existing user space test
> utilities that can be used to test the SLIMbus interface on Linux. Any
> references or recommendations for such utilities would be greatly
> appreciated.
Am afraid am not aware of any tools that are public.

--srini
> 
> Thank you for your time and assistance. I look forward to your response.
> 
