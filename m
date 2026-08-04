Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56984184
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 03:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785814698; cv=pass; b=u2PRaGKzYFsnHt+A3YYI1IBTvQU1fQ0I12ptJYt71V3lKssVhkYpAXkZyZJhcRUTy57eFaAQlZBcli+97os2wK7H+63FOqWhNymnWHiGe2k1NxZUSsfATtSU3aGUW9L8HJT8hrWCN+SuvuIAXK04m92OPFQms+fow4E02jVvm2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785814698; c=relaxed/simple;
	bh=a0ml6BYu17jvK3MN7GxFDoVJFw8tqzUMPpCgh5kW4K8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Onc3+GTq79/xOiJcrNJuo8d2HJYiA9hwN+w6S1+G7QALnhx8G8dUjoUhJdDyXZ+UaN8Xwob5aQZ0PobJGKqXrjcEuywgce0DcgM3tdoDoS1wWDPk9PVhIejuCnlfW2IIQjvSWmR2WknHvEA61alyk2CteyON0Kkp25zpt3AcwDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SGuPMEwy; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SGuPMEwy"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84e04df8c46so3747752b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 03 Aug 2026 20:38:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785814697; cv=none;
        d=google.com; s=arc-20260327;
        b=ONUScvKw4ptZ/CH2Jog//xY6eNjv9EDVQmWR8QGvS6ZAHenVkbgoaxt+QO0fe8alee
         5E8WXRujgx+YcpM95uTQSweHsVMtttRvZQH5cEZRQGBjnSZJ+hQC4MVZEpc1TZ0/ZxrY
         oUaQ6r6fcbtCLRc31pPlsVILtNCEbB37JHPEDdIOn2CH3trBoScdO16fC0eVKkhhKEoe
         FyvG+fv0CPx/YBBzC87AGVZ1RkMlkVENTQT8Iosac8Ru0+lX6dLg8h77kFqgs5oqU1IY
         rF62B02Bu42EimxgKJCdWk809Xa8y2sfCMQzJH26n3B5oQp2cqL3fN5U6QpjrEnsnVFy
         r/dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a0ml6BYu17jvK3MN7GxFDoVJFw8tqzUMPpCgh5kW4K8=;
        fh=odW+IBQQIi6GSUTOOfmhOwNg9nNSsugwc7clR0vDJBU=;
        b=htvDk9z6oo6OslWvcYvINfg8vC/TVVvbX6mPr7A72DQ3V84FrgVQmuXuJViBc49a3d
         9du6mw2L5g2st+j9PrKQ41+DAcHLF5W4hYhGvNG9KxlIte8qwex5RxCgP+9ddJJWhdJQ
         dLI7HVNNTyEOrIjaVrmNNgUwlrKRx61eFgaREz5BzIKj4cxnLUBKaSOtW59hvRoRLkUe
         QTKYpLXpCvJuCkh3n1dZveHVihVSlqH4kyBBzH3E4jcJSyJRAe/xkKbeGqXXUAuWWyER
         zt1zt+w2Bo6S2A/bvTiRHQF9+j12oKxprX0prZlgR/dn0XOc2TFotehO4zk3IJ+vkUAN
         mYTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785814697; x=1786419497; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a0ml6BYu17jvK3MN7GxFDoVJFw8tqzUMPpCgh5kW4K8=;
        b=SGuPMEwyqzYUtJEjeVTh17Buvvgy14QUNpAwtWeKfLjftL8+AnH9T0BmQRQiByxJCG
         gDlB07U40bFuKgqdRsRIsZScQHn6Ss/X2JGjrgG7RDSPUCI7wmX116ctG+KQx/1DLn+f
         JJRskA2QYQ2+TgIbjRB0dV51HeLn0JtRhQ+RmzspVAwQ/3DXHVw+M6fFaH5l/PVjPA9B
         ilbVd+iYEZUNYhm2GgEIq+U4XINMiKUWpEvhB78CxqPJSVEK/8CWTCF7OSCu61P09Pnp
         gLoGi3HA0f8iO0y96XDJeBUYLYHZxlIgRSVjlSQpVRQQRWoiOkmPvSlOEaZ6O69OfbES
         mi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785814697; x=1786419497;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a0ml6BYu17jvK3MN7GxFDoVJFw8tqzUMPpCgh5kW4K8=;
        b=T71iOi/U7hhpY1XZe0mWSW27/ZFbqCfdiRiPWYEdmZUp8fRwPvs2w2ejtUdqzRXaEx
         6DM7l1lpyovxboBu/eV7549NynScQ57seKS0znr7KTWvJIi3DK6t8j+JWWuEYGVRY9xR
         hsMcEuliaWOBD1CFbrREjK59v76XCGocQumJC+H3+vGA54SO7st/Ep997r1QimfmqrJq
         XEcjQSX+sL3E+NO6m5gxvsK2LhGYFas7nTbZdaGI4kUne07ix6ZfARK6610gcHRIb3hU
         HQEyFaozvi0j3TCq1vdSh1Y8K+nHNktL7bmmeaYj6EmTxPUX2M0tAH3Ka+u2NDjjp+/f
         9+JQ==
