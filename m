Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DAF4369A
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 02:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783649122; cv=pass; b=ZPG/v1/DGLGDtEimxkdQDyXv+OgtWOhFgClqEVCs7bRg+c4y5BEGySSn88SRiFNcGTbjF4kjdk0g0ytMqy1W20e1wt+Mpe/6gWFaRVBU133/tbG+iev6VaXgPNpymM0rAhmRhlO/kBteUyxvOgzw0f/f8qPFeukuK2gHJ0gGd6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783649122; c=relaxed/simple;
	bh=LlRkPbgvZr6HWzD4h0H0tDqeBxXw/GegcXEjF5vDovQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sZBaxDaH4SDSUbPDLqjGy4cg+YP5lVFHVOwPRtP0JEIxV01IwvJGF103gJJcbToyWgznHMaNT8fPC1y5NS7W9iCmv583DeAf62wyoaQL5vM9Xm/mZHmuDpJj88xKnHjd8p0o9DXxZSaz+XRCdxXR1jbrkjdazMYc6XVAHUBdeww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGAeF65g; arc=pass smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGAeF65g"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8454160043aso354172b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 19:05:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783649121; cv=none;
        d=google.com; s=arc-20260327;
        b=HptsPYqsFmsiDdRe1f4nZeAFtupCTZTnhwgGb+PbFZ/nFKgl3wV1U/jytn/ZxNBl+/
         q2yRnLTSS830ilymAbeBNlTBDfOgnundno08sAk/wDMgfXRNnxfq348L820iD3Fvt+Ko
         0jqVAv1R2YG5XY8Q3MswEeOVEDg8EYYxvKYSiEfPQuobYwvgxv28D/gj5KV3JTEV6tpZ
         9u12/4mgjQX/JlnuENplJuZHAmuUxO/hqkDeUaqYW+2h/+8gUVlrnteDuJb54FBWVMNy
         nGIGcAbtiz0Hw7SQJEnm3Q9uEQs7aj8FJ59s1RHJahLuI833luomOs5XLNHb93J8ZTgJ
         Gukg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yV/bSXYSLP9qBujU+T7ka+EuaphsnZ2kIz/iz5VjP4s=;
        fh=zaORu63Bu6vDqhgranGK5kJH6gzYYXiUIX9/eOJfmO4=;
        b=k4iLj6d4tGRGXco0Fz6BKT8/QEuEcmB3RvbNQiTUqFksIO2EJxIHFk61LfpA+lun9I
         FkVM/S2TFTaMp/UK8nmTWDgdrfYLjsGl+EoOGKnZiaYRbtoO9PDptUm3r0G0C+L9zFGx
         QLb2meKiT6/qH9sJCYtabaGGltAY3cCUdzPQrv3pX9jD3ou9g0ny9YY5JeL/xnn+CV4Y
         OsppOsdJSLbqnsiLkovv80Hlt3NLxgQSDNpuAFDVKyLiATRR67Wap20RsWT9W5FVbehT
         A+uREXaoUwQ19/qt2AuIMFwXmTA2JduotQzYriIE0MY6CzOH3BeuQ3ob7V2KfLIA8XWx
         XcWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783649121; x=1784253921; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yV/bSXYSLP9qBujU+T7ka+EuaphsnZ2kIz/iz5VjP4s=;
        b=IGAeF65gmBUZWzMVXp/lM9DSZswHgweB3rUlKqU1jeJSSPqjD+lmlvSNuQ26t0TjQv
         FHsbPnncNU4gkVz5rcYbNV5OGFlf4MTgx7gz+IAI+bHMdoofWADzZvUIlFoFQxXaDLfq
         Yf/xs3tm27WXWv4B+EluOxMoT/UaFuKVrkZQbEl8XA4RitKahvYY3xIIh64+HZWCZ24j
         Q1PKDVWvlrkLTZhvfuXYBYXSndoj0DESax9djV2NSKy6yecv5mzZg/TWPSpRdLbjgwrg
         tCjb8aR2JylUBYtsEbGZn4E7ssy+vOQpedgNT4S0MwS9mkR/LHiF/euP/dELm9Q+Aein
         Oohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783649121; x=1784253921;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yV/bSXYSLP9qBujU+T7ka+EuaphsnZ2kIz/iz5VjP4s=;
        b=MtZLbS+/dPHHaQyGAVqFpwsUgCzvUS/g68pv6tDmGPyCugwMsndHrKsIfdJkG0GmEb
         gcvJRmrzjHldBqz1H4dP/yAD7ho3D1TYC014Z0h2DPgNQQO73I0pzL3nIXRGuWzf6K51
         ZNlNeN0GunMrmrfQRgC8sti/UD+vrgw4DPzIOYgh9c93ifYnU71exbdmJ4kD6JLYpq6Z
         R7pE0WI+Cjgfl9DIndCNn4H8urs5Gqcwu09SH5Rea14LhcXcQA4UkcWcTLGc3kXFR8RW
         rTSjxWtEUASxIA5bVKJXrliR52ygz0VJ84xa5goniA5/UlEJXQbqTiCCuU2Ov5S75/Rj
         4VQw==
