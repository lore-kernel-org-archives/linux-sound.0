Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9892654739
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 06:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779862959; cv=pass; b=RAlmICRG2Au57thtJQpGE0rlMgzmEIqHj/x513jSwzbb9mWr8NRGmQH6CFQiD/Ks+Yif9kCngFrht6gY2NtJ06hAXiUTDh8xkVUwW+exJ/Q1aWCZt5PGX2ieDbdZcEsY8aIhSyjA0qo2TMHXZEv+LNuBLgcWoxaeOQghD2ALewo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779862959; c=relaxed/simple;
	bh=Q4PUgrvw5V01/6EDGPi/ZOKzx+r+MTXGJMQfEM5kHs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XH4OQqtrd1199+XFCm0Jr3hE2iksHsTJXQCanHySJN+/8lWcp87MVlUjwzzcqY9VwSJOo03HS/dntT0yqdN+mqV5y+gaWhM653pF43sdrpULctXY3mh2UzL0rI9aKVr6C0KKOGX+FtFgNNAEvlOYGBeGFNXhWZG+QqqdUjrUPuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fvq/wBjF; arc=pass smtp.client-ip=209.85.208.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fvq/wBjF"
Received: by mail-lj1-f194.google.com with SMTP id 38308e7fff4ca-39397d63804so62776801fa.2
        for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 23:22:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779862957; cv=none;
        d=google.com; s=arc-20240605;
        b=B6/+zJ0jwonb/cBzZLc6McC7/4dY9963k/En6rQr5nkGRGHYrsub4rZaLmT2wvfS9r
         0stzw8G8xUhYB3txofn4Mqpe4iV7F2BPIE4fhjD3Yy5m/DveSjjx1jBw0uetPWlrueMz
         ijuwvVaVZ7yF/OreIZXUfWdPF3FW9MDMln1VtRW5i63ZNcGFQgl3E6eQOWkL4dBdbaDA
         66i/vzhDtnSjnMOkKaexrn3s/QFzUpi/fDIYX9vM22lt2JXibZR3Gspkc3Zkr107fKWc
         NY3xLb6AX1XrDP5ZnmKJm9T6zB5WE0i1YqNOSa4VGAiNvT4KjpaeBHVfOTpx8GU/1A2P
         d2YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J2AsuP0UOE0fTLmPJDGXGJ0S2mydaTDSczDmcMdfOQQ=;
        fh=RwrM3keaWSm9eizGb9NBJgGH/jE21g3A+F8Rsfafm7E=;
        b=IXvJP6FFa4gcZcEqnTKJII8LvxDZ0Woj7JB1KwQSuhENSDiV5r3eMzGLhBDLYR4Zod
         uY01tUiE+YYeprFnSAWuAHwjpiXPJqjmkKH2GT+v/3MR70YD0Z1s9g7TVokMfjgmDnfa
         mdQ7ft9StM2SYMEy6u7nM3h8FtzTup7peuTcFCsfkSph9nxRGhokzYmWLkOfVTEMe7IO
         bFZ4vhpHTDrPmOV2sfnfOWfWfwFXT31p/EPtlfjb5b89YyMmbKpEZ50o8Rjvx/9tL4vP
         2d4xc2XxaXYtDAIP3+ETCaWWMQbW37ihLKEdnEkqlKPPnv762FTzyFRww4yHUtibAIvl
         EdLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779862957; x=1780467757; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J2AsuP0UOE0fTLmPJDGXGJ0S2mydaTDSczDmcMdfOQQ=;
        b=Fvq/wBjFykNVpAYlO1ckePmmvX900llk/WmrxNKw35TvRi/M5g+7iZ/zD7Te3N11mj
         lQjWg21tj25nwLDx3VGiFuk6Y3HCr4UN9MRLjORMrxRubk/mh6kzcBSF4aY07U9Md/bG
         ILNsgDWCVLSvv3pRxdF6A95zjINjDSi658j8JAmqGh3THxVbwpD/ppDS0o0FlEmCbZDN
         ZBfxtLBcG6EY5Aw9W8K7mLEj+c3KI73xUJFjIUx/5lbXLEIoUkpby+VrCHQDjsta1XJg
         tdzg+Or9EB+wMlHNTXLrEflxoh4wm2sD7Wr9YGOHiqGriv7tsIpwx4OXQj4XCfo9jj/z
         Um5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779862957; x=1780467757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2AsuP0UOE0fTLmPJDGXGJ0S2mydaTDSczDmcMdfOQQ=;
        b=nZIUymionSb/TthnY7rohH08xv+HsCVHTmTfPgQUMdnDFuz9feBLob6Jd5uPSvW4zg
         99uVsAxzEybOjZrtQV99OKx5QrS5OFCXxUZpAkoK+i3OR0FBVCHu4Dnil5QXK7AlPCVk
         bi7I0/nRK1qmGnN/TqfOQR1EuTaQTQFKfDgfH6LPsY21lHUhLeoKb/D3cQ3Dls/8z+dh
         LMG/UurnyGnv69ESLxOP1snSVEF+aGKnKRK7gyXOXl56bdqGZc/p+iWYnRAGzPRmKvM9
         U3A80goH4n/VKtXCAeGj0bSHJAUTlRPpcOjzhY2BdR+tWAGwEwS6VSI+gqfq9t/D1ghR
         FDDw==
