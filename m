Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A321350FF
	for <linux-sound@vger.kernel.org>; Wed, 24 Jan 2024 22:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706135175; cv=none; b=DoFJjrUy0vINKsldxXpwrTni2ZqdqzGQUcnWp2iQ8mNQ0tHa1+qj5zMm8U10s66I1eraaAl010WdIIo+IfRCtf24RXno/A/X73tdfwx9IeA04Mx/38egnpKjc7/RBsIiGLWpXkQpU/NdPrpLjMklBp+2YfN8cQ1DPN9ZrnEWMzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706135175; c=relaxed/simple;
	bh=NgoM56VsmrEl9hY2DFieDEtbajS/MliHhN9U0eoXEWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cqn7lVTlyGK9iTDLqnMIHNWGc1sSEwhbPhEMej63K2yR4Lo3r4qzQCOgHll0KQlJcPbOqR9ITAsZEtkpLe3VNs+x79e8KvwxETIk7ok1QQdOOirdkEcY2MFXdd2efWCDNtg51LT/ybSNQ5/BVo6B9xAXedcTtNAeYskvIEnY8JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vgvo/0O5; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vgvo/0O5"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a30b3a9e9c6so300069066b.2
        for <linux-sound@vger.kernel.org>; Wed, 24 Jan 2024 14:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706135172; x=1706739972; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgoM56VsmrEl9hY2DFieDEtbajS/MliHhN9U0eoXEWI=;
        b=Vgvo/0O5Qetqi78jBeU4Q2HJg5+ouAODTbvNJExVzdbKKKn9Y86v5GJV9qrbNhF+Hx
         jWohuDEIgW4YkZIJDwt6l25FOjC36BJSkf7IUTeE0kmvfvy8Y0/cvjioQc+/uOfpxXow
         3J70HD+a77hdnFv31EBWFZzd/6wuA9xK86FlVPYkYC44tmSpATqv4DNIUzqeH+XlTqzc
         sXs5EnMRV9OWgYZLpNtx0KCaxMsONeBG7W53zg1pdkRrxjlFNpBkmzJClRDrt4724d30
         3EGcHDv9qdcck8IbWQPMAq3m0oc32Omfo3IgdunEGfyWV0slE5omTjTZN2vkelgq08Mc
         nZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706135172; x=1706739972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NgoM56VsmrEl9hY2DFieDEtbajS/MliHhN9U0eoXEWI=;
        b=j72VZDicE2vdQgu4Nn/UXhlG+HAmRF2ot4ASurzUELfDI46o1erIiDKMXa5BWESSHz
         7Q1sknHEvwKBRnnq9etrw+Xh6GsOsoZJjaXHNLVZ+jz7A8km3GYI0WlBXMPCe0CFYbGk
         p8JMted4VhONWlLgoatbUwLz1JZHVEBX4wk9Gkytl2k7KzMpwnILGiKNjEZBeUndL8nl
         bVSLQrTynltgZl/DWTQPPgr/C78TgFDxrWcEAm11+c6LDX3z/LDsPGDXIblGrlpSlqDt
         9uUzsluAT5UjE89bl4aLX5wYMC2HMssGMg2AD/tSFEolYcRazy81Za1ascjCClgAbD3K
         dQXA==
X-Gm-Message-State: AOJu0YyAKgIFVxCBvvqOzlyHpzhTVD2v6ETnetwWBywTNW2RY4XV8Idh
	zOOsiy7lX7w1AQmrEMjhAUnfC05mSa8I/1qpwockTa/z+YMSDn3VYDZH83cXU5ksaZ7eHo5zz9h
	e4Q8jX+Tu+v6JCJWdAzslz+r7SbI=
X-Google-Smtp-Source: AGHT+IFA9qW1UnR7rlUpNNmNm+gWZJVJ5RNeAc9jTb2L0TJoNQ5Flgcl5m3fski8qVeJCflDSvdvdhWbUGSLu2YcW0c=
X-Received: by 2002:a17:907:8b87:b0:a2f:ba66:ec0b with SMTP id
 tb7-20020a1709078b8700b00a2fba66ec0bmr11907ejc.60.1706135171394; Wed, 24 Jan
 2024 14:26:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com>
In-Reply-To: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 25 Jan 2024 00:25:35 +0200
Message-ID: <CAHp75Vep4D=LS3YeZQh=aHvdLoXtiVFP+7B6viCnjRMAC7EYig@mail.gmail.com>
Subject: Re: [PATCH 1/7] ASoC: cs42l43: Tidy up header includes
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 6:56=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> Use more forward declarations, move header guards to cover other
> includes, and rely less on including headers through other headers.

...

> +struct device;
> +struct cs42l43;
> +struct snd_soc_component;
> +struct snd_soc_jack;
> +struct clk;

I would keep it sorted and grouped (in similar way how headers can be
done, i.e. from more generic towards custom and local), like

struct clk;
struct device;

struct snd_soc_component;
struct snd_soc_jack;

struct cs42l43;

--=20
With Best Regards,
Andy Shevchenko
