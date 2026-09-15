Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E647394470
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 07:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789458938; cv=pass; b=GlbkDszfn2OL7sBjPq8WrzpBOJfPzY4nX6e7yPBshdD1Ykl98ZbL669lfMDFFug3wNdtSDjIL6fnE1xx/00IzVjwSpt9I2bCHXx7D5w07w5r5XeJH8vjYzq5EK/hcwBzbrgwq6rPModAeye9p/CqW31HmWOKzD7y4QhYauxwZ5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789458938; c=relaxed/simple;
	bh=MCmnREfTZM3eEhy1qIdIvvOYJ/hTWjGqL24nR5iVWes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WefrrjVz576xAlSystRvPlAxOioeWCU4zP90WsMoOP53LhZlZnCg544aiIBEtGf+/KEuSiAmEJenp3DHNvPt34DGADtH53cphaQ9je9NV9uwQjHYfH/IKkhYPCjq4gl0s6f2sWiRBURJoWHYHZEWfBSmbnYQ0Hci0hU1y+RpELg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KiXFELF3; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KiXFELF3"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a5e971c970so733768a12.0
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 00:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789458935; cv=none;
        d=google.com; s=arc-20260327;
        b=UNsNdVpDMmjt6C+g7ef+waZE8aa7cBe+12Y1DdZv7VJwc6AmNF51FlxL7qOaeLvhG/
         EALYZpr5Bdh6v6kjt3wI1MXNiWmx0XGBQkC29rzCjrw9gL5NlxJCPBFaMwv0GtjUzt33
         6Etu9ksiaqb/QRxOMCBqU3+NzgeGf9FTmTgzqRcRtsaS9PjkCE5fiBQjOCead8jQ1U5h
         Xa8IoJEt6vnr2+6OMxfkzQ9bn49WZMuss0MN0aQlta9Z4ROjyTK0WTpodqFPhQ3SeZVa
         y83pBDiqQdAN6gCYHe62/NFZc3Mf++QZS4b+/wCYggQo6iJOsPqmK40AiCJO8tcsa0qY
         Bjlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=goS4E7honEFOUt4mgD9dkwBiL9FCUu+3QHZSOMHuZ5E=;
        fh=LmaRT13/wYUhNahKPtbyAQFy13GJ0CnDxxo13jUbd/A=;
        b=BaCl1kXAYLj/1VMgABPazicWfLzb0lhc0Ue+PyubW75O6W0jelPRjjKw4znYl/WyAj
         Lzib7HiN84YTzG/70uWHgzVfJTDR9K8cp1otMHsTW7hLKofkWn/TveGqt+lNS5OxjsWv
         NSe7knnXUP+RiQWUe3BLt3B4rMRVVUzHRSDjn6JdwB8zBe1YM2ar9ZmFe7u9LchqBiYa
         svPlGw/WvmCf+8Y/9Fv/bxDG2SCSM21C9J1PO2BWFi0D6FapU/c0Ddk0Y8BOay0lGY0O
         k7CWeFnp/AftUmFQJzpc8KMw/MAQbq50INE+Zq2z+Cvy8iURJp2RQoEquqm5XweIOBmS
         dgoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789458935; x=1790063735; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=goS4E7honEFOUt4mgD9dkwBiL9FCUu+3QHZSOMHuZ5E=;
        b=KiXFELF3EeVlIOaxeLxbMAHBZPRirg4qdOzBTXxtQ8yj8zU8hf+/oilZZOSv++OXW6
         dnRNgOkFwZOW8CbpkDPsj8bgfXk8OJeuZD20Mo9ZaHWYYvGUCKEz9mCOWLoNsNv23aIg
         rBlZPsmcedlb8SzOJ8MsA8ncwWn+DGoCzRjH+F/AveBu/lRUbKAcVcIODBtKK2UFHEfL
         McO+24I/C7yVW1KfkJlhZK7NAgokUaczqJlo7MsIJkq59tFoXQ22uQw4uqUKHf2VccmG
         m0VyRGhunnm2ioVNcumWQIwnTuEBDcV1mFdFuGOlY8/ApNI2bfY1wTyAgOTn+OPVlAC9
         Qmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789458935; x=1790063735;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=goS4E7honEFOUt4mgD9dkwBiL9FCUu+3QHZSOMHuZ5E=;
        b=LpuUmOuGuQO0ZA907CGcBeaClB5kxzvcST8HeFCIcBJHkUyFjsDsWRSKSa4BYazG2v
         CwKyrl7AibeMaww4lyrC9wCPWsyXQETobE7OmjjC9rdOwDa2WjmPCR+H8Irv/wvF2/BO
         ZwptBr/nHVK7gFMaAEm1JAc7TempAoeyfQPs6525beaLtjq97p1AIlOFCqsFezNZtSb/
         XEhIPRDewD1Ha/cNVoZcWsMyEttbr92IAJbdr1zLzWWODO9y4ejIYpQ2NFTy1Ebbv4DN
         HWYaYJ75RqU+7Aq26fqbbzBxwwI/ZaRVuKQa2Xf5g0hsRR7HOuovoXSJbcMM4Pyqp5C7
         WXLQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3a0tNfbclyc2NyAyPvP3AqC/yzRsp/K5V/CufSL9wv3rSogHsigP8o/pVCKz6QsMHPZvZ8Xw/1BuPtw==@vger.kernel.org
