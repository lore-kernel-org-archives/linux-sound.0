Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBE031ED79
	for <linux-sound@vger.kernel.org>; Mon,  1 Dec 2025 16:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764606041; cv=none; b=najq9j7/BwFVw4A8eKvT+VU15WOGkXUQwttaDA3k1f5gG/hlBULaFgzcntqGU0XlJWZgMlxnFfURg0+N4Oth0/8IkNC/3C2xpJzFqir+M5eIZrT5CKa69CiRHC1cXTr7k0JsUWf7zFHVj5+B/KR2rifZwA5oH8XMImCfkIiIwSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764606041; c=relaxed/simple;
	bh=cbTq8BHjRToGTEY8Sx66KTwTfnaIXn5PKzRscbZtMbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gL9tBgaBwYKcySDkO8W+vPIxKUOcXhEy8OZNE2uwe1f8zEpbNfw7XMNKAI7/NvP7oYs9OL/JgiBfKVuc0nepRpns8Kbsorlm1yZHEJBb8EMzoR4XPzwod8+VloLsyxIM7dTsOLtTbm8XLyoNRrIBtURXjCaLTy6rix1wDxSHvAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DzfN4wmN; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DzfN4wmN"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo5299526b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 01 Dec 2025 08:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764606039; x=1765210839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cspTNBzt+I5BtqKUZhFjJeUVwDFagEE/l2BBHLFNpxc=;
        b=DzfN4wmNhudh9Aoo99BlK6Ljv9vadO0w7/OlP7wg/MAmTyeAD2fMfjZe8RJoqcoAx6
         xHyFEXNCUOVrZAuzr9iWeXwYbotQl3IzUKSnwYxDfbse93Bex1paum/dJiMpt7JfbGqY
         mQZ/+CwybL2tCvzU3T5SUozd98yu4O5/p8XxGwnTeeC0Fe8SV5Z9qgjZWOHoUIbTmWlH
         XyrMfBcZZfTAIaX7hRbO9zdDygKjrNsXbOD0OyQYzyPTdis7RHTTAKD612SAYh620O4N
         GOs1DPvReKrst2BeaUiNzaawm+ba03LT/oDPzfdCq4FNFeGE6EMZhM7HMKjX0fOYupPM
         ORaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764606039; x=1765210839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cspTNBzt+I5BtqKUZhFjJeUVwDFagEE/l2BBHLFNpxc=;
        b=WqqnC/VVZqvgmdvLoxPm3jmKp0RsXq/PYR49VZYOOCDC9GEl4BjKNrniP5xhlMWHJx
         ab1yfDPmnlpCOmJUSVGV2PD3gy8W3IPTcjGY3y9jEozz3Q2bTF5+Dmt7pwnfUe+L2zwV
         iyaulEYMfj3WBTJKpzGR7BMOHUKAxB/QDGskViyHAUAdXwCkiDTXRJP6T+LeVl1M5hWT
         INZqznMTAsuS0SDjNJh6q7Ul6lOrhKiPELuaiAi4G1NZ9nHWJsPPw58A1y6jztGRvqMr
         0BVWLs+hUYd4agN6sf6ivUA5DOmpEyXVEsCvEBJB/MRtfA7FTLVFvRdJaj22LrrHl43q
         BQFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm80tpPXpuL2VT9OK6Jc44y3bLP/ZpADdXVh+/wqVUdvabMB4tiTsJ39OVOGWQETDGl5jBsoQ9gLu2UQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzX0KoujPZbu6nCAGi3AAViqE7lFzoiZ7yJV3r0pwWDd/vTezDb
	VHjJvHbZuWJrXDMkJwKs5KZtr7pxFpE8fMJno7K53nTfDPKx+LC8e2qqieNNBGGHsNw=