X-Forwarded-Encrypted: i=1; AFNElJ8DoMn/jZ252qJdU5uxCi0RgkuVGMBZVBKWBuxmUCnwBjppERSIUr+rch61dX/OXaAaJ1oSMZBjEmsIOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw75P65z/uQgFE66nJsGRAh+8G+/8yhIDHFpL1eLAmXWkg1osZD
	IM9TobMlLv7t770OAbd2tTf7UDNyCloCM3RdbZCRALg4OpA4HAiv3VNUXBIx0hM+mLhR2B7x1yS
	AeDVeWtCK/U6GIXxLO3SmIhouxGP+hx+DmfC8vjm3CqViT2dW0g==
X-Gm-Gg: Acq92OH/ru993fzdcUJl4AunKi3hL6C5JhsSUdLux5RHSLDlKQFvXFPYEQE+iBn1zYE
	a9y9qAouDYePVeGNy7ZiuZ918fFsiRM2Hin7rumzPX/qvNGjTlB1pAlQEFfN0xwHR5r40AroLzb
	+lYv5c/ZQzp2sf0Hy/L3+2cdLDOCNSzUXFPiJNeNSn1ocF0l+upLeb7lMv13jALqYVrM6bVLG/5
	EqHS5r+z0ixvxQ3/vSpF4UnN683HaoboX40qm7nFi9q0MNaD0cozaCEVsT774lf5whMp5Yjmd7Q
	XliBMtqiX0uO2mHgb4Fz
X-Received: by 2002:a05:651c:1614:b0:394:4ff1:636b with SMTP id
 38308e7fff4ca-395d8d02fdbmr73707181fa.18.1779862956448; Tue, 26 May 2026
 23:22:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526152608.1250473-1-rollkingzzc@gmail.com> <87wlwpwh3u.wl-tiwai@suse.de>
In-Reply-To: <87wlwpwh3u.wl-tiwai@suse.de>
From: Cen Zhang <rollkingzzc@gmail.com>
Date: Wed, 27 May 2026 14:22:24 +0800
X-Gm-Features: AVHnY4KQJ-khPEYI1lxEDjyH5G20Vi8nTYExfBi6FshFROjEY3PLb0L_H6VTVvE
Message-ID: <CAB7XQsFoaoHuYSCZ6cH=NHv46uokAu7oGCJ4RZvVz9_ddyqodw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: seq: midi: Serialize output teardown with event_input
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, zerocling0077@gmail.com, 2045gemini@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Takashi,

> Please use scoped_guard().  You can drop flags with it, and the return
> -ENODEV can be right after substream assignment.
> Same here, too.

Thanks for your review.  I will keep the lifetime fix unchanged and
only updated the
short output_lock sections to use scoped_guard(spinlock_irqsave, ...), so
the explicit flags variable is gone as suggested.

I'll send v2 with that change.

Best regards,
Zhang Cen
