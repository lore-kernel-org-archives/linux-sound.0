Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B822BEC27
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 02:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781663138; cv=pass; b=I0cYlZ6yXGTArPT0yhpHCYRrisoXVhnCXZzcrudIE1vtw9V03CRWOkqvrLCXfktVX9WvONIZi3GRDpNFtFXCqlR4BnwPVu/u0b71kRiwNGam4g7DykVFYiza5q2P4nNHMT4gOYeWsLSUrf+LBu/79EhKOizk8KJO74BlURZj8yQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781663138; c=relaxed/simple;
	bh=I9jkNgg69cYp9Gmed8dyPc4oJRxJqglqMoz9LIyCVkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TizBv6ntsHmU/DIkgjbhw3DukopoKUGxHccHvPlSynAgrcKSv4eGi1KBxEMyilljmAyGgNWliw/88PNcAuRIcUyvN0T7F9gP53mc34FDT52ChVt7hsTTS98pYmha/AdlgPxk+W+1QBAod/uoYSPwArU5i8K2zGZPkJnI4aFdFVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBGe2XKc; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBGe2XKc"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8452a597afcso47723b3a.1
        for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 19:25:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781663137; cv=none;
        d=google.com; s=arc-20240605;
        b=KnHXOQCAvRgdV1a+/m53xgFX3mfb+AG6Ck5UWyYURh8cFb0xNAoKSoZzMLrNRuK6H9
         nM/dekDaquT6iuPuukOVfrcNZ3qyzzqFZQ6LJczMZYVdVFJ5W8JARMZOMpxTV+2NQNEL
         M8/b7wr7Fe1z6ACDo5gxJEwRfHHamfXcq9gNq0ytmGX0VwuIG1XW3q3Lxb+J9VUIdpyz
         ai0qEyP4exm/zJYiTIyqKg6SBYfKGfYezX91WciSyIhRl1HiqXFKtdxx8jb7AhaOKYl8
         AcxbHGzCuOsW0TbBhVtQN4LIJS7EEpM5j2UKt9WYcjMzpl6/3QIn/nIFuzg92SsA7Ned
         yCNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I9jkNgg69cYp9Gmed8dyPc4oJRxJqglqMoz9LIyCVkM=;
        fh=NBluzW5gqpy/Nb/Gn9lTJeCfXcHate5VHjD8YgORSCs=;
        b=ZbRSIJzS648o/UlklTXJkAETdJp5Xm25oSaW4Y/q2LOSu72lEy6sMGLNI9YTb6yLjX
         TV5NPJpyCD9I7EYkLcG3LnsJKkGJIdCWYcVJxSzGWwzWHvRfE6SGc9g4OpbXPlfsb+7g
         R/WTLvfCwThh4+j4GLvNZg8bRYj/CJj2zXqfKwjBrv985NzC3xC33IB99P/RIozwx0s4
         JyiHyd6calsLQ1Nm6wle3U8qa8oQIahpA6XxPBwZSEv30CkcUTivurZ+aDqoKPqodqwG
         Irb+5xDMKh+Md12vyhAMhJLCSp/3OtNEHRL6xZMBRSKq3dKy9LnC6B46EDFFYuriE+2z
         NkbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781663137; x=1782267937; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I9jkNgg69cYp9Gmed8dyPc4oJRxJqglqMoz9LIyCVkM=;
        b=WBGe2XKc6nxPEJqDXZT5pb0mA+ocg/RGiZiPYJl8u70ORi3AHLZV/qg+M5DDafNgMG
         jJBKusCXwL0g342B0NtJSUBL0pLErJOV7gw+xIQ+DvoyRijSjiwcEDyBTb9SXgpJcKOW
         vWlOa+LFD2OuNpBXyGN1X6RYzBmomV+OpHogdBSG2nymrBrB+MwddRGPzAyKD+vDDCY4
         vXX+M3vWgu43Tq4hNH+P/A3RZTpzOKiCt4neE75ITse3sIAHcZsERYY1IQuUa9VXHpnw
         pRlrNA2ncbaRSnB+bFPjB40OhRefnrp3wHTFoaX/F/54E5xy9FX4qzcdZun+nDVJPlMi
         Rs0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781663137; x=1782267937;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9jkNgg69cYp9Gmed8dyPc4oJRxJqglqMoz9LIyCVkM=;
        b=Vdupx7rH/K2rNMszgYYsMfD3b/sSoog7ogIZ4KZ4wiyeSOh1dTErxoPtrZvfeQ6lT1
         xByHqgUfp81VybfW1w4UAimdH8q/fYVt0XsKfV++z4kx4+ZfnDh3pRh5dZDCYqr0FKXC
         NHcD2w9nsgrwfJFSXt3R1H2LnWh4vgyvVfQbRGdoFx2rqOTDGioD8ms5WGf7Ji1WLr/k
         wclPY/ulu4VdLLnjwX1c9fqSNC+wgEm3QIvwNxOKcbYu3PGqCiNEwt8zyI/o9MSRFRMM
         H2PmkdF2hiPFr2G6KaKDW+77rO1O2qg+yqXT9UOiwDhn9t+6aUXBXtRckDIBnwtEMS8O
         FwdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xMBujUmr+zXyNIGJyecEaSgyxQPvhK0pyBnViBf6su/yp8NQvy0J2FwrF7iA3d2rPXDP0f1cZ/QkvAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNgEhkhCN0ixIkQQtxJc+c+ZLTFflXp2tgqJuMa7/WtBql7UOH
	CtVr5tdygIf03esz4TW+J64WWqVT5OAXJPch78kzCynmblxx79MGYYRP7HxIso2Som4RgdaZoHt
	CGKvisdabE4zJtsuPyRdcd0r3kRPEGtc=
X-Gm-Gg: Acq92OEJt0acSxZXSr3sNNQmaCMLaWCaanVEs6wZ+iiCU968PyvFSW0WnfqCQYtZKnQ
	JFjegUUFhYksvUcG+KN8MP5vIHaAaS0O983XyQKOPS6/uUgzlhPYUKsbFxfD1Qc/u/31+yMqM3B
	OxSYcP901TfG5kM0AOQQsWx3uraOKsNE02fH07m3ZN8CzHgaLBcMpM40Pip/hJfcGCj57vP6uV0
	a7Am34ffdDYk6QnPrFxijj9EC3A7dAYuG8VWL+2vB3brnwrEuBAf6eb36RBLe7pZ3Q+Zb1ZJ4K3
	CHlCOsf/xEWeyqtRhn4kVpTrMNY=
X-Received: by 2002:a05:6a00:b89:b0:842:5da3:9b8b with SMTP id
 d2e1a72fcca58-845245994cfmr1624839b3a.36.1781663136820; Tue, 16 Jun 2026
 19:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615093824.115751-1-phucduc.bui@gmail.com>
 <20260615093824.115751-2-phucduc.bui@gmail.com> <ajAJt-EV1sSfG3OC@SMW015318>
In-Reply-To: <ajAJt-EV1sSfG3OC@SMW015318>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 17 Jun 2026 09:25:23 +0700
X-Gm-Features: AVVi8CdoNbD47oGFTWSfJEm9Lr238WEoMJ3mqPMc2xN9snSeNNUZupbWD1q6iqo
Message-ID: <CAABR9nHNLchAnkeuGrDWoS4+sAKnqQMgx9b0cuv7rOHzC8P6Pw@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] ASoC: fsl_asrc: Use guard() for spin locks
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

Hi Frank,

>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>

Thank you for taking the time to review the series and for providing
the Reviewed-by tags.

Best regards,
Phuc
