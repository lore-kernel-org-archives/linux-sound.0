Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A6219DF7D
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 03:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740540374; cv=none; b=bYUBhDlpNhSpg71G8Le0nAMKh/ZUKAvvh4bcrFEtIV5FuacTkrn9AnCQZpGMcvuypCfnPp3+ezgp1sTbdNaGZcntHSALQfpa6GUliNHWgSPjsLpHWNA+Sgy1f/nHDEu+wIvcoNBLAEPU/uz3p3SsRN/l6Bm68TrQJvZ9OjzHpHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740540374; c=relaxed/simple;
	bh=7ugxf3Hr7VHFLqFT8FfHTCt0eEAoBcRtc+I9CB0bCbo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=OeB3hw+xlAVh/4TvWZEsoRfYmmZI0ejB67ja+saznYIoJSojQ3n5ajZAMLKd8Ct5UE4WAUkMttm3czDd7TwYhQTkmjmAxmy1z1JhoY1cUshDeGqIgYBVadKNytA/B7fsL1phz85ZyvOiwYnmt4rk1+YavBgQ+OuARV0Z/h0GXsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Iw2m72lR; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Iw2m72lR"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38f325dd9e6so3299980f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 25 Feb 2025 19:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1740540371; x=1741145171; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z38vvOItaKSKdw0zjiRiQZAYW+AwbxDXAd+r9TpA0I8=;
        b=Iw2m72lRGjNlvTVfFUd8IoceEVBbnDrG2pF4KyY5JxNTlAh4IAMoU3ciz5PfNLuq8L
         LBRWRAynahgdLkTA1XheTCMGIsEHMUv+VzF0B61aazyJ2ek6Zp5gyTWuJmvLJj/p46wU
         Sru2D0tpEVrSF/5ZmoDaEPMzOYC5CntPXyKdRRSrKWADfNL8KohScZTnPnOHysIVEXkO
         36T9j/V1CDACM0s8yM6HfdvUZCFpCMKK3ayuLc0X/A8nyPWbk6dWa4i4U2YrfR2sTxfl
         5qqDS/3hb9UA7kpN0gOStpTCMLfRas2d0TaaXlD20JsxQP4iwzJUT82IkqXAgz3Ov6cb
         sc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740540371; x=1741145171;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z38vvOItaKSKdw0zjiRiQZAYW+AwbxDXAd+r9TpA0I8=;
        b=AYEmS/wWy9NZGCDTMOJlyy1JGd/VcAiU4vkzXmx956v8YzCAUy06kEDlUu9KZ8a3F9
         uAdzk6TH+Ve46NONLtQLNMb7H9gN7n4Cf7TAoSgPGuroO/wNhHMt7H2COtMcMkTf0r9X
         U7hcYJ+D4ajZLq+kob0PQnGzgnyMw5biLswTjJY1GDk1VxaZgNpuN2oiwTIH71Zrijtt
         MZDjXoSF8e2le8Uzfav6syHjGA271JVsHUW3gJnjoDwdQYSi867fhEhX56w0Hkt2BnzR
         ij5DHzENhSu4vCxA0AcdWzeuJggocmyRSZeDTvsfk2iHrI+HWOiHwvQmQctlBKYi2eAQ
         1lzw==
X-Gm-Message-State: AOJu0YyyUleiuL37CKVueftptrDnf8yRrzdL3Wv6cw3DrmvBIGjoq/h0
	fA1lZBucw64MiLNA1401lCWgbNikYi5v7awJ3pRRG3LmHNeB8i95OSwhKYg2
X-Gm-Gg: ASbGncuWc0CKGCxEF82dUCVW5vl1Q4CxZsSkYVXtdgCYB0dKeg4UJOiFfcYIK4/VqT4
	1IJsz/ooBDWXd8u4X6fLKo2tmB0wf5rw4K2BSfrMaE2ZFQtBCM9WiotPEaVh2SRPXzC8VozKtt2
	XttGl1q0avLwG9UWh9EOW10NOXGnSwRNN/0ShesyOKK7BsFlZPQbvewzdZmyvZNLfm1/t0TL4HG
	GV4bOBCqmGbJ0Cw6SGmyD32jeecPbY9Uqmtm0J47L1bitfEL+N3UlEEaPGqUBkcDWuN+9fZveNS
	VQOLJBkmQraVxR/++9XjMxwEAOc1AnIuzwXXr/R4hhsAadKOVnrVbE4u1nxkcRkrjX6Xw50YTQ=
	=
X-Google-Smtp-Source: AGHT+IHa4NjqwHsUpVaHaWXRGqmcqg74bTTiOvqApGCRvcX4kfTC/tPeupuRZnK85kWIG0520mpgBQ==
X-Received: by 2002:a5d:59ae:0:b0:38f:30a3:5208 with SMTP id ffacd0b85a97d-390d4f8490cmr1216329f8f.39.1740540370527;
        Tue, 25 Feb 2025 19:26:10 -0800 (PST)
Received: from [192.168.17.17] (p579d906e.dip0.t-ipconnect.de. [87.157.144.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd866ac4sm4250429f8f.15.2025.02.25.19.26.10
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 19:26:10 -0800 (PST)
Message-ID: <e59495a0-c015-446d-83f7-5f09686b0bed@googlemail.com>
Date: Wed, 26 Feb 2025 04:26:09 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-sound@vger.kernel.org
From: Amin D <amin.dandache@googlemail.com>
Subject: Added support for Presonus Studio 1824c
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,


I added some basic support for the Presonus Studio 1824c Interface in 
the same way as the 1810c is supported, just with another USB ID and 
renamed the functions to support both:

https://github.com/blodone/linux/commit/4fcb586c67f322d983ca3c28759e9e2bc9ced139


Also this is my first commit to the kernel and my C skillz are currently 
limited so i did not try to distinguish between the model cause it 
worked instantly and the model name is displayed correct in the sound 
control (ubuntu studio 24.04).
Connections with https://github.com/magillos/Cable work and only spdif 
and some advanced functions i could not test yet.

But i think if it's supported more people gonna use it or try to get all 
features running if some are missing.

So should i make a pull request or is there some code checking and 
validation needed?


Best Regards,
Amin

