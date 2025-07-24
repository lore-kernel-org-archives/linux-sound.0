Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B343625524C
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 10:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753351335; cv=none; b=rvrAcijkG0rZEtUmKN33wf3uIMwdw2rbdzf1/Rm8TYmLQ51iynjQWUdwliIPQRNFehX3UHlYaJ9WqfAW4OBKBtPp//4SGY/nYF4IG9ZvRT7kej3PHcOFj9cKxebbCbMlbSabDzLgaBPQ1CB4YQqMPNSQa+vvJ7zq7okziYm3bUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753351335; c=relaxed/simple;
	bh=KWyqMGEUBT6sPlAYGN8ahqpDMLDIFJaLyGGzuzUqjK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RMgV6ubadGP3AycdSDDc11wIYVvBQqIleAOWrE0Ee9kTl4/gPysDJmWQlfwW8HHhvphpXsvWX51DWPFVPK9wBMXYpavd3OacL6yAsX8v9ZmM9r/xVbH9TOZNuFSPOlskLf7rgzdQqYki7KEPTU7oHBL4Zb0vJdBvUj44fFclKw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V/vPM8Rb; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V/vPM8Rb"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553b3316160so798939e87.2
        for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 03:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753351332; x=1753956132; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWyqMGEUBT6sPlAYGN8ahqpDMLDIFJaLyGGzuzUqjK0=;
        b=V/vPM8Rb1cbKAv+XnKhAJOmIjhQO4tB4NYqtbMsIQL7++wi1r1fweGMRbtHgsBo/Fm
         zYyyOLRDr8faufcUrwibj8Spaz00uUBCsmQ+qSzgCbek0JhsssboISKnyBfMp/3C/YPn
         njKEMYZwFYlJuwY7yQU3VSUy3nc9MBGEtQqBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753351332; x=1753956132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWyqMGEUBT6sPlAYGN8ahqpDMLDIFJaLyGGzuzUqjK0=;
        b=LHh7LSxNHfdqw4vwtQGW8qd/9y754tzhIjTC4sylr2IuCYVzhNDeVe5oboWp1W+805
         sIq6qq3CLMK/014Ut1qlKky+HtkYy7CULeKyhqcsydyjpeordVLGSXVjMrha/d1v6JDv
         2VD3JzmG01ThIUcq8SLXYbHAdoCiSmKEFaU0DWR56GTkbDEzebmNXA6vyt3GXJvrGPQz
         t2T35/L53JwKqlHnrZy1sy3EgRC5YdSB3zNF7ObRNTryeH1ozMLzhdrTgf67UNAbZKI+
         kUTrFLgbT+x0SQ/AwPWnpJtclKT+CXCADwyoQpWHsjaypH69guebbXYIN5sv/VBZ5FkP
         uQPA==
X-Forwarded-Encrypted: i=1; AJvYcCVava5m4S0cFEQDh6/BsiRbnHj240EJsacdVH4+uSGTCqIL3npncW2uvJRxEcawSvxuBXfBS/Wfy6HqCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtywKcbwXRHjhZAosItzTLrRkF/yvDlI7gWU7GJ4skfrNYcke6
	ywa50rXigDHnwoiXZy6obWAbjnF3NJ0sLH+1/mKbf7WGiPpol5beMk+nKVX3JflfuKRA23m8emh
	9gDIxdftvQa3wj9v3fL7LJfvQdns8LhpmXqbdsvGO
X-Gm-Gg: ASbGncvIxpJCES4skxMQE42OVY+EHwu9wFUdLW3YsOtrPfFyY8ocRWI+Vi2iKokzk0L
	CtAOeel5Jy5kATna5FwPgqY3+Quw0Stt2VknVWq/scNNlmvwzqMT44AwMdrk6XIGzGXf9AmFrXk
	F2iVQYI2NB7Q1e5Skg7t2xz7fKOTdTiUwzHKFJoOIGgS/0KZxIvZ4vXEuOvoYyYi1n0MjB6xwwy
	8fVa47xIWNZnLRTTYX6kip8MtH1M0HGFBk=
X-Google-Smtp-Source: AGHT+IESUy0W5d8sN6DOxHQC9VYSfHke7csoBbtn4oiuNMESAIIOLfvRI9EoIcZqqzK+oAmlqA1BtKODIpYwZl1nk3k=
X-Received: by 2002:a05:6512:b06:b0:55a:4b25:b33b with SMTP id
 2adb3069b0e04-55a513879f4mr2300615e87.15.1753351331794; Thu, 24 Jul 2025
 03:02:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-36-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-36-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Jul 2025 18:02:00 +0800
X-Gm-Features: Ac12FXxwmEtskk9yW4VS4U_sXrqKN7rxCsdJIjp0VaKRTEqFbUzw8Bs63nu9Nbw
Message-ID: <CAGXv+5Gar47gRZoT6DUDpPRabjzoSE==Zi0wrR76A7g-SJL1=A@mail.gmail.com>
Subject: Re: [PATCH 35/38] arm64: dts: mediatek: mt8195-cherry: Move
 VBAT-supply to Tomato R1/R2
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

On Thu, Jul 24, 2025 at 4:41=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Move the VBAT supply to mt8195-cherry-tomato-{r1,r2} as this power
> supply is named like that only for the Realtek RT5682i codec.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
