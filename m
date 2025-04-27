Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5643810E0
	for <linux-sound@vger.kernel.org>; Sun, 27 Apr 2025 07:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745739506; cv=none; b=JUbsFBhwQD+TTw78Izc0EiICVcLrIon63Ig6OJZcnA/xTR+qWYmwWHOa/dEhcLCkALOCFhxzrKaJ6w1U8WyThICiearrxu2XC5hUxRaNxh4OHMC/TKU/XAdKAcm/9kA3+KfX+2BCtK+63YBuTrDPTIOmCPmocJYzGXeyQMK7b8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745739506; c=relaxed/simple;
	bh=wudRz7/AQO9EHZhb5YXMaPRFMRyJ84p5SKMJ9sMIwcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=twGT5CZeTnbjBCuyoGlfVi6FnR5VdJyI8uy7nR6bc66MFF521rjhhdPH/KTIHINMysvi4Y/lR22vEIU2ym2Amr9vo8dEnkCbkGYtqh/SoA5LT+dMYlMSLWHKMQ6mNPfokgtIWUs6sde1B0iyhrvQFxTr/6z/sWdYYNQbKJfNkpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VYAwnUYj; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VYAwnUYj"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30db1bd3bddso37689791fa.3
        for <linux-sound@vger.kernel.org>; Sun, 27 Apr 2025 00:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745739502; x=1746344302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wudRz7/AQO9EHZhb5YXMaPRFMRyJ84p5SKMJ9sMIwcI=;
        b=VYAwnUYjk9uUicZkz7iikK37f2/HhyQok9vMGQXpWm1sWYqlHlW/nG7qyHtjVbJJcQ
         IaPIW6x+iTefZ/bLbPtXA5aL6UC3UMLjg3YzyanMR4OvuhVNVp7oqOb32zvia0/eTM0r
         9AfteDjSIfmw00AZWmSI9IFdOuGZJrLkDQJaB5NHVR/Q5B8wxHQYPK0Gptf5GNp8qX69
         1lvgCS94r19s1/tDLlfn7tFvIHTsDhGm6COWvlqMtvuUYs2mS8w9VfZ8rR2W2i+YBF48
         Db9mfRYlvsb+9tF4DD5WLZFCv1OsZTo5gSfis9GGQXQIpQjUVZqobvw85L/KgvHnIYgQ
         gggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745739502; x=1746344302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wudRz7/AQO9EHZhb5YXMaPRFMRyJ84p5SKMJ9sMIwcI=;
        b=JuP6igEwp+VlMOC7KndEP241M9kwz/jbEK7aP339+H4NWoSrMKE3NpnDsGsy4BMoDQ
         R2J/fmJdLa4ocqDlQvnQFsJTwJHBI8X4DiphFOE+g6FX+zeFsVO4T57knbmVEa0+lLSD
         9XoMXssCZ5tPhIn4H+tV0jwNCVdQIP69/4VK6HvqRK8SyvL6IOvRlqJ8kiQpzJ0IgW4O
         iuV2jnlMNz086MFsrjgyzqihxUNq78UmuP7c7zqlVhLrvOycFHGMK+MHnUPhvVmsUYwr
         AdER+I0R6JMixRPDeBovbhipSmj8B+Ojgi+SngfNk1iiH1KaFvSsqyq8VMf9qiKT1hDp
         3ivA==
X-Forwarded-Encrypted: i=1; AJvYcCUNI4KGVPKAl0i/Xs4qvRfIZUS9STw2sXx5bM6zf4JFrAYqofS9CoVZXIg5Ml4BCxkOq6tm+homxvR7FQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3gLfj2XvaN3VffJLSCsnR6IQksMW5v2CG9Yr9FIkiy/rrl8un
	AkUkeiLlHK3W/pBarN9rE0kKoMtHinWOFOdDM7zMmAVhSd2OESGpGVQ51MbQzd/zQ8zye8+lfFb
	jafDQz6K+yumG//1zkkmnki/3rmvsLRKe178OHA==
X-Gm-Gg: ASbGncsnh5rG3EQ2x2VSgeXTWCwAoetHtPKpcxgITARxKAYN95B3styH5Hd8KlRtwmX
	038A+jQ5jrVw1K7bj7yC738OId2NV41E4L3VFZmpXBP9SUIGM97EOSwzaGIpeyxCoFwxcVcnGvv
	vponhR+sUlWux/JJLHoy7veW1DtDXckqDl
X-Google-Smtp-Source: AGHT+IE0s6Y/2DxO2oROrDBBRGXlGGPZtUWHEiRyI3o907MEd15+YOXjnMQoNhz24D3InZPz100+EiGjxCAdswEVKq8=
X-Received: by 2002:a05:651c:30d6:b0:300:5c57:526b with SMTP id
 38308e7fff4ca-319dc020492mr13207661fa.11.1745739502282; Sun, 27 Apr 2025
 00:38:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250427055020.176099-1-peng.fan@oss.nxp.com>
In-Reply-To: <20250427055020.176099-1-peng.fan@oss.nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 27 Apr 2025 09:38:11 +0200
X-Gm-Features: ATxdqUEN0tZTG3EpwyOmhaizHZmLuZi7m9-yOjcb6bOSaW1uiAGqfGaE8fOVGtQ
Message-ID: <CACRpkdbn_B6QumJ6k1+jXDp-EXSD2CVKArWVMawUVTxPdroZUA@mail.gmail.com>
Subject: Re: [PATCH RESEND] ASoC: codec: sma1307: Remove including of_gpio.h
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: kiseok.jo@irondevice.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, brgl@bgdev.pl, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 27, 2025 at 7:51=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated. And there is no user in this driver
> using API in of_gpio.h, so remove it.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
