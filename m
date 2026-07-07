Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE523750BE
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 04:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783399252; cv=pass; b=cFaSs/LAYQ0XRkW3GfI0lHwo7gZV2+2TIb1vIO7cB83WrmcLcxGy2/ks+I8FUpNnjuSaTJVdeYIoaQi0mwPomwrGUct1Apm4tDu35RAC2QjNCKphn6H2LfCKAk1ufqWahUMpU2HFuYZ98IoWaSvJoCHUa2hlyL+z2uh0VR7lI44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783399252; c=relaxed/simple;
	bh=pOlCq3UH6N22anVd0FdFVZcCqdVlilTCIIH1x5vVKWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LMkTZRTjPH5FU7BfwTcRsapKSimuGUQnROR9aupPNMCJjdUb0lbVNR2ptVQCi9P8ywxnlURUDOmIOn3A1yHYN5aKL5jiDKdDokb+qznu5BqyJvNpJPTgZZHqcgIMJFGu6feCTdEEfXEnVbPbyXtky50lwDUyVsF/5XbgD59MdpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CaJZIR3U; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CaJZIR3U"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cae134bdc8so20633235ad.3
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 21:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783399251; cv=none;
        d=google.com; s=arc-20260327;
        b=FHBLcZWBuipCQJ5URXvmt2n/iguUWhhGf1+Fxo7Jm8qWaoGlInv3jTge6cVb/4hwOB
         SYnC4MTbo/uhCeFJffOk5oMKBbe1Jk07YnP6HHf7wALoPFjFsd4yTshg+mB1B1VmiCBR
         8JzwW/oqLafyXindauWqq1XuMnVx6xJ9olGIwhvdHdygVeuGonBCbmu0c2hsA8M9RU3T
         8AvTrs5W60DERhhBMSSjlAB/BD9MfJo3eRd3N6N7VgCa6Xvgmo2ANetbnxMPADx0d0tA
         c5QuLjkocUGnABRsHaHm1ws/cTCHjddiqAZFRk6FSADcjt3yFOk34v0aLCwleTorEPjr
         tK7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pOlCq3UH6N22anVd0FdFVZcCqdVlilTCIIH1x5vVKWg=;
        fh=SokaWG3mvpsmJU9xSnzjNh/aRMdfO4hanQhJ4OyIYzo=;
        b=K8jG8gELwPuA7cyz2BvJrit/6ZhLKlX5NRFDCdVy1C1MPJjVf2oIAuVilKzg7cPXoC
         YlT5wRZgnhFHx1eZgT6kcA4rsfsPTpkftfNMWMen7D+R5cHg+Db7TAvI8WMVWOjLM+5i
         E9NBPJp+1modzNTLw0LHs1kA6aZPMI1OECY5viDghMtZgwxhcdVUSxA5oBxTM5HEDr0M
         qC3xWJfBK+6y3sranmuB4r6YhdM5dBlSxmlP2dIDRT1WKhJ5uSB2Ku4QG7xkc0M7hLCJ
         O8f+DfmzvKqPWfd/xvhDOHGtGlqh1E3dgyW+I7Z+jmv1E42cAvUI4lu7OSwr7JJSSqDH
         7M2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783399251; x=1784004051; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pOlCq3UH6N22anVd0FdFVZcCqdVlilTCIIH1x5vVKWg=;
        b=CaJZIR3UGVplETNHIPEpxjnvjPTgf/HHFii15aVgl3iItID3hlLSekAfZyiD48/w05
         SBBBLvzKD+m+BxbtsZFMrxG4gXXJ5LtODjqIKdjRR9jTH1uHt/k8vC39QSLo56nBgdHJ
         ASerk0+xQRLrq60JcOlepvQ0lRc7FZD8BfomLM7gNoQ2mVyf/arbqC6PLspD5WvOMcSj
         jftmj5XQJOE8o9jr5Uu5eDWNYpZub0IQ1ENJTlAMXwDE5UXjyS4QHLpgKqt3iV+p81Nh
         of3vH47NYIiOtNNLR3wGWFju4xdJe+dBtnVF3wmcxfdkRjDIttul9jnzRuGIKOnjxiR1
         ONLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783399251; x=1784004051;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pOlCq3UH6N22anVd0FdFVZcCqdVlilTCIIH1x5vVKWg=;
        b=WCTp2vbSyTmuZsQVCllD3qgouQTBEYnDndbuXIDpv3SzxuG1pAqXf2i9Jir3YxZLHF
         2oGoy3KT7V1lsPK03x2b4TewQMrYyxAXEIa6/oyGLbHcUX+HqiZ52rva7MN0cSM9vNob
         eycRGwcssZLHDEJMRAOkDHeciij1yRG5lYsPG4Zxrx5tHdOUmvp+6YvfUTPe047JA9Bd
         0BdsOzkiRxx/sVNEMO+M0WtiMGtH4RGV8xG6sglkZB2Bd0awM9S9XBkINx6G097rptGe
         5zAiFTZxRX6b5dgmwCG9a4Ot8lfiz1ZiS0Tv4zd1U24cvpAol0YGLizdLombRIBDLTg4
         JVZA==
