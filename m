Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C44F2475DE
	for <linux-sound@vger.kernel.org>; Wed, 15 Jan 2025 11:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736941991; cv=none; b=sCEd8n7oCnjuRQ4AUVR1aP+p7KBQirBMjcUSlP+QRSxZhq05L4khJFXnSNTw7ql9Py2HqFXSTKu8CGuIZAM0EhvzEcbp4h39L6tCgNxOjv2RXm/q1mUl/6U82wu9FyW4U3YEXt1HhUwq0IkRo34XtYaNwRY+Mc+SItl2/x/RzDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736941991; c=relaxed/simple;
	bh=9PW1TOdF77J44g5RTKZ2+cdf9uyr6dz/SQcOrpc6uxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CMsHfCSH0GTWhFPlhFLbS8w0vxgxCcAGcBJpdssbjWY2r8TDSxJx3tGsDylkD89wem/8xDdgp4GM/AXOX4JYQYsSFPBbN0ZxLaWuqc6jniomrsEYvyUBm7IP9Mm/Od3k0VbP8Pk0TOcpO++qDr4ZmrQR06LV1hdsjZbodj7DviI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aCiZcSd4; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aCiZcSd4"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53e3a227b82so5634019e87.0
        for <linux-sound@vger.kernel.org>; Wed, 15 Jan 2025 03:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736941987; x=1737546787; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvqSWtzGtHPP8eGp+zVA1xgjOnLlbFcSarz6cYFQfDM=;
        b=aCiZcSd4mmFeg+SaplTCvASHTJZM3iOGsKWxkDCGGvDgvpnMmRtL5+p9yZuGUrRJzQ
         s0fnH6TJhc9pNxbzGLtafQPYwEgWxP/4eLvNcpkXsCxE7oXoyoMWu643mjaiRUdZ8ywC
         a5ITdZ6RF3XQ5YjpCWJDEEMCOyajAesx0xNa9h5qEK8RCVaTakMyhiADKYAkTOopKQNK
         BIn4q9m0e2RHO93RUFfdsipaHRnfRNuIGK4m04q1d+L7xCGE2phLCrdCjJMPbL3Ncc4x
         Xqx5AyXa6LX8XVJvrPkXsGGCAIszuwoukkIChUFcYPCWGuoUFvLsSHQTt6BioarCHtHi
         4/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736941987; x=1737546787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yvqSWtzGtHPP8eGp+zVA1xgjOnLlbFcSarz6cYFQfDM=;
        b=RDpCZInAMF2m3uFLE5QF5a2aJD4sHRgsyNSI/fOtEG0cXnKEreXmToh3StLdv8O9Xm
         lr+GPZk4Wb4sDql1rsrlnwgXCFNUbbPvddYIl2kdXMD1aJloqknoy6UdVInqQN8zwVH0
         7VsjrhI79qqLSVHAcAN0BtUH5QljVq/9zPkTp5sN/zQ+VtpkwzBuZh0Mxb+ttB9yyWu+
         jucz8tGXO15hnaoscSj9A82/5TPsB3CGKjz8b73yD1pIxwYiTpDAsjiNmqSnfIEN/Hu/
         xv+nc8bhh1tx513phOPyc19QnM3AWVpA8OtSJt9jnc6mXro/e5TqisK6p7tMzvUVE+wu
         9YBw==
X-Forwarded-Encrypted: i=1; AJvYcCVEtGAmQtwsOonTE0VFrTWEzXCv4i21CugZIXZ+WwoP4pHw1QKPi8v46Rh9wi2aGXhiV2Z331UDNCWcSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJpWTVAnQLSik5ajTNNzxTpY5PrI4x47etZKHyqcQKRBh1ZQzI
	CE80zFUihXZi+yqnONaGhel9Az01/jd8eA92B9t3GHUdzrb/FYPD8PVlcYjVqd9VVepntRQp7DQ
	dXvlQsxzRaY8i3seviAorgsLQh9LaxULvhB1A1Q==
X-Gm-Gg: ASbGncsodxQQ0dV3DxI+hVjEeLTnLMm0JpSdHleBUBg9UiRlZFCrewp5T92lBndGzgM
	aSPoCBpiIBbhJ9Vvf9yiTxWNV4oshNWwbmaa0SQ==
X-Google-Smtp-Source: AGHT+IGBlXrCMYgYKLgZmDqCoCkzk9zXGTEbjg0n3d9TmJW2cjKGPCuhqJcY6YuLhBfY419BlW8MYE5VzPIfrs+M4Z4=
X-Received: by 2002:a05:6512:ba5:b0:542:a73d:a39c with SMTP id
 2adb3069b0e04-542a73da516mr2355986e87.49.1736941987038; Wed, 15 Jan 2025
 03:53:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114203602.1013275-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250114203602.1013275-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jan 2025 12:52:55 +0100
X-Gm-Features: AbW1kvZ-ZJDljU7xDZeyhECu0xIb2cb416ZbrOmY5XJEA2ldhLke2kjbohdh8UU
Message-ID: <CACRpkdYPSprYwCz-Qk8a0CqEeec=HVV1AwgVbRDyv=Vk323wcg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Use str_enable_disable-like helpers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Bjorn Andersson <andersson@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 9:36=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied!

Yours,
Linus Walleij
