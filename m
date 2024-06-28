Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07FD149C7C
	for <linux-sound@vger.kernel.org>; Fri, 28 Jun 2024 08:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719563747; cv=none; b=e2iwghAOWjhX986/lR4ck61pXZtcT5nB8UFdn12bkdANBepJ9m0wQF+kxHNm4jXJB6DYRnFePBu9evMC0Pa6BBOPYK3Lug45DVCf39Ee91RcEdLXj7rrAvdVayrMQ0MVTgYiRkgEZo4lnIhOYgS9RjSz8ZtBhXe45Pwky8mIH7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719563747; c=relaxed/simple;
	bh=Aeqbd8mZF5g0gMvxy8MT2FkZAI51t9W3BeDBDhRYKN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z8zvCw4lRMsUoSTKz+2BhcCb5x+NQVz0QmmRzCI9v7SbUVhyFRjvZVl4j/4FJemJ7C48gd9gIIi55lBaZVvjIy4TVVQkXk8ggh5QJAnrstzcw6DFLpSUB4NojLjrkz96t0z2tppn7p6bExX3uOtiyrBI5PZY95cRfct90dcEhHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NfQ0KTPi; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NfQ0KTPi"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52caebc6137so320436e87.0
        for <linux-sound@vger.kernel.org>; Fri, 28 Jun 2024 01:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719563744; x=1720168544; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kW8kDPyCelVzk0XP+f0C1TOEkGrqmmm6HbfYVtTsZyA=;
        b=NfQ0KTPifBwF4t6W3AUoHCV4ne4NxDOjpqwKEXJrzzthgBwpel/q7rg3ht7cKRQ0aX
         lFcrmMGgEVm/IhB5HkUjaV+GOaSiEWlV/xOlmXfxiYnZmzoxxx7RjmWPqBGR5EMStl/J
         ufwfLmLKWy8cizY/i32gp7BPb1LkD2WOebAak713r5VUhVPkhbaYvGJocwyXamtqoTJK
         OTg4GWyx0bLzpD074D3LbZU9dmp+Nt0Sm4HRn0nyt/ar+FqrG4EtOUySeyObI9IvIn7F
         0CJJd9bsj045ZeTuyLnaeHxVq6grrnyYIlWEVB8Dwt+mX3rlQ/Qr8VRaE5q/04lsgVI+
         eMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719563744; x=1720168544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kW8kDPyCelVzk0XP+f0C1TOEkGrqmmm6HbfYVtTsZyA=;
        b=C6qcZ4sDW3zJ6O01yAweHvZTn/1SWsvq8g2y3INd6z6fnhZV/ZwIRPTUU+RZgDUKjV
         Nfcz5mbIR3Inimtfb7cDDVBuRZ3hXzq323vxWbPiz6szkyLCbGqTe9hg9/t1HDwjKDeJ
         pvF6jMNvLLEhF06iz/mxlnHg8HVkH594bh/jGY6uNJnlH9AjkAR7gUQjT1cVSVnaBUHr
         nIk8uWdeoJcrsVhHdylgCdP80voEGDV87lxJ2TDmsnBiYcnSgJBx6F0k1CbxCGQ3tWdO
         sjhSKTYsxMROnlX3NjmXnoBP0vZMjMPhW6/Hlg7YxwA0KiLvspLq+fFOwaDAl6mRZdlq
         cgEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC7HHpT4asNcyK8WjLUnqYIFIda7bz9/8pd0o6iPMJEAQGbgIC+rSZAR06IEENRR4llwgliXXxJVk44XLPryTWzpwCd24RTDbjWmM=
X-Gm-Message-State: AOJu0YxPbP4hB7ZM5Xj0vILVFW3FbW7EEYVZ1a0sKIEUs76WPQ/jQcF+
	CMPhk3tc1RG1oehljsGkBTCWo/tGi7SwyVoIu3M7qYDr3u9zNJbkyx646wTFXOI=
X-Google-Smtp-Source: AGHT+IHTiAZIPdDFBY86RLx+OqmRRF+qtx5Trn2TYV6LbMTMP6YvfamTxpc4oxDTByLWmHsNlvA5Vw==
X-Received: by 2002:a05:6512:281:b0:52c:e10b:cb36 with SMTP id 2adb3069b0e04-52ce183add6mr9396478e87.33.1719563744009;
        Fri, 28 Jun 2024 01:35:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab3b37asm209380e87.275.2024.06.28.01.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 01:35:43 -0700 (PDT)
Date: Fri, 28 Jun 2024 11:35:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] ASoC: codecs: lpass-rx-macro: Use unsigned for
 number of widgets
Message-ID: <ojokmx4l5eaeclemszd4esgyfcov4gcqteegh3vqpbk7cdfmgn@yayrzbbaire5>
References: <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-4-ede31891d238@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-4-ede31891d238@linaro.org>

On Thu, Jun 27, 2024 at 05:23:46PM GMT, Krzysztof Kozlowski wrote:
> Driver uses ARRAY_SIZE() to get number of widgets later passed to
> snd_soc_dapm_new_controls(), which is an 'unsigned int'.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/lpass-rx-macro.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
