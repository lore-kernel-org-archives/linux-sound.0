Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79280226D18
	for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 13:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762955435; cv=none; b=G9eRIRoHhVZi5uJ655XgQE6xeRWfnnJB+/VCUooiGdrRqNJCRITI76CT09Hokn4+EXD93lEL9e75LPaPlGI1VN0PnONYGVX5JlSBNezZHpbvSe2UjKp/StfyMzGBZR0QVwGhXn1s4FhVdZ6flPATMMi3L9Jo6SiBNCV3MuVdvaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762955435; c=relaxed/simple;
	bh=q23PTFUGv3McLMSbUMXGzBKmTnxMWxQmminnmHICve8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NNLiEWu4d4zcT1V/CISfFSAnZta+HAb42rbXREHo5NG47aVhHIEEv4NzTWbXlGRINSiwfxk6TVIK9hIcEvsXHx9lLppJM9wEt6ST5iWyUSPpuf2KwBFskvOB129ZOy3XAcZ6zD2wh3pk+hyy5bSDWmKoTGmkAC3PoRQmQ87MEPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ig/ZbuSr; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ig/ZbuSr"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477549b3082so6997465e9.0
        for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 05:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762955431; x=1763560231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIU6mTVT/9hNLX+UgvB1zHOKbS0kmwHXqjF+H6qseTo=;
        b=ig/ZbuSrMSn5EqZ8J6RWicwah8ToOBdjqMorEEbK31FPeZs0m0uitGjhwD1OMLOofL
         pIiLgf5xbjNKbDrnKWOJIliAgqIDJBF7q6TQ7CQt6la/DDcahJaSpBmwhNrZKIGKOduY
         s02F/Wi8vOyNMiQRXlMQ09Pq+7VCubt7ewrInYwD1zNUbYQeRVjcFlIjlNUzcrOIO2Gd
         b8yJSseGZiVls7Z2SDAt4O4ZNtzZun0m6BZHGutz4t1xHWzUSEBo2FEfkz7g/5t3UNOX
         CL5mYVrGoVOp5p8eqXDtGno3cZYpKADgres0BZqTWFd1dOshNi0UKdQgH4NEtEcxs+PA
         OXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955431; x=1763560231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aIU6mTVT/9hNLX+UgvB1zHOKbS0kmwHXqjF+H6qseTo=;
        b=Ii1lsAWWczFw7u/kBgKOURnOtC7uOYMcfQeFgUFxWWQnKxgtJRa679VGJQ110y3LDB
         DWzZENfO/vPG2vko8ukkEEsaSlk/AEi3kL3XADB8tzYQ+XNsj9h9ZewfnrSLlh3PHY64
         raXKTKbPnLw9WMK3CeWyTkysqHduNyIB71iqFketLFNH/2I9lU7eJYNQIo9AteZKvjYO
         vnKjT+odP5rMYKDlP7D6AQvChi0ZNKFlI309P3y2mBgE/xSVc8hFD/ECx8NA5nnP4TKi
         3HfS0Xf22q82maWT7lqkSJOAAEDjpKPfnjm8qnFClnRN+AkcNUY6kAPN/CNDw9x1cJKC
         18/w==
X-Forwarded-Encrypted: i=1; AJvYcCXT9BbECV+COJIa+nmNLxNrGRAo0IOAz3X090sGkEfHQ6uDuQwNy3sVqXAdoRWDrBQRCBzQ5UFrjIxx3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwExXOGL4qKF7UokJlYHw0QhI9hElW8A0shFHe3XCZ8+6mifYBA
	07rJZJ9C0g46uR8TjH0FFOjeM4K2b6c/MCBTrulWsWpkvRLzH5owc+SJ
