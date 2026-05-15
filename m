Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCEE3D45D0
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 04:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778820549; cv=pass; b=qsH/Y0Cb0J3xINugj4Eu7q3f8r/Aog42FbAuhxtW+R4TU0mbAWKn4RssFP1BxpyyNl/xef9bYE4CWBQRm/P7XXOr4ndyCyPYzXuj7oUkZQ6F1nJ6ZHoTGm9zFvCfnDI60PFAKVRSE9398wcfHu16HuywF2Km0SspPNrK0aSD4WY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778820549; c=relaxed/simple;
	bh=7Ze77vbekY63STpWUt0uP8LUCQHGr3bsiE2SLku80DU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AAWpz3/FTLEwG0yAkc+AQYuE7zWi9KMzWQQTxg9zYE8L0yY77OVBjzHZWTyM5prhfYWxj7TFaKZuS+NTw6vdjna5vCvTnzfDmS0jzYxg5Sf6U9SwpE4+DtLMDdZHyAhX5aKhyqPYSSdjfGMvKSJvWs9tKWw6bVC0vyhwcJVu2eQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKsSOqb1; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKsSOqb1"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-368763a1bdfso3684284a91.2
        for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 21:49:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778820546; cv=none;
        d=google.com; s=arc-20240605;
        b=SaP0QUPTOH/Fkj+OAYrH/8lvpSChTjiCnJ6rzpzV7t42iA+5OPjCmUIctyEK85FWvY
         6v83BzFFXejo5B3mH9c1PJajeqfhf5mZRVDEroECbr7McA9AETgRQPmOCkSUCZfkfkBc
         pl8ajRKHhKhce+YdHa0PRWLD25xpoAcbhkyau5s2S6M5HmpEQXNiUaUJWSjnrHiGJdAQ
         Ynimp1592uDdNET5CgQHc+yCbyji9nHW5M3c5nJRQQ7NKq0/umMl9oycEfo8/0RlnG99
         RckMx3fXUHyngb38HUFTO15ox1wvPPzhstNzuUQ0QHOTrQmdsXxxl5bdvGm6p+Y9EQq9
         sFCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7Ze77vbekY63STpWUt0uP8LUCQHGr3bsiE2SLku80DU=;
        fh=IzB99cGUgF+inh8TZWj/IzmYXHT3g5WPiKft0lUgAPU=;
        b=lP7K821Ou+YYgc+40YKfA09WpzrNyHuEh0PFJ73CKicDupMD494QAGLMRfn5v6CLFa
         BMObwk4JahFgPpB150QijSnZmZVpVcUQE+LtshUpYXxWB5IO3rPN6Mdxs4lq9NRpLboS
         BMY8gDc2oo1BtIJxxJPkyqBsGSBoF5Qk0I8Nx8ec6ToLEdqn/nYLQiAIUkjPEGUfypGa
         d0FoXNnsMREMmcyHzfbZ6aDQzWw+AReKjVMT0+VZ7ZVoISUR6YeqjGd2mlKsDiwD7WK9
         +r+sG045QrIl4q6/TcOy6TeT1t7Sdr1jE97RQPd3h/ejKG8gyzhntJ2dbdM6txF7Otk7
         o2Gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778820546; x=1779425346; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ze77vbekY63STpWUt0uP8LUCQHGr3bsiE2SLku80DU=;
        b=bKsSOqb1eJQpQAHPHcHlhjkzWsIXDGT9F+4gNw9ZQFqZlavy3gN3c9HVmtKWWhcyZT
         y/TVXcic4dNFKPyifF43Epu7+hjq89CDy5KNyviPon7jrWqGB/BUow6pDG+4CXexLnnD
         sFUAzjls7PS/0A0SCuNnVsm9CEGzz4S6syom/uu7MA26Cun/fO8W/ilbLTWjkk73Kxop
         wqJpA5BqJeGKHmw4VjzAUjCztBJZG+tLh8Wo6PvLPSERoMseFAD01z6QncO4nqjd+jIF
         dyYlmBjyId81/Xk95zJ38G2I9lqfsyvjdbqSws2TskhholTFdGAVa8vPAXBIpKj6AtKi
         qTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778820546; x=1779425346;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ze77vbekY63STpWUt0uP8LUCQHGr3bsiE2SLku80DU=;
        b=sPSldAOKjyQZ07nadoa03SbprOWWn2Us5m4QLRnA2Y3YuVje9GzKFJR5cykWOHIZED
         9FcjtMyMtVorUbafOpCNu7agEl/VkTE30IYN1vcrZB6rWpEQdXenb2NvaG5Wf+H9U3NQ
         nDtWQIELRsRynT4I91ka88i0KMtBm/lWv+dnLbSH1CIk3R5Wyr0eNQL7WLaFy4BplZPq
         HPgMknANIddDgl0OYT9Ltq5lIOEeTfP7e9mc3opBJcX3Y5BrsL3GxVJSpBVVeImR7xbK
         ER7iHgszap3Alcccy+gRoIcPY7/R7lZyMo4xqvpIW3H+mLOVRO0gmkNYU3UvOFz0sd6z
         o8Uw==
