Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC9D4A05
	for <linux-sound@vger.kernel.org>; Sat, 27 Jul 2024 10:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722077362; cv=none; b=C/fvv6kPGH4ZiDwpp8PM99hLw3WKpgehc+LoacXV/LpoirGmuu+/ZVoYcj/v9JNiZc2CL0ou3ikO7xBjqp9sUAGMXio5i2dLDj10O2iML1HJUhiEy9IrZrsCrbnpTMU4+YCHGS1gwi/JO9iA4ObWkUiClQFqLTCbdkG+/Mkt85E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722077362; c=relaxed/simple;
	bh=u29x3z9nNj7e32wU/R5WeTPNlM66fftlY+D73KLs8v8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sH6y+9Xr1osa1ZYF+EGWS0oznP5WiMrguLpBrAEBtBGP5qHCze6kIVT+nVpJzOuRvwznR0LKv1PRQEaBhUfcvJR5ykxOzdj33uHltYG8IUd5fzbP9jZZpFSckQTVGm/082q0WJk6ibUVolqBHwRUUaS5NhUUJsRIMTZGrXffFnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EtzKeLmI; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EtzKeLmI"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ef2cb7d562so26227011fa.3
        for <linux-sound@vger.kernel.org>; Sat, 27 Jul 2024 03:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722077359; x=1722682159; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=geCRQMjPSwcsby6sgvnZan39KM22MCRt7HcUFv8NB60=;
        b=EtzKeLmI4RGMVx/ApTQhGuvp/fn2CIVOrVqiU9bBrzT3jSeZscHSoRAMD5L5INdjl7
         bGPqC/ALiZbGGwhzxckvo3RVkd2ndbdTUaPdQNmL8skuv4B0XjrO18g8gfmrzT1lHxrW
         gqtLyL0vHxDlLsvDrtip2y7uqVYVFFupOQK531bzLYsychVfRcuy55a67Iv2ZRDJ3e4I
         0L6sdPH8+viSSxzc+pk0KTglW7uM+JJcY7FKIWOaITiyz0h5Xw0R5dIN/zzOXaJijgPi
         Zh3UUv93eyp7/MmSUxjodb1P31OmUs7OCjX/6o/a1uDQJzMvgWpo5Dgdmef9luZ+dakf
         BqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077359; x=1722682159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=geCRQMjPSwcsby6sgvnZan39KM22MCRt7HcUFv8NB60=;
        b=SPqjrGWnwSNzG021ue5T9/ZZ2Nj3PJ9lkwZAfPxhGshunjOsYuV7raNQlVDj577Oax
         JUGkaSyjBtNm5vDAv3PlgeT3Kzi5jvYiA9a4va0i0GBkirkaZ/qcCy5erUVkTBYlfru/
         uwlzbBTx3ZUElbzfstm8bPahkOaKbafzMJsePjytVe2lTMl9iVg95e1NuMPWHWYZ917i
         ALI8xD66j+lQlVNrVqxjlWX7fdpvGXHtrzxU4FZ0UZZw9M/ag6FCWFr7fJaJz1wqwZdp
         D+YRqGri/PS/zW3ibMzGTQv5xtZd4g8c+5jt4ne/Joej43D4hIvpB2JqG3hVN+cGNbP+
         YjKA==
X-Forwarded-Encrypted: i=1; AJvYcCULEmIgv0t3gFDVOjucQQ2OaIBz20yxEprWQFnaMCY00X/Oyl9qzC+WW8cCH96UBYmF+3mFI3uBpyMxR4tP0ZFcWFXORHWGsmyfd+Y=
X-Gm-Message-State: AOJu0YytcBtv9nRwSazGN60ll0kaU/d8Fhr5BHdRJXGYzehdCunrC55S
	hP3C/4Ve4eCm2dEzeQalg7BlHg/EkgOtYNC6LudytjkHxrdRsHZqL3+Qp9mnk24=
X-Google-Smtp-Source: AGHT+IGAakSUy6drg7IAUAowlVvqX75jk6w0OUsoc5NIprF+xI64fMmRUUrOeW29bqgdNpmn/JjE+A==
X-Received: by 2002:a2e:2d02:0:b0:2ef:20ae:d111 with SMTP id 38308e7fff4ca-2f12ebcaee1mr16162881fa.6.1722077359180;
        Sat, 27 Jul 2024 03:49:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03cf0f9ccsm6943211fa.14.2024.07.27.03.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 03:49:18 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:49:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] ASoC: codecs: wcd937x: Move max port number defines
 to enum
Message-ID: <lwgi3xhry2zz2filzdrivluexoyft6ohx5b6xfqsp3u3vx3qvg@hg6aq6tpmsmo>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
 <20240725-asoc-wsa88xx-port-arrays-v1-5-80a03f440c72@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-5-80a03f440c72@linaro.org>

On Thu, Jul 25, 2024 at 01:23:47PM GMT, Krzysztof Kozlowski wrote:
> Instead of having separate define to indicate number of TX and RX
> Soundwire ports, move it to the enums defining actual port
> indices/values.  This makes it more obvious why such value was chosen as
> number of TX/RX ports.
> Note: the enums start from 1, thus number of ports equals to the last
> vaue in the enum.
> 
> WCD937X_MAX_SWR_PORTS is used in one of structures in the header, so
> entire enum must be moved to the top of the header file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/wcd937x.h | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