X-Forwarded-Encrypted: i=1; AHgh+RolJTXuS367YBsLPZf0+6SnsHEutbzoUXqbSnq12CYhkrMZ/YK/2x4ROY1iIEqwENeL1LjjNvpmavB1eQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJkDl2+/B2lgcgKVDZwU7zGfcrgFwFSH7NFaWlxwrYIF0Oqwoo
	VXZeoTl2RKvhhpadOxz0kZ6s7hpFtBcVC/ByJ0rDs4ijX5euhCM6nr2HG2pOH5LP3Op0bQVRbzt
	o23d5tstvYdOcRfzOseWwxAB4lHpEFZg=
X-Gm-Gg: AR+sD13/cicnRaqZMW2LDEmVIlWKaAXPFN8+L/NuUMxMxRSYr5SaarnvAt1VuVsR6JV
	PRGOfxh9vqG1dtN9WBdND5aqrFpPrFLEY3XDVVu914uolIuC685ZIzjZ6vzSGaollKW3tiO9WzQ
	53MMM3emBuQlhiANATLTxEz/bTK3Iqvs+jQjp7+nSGzF4j6uoONOvIpi1o4dIR2hw591Zy5xQWk
	o/5uOG6qgejpNV3fIvcKgcl457qcqKRZNhOhQnGv2MYSFAg+bXz5Pciz1RWnRm3WywYGeXsQRmZ
	um3HpL5r/xTxXcHaikefw+5QeGqXcPppAhIolzSqZfiDnmGq3fok53OablWcCF6N+RaeJSBK+ug
	LTTDAg7WhEvwu1wiUaTZuFsY+XND4EJKK8x6NeBUUJRxBDRKHokiqvdtEuPwOtTkHpDU=
X-Received: by 2002:a05:6a00:12c9:b0:84a:6e0d:692d with SMTP id
 d2e1a72fcca58-84ee4920b3fmr11591322b3a.46.1785814696703; Mon, 03 Aug 2026
 20:38:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731101539.36290-1-phucduc.bui@gmail.com> <20260731101539.36290-2-phucduc.bui@gmail.com>
 <DKEYE4CK1DUW.1PQ03VOZZT9TH@linux.spacemit.com> <CAABR9nEqZG1Vywb2CkoLVgqoLVPKqfYt01t3dF=WTu9qJSS=bw@mail.gmail.com>
 <DKF3O1FTBV9M.M82B257B0WI2@linux.spacemit.com>
In-Reply-To: <DKF3O1FTBV9M.M82B257B0WI2@linux.spacemit.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 4 Aug 2026 10:38:05 +0700
X-Gm-Features: AUfX_mwUhKeIhKcbOnxSm2msaY0Gt-2eSKlA6n-4fwTFNHrQX2Itl5fTDkBIuYY
Message-ID: <CAABR9nGA0dft+MpoPJvvCYvDnZq0OKSNoF10+QUMxEakvz+2Ew@mail.gmail.com>
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

> I still do not think this initialization is necessary. Currently,
> spacemit_i2s_init_dai() has exactly one failure path: devm_kmemdup() fails
> and the function returns -ENOMEM. The sole caller checks that return value
> and exits immediately.
>
> A caller that continued after ignoring the error would itself be incorrect
> and should not be accommodated. The helper is also static and has only this
> one caller, so there is no current API contract that requires the output to
> be initialized on failure.
>
> I suggest dropping this patch.

I agree. I'll drop this patch from the series.

Best regards,
Phuc
