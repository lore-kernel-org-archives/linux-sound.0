Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621442139D6
	for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 18:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719514169; cv=none; b=Mb8rhFSPOgNXAn3ivduw3LXXUKTmAGxpQJC2GZH23Q6sIOisL5ocor9EqdMfqPUIKegp3GiqGMEG5BW/HAKZpW75Q/iICk/GvwikOc2P6guHyakvK70LL9qnB/WIw4sojBFP4yO/dFO/em0XnGHq4UWJ/kAVjm0W3hJKr9ShA3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719514169; c=relaxed/simple;
	bh=+loIEVQbiIvCdpK080P2B2BC20Dlavm8jb2rv/XemnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K5WM85QOiThMSbP7opxWUljaX6Bb4Q5L06XNXNzKb4KQm9wWhBl1odVTkIvuoYilImK7IDinjZN3M1j0FjJf8f1GgnVdO07RwFyBLR7wpNAUxn8/5yTdFIXnQZlcFGFEDoID4uKqA1wt8vLzQbxUiWVOIm3eMZGHINVmzMyWdoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FdWy26Es; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FdWy26Es"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52cdd893e5cso6567442e87.1
        for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 11:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719514164; x=1720118964; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dVlORxLyi+No4z6mzakpdO+uVb1Q8CeU42Yrc8ZopLA=;
        b=FdWy26EsYMg1O8PZFwF05yLh8qmyWIh/bJIZBfTXIukjW4SD8S5so7RUAejlmOfJJ5
         F8dC/MAIBBnDOPqFo8P66rB+OqDbAZbcRRxmTQkNo5lQUZPGwzuzn6asIVZ8sX2vzp3H
         C4zbJKzGlGY6dxTGKim0wOaCvWKwtkAGxPnjDtgvanFS5+gLuYlH6ITjqQDYV3JxiOGh
         JQP/yZGtNtV6CocGq8efMJJFUfgo8z1BYZ2kOFvCqde0izI9T9AwjK+8+UM9UZwzRBuC
         sIKIe12ebCEfgxn9Ep8s5KqEW1+FYW4bcBnMAbVDKFWgyJqmsb975PtOymgxy05VIGz4
         4Vmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719514164; x=1720118964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVlORxLyi+No4z6mzakpdO+uVb1Q8CeU42Yrc8ZopLA=;
        b=MTn7kV8rj3zz61jZ7rw6PZowRPn2uYrOPx5QOvaLyxBTPI4r4waPz4s85d3+7CeqOU
         G8PoDjBTmwVza2+4v+n8QpMIoWyHWkIyTfRgdWmgk5ei1ibSPd09xmmpWbSWzaQGC/yj
         2OlmXUVEK2y4aZW4Ff/0LmRRlCJ3h63Ykg0H6a7BXtYDeia4wJ3KR3UfcL6IahSjEfBZ
         lIYyuv3zNZ8oYLVhiAZMiSwWwLEUsovZsbw5s/VNlNq2XefaR3gmbhe7UoxtiLEzEgHR
         B11ivH439Z0Y6Fursy6++MELaQa+6YWS/SMFAKN4wkv8z0HdpHshE0hbCjialc7R+7qt
         0IQg==
X-Forwarded-Encrypted: i=1; AJvYcCXDR1v2aGeAuP2Nd9dLod2HcD1AWXW0mcHBEJsO3BqOwVf2tTbpGXKSDhi5ZricBS35H1eF/w9G2+gD6KnRb12dC/EH6bLYD4CIgyc=
X-Gm-Message-State: AOJu0YzRteY+WLJCqhfDWqliX6z6yQJ8qJtAdcMcgzHBy8+8xYBaSuFx
	MSsXvXduCK3+UeGQW37BVd20zZrrpd30Z/QtL9j7ngDr82rFNHfEoreg9cWMjTQ=
X-Google-Smtp-Source: AGHT+IHjokj2V4brw5oo7jZhZncGgRxq7Wc7ZcWz0FJNgfC3Iqf86Brk3YH4RGDnAqwGbGyYRtJGkA==
X-Received: by 2002:ac2:464d:0:b0:52c:a88b:9997 with SMTP id 2adb3069b0e04-52ce185d20dmr11430836e87.49.1719514164382;
        Thu, 27 Jun 2024 11:49:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab101c5sm20119e87.79.2024.06.27.11.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 11:49:23 -0700 (PDT)
Date: Thu, 27 Jun 2024 21:49:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ASoC: codecs: lpass-rx-macro: Simplify with devm
 allocations
Message-ID: <dalyp774uk4ugomvdtrjkjpenfogx6dkx4vtiq6serc4unzasw@xa4adquvcijn>
References: <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-1-ede31891d238@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-1-ede31891d238@linaro.org>

On Thu, Jun 27, 2024 at 05:23:43PM GMT, Krzysztof Kozlowski wrote:
> Allocate the default register values array with devm interface to reduce
> number of error paths.  The array is not used after initializing regmap,
> so move the freeing to place right after devm_regmap_init_mmio() to make
> it obvious.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/lpass-rx-macro.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
