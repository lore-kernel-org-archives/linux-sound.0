Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139A51A9F91
	for <linux-sound@vger.kernel.org>; Tue, 17 Feb 2026 05:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771306310; cv=none; b=KTImpztEZI4OeOMduznrEQhlk6K7IKcYh7ghL8uS6JojT9GEaiFLrhRDKuQdh/mcWvEUNyUuP+jhDwhUyNBA/fptyJpg4r6AAu+89V1N5M+ZrdNM20UMoKVskiuHzDLUrxZwbjwp2Mrt/yvxToHClYuydoMo2vs4TYt74WW+MZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771306310; c=relaxed/simple;
	bh=bEs0ZegMUJRVfFPSPIjT5/O7aWC304TUlXO08xx6Rus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BBYx2WjSqzFdOVwder7HhwM1GeqT0l+G0nh0drsz2RfoHWkSZw/N/xjyHe6P4h7wzrYvRpiKfzI5qql9Yxe2zeHA36cfzX9q33WD7c0bRxikYxbIULpLZLvQXYX/23QbTqLJhY1G+TM8RCUP30UFUEyFw0Y5JGiDHCOVXpQPjKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7/Ih03d; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7/Ih03d"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59dd54b1073so4394309e87.0
        for <linux-sound@vger.kernel.org>; Mon, 16 Feb 2026 21:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771306307; x=1771911107; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZQmJvE3CmG+8+B/H8dQfbaQe/w+8T20sg9MOdQxN4hk=;
        b=f7/Ih03dGqXptArIzpkoxmKXt9iUJ2IyQ1EtPG15e8B6QS6trwK5DDwhnZ2o8+ZCjc
         1rlSETvWexf9ErXcmB/ByAH1bqL6ioCzPUyLxaO8Bz2L5EhaGkSAtDPRBbgNtYVWkEwl
         ZnS4hXG84djLF3OScscI8TAYWhDtb+oKGWjOr1S/r8PXgGkiwAsHP2p46ws+xJ6xD8IQ
         DcId6xSmicdmT2JMeR5Zag/ej1GLPc5SQY4Gd2SEvFGFaaIC0Vi+7KA6K1/nd4QPLt1l
         2fpktuo1F1Rq6yKa/QSlwgjL/aIY6fIAEckpuJnfjFgq4S+rJoIg3yFvn6y/j3381B6N
         6HZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771306307; x=1771911107;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQmJvE3CmG+8+B/H8dQfbaQe/w+8T20sg9MOdQxN4hk=;
        b=eo2Xu1C5G0rvJYTPfIG6XcDCKvyKqNT+QD9QmlPmBwX4c2AsWoHeIw5dsTrANbDm2E
         +yudr6MUNLFpG1zQjvr1r856Gjvxo3pQa0X4R9c15/aobXAoMOKnTlh9HQVr8Ui37PmT
         k/RHIV61Q+PoOhi53Cur9UM0VVKrs0Zq91zjfmmPFtnnVeCvuauO9zTXOnmGmCqZX+Nl
         P6yPufO1Q2rDDrP/L3y+25ET4gbrPcWb17RQ9vBeLEOrN+dI1qx56N6pXin9JLEK0cgU
         JTar0BlzftxESUKys3TGtLsplLzQzX7/P8ZP68PMhlizbZt/UEHo2X14vklDhAab9A/o
         bBbA==
X-Forwarded-Encrypted: i=1; AJvYcCW5i0XE2v8YobXklVEjwgqh6jIzAzi8WTxYhS+s1IGh7IdQOjCNuJVBAJ8IIiZcA4QBBDzLENN6+3WqlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdX85CRejBOjGWbXO/H8gCy/8fy2yMycZAEhTRI2Y109Vt3E66
	hGnu4Bh9bvuAVvOXXJDTnkqf2q66KLbXcUZI08/nHVkKnUNgEkCYguZ1
X-Gm-Gg: AZuq6aKQS0n1XQ6B7G1jOvT+AvPpQHmNvjRS57R+SMIXre8zAUemZGgfVNk/goiJa1H
	zQNNcQtDd39MYoA/CDAlg3btYMJCuUr4dTmLB+0qrxBSg904lHV+O8zIUppOq+NzP4fCS16nSHo
	YvcLagLZsKwSIVAFfZSUG38l/7k6YuUAdxhxw/8HGOzcWcc1itPZ6IuO5PBF+ZOp8slnlk9LG4S
	7eziOMi2sp4KTOk0N6QIFdzUQ9EDLPNxRwv1DgOQsEuEQayk/v3iK93d8h7nqK6rqX5kasRzv56
	ybZDgx4lguCe4lUbLqr/W+HKUPc6jIQfa5wUR+EB13rjPrnpQ8y2ZU1yfiDZiAzSOKga3B3R74w
	jT/7pcK6dFxT8Jnw+q9G2fPC71aS5eh0s4vpqkQERoTHhZ4ZO0rS/YxTpuxnsMhL36G0fUXfIo6
	1U/AsA55iijrhg1kUHKgzko3Klg06M9Zh5LrtbrQEMbO7HHGENYUTm3n1El1GtXdRRaslD8zBia
	1X6lG/k0w==
X-Received: by 2002:a05:6512:8002:10b0:59e:5928:db93 with SMTP id 2adb3069b0e04-59f6d3759camr1927753e87.25.1771306306837;
        Mon, 16 Feb 2026 21:31:46 -0800 (PST)
Received: from [10.0.0.100] (host-185-69-74-59.kaisa-laajakaista.fi. [185.69.74.59])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5a50c2sm3649998e87.45.2026.02.16.21.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 21:31:46 -0800 (PST)
Message-ID: <4e8f421a-8dc9-4d69-b43a-9dd78851e315@gmail.com>
Date: Tue, 17 Feb 2026 07:33:02 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: ti: davinci-mcasp: Add system suspend/resume
 support
To: Sen Wang <sen@ti.com>, broonie@kernel.org, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: devarsht@ti.com, r-donadkar@ti.com, s-jain1@ti.com, m-shah@ti.com
References: <20260211221001.155843-1-sen@ti.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Content-Language: en-US
In-Reply-To: <20260211221001.155843-1-sen@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 12/02/2026 00:10, Sen Wang wrote:
> The McASP driver supports runtime PM callbacks for register save/restore
> during device idle, but doesn't provide system suspend/resume callbacks.
> This causes audio to fail to resume after system suspend.
> 
> Since the driver already handles runtime suspend & resume, we can reuse
> existing runtime PM logics.

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> 
> Signed-off-by: Sen Wang <sen@ti.com>
> ---
> Tested on SK-AM62Px with audio playback during system suspend/resume cycles
> 
> Testlog:
>   https://gist.github.com/SenWang125/065c2840071f2569a79db9e99010603f
> 
>  sound/soc/ti/davinci-mcasp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
> index 8a2977093df1..643661ebee83 100644
> --- a/sound/soc/ti/davinci-mcasp.c
> +++ b/sound/soc/ti/davinci-mcasp.c
> @@ -2811,6 +2811,8 @@ static int davinci_mcasp_runtime_resume(struct device *dev)
>  #endif
>  
>  static const struct dev_pm_ops davinci_mcasp_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
>  	SET_RUNTIME_PM_OPS(davinci_mcasp_runtime_suspend,
>  			   davinci_mcasp_runtime_resume,
>  			   NULL)

-- 
Péter

