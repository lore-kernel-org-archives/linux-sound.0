Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B99191F8E
	for <linux-sound@vger.kernel.org>; Fri, 23 Aug 2024 16:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724429558; cv=none; b=cCcGf4AVBESdzmmVOhX+MFKTW3z/r5q/MKik+QgqHsvqUylRP1cHnY+UN/q09H9m9XNkMcWckDMS5/elrnocqfVvpAQh+8jdnzmxi30ueIywjolr6OoKft/ziqvFUbkUFr+e1X57QczeALHwm3RVRqx4Lr/919nOjXGgv8kB4gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724429558; c=relaxed/simple;
	bh=foDX8nSpdBE7Stl1C+tjFDYcGaddTLXx38TRzjSaijg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iISdx5cdjcgE58SvdaryRdZDI87Wcj5sWSptZOCZOHQpBz0Ed76TheQoQNCpLGkC7YMfT6rCG96opAUrdoo+SNNEyY2V4mpidoOqPBWvt9QmIB0qFjYoENZOsn/AIpN2v/gA4Gm3zHNZmZOZ6MuREQ7vy9Jj7DAQjYqdk/iqWSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q7lF8JQx; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q7lF8JQx"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-533462b9428so3756043e87.3
        for <linux-sound@vger.kernel.org>; Fri, 23 Aug 2024 09:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724429555; x=1725034355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1jmXMGgCEe3vyECBk95vJ+hBk5w1rZzr4yvt3CADUo=;
        b=q7lF8JQx9kaMQYqIConQky3t+HpxtW3GmsnxciWj2X5f+e6FAQhKUEiPASxiYC9Ubs
         ly45/guzT1gcKdyizYSAT+I/IgQ8qvv+Q8RZoow/GEAbxjdfeCaEZ7gS7eBzMA4O7icu
         P2XGLCnVA4NBCsGjP7FkdPwtZvf0mS6bi8/A5U4k5qhOdqahRHDLuPa7aoHV1orSzX3w
         m+OmPjQXNtDI70BapCyWG4wfxhl8/5n9YgOB2r5dTI/iCsvrqEFcapPRVpe6H2ZrmloI
         kAmtTAUpoooM4By7rNfB21Lfd3kD/B4vBd+7fkUcTWvtZ3c0tgPd03mBXCXFCRfRi0j2
         pClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724429555; x=1725034355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k1jmXMGgCEe3vyECBk95vJ+hBk5w1rZzr4yvt3CADUo=;
        b=AuvJ8Eexldr0YDVZwdDV7AUlZBRLPoxcTJa1lssfILRM1hJzYFxneXdywAw3GQbeCN
         bjQsV1/4tIxxbg5zi7TkOfCAXmY/C2Z6KngQB2WILIucVX3vqqDa4k60bHkYHAriWKi/
         BQcCDBbsIWJj++oN8fZAQpKNEm7j1yMPVCdH6v6ZulrHQusWN4B7Y+zbYbVhK0KYTgRC
         Bqq/0yWgQ3yK+oJuYP52V9aEpmUReXPxqtnyIBidhi1hvI7/j43XgmEocA2FIzDCPeWW
         Mfw6FDcQYH5Zek405H58pPwC5TKclQ1PGwNVQXBa7xyrr5cPjTKo29uU5QTiWHIpfc9y
         +OnA==
X-Forwarded-Encrypted: i=1; AJvYcCWOuRms99JMc4yIxo1mUsc1cwMwK9Gq1JIuDY2BApMXPJaMnQmyG0gs1Nd6ir5mZvlzIdvAgWN8Mto6dg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEDfBoVlAAOVFucJG4n029DVdqKXVebIGv6tUWtpuhdjqT+ehw
	5GgZ/4HMqYD1MFxjoG8+huQwD6yeXX/Nm0ZD7xEUvoDU5kyH8gL4uPRS7iNqS8fK8nj2t6vb6aK
	5vlAz9apxZxiR4/E+67ld6aF64zYLXRqCvhuX1Q==
X-Google-Smtp-Source: AGHT+IG7mSCIWYZ8bpH8IAQGda1ENwR9WbQciD7o/G7QbH41YO9wcFnvMe+Pbl1EVS7OeQRr0SFN9rrPBxhDD4ALEaE=
X-Received: by 2002:a05:6512:b22:b0:52c:ddef:4eb7 with SMTP id
 2adb3069b0e04-53438846f4cmr2471437e87.20.1724429554337; Fri, 23 Aug 2024
 09:12:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240811-dt-bindings-serial-peripheral-props-v1-0-1dba258b7492@linaro.org>
 <20240811-dt-bindings-serial-peripheral-props-v1-4-1dba258b7492@linaro.org>
In-Reply-To: <20240811-dt-bindings-serial-peripheral-props-v1-4-1dba258b7492@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2024 18:12:23 +0200
Message-ID: <CACRpkdbaHqJfK7989rx8OaS9mpmdYO2Hpna6dUty_fDgYa3chA@mail.gmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: gnss: reference serial-peripheral-props.yaml
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Johan Hovold <johan@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Kaehn <kaehndan@gmail.com>, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2024 at 8:17=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The "current-speed" property is not a common property for all GNSS
> devices, but only to these connected with serial.  Drop the property
> from the common GNSS properties schema and instead reference common
> serial properties schema (for children of UART controllers).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
