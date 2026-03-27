Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4664A332914
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 06:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774591614; cv=pass; b=mzWJM/laLSf0QFBsq79KbS5HLvu/nqqJfFrTJfXajVfyB6wi4YmjLo6HUtS2/3SN0q9TwguSMEwrQcMSSYBgVO/AT9hLchW00mkgztAJeKqI/5gCXRA98TJJrRx87abJB5albtnuq6sa+Vn4XB2UY0QvS730w9iRVwiJpbrQZDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774591614; c=relaxed/simple;
	bh=1eCOhhP3pGCR0WGMrPsdTJQh0dsICP3YKEsNbw/PTPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zr3n2eqKbRB9fcoFVq7aws8FPX9LnhVYVAYmTA2hiVfAJu8iyUsRT4drRsGJ4PVY3wpVr+FtUON4knUdj8v1ScykfLG8nxB2WNm5DW+n8qGpUW0lWgWHK34BXwz226gTWjqS1BAmEAP/54ZiqSnaOmAByxvS64vvI0evKKKYito=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUMlb+ns; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUMlb+ns"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35c06831dd3so1719316a91.2
        for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 23:06:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774591613; cv=none;
        d=google.com; s=arc-20240605;
        b=Hozg7AHjaggSPxODp8n/5aHnn2SAXWnbU2ZPEmKVvx3VmiJv/eK6Dkl7kdP+sUnR/S
         uI15neBSXwxtNR0W/7xAwEbrt1DEAkkAZT4IC9jnPZganwX3atx80fUMmgysoJXbO1vz
         RX4l9k+xde54tHu+eQzHmVX/0EqHMXdPccr+Hym+PnTC5qUG3XS91DvJ5t3sFHAa2i30
         6bNWgpGMc/fINkUt/jFt5U3fz/1FT5cAttWV4qgNhDcgKd04eW+Q2ef5ZgACxRziPW81
         j2Xgjii6I8R1x2PGZrlKTu2/GiSQqJUdkgdh6n6Z1Zpey8t+9BL/OPbvFewITqCZ+q9t
         M1wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bZor0r7uOoAf8oDJrrV5/yzEdBboUWXz0lgUtCeRdok=;
        fh=N/BUTuDreerZKdpeqCv1qcUasnhhqg2fCZMOOaqsYj0=;
        b=b8/5ASTmfEupCzwlsgrBMdaiMQ9rDPHGePSA4F/10+DhYKfY214YBTlJHxdrgmESQT
         V+TJPPCAisqeDvdLKoGQgpex3nsopvzDOmbPZG7Sb/JzC/NMgXSQdjnMaLCH41gHb98j
         41035qqHGhuHePLmhAUyyolInwcj9+9xBemDG6TsQUrXLPbVy7D+/G/b0VujWhXA9Xhv
         46vWhrA4/zyh2i8NoV63KCayN/BRmQecmABGNsEKpxO9eW6rRc2N0wdqwy+OrDZfZXrW
         lny2iyPuz6LEVe7cdi4qdHpoL143cLjWo4gzoEOV182+sGWZVbcID04x9ijzJoofb3Dk
         tBLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774591613; x=1775196413; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZor0r7uOoAf8oDJrrV5/yzEdBboUWXz0lgUtCeRdok=;
        b=cUMlb+nsVqjrLMaFF344xl/Vz2YfmkeeCJOxtYAaNKC1OFj9pIr4x/P4wp2JP/FrZ5
         4i6b0LWMzoPOsJlS3RLsvlW1WxvFG/p4NZ52n3xGwzQr5UohTL7j2AL5jiUkDJHVbSkz
         y+ZPgYJArL1a00CNyfXQiBbYqfigKzuPmipxxuQ70IuX7tTWcX+FTnxW8wStOfbtEXzq
         DDMVvhKpt4urQjChq4/lB7JxgqFq9n4Tt9bLTKA0bXtwdGjd5j+Ch7tHDUI0AGgTq0q8
         vz0GqtyJ4Dh8AaLlqmqaVdjSq5VTmsaKQbUF0Ip1fwxteQf65zT5JM++vXJ7sjdQa7s7
         lwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774591613; x=1775196413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bZor0r7uOoAf8oDJrrV5/yzEdBboUWXz0lgUtCeRdok=;
        b=qW/o0RrG5Q7SGDcJpHlxHJq4igKsb3pY1ZJGiCkRxkfRO3gOfTpFe6ACVNgMK9+/Pz
         dpDLYwusDBzRr1AzAEwLUby3nwoEbq3+1YIjEGkfOaZKldtx5josxYZGLI3rLuQsOVem
         Ad3nMhunftwAYNLMXChPCrTld8EfbazrH6+xpMRdRLEJssLac8PgaW3PfSj+3vsYqIbR
         FqfJ2zAy9I1RbOTAZfXAPK1yng3YCSZz0bO/rpW2mdX/dV/5ybKu3t0ckfcyJ82ri3e+
         OTKOCVRCMUjm0gWc9sC4tcb9uy42L/Fxhv5K1DOX7Wti68ozJLZ3Y5v7fbz+D082xTWV
         zHNA==
