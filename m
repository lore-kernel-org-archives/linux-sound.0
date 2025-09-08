Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A722FF15B
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 12:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757333816; cv=none; b=AndUKzBiFTA3mfoJI4T5wxtcGphL47AXnPFtiFHz3lSGj4mtHY5Fi72UbhxnFX4QAOKzYHvwRwAoRvd0Q5sGDyXkXx4x5wucZ2xmvFmsWuxBuUzHSltXm5b4FSWhj9XuRq1T4GBOq7iNI1JYgzKm4ZAjxVLbee22dlYQxVok52w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757333816; c=relaxed/simple;
	bh=qUf6tp0Ov7Fh9wkmfissAF+EqCC7KihYvczvOUHUp3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RwM9OmErRDokuPzg+17JiBdGzvZcwQaUCiECMbPwPBNpIQhCQOtiHr6WLbwye3SkpK1kASPCwbDD7NxwfN4IBfPAORREpvyWmqUF6C8OPPylLnKzALioGaThl+oR2hQCNVAztTuU0UMobMx+2W++1ehrwGoGOBygFvl5PXFeloM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QrWa95Z4; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QrWa95Z4"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55f7039aa1eso4763448e87.1
        for <linux-sound@vger.kernel.org>; Mon, 08 Sep 2025 05:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757333813; x=1757938613; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUf6tp0Ov7Fh9wkmfissAF+EqCC7KihYvczvOUHUp3A=;
        b=QrWa95Z4MYPPnLg6ceKYFhqyMI1axWxRHnDKVhFpjQMdwPjibIdK00e5xh/iFpRu8r
         Alg6PmhxzbLE9Hb7MpBHb6OuN6AxTWFd34sEfwyZ/nWIUvyqvDCzCkuTPuxWCknWg43U
         SSECVuOGa0t9xogdY/S+XSquyeOVT8t9MW6KpMgif9sctVKlPlCbKjYtF0vwlla7GPoq
         OF5XgQiFoqChHDiSrmjhtJHdDL1ervBemjowKSOpyhaJbL56qbt/6A60x9oCc0bP2Q3i
         uLO6ayrXTuOvfQjzfgFJBJbLruYOvYO+GQlyIJzYbIsO1t3RRyl1qMzbJJGC3d1F1daU
         eS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757333813; x=1757938613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUf6tp0Ov7Fh9wkmfissAF+EqCC7KihYvczvOUHUp3A=;
        b=H41HbRd0XRJxoOCXXGpPBnTmh34QLgDhb8DteFjs58Mkd6ZP2Esh1/md1mnwlU46QM
         4RHcaGYJxn7hyPxJbp6Oagce7nLxTMoXtY3ZIS6iY8M4eNMx1MuE4KC6ct/5iK3q3BeK
         hr2pTVuRTTQ9D/xHVs3sk+Ty0EWjg9wAkCMNJqG430kZIHqQyrjTXrAZmLTexgjnf6FY
         6ce4K0t2e3CiVarFtqbFQdKP3XmoS7XUp+Y2OE/BMNGPRgjjs6fHMleFs3WJ8ShfyOhJ
         kIBuvG5mZIv3BO2vosY3yh26WVGs8808MBYcaf9BupGPZNT2u8LS6k9wM3ziOhi+srrh
         iT6w==
X-Forwarded-Encrypted: i=1; AJvYcCVuNSGU8oF7C02V28aRqLISSS+UHgB2dTSl9DO4lJhvC+/x+rF+8EFigRisPeQ+I9UtW06LU3Bn9n/tMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwstbJsvcPMc5OKm0eX88MhrGS3reiKr8Yk7zakUm2hRdCPIyPC
	okaXJB2LFgluas8PGH8ikVSuEn/jDmTbqQVDJxmYmZ9kr1UkIEVV4H14HboqeqIHmsEiigtGqwS
	KO3gtqPluRXFpLk52Hx+RKhdMCXaflEvLCkW0PHcVdg==
X-Gm-Gg: ASbGncsv2UgVrXB8KZr5Oqqec326Oue4zRU/2Pe8DAysHpykGjeQLJUh92HSYhBW1u0
	cX/lCTDz+gHTIxeCu2URsvBckaQ4+34LuUIh4gp4ro0PG5nCaw+XLTQs7mlEieRrynmkn4IumRC
	OezWhYVZT8Ivh2IYi3LUGBANyTXoHwnJjQ9Xy+PHfIsHE1C2w51nh+16C3tji1QNkOCovdIXCFA
	8sIR5s=
X-Google-Smtp-Source: AGHT+IENckmMCfNmV2qK6+0jQMmoJ3XLi3L/H3pMjzhD339eFASpes92o+TzXBkF1s8o7Joe/TY9zvxmOgCWc6/zrlQ=
X-Received: by 2002:a05:651c:3248:10b0:336:c0b7:953a with SMTP id
 38308e7fff4ca-33b56faf551mr21546101fa.1.1757333812623; Mon, 08 Sep 2025
 05:16:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905-output-value-just-value-v1-1-c9dd1a172d62@linaro.org>
In-Reply-To: <20250905-output-value-just-value-v1-1-c9dd1a172d62@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 Sep 2025 14:16:41 +0200
X-Gm-Features: Ac12FXyJyrBbHh1sBHAvKleuXhhrVW-bSepE1vsBUxUoCXy7txd1XiUFF4X_MgM
Message-ID: <CACRpkdZL=sEQxQAHByKrhxB7F+4XVj18=_M99ZBYqFG28zoW=g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: generic: rename PIN_CONFIG_OUTPUT to LEVEL
To: Bartosz Golaszewski <brgl@bgdev.pl>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-gpio@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 11:21=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:

> This generic pin config property is confusingly named so let's
> rename it to make things clearer.
>
> There are already drivers in the tree that use PIN_CONFIG_OUTPUT
> to *read* the value of an output driven pin, which is a big
> semantic confusion for the head: are we then reading the
> setting of the output or the actual value/level that is put
> out on the pin?
>
> We already have PIN_CONFIG_OUTPUT_ENABLE that turns on driver
> buffers for output, so this can by logical conclusion only
> drive the voltage level if it should be any different.
>
> But if we read the pin, are we then reading the *setting* of
> the output value or the *actual* value we can see on the
> line?
>
> If the pin has not first been set into output mode with
> PIN_CONFIG_OUTPUT_ENABLE, but is instead in some input mode
> or tristate, what will reading this property actually
> return?
>
> Reading the current users reading this property it is clear
> that what we read is the logical level of the pin as 0 or 1
> depending on if it is low or high.
>
> Rename it to PIN_CONFIG_LEVEL so it is crystal clear that
> we set or read the voltage level of the pin and nothing else.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Patch applied.

Yours,
Linus Walleij
