Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61FF2BEC3B
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 12:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559535; cv=none; b=dzK+fPSkM2XRQMLS2mM30NBMlBb7s/2xLvpOKuZYWpnJQJITC0pmnhD5B4gVfANxfZnjLGxHnb/+lfl7iLJW+WvK4MrUVX8b+U2Ve2H2JjNQcrUCGUX7TgiH4r0HNFGytnRbsf6gNC/TTtx3M2ThIAnxCal3NaBOlx5TJqZ+K0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559535; c=relaxed/simple;
	bh=sF3FchzuHdlUwCW3Mdst6w7S6yA7e0tQPeXt1aAxPg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JdZ9mOWeNwyFyx27JKVD5C0UeSIpwR2am36HSUTmZwFZeP0fs1a9UgCkXPNrh9IrYQDzOwiMp5YTb3p7BgrdnoRJWaUmLP+1dt7uM5CCFEw2Drm7yEG+QmJ4dI7gfDMbuEI+WowPk5PP7CFDnu35q8ahi1Ceoa+UyjS7iQOyW1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cdWLT90K; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cdWLT90K"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5535e35b059so5166898e87.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 05:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749559532; x=1750164332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sF3FchzuHdlUwCW3Mdst6w7S6yA7e0tQPeXt1aAxPg0=;
        b=cdWLT90KdVDdw1FeZRif/kXP3wq3j1yji3n831jAbXEWZI9FtBXYnUk6v0OwkDghpQ
         jeJjp9i/Ee1CdBTtS7sdRCEhRWsJWIcgg5naQlDPX5hzgiW/fB/6digZfrFcdnR7cdbW
         15h44GQZOW4hiUNmAaQBWJibbypGQ2wfj1PSao1pB7ZIYy66QhpRTmxxNk6JuQid/B+F
         dQDrwjib+jozs7g/T7Va1NE//MtpXrJj7Pn3xXMqKyNKsZXg6Qt9cAYkCFbIFYGYcuw4
         Q8wKyMOH08CNApCsvZINcw9tAVJw2CmABqzCt2WhwtaOm+hXoBhg11lLhL2tsBhhCaD8
         WNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559532; x=1750164332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sF3FchzuHdlUwCW3Mdst6w7S6yA7e0tQPeXt1aAxPg0=;
        b=jSe3q8SZiEBd4u62OK4KoonxUaIUBKlZhntc+JTYBIMatvzR/hAEckCEoDDaTBvu0F
         B9+jjSt/j/4pd2PbPYsp4LEPRmrsALunZBHp30OTaWRIAKvl4Bxj0aWexeqCepm53UEU
         NoJ8gdpRLBXbyhp6X5zNzAqe0kC2Dn+rmKU/m+Ses+MtuiWU4BpudGZZD4qWvbfEgdqk
         BXMVINq2vcUpcvVRkp3l4ApbDu85pGsKbtFp/yPelFN3qAoQ3cUbD4zDP9EXSIr924dZ
         xhWL4IsoACdIkxKL9LG8HBYiOViJ27lL6ZBKpCZKz958fm7L77dtf/9GHmAEbpQCaPKX
         2wRg==
X-Forwarded-Encrypted: i=1; AJvYcCU0Jv3xxSqXb7D7/VDFwN3jgB3QxRvdjXnSvCKcQD4Yn511wI9xvxcSLtHAqLjxPeHBQ01vmUxsmgALhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0c+eRq6pT08chauQGq1X/S4/+el/wUMnzg6rc/+H1LyKa79xE
	pbegnSxMbK/mJktcFafy/fShcgFNKePXdEwYAloPIyFd8ZMX24+mKhy310cxTJ+esIqnHaLIPF8
	N+rkJWbUh5fPZ0v5lSCJzIauw1egGKy29OVdhjc/Jlg==
X-Gm-Gg: ASbGncsUOCKG6vK0Md6AtOXpOD5F8gFXXpnoiVryVa7+B4CYUbFTbMlwWrVNlylSQuK
	7n2PK0zOfzd/hvgDTMD5ZqkKjpwFFxn66OlKrnuozmD9izAgB23q5iGGwnXrJkmopl72rPrKF+y
	dEMMdwRMLCyqUH6gkSpCwHQPdF93cyPYJefeeqS5vepDRIVn/opM7n/A==
X-Google-Smtp-Source: AGHT+IGeGbzOznS3BG0D0jszT5lHYaE7HjuqbP1wt0m4nT4Evnfz8bKcaQ8NdIRwiSEm4rryiTNmXeZgEAh41G1MX+I=
X-Received: by 2002:a05:6512:12d2:b0:551:f166:bbb with SMTP id
 2adb3069b0e04-553931fec79mr844508e87.13.1749559532010; Tue, 10 Jun 2025
 05:45:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609-pinctrl-madera-devm-pinctrl-register-mappings-v1-1-ba2c2822cf6c@bootlin.com>
In-Reply-To: <20250609-pinctrl-madera-devm-pinctrl-register-mappings-v1-1-ba2c2822cf6c@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 14:45:20 +0200
X-Gm-Features: AX0GCFv8wM1qzK88fvC3YYxO09_iv1tchDQeyw0PYmsnKvpSJ44gK7Ltfx9W9bk
Message-ID: <CACRpkdZZoO4QxgiBr06BkzByiCouMNiP8jhz+qzxg5fQAjWDfQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: cirrus: madera-core: Use devm_pinctrl_register_mappings()
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 1:51=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> Use devm_pinctrl_register_mappings(), so the mappings are automatically
> unregistered by the core. If pinctrl_enable() failed during the probe,
> pinctrl_mappings were not freed. Now it is done by the core.
>
> Fixes: 218d72a77b0b ("pinctrl: madera: Add driver for Cirrus Logic Madera=
 codecs")
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Patch applied as non-urgent for v6.17.

Yours,
Linus Walleij