X-Gm-Message-State: AFuF++nutUyGNxbl2msYCv4PmJud3KW7+C8cCR9/xjlQDiU+EWuLDrzp
	DAaT0ICHLThpD/Law/LI7uy5PXitNEGwiIUZ4I1u7Q8myJBGxEW0fd+JnerNad0G+qXUJ0LtOaK
	THP4mOypr/Yozthe3OrohMHPvDRKeprw=
X-Gm-Gg: AYBFou06CziSl7iWgBQdeWPt8aXvqi+XrF0kYGRxIr8NrA0r30c8YIpHwVes7vlcnRB
	3bDMJtmh0Hd7JU9kEtoRMYPv/qMpPvxFuqcsuKYtsSqkMjnkNClPwYO9i9pDOlOIK4xk94ZNfVO
	m3DENcrFca/dR4qAeEn3ak70Tbqm7B55Ngb50gwW7ENzB7JznNIZDA6Dfo0FDP7HI+snJHjyVrV
	Bawi18uVxODUK6hXYBw5Fqlgt4X85oKQRVLL66zyGOgqSByNe5JiZzJJpB5iFjRzR5bEnK4QnDg
	Sb+G3KgjKkRDt+jbMx0OP+Lt5E9UAaxRxCes7XymvxAKaW+LAZFEte4hutv2rKi2bU7rDDw1Dm/
	udEf4vVZXtSX9ZP7IwDnsoWRzY/WO1PT0PzgS753RnH/BnODTm8++Qxbud+T4DplyM3w=
X-Received: by 2002:a17:906:6a06:b0:c26:1f8f:ed53 with SMTP id
 a640c23a62f3a-c29c896c418mr191111266b.12.1789458935020; Tue, 15 Sep 2026
 00:55:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914072842.24420-1-phucduc.bui@gmail.com> <20260914072842.24420-8-phucduc.bui@gmail.com>
 <693fea96-1905-49c9-b1c5-3fa1ceb4874a@collabora.com>
In-Reply-To: <693fea96-1905-49c9-b1c5-3fa1ceb4874a@collabora.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 15 Sep 2026 14:55:20 +0700
X-Gm-Features: AcwNN1XHHQHyucAHdm0EW7r7ZxJRYduxWbuLcSKyAsTdoDPrrcNWVh8BQ68F-UQ
Message-ID: <CAABR9nH5e=kKRsHQYx7u3HtWgA3C897d9dH4h+wQTpZNGaTRHQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] ASoC: mediatek: mt8189: Propagate runtime resume errors
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Dan Carpenter <error27@gmail.com>, 
	cassiogabrielcontato@gmail.com, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Angelo,

Thank you for your reviews.


> >       if (!afe->regmap) {
> >               dev_warn(afe->dev, "skip regmap\n");
>
> In the probe function, there's a call to devm_regmap_init_mmio(), and that's being
> correctly checked for error as in, if any, probe will fail.
>
> So... during suspend or resume or anywhere else in this driver really, the regmap
> pointer can't be NULL.
> The right thing to do here would be to just remove the useless check.
>
> Mind you, this comment applies to some other commits in this series as well.
>

You are right. devm_regmap_init_mmio() returns an ERR_PTR() on error
or a valid pointer to a struct regmap on success,
so checking for NULL here is not correct.

Also, if devm_regmap_init_mmio() fails, the probe will already fail.
Therefore, I will remove the if (!afe->regmap) check here.


Best regards,
Phuc
