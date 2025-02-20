Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854C2212D6E
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 16:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740070739; cv=none; b=IwdeJOBr4B2dzla9d/B0/mpmthoS4+EIkMCVAAz4Cwe4PH+JIFFNdfQgmdCBcSjp3xtcHxgGa4pJQ/v5PVb/M+KB1lFv7rg8ooQmWzn/TYJEt1RpVuvYK6KsFfuSKS5/5pm0OejTomKjjs82Eve3ms+39HPkqYrB+ktHsV5wamo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740070739; c=relaxed/simple;
	bh=IaMyx4zJbOc7SlK0SsUvl5E9g4q84clVwL3Qp+Re03k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PyFwxtJ3nPKB3XtcxLu5LycklBr5L1MDGBxhd+rOfnKPFTYDnPtKgx7yU9hRf847LfQ3z9Gc33kAWYl9MpmM2EM34HVHBGKInQwUVUUAifmp7/j96wJXRkMLqEErO6hQkln9nNqhjOuquOZELSPO/zYgImayZPNzQbPDifLqmKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DrAJSbQs; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DrAJSbQs"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6fb7d64908fso10167057b3.3
        for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 08:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740070736; x=1740675536; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AQGm09mvBdK2cXSMuQL4mPfZFTNbgPhxPgRHKoe39gQ=;
        b=DrAJSbQsNTEoPjrC7xyEDUT77+IZKnF6iEXQexDsVkaRiwzQdle+aNFLblGEUpsKv7
         hZyPov+6q5P3TBe+Q7U6RiqmLnBDGM4zhj8KfROlVq4kYWwij8OYy14vYWfH2kCSVX/8
         uoKnoIve7pQ2zNzgt1v5eJw6cInR7azxbwh0dC6WZwNc7F5R/c6Gc4D0fNMKl/4CmUTz
         p5L/2xajkaSxVplrWLlx4aFzD9d1Po1Jj+eF/9mCKTa78mmqdp6Arersr/pBMe6pagmV
         1WU0KFhhvIpeXW2ZOco1EvnMoJQAOvYtTLniwyQ8P83GQ+EVJRL5xNsxK8pAYPRqvSYT
         xkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740070736; x=1740675536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQGm09mvBdK2cXSMuQL4mPfZFTNbgPhxPgRHKoe39gQ=;
        b=E4mL0H3JLJkUpVogCDWtp8KO8oPRlKssBbd59VeopPNWlSFSsNHaf1giYsURFaSius
         0xQ1GbZ2vcx7KvQUld3IxDoAnENBgRO2ME8BPqGOFVYcqMGVjMV/pJ4VctLTTf+Ik1eH
         8oOjitvTroK/OeiEsJhtjo/w5tFigD1SINdxlp5bS/w/uWxVscptGf6iqN0OIRht30zY
         gqDB/zZ7ZK8t+efkKXv5qRTillYJrtEtHWMQuXSZpfZSxmyUTythd0Of+MEMoGcJxJAw
         5I+2lGuGATgXV3QzqwisjwthyojCbTAf5Eli/zOEowJuyN3LEtDiTVANDLyfiz2WNNtU
         BXgw==
X-Forwarded-Encrypted: i=1; AJvYcCV18q6AbhzmEDdwoVqlobzghMjdkIedXP8jtcU2JH90iEeobTmoutqUVs7wO5AHlxEky1WgMfhFWFUBaw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7NAUDsJb0FUhYyZZEyml0yQ7RICaHR0wFGhexDc1Rwj3hJMSZ
	1Vz2x/4cBUV1TIjpAmIs+eUHgW2cFRlVVksmp0WQfABS4pE9xuz2qtPCWFKhQoimZSBhzwMOb0V
	LjpeRNOOBz5ozNXW8zHknA4ftBG05RTtpmYDaKA==
X-Gm-Gg: ASbGncuFkEuPAEffh7yZ2XT+JRxki3BcADWU7i0oVhbkkU+BtsSmuKXmZsYCDEWo8qR
	VCWy3r457CDtkR3Hi4QiALqUYwClFf7xwwwk9JfDyN5G0aHLNWuspJOEJlEA0Ob9sob2eyAZhrS
	50as9WdtAoNVU=
X-Google-Smtp-Source: AGHT+IHo/TSwDj9rjaJmDI7ueG/cX0IHmiSNBjN/IaIJE2k5Ejy7bMVotuAKIkDs0CnNfxvReAEeAqe1/IzMKeJl4mM=
X-Received: by 2002:a05:690c:2789:b0:6f7:534b:560a with SMTP id
 00721157ae682-6fba561941fmr76173317b3.8.1740070736530; Thu, 20 Feb 2025
 08:58:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220162847.11994-1-srinivas.kandagatla@linaro.org> <20250220162847.11994-4-srinivas.kandagatla@linaro.org>
In-Reply-To: <20250220162847.11994-4-srinivas.kandagatla@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 18:58:45 +0200
X-Gm-Features: AWEUYZmFJxng0_893ETLEGldfZpNnTmG1J41zgQwIxN-aVy1Spd_reUcQ6cKDbU
Message-ID: <CAA8EJppOSTFfszx26GzwQb36GNTU6WEpWmSX+j5ds17wc55nig@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] ASoC: q6apm-dai: make use of q6apm_get_hw_pointer
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	johan+linaro@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Feb 2025 at 18:29, <srinivas.kandagatla@linaro.org> wrote:
>
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>
> With the existing code, the buffer position is only reset in pointer
> callback, which leaves the possiblity of it going over the size of
> buffer size and reporting incorrect position to userspace.
>
> Without this patch, its possible to see errors like:
> snd-x1e80100 sound: invalid position: pcmC0D0p:0, pos = 12288, buffer size = 12288, period size = 1536
> snd-x1e80100 sound: invalid position: pcmC0D0p:0, pos = 12288, buffer size = 12288, period size = 1536
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Fixes: ?

> ---
>  sound/soc/qcom/qdsp6/q6apm-dai.c | 23 ++++-------------------
>  1 file changed, 4 insertions(+), 19 deletions(-)


-- 
With best wishes
Dmitry
