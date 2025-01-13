Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B195C22CF02;
	Mon, 13 Jan 2025 11:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736769576; cv=none; b=LZNOX7R6TNWuTzeFQ/5o4NBgFaxf+E+kd9vLdfL2R5efa8DHXONcGYCUGYZ6jM0XCZlMnDyrhB3lExW+niMoOvshA6bHkecR4Bvkww4mumGjeiWIbiF3sL3nSw6M8y7/QQmI48w3M9xnXneTR55c7eFgiZgDuK506uuJL9F0d2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736769576; c=relaxed/simple;
	bh=0ziyVnqwVO91ruckBX8kVtEvVd6P0Dly9BB+fEhpFWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OV1oNmr9yFzccd+eqIRfzcNCD+K2YmAlnxF7wrgAU45ZrT1QEHhB9v3YYoIWyIu4TZ4lHzDNi7nIZG/0TxFoiQltZXKlA1wGbKNa98sUkJq1BWsZOhkbon1ipXgHn9mj+xPpR7u5tUULeOzs+brzWWciCYWbAjAJuFrqs4DsZv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ia40z2Pd; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ia40z2Pd"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ef89dbd8eeso5261668a91.0;
        Mon, 13 Jan 2025 03:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736769574; x=1737374374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BZHmOiaKjZIN7/i2N/P/VavWYL8MUkbjD/7u3MK1MA=;
        b=ia40z2PdkoysNkJhqQBg0oKhHaWwmuYMsGI/fmOjIT9PCmkXR9lKUqtcwd4od1NGYD
         MHeVkzCeXWh0sw+5tID86tJrCGBDyPpymJeam6ByR6RvI6YsQHPDPxF6hDRKvX+DwYgA
         GbJO23utpuzLxEzfnlG3yCmRHuhS7sQBu53HYI/4zhKrRrHcZ43pIWwlImhOeFrgD1Xs
         lHRLYjjc95BkQK27ogfbKYU5rjpz4BTdc2LZxRHGn6wnPd//0RT0rUMIjCGWZz+1jFcx
         JpRxLtzoEAwI+Zhh7jV//PeScVodIVss5kysptq6yu4oyhoxYLJNJRUz2Rk8SHha0Fl8
         yHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736769574; x=1737374374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BZHmOiaKjZIN7/i2N/P/VavWYL8MUkbjD/7u3MK1MA=;
        b=SrLOa0GqwsSz8K5Eg3wvqH/UYff0NR6CL+U2TW+hR6by0oHR11KlsrUgruTLH80Grg
         q6YX4shkcaek78JzqWt4H4xtn/YtUU4IL3zfbK7LdU/tYpjHgutor/IAPQe/lgB0ysvB
         f6CtfUikzUH1kmOkAhYYTrRw8hVrtT7rgMk9cyxY12a9jLiRjNn9zt7BqUVDFag9gaxS
         Hpq0WmcQ5RgHbufCIXGN67d6g+KJhyDYxZZTnBGp5Y+EvsYqbEMLYDT8SuDR9/tB0rYS
         cnBtolg6mwgijWOGqggIe1nLgmm/sF85xvfqRZopbawRPn/ExFJYA9LEFtJ6iwzkDYHK
         eAhg==
X-Forwarded-Encrypted: i=1; AJvYcCXIw5qt4zdiObRBhXFPhrQDcd96p1cE+h5/Q78/nJPc33IJ0iEvzUvf5YmYRGbNUo2EJP5tCkLUDZKN@vger.kernel.org, AJvYcCXqFqUKrC4jPG280tIEy6rBEYVpLmmW7ULdZyBFTSi4QQvskn5fo29PTGC6wzln/oVemigfPoz2e+iQhGM=@vger.kernel.org, AJvYcCXsb3+AAxIbe8BkgFS6WiZBEJioPoQxwsaJBiwLARJVCfi2LbMKpW9omkapvUR7DS1BhqPNyruhDhdeDdNq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ZN6tCuVHm3gzqjCP5tGlb9u3jPdj8vF7CeIf5RNfs1h2AXvQ
	Sn+RrsOn8mKbyNqIk4fI6T4b2lSBHP7icrmZG7ArOp+yN3usHZUkG/yVyLdUZrL792p2/OiMDOO
	ILlPv7DpQ/7Lsqq5xFpH4Q6T3ZNU=
X-Gm-Gg: ASbGncufwKu4MEXGVpkAbi1oLnH3I+ra/dPfZYf4m1nFufPdk28KpAD8Ys7ZLnoJexc
	JfiykcluYFlcAhuVZ7o+urIFO+eI3F2W9Hw==
X-Google-Smtp-Source: AGHT+IFFtFvwWjMl/5EMpK2S7nSEZ6pgoPxNoo69HRCpuXIwKyRJxcrGj6mncXjqy6XcaiA0mXO/qFfFeO0UEvjFYlo=
X-Received: by 2002:a17:90b:2c8e:b0:2f6:539:3cd8 with SMTP id
 98e67ed59e1d1-2f6060edd49mr13264006a91.18.1736769573984; Mon, 13 Jan 2025
 03:59:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113090321.3193464-1-shengjiu.wang@nxp.com>
In-Reply-To: <20250113090321.3193464-1-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 13 Jan 2025 14:01:00 +0200
X-Gm-Features: AbW1kvZExglXQIlMfF2a_bl5zrshwSuduhxAp_KYgu9q4zErtaUNw0cuP3BKxhQ
Message-ID: <CAEnQRZCz5Okdy1RPh-Cs3+E8zJdmC7XeQtU1H-8F5oGu2madaA@mail.gmail.com>
Subject: Re: [PATCH 0/2] ASoC: fsl: Support MQS on i.MX943
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 11:04=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.c=
om> wrote:
>
> There are two MQS instances on the i.MX943 platform.
> The definition of bit positions in the control register are
> different. In order to support these MQS modules, define
> two compatible strings to distinguish them.
>
> Shengjiu Wang (2):
>   ASoC: fsl_mqs: Add i.MX943 platform support
>   ASoC: dt-bindings: fsl,mqs: Add compatible string for i.MX943 platform


For entire patchseries:

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
