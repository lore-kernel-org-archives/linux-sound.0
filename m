Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0B434B191
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 10:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762857833; cv=none; b=LaNpI3g4sQqjlEYXupaMhpuHDXLxthfCixDdVLt3mAdfV5EpnnGJ+3WsaV5CCXBZkD/jQgqVyd1RDUXRmpD47gxo4VsBazAzayLO7WBIEe/L9ToY0SO/rbJVsL+KKzY+uCSKE7xGUcp7XQuAm9xETPzks9c4anYxQo3UlA8ox7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762857833; c=relaxed/simple;
	bh=SskqgXLt/V1yNmdj79sn9yutCDT6ypSkI+cVjqdA3Ec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UI5YZ3ibyQ7GI9FBGkWweCQRutHEXSq79ssYOje2nQfP6re47+fvSlRGIUeeZCfnilvtBv58boLR1MGF5FDf+KaWuJI1c/fj3qBLMZpRz1i8KrzpznfXo8hIXgU8H4x1V4uU3gvHsN+HuXt15o5USSMr09e5KH6SbNni646dxYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aoAMdZ4G; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aoAMdZ4G"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-787c9f90eccso40348307b3.3
        for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 02:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762857830; x=1763462630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SskqgXLt/V1yNmdj79sn9yutCDT6ypSkI+cVjqdA3Ec=;
        b=aoAMdZ4GDsVZXOdtQdFRhrMS2K3fyqxHTQL4UBooKSpJdPhUgkBSNYsJV6WvoT51D7
         cyxRV9vXmiA5tj54QvVnCyMyzWGqR/Hjv/oXFkTmuUVpTb0BMJWt0qQXel/hVwMDraIP
         QaAo9b+LpZvYzkZCipeF0l6LxqvcGbwbkel0tt3liCnkLeUzc1LUySbp/ITGRYfcelwL
         Mat6DeVw7O1sck6zgrNz3B+T3pEOuxgkdY6h7KZgTMtNLszAf0bFk1mLgZcYHsI+S0QS
         ZMjtGjd7B3q8FV/rN3oVtqMgYclaZCMKN6h6TrSmcZLcCOG2Pju2JP5lxRq6IngdETGg
         SYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857830; x=1763462630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SskqgXLt/V1yNmdj79sn9yutCDT6ypSkI+cVjqdA3Ec=;
        b=BjrNH6aj036ACbAyn1/TnP3TIhPL2b6qsBMymyEbL3wu7LGnQygcPYE/QgjClv06CY
         Bp8tdNlXzbROzEdCDLFBIA7Ly72Bqn1zYsksy4b9xFPpKwnznTFTuSQME+IvPBpZN/wy
         ps4oUuJew5XO98cBhsV6Bg9UTXSVFCuUxI60nQdl7DUHyUJPewz2aQYG5JVbwD4PI0m+
         6aPdolczRAI766lsvX7AwJT1fLNEoUMFEcIsCMrAGOl/v8oYtml1d9lfEZHaGIaxL6vH
         za+udzV3dQqXI6Pco7IAqcvEWhKlu/s9Mf6F3xUY4ey/oavqM5x5fAuCiKni3S0iG2iT
         iBbw==
X-Forwarded-Encrypted: i=1; AJvYcCUGOl2Exc9ckzlgJFjyoSzU++DLybxS/vDENUBb3+nhABCIyr7Li8BI+z9vRADZBGJNwQKv+J2QWmQ1AA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5iVEAN6oLtxKsiObaGMKwGt2+NXzn4ruNp9qch9bhLD/DyCWU
	gtA+Q5xsKqHQVUwcs1aoX7VnTntGvMp0SgVj7j0xFOqEGBiED2zUP1e+e0h78O2/7mjEHiBSktf
	0Wwbh2YyBbY1lpLR2T9gb3QkcYMolgtVJKNgb875jMw==
X-Gm-Gg: ASbGncvEC+Ey/jQ1TQRNBLi7HMUlXQ+X7GyMcqfqsUwP/6r9it7B3inbfqvEkmknrnI
	yMHiDU82UIeVPlTOg8eFs/6AmMncvNrEQL28NLTt9k8Hep6ps4l9but9aZvLX7gUYxlFykpy+LC
	QBhBgfKVXX5ewd2B2B4lXgOGvrBT6iFdfaBBMyiQokWFXek/Hp5D21wfVpCMeQrM2U4OecfwET2
	wvgaHqdwX4mqyNxuzh5nE5tKMR1p6FpQU4DgySxirDhzGO9FP6Z7kQRXF1dfcPuWAkYwNU=
X-Google-Smtp-Source: AGHT+IEi46gFe2Gc58dgZGHKXPtg9MeZZjbfraM5Zhb8zF1ao1O9DUHuINeceNpyj8ML6p+v/cNPJjLoRvHJIEr4ZNE=
X-Received: by 2002:a05:690c:3505:b0:786:9774:a3d2 with SMTP id
 00721157ae682-787d5470c8emr109020077b3.69.1762857829792; Tue, 11 Nov 2025
 02:43:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org> <20251029-gpio-shared-v3-5-71c568acf47c@linaro.org>
In-Reply-To: <20251029-gpio-shared-v3-5-71c568acf47c@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 11:43:36 +0100
X-Gm-Features: AWmQ_bmyzwb3DdThSflgKKoxHLLAiD3IBdKLnNpObGkxmw37AFoyfkH61KGqKvo
Message-ID: <CACRpkdazzchuetece8WOJ+0D002HXhUvK6d47JmyeAauopoZXw@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] gpiolib: support shared GPIOs in core subsystem code
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 12:21=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> As the final step in adding official support for shared GPIOs, enable
> the previously added elements in core GPIO subsystem code. Set-up shared
> GPIOs when adding a GPIO chip, tear it down on removal and check if a
> GPIO descriptor looked up during the firmware-node stage is shared and
> fall-back to machine lookup in this case.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
