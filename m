Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49323911AA
	for <linux-sound@vger.kernel.org>; Sat,  1 Aug 2026 00:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785545854; cv=pass; b=XlShyeg2N92vzNAPqKlouL11Ca6rycjSJ9T3bJmTwgVpiD7iv1e6WN1XnZSRAXWTrPv44nAaCIszpqQLZLCpkwZXLxKSCdKrJKvwUzfz+/OBZNCRovZI5Hz6W+5n3Rjd5vEHDT7ii/Gb+SPb0F+/mNALw/2tUepL+AcWPRjmgMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785545854; c=relaxed/simple;
	bh=IHweUxDnEngruqjGLe4YpsaI9l8qQnUX+kb5iT7UgM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t4X0xoxQQKtPfOROpbkgGTnsydzlL8uzP7d+mqn9KmJn0Q1LfdTU85bL0M3EKjgyPeWdCh/K1bLDjPkFR07K3dH+gHrMQJe4rtzrrAZZQrxrNIBPjXFtFGawA7yMEXQMamiPhVwYrP1L/SD7/ufxaTKQZczThrzBVq5Y3GsDQ7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OG79CtLv; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OG79CtLv"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c167aa9500dso208126666b.3
        for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 17:57:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785545851; cv=none;
        d=google.com; s=arc-20260327;
        b=r20XIcMqjGh9qcvdNl+EWhfkXzXwbysI6B44td6DA07TJVPBPQP9GWk8NeaZOEDwI6
         iEUfOePcWeoLkv1mM2w4Ss/W8uBO8VqHlugUVPe0RfhiHPku/IonzTgHumpteg3bDskE
         kLrED9vhxzqjheraQV9WpvajEDXnV6aW1HzBde+msOKqggQZSiiXHaIzTGvA/EzVR2FI
         vWzRihdvYKqmHj5Q/1B6Eu7wAgDnqMHgWz8hX+6CwFWL7N7OS2pgG6JuQWsFOdpVihOx
         Etiuwv8DiQrbCzvUDE1m0Cg4zsVtV9BtWIkH7fw3f92gkU8JrHc1nHyhSIXV44/ulWAp
         1iPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IHweUxDnEngruqjGLe4YpsaI9l8qQnUX+kb5iT7UgM4=;
        fh=ESdjAOdIfOEnm9PpyOIzEvSkCL31yhBx8UdaJj8cfLA=;
        b=Au2dOEp2nqNzpTXF0MC7Szn1Co/kNB9ThzqA0OEjMpPohzK/kJiWAgV9rEU3XULvn9
         zC5XFa7BdqqXz+ACf6asCKqTgHoTv8uWbVa4QCvOLM2+syLAbmxnFbPOIFvcOgZZyIBP
         P0+oMAQ135GmSiQF2P7+lz2O5Mwy101uwuTHUIWUoqnmizZ1iTaaY+6SzDyYV5gbJpKO
         DnMp108+LaHY3RnkNGTjrJ9aHuO6b0rQP5nd1tMvYOnZKK1N6MC5iwy3GXs4EklM3Trb
         KS/IxXMD8kkEhjNJJHsMlzAGr64nQBrFKa6YYWQQWK+hjAA6SpIjBJ/xSuLfbip5/sTD
         ms4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785545851; x=1786150651; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IHweUxDnEngruqjGLe4YpsaI9l8qQnUX+kb5iT7UgM4=;
        b=OG79CtLvTsd9kaagJMbxh1ypR9pYeqtjHrDF2dA3iEWX3Uy6mDYkvUv0+OzuZaPFvH
         Q7TN+rhjutt0PZ9fWgUNhS+Eh0EMdt/p4VCRXuCgtMTUd7HoRquww81m1NDpA47i9iEB
         xSWs3timrHpBALT5r/KarFQ29N8c5rgNQlEIrgBfgkE5eTk8s37wATUWRbLVOpZ7yxPt
         K+KfeLPMQcN/5forqk17xhpECp5FxOUJldlzE8nL32Qo1pD6I756c6Eoo7iEiodAHBfm
         +rUNq9MDR3XzPlBWmwPWOQkDDaGNfVOaRo4gR1u0vZWclwncD6b5ybZt+HO6MJNsOyGR
         dFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785545851; x=1786150651;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IHweUxDnEngruqjGLe4YpsaI9l8qQnUX+kb5iT7UgM4=;
        b=igTalONNqgAEXI7b5M2MU+lTkKDsaTH1p12KQ78CpR/scV1AEThl1f0aI5/GX+AqA1
         dqn5hid2agAm0Supb7/xRAL1krfbPqVoBkfxr6Pa54fGTYeizSVKHY/LSIlGkdMSgnQQ
         uyhRSVu1iP2vu9QV625XIHUVXk0xKK8IEJ/mysyRafBtSmRuNFeFEtpwQcX8W9QDGIuJ
         hjxIB06VHghHchLBIO0+JK+YYtW0F/5sHuhtgaweNWcR8a4DykNjUOCdgyVTIf36H4bn
         giaC9mDQG6/IuG0RFaSP+a5FF9tLd22aM97dWyHWIaPvbEZH+Sz6kuTK4p6P/8L4URLe
         PLBg==
