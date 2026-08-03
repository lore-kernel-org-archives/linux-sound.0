Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5EA30DEB8
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 02:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785724555; cv=pass; b=hhlqPWweBr9eQwXNhpqgAGselwZatj7k/mu0XVHDduY9Tvx+ENJZjf3oqG/c1dzGPe3fp3uMnV9MBYGaKcLo3v+Fk1I+LUvPSEEWydz80OkLIMFdkVQKYM+uplRiSKfmpT8AksMztXbqTEutMjJXmaIYWfDeum7udwoYZ5xQUeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785724555; c=relaxed/simple;
	bh=FT/SQG/c6khD5vBSeA1TiFee31N1OJzxfIx2oyjBE9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tb6paEvEdMCyLRcExWl2ncv6dm/U9tnphOXxUDYcfQZ4f/FdufqoDiDu84I0t/1vcIQV6GiApdwbsKwufkVFIDzpxqs7SQyytPRaQbWaJajh8jk+WkIbbadsu4tyasCaRLOZAoHs+bdSR9zDV3pZy/UazXKerSjfc5OihCINihk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UaBI2fkI; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UaBI2fkI"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38759bcd877so2460982a91.2
        for <linux-sound@vger.kernel.org>; Sun, 02 Aug 2026 19:35:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785724554; cv=none;
        d=google.com; s=arc-20260327;
        b=AYe/9RvaoTQWFkUdU8QNuwDZntQUkh8UkWVm2Nj0xTadmHGY6egtk3EWgizjCdothi
         EExFhP3KqE9R0bTqqkHqbUtHk6pg9H5++p4w0gGNMVNdMmZxjq4rnK/LV6Q9B5NHpCy6
         lcCosSYVmoDFIrNMcd4EJkp8A2dRJhqTK8mN8ry2DwH++HD2TiFC4TJWPCunZZmvY5cX
         ZfJWARvUBiV9mu7EGqxAMfrcA7lIs84YvmiF6Qkqh2mchuwtVq4YQ2fSPmDqJYJHMBwl
         xXCVig8lCfBt0doA+QaToZA9SIVi3jdGBLdMrCq16byaxh/W9/3DlaL0LkN7QTKmhnuN
         6C7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FT/SQG/c6khD5vBSeA1TiFee31N1OJzxfIx2oyjBE9g=;
        fh=qtrkRvmxC1R3ZxqOtKDicbdIsHPtbQUZOxSd0b52h4M=;
        b=kgXbjzcaa3LAd5RvTb5cIuNvf2uuqNTpq3rB6swT+y2uX+LRGODpEOHfiVvoxL9Eqk
         tGh092+T8rhDFlSj7Bbf/VYTqPkGToJQSFqRS2jovNez45aOxaSrW6JL0VsSeDia/V3Q
         4RiGUBicKD9aQ5s1v0V/7RqDwAYDJIZrEw5MjdLFpQU9X7y1H2/la6K0/z8J2qRL2wVu
         xMT9xcw/IvrETsf5GXJI1/BBCdWiK3cbFPb0twhoPqdggsZIw7OrF/D/NSOq3ChJglR0
         F3zn49cCFxESHCBaRyHl6+T/NS5UZCMaCaPZV3m38SP3nrHOG5Ygn+JpfssAaGBdd3xj
         ZpJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785724554; x=1786329354; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FT/SQG/c6khD5vBSeA1TiFee31N1OJzxfIx2oyjBE9g=;
        b=UaBI2fkI9PAnYrb8ELGuxGx+xE4Wx5TKEttRR0LMdpVyp+Ff1RmKzqGvHkGdRQkeme
         58uXE36F56Smz0xqwKcPMUqsL1jRSU6GczaqL8ByqV8NEkeEL9IShK6E3hXaCqcJGrA/
         //idk5Wwm/TEbO5xf11l9h9lo2RCtL1gPvamyhCyAxa5orvfKbnMNn6DiIJfLYjQorqZ
         p65ia6T+m7evz2HGJZ37pRLyO68fXtrkHcuF8t9ypUyShKMQggF5kyORH2tCNWZnx7xb
         oqBCeNytkNKCJSVUhrzWRoisFsbn54sSMmMbpld5qwcL0Eb+STxcfHhBkt3HdvA7FoqS
         KrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785724554; x=1786329354;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FT/SQG/c6khD5vBSeA1TiFee31N1OJzxfIx2oyjBE9g=;
        b=aiqUrIy9qHMYvpO2cXmTLtb12/gYC6r3X5AyX+KKC2x925KTN+64SA7lgPfGX/NZDm
         3x1JOaTbihkQTagDscw6wNEOqoXQRVCWkELcc1cYw++gMPC05dm6MAYa6FKufOshu6Ek
         wqS8+uRUjl3J6v6Ftto0WPvMZ50OM+jGUtaPSYK6QY2MXw560ZxzD4gk7tancEdXzQWp
         2Al8aqGjaQlTpM1DD433qTBWWc5AHYhWyrLbD6tigAz/J99RdXVdRRti2QPYq85FBq+g
         dhYQUDFnjEF5R8B4pXlG/8/hMd3IBrRcZnyzKf/IPzWn4AB1ghC44CAtBIsWGPRBpOXP
         dt7A==
