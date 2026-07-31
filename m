Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60FA3FB075
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 10:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785493196; cv=pass; b=RpDM4LLX2b7bpPZCC3OBHb2jdO62tPgVwgnMD1j1lNvOIeLziOcT7hCWOLLOl8n9S6cG7Zy6Xa6alDbM+nJmzIWabN+iwbE+fEBn4A4zi7qjtT/QJVMBN9Vfs7R6cgsT/yhC9Tqjd2tsYPCyFW8qDXNM2C/HGIEmMIFhHTBkZUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785493196; c=relaxed/simple;
	bh=VtshzBCb2KjKA11YGS6bsR7f2qGbXQoLS2YE7NaD6Pc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cL64/y5l6s+byZ1PfYU9ed730E5IwLwZ7S5rVAvDmqdDfzz+0y0j2OguIKVNMT/ETnuCQxFCucbGafhnzFsMyWVLBxJP7wt/xW08pGEHup11cPdN/cdVOKCS+IM1LaN2oWCbrDp99lurk5/YCvAzCqtif3pEEKFqA0fHhpbOuWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KC0xiEDd; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KC0xiEDd"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8423f236418so717696b3a.1
        for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 03:19:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785493181; cv=none;
        d=google.com; s=arc-20260327;
        b=Ctlo4Ki9I8x43ItNyPVV1DHZ29f3pdO923uLRDAj5LpxD4d7PVtADtPIcR+NpFQ+ta
         BgMg+KP+LgDARm9DNUkU8nPhCnpOAqEWCpwMO2fIBojAOzVe+7wLCTBJLoxluw5k9GI/
         O7VSXiISY0IKX6QR1l6Op06HK5ySUxFyhnKESd/lrOlxGfWYbMbp7GDnvMlsGeFsvCmA
         i82hOkuDEeiyCnAsuA1deYqWwT90ftTXsKBdjRp8GrskHzYFq0od6pFGL08/NPe9aBNA
         pz09p1/opusL99pQk/LKwwUMSxG5kWMlHSyFmKTsNF0UZl5ib5e3Wxp+rGA3R33eBIXV
         VVBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TQwy1Ukj0VK04ebNpFs+B5E8b/zHhQKir61AcZcrp2M=;
        fh=LCJ0GVClpNSjD2TmYSy7UcTWMVTGNpi85Ke5l2Xf9JQ=;
        b=RUo4epFFDjSbdgLKi28k+uSjobIoSJ0qb53GNcs2DXxPcxxtsy0ePnNEPIbDLpolYy
         Igl/rvdFJRRjZa/YST9nrqRS4cmGf4ObyDTcoodpae5ThZ6bqPUZMWeds9OyRDQvHnR6
         NMS1MVQ6H/OiyLij/Y994Es0Ax3kFSXlyFTMNf1bCu4fC5mLZ0LVZG5Mk9e+F+u3aiR4
         d3SMeB5AhCLu31F3Pqb5dTpUz9xMvicFln1tRB4BQN6TKb8dQeVx1UcNI9/ebmJFzfQF
         6I/tOdZAScpLnXR2jkBFOi8GF5srGLF9agRB2QuPwby7s3H5cnc2W0G0q7G3S8qFoJaL
         LbNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785493181; x=1786097981; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQwy1Ukj0VK04ebNpFs+B5E8b/zHhQKir61AcZcrp2M=;
        b=KC0xiEDdnPifMnTCsMVT5pEg/4tDwAvSpGZQmUbIBWV5K+TCEdKhkchIeHGi7qM/wa
         QjLj8YsaSQu5ks2ZhEaCNS7UUylJHcutmhevdHoFsFnnjVlajvtVsNb5UaekimnuNNid
         eTznb3QrUvo0+pqy4euFCA7m55P11n3qgJOqbBZYivIT5/498Zqh/MmsGadE32cjo46g
         WxCJbCvhI1toHiYKFnaVwRXcuQ3pKSeF8hCAEqOoVbaDhhcqtVS1oK9v6eEGeS7nPWlD
         xW1pOcDavUWeOameX6SCXluyiNMzZ5FzVgcAH7BlevdxV0Xnev8PYE4xWRGnDxx0QYLH
         llXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785493181; x=1786097981;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TQwy1Ukj0VK04ebNpFs+B5E8b/zHhQKir61AcZcrp2M=;
        b=EQ6DFrTePOUyS6Gjb8M0CPMYsuFP5/vH89d9BJWyHcC4HNgeJc0jr1Ta1tpFsJb7P9
         V92Y839RbXlk/J3uexYO6ykw4Axo+bAtTOcJT9Sh/WwXq1ZjKdCf4u5sdFToB347Wpom
         24LIuYlQqhUtzHeJZvr5QXBeClc14FIovqw+VrjiNo6eH7Rm3lwhRG3XW/CZIkYsgVo3
         jlxMMbGovls0yzVjKdvjDyouRv/Knl+kZsSiC1Zaq+lAmZQc/6nSVSKYCJV4hLy80w/n
         F1ZPNKbGwDyrxXwEjSEcEiT2QzLMC+57+Jn6j+dLKa+Vlvv8gHgFmO+xpXq2HNMXUt+H
         8w4Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq36gQs7/BIwIb/IrCPzj8ATymbrbS9V7RdMo4PzipBqUfWrgqDPs/JeKGnZQcHyTC2byiXILgK7la7fA==@vger.kernel.org
