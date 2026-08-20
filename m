Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058CF434E40
	for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 11:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787225783; cv=pass; b=ti3rdEVwhe8KycpvGS3pyF3m/9UmsTHZY5mXVTwU0AN3eqxcdY2de1Xr3CjzVF3oH+xhv+Gnc+fxG3+Jca4gluzIV+Hc0LvT6yFls9uaXxzDRs2PwSP60/qA+GCulr4sknrr3MUSCgcV2rtTY16OL23s6ydfm8tuKjyJ9InWaEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787225783; c=relaxed/simple;
	bh=Pv++npyQsS+0elD7u+7CYZUc6oiH830RRaypT/ZkgY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uz+kXsvf2c4eHE4uoWeM3Z1W0ohufCWBbmrg4vN0SwMkP52D4V4toucLxTDYfa/Geh9TF2xpzpJa6Ruu54KqQtnwNThpx8fhGbGVVmWjHScK1FAAUgYgYvAyI0oMASSSB+ewu95KPRzmyUnFf9ifhWT0bS72rLmY/tT0Ql2etfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAdoDIIn; arc=pass smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAdoDIIn"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84eb992a881so1672559b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 04:36:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787225781; cv=none;
        d=google.com; s=arc-20260327;
        b=YRL10CgJBTuCEsth+yrqCFG82hsEiUgPr9Wvk10WUvhtpvz3/9sp8lqZet4F2J2E+1
         dQakboaGWa8OHzfqDs4sv+wpkPd8HIr3Vqy8PFWjHAJYjHctpdjCg1/E/fbGYSBdJEdS
         RW5S1IG50XRvaTqXwfOv3h0+hoWjEaDJMrDFgg5ku7+VmyH2J17ag2X5RGYFxv7wkaNx
         A7kaBdJGfZchQRjci+J5Yx7wjlrQulpLAo0k0cOftmtqIdMv+nd3Ic1Y0Fojv0Thyanu
         L2nBFRFp4790a+c4sbZ6sRmqu25RogIOQk9ptlr+EMxAVKX2y0NH24TAc+mNP6uIn3ZE
         89kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Pv++npyQsS+0elD7u+7CYZUc6oiH830RRaypT/ZkgY0=;
        fh=Suw0IS3acLayK12PRSrQ5uV/0X6MB0g4I1ySKgJtQZg=;
        b=jn5nEPQFNxi+wG3XKTZkuq4We2IBvvJegWgS/NLHKBdIuq+hyesD32NF0aXSICYDLf
         DM2p4b6QZgXhvqGCWh7b+p4K6g8DT0X2GM3JbRuPukUQgtoUMyjXiVFn0Wd4uSKpPg/E
         izQztpDEs43sql2yTA3sbgtidpfy/BUZ9m8hSBexqXjKz0zTGs4czAZA0E0sfkqaWxYo
         K22580WYMNH9TrDPcwnzU62lfAUmYZ/vY2c3iYvc3sUhjJJW6YFehyGmd07sfq582HpO
         ahJvNGcvrk3BAP3AobCvloLfvh8Onv/AyEe/yCk0/CwS15tw1x8HjuuxKsKAz++a/6AN
         VFvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787225781; x=1787830581; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pv++npyQsS+0elD7u+7CYZUc6oiH830RRaypT/ZkgY0=;
        b=HAdoDIInyJ5uiJvpfk8bTOA4uYQ3eBZKVku/xw70WXMlx0G7KjoLXRsS3Llxfl0rKK
         +H6Lc58oLwp5+mXZGqUSlcrOfRdnxW9m2ZOZ09PJwGyeM2c1kjMFrZwQi51TmkMcLDiC
         Py0QAnqR4Nr3CGOANn+8RsoAnognLyweCYbCEE+KoXq15xx5I39jXMbKQCfuWt5AL0wU
         taNWWV628HqcwtDqKw6Xyr/rU/i26cf2B3A51Dbf++KLbva1d27GeaTSI1EAt5yejY5N
         PZR4vxs6Jl2GKdlx5lRU0z0UxxPPC5HjWvdOEsqXRFxevFaDK7CFcljtiT3rhkRuEcpG
         H0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787225781; x=1787830581;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pv++npyQsS+0elD7u+7CYZUc6oiH830RRaypT/ZkgY0=;
        b=D+K4ERbRoBpa6Sx9raLm+GeWgsTIWdB3g0q/2Oejt6zYnD/1FAsYsKQl/ejg420HCk
         79YHFPiWmBuZBboeElV0Hvg1xiPalepsc5WJ1FAA6MA4hWaT2SZUbGUiGSIDW7caruLe
         YhM+GFkm+nLshaNaeJQnVFnKuYy2gpxyJfGRuzV5N83RTA2R5FtpiK00DwP0wBpX9WZY
         DGRnFFTNM4IQPIKxCIqje4wGKK2B073VyiCR7WWVpkswxBSMDehnTCSZCTCL9MOgehDt
         4QCLqJ2J1z84UW0P89VD2qoF+vW1IJGIzR49W7hMbHJd/xnNNOoFeAmWQfD7p1CUbYIe
         /csA==
