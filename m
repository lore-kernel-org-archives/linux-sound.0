Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E7A2E543B
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 08:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770107617; cv=pass; b=me0ccLDwwyERGlEvQivjOYnJesvjaRevmh8K2LK4wTHosQ6U/7PToYS1TiHxAMaTvvAwGa035zBBbjW6jGBW45DPXwOym8wxhK2l2v1yxWWhjLe+2bAX1nMxqD6eqlPkQpmMxHXUzGqt9Z3e+bo+SZVOpXklAQ7BrmrI4y1mcW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770107617; c=relaxed/simple;
	bh=emyZuy7uXV7Ze/RJbFb/MJbjgAkf0STJ6afujsD5fLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q4/Q3pCc+ZwNOAyp5sfeI/MFfyra2f8dddmtVW2CVV9PXo2DfPhgNC9Pn+KIYPwLlUpsvms2JzmXUTjZl3eeo1iYqiWUIWKwVHVFgfDrK/ie66uYKuM8LxXLdi1Q6YC4lgrd0WFliKEk5K+fJht74rv9qiIdG0It+vqoQAIyq+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDzRI3+G; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDzRI3+G"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1249b9f5703so7099261c88.0
        for <linux-sound@vger.kernel.org>; Tue, 03 Feb 2026 00:33:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770107615; cv=none;
        d=google.com; s=arc-20240605;
        b=EcJbG4t9Vt63JMk2vVxrZPsu6HdZZOfozbxYvlL8/G1bIuPwNRLNlli3qE3o1WZg6W
         6wwICZ1L6F6HOIP7pXy+imNAXD4KJ14x4BnMTAaHB5/TTUh4kRt3Pn/2UpwYiXNGZtNl
         HMVWs6AdRYBuFIoIvkU57HSZj4nOmNCQwZYsY2mAjbzP3wrqK5QizRnz3v9Ckw1GyYUc
         4hquqbofsc9Em+1kFao3p13Bl4COUVJkDcJPC8N9CxSrhY/G+CvGTlLiJjUlp/a/g6vI
         EImJRXd0jQFq2cZKJRomlQETQlejlxM4XtnxjXw0uwmOLTDtNaLS+safcfXRc1JOqdrP
         AHEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=emyZuy7uXV7Ze/RJbFb/MJbjgAkf0STJ6afujsD5fLM=;
        fh=9fynUg32pbdKF/kEIeGVV6Dp/mXXtuJFXoUbLTFB/9I=;
        b=BSYMs6MR60LeXUAMB5R+jV6bvM+U4yzPJ80OzjvANoUZD3wJEH8D8EkkufAQLtIOr4
         mLjAXBJcCpNdOSlhD9+S57p33qEqTYq1LVDv50cQxUZX5u8RtsrAoCWpRFPSUX6Ngnpn
         mbx0OYJvfMQrJhPKw+3kzndsGuHxcEdhtryZ80jGcUY/TZRV0Qm8QzhCsvGd+A8VJzNf
         F0qLTeTIjvCRYn/EOq2CzeWx1dO51fsuHMY/GN+aZUwWCQoYnOgFmjmMgTF9QWN5o9ep
         bzGpfH17Wi7qPW0rpvDHOgqqxJq4E9bpUVQ6VJDIzF27KD8Lc8wskabNzXZkYEkfAhke
         hxVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770107615; x=1770712415; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emyZuy7uXV7Ze/RJbFb/MJbjgAkf0STJ6afujsD5fLM=;
        b=ZDzRI3+GFhKfkcAOUp7EYmFzpnXchUuI1kY/wd5BNwFounq0jM0WuEEV3oy9ZQ+vJd
         oweeekU1CxUgM8ueWVK4NV5wINyP2QUGjAFK0i5a7GOF/xxTMwFnM68B9kkkStEir6Ss
         lV4hB1fyVdJt56xRRBktY7oxqrFrgfqM4aPZ5mL4URW6pOZ0teEdB4D1fYDAGepvkl1r
         3LYYuQdxrAQZ2RH8Yhh9dpXbEznQKUlaoY4Hne7QsGR4pLkLONABkOiDVkPCEYDATnEj
         nrGqTnJuE6dVbI3+H/D5D1rpJLbJ1YKuNGVkrIdPChOJptIJxiO8F7R8Zj8tNMPcD6T2
         KrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770107615; x=1770712415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=emyZuy7uXV7Ze/RJbFb/MJbjgAkf0STJ6afujsD5fLM=;
        b=ewfMQDSkypshSymqr34uo6IjGtbl15oRBMSOL3Yx1ChnOiTIeOIulHSuIjD103uaP6
         VKhySykmbUT+3UUdHllHdk79wpui0z4BBtAloj0zJRCKvC7m/MkKQY34WemGNKA7wzPL
         XLpSH1PQ8aHSrm5+7Au7jqTxMLSi2f3g4W/r5evDaTVEEK6tddrVHytcYDCzQ84N17kp
         BO3Q8HzDmlRPetuDX9vmLWZaBivZB+aJ+2FFg7IuQ7LP9xqimFEMdQ/+xbPwr1xlJWXe
         3px3+HDjJcg4/sP2R3gK/8LltDtaW18zwSLg5wh03TlgWovgeNIlFrhikfmghXK5Ci8b
         vMYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4RPLx/GDwuB5hUHYAnga3CaCrVBY+ZaQQq43UXl/iGyR2g+qRaydIdCcjgTFOviQoRYCp0jUirjI17A==@vger.kernel.org
