Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E14136640
	for <linux-sound@vger.kernel.org>; Wed, 24 Jan 2024 22:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706135001; cv=none; b=N/0oE02pGrjSnVwyuPnBibfnzmYGLCj1zy+orbSsP+vrg7zpY2x93n8sLvZDAd4pZlKeoUcspqYHP3tpAIo67xSY88zQH2IfSimCcw+GkNtHVJAH1Cyq9Lb7yrA1K/Imv8sG8rh98R7lPHopyU0kBZZke4oT+tkAziihBnbHVow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706135001; c=relaxed/simple;
	bh=3Vr69uK7BSFYNxz796gYHrPqlNXsnLg7NbuafXrMkj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AWSpr6qwB1r6ZuKEBhio/+QHT3zaCtZJdh6462S/PuYAipjvuFUwLZpUeo0TneY1g4Ofsz5Mr9vhwgNmbx2Hw3Upb966p+DM8BhllRz5aVrkK5KHdxpn/6RtQgaPKQNKBjXlDvhBHlnMGPIpq6jtoFTrCeuSPAucIAfFmXDwyqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nsLbpa+h; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nsLbpa+h"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a277339dcf4so663530966b.2
        for <linux-sound@vger.kernel.org>; Wed, 24 Jan 2024 14:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706134998; x=1706739798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMj5uLqktj5HGUUTmToIqV4KLUAc7XfkVocVV9e55Ls=;
        b=nsLbpa+h/3tu9xoXXch5nczkVt/48jUgC7kxYGMQCpuD5VTkm7URGFRIF/Jy1QmsEk
         /A9pCSSLP8knoCHcRwgHkSo7vvfxlXlN2Q7sBTYt15Zp6/Ljvu0+TH2NsJm+vgXeAr++
         Exj4wjd2UWN5aHCrKYzGqDTbF5Dvc9FMn5OPoVX5LUTl/Rj8Yv6hJsf3QiF3/dUbkZCu
         5kfFuCzpxwfvSsqHj6cSsLvH9y5PkoftaFfkc4x3iclZ5KbxEyHSVzfFLe3muCiQoQRh
         rNYAbugYqrLzMNsVgE6ImuhwlWijOwSwCdR/mS+ZVsUBk/sxuss68q5NToBYZFQbCDsB
         Yvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706134998; x=1706739798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMj5uLqktj5HGUUTmToIqV4KLUAc7XfkVocVV9e55Ls=;
        b=LppeO9PnhdqJiu6VAgeCg5ITGf5lgdYAPHeVv/frUNWKtJIG7Phj6QhK9diyqDJDYL
         ciFDCUEZv8n0swngcSEkY65OVWPTkGPZfclAGoGUDlE/JELq6O5iKM0H8s5vbMIh/xh5
         7ttDr+9XfJK3jnbplOeSEROT++1ZaNEhcZjQZ3yra8i256RVjZrJ9NRV/UenA+jFEKkW
         SiBgSOXt2hAkF3u6eCZHKFo02MUSlmATwV4ew51rLomxPeKAGdkR01qCwAv+f3/pZjsX
         mOg4UpQKAD2Nmcl2Gouu1tYNHAgL+5IO14U7T91oFg16W6D6pVhsGEa6kYC9kRCwU4bW
         wkEQ==
X-Gm-Message-State: AOJu0YyvoBkmgGGhd3QnfMREK0dlDmtHLFWoKFY+eqcKiUqxCcXo4kF3
	xxfjjSoTDrfsIZ8coeewiQNjyjzm2PHKgnBg5L5vCYaAtfllX2IXsPnlnu4cOqYwWMPyusDWfXb
	gm1rUG+VpzFgklqiC7hIrcBe8sV0=
X-Google-Smtp-Source: AGHT+IFtD5HkkCuLmgQzJuf+b1WbI7rMbvdgg+fisAgWCI2O9wkRxuHSTOcyXgzRViTsGgwtQM0d65TY2hSq+KPLMos=
X-Received: by 2002:a17:906:7da:b0:a2e:99c4:c61d with SMTP id
 m26-20020a17090607da00b00a2e99c4c61dmr10531ejc.106.1706134997896; Wed, 24 Jan
 2024 14:23:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com> <20240124165558.1876407-2-ckeepax@opensource.cirrus.com>
In-Reply-To: <20240124165558.1876407-2-ckeepax@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 25 Jan 2024 00:22:41 +0200
Message-ID: <CAHp75VdHD-8QMvFgfmfhnkLKJgaTTAJvAXXEJ+cvx-1bmDOERg@mail.gmail.com>
Subject: Re: [PATCH 2/7] ASoC: cs42l43: Minor code tidy ups
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 6:56=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> Add some missing commas, refactor a couple small bits of code.

...

> -       BUILD_BUG_ON(ARRAY_SIZE(cs42l43_jack_override_modes) !=3D
> -                    ARRAY_SIZE(cs42l43_jack_text) - 1);
> +       static_assert(ARRAY_SIZE(cs42l43_jack_override_modes) =3D=3D
> +                     ARRAY_SIZE(cs42l43_jack_text) - 1);

Now you can move this closer to the both array definitions (as
static_assert() can be global, and basically that is the idea behind
it, besides nicer error messaging).

--=20
With Best Regards,
Andy Shevchenko
