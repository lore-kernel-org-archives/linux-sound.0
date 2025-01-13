Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C25D22BAB1
	for <linux-sound@vger.kernel.org>; Mon, 13 Jan 2025 14:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780018; cv=none; b=sEhDaDgoWhZlAiafZ2+yoAUHLU7IplRTtoDHXvV7pqjffAljRHSi3C1dgc7w4U2y7C4JAJ5QemoJg3V5apUnh2/2C3wvie1EHuVTMU6guC6hcrrLo9z1keMlgeEf3UAJoSCPZh7G4fjdUjNUx2UpJs87AKfQ8nRCZlUne3s5A0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780018; c=relaxed/simple;
	bh=lmcGNm96qld237RdG4rxnx7X9+jqJd1EvsgaDK4i1lo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Rdu8FSL/8oZGOP3SEcvD31iIXUD934W40n/ft/prqgGuktlhw32g6i5Q1xmYeekfanqXG2IwXPrkJEGclfbgKS23TVnITrv3WIzHRdLTdRHwy1PanLOp1H5fYUzzwmDWKEYtToG2dCWneRau3sSpc5SbVVt0o83u3V25bdc/n4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IcqGu/gE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IcqGu/gE"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso42323835e9.0
        for <linux-sound@vger.kernel.org>; Mon, 13 Jan 2025 06:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736780014; x=1737384814; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9/0zkVo6BPZJsn/AYAHqf+tAnwEA7SioBWvb7jrwaXQ=;
        b=IcqGu/gEp8rEhs0ssP4lqq1zHjUUC+7GNdywK2EFvcLdNtjV/8H9r8VUDm8r8mw9ot
         Hp1MYcVLJmbuj9oyCBU4EgiFhxZPAPAMvcZ05HQc6YA0S8Z0IkGFoFAfec3RsuLiO+61
         1hwqtKF7uErtBBZAQohC9xblsBCwlYofvFpJF9rg87nQQ0fD9/R/HVZIdKpCDBntfJAL
         3Eeye5oXmSF3/3kfVi865jmQnEZo1tortwoMD174Byzx9fi2tlkBkVDvYZN0bszA91X7
         IxMFRzbm96vXImW13KaXeXhhdJa8diB6DNTc699zYTM6XDUqcwaYYH/Kdbp/dsJ+01pB
         PoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736780014; x=1737384814;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/0zkVo6BPZJsn/AYAHqf+tAnwEA7SioBWvb7jrwaXQ=;
        b=AqEWXD5tdQkyrHOldcHCY6mKo//0/viplXC/+VPSBRJ4EzQAgbVU6Ss444wtGhibNl
         D1rMmXjuuGwXDyP6fJxhp0bcWZKlYES7Aov+eaR4fHkbIpjPrZ/vS7aIMP5PdY5P+354
         cmsSB2oazRFhZT/Ch7ADdgX0L0yWZFrj5yZnzzmYUeMefzGZaNSHEv4GCcSZ3UtDv67H
         a6rkM+S7Rf7Nc46vg/qxEyiMVaUXBSZngwfbZdiby6V/Wocp65aSia+KwP6KCOf36hf+
         KFkdE/Y0cwLZjvNZbiggdk/bH42qDhLW4oDtG1PhQ7bssJP2sTFYOvVml9ESVU94Dd5J
         bNYQ==
X-Gm-Message-State: AOJu0YyGEnB7QNelAzJGiUjrD0O3IM+g6Tn2uVOWKGvGjWmNveiM/GZm
	+uDsTmuDkxX/9q44a2j9cXwgK7k38x0t6ukutu//Zh+MfijSBWAqNWPqUlVrzEc=