X-Forwarded-Encrypted: i=1; AHgh+RphG+2hI5qnT7xhDqciYwUq2kyf3G8gI7455NHTXPZA0eDjenvSaOzkAz+q+kJn+nKi/v0+rwG3aYsa3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm3Tws1TroEb2BW/VQwDbI6FPNSL8mCJ4q66bFcRdQxIVAr3u/
	iYlbPJfLfLtVRmAc01hDCgj84fgods21mynYuTEwiuV0Yby+ZfusBn7qWMgchHW8E5YQi8tzx60
	e1nPpF4taDXL2O1LoopFdIrlFseYYS2w=
X-Gm-Gg: AR+sD13vV5iBaDNPjlMpi1Hvqp+KPKHqieWiw9SJXLTtm177beFYcTCZe9YXMD5RKCh
	bQzaB7Ii3jnV/d0ApdNSsxmyRhrL23yRSSWobiv+4kGJH8GAt2luHUysfHsW10ZQBBybBDB+vwO
	RbFttR4JEmiM8FgJhuqTA4/GS8+fzbO/ITsLkxtbWpHEfCIE8B4aJkSgS9kM2SgoKH7IpL8cV4y
	1gWSK68FRv943gkeMS0qeU221pKbOGuAEj5yRBL5MyAi5kJrX5xVeQYYAD3a3h5IYGfXFDY9wxR
	zoi3r4/LupDUmv1N61j3cYWKek0QWmNf1FM6OhIo3e1wAZy54HtCDn4Di5udz620J2BPXeIO8TY
	7EKAisWyVDOh+3OBW2agtt7BjEVreqQZw9mt6QbcBgOIIlExUhss95i2vG9Ff3+KVXQjuCaUHr0
	nNdI1GoeVidhcKAHbdv+dhpTiyCdfOnWnQgxfnxg==
X-Received: by 2002:a17:906:7947:b0:c1a:5d49:f99d with SMTP id
 a640c23a62f3a-c1fe7ecaf36mr97140766b.7.1785545850680; Fri, 31 Jul 2026
 17:57:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731030648.8706-1-phucduc.bui@gmail.com> <20260731030648.8706-12-phucduc.bui@gmail.com>
 <ee9bddef-0918-4036-9c8e-8b0d4af7f5bd@sirena.org.uk>
In-Reply-To: <ee9bddef-0918-4036-9c8e-8b0d4af7f5bd@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 1 Aug 2026 07:57:17 +0700
X-Gm-Features: AUfX_mypbAhFBcdwt9PJ9n9jAqYAyvhlmQ7Q5VvvhQOXU-dnCttanK2OffHgnDs
Message-ID: <CAABR9nGQvyeLsG-u3o6dH_R68SUvZMAX1Avsg50ySEd-5KGXAQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/26] ASoC: codecs: wcd-mbhc: Use guard() for mutex locks
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, Shenghao Ding <shenghao-ding@ti.com>, 
	Kevin Lu <kevin-lu@ti.com>, Cezary Rojewski <cezary.rojewski@intel.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linusw@kernel.org>, 
	u.kleine-koenig@baylibre.com, Thorsten Blum <thorsten.blum@linux.dev>, 
	Kees Cook <kees@kernel.org>, Chen Ni <nichen@iscas.ac.cn>, 
	Bartosz Golaszewski <brgl@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thank you for your review.

> This replacing dropping a lock with taking a lock which will both take
> the lock twice and deadlock.

Sorry about the mistake. I'll fix it and send a new revision.

Best regards,
Phuc
