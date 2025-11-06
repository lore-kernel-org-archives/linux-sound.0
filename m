Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B02332ECF
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 22:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762468129; cv=none; b=XKS4Rh9R7zXidx19hm8z/PTEpBG/zAOfzq0KL78VUTMbAlo8ou8dAlFwqIVkf4V+3UteWidfq8C+I6I/Q3knfbL1zef0P+ByCvFnvGz2mGwTN5IjwwUELd4Ea7gKpHzvZCZBWiujO+ZDTu3bZ09KNU+GunkYPhnXR7Mwf66js3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762468129; c=relaxed/simple;
	bh=4JTu03iX6vFDrPqW0GxtDjNlpHZuyhsfQKG/6UtvK4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qluhs/tTeDpAAOgRtZLTIOqsSgPpqH0YHpAhXqoeMeS8qbyLIiKhnOdeOLRs6PTUazhM0r5Me6yRk18Khf7e3CPsQs4uWIS4mVljYccpACMk/Bmx/fWy1bjZ3klUBsw9d6UE7wQb7I2OWUi2X14vVcuf27gwuwdL/Nlenrw8Q6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WB+F/SQY; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WB+F/SQY"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-433100c59dcso609255ab.0
        for <linux-sound@vger.kernel.org>; Thu, 06 Nov 2025 14:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1762468127; x=1763072927; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Ilnf9YNYEmJ0X/Bm5CjqVXNP0HKW5OPjipOTd8WS6M=;
        b=WB+F/SQYXW4hmM6oPiGFcayhyQzlaJmxbldJM/t59/yjh7wBd4EhM+p9TNgp/N3yh8
         kIMwbTA6Sj26fV73eF14Yebm83dT2X2RNPOdEAQNFhtyjMVY/zBvpL70UGMyGMxMgcPH
         ytchO+Q1W/pM5zVk7mxHPx19xA/zxwKNJTFcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762468127; x=1763072927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Ilnf9YNYEmJ0X/Bm5CjqVXNP0HKW5OPjipOTd8WS6M=;
        b=Ods96cpDzSvelTVDO8OBgScChakWFsjzCOvv2i8RcUO7ZUQbLERTkgx1tY9UXyPkHs
         2iVhy4pyfRLh2FohUqvPVYLKegNXIUt8AjAOK4xk1csUR8+zm3BQxP/IoeY9TyBAI6tf
         TFnW1EJqMuRxW9P5gXQgHZIje3pfHpmcPDVJ+6cZQ9K5Bu5Jbb8j7mnmXclxtvOH2zcp
         +zvhOl1PEI3JdrJFcUQI6Snt5b4b1rMBwW8+r0X+rMPkRuEP/HqC9S7vIwz7BYzjkkAI
         hB9YHAnbcYzRyJ2clMrfH/sXteKYDe9LcTcp2PsdWPi+J83xAfe3A/qfERFxSaO1oEAh
         7wjg==
X-Forwarded-Encrypted: i=1; AJvYcCWI+KavLQptp7CajV5f02UD0xxnUHEYlxqZB7wCaIPgPDBhzXH4OkNv3R+dymeimcRCFH6qgr+aVWcXxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcI1hJuyPaTy/nX/ISPFRkEJCHMldrs7AXq1erXOGBLQTdTNnG
	oZEj6o44U7ixfbIGrzoXV2qLjyggvhuQg3b9Aq4jMbviFC6gO+tvCUqLitEbLjriQZU=
X-Gm-Gg: ASbGnct2fTXoXpe3NQfu6Bk/62Tt5Vk7QXLXMTFx+M+1LQeCsmMWqujZK+JMFiwwndJ
	5REDK7xakWpOWzsIJY8uHW/b1ava5BO3pLJAiGbfUq6EpJ132C5nJHi4Sb4xEm8NlJaWd40xkQP
	oJ/dSaQzyDi/udqoyN3pdjhY5Iaz47sbHvQ/s0ILQixCnCjuZxg+rrUqmTL8BjE7ZtWlOEm/865
	Jvo3E/LuNZk34lcY1JEsq8ApQzvXZjWK1hDdgnJACIBtdYa1xPwVSMK7Ub7CINV7+xDcoizx0Mi
	zEtsMy/DOUUk07oV7DKmz7jGaXcKi/KrP8LjPGpC2Lv5fTX90n5fKINfehl1JeCtF68GJXOZzr1
	EO2w6V/K920VXPmjfUKNeVu5wwmxND+W7IWY+FJPfQc9XxVqkgJqmXHVxNRyvYBHiaGtJz0DmAG
	fwhcq6T8Z+l2Qe0H2xClqhunk=
X-Google-Smtp-Source: AGHT+IGJhK5ac0+9nCUlURCUKRMOk9Pshm81p9z0cIwy8e2oj0giXJGWDnsGxvYGWJlHAfrDjfabsA==
X-Received: by 2002:a05:6e02:370c:b0:431:d726:9efd with SMTP id e9e14a558f8ab-4335f3cfb5dmr16442495ab.12.1762468126775;
        Thu, 06 Nov 2025 14:28:46 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4334f42cad7sm15817345ab.4.2025.11.06.14.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 14:28:46 -0800 (PST)
Message-ID: <0c7f307c-9de5-4d67-b9da-e728d43e00b6@linuxfoundation.org>
Date: Thu, 6 Nov 2025 15:28:44 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: fsl: fsl_ssi: Replace deprecated strcpy() with
 strscpy()
To: hariconscious@gmail.com, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: khalid@kernel.org, shuah@kernel.org, david.hunter.linux@gmail.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20251105052113.39999-3-hariconscious@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20251105052113.39999-3-hariconscious@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/25 22:21, hariconscious@gmail.com wrote:
> From: HariKrishna Sagala <hariconscious@gmail.com>
> 
> strcpy() is deprecated,use strscpy() instead.
> No functional changes intended.
> Link: https://github.com/KSPP/linux/issues/88
> 
> Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
> ---
> This patch replaces strcpy() call with the strscpy() API.
> strscpy() is preferred over strcpy()/strncpy() as per the
> kernel documentation.

Which kernel documentation and can you add why strscpy() ie
better than strcpy() instead saying "as per the kernel documentation."
> 
> Thank you.
> 
>   sound/soc/fsl/fsl_ssi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
> index 320108bebf30..b2e1da1781ae 100644
> --- a/sound/soc/fsl/fsl_ssi.c
> +++ b/sound/soc/fsl/fsl_ssi.c
> @@ -1447,7 +1447,7 @@ static int fsl_ssi_probe_from_dt(struct fsl_ssi *ssi)
>   			dev_err(dev, "failed to get SSI index property\n");
>   			return -EINVAL;
>   		}
> -		strcpy(ssi->card_name, "ac97-codec");
> +		strscpy(ssi->card_name, "ac97-codec");
>   	} else if (!of_property_read_bool(np, "fsl,ssi-asynchronous")) {
>   		/*
>   		 * In synchronous mode, STCK and STFS ports are used by RX
> 
> base-commit: 284922f4c563aa3a8558a00f2a05722133237fe8

thanks,
-- Shuah