X-Forwarded-Encrypted: i=1; AJvYcCWyPaDQL7Z56qqDLu2PeJYofmaUa8g0i8HqAO/yoqvPSQDf7W2Jx1ea16m+m7pzDOL6VFR0dkqI9ZfqDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzK5ek68uFwZ+vuAGpLm9eAF7efnPPspzdf3QlclX0InGweqN2T
	LJIDArfeWnNPCqHelp9PhoxNk2xiZ0qhf6yy+H7o84svjRp2w3X/Y79VMlrqKJo0jW6uKeWgnXF
	nPXC8ohCSf+VE8/llEkh3eQsEpPhXxoI=
X-Gm-Gg: ATEYQzzO27eSbcHvKvsBJ8/fwVeF5P1fBxPf7ii4fc7G8BIHmgjt2Gq3g5RpFN0wS1q
	3mhfkojHzMvk/X77JnzFZNwyghb7cgTErq8crYciUhuicfoXgDkGeZLITWpud8SAnKdbehMaMkK
	I//DPY/GXCwHsjTLc7o23ueubOAcjHihIiHnzp6SjjW2Sj+Y0CY7y32L8IG8U9NjQoAzKidC3rx
	A02MABglAvIP60bw9n2frKVIgjmR1Mmke7tiUGkOz6r59aXZXl5EZ7kDXTSCRZPNIyNXJijMVYU
	dRojfkw=
X-Received: by 2002:a17:90a:e7ca:b0:35c:f82:fef2 with SMTP id
 98e67ed59e1d1-35c3002fc51mr1380306a91.14.1774591612670; Thu, 26 Mar 2026
 23:06:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327031504.497650-1-chancel.liu@nxp.com>
In-Reply-To: <20260327031504.497650-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 27 Mar 2026 14:06:25 +0800
X-Gm-Features: AQROBzCzbEGPPttZKspsGG1E13nIFzodJ2Pa5Qt8YvIkcRF-KWLW83wNwQFeTOI
Message-ID: <CAA+D8ANNmKX1oULZH=N8YE0hp24pP1JSvS9srugq+XMo+sQFnA@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: imx-card: Add dsp_a DAI format
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 11:15=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> =
wrote:
>
> Existing i.MX audio sound card described by this binding use codecs
> that operate in i2s or dsp_b formats. The newly added CS42448 codec
> requires dsp_a for its TDM interface. To properly describe such
> hardware in DT, the binding needs to allow dsp_a DAI format.
>
> Only i2s, dsp_b and dsp_a are included because these are the formats
> actually used by the hardware supported by this binding. Other formats
> such as left_j, right_j, ac97 are not used or required by the hardware

"pdm", "left_j", "right_j" are supported by SAI, so I think they should be =
added
from the hardware point of view.

Best regards
Shengjiu Wang


Shengjiu Wang

> currently covered by this binding, so they are intentionally not added.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
> Changes in v3:
> - Rewrote commit message completely to describe hardware requirements.
> Explicitly documented why only dsp_a is added and why other formats
> are not included.
> - Rebased on latest code base. No functional changes.
>
> Changes in v2:
> - Updated commit message to explain current support for i2s and dsp_b
> formats and new support for dsp_a. No code changes.
>
>  Documentation/devicetree/bindings/sound/imx-audio-card.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml =
b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> index 5424d4f16f52..75757fbccd89 100644
> --- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> @@ -37,6 +37,7 @@ patternProperties:
>          items:
>            enum:
>              - i2s
> +            - dsp_a
>              - dsp_b
>
>        dai-tdm-slot-num: true
> --
> 2.50.1
>
