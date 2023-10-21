Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F76C001E0
	for <linux-sound@archiver.kernel.org>; Sat, 21 Oct 2023 16:17:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231793AbjJUQRj (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Sat, 21 Oct 2023 12:17:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbjJUQRi (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Sat, 21 Oct 2023 12:17:38 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5850DD63
        for <linux-sound@vger.kernel.org>; Sat, 21 Oct 2023 09:17:33 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2bb9a063f26so27286321fa.2
        for <linux-sound@vger.kernel.org>; Sat, 21 Oct 2023 09:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697905051; x=1698509851; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2QCO7vKJdpewvnrGf7uSRM6TlZdVHtky0YfzwG9dgVY=;
        b=pjU9v8Sh/YyZ8em/EcIQCkdxq2+38oY0OIMcZ/DbABHxJpz/lkPlMKWQMfaCjsBurT
         dIiaPd+Ih/j+utE8T6fKkbdWZr80i7w1QsMjuwnuSrvWKQKSx8rnC/ClQE/54oSfA77/
         c1LGbIJ7i1Lanwd8zGVa+vRwQQaVWqyeCFO70Z9bckUWP8+vEIVPKTm6bA4Uu14R1RWN
         oy/qfamM5eCPtMlJ4yGP7hnVXpmXNpvNnloBSAYm7ixbYdlCe+vbnkm2w4J5CuoUaPTs
         XxRZtVEvjYTpE4c4bUEM1qqxyMJihW0Iq1gOfOiQr1VqrrPsFpeCMNjXAcgB/gp7dxLs
         3d6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697905051; x=1698509851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2QCO7vKJdpewvnrGf7uSRM6TlZdVHtky0YfzwG9dgVY=;
        b=LsQtDPcfzm/eb3vtgmjqB0aDnsCCuEB//Rk4BTclt1QAfy3dkzy5LHO436IPBrhXDz
         Sh/y3mGLlu36kZ2M5KLFapDtothOgBquiCBMrnd8Gm8xmkYpowV+lYpO+KsabXN/AV82
         0WDJQS92flbB9Y7fX69XuvzFtCI75tCPb+qUaKvGSz8lBPfKxSiXJMepmNo1WJSvPwUw
         KQm6YtphUcM0d7ZRTPMFIVAt+8RgeGySMQXx3s1IKmWbgRDpxGsu8Pt+ob+jGbmVZ3nR
         iOYJSE62bOO7RbuPxYU00rkOxM4tlqUMUUM/9wUg/RFTlB1QbH8x/fuLkJ7OdTXBMI7b
         zUYA==
X-Gm-Message-State: AOJu0Yy7HClfWywx790Kf+zrreumhuLWWARL4B07vISypDhLzfsPHf4g
        icpRKWi8pggnjnKiMl+BL8IsDg==
X-Google-Smtp-Source: AGHT+IGUX29kGn+O+8jtH1EHnalh5tcVZoDjnw2thl7vfAv7LtObZoQC9rYzurf+iaRF8Wb17E7sig==
X-Received: by 2002:a2e:9210:0:b0:2bf:f7ea:884a with SMTP id k16-20020a2e9210000000b002bff7ea884amr3462294ljg.30.1697905051347;
        Sat, 21 Oct 2023 09:17:31 -0700 (PDT)
Received: from [192.168.1.116] (abyl4.neoplus.adsl.tpnet.pl. [83.9.31.4])
        by smtp.gmail.com with ESMTPSA id h5-20020a05651c124500b002b95eb96ab7sm876376ljh.18.2023.10.21.09.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Oct 2023 09:17:30 -0700 (PDT)
Message-ID: <ae070706-2f0a-4932-b917-b8cc9a59b46e@linaro.org>
Date:   Sat, 21 Oct 2023 18:17:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] sc7180: Add qdsp baked soundcard
To:     Nikita Travkin <nikita@trvn.ru>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     jenneron@postmarketos.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231020-sc7180-qdsp-sndcard-v1-0-157706b7d06f@trvn.ru>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231020-sc7180-qdsp-sndcard-v1-0-157706b7d06f@trvn.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org



On 10/20/23 17:33, Nikita Travkin wrote:
> Some devices, such as Acer Aspire 1, can't use lpass dirrectly, but
> instead must use adsp core to play sound. Since otherwise the hardware
> is, usually, very similar across the devices on the same platform, it
> makes sense to reuse the same boardfile.
> 
> This series refactors the sc7180.c slightly and adds the functions to
> control clocks via adsp instead of controlling the hardware directly.
> 
> Existing google devices should experience no change.
> 
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
s/baked/backed, unless it's a nice bread :)

Konrad
