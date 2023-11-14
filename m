Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79089C072A2
	for <linux-sound@archiver.kernel.org>; Tue, 14 Nov 2023 13:05:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232864AbjKNNFP (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Tue, 14 Nov 2023 08:05:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231605AbjKNNFO (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Tue, 14 Nov 2023 08:05:14 -0500
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D8B719F
        for <linux-sound@vger.kernel.org>; Tue, 14 Nov 2023 05:05:11 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5a7af20c488so66596397b3.1
        for <linux-sound@vger.kernel.org>; Tue, 14 Nov 2023 05:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699967110; x=1700571910; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3kLet+ZFc4FiXhXyJTUcUEX1JsMDtWsRFc0PYkqxJM=;
        b=nMk4bjzWl2OH2sgI2kginq+JqGE7cwEcr+JGDejTGiX2niImmLs4RpluHd3H9DmyOX
         39NxMktLxD0KR/1jO0DVPvee/GYRKvdT0NGDyOOY9mugEYri1z7tPGOuN1UaDnDslMPM
         07KVGoolts85BnWYiBEeoDTKbfNmDvu5SMcH8fkerB/VCr7HRL3nOmT0dMFAw6psXo7L
         PQ/yETAMDp42UEMSaZHW8fDmMccfGZ99jpCF2zkYMbjDRmxmbKkkPuIGDPaJjXwpkPJN
         6YRQJ9NnpBeWQwKLA6iHGmEX2qiNv1VB3X4ejZsla3zyizgE0zAnjBWzAhmBMv96hrt4
         Sceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699967110; x=1700571910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3kLet+ZFc4FiXhXyJTUcUEX1JsMDtWsRFc0PYkqxJM=;
        b=XX4q9FLDuVZRE0Sx50bTkILLGgJUAYKm5tttKpekx2/UC6rMJFqfw6Me1opKLgx6P0
         R+XquIig0TJ9+WTpKxIIMG4bPqkMQ7OiP5wOo/ZnM4hr0ez0Lr18K5ESMFtFuxAA1TJX
         tgCJEvXqvn/hHPU1E0he81BJ5VJ0Mi3jFejxPt+KN3ZEotZ7BRZAHuCRXCpQDOLZP/um
         ynkwHYhhkWU8MVIRYM7LcrSrjLGUmjzJ1OavTam1polDnlaZIXpYy4if2qcqF5po5Il0
         23FrrkuAJXp5deURDWS/V1TdK9MM3A3zTRhAYyHjOHIcH9TWPwHSwVYEIDVI+YYdI+ng
         rNBQ==
X-Gm-Message-State: AOJu0YzpN1HBqTUWpt2BqjKVCPmJkJWnp7+WtAs/3XR8d94cwWaiCZTe
        pV+IVJtvEi3nBAzHi7szr2ohDXfurmz3+swvM+pp4A==
X-Google-Smtp-Source: AGHT+IHU/EMXoR/AsvwDR5tVM/hTfhag7Py4pB8zx2h4lfdu8R1hVWGA8wCYGXEvgGG4RCO6d/pEhnbc29+P4adFbGc=
X-Received: by 2002:a25:35d6:0:b0:daf:66f9:cfab with SMTP id
 c205-20020a2535d6000000b00daf66f9cfabmr8292993yba.9.1699967110411; Tue, 14
 Nov 2023 05:05:10 -0800 (PST)
MIME-Version: 1.0
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org> <20231108104343.24192-6-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231108104343.24192-6-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 14 Nov 2023 14:04:59 +0100
Message-ID: <CACRpkdaSPTjjPA=TS-WbOb3E=TabtP6MFEx6Q+Dar-Mh=EtknQ@mail.gmail.com>
Subject: Re: [PATCH 05/17] dt-bindings: pinctrl: samsung: add specific
 compatibles for existing SoC
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Lee Jones <lee@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

On Wed, Nov 8, 2023 at 11:44=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Samsung Exynos SoC reuses several devices from older designs, thus
> historically we kept the old (block's) compatible only.  This works fine
> and there is no bug here, however guidelines expressed in
> Documentation/devicetree/bindings/writing-bindings.rst state that:
> 1. Compatibles should be specific.
> 2. We should add new compatibles in case of bugs or features.
>
> Add compatibles specific to each SoC in front of all old-SoC-like
> compatibles.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

This is more formally correct indeed.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