X-Gm-Message-State: AOJu0YweBXJljFcucUzsa++5qfpCoNAsS5yZ6t4SzBF9H5xc0akFfSbd
	dDYlR4eDjgTGPV5BaG8w+tO0fl0p53R2GpnxHIEOidV8KCHAYl615Zu4teSY9I8w5knXStIEJbo
	7tRTERoNbGmLcrfXqzUr3i2GfmRwCArU=
X-Gm-Gg: AR+sD13kqr6XXQJlbsbaO7PZntY3oS3TNhZb0X0EOW3bbKdqiwdBF9qDEpBlEC7nEFu
	5QkvJiRPa6IPw4xIKrOySU1T0aIApsmhvCaT02EiEPjZ5MfmjV1kPzYz2AFmiALvfX/RtRNNTIM
	8o7U+PnnzjPCWYL2d3541qBPDQKT7z+BctB0oJ0DESqe7RISW2+G4kInpWvG96U6z0FvT00sbsa
	vs4xwSQFtAav+7QJEDK9rSK1nodP+wDPz4npqsv9vmeeAgLd2iQ7J3ocW29Aprutpd4iFpwilDT
	psaZ1Qoukr8mk75bVhmUSdpYBf/sohmWfKXoVVbzmIwAYnRWiBm6UBHFKS+IT1IXATLPeL7MZrK
	Dwh3Knr/WD7VGEqXH5MAFjUjc2cGt8ixaoAl26FBknUyFOZV1UkkstSN9
X-Received: by 2002:a05:6a00:600a:b0:84e:3a6b:499e with SMTP id
 d2e1a72fcca58-84ed73051b1mr1248797b3a.78.1785493181600; Fri, 31 Jul 2026
 03:19:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731030648.8706-1-phucduc.bui@gmail.com> <25cef535-ec13-4fcd-9f50-66c67cc64d6f@intel.com>
In-Reply-To: <25cef535-ec13-4fcd-9f50-66c67cc64d6f@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 31 Jul 2026 17:19:30 +0700
X-Gm-Features: AUfX_mwJ16jB_br5_HxDIl4yPOFtz5xsYqf3WCt_W0mE_Ha0unDmTuR4z_KdD0k
Message-ID: <CAABR9nHJ9oc2TfXaypsC7kAoktO4GW1gM=merno__YurNv-=DQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/26] ASoC: codecs: Use guard() for mutex & spin locks
 - part 3
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linusw@kernel.org>, 
	u.kleine-koenig@baylibre.com, Thorsten Blum <thorsten.blum@linux.dev>, 
	Kees Cook <kees@kernel.org>, Chen Ni <nichen@iscas.ac.cn>, 
	Bartosz Golaszewski <brgl@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

Thanks for the suggestion.
>
> I wonder if --patience would make a better job of showing diffs for the
> patches with larger scope_guard()s.  It's kind of spaghetti right now.
>
> For the series:
>
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

I've updated my Git diff settings to use the --patience algorithm, as
you suggested, and regenerated the patches.
Hopefully the diffs are easier to review now.

Best regards,
Phuc