X-Gm-Gg: ASbGncslLgA5sYmLZcBK5xoJAN1ApPd+vWfHsg+nURNn8TsRYfc5CpCIrzvJuo19xV8
	TIC5v4ZnxVUxa+pWRxBGGs+mlZm2nk4rKRb3x8CubGOgOnCx+MueSlmQeSsqRoOEHSaOjor/Dmz
	ATxO4IBTTEj5BPVcQ+Nhq4xzVBKeUyhvHmdCwyIpZ67tCcEGGpNueAFV+7FWpYQkZCql01Yp1JY
	yKcH7HJW6PAZ3onn4zsfoIrnb8JG7hP21xzITImw8PsIyuv6XGayMVccQYKg/7D9J5hJTvJDw+z
	+GCwoH+JxemKimEzDHB93sonfsy9LtV7YGrM6+r3KGfG+fSAmIaJqLEslEu7hvud7TKJ3NNbyKO
	tsLJuHrFPgDjITcDfI/coJ4gtJ0IKNe2ldMC6AymnZ8wp/5B8QrqWltJTk4PKfMYe1TM7sjCarC
	VmZtq+jnnHqSbboA==
X-Google-Smtp-Source: AGHT+IEC7gGRxUyVtd+YE469cDLd2n7LeD/hmDQKTfHSUTd0/7SmlOv1H6YZTofFyUN0T2uY8DHV7Q==
X-Received: by 2002:a05:6a20:2448:b0:345:e30f:d6da with SMTP id adf61e73a8af0-36150f059e2mr47497364637.37.1764606039144;
        Mon, 01 Dec 2025 08:20:39 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:7234:1ea8:3e35:6ee3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15e9c3e41sm14161217b3a.33.2025.12.01.08.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 08:20:38 -0800 (PST)
Date: Mon, 1 Dec 2025 09:20:35 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/4] ASoC / rpmsg / remoteproc / soc: qcom: Constify
 buffer passed to send functions
Message-ID: <aS3AU0gEEOvWs4Uw@p14s>
References: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>

On Sun, Nov 30, 2025 at 01:36:07PM +0100, Krzysztof Kozlowski wrote:
> Dependencies / merging
> ======================
> Entire patchset is one logical chain, all further patches depend on
> previous ones, thus everything should be taken via same tree or shared
> between trees with tags.  Probably everything should go via ASoC with
> necessary acks.
> 
> Also, first patch or two patches could be taken now for this merge
> window...
> 
> Description
> ===========
> The remoteproc and rpmsg send-like functions should not modify data
> being sent, so buffer should be marked as pointer to const.  This is not
> only self-documenting code but actually increases the actual safety and
> clearly documents who is the owner of passed buffer.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (4):
>       remoteproc: mtp_scp_ipi: Constify buffer passed to scp_ipi_send()
>       remoteproc: mtp_scp: Constify buffer passed to scp_send_ipi()
>       rpmsg: Constify buffer passed to send API
>       ASoC: qcom:: Constify GPR packet being send over GPR interface
> 
>  drivers/remoteproc/mtk_scp.c       |  2 +-
>  drivers/remoteproc/mtk_scp_ipi.c   |  2 +-
>  drivers/rpmsg/mtk_rpmsg.c          |  4 ++--
>  drivers/rpmsg/qcom_glink_native.c  | 13 ++++++++-----
>  drivers/rpmsg/qcom_smd.c           | 10 ++++++----
>  drivers/rpmsg/rpmsg_core.c         |  8 ++++----
>  drivers/rpmsg/rpmsg_internal.h     |  8 ++++----
>  drivers/rpmsg/virtio_rpmsg_bus.c   | 24 +++++++++++++-----------
>  drivers/soc/qcom/apr.c             |  8 ++++----
>  include/linux/remoteproc/mtk_scp.h |  2 +-
>  include/linux/rpmsg.h              | 17 +++++++++--------
>  include/linux/rpmsg/mtk_rpmsg.h    |  2 +-
>  include/linux/soc/qcom/apr.h       |  4 ++--

Acked-by: Mathieu Poirier <mathieuu.poirier@linaro.org>

I'll let Bjorn decide if he wants to include this in his upcoming pull request.

Thanks,
Mathieu

>  sound/soc/qcom/qdsp6/audioreach.c  |  6 +++---
>  sound/soc/qcom/qdsp6/audioreach.h  |  4 ++--
>  sound/soc/qcom/qdsp6/q6apm.c       |  3 ++-
>  sound/soc/qcom/qdsp6/q6apm.h       |  2 +-
>  17 files changed, 64 insertions(+), 55 deletions(-)
> ---
> base-commit: 7a9e871ce4c7c8a7d75eaef8407083a0525de2dd
> change-id: 20251130-rpmsg-send-const-ae216a1fbd8f
> 
> Best regards,
> -- 
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