X-Forwarded-Encrypted: i=1; AHgh+RoFOguBAjfwI5mbwgVol8L27yd9ikk/1bVBVnJRclbyv29q+041v4LEyWSHLONrhEOGy9PA26+7B4jZ9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmw5ow/ZPu8h2da7Mzi1DrtVQusEYiKGkQ4qoAQmegvW6WJxbR
	Z2T4KKiWXqVK7rpJmGdlJ2DQvN4DwbzCXfIudpmsxRAQ5IxYV7nGVu4iJiyGKoXELbGDez8Dm+R
	42yoHBpwuW0WFmMjTHH3hJFRuYLj0Pn4=
X-Gm-Gg: AfdE7cmEEazfYMdB+NYg2teHiF6wcViKCQsi/i9gyuQ2RpFwQDQxOAUzA5qRCfzyPJ8
	iJgG+TkM29ZmIS2gdgoVoDIvpytR6LyxyhesiypCgBrlOtfFipwm3vBQWKaN5fMP+JSPuFtweiX
	/fjbT66hdo27/6E1bJEUE4Qa2z95h2uh9u/5SMEkoy4wxwxc+GI2dZI5asBvYE8OTQ0nvXckN+D
	sRBzGGNaRbkOAqlKedCmH0T0Y6Qd5V8+vYSnk9/gXs6r7lp0uqE/RL5uU1ZhcNCjlOvtLEwSlKP
	cpF959niTjL8JOSL5Wi8Nj3rT5I=
X-Received: by 2002:a17:903:120f:b0:2c8:1f57:d2f7 with SMTP id
 d9443c01a7336-2ccbf0569edmr35053655ad.24.1783399250287; Mon, 06 Jul 2026
 21:40:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703055355.244898-1-phucduc.bui@gmail.com> <71b1c1a0-fcef-4102-8ab6-146a2c372adb@intel.com>
In-Reply-To: <71b1c1a0-fcef-4102-8ab6-146a2c372adb@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 7 Jul 2026 11:40:38 +0700
X-Gm-Features: AVVi8CcQCZizGEeAayJz9voLwANrNZWRykbsEcNpz8Fp4dCchth8iHayuEhTJkI
Message-ID: <CAABR9nE=KGshxBg2mEF9gsXzv0WStXf2MPLeye-kTg+_SL7+jQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/24] ASoC: codecs: Use guard() for mutex & spin lock
 - part 1
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org, 
	u.kleine-koenig@baylibre.com, kuninori.morimoto.gx@renesas.com, 
	christian.ehrhardt@codasip.com, Linus Walleij <linusw@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Chris Morgan <macromorgan@hotmail.com>, 
	Dan Carpenter <error27@gmail.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Rosen Penev <rosenp@gmail.com>, Weidong Wang <wangweidong.a@awinic.com>, 
	Teguh Sobirin <teguh@sobir.in>, Val Packett <val@packett.cool>, Luca Weiss <luca.weiss@fairphone.com>, 
	wangdicheng <wangdicheng@kylinos.cn>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev, 
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

Thanks for your review and for the Reviewed-by tag.

> However, I'm not the one who will run the functional tests for these and
> from review-perspective, the patchset overall looks OK:
>
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

I'll add it to the next revision.

Best regards,
Phuc