X-Forwarded-Encrypted: i=1; AHgh+Rr6Z8g1KGtqsbb44tB42Q1yVhceCiJQbVRkDw9ghx6g86NO/EmhuDlWtQhPSuEfR31uEBFqNpPtdKI6TQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8cSdFeMRi80RfagdJQhW+HMO5pctl/Zrpxw4Tb1UrtnthOS68
	2MdvOoK0eqCDKSMeZTAf79ejCBaZ5lAhR/4pdXyXlQufFbdeAbK0n5bvou553kYWrTZzFPryplP
	nCEkzcD6WuJEMi9R3udWiwgZk7n7VQNI=
X-Gm-Gg: AR+sD13iCHaRBi6ZW6mYtDi6jHdSVVIQ2D/xJmUMZFIhY2vDGYEXA4SRk4k6dm4wM7c
	yq4Sr+whNMIEo2EKtBqwRN+V7y6WKZgQ7Ne0Gxa9NmBwVDZ2ecNqTmJxVsJIxVofeH6bm3386Of
	OdEgQP/6OJq8+y2HhG4HrxEisetGfpXEVJ+2VmH3E+gEqtvrnnEUcw/5lVjKnMxRoRYGLWipKLj
	2f0BFGTMRTyQOlfbp0FAql3Kx1K4i7VIcNtL7+8fXtttxBKzwjdcluVgeN7LL/AEAjtcWUSjyVK
	Rbm4iZNZqBGQvLJ8e3Yakh2QMc/7pl5Dod2Sp6UIP6mRwgA2U8Q1caqTA5+7/VTz1tQ6aV308hJ
	Tpzj4DrSiOPB+UnD2IBwMfoExjUxvb5TkriMr1l8AkF3iN4cSNm8OB3ZV
X-Received: by 2002:a17:90b:1b46:b0:387:e0bb:5803 with SMTP id
 98e67ed59e1d1-38fbc5c330amr6603426a91.42.1785724553803; Sun, 02 Aug 2026
 19:35:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731030648.8706-1-phucduc.bui@gmail.com> <20260731030648.8706-12-phucduc.bui@gmail.com>
 <ee9bddef-0918-4036-9c8e-8b0d4af7f5bd@sirena.org.uk> <CAABR9nGQvyeLsG-u3o6dH_R68SUvZMAX1Avsg50ySEd-5KGXAQ@mail.gmail.com>
In-Reply-To: <CAABR9nGQvyeLsG-u3o6dH_R68SUvZMAX1Avsg50ySEd-5KGXAQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 3 Aug 2026 09:35:40 +0700
X-Gm-Features: AUfX_mxCr5f69Dc8Q7kZP98PKX9HAmDgy9j742jJo8FPn74L5u4MMLL4_h-_T20
Message-ID: <CAABR9nED-25XHUNDbucLHJy-=RNcxa+VsiSC6NcXSXJFFOvngw@mail.gmail.com>
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

After looking into this more carefully, I've decided to drop this patch.

My original intention was to keep the mutex_unlock()/mutex_lock() pair
in wcd_cancel_hs_detect_plug().
However, this function is also called from other places, and I'm not
confident that keeping
the manual mutex operations there would work correctly if those
callers use guard() or scoped_guard().

Best regards,
Phuc
