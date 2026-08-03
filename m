Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AB272617
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 04:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785729961; cv=pass; b=X3Kpcblos3QV5P45y2ildWUFPe0oTRxzwVlfmX0cEatKoPaYcgSmHecQO5Y2I1WAw7G0MzKhVx2ZiMhlxUnpTzF7sg9QbZpaRPbmA0rxkZyAUiOwTdGIyP7Pd/fazWPAoITMubWHBVAEvrKiQyZ1bdKcbeWVUyprZzW9Se60j3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785729961; c=relaxed/simple;
	bh=A4mDaEGWJkLlLk2knO0dp33P5Wgxhel42dq5VQij8a4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q5fE9NHN14yULQfSQ0d090C17Ru8AW0sS2QbC3PF6+ZPeDsIQ/czpxWyk3q3KF0/h43NtDGWUgsjmvKCmSO11HhMITfsMlmDKdW/EAIR9L2kaWLGEj/DHAf1uBn6zICZI52DwXvZWVkLRmcKW1SKUjNyi4y/fFPwpUmmm/uXCGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oiSzoUMF; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oiSzoUMF"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc61541f8cso40970205ad.0
        for <linux-sound@vger.kernel.org>; Sun, 02 Aug 2026 21:06:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785729960; cv=none;
        d=google.com; s=arc-20260327;
        b=n18n7Bm3HlxcKZbAvfZ3yct3WFOGGvAVTP949kc+Age3TYuPufgEJWUro5OPzsoPAY
         a1DQuHPsUYQEwe1t8qozo2c3ElRauxlNcgxG+fbtbso4SJlH/3Usvb3EE+apQPP+s7vr
         PEWoQClmJSrua6eQiVxtcHJL9Cv/BNYdQ9qyWe0praoRbw71Kb01Ql6nnLBG6XEQxnfB
         lTdv8vTuhUbzy8KTio7krxjOmFSDVBPPPEjNiMF7+J0i3KJ1V5HyH+EC2Bjkm+ftPCz7
         jgP9tLTd267jEyNq/YSkS8UGtbgpKR0UwTY4gETacY+Vhq5jEPMAWxfJvVDsl+Eg2JDM
         zjyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZkrSKBKR4XV+e30AnWADztQMFm1oiGp+NcTdBitQDeY=;
        fh=P7kr9DsFTFKb7WjN2gaRH8DaX+aRl/NeJRivmkS499E=;
        b=eDZeEs8rFF4tOP2beIwwRJkEjCVv9pcdE4WLHeCVY6vG2C57LKj5hpRewlLtkW21oR
         R/nvOqQ/D2t6Tovw/zmvyBZBrP5m4yG5kuK6NQrD1WenaJVy4mlM3BAyKaZGOl34VN1q
         Efg7uB/IOT+Z6vyYT+mDNAF2c3Y7AQETceKhzocjO7MyPOjWfCk0XffOyD1qf9JUEGQa
         yWUnG22iFhignFt8hXQUyHMj9/gZzu7DEOuGuIyS/zxZ44Bh5l7hRRAbseDKcXu3XEVZ
         d5tP06cKHyt9Gv7CoJmC2Pzn83xl5DEIWIzgrDA4sqT+qdwYghECxkmXUl23jrwQl4ge
         FkMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785729960; x=1786334760; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZkrSKBKR4XV+e30AnWADztQMFm1oiGp+NcTdBitQDeY=;
        b=oiSzoUMFHcq0YlrJseTZDbjTL/XH137Er8HzK2kELgtljZpgAMd5vCHigR589NjBwN
         fmvKEKqtBrYhy6oc4dVl9Ecb4C6Ef6VWt9uQ9GpQ2pdXk1/R8HddDlNBa6yqEU8N6Hpg
         Lxm7zTFSObjosq71ilsxrYd7sKb57nZEsvP/nLfvxfbKUBND1Q2cNt+Y2hISufJBxfVJ
         0Zx7/Jdcl+nAfJiHll9JQ3jR7n5yFRE6HzGvujEXgNf1ELCEWcrFDYZ7Bs/w32GyY14M
         2FxCKntq4UWf81X/DHYqCW9S7jukdK4QkeyVr9qQ/fJ9yMqiVDzseGfL9Hwnv+N4cKq6
         80vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785729960; x=1786334760;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZkrSKBKR4XV+e30AnWADztQMFm1oiGp+NcTdBitQDeY=;
        b=DYSSqEYmxPvPxx0gufx2/7+snKQbFBNEcNc1TWqVzBcBb6sTR9VGf8nBwRG0PSrBKs
         G6GskJhvLZQavXsADfdsVpdpZ3HKd62skBiJJQ0Wb2O+/XLFURWBJpSqrSTgVUvMGalw
         C+U3LPoHUfJEWWrJwh5t2hrnorQdDkwhONjuTwyNMYZhZCsz4O0YFPbl99bu2yD4lsY/
         P6jQKX/U2UWCytW4aJVcVlkwyPD8qo4mjahCoQj41QnQR/NmoOeRGSq4BglPYDyF4vRO
         p19pOMM9wvW8pWTmf4kEGseP6OyrfJp7jAKWeRkxW9w2QISugqpthBBobvqTe0uMjJ1B
         jRRw==
