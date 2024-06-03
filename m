Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEADE8175B
	for <linux-sound@vger.kernel.org>; Mon,  3 Jun 2024 12:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717418095; cv=none; b=BnWvE1DK+EXMyCnwyDoJTw5+GN6MWB+prI1RAOg1AoSjNrrDujqSgc/S7gPlYWFJea1uuG0gtknWvFlyq3773mYnaqXS+UDeEhSEuCUmsStw54YYn0TKOc9O/CVODqIGdveeeTqUwNxoRWkMxs5auNzVWaayM0P7dPjOn8pj+sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717418095; c=relaxed/simple;
	bh=yI5u5wUiXcIr1CXdNjn8aKUwswP4fbQVdrpLyFYQ0tw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h1ujMFrQlhrW3x71t53Y9nyG50v9UeSOsxhxPKgHZHHIqBLm0R61GVCa7dKHiWXoD2sSyONduOgfcWUY0t3Wk4tXQrg5bw5+y1sfqj+ekzfl2m8/TRUeYeS6y67Syb0lZ0Pq3GzXcNnCpCTusWsG/c8GL7FprGgyrQqj01ivXRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AF4aKxB+; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AF4aKxB+"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-35dceef4227so3041967f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 03 Jun 2024 05:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717418092; x=1718022892; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AYnk7Jhk5XQEe5qdju2BLibwhg+AiDV6NTuQ4IZI3jM=;
        b=AF4aKxB+qBDDBZP28KIXT4cDRTepRl3Poa+5owQ3QlqZsh121k87/c8uy+5/4HWcb4
         hXkVY6pE5JAYRFk6Sm2XeRO8jLx1lGYW9B/eR/bLUiwpIJhvhNj2xh3PYxeanV3P8cSD
         /EtI1skUw3Dac7iu+R7gnOxetcWKjhxSSY5K7za/RbH9MczHWY/NEfd2QztlQTj4Neeq
         V/zq+hYF/2STIRpQa69G5z088RB3Fi/7PNs/m/r8ndVCeU3GEGpUxRpjj7deK1XKTU2G
         0ExZr2vgUNNPEe8h0m2HH41vpxHZnPpoAFbHBrBd3h0G7uYSJM5Zd9LWlrOasqmU6ce8
         SJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717418092; x=1718022892;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AYnk7Jhk5XQEe5qdju2BLibwhg+AiDV6NTuQ4IZI3jM=;
        b=t5F31utYhwrp3hdHnP8fotN4TGwvVKUN7jwjZKtVCnoIjakDYMYaNO4nNl/t4/Anau
         tDRJIZJ+kI28uQzBg0qF++9yMDBAGmqhIPcp5FcYibvh1arXHHWfWlPeHBCkqyAsHvHD
         c2oVo+5Wox8dK9TDPS4n08CV0zoErltJ+/5PmHSswQ5vDZITHERz8CsR2T5Ka+Iqbql5
         rNZnQQLxOrf8r0rMiZWK/lSUTcYW230ZUKWpnaa3zjD6HbV8VozafXWHDn+3/aS3UzU/
         aQ1uFoK4Z6RhvIKRfoSkbfWQC0PRlPciiHJq9SM9PZcugUj933RhLwChsDy8KYkKVk4l
         NH0g==
X-Forwarded-Encrypted: i=1; AJvYcCVXavWoXoxDPjP/XZWjv+pJK1yPoHUgEVXrMZgzlPlyaU7hm+sX6Jho3hjHOJ6d3QbHZQ1bRHvQzV66U6A3LQHJmMIulRasQXBGW8w=
X-Gm-Message-State: AOJu0YybGzSfjzxXw/XM7PXp0b1xa7RYepbXEyiEZqGSt84hEohZb+OA
	f1dyt2eV5dh4c1ovrGWcUbyBzJjDzMuxTTdTn6Pa++VbDTxGmMoWBLXg1Fh3TKtb4Re7auu+TCr
	M
X-Google-Smtp-Source: AGHT+IEwm+dY0qO4BpWxOUL58zZV+cnU+QzHw3FR6bdQ3WmbzIoTUPKI6tqs4tXJauEY94kgkadNCQ==
X-Received: by 2002:a5d:4210:0:b0:354:fbc2:5cf6 with SMTP id ffacd0b85a97d-35e0f28854dmr5869925f8f.30.1717418092035;
        Mon, 03 Jun 2024 05:34:52 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-35dd04c090esm8938768f8f.6.2024.06.03.05.34.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 05:34:51 -0700 (PDT)
Message-ID: <39405408-97d3-49b5-b797-e9363471adf6@linaro.org>
Date: Mon, 3 Jun 2024 13:34:50 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: codecs: lpass-rx-macro: remove unused struct
 'rx_macro_reg_mask_val'
To: linux@treblig.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240601225446.183505-1-linux@treblig.org>
 <20240601225446.183505-2-linux@treblig.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240601225446.183505-2-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/06/2024 23:54, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> 'rx_macro_reg_mask_val' is unused since the original
> commit af3d54b99764 ("ASoC: codecs: lpass-rx-macro: add support for
> lpass rx macro").
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---

thanks for the patch,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini
>   sound/soc/codecs/lpass-rx-macro.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index f35187d69cac..dfb7e4c69683 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -463,12 +463,6 @@ static const struct comp_coeff_val comp_coeff_table[HPH_MODE_MAX][COMP_MAX_COEFF
>   	},
>   };
>   
> -struct rx_macro_reg_mask_val {
> -	u16 reg;
> -	u8 mask;
> -	u8 val;
> -};
> -
>   enum {
>   	INTERP_HPHL,
>   	INTERP_HPHR,