X-Forwarded-Encrypted: i=1; AHgh+Rr8uGOLi3GfrQnM0koYWUWVTQxzMkxEV8mXO9Pajzj7eMrSpkT9z3RfToX3HVD59FSY5K/iVGP9Sv2SOw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1KY2NKDArVo2pOD0xZtZvhywwgmytBNmXSmD2s1o4ND7Zx98M
	w8SE29OFJmJTXDsr0e4nfi4fJarTv8nC94lYmTh7+Xu+UiNcwdB8aLRduQXYcDjHLpm6rnlzKKv
	KFpsTtZ/fIbOePsM9mwEhA2QCu2NyJuY=
X-Gm-Gg: AfdE7cnCg6QY9JoUa2qx0o5upVvD9QjxeGE8aquy+Pdao/FXVt7l+pF/cLlnY8T95pX
	kGDjxmbWt0M3LY6wRpoi4ovPzYbpCy+FV+QUxt4z47m6Nluw+oJ+oeJAgtRhxDCrAy42yR3AM43
	hjEEojD3zgOqiHXFNeq+aSS3bQyilEDxRe7lNHg8eimHvFUFhjOYZNXBr4f1ThLLbS5akf/eWPF
	8+4Bm4k/3D9vFGpRjYh+Zz7p6iscuooQBaVM24GdyNYwuQ/OPBh69aPOCZdraQwdy7Qiumu+Z1s
	vGjFKRnJCGb6zEcw5AGBj7sDlqZmp8E9UWpMSA==
X-Received: by 2002:a05:6a00:858d:b0:848:47d3:47ec with SMTP id
 d2e1a72fcca58-84847d34a8emr7759091b3a.31.1783649120744; Thu, 09 Jul 2026
 19:05:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709045902.498848-1-phucduc.bui@gmail.com> <c74c52c5-91b3-4764-a7a1-26fc940bf735@sirena.org.uk>
In-Reply-To: <c74c52c5-91b3-4764-a7a1-26fc940bf735@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 10 Jul 2026 09:05:09 +0700
X-Gm-Features: AVVi8CdIYYnh9UcwsbAJsmq3JOOUQJGgVvrgAYTobV4qxqGEgOj9QMvwPYMMhSU
Message-ID: <CAABR9nFMAujx-Besf2s=+ok=sctBYfz3s94s8aE8Q_yCSd_sbQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/27] ASoC: codecs: Use guard() for mutex & spin locks
 - part 2
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>, 
	Herve Codina <herve.codina@bootlin.com>, 
	Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com, 
	Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Sorry for the confusion.

> On Thu, Jul 09, 2026 at 11:58:35AM +0700, phucduc.bui@gmail.com wrote:
>
> > bui duc phuc (27):
> >   ASoC: codecs: da7213: Use guard() for mutex locks
> >   ASoC: codecs: da7219: Use guard() for mutex locks
>
> Only the first two of these seem to have come through which has rather
> confused things?

I've hit my email sending limit. I will send the remaining 25 parts
after 24 hours
to ensure they all go through.

Best regards,
Phuc