X-Forwarded-Encrypted: i=1; AHgh+RoCjrZod/hVuFTYFWvGZ0YbUHHGC5YOPYU/H73EgdM1J920KwZTpWCx4wDFEYRoeJ3hgpZ+UsdINEj/qA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiVapNFhGjs5y8azdLmmKPPpULEOTnwrRZfJkPLD9O3fHDWO5f
	XITAPx9FPBgxMnkcIJZ5lgt2lWULqRVaTtjhyN9kh9kO5wFDudHpQeZFwW2WNOc7GDI1Qx24FEC
	cHkeqfHVm1ejKSzk+NTLtIVlOXgiqKLQ=
X-Gm-Gg: AR+sD12t2Rlb3QRWUIhSqT3JwaTehJk0pa4r93315ab+m+M8aRxCVpWiMaqI94nj/mm
	C1hxC8BtYXfgFk8rvRYARijhc7UE1gDYHZW7QWag+gcBA0APy4hkCG51EsbhQRniTASdH9Lwum3
	Xua4OItuQOSlDJ4XmEbOs3R7mdnfWzC008W5m8hOO4zYVEveflLvAudEwqS9I3DA/Apct4sE6Hx
	CB/6++ylIMGUuq87Xpe0pgRtezMwvABF5d0lEcF9bhIcr91ye+r+o5yKRI4FtbfG8gLa2qexILs
	T3lr8SHkk/MlOeEGppnAwIc0kkOgekvgycWI0zOtclWsq1Ptfa+nqs0VYAEow79+qTudEsipiVB
	zxKMpWR0+tKqja+2RCOr0MB3Rzk2y1Wj+KYoAAwAGuH6feBniD/ijCC60
X-Received: by 2002:a17:902:ebc6:b0:2c6:8d95:fd7e with SMTP id
 d9443c01a7336-2d047d1e722mr119237785ad.6.1785729959704; Sun, 02 Aug 2026
 21:05:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731101539.36290-1-phucduc.bui@gmail.com> <20260731101539.36290-2-phucduc.bui@gmail.com>
 <DKEYE4CK1DUW.1PQ03VOZZT9TH@linux.spacemit.com>
In-Reply-To: <DKEYE4CK1DUW.1PQ03VOZZT9TH@linux.spacemit.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 3 Aug 2026 11:05:47 +0700
X-Gm-Features: AUfX_mwmWkehn7fn21ZthpV8C77-8fEL16i2_UDhIMxxkiWDLccefzmHbHrgzbY
Message-ID: <CAABR9nEqZG1Vywb2CkoLVgqoLVPKqfYt01t3dF=WTu9qJSS=bw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: spacemit: init *dp to NULL before error paths
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
	Goko Mell <goku.sonxin626@gmail.com>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Troy,

Thank you for your feedback.

> > The current caller does check the return value before using dp, so this
> > isn't an active bug. Still, initialize *dp to NULL upfront as a defensive
> > measure, consistent with how core helpers like _snd_pcm_new() handle
> > their optional output parameters.
>
> If devm_kmemdup() fails, spacemit_i2s_init_dai() returns -ENOMEM. The
> sole caller checks the return value and returns immediately, so it never
> accesses dai on that path. On success, dp is non-NULL and *dp is assigned
> before the function returns.
>
> Therefore, I do not see a path where initializing *dp to NULL has any
> effect. Could you clarify what case this change is intended to handle?


My intention was to make the API a bit more defensive. While the current
implementation only has one failure path,  spacemit_i2s_init_dai() may
grow additional error paths in the future. Initializing *dp to NULL ensures
it is left in a well-defined state on any failure.

It would also avoid leaving dai uninitialized if a future caller accidentally
skipped checking the return value before using it.

Best regards,
Phuc