X-Forwarded-Encrypted: i=1; AHgh+Rq54Dma+yeJpOH5cnG/lC7pm1qVtkhDU4bXjafqp6UYrYMMqdrCH2dh7aTihdot1tAp5iYliv7mAy0ZVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnP9d9jZVAetl4d4DVOhPdAYqIfmU95RDt0WSrimHlihHLADGv
	Q1f/1XLF7OJdD8ic6QKMqTtQD1YcmtvHPkeN9wZP0NpDqmZRxKQgAUcpfZn51yORFTSE3XTH4dm
	l3w7rQaErRknSAAKlWYuIus8dkeWUgy4=
X-Gm-Gg: AR+sD134PILGFIosWs5/t6RrZNiWQ73NtcxT9p5G9iEI3lYYH4Blj8Xf/sT4OnK6QxL
	qJxL1hpOUq+JqsucdOLaibdJqPTA585mnPlOHQGQvfUNNv9OVpX9MfzvLSJI8+gIK/26KsIYwXj
	GaLmnxkQN/84WU7KyXvCELw5qkTlmYu6dBxpZaFCopwRI8LoTYViLT71F97P91bNgz6mZOaIoxo
	qcwzJ2Xty26FOK1+RnZ0umf4XnJiLmlbQOaSZN0KQjKmUybGLzAVQplJ+ogA7vcryxIsardD+v1
	hz1QCQqLN6mpkhfpuP3m1JmzWs3BgbXoV583HkXaqiMhbi0VKn44b6IMB5BxnYXLx45tA2VbrjE
	WsYzSX52tG01rV1CUbr3zmdzTWqogja+qN1glt7MSxl3YcVU1HhyaLSUhAylZ7XuktMSXGB5r1O
	vhnnHvHheqdmI18g==
X-Received: by 2002:a05:6a00:2e92:b0:848:2c5e:305e with SMTP id
 d2e1a72fcca58-851d382f3d1mr18117690b3a.6.1787225781272; Thu, 20 Aug 2026
 04:36:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820111253.97866-1-phucduc.bui@gmail.com>
In-Reply-To: <20260820111253.97866-1-phucduc.bui@gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 20 Aug 2026 18:36:09 +0700
X-Gm-Features: AcwNN1XBwQbXQT6wc4CnwLZAJqiHhO0ddYg-yE6lNaCe8_uhwLKGBMlMjT7-UaY
Message-ID: <CAABR9nErEB6c-nQH+mvP2V+oz-tACQsiH0hY54p17CNovmZraQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] ASoC: mediatek: mt8186: Fix clock error handling
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> The changes therefore assume that the clocks used by the driver are
> required. If these clocks are intended to be optional and
> devm_clk_get_optional() is preferred, the clock users would also need
> to check for missing clocks before calling clock APIs such as
> clk_prepare_enable(), clk_disable_unprepare(), and clk_set_parent().
>
> If that is the preferred approach, I can rework the series accordingly.


I apologize for the confusion. clk_prepare_enable(), clk_disable_unprepare(),
and clk_set_parent() already handle missing clocks and return 0 in that case.

So I only need to confirm whether an optional clock is intended to be used here,
so that I can revise the patch series accordingly.

Best regards,
Phuc
