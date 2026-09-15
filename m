Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CE9483BC9
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 10:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469046; cv=pass; b=gNbraKHTcexJgRovvS58jRDmoN2yhDfuNUP264Bj0yk/W8gnl42lrZMCo4tymFr1X9TFtvk5Mr6HWFw2dz1hvIoK/2wsHJcneQs7FbFY6rS3MiCJzbb0zjs7+Pa6Kiub1H1NKAhNvwRihObzkKPIiyHfMfRgi8ygcv/sDNvhB5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469046; c=relaxed/simple;
	bh=BC4g6GYfVnAJusm4bR/i3m2jTHJwUGIeIFQs4VGY28s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZaLjGeZ4bh7oX4zINdJYDc4jtr4fmtlY1ZVtp3B2tbO3uQASXiXuAJXG56Gn8QOkdcM6ZQEFihihGzbet/rIxQQqZ1d+m7wPG3GV57picNkjcDWapn37rP9ck+sKWZxXSEhNm1UPdWTl8UJea4+Hn8RngXsl38UiMdnqJ6AKpmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sujRAyas; arc=pass smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sujRAyas"
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-86efece610cso98104b3a.0
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 03:44:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789469044; cv=none;
        d=google.com; s=arc-20260327;
        b=YBEHRDD3XFfXD0hVEO4y0F31PgSUsvgHa6lttWkRfsjjtjAudPKH8r2qahEl718IZ+
         ijpU7CL63d5keBmuSz9N0lZIXPxixHD2uQsxMiYJ9dSgAlI1qsXl5e4FrDkh/+elqhZA
         r/xYYsblFwmSIm0k1II2X1wn5kBgU2YTHZkrVRKnjssoigstjaB7YACypMIfuOvL2cMG
         jFPiDoUV0OWzlwssPFY7jMibfrnTy2QZd3YTPIhQO77pA8Ni71tG9f9CQh4bg8CgXf9h
         2qpTc6HBucdLi5MGQoq8K4D+XUyu8aCmZmcUwrV1Gl2o7A3Dkux7O6hGE69JatCZWA0/
         Y4IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zfPKfvo/AM7Ulb6yBYpei2bDUWjlSzZjeWLopxBStpw=;
        fh=6Bszg7sctbxH8T/u8M/7dDKASDmv3CK6q4VXcT3l/Lg=;
        b=Vs+ke5FH1muHY86NBUvLt/aZxE21meQdVrM76TqFXuL+CjgLP40QlCrNWSmdbmlSEJ
         Rvfb9FnI/e7zYoV5djOtVOmtzn49xl7agoyXNcnqTla6lq/HI4C/svh0kn8RoV3MLOQd
         FprAUsQkl2pLenPhhI6bFKXlUgX2nO9ccnWibWJEeRVjUvgAu1lqBzdP1aY1m8gjI3/y
         vr0i4mRzQ9EljNIIFUS+IQrsTK8zTD2OnsYdSNccqooGsw+QJtbhGy9toC5GxaN3gwDa
         xEOh5c7mrjQX8DtJ8AF9MbZF6P3uWRolGRAvyoflcAYtPiYv2+rUa86r+f/PXDGAwzHZ
         6ETw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789469044; x=1790073844; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zfPKfvo/AM7Ulb6yBYpei2bDUWjlSzZjeWLopxBStpw=;
        b=sujRAyasZwRzpe5lhMm0L5AbsV9R20Jxr/mtSd/GiKn0ObaOX9UlaRNkhKkzZlJneZ
         QfdJd3wXOscB3Oyh+7UcA+geYBsRFZA/pKQOJMtIQFapUw4T+DGokZp8oj9UX+X/18yz
         nw+K8r3cQwc4Qm2G+ev/E+EnlPm6PQuKYgLJv72OFEh0HdedBiR6b6DF+FbEcfepMXSE
         KQaofKxr3EsX3ZIq43PXPq6EnTsuE+QQoEHa7+7bQrON0y1uH5sH002aD7y+asQI7C1n
         9s1Bw9R2yMJl1aYd1sex7HKVYUToa57/A43Nunfi9nxrTWAkQ85DtCGWM4+FhcPnE0YM
         87VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789469044; x=1790073844;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zfPKfvo/AM7Ulb6yBYpei2bDUWjlSzZjeWLopxBStpw=;
        b=OzZDJfS7cKANNd/dQbILpc9mmTL+baJrDHsRj533gCaz5xLMAbAgWrTh/RGHH9c5mM
         vHRqJamp12iMxlt4r9TXFe0uQlDIBg5Q4PfHuwjTHkn/i7gs/xH1WDTQ+fLhO/Tc9x6P
         zg9e2TfDDFi097B3zYQQkmZnCqXxJXQhd+0VDVdQ6J6/H3QQidH/Zj+Fu9g9UMtYc+uh
         0IyCfAKhH2m95RE/GNmaLexn/pas5hxhNtFac18yQTAeZ+mYSfgisCs7tJz3QEcgJ+Hw
         ggkHnuXBxVLxzAFKR/aMn4rnlWq6x01bFHoszpuYw2IfZo4AZ3sdLbmH+ZqyQXDp5Ldc
         rrBA==
