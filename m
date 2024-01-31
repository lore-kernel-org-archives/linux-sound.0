Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0247F498
	for <linux-sound@vger.kernel.org>; Wed, 31 Jan 2024 13:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706708551; cv=none; b=PnOQokaiIqLFBZHy0Tbdv1PzLDWYF+vzDPKrCDCeg/hwRyp/KH4DSTetDIAcs+WyodE/24BCkmLldETYvlUbWW2id50gFwYgJPFrmuhQXD+jxLJ9B515j8KmisQXlz2IyIlmkiRWvGMYOmWJ8HxqY+bulYwuQsjcVh56+jO5EEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706708551; c=relaxed/simple;
	bh=rNDiQg/0u3pLXkbL7csdAnsOg1ou8bFEsbWHOOg35m8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ivs1OSypomgmEhfTS1Df0578xdDL+aMO8g4TKziytGHCg70vIFRAqJ4GgLPOrBjeLN+A1JTHUka6qHhbFB70v5IalVQDg9PTww6fyi++BxPPXutA+K8H0DsOosGf0buX9rpT7CAnbm/Mzd1gCNwErEzu6IV815DAZUg1+wcstec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VLxpQJZw; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VLxpQJZw"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc223d20a29so4750852276.3
        for <linux-sound@vger.kernel.org>; Wed, 31 Jan 2024 05:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706708548; x=1707313348; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNDiQg/0u3pLXkbL7csdAnsOg1ou8bFEsbWHOOg35m8=;
        b=VLxpQJZwt2QgB4fUsdFMmcyrasV38nhgYI8aUT01QepFbyHkcZagqLXnaZ63m2/XKd
         5cHaRZC+zwaUpdCKRA77u78jsIL5VKeVeCefaftXoFUhZFqlgLggk/KYN3Yy1/7bnGWs
         oO/zSvgTJ+I7BoT7SofS6Japxkpm2mBhhoYgOVzud1rE+V84tZvf/1ZPx+syxSi0J661
         YxQf+VOAhOyWbRbpdKoAnMN1fOoCyPJRdOooFj3fAf+x0oRW3WhU/dG+Z/DLHYRa1FCe
         Bb+aav80iceyvf3LE8LiBcz4Q4t1auCn4BWQsPEOv04YVTHRZyQ4TB+c85oWzhdIdM9z
         lxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706708548; x=1707313348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNDiQg/0u3pLXkbL7csdAnsOg1ou8bFEsbWHOOg35m8=;
        b=kXiJxwoXyisMDrsqyOrRwEiBC0YaNU//yxbFclL3xS4Nm4q6QXdap1JvJNCph8Lb71
         VQi0JE5ikKx8Bhiej34jcRHzqXesChnBwp5BEVFpas+IcZaTSpfF6BtUHq/OsMIWVJCA
         7gGhRqkIDUlxwoM95tlKn1UeeYblE25RMJHij3FZMOrc37FGcgNgn88Ko4M979Mjycsv
         L9QQN/pUYwsqIcPjUeAX56FsPdroWbvJnSO2ZuKPKhZ+a8S6yisHN3Gn9Tm5pfmTNNCV
         v4V6Ok2HdJOHGDYgWYG/HJuTGu9hLl+3Q7kH/k1z0mAmr3rmk5CQ9dlI2jjDvUm/Nf5q
         V00w==
X-Gm-Message-State: AOJu0Yz6ftrMXMJJ3zeFifbTlCDAgAYOsCMHtCyh+iKN0z5xMkxLxuBY
	5UkIuD7TQ+uJ4nonQzXGzUWfS4eQabvJh3nqp0H94pf3owqlU3TMbU7k2DK7uabJIPnjZBpRPXe
	ODnD/y6Nmf8VN/fEV/gmErZz82go0qiHxuYc93w==
X-Google-Smtp-Source: AGHT+IHskTXYXxhxPI1CgyG/kvHZeTnVrHblP91LDRSUCVYbyamup48H0wM9rtBK+kf6LdjtM5XNyL3x8PSddYdkrYk=
X-Received: by 2002:a25:6f83:0:b0:dc6:4b7e:d7e with SMTP id
 k125-20020a256f83000000b00dc64b7e0d7emr1623063ybc.24.1706708548654; Wed, 31
 Jan 2024 05:42:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
 <20240129115216.96479-5-krzysztof.kozlowski@linaro.org> <CACRpkdYf4HUaV-Pjr81WjLbzy9zdAnyFWs9gPayPC6-3OjHQwA@mail.gmail.com>
 <CAMRc=Mc1SGLeUOWmKg=fvCdM+RR6FSu2QkFuR17s7L99eRMGug@mail.gmail.com>
 <CACRpkdbaxqTzwL9L02vCpMMdBYsubNP1VkNuJ8mXB_=4E3Kjaw@mail.gmail.com> <5ef64082-0b44-4bb2-bd4c-654c96f4a9bb@linaro.org>
In-Reply-To: <5ef64082-0b44-4bb2-bd4c-654c96f4a9bb@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 14:42:17 +0100
Message-ID: <CACRpkdYa0nj6PK1FecBpQfOfkXhetwRmAyDgWNjJxcf4xgExMA@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] reset: Instantiate reset GPIO controller for
 shared reset-gpios
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Frank Rowand <frowand.list@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Sean Anderson <sean.anderson@seco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 2:32=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The non-exclusive GPIO was made explicitly for regulators, so it is
> working fine there, but it is broken everywhere else, where the drivers
> do not handle it in sane way as regulator core does.

I looked at it, it's 8 users in the entire kernel that aren't regulators,
so let's put it on the TODO to get rid of those.

> To make it working, either GPIO should be enable-count-aware, to which
> Bartosz was opposing with talks with me, or the subsystem should mimic
> regulators approach. In some way, my patchset is the second way here -
> reset framework subsystem being aware of shared GPIO and handles the
> enable-count, even though it is not using non-exclusive flag.

That's nice, I was thinking if it could be abstracted so the regulator
core can move away from this too?

I guess it may be an issue that regulators are not using Device Tree
exclusively, but also has to deal with a slew of platform_devices:s :/
IIRC that was one of the reasons why it looks as it does.

Maybe reset can only solve this in an elegant way if the solution is
tightly coupled with DT and you have the advantage that you can require
it from day one? (It looks a bit like that to me.)

Yours,
Linus Walleij
