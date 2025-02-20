Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984411E0B66
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 16:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740070679; cv=none; b=VMkTb5Zd6Zy6IxBbmpu6HK90rtUhcm2ojup4Ak0ucY1GXy2v+kko2DlGmiq6ucnjc3KD2v0sm2dFyXqoTDPQHNEpijnxyOaI9uVxZN7c/f2l0Hyz+nbEj8TMUnoWlfLlSjzzbwfekUGfkUB3N7lJQVlCcDr41zr91jPRFLFkbWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740070679; c=relaxed/simple;
	bh=5JtfmGOicW04al1EGAJOYw0ML135NPF9yS3PcFGnjN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FlP70VSAX8ZX8EpwKDZisSJVj+rwW5KvyI/fPoHhbxx8P0HDuEdPE8om+Mo2sVjK8c8IvRm+otgszNmt0Y2cYVRSfw/TcBGJ5P6DWCjblPurn3cpP2g0J9isVyhhABji/2yK4qAaMc1RudY9Whn6EuRVVMl8Qi+lKqhO0h+TS3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=imxWhsdc; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="imxWhsdc"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6fbaa0582a6so15486987b3.1
        for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 08:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740070676; x=1740675476; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nQNdnw8eZcrMXGZ8JezKGVHSn8lKXmz+Y4gt/ozVgyY=;
        b=imxWhsdcKPmAfS0pvHjf7vKwBi0OSZxi08cTK9hPdblU8Clo7MQwv0k6XWZFDO4F9k
         qCBC/TswOy14n8hmy5XkKDhNRE//wqqFALVEQQc/hv7eSYBTJuCthhWErQd0lHLGuTon
         7aaWHoLbCR59y78X+MNM/Q3SBZLaxUteffUXyD91a1oNsy063Zh62n3pg4cojasCoKRH
         TJ4wHpr364v4deD+ZFEpIW8kWJTnxOc1f7Bn2/q4VNZEk2cQpn3zNjlpTHxp3GdP/viP
         ogcCONmFnIQYZx00IE5c/X3Xlx/eH6tmONCQvpCo6P8+NdHVGcHKKOt33mZYJ3SFgOBh
         moMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740070676; x=1740675476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQNdnw8eZcrMXGZ8JezKGVHSn8lKXmz+Y4gt/ozVgyY=;
        b=sbd9fdd+DK6KD7z05QD9LTyWq9QCgfObu3LXhyJAIetOBkCsiWrHZUsYWgM53YNO1X
         YYfCTnp3c9cm5lzP9RWgSX0D2E834njE39ZAV7bpkZH7pHUVlf0t2l4yWGWJy5ciu2zM
         NZaJpixiWjTK6vsvcBvbfGHwtkeqS9HcLB+JyUmu1cGBztnIseHLaoB24ySkP6hNRWDY
         AATTXESC0/Xxpc2o6v5McRcZbJC305UXU3WZZjBnfqX32yozAjIKTAeo+Vh/dvR3AJ6X
         GhCxeCcvToGIIU0vRoQNAqM+uiR2jzjUEMEI+s+gPCwPiltnAFx7o1hGh/SHXuie9M0Q
         orJg==
X-Forwarded-Encrypted: i=1; AJvYcCUBbxqp49de6ATuOMyOzUqZtaI2pyjIyxGf6pDNyFDQ9nY7mrRw4JGYB5V8njIWulSUfbqT9wj//OF44Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzFKXQS6el0Fnc52dWoZNTZBaBHLjfRl3mLenoZrMGC9tKOuGG
	5On3wn1GJPKrrqLS+aJCF53K23UP6AbVo1RevSxyH9clYHwa+cWVp1bvO5MaJc9AopaX+GGD3/F
	uuyqPs0eMQGU3woNTV4S/xkDvt5UCv8R5U/ct4GFkuSKZbhX2
X-Gm-Gg: ASbGncv8dD0k4IeWUMDzA+pKQKXxCSeRcDQZsUUPbPbjxwT83Mar/bHOhebWHd0GRsY
	dAGw3GTMuJe2OeLX6gaieMSXBTeykccOtO1qwohBxWy4ULJOm+hjApOnPa9B/7TutwJxgzkVXL6
	1JDi6JBg1R5ls=
X-Google-Smtp-Source: AGHT+IGTzwdM7XAGbT4Wb/bnOnPG0YkAOA4aOQm7K+g+wi5SiNeO8OVb3mOzmK0qbEZl7WVYr9JV+AZdIttBgIk5bNc=
X-Received: by 2002:a05:690c:4d42:b0:6fb:b38e:2076 with SMTP id
 00721157ae682-6fbb798d491mr39535587b3.11.1740070674841; Thu, 20 Feb 2025
 08:57:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220162847.11994-1-srinivas.kandagatla@linaro.org> <20250220162847.11994-5-srinivas.kandagatla@linaro.org>
In-Reply-To: <20250220162847.11994-5-srinivas.kandagatla@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 18:57:44 +0200
X-Gm-Features: AWEUYZmKSThXa-h2i8izvX0JkpbHRtsDXDUdPOdCOOOy3PX0YOtduln-ftn-Tik
Message-ID: <CAA8EJprX9j_pTXxC9o0RGTNgos6ao2aLcRKsgv3pfNAQOrbChA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] ASoC: qdsp6: q6apm-dai: set correct period size
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
> For some reason we ended up with a period size which is less than 1ms,



> DSP does not support such a small fragment size. Adjust this to be in
> the range of 16ms to 32ms.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Fixes: ?

> ---
>  sound/soc/qcom/qdsp6/q6apm-dai.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
> index 7466fe0c661a..049b91fd7a23 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
> @@ -21,11 +21,11 @@
>  #define PLAYBACK_MIN_NUM_PERIODS       2
>  #define PLAYBACK_MAX_NUM_PERIODS       8
>  #define PLAYBACK_MAX_PERIOD_SIZE       65536
> -#define PLAYBACK_MIN_PERIOD_SIZE       128
> -#define CAPTURE_MIN_NUM_PERIODS                2
> -#define CAPTURE_MAX_NUM_PERIODS                8
> -#define CAPTURE_MAX_PERIOD_SIZE                4096
> -#define CAPTURE_MIN_PERIOD_SIZE                320
> +#define PLAYBACK_MIN_PERIOD_SIZE       6144
> +#define CAPTURE_MIN_NUM_PERIODS                PLAYBACK_MIN_NUM_PERIODS
> +#define CAPTURE_MAX_NUM_PERIODS                PLAYBACK_MAX_NUM_PERIODS
> +#define CAPTURE_MAX_PERIOD_SIZE                PLAYBACK_MAX_PERIOD_SIZE
> +#define CAPTURE_MIN_PERIOD_SIZE                PLAYBACK_MIN_PERIOD_SIZE
>  #define BUFFER_BYTES_MAX (PLAYBACK_MAX_NUM_PERIODS * PLAYBACK_MAX_PERIOD_SIZE)
>  #define BUFFER_BYTES_MIN (PLAYBACK_MIN_NUM_PERIODS * PLAYBACK_MIN_PERIOD_SIZE)
>  #define COMPR_PLAYBACK_MAX_FRAGMENT_SIZE (128 * 1024)
> --
> 2.39.5
>


-- 
With best wishes
Dmitry