X-Forwarded-Encrypted: i=1; AKwUvBymlLOH2Dd/mJrxDzh+kKwLqlp6bOp9ih8Jrlo4WlPZwqkA0DFOibU7YDpmygpmNm9tiWdq/TB9x1J5yA==@vger.kernel.org
X-Gm-Message-State: AFuF++mbw7OCa5rcEyUwmvgNe1wSoKRMX07ONrSs4+vQz00YMjgS094T
	gKEmjwQzjIs/Lg9JmDXyc1W/YfaCq1SUEr3ttbB257tw9UhA0gVH21M88LvkVC5kUhMoEc3YLqI
	mn6H/d7Vk8Fo47Ybt2dR33R6WYnGg8FgHYmX7
X-Gm-Gg: AYBFou27EeWEtoe7LgEhPDpfVQT57OJ3y897Wi1u0PbDbXu1Tg6RpgnMVzNm1FDYBlU
	wErxb0vjqcwg8XVTh9wmYl4cw4tRlyLF2fIL8QiPheT12Z8f/ouUt0E8BDQXtRZJ9Q+YHAcPLmj
	F7wRuEzZW3JZuSuvYjVnBs8LBKw6/w255wGcgTTZRI/IwL/zTUihuJ6L4aw3u17M7BMkrimmBly
	bCX2OrdN0SYiAupMCsc6YRErowN4GIOwKEYPPJOJ8dUlWBw86pBS1PMu7FNn62DIJPOHlCRdYPW
	6Q2Z7b7lM7/rPqtrgtvPGzoprC0llqHLo8W0BipK2MB50mVDv5xgOg+lt32/QyxLwgvrlzRlq2R
	eR4LSVDistsIApTi+vHis9dvWZg0oMK4tuyODLwmnbeE73E9GQClcjeu50p4CVvh/ih4=
X-Received: by 2002:a05:6a00:4b0f:b0:853:59ed:5539 with SMTP id
 d2e1a72fcca58-871802d02a3mr595616b3a.16.1789469044380; Tue, 15 Sep 2026
 03:44:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914072842.24420-1-phucduc.bui@gmail.com> <20260914072842.24420-8-phucduc.bui@gmail.com>
 <693fea96-1905-49c9-b1c5-3fa1ceb4874a@collabora.com> <CAABR9nH5e=kKRsHQYx7u3HtWgA3C897d9dH4h+wQTpZNGaTRHQ@mail.gmail.com>
 <CAABR9nGVYghGE-kshpeJQJrvuUFJmDATW_mBCoJfVwDNVnSErw@mail.gmail.com> <bcf23df0-30bf-4dd6-b5ad-7ad23f74efa2@collabora.com>
In-Reply-To: <bcf23df0-30bf-4dd6-b5ad-7ad23f74efa2@collabora.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 15 Sep 2026 17:43:53 +0700
X-Gm-Features: AcwNN1VdN0Kart2_fiEKCb_9XCui4hioEfW5Bf-MzLe9rBW1HbK36VRqiUYolUg
Message-ID: <CAABR9nFHDNw=9WYiQM1C-dyA_GDr+b22w_SCmedzLJNgFOn5=A@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] ASoC: mediatek: mt8189: Propagate runtime resume errors
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Dan Carpenter <error27@gmail.com>, 
	cassiogabrielcontato@gmail.com, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > So if we remove this part:
> > ---------------------
> > if (!afe->regmap) {
> >          dev_warn(afe->dev, "skip regmap\n");
> >          return 0;
> >      }
> > -----------------------
> > from mt8189_afe_runtime_resume(), that could actually trigger the bug
> > we were just discussing.
> >
> Well, then...
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
> ...still, please check the other cases.


Thank you. I'll keep this part of the code as-is:

--------------------------------------------------------
if (!afe->regmap) {
        dev_warn(afe->dev, "skip regmap\n");
        return 0;
}
--------------------------------------------------------

Best regards,
Phuc
