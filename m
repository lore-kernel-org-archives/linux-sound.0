Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB8C16F0CB
	for <linux-sound@vger.kernel.org>; Mon,  1 Jul 2024 18:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719858644; cv=none; b=JAbRVTd15nsOQSJeYGnZesJl1obvI6eoOZ+f0uFs1hyvpBh1nnnk0xC+ZGphgeUD0JZEJOu4q5Y8WHn+5AtoME5gU6Fo5z/xKcNA/gGQK5Ipi+fZ2b6JHhqSNRV87cDumbFudwghsZlTJpEabI1wTgKcCr+FS3lCOWFwISdymM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719858644; c=relaxed/simple;
	bh=vDGLWmIXVVyB1exjrHzcvgHK5kCnv8kyZp7T/Bw4t/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KfvDJq8JleATSQqDROjbv7yDMn1frdQY8xjvp1j4YlozyuVBH1BP7zdc5cSHCuKu5CBBtxwaCsYLT36JuhXoUZQESOQFxfVRszfR4k9kT2rT+tEjUAUv4sjxpwKTItvulXS2v2yxa+5OSMU4HaiiJE7Wgi7OTAj1IahxvakzxGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E7DRoX8X; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E7DRoX8X"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5295eb47b48so4079675e87.1
        for <linux-sound@vger.kernel.org>; Mon, 01 Jul 2024 11:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719858640; x=1720463440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sX/O4fr2+8PvQYguZGt7KddLq0tEWxhads05D+kvVqE=;
        b=E7DRoX8XUsuQKBE6sEK8C+sMH7d66MRgw/lYDSkPfgrvPydJc478nuv4PpfbRoFiSo
         xBpAmNRnd5p8xdDeo7CHJ335c2Cj5oNRAHxiQnHF6l5volPDRJ4m+VIX/aCivXEJgCnO
         aRCu1jl4Wu7+pYT+fQuQsyh0ghF2kvg6EnVGtcCvoG36yBvWwBJmm5dAZGytIS0JSR1n
         Z0U78MXtcmcKSuYWvI7t820HE88agjg/SLoPrnlCnwyAkKZ33tqOfik0P9+SM631vncM
         rHlg5KpbqSByTI3U93MSlPmA+WxbAWA7w1TPhTQW4KqB1oHhrH+RX2wvL4//merPEpT6
         oglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719858640; x=1720463440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sX/O4fr2+8PvQYguZGt7KddLq0tEWxhads05D+kvVqE=;
        b=HuDmYGFiZ6mFvwttOFLGFSpRVOpJUpDl7qdMfhPLRw3tMaSZQ1c4n70pJTAEXcY3Tm
         953hL7B1GmGL/LOejr+nw8F+m/S1iQEynt12TMnaV3zZFEqj+rWElAj5rSFbwDNHJerQ
         BGpjoKCWOS+/GaZcgwxurz8S77CT5j74HpwK/cW/rXMpLxfdWaaWicA+O8fOhRwCFj7V
         A49s9ktI19aCTqFtzPf/MttZgbl7ArrF5ER9aw8Gea53WzOQjN9Jvos0NzI/gg7DZIW5
         GaANz4r2vP2Fs2ULHBWJhvnJFTy0iLz0aYAnwC/wNd57E2ZGvfRFS0T/euWQVaud5n5N
         mOWQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4dIe4/eOy83SUo/6nsQhxEVNdivc+lsGmvFDSJ5i329lz50CHthTBWpnItKYMXw0YJmetmaqBxZ/1wLD/kIbt/cZxdDTeeZY7A+Q=
X-Gm-Message-State: AOJu0Yw0cLwaO/zTnXRwEWVqWdXPiBc7JBIwuovcby1hwhRbX+EWpOg3
	cchXCucTxKRoNPJxPY1q2XZ8OUtJZ5cPf1fFJRw0KA/LitNtFFjNhS1BlMO3aec=
X-Google-Smtp-Source: AGHT+IGYAOEefMGp+PasSD6aXVE+wt5WaW5Ihd9eWiI8BlyAfQBL2BD7FLoq6KyCw0TQKGNw5LYjtA==
X-Received: by 2002:a05:6512:3e28:b0:52c:a5cb:69e4 with SMTP id 2adb3069b0e04-52e826f12d1mr4520600e87.54.1719858640404;
        Mon, 01 Jul 2024 11:30:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab1089dsm1502831e87.86.2024.07.01.11.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 11:30:40 -0700 (PDT)
Date: Mon, 1 Jul 2024 21:30:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: codecs: lpass-rx-macro: Fix using NULL pointer
 in probe() dev_err
Message-ID: <kblpzus3lr6j6xnitmjk2qt2vpfbutqar2zdxrjbepcvey73no@j6f6whmsk2mj>
References: <20240628095831.207942-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628095831.207942-1-krzysztof.kozlowski@linaro.org>

On Fri, Jun 28, 2024 at 11:58:30AM GMT, Krzysztof Kozlowski wrote:
> The 'rx->dev' is assigned closer to the end of the probe() function, so
> the dev_err() must not use it - it is still NULL at this point.  Instead
> there is already a local 'dev' variable.
> 
> Fixes: dbacef05898d ("ASoC: codec: lpass-rx-macro: prepare driver to accomdate new codec versions")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/lpass-rx-macro.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
