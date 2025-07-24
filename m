Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2269255F3C
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 09:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753350603; cv=none; b=uA0Xi4Ad6dBKQS1Unk8Ec+1rMQ3lrbKaL/gKwRy85jLbx+qqdfIB+BMPwT6E89AWXjeH4RZkzGhq/pFJshT3lL80t56xLw56ksAzcv6NKFcSlbp7TgEcyN2BaNdfelK2fU92sDtNsYWFe1ks15PhlkhG6NJDV2ElFsc3XVhDf4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753350603; c=relaxed/simple;
	bh=+1yeaes/5WO9C98Ce+RQRl+sqAXx+8dUlJLLdWKreso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y7iJxBMz58GBbZlQOTKr2RQ1DFImAPTSE5+heNmHL0Jy0tAmYUCpn+GgRW535JVbrh8QuvTzr5N5I1ysy6EN6Gvg4jfNUeDreVfmpLhqHwQdUpMUEcPS7KC+nHcXu+2Q16P2kPdC798n4MdDyGxls6aaKN+qonWfgFmK1ZIWdp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Sx/xulJh; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Sx/xulJh"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55a25635385so877302e87.3
        for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 02:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753350598; x=1753955398; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1yeaes/5WO9C98Ce+RQRl+sqAXx+8dUlJLLdWKreso=;
        b=Sx/xulJhXt296mnd751zlozvO9hmHj6VxjVSAz8m6yTaPTLv9QBPC0UptAjx0eFuVc
         XmD/9IGcm1tSFFDgNReWTVEZf+hA+8drt6emVomXJ7FjbsSwi83t3hHFemM7lEdWVSOt
         sB/lZmGDjPF0DhLo9GZr1YyTbyTdsnurUXtf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753350598; x=1753955398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1yeaes/5WO9C98Ce+RQRl+sqAXx+8dUlJLLdWKreso=;
        b=FssecOriHf9MzkefDRYVdO4wiA9nxUFILXepqZi56bqlIduPYIGVGSW2HA3MuOY8sq
         AtXBHVOWZoCpGPkXV/fZQ066dFddxl9Mbf+glGrtaM90qQqru6UzbwdeOciohyICZwfV
         RlzZeF9UXkrOoJHjOQro3+Omy5HKa1cr/YYN9w7pgc2Gxw4/Ksz48LZHQFzr6ai+4qJN
         BuJUovGs7cXOmmbe01aK+mOsDvEQz9OgHnUzlwW/6vvm88RIUhFO1fu4jiVL/a+QsH+d
         Yn0VzqcAw9dZyQr7xp+Sr7Lwz+PkfhX6VoinrWACiZEuYclYYfylD5rWAFxY+PZRUXVL
         YfxA==
X-Forwarded-Encrypted: i=1; AJvYcCV0rgvHnCG6aPpmIJ6tI4zFuGauHN2YSrr2/zIXRYtnY0MkI2t2Rgzw5WduXFmASnQyE08DHLaRfmlfFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1dwMyawTZSmZvwgm75vQadTplIqlr2Yijc+cPn5kB7BtlisR3
	Z+fy6fI9BsmUm2Rqe9pA9ijI9PqO2h9QOoJx3baGurh2v02na6yyWIciIgnm06N5kofaYKsSm8/
	TDuHWqAE8OpTVqtH4BbXnuIlcqPBah0fqewS6E2S2
X-Gm-Gg: ASbGncsJaYO/7B2PkgNo9l7A/UTQbE56YdX1yqu9PhQha6ojcWgDVMwUNmASRmwVqV/
	Oaqs5eS/FgoVah3s6TAddRr09uYgq0Edh0HzvZZHWO7POtwP6MCrcXGwJhFttf/7hi/aIyNVsgy
	7AGLsHdy+lGcZx1MBTEstfQg4jJin4EbJ9xa8T+JcT6HJD36PyQz1HpgfFH2ZwVWmZ1a4CQi+nh
	nXVkTj0c814LajaB7nXqL7mhm12aeqtOAI=
X-Google-Smtp-Source: AGHT+IGItj9eON5joXD9a2IIIdgBC35OTh38AkPzmXEBTTEZMPnEPcqJK3Z5OhBEkyMLKp8WCCWs6kzvOlePUXbqfGg=
X-Received: by 2002:a05:6512:239d:b0:553:2dce:3ab2 with SMTP id
 2adb3069b0e04-55a51354ddbmr1925545e87.6.1753350598082; Thu, 24 Jul 2025
 02:49:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Jul 2025 17:49:46 +0800
X-Gm-Features: Ac12FXyptxSYdnZvhVmVzcLhUSOXFaRzx8la2O9AgbSx3nJkJt7JLwM6IxluTrU
Message-ID: <CAGXv+5FWV+RtWUJW=e5pJKiSpeK57fHpTrst38bN=1OSgf6P9Q@mail.gmail.com>
Subject: Re: [PATCH 03/38] dt-bindings: mailbox: mediatek, gce-mailbox: Make
 clock-names optional
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org, 
	conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com, 
	mchehab@kernel.org, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com, 
	vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org, 
	linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, 
	tglx@linutronix.de, atenart@kernel.org, jitao.shi@mediatek.com, 
	ck.hu@mediatek.com, houlong.wei@mediatek.com, 
	kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com, 
	tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, shane.chien@mediatek.com, 
	olivia.wen@mediatek.com, granquet@baylibre.com, eugen.hristev@linaro.org, 
	arnd@arndb.de, sam.shih@mediatek.com, jieyy.yang@mediatek.com, 
	frank-w@public-files.de, mwalle@kernel.org, fparent@baylibre.com, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 4:39=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The GCE Mailbox needs only one clock and the clock-names can be
> used only by the driver (which, for instance, does not use it),
> and this is true for all of the currently supported MediaTek SoCs.
>
> Stop requiring to specify clock-names on all non-MT8195 GCEs.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

BTW, I see that the cmdq driver has support for sub-nodes which was never
actually used, possibly originally intended for the MT8188.