X-Gm-Gg: ASbGncuRrwApduSD3eEuMYnbquvnthuz0QjnwMJ3mBgxP/a3Ajc4VBub++4VyZGw7Nk
	CrxomCMwFH90HSYAZtW0LLR5fXc0bgB2uRtHPHtBUujXgEw629bEncH2bX7YhkeHvwyWZMnw7LB
	wSJ9n23YVq9ar+RIlec706OFoKr48uij07iXkBGE5+QePo0UM6gEvDMqy0wlaFf+CrJ8lAebnNP
	fUzD05SDJPoz4HILwIK8W/ACIqd58J5VlSzCjMZVubGfE4wcsa/hW+f
X-Google-Smtp-Source: AGHT+IEJCTsIQ3wdP93WTDTAocTSHQepImiqan0vvXGCfqItYdd81SmU4Jd+TPG29liWrOItMHz9kg==
X-Received: by 2002:a05:600c:5ca:b0:436:ed38:5c7f with SMTP id 5b1f17b1804b1-436ed385da5mr144999725e9.12.1736780013786;
        Mon, 13 Jan 2025 06:53:33 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:9d2d:28cc:aafd:8429])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2da6271sm179682235e9.9.2025.01.13.06.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 06:53:33 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  s.nawrocki@samsung.com,  lgirdwood@gmail.com,  broonie@kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [RFC v2 0/2] ASoC: prepare streams on codec-to-codec links
In-Reply-To: <20250110210730.705613-1-martin.blumenstingl@googlemail.com>
	(Martin Blumenstingl's message of "Fri, 10 Jan 2025 22:07:28 +0100")
References: <20250110210730.705613-1-martin.blumenstingl@googlemail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 13 Jan 2025 15:53:32 +0100
Message-ID: <1jfrlm934j.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 10 Jan 2025 at 22:07, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hello,
>
> the DRM subsystem has recently gained a HDMI audio codec framework [0].
> This is already queued for Linux 6.14.
>
> I want to implement a HDMI controller driver for the Amlogic
> Meson8/8b/8m2 SoCs using the DRM HDMI audio codec framework. Internally
> the DRM HDMI audio codec framework relies on hdmi-codec's .prepare
> callback to be called. This unfortunately is not happening on Amlogic
> Meson8/8b/8m2 platforms [1].
>
> Jerome suggested that this may be because of the codec-to-codec link on
> our Amlogic AIU audio driver [2]. He encouraged me to send this series
> to allow hdmi-codec's .prepare() callback to be called - even on
> platforms that connect it via a codec-to-codec link.
>
> The reason why this series is marked as RFC is that I'm not familiar
> with the ASoC subsystem and lot of the functionality and terminology
> is new to me.
>
> Also I Cc'ed Sylwester Nawrocki (Samsung maintainer) as codec-to-codec
> links seem to be most heavily used on Samsung and Amlogic platforms.
>
> Changes since v1 at [3]:
> - updated patch #2 to also prepare the source side of the link for
>   consistency reasons (as suggested by Jerome and Mark)
>
>
> [0] https://lore.kernel.org/dri-devel/20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org/
> [1] https://lore.kernel.org/linux-amlogic/CAFBinCDdiJ3UNVUcShjq=7U2=oUwT3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com/
> [2] https://lore.kernel.org/linux-amlogic/1ja5c4b4rt.fsf@starbuckisacylon.baylibre.com/
> [3] https://lore.kernel.org/linux-sound/20250106141316.375984-1-martin.blumenstingl@googlemail.com/
>
>
> Martin Blumenstingl (2):
>   ASoC: soc-dai: add snd_soc_dai_prepare() and use it internally
>   ASoC: dapm: add support for preparing streams

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

Not sure the RFC tag was necessary, this could go in as it is I suppose.
Thanks Martin !

>
>  include/sound/soc-dai.h |  3 +++
>  sound/soc/soc-dai.c     | 27 +++++++++++++++++++--------
>  sound/soc/soc-dapm.c    | 12 ++++++++++++
>  3 files changed, 34 insertions(+), 8 deletions(-)

-- 
Jerome