X-Forwarded-Encrypted: i=1; AFNElJ+pFRRRGa4B1+oF/bzqjRmudI4OAsAs2CSRIzq+ZB75hjlFDmp/9Q9pkYj61GHHLxIjcMiyEhY2vlYqrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKMBdWi7TBZYLknmD+8j8AP1cDBhIdYIk3NpA1WVVDpGRLnGmc
	C1XHgHOyqabOunLTwCNaGIwfuS2dIUSbhAUneE2J2n0e5gg+ck4abYIYeXoM2WETaRG5RHrhMTf
	RMX6SwAtYz45myu4pfMSPQFOfGsLfrK0=
X-Gm-Gg: Acq92OFn17b97Z27r6O+w8nJqy77bQPcfYAF6TDJ8ExsX0k/h/Z0VacqY9q1tJ1+dX6
	vgF5cRWOc9TZl32wlUwrcWuJOjlUm6/y2ZhcHH1VOtSQsxTN4gpvbkI5/gcn4OaRRSk/DZeIVah
	D8CRpQN2WDPMvKjnQ668O0sbfABRkgPwtMFiDGPmj5maqIkhB+vFSc2iG1sM770ryk06AbrlA2f
	TF3B9WoMj+6T6qTP6mcJfGHXCRonCvOWjAQ+4CcDVoZ3TcrBejoxMRNVOVhdUi3CkZ0pbrrnTrt
	ZsGq96Nu6Ku1jUkSeZxkYVEiN70jOe31Lt+crO+1HILuMN06
X-Received: by 2002:a17:90b:57c7:b0:369:2e00:1ff0 with SMTP id
 98e67ed59e1d1-369519c6663mr2379277a91.6.1778820546309; Thu, 14 May 2026
 21:49:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513104329.81592-1-phucduc.bui@gmail.com> <20260513104329.81592-3-phucduc.bui@gmail.com>
 <agUknFcDIfwrOCld@sirena.co.uk> <CAABR9nHfXi5G4+sVnLbWWJctQHkWASTzTwiV424bO6BXZDqX+Q@mail.gmail.com>
 <agZ92TVjcYpEv_eH@sirena.co.uk>
In-Reply-To: <agZ92TVjcYpEv_eH@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 15 May 2026 11:48:55 +0700
X-Gm-Features: AVHnY4LSRW3rAmjavn6_eDy_Qm1nhNiehY-HxiVuY8qyBRTItYTFMQaIPdHoTM4
Message-ID: <CAABR9nHR13e3d46_Z7Q8ZkjQzKbkcPs2Er4sAvq6G1EEj-xoXw@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: stm: stm32_i2s: Use guard() for spin locks
To: Mark Brown <broonie@kernel.org>
Cc: Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,


> > I'll send a v2 of the whole series with this fix.
> > Would that work for you?
>
> Yes.

Thank you for the confirmation.
By the way, I have an architectural question that came up during my cleanup...

I noticed that the STM drivers currently manage clk_prepare_enable()/
clk_disable_unprepare() directly from the dai_startup()/shutdown() paths.

After looking through various vendor audio drivers, I noticed that
PM/clock handling styles still vary quite a lot between implementations.

For example:

some Intel drivers enable clocks during dai_link init.

Samsung separates bus/interface clocks and operational clocks,
enabling them in different paths such as probe() and set_sysclk()

UX500 and STM enable clocks during DAI startup()/shutdown()

Tegra, Sunxi, and Rockchip often manage clocks through runtime
PM callbacks

From a maintainer perspective, is there generally interest in gradually
converging these drivers toward more modern/common PM patterns,
or is preserving existing hardware-specific sequencing usually preferred
unless there is a concrete issue to solve?

Best regard,
Phuc