X-Gm-Gg: ASbGncsFa6nzPXINVV4popRBfl4JoyrYU4vbOZ5KUnNK6phhdfKdF33HkPbmvLJ4uaS
	KsYq4dL+YYyWJLTxx+GrTb8VsPbOC5DjS0laO1ZCPc9vlIGNkQ1UsrkyZ9YFGoLGWofyItpBeLS
	8ah1w6vryXEuRTOlviuJEG4fpq5jk1MXMBhjluwyJxb+bTn2v3/FKnl2JwVSjve3K+SnMCtJwJB
	rvCsn5OS/KGgSKkzHIKLwO1lLCmEj+n+9xZLQoty5atgjpTeP2XaNzYrilmqxrbolNO1n/YV7cQ
	9j1hfsKIksbwh5eJikMBnIqipVm2Ez1hbAZW6g+OXqM1yoEv4/cjQbmM5/tmzjvVAw+urFNO0AU
	LF07WTcV49pNT75Lji6JfAP92dLKIukAajN6LGNZKnTCddKwe0++lCEbU/y0PhtDEi77DXhxeYI
	rzgDJbfnfQAT74/9pbxhRSGG5nNseIdYa+3DD2bz8ubNzJqmbCA+8P
X-Google-Smtp-Source: AGHT+IFvzDC8q6K3eMX5NpCZe6iJ9ktlK/IQzxKcT7Sqmg87KhQwtu8BH5fJQ0IkmWi/CSJ5uD7Ofw==
X-Received: by 2002:a05:6000:4210:b0:429:dc9a:ed35 with SMTP id ffacd0b85a97d-42b4bdb308bmr2351768f8f.43.1762955430589;
        Wed, 12 Nov 2025 05:50:30 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679607esm33667757f8f.43.2025.11.12.05.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:50:30 -0800 (PST)
Date: Wed, 12 Nov 2025 13:50:28 +0000
From: David Laight <david.laight.linux@gmail.com>
To: hariconscious@gmail.com
Cc: cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.dev, broonie@kernel.org, perex@perex.cz,
 tiwai@suse.com, amadeuszx.slawinski@linux.intel.com,
 sakari.ailus@linux.intel.com, khalid@kernel.org, shuah@kernel.org,
 david.hunter.linux@gmail.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: Intel: avs: Replace snprintf() with scnprintf()
Message-ID: <20251112135028.18921229@pumpkin>
In-Reply-To: <20251112120235.54328-2-hariconscious@gmail.com>
References: <20251112120235.54328-2-hariconscious@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 12 Nov 2025 17:32:35 +0530
hariconscious@gmail.com wrote:

> From: HariKrishna Sagala <hariconscious@gmail.com>
> 
> As per the C99 standard snprintf() returns the length of the data
> that *would have been* written if there were enough space for it.
> It's generally considered safer to use the scnprintf() variant.

Did you actually read the code?
In this case the code is actually rather buggy and can read beyond
the end of 'buf[]'.

Neither snprintf() nor scnprintf() ever return -1 on error.
So the existing code will attempt to write past the end of buf[]
if there are a lot of entries.
Fortunately there is a test for negative lengths - so nothing is
written past the end - but the read can return data off the end.

Changing to scnprintf() stops this happening, but the user will get
truncated data.

	David


> 
> Link: https://github.com/KSPP/linux/issues/105
> Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
> ---
> This patch replaces snprintf() varaint with scnprintf() in
> scenario to know the actual length of the data rather than *would
> have been* written data of snprintf().
> No functional changes intended.
> Reference Links:
> https://lwn.net/Articles/69419/
> https://www.kernel.org/doc/html/latest/core-api/kernel-api.html#c.snprintf
> 
> Note:
> Compile & boot tested with necessary config parameters.
> Other areas of AVS uses scnprintf() variant.
> 
>  sound/soc/intel/avs/debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/avs/debugfs.c b/sound/soc/intel/avs/debugfs.c
> index 3534de46f9e4..100b95bfcd78 100644
> --- a/sound/soc/intel/avs/debugfs.c
> +++ b/sound/soc/intel/avs/debugfs.c
> @@ -119,7 +119,7 @@ static ssize_t probe_points_read(struct file *file, char __user *to, size_t coun
>  	}
>  
>  	for (i = 0; i < num_desc; i++) {
> -		ret = snprintf(buf + len, PAGE_SIZE - len,
> +		ret = scnprintf(buf + len, PAGE_SIZE - len,
>  			       "Id: %#010x  Purpose: %d  Node id: %#x\n",
>  			       desc[i].id.value, desc[i].purpose, desc[i].node_id.val);
>  		if (ret < 0)
> 
> base-commit: 24172e0d79900908cf5ebf366600616d29c9b417

