Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB71D1B0439
	for <linux-sound@vger.kernel.org>; Mon,  6 Oct 2025 03:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759722937; cv=none; b=EUoRxt6F5VjBl9MndjNL4WpNP46ObFnzxxHssRLruJIZLzrylH3b0iYUNo8VLCidhT3oGVOw/2mLCNgJYdTTFn5jluKwQeMScrjw2AWI4+pFZBCXiQ9aq5WrfZ7mVx8p0Fpbq0YLM8zybmXoaIqe4Sxj8i17bSeHjMxTS1TO3G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759722937; c=relaxed/simple;
	bh=IVzci8UetoGcUjNzr9XskC+74VZiAYmvJdcqtTP8EHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oslfq/cEi1TtDg4ZYvXK6JMyKm76bMcKXkIwuRlDJgvJLfbRKHISQkzVKDcWTrI7a7yfUEVxAhULsPbh47gTQ+LFs48ufMrgsmlUbKc81uelKx8uxhg3lGKqPM1abDhlUJhzTegiUCEXNf58HOijxjFaMDeOQFagoFyWKA9Ofzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nq1VseOm; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nq1VseOm"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5d3fb34ba53so3870501137.1
        for <linux-sound@vger.kernel.org>; Sun, 05 Oct 2025 20:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759722935; x=1760327735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C4nyrG89q4JAPsozaOvAY1jJU52pK5NiRjM5aVZTpKE=;
        b=nq1VseOmDCFOR65PPSRuycvbH/2N+tdXKp34soo9CtpK7L8Qw0W5HIV0A2QRk5B4RJ
         QVDyxB0gX7vfS3FBCiALzzFGLIYZ6rkVVsbOAvfLMvjFXVT2747NWI89uqv/aG37I+wq
         pDDDUtlF+m70K9h+zud6MJHYcC5Ksx4uqEodqq/UkDKggNvMqZ7rbeD1+df2h5FPIylg
         6dP+CiNz6QID5DM0tEdYcPqGyuQUXtNmqvZuZxVsh3s67MbNIp8XwfCOLVU6gWkr2bvN
         QQy28PpVBv46e0e+9/g1ldNLqIMQgEqorreUfedsNp5LUKWcWAyXX+ogzy9IB3JiC8c7
         LcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759722935; x=1760327735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C4nyrG89q4JAPsozaOvAY1jJU52pK5NiRjM5aVZTpKE=;
        b=hQAlGlng/6UE5GZQjLpK29QtmS0fGPFil/jyImhs4HwcxGta8Bth6nFTNLlfOJhqq7
         J182jf67Tqa7qCsh5Gjl7e+WP81Yw8fG7mzxP1WPFPg3MJ4uotRdn7rpXeQ31msj+Ot+
         ltCet1cEUniJfnED2DI1tWdcdK6Z5IGEsTB7fcFdxUvRHPM4e1wMZr/4+Jyr7Pr/iVuC
         FNmn8W+DUGwRvbnaUZCZh3ZK58lJ5VRwiCs69G8VxGSh9xTaSTS5GdxrfRxcymaefnX2
         hn8yPXVl1NgtawYe3Af2njYQwGehJxRYwnjAwws0DH6M46ofpRNAwY80wBJ1oIBDfOLr
         UkIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUCSwtQo8Vahrw6Xkjizn3jG0u2BqZaCq1ccJdn2z8XDP17kWeTnk7nh9f4jujtqxsXosMMzjdpuAwLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfjXZRUfqWkn78ozqxye8viUmRwabp/P2p3+XEfWu1F1HYGiur
	RgPBbeLhE/HWBsiAv4YJMf0CpUxLJJDrPYW2f02d0IgqrBDhIWwMyLZs
X-Gm-Gg: ASbGncuuqtCL4Wl83q5Y6S1AmMTo/a5MRTvGnq66N7T/eqy8QPtJxVG4dZszwrQ3uBK
	dO0DwTuwzBlM3bulwmAMOsDl5d1VtZFxOJf6tYyASa1RF5F57ggdVjDIH4hO68Fq3cMe03lDusc
	VXp/NbZoIsz1/YpQ65xENv5iUJhg/hvNYbAZdkeOGUV8bXw0LB9xDW+TuY5t7J2lfRvZb+WUEjz
	hzxm886PLZx78EFuoJznaJ/RvRJ480e0XIsrEjBAYhS2WEe5YZwpHQ+/RRo9+FP9vtDZURGUHrq
	8pPMSeHkzSu+OSkgLa0Y7GatmKaD6/CcFj+ZZtJOExffsiFkACAQL7GEfgs/TQkPaKJgM0xLIpE
	R3Ctz8SrwaSCsZ7lfOom4BLYoSUbhDlN8U0/gmACQbU6n1VL+nydCU2mA40vEcl6ck8nLwbXhTg
	==
X-Google-Smtp-Source: AGHT+IEM8YkzBfOFCcp56tbV9hhF70WPBySWeJNMA9HNLTpJu46u5ZW+1WmuFW5gSBnLYg5FkBvDOg==
X-Received: by 2002:a05:6102:5347:b0:5ba:4f5c:874e with SMTP id ada2fe7eead31-5d41d16e253mr4258765137.31.1759722934712;
        Sun, 05 Oct 2025 20:55:34 -0700 (PDT)
Received: from [192.168.1.145] ([104.203.11.126])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d40c6c7e73sm3130870137.15.2025.10.05.20.55.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Oct 2025 20:55:34 -0700 (PDT)
Message-ID: <a6526df2-2861-4142-95e7-1c6a83321ac3@gmail.com>
Date: Sun, 5 Oct 2025 23:55:29 -0400
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sound/core/seq: Initialize structure pointer to NULL to
 prevent undefined behavior
To: hariconscious@gmail.com, perex@perex.cz, tiwai@suse.com
Cc: khalid@kernel.org, shuah@kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251002174301.15512-1-hariconscious@gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <20251002174301.15512-1-hariconscious@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/2/25 13:43, hariconscious@gmail.com wrote:
> From: HariKrishna Sagala <hariconscious@gmail.com>
> 
> This change ensures the structure pointer is explicitly initialized to
> NULL,preventing potential access to uninitialized memory. It improves
> code safety and avoids undefined behavior during pointer dereferencing.
> 
> Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>

Hi Harikrishna,

Thank you for detailing your attempt at testing. Unfortunately, your
patch makes no substantive change. The variable you are setting to NULL
is assigned before use, so there is no risk of undefined behavior.

I know this can seem discouraging to hear, but I do want you to
encourage you to keep looking for ways you can make contributions.

Thanks,
David
