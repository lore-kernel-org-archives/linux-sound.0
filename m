Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CDD4519A7
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 08:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363048; cv=none; b=Gkem70xI36CAADR6EPBH2MVFt96qQAMIZ0X2OJCU5jNWEY9u1ppzXSH0X1SBnDaRe/GgvSMzWDCyZma2PL9CeHLz90en813Md+/iG0LnghgyfJ639mLy5nmZFcw6knRTIMFGigwbv0V8DFtbJtIRgdhewyY1YhlWWYWSpvz8XIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363048; c=relaxed/simple;
	bh=cHe6pNVAlfwywiNIl0FJcgzfLRQYKHW301gBEGF6laY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AvU7ksQ0ADTA0dO7481BgO4Srf8UQIUWjX+nr9KLhYM+EyuXkS6md94WNhVq8pIV//3IuEs7RJ3EXlWwS+ZYOlcXCAqmstEX0tCQv1MfQ33nFV063cFJhdszq8W1c9e3+LuzurL9PYJLonsZMRalivDNByYwWq4TrQCOdHPUgvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Otk+qGT5; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Otk+qGT5"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso2184709f8f.1
        for <linux-sound@vger.kernel.org>; Wed, 07 Oct 2026 01:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791363045; x=1791967845; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cHe6pNVAlfwywiNIl0FJcgzfLRQYKHW301gBEGF6laY=;
        b=Otk+qGT5X3luUwt9EMp/n1Bmmb+Jysl5xzLTVNisJC0ctlcibqEmUIAxX6xtzpT0BE
         PCiTD12lrNapau+/hVigUT0NhsygClGJUc1f55c4W/aiFfbcGI0acf5vKuzo0DI4IPk7
         bfEI0jNadIsADsUEMWl5jxlP8aFHyQXN2hf3J5nzRukKCE9VzbCLUvQLViBh9ywiePX8
         2ukkUsW4n5Add691FwY90T5cHnrIKm1z+XJH+NUZifaKEE3Ldgdac1qDmOzdrIR3VIuP
         5cVAPW+3vYV3UwWHLK7bwSj3WUmi91yGglTfYY2JFyfJHokgdOfYVjx97bjGqP5wmg+f
         tu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363045; x=1791967845;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cHe6pNVAlfwywiNIl0FJcgzfLRQYKHW301gBEGF6laY=;
        b=YTFJnuAtk32G7agfw/bFQpBWNAFzcP8FsCyJaPbwaPdU3Pr8s059Xo2abgZRaacT0S
         p/pyFosrCz+TkheRqjEyngbDnQbPC4VrFaTZENqw2JdiugBdw33tTHrnNJ8PYmptZM0E
         Ma0J7LcYcFWXf1HELrZ2vWCVTUnVSPbPqeScoCYLDT99SBads3voyAmhrV6nuRMkp3WK
         3+kQ8jZINDsP6prxt0QGZ1hkihWjf23zwQyv0RPwkeJFJhXLCYNhgtmHe4ypvdtgQuFg
         JtDElXFCjUD8XzZpZcVO9ljkEgDX3MYljZrwbOUzPUzWk3VjHNpKTFv1pOSeAwSDs7d7
         wx3Q==
X-Gm-Message-State: AFq9FYKAiXxvCAt/BlYi8Hsupdp5fjCzAKq081PmR6ErxVGZT3pd9d0u
	6H0kAGiBdLEfapBOD54vwlHTt1F/yGbjlM/AhPomtXAap+2KSj8LqHLzNUmv2lSKUbsnNG0i1Y8
	HIqSvbQg=
X-Gm-Gg: AYBFou2O8ZrOsotCM2ygOzG0snDdIzpIc3WVKuIs56Em/9yunYjuQYL2GdFbUMOfMw1
	Ig9A8bDuh8uvZOo07Mr7xAvJ1AldrwsPohmfpoN4OVmRaox1PlEnS2uHQmfYuo0fL6L7xuxCJTY
	bhSRHptxfQEhWyYQuaAj+EIG7Gap+N2/dGbhfJGV3qUb9ExxXBViHw2y9ISaE6nMhZuQMcxSkzl
	6nVYQZXtqXHxLgRvAiWqHtL8POeASssu+U6rYIcEE2cmkHwt+PITPKJl9wBpDYmItPkue19B5Rd
	kwmIF45AuLbj4gfva++54fVi6G2Tx6O8V9OA4bKzYgi/XuA/lAS2VrPGdPRDlKBL5fYXCtkrLJf
	X8l+g4Q6eTeaw/X+GwAUwtGT/cWeyL5sg72kBMN9TiWsmYUQi8HGTfQ8Te3uPmqklKe+H3cpLmh
	B/j52rq4iMsmATwvM8WY7vt+IfboOUToxzsHyecPkRvO51Xr6anDbtgAvoZwExl7AF6Em61wFiK
	SL3RabpXPk9LK8=
X-Received: by 2002:a05:6000:46cb:b0:48a:fd58:a7dc with SMTP id ffacd0b85a97d-48c72787725mr1780822f8f.12.1791363044915;
        Wed, 07 Oct 2026 01:50:44 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3050asm3959269f8f.50.2026.10.07.01.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:50:44 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
Subject: Re: [PATCH v4 6/7] ASoC: meson: gx-card: add support for audin FIFO
In-Reply-To: <20261001-audin-v4-6-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-6-2476646118b5@baylibre.com>
Date: Wed, 07 Oct 2026 10:50:43 +0200
Message-ID: <1jzewpyjvg.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 01 Oct 2026 at 18:06, Valerio Setti <vsetti@baylibre.com> wrote:

> Slightly modify "gx_card_cpu_identify()" by making the compatible matching
> string an input parameter. This allows to easily support also AUDIN's FIFO
> with minimal changes.
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
