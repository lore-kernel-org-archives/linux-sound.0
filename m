Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACF729671F
	for <linux-sound@vger.kernel.org>; Thu, 15 May 2025 06:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747289650; cv=none; b=gcbCag84GHRXHZj2eYa3OqIFUbIAKFbyUOEn0Rox4Sg8to8B/yy/mP5vI6INt02ESYUKt2x3S5YTLqDpiOaedaK5XgnV7H1bueDMNyLGbY7s24NQqNur90zyH1Cg50E4nrRNzOed/MQV4G9/X8zuqSV6p20/yWX79XRwZ28oCw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747289650; c=relaxed/simple;
	bh=9gG1Y7Kjrhw+d+YVcGUDhhLiFXFPZgo9Mlb66jMi2nE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uviHVJQiNJQCMR8HHYxgkFjGopckmhFUVmm+WUD/uCeH/hgyDckbtDd7sBt6gJWechMIZrk08uqRJkRHFEyLAe8FxBK8lEiP9aWWAMjuw4DtO65t5Vyt0WUSim0HOcoHhNYXp+Q0zf0Ip0clVm3iehn+O7BudH3eOD/hqJh2dhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IKe2QOfX; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IKe2QOfX"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-550d6e7c563so621261e87.3
        for <linux-sound@vger.kernel.org>; Wed, 14 May 2025 23:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747289646; x=1747894446; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drNlR+oPu307Cld2c2bhZ4PbduC0VAwweKZySGP+xWk=;
        b=IKe2QOfXkx/oukI2M4exAgvqM7H7UV+vfVjcpQ9FynYt0txnsVW0km7SG2wrSIN1ea
         YzHHvqdy8Qu7g6wf1k0Gksvab6r0mt0JBlkLqRRc78bcn1cFjcCUB2PcgAJQBQ3Y9OS8
         T5q51keQFxvi/zzT2O5CKE0jSpkNcTkdqO9Nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747289646; x=1747894446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drNlR+oPu307Cld2c2bhZ4PbduC0VAwweKZySGP+xWk=;
        b=FSYhGvzcWvg2azZRKrmj1VAOIhqPNPl5HWX5wMvca9+yDyXa5tshM7f+RHlh1IEPo2
         Z+bl+fgTWGCSORN3B3+Truy8lgKiOmx9G46Rwrg1WuicfL+G3sU+czvuEmtspZFMMKju
         WgwFWkCnPnMVCuFFSqTaPq2JSSZbt9jXFACYqDjUKmTbnhYzCXBDjaruXHImYeltFxgd
         CYorjuc4QgdZ3yrpJcqmrEisSY4cnLAfSrcIDL/N5ejktTxTvPbXVZfqwRYqSFteFZoX
         5q3PhpEunTE3VvdVFGme+3x8KePHxOKVY7QJw65yDKBa5MQHs6hGsJdgq9tmJwyGALNi
         FPkg==
X-Forwarded-Encrypted: i=1; AJvYcCXg8FHtBTZwo6MhEWqCtrHRCJWkzPE9QfqkV3AWlsAedvb68DwedhemA7jrIuTqrKF9edYG2sFyChv5SQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJIp+G8Rv+Kw5OjzivprZWBw+/OxOK7E5q2duZO7gqLg/J6jNU
	AdMAhdGmWn9iFsSbM8Jm+bcFy4knE8SqSrSlzQ3rWCUF9CQ7gLckNGQxFkOyLBK1zJNsOUxRJi9
	Q/ig9cKmQrYlhGZ3IpRxSgwXqmyiuVyJMaYlD
X-Gm-Gg: ASbGncsdhTkRDXC+j92uuKvySVuIFoTypTGJ2xLypZ4xiCHcBG7V2HBTzTjMa3hiQYi
	4c1QyueB4JMvVNa3/HceYy9YHWsdguP2Jm3o7HCH2bBc6yo23sNCCGnP7cMIo13EdlYJ5trm35d
	MH5JoRJKrq9evRtminrnDKAhHKb87E3F0+a6T+uMb1y16qSg8yu91wkRzHRbYGKWa4mdguzbU=
X-Google-Smtp-Source: AGHT+IH6Tu1s7qfro8eTjpXXBa9bg/YMXFMFe0rGRv+AYRa3osr+ecXdrIFoJAbS7ovq5tmuUpU4zvFeFidf93w3Epg=
X-Received: by 2002:a05:651c:1993:b0:30b:cd68:b69c with SMTP id
 38308e7fff4ca-327ed09f95emr25687631fa.3.1747289646393; Wed, 14 May 2025
 23:14:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425082551.1467042-1-wenst@chromium.org> <86b55c96-7ec3-48ed-83b4-f434d7fcb5c2@collabora.com>
 <aCSqWbT9t1T29HT_@finisterre.sirena.org.uk>
In-Reply-To: <aCSqWbT9t1T29HT_@finisterre.sirena.org.uk>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 15 May 2025 14:13:53 +0800
X-Gm-Features: AX0GCFsS6xRp3ubfx5sogziOmFxZtWhFobfvOPwhpAASmoDhOKkToNpIA5VukSg
Message-ID: <CAGXv+5Eq1=TqhZmdhNY5H1s52omit7CZhNhYpRddcJAxGN2P6g@mail.gmail.com>
Subject: Re: [PATCH 0/3] ASoC: mediatek: mt8183-afe-pcm: Shorten source code
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, 
	linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Darren Ye <darren.ye@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 10:36=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Wed, May 14, 2025 at 03:49:48PM +0200, AngeloGioacchino Del Regno wrot=
e:
> > Il 25/04/25 10:25, Chen-Yu Tsai ha scritto:
>
> > > This series is meant as an example on how to use macros and range cas=
es
> > > to shorten the MediaTek audio frontend drivers. The drivers have larg=
e
> > > tables describing the registers and register fields for every support=
ed
> > > audio DMA interface. (Some are actually skipped!) There's a lot of
> > > duplication which can be eliminated using macros. This should serve a=
s
> > > a reference for the MT8196 AFE driver that I had commented on.
>
> > Sorry for the very long wait here; the entire series is
>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
>
> Unfortunately this doesn't apply against current code (I guess due to
> development in the intervening time), could you please check and resend?

This series is based on the other series that I sent for reworking
reserved memory, in particular the patch

    ASoC: mediatek: mt8183-afe-pcm: Support >32 bit DMA addresses

touches the same parts.

Since this series is ready, I'll rebase it and resend.

ChenYu
