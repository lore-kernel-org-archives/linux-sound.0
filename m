Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C073B35BDC5
	for <linux-sound@vger.kernel.org>; Tue, 18 Nov 2025 14:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763476049; cv=none; b=LquCL2b8/ilfip+YbjAbOOTSTms42aJhLPKX2GV7xm//I5A4xl2dJ2SKvdw1LQlCQj2ReRIlysjUCTHeKnBo+N1uqFs0Zfs9yAO9EVAn2joWq73t+DaL9S3JwO7XryWJwfLvVtU+Ys8m9cyVVCC0zJFWDRc+KuXZU1Liu3eMOx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763476049; c=relaxed/simple;
	bh=c0U3618Vo7lc2qFgsoEiXWsByZFvKNbdECSQiI33/JE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XBG3zCfxwAnIB3Hh85oXp4gUmRXcofeSOf7WBo7ptPRSlDVgjXhbrDvGPb7+tPccNcCIqaotmivklCFj9uNdhzQr6zEvhvDm+YewTVYKvpw2IsxfZ2R58kShI66eUEO/yEkUKELwFZ2TCxig4jtlaMRqByCNr8UdlgQ7vBfRsZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ivnqxogG; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ivnqxogG"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37bb8bef4cdso28061411fa.3
        for <linux-sound@vger.kernel.org>; Tue, 18 Nov 2025 06:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763476046; x=1764080846; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hf2Cxv40+7yq8V71h6ANiFD+N1Zr8f5Q883U3V106Ak=;
        b=ivnqxogG2kUbMlCGpAvOQIqlDiSceg3l+eOwSgM0c602mu3MeTeCr0tZaPAcjA9P5d
         8GHywdC6yybQSJYXQqba9yRafiZJPTSSoxu78fW7PBelD782zc980PWdn7VrLSMqt3Ye
         QCETqTaEHFfvhs3q00nFFGdTfOY+u2yXQwwiJjJCDj21v9/wQpuTc1vBjfcSGS9bs5U7
         RBIBAu/02Pbg99TFqIEG2uEU/425lO67lUXC/++CpKiF7iMa3qgOa4r8litYKCaiaHuA
         VfC6v5X2WjdutAj3TlYtpleLldPSx/Xc/XYhThAy6D7j5hXHI1hiYIn8v8ONzmenlSkG
         JM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763476046; x=1764080846;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hf2Cxv40+7yq8V71h6ANiFD+N1Zr8f5Q883U3V106Ak=;
        b=ZBbO4v5uMmKesPxgyScEKt689VaGEn+kBqFPb6zzptQUwol7kG7Aipq9VzYIcTF6CV
         ZGEEIErOqLp+GRyyiDwH70O35Ur8Bt9lrsfpWrsxRCQdsiUQwi6svx12NrylDE8gncvU
         Na7Y5pur3ftjONx6ZROtWBZ4vR2sZ9urSYBZz8KpimXPcmCjgQIyGe4HVeD7darIUz8N
         eGJ7okDQQZmqs8RIP+3CiAZVM42zVZTNCp0gYcn2ZdfULnDAjz6C0FvSsOuZ28NMo5fz
         e/nkk4d77BIVmcBFw+ezIKzQkPhrIyE26pDbRx/hcXWzSqjmeSgIxnvHmrdkybZN6S4J
         zJGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqSYiqPSxZMUfaHURNTRnp2VbP0kQ1i43NuV1qyNPww3dvCchkVhGbHLsT6MboT2UF6dfZoRQLldH0Ow==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIMSHw4g3AQ+2bAbRHQsM4Fe6m8D2z4/qQ3h5HgpDGpsfsrrbq
	b9BczR7jlAsPmi/Ixw0sbK4wUTGQvMou2qyveaS4X1MPAu16tkGPjQ8w9lHOZ0X/unRA62XkI6B
	Wu81N+8ekBQgSKZqo1GO5/nbOpc/pq0nhpPAkFYms7g==
X-Gm-Gg: ASbGncuQjMv8dPLkLkn9VVG7+pHM3tdqmvjLQoiUsGejZHndoSw+WRJMP5G7xOJu1AD
	VxbFGVFJC1ebcaMqhdi1122KX0qV5WhOhbbpxUaxjOI4HsX0KTC43xkUvJhFTrwXU/bZdYACsUR
	GIVNfKg2vRIgZ1adMzG6hNeqgvLmRTecpO+QtXLKv1ueizM8lOemLZHjV8w7VVXbVgldESQXxqd
	tpMIFRrBKIKtBIU7y2dtxMILnTi8ckoEyFL/5RBKJ7u6uf0YcI3Qx5xgChvR3PWhit/19xeINYj
	FNACIvHeZo9WA+6MltrKpLaFdKKeYp1h21rx
X-Google-Smtp-Source: AGHT+IGoA5UBOXsJ5cVSmQ6gsh1S9Dtt4hgxp5RrgYNaDgN6xDaSj9cgZ5HgZ64YpoGqqFZp56SXUGYxduiY1NHaHGU=
X-Received: by 2002:a2e:a00a:0:b0:37b:aaf7:f007 with SMTP id
 38308e7fff4ca-37babd6ddb6mr36053731fa.31.1763476045857; Tue, 18 Nov 2025
 06:27:25 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Nov 2025 06:27:23 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Nov 2025 06:27:23 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <ab0b2e6b-7d2a-43e6-b8e7-c97cb9763798@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org> <dbe20642-9662-40af-a593-c1263baea73b@sirena.org.uk>
 <CAMRc=MesD5HchG_hfvN3H5ayu8gX_OvSsZQ4UO4f27gx1rRzSA@mail.gmail.com> <ab0b2e6b-7d2a-43e6-b8e7-c97cb9763798@sirena.org.uk>
Date: Tue, 18 Nov 2025 06:27:23 -0800
X-Gm-Features: AWmQ_bmvuv0kqhmAyv1afKHnQoK_7YeLlaSbUZcYwoK2sDVs4c1RAgiSNxeeuyE
Message-ID: <CAMRc=Mcafi6+kRX+9sVOLHCegdU33+omLg+aW4RqeiokymxPNQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
To: Mark Brown <broonie@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Aishwarya.TCV@arm.com, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Nov 2025 15:20:47 +0100, Mark Brown <broonie@kernel.org> said:
> On Tue, Nov 18, 2025 at 03:13:49PM +0100, Bartosz Golaszewski wrote:
>
>> Thanks for the heads-up. I'll try to fix it ASAP to avoid a revert.
>
>> I can't open the link:
>
>> 500 Internal Server Error
>
>> FATAL: remaining connection slots are reserved for non-replication
>> superuser connections
>
>> Oops, something has gone wrong!
>
> Retry, it's AI scrapers so those 500 responses are just glitches.
>
>> Any chance you could get the offending line out of this stack trace?
>
>    https://builds.sirena.org.uk/187dac290bfd0741b9d7d5490af825c33fd9baa4/arm64/defconfig/vmlinux.xz
>
> /build/stage/linux/drivers/gpio/gpiolib-shared.c:87
>

Oh, of_root may be NULL...

Could you try the following change please?

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index c22eaf05eef23..4ce574a21850b 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -205,7 +205,10 @@ static int gpio_shared_of_traverse(struct
device_node *curr)

 static int gpio_shared_of_scan(void)
 {
-	return gpio_shared_of_traverse(of_root);
+	if (of_root)
+		return gpio_shared_of_traverse(of_root);
+
+	return 0;
 }
 #else
 static int gpio_shared_of_scan(void)

Bart