X-Gm-Message-State: AOJu0YywglTu6KKWhDK1dU612IbDg3ptBMmfpox3RGVQ5Jozjz7YW8sm
	Y/voiGv/yPtH/wHd34ySzYCG0kDSmnO7b6BGeFL/wH1CUs5tHjQEakQEKIvNTcnMjecpvfykBMn
	ssi6osyIep+qAAOAnKN8dTWvI67d+OkA0nVQcEBiM8w==
X-Gm-Gg: AZuq6aJU8SRY1FdDdFH8//yCbnZWLnyW+arb0nRzecfd0HVKop/v2u1mB6co9hSe+1c
	IpZ/Qy38lNOzMDczZBjsg8tpqZR4DAoQ2a7gKmsjvXvP06LqBc2GzevmI2uR16+pjPViuWs2qes
	t8jfnzPpdd5diY1ArzmGaORq2I9XhX5sEG6L3v29Eks6ppkySt1D89FLr116vWF/bSmmWREkvAC
	JjqjHR8qqBs63ZnuHnhnEjCkXLtmuxWITBMLpgzzrHdYlVV4D2fVU7sBc/lp9z1Gr4Z4OQZ2sP/
	y9U0RXPCCD1GOzF28w9GOsTb3fNxQ4Shx8RPlyjS4zG8jxqcM/qKJXbqmMCimjujYQFQ5nVi/aV
	L17iG+bI74Q==
X-Received: by 2002:a05:7022:403:b0:119:fac9:ce12 with SMTP id
 a92af1059eb24-125c0f9d262mr7374498c88.13.1770107614645; Tue, 03 Feb 2026
 00:33:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203031345.3850533-1-shengjiu.wang@nxp.com> <20260203031345.3850533-4-shengjiu.wang@nxp.com>
In-Reply-To: <20260203031345.3850533-4-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 3 Feb 2026 10:36:16 +0200
X-Gm-Features: AZwV_QiN7aElCqGBVfp3lxdbVrrkTZK84USf8JhpYodb0geCaRz0C4JnQWtK0dQ
Message-ID: <CAEnQRZBkKG61b8ytdGKsRqRsfHZ33Q3y+fK0Pkx1hUnw8bWkUQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] ASoC: fsl_asrc: Add support for i.MX952 platform
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 5:13=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.com=
> wrote:
>
> Add a compatible string, clock mapping table and enable the option
> 'start_before_dma' to support ASRC on the i.MX952 platform.
>
> The clock mapping table is to map the clock sources on i.MX952 to the
> clock ids in the driver, the clock ids are for all the clock sources on
> all supported platforms.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
