Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076C7143C60
	for <linux-sound@vger.kernel.org>; Thu, 13 Jun 2024 12:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718282247; cv=none; b=kzchJOSvBhpqAD74fSwg/UedesGJMNpVMGF/wcbmXj8IkPSa1SUS3CfbcYeGacAoYQfleG9KtRTedG+tlGV+bes158nccl6xud2OWUAHb0GO9dK9LFrCOTAWJtmlGfGAJGl83nWBUKg/obI/tdSTJMVJSIk1f+3ZYADKZdYisyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718282247; c=relaxed/simple;
	bh=HO+x80vOL45DfnbGDH+HE4l2kGlmP8xcQBK47SIOSDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gdFzJsG5UmNjaj/GmsUDgY4dz4btJ1HME6z7uhHmFYEPK4rUpWh2cOGHQ7o0gw4e7okjf6kTTkKHifQXUPoD4lfXqfyBovFQCtY1YX5NCztOTpwMhFr25RePihzV7kWxbAPdkMYXAolj/ZGIvpycCUFpjRj96xgDiCuwLurqycI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yJ/rhK5L; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yJ/rhK5L"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-62f39fcb010so11843297b3.1
        for <linux-sound@vger.kernel.org>; Thu, 13 Jun 2024 05:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718282244; x=1718887044; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lK324ZHK2UbYkaord9YynZkPLQSYfxb5dYuVjUssGuM=;
        b=yJ/rhK5Lg+rkWw8pq9YggxvBlPh8A/DOkCsY3uA/ktzMZgZYq+Yr/0NWUahCQMP55y
         A41T+7/FLd5ADX08KV5D2c+XpBCfcH2zIojMMrU1rfH1EuPJBej6dvln/02u84kpGc4Y
         RSJ8AGk5gJFAdRWE7vWEkN49G0p9CUUaAha0v5UlWEF02DAJtg3ETnq3Nz4o22RH4fou
         AiXMaIEnKrl3zgNsdYIjul6ybY5XEC+8VKCPApSvCtwaLJR0Bz6y/ftradFMQO4fQ9C2
         6f71NU6+8wmxDTe38KKrKwEGtfNHOCSAgdbnd2jzn5RlUOhv3R5MEkOiNbTqXbTVjlI3
         41Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718282244; x=1718887044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lK324ZHK2UbYkaord9YynZkPLQSYfxb5dYuVjUssGuM=;
        b=uzAPqOhPyiSmPJMdOEoQAugrJ8p4GqkVzZGJXdFmtaIR05JpMDdIvNz8SDkuWcBjdU
         Yzy7/ViYHUXwsRz7nUIcbdmnJ3rMVtSEcLnPut/UMzrkhWibXWK9pFD/ZP6MJAiv/qcn
         6i0MrfOl+ITGrNQdXEXdFshldKv37f6NsBtrorjvPvAfF+HEL+KGz/81QaziprdYmrXF
         NyEBZXy89wIjPByCnAy+cjXnLReVLSkSPigy84xZloiX9vHVj7oYm50laJ2SPpo/tPDU
         Z4sGTFloVIb2fEGA4qiRhJscZFvKiZHtddL+z2iAxKz3+dg32FQ0k7Qv51aw/PRnTSCJ
         vLBw==
X-Forwarded-Encrypted: i=1; AJvYcCWBlAlBhf9oakiFvrPyAJ9QHct6aDZH3UCanURlnpaDIk9Mog/vZdGk3+3PMYqZMn4KjB0vBZvpDuN4NEAiKMyOJ12HS3QvAPdlk1o=
X-Gm-Message-State: AOJu0Yy4rvmAkcqsya/9O5Wark+6Ox5x+UUdCBWnyYTmuSXnoDj4wlCQ
	kMHUp03CiZsRK8gWriUbUmohic601xlzGtU7zqLDp98FR6Xhw7zQRSKiuE9jzdTMP02p4jGkbGB
	vUmoYf0mcWa3/yuvjpvNQT+R7BcBtbcDon8U2FQ==
X-Google-Smtp-Source: AGHT+IHZvUBnLsMhW62XBAnxIb34bbF6VpwyWCJv6bXVbMOYQVTTwWrwK1vnVsv5FrvtFe2dwrIEhVqsavWTdlA/pfI=
X-Received: by 2002:a81:8a42:0:b0:62f:9e2d:3e5d with SMTP id
 00721157ae682-62fbdba5388mr40959977b3.43.1718282243851; Thu, 13 Jun 2024
 05:37:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240613-q6apm-fixes-v1-1-d88953675ab3@linaro.org>
In-Reply-To: <20240613-q6apm-fixes-v1-1-d88953675ab3@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 15:37:11 +0300
Message-ID: <CAA8EJpq7SN5J8Ye8nGfbJdKAC5Ws61iKMu6QO9ebnRV6q3EVNQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: q6apm-lpass-dai: close graph on prepare errors
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, alsa-devel@alsa-project.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Jun 2024 at 15:13, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> There is an issue around with error handling and graph management with
> the exising code, none of the error paths close the graph, which result in
> leaving the loaded graph in dsp, however the driver thinks otherwise.
>
> This can have a nasty side effect specially when we try to load the same
> graph to dsp, dsp returns error which leaves the board with no sound and
> requires restart.
>
> Fix this by properly closing the graph when we hit errors between
> open and close.
>
> Fixes: 30ad723b93ad ("ASoC: qdsp6: audioreach: add q6apm lpass dai support")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # X13s

> ---
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 32 ++++++++++++++++++++------------
>  1 file changed, 20 insertions(+), 12 deletions(-)

[...]

> ---
> base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0

Note: this didn't go to linux-arm-msm, probably because of the use of
an outdated tree for submission. This commit is v6.10-rc1, it probably
should have been Mark's tree instead or linux-next.

> change-id: 20240613-q6apm-fixes-6a9c84852713
>
> Best regards,
> --
> Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>


-- 
With best wishes
Dmitry
