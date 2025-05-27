Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0052494C2
	for <linux-sound@vger.kernel.org>; Tue, 27 May 2025 10:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748340274; cv=none; b=BTgGAXEjKhKjWCHwi2P1iMZWkgRTc0GJ+nfFOw9fOw2wn824+BMEK3VVsluRoljm/NWp2+qZhzVi2djktIdXdPjJ/ItHcARhCy/lD0FZyy3rKozST2o5xi8NDiMUqQpPQKFbNvMLp7ucIXI5ywfA42oiGLy78zUtKz9iuFfZVuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748340274; c=relaxed/simple;
	bh=UKgU0vglUE5InL1Mu97f9q8sQ94XlMyMUOBgXvR1z58=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qmMjuCY3n2b7phuDCc3x8LiVVTmT5UK24vUZVxTF0sBwB5+bLKwtub++usPYk7foFLWcVgAN+MS2k56aXJ+9NoJ5EQ9I5ZMW2ublwg9G934OUg83pFBkTVdFERqO030Nvr+fe5DsN7FfdGjh2diZS+qy3OxNlvgZkq4EPZwfg3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WcwYVvia; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WcwYVvia"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso25617465e9.3
        for <linux-sound@vger.kernel.org>; Tue, 27 May 2025 03:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748340271; x=1748945071; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mhtZWLbHdHHUyiRgyFzzakQPlUErGgACWCgaaN5/9oM=;
        b=WcwYVviaW0jnBU2w2clY4X6T0B8aFP3ET9NXmx2e3N2o1k0wSotq6kvxLzg2GqgWD6
         FQHuyG1OQG3KAsfMUd4girw3AAu/5pLf3sddV7i95JVMbUGXh2ky075utSUmJmYHbpSF
         eVAFyg0APd4zk0bTnTYrCksCu2BDomd5zmO58+8QWOCWdlf10CPJg+/wtlosCFqO/K06
         9opn3GzFPRR5kuEkf2mD0sKP5ZYww/8WoN9nQGKkIPwpcZEYwWcMwG0pBNpBDp700cl6
         6DcOh64YWyFJGA/oB2Bhw1/2gFZYdPygsb40FDDI5BPYLX3pqkyRiDxgPJXlntAy4Vfx
         n6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748340271; x=1748945071;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mhtZWLbHdHHUyiRgyFzzakQPlUErGgACWCgaaN5/9oM=;
        b=CJoXXKx8QRLpCcGe51IluGt6/kTTkS1kFESQyXtPiy7Eq5Hyx59bYAoEEQfTuAYX6j
         5iIQY1FuwXgGtNohag151siRPpmBni/OtXRlnb0/UG2l0LCuQfK90i1AJQvV+bwLf5YT
         64FXbETVxXSxH+f96gJPf7Yqyqzw5NquYrugIdwJ3dUte3q7o9okmQkGIKFHpvvz0K+O
         N5ChewgRDzBzlJBrVMHiF5NuwjnQcah+CvN/JN0ATUvqdigzPdT7icvt3fzsMenLCTUU
         YyKQJh/JWNq/WQhId0JKKfCZMWyRSSDh5KfZdKBlj/8WOEWe2snKL2SxlH4e2NEmtUcW
         rWrA==
X-Gm-Message-State: AOJu0YzIF6h+YG+HRyxwXflqfNFV1LeYY9h6xdUO8+SHgada/bQEltr+
	tB9ZNPg2Y8ogArPygF/JHgWFK1KcJ3NW+J+Ku3ymHWII+H5AMI0x99hDEOdD/bnRDSE=
X-Gm-Gg: ASbGnctbnAdvKTEj865BJG7AWyodqegFnP/j+MxCg2Wz46BnwJs8SHWG9k2ru2sPXEL
	BA2KBfwbHXRSEbML4D58A10Ioev7YBJ5P7Kz0Nkoe3VVTzSNNqEVAwC2JX+WxnJIKDDMEPaYRmx
	qYUJKlL/UgHrNneg6r8X8We0lW6chsAOzaZQcjUSxwC2/E3n+R+F3t3YpYGPwcBQuCfdt+JRSIe
	Ew1pZRl8frp+KSJgRrhnMkZpOCaM+VYhqnvuNx3tdhsJzD9lJn8jzyxZqLaYCApOEhSOJTtcTZC
	4o8TTcKc8QSeWcdbX++GoEZEyxAqcG9T9253UVlZSJJPhU+uiNBvDj2Z
X-Google-Smtp-Source: AGHT+IGoTuBgYrMHvWu6U/j9IXrsV7WK3zmh20fEmh65yfdUoW6HHCrH0YgKOIK1R8PLtuxSJx7aWg==
X-Received: by 2002:a05:600c:154f:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-44c93018fc5mr97096815e9.29.1748340270656;
        Tue, 27 May 2025 03:04:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-447f3dd94d1sm260758095e9.34.2025.05.27.03.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 03:04:30 -0700 (PDT)
Date: Tue, 27 May 2025 13:04:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org
Subject: [bug report] ASoC: SDCA: Create DAPM widgets and routes from DisCo
Message-ID: <aDWOKjGYd4Qye3Co@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Charles Keepax,

Commit 2c8b3a8e6aa8 ("ASoC: SDCA: Create DAPM widgets and routes from
DisCo") from May 16, 2025 (linux-next), leads to the following Smatch
static checker warning:

sound/soc/sdca/sdca_asoc.c:405 entity_pde_event() error: uninitialized symbol 'from'.
sound/soc/sdca/sdca_asoc.c:405 entity_pde_event() error: uninitialized symbol 'to'.
sound/soc/sdca/sdca_asoc.c:417 entity_pde_event() error: uninitialized symbol 'poll_us'.

sound/soc/sdca/sdca_asoc.c
    377 static int entity_pde_event(struct snd_soc_dapm_widget *widget,
    378                             struct snd_kcontrol *kctl, int event)
    379 {
    380         struct snd_soc_component *component = widget->dapm->component;
    381         struct sdca_entity *entity = widget->priv;
    382         static const int polls = 100;
    383         unsigned int reg, val;
    384         int from, to, i;
    385         int poll_us;
    386         int ret;
    387 
    388         if (!component)
    389                 return -EIO;
    390 
    391         switch (event) {
    392         case SND_SOC_DAPM_POST_PMD:
    393                 from = widget->on_val;
    394                 to = widget->off_val;
    395                 break;
    396         case SND_SOC_DAPM_POST_PMU:
    397                 from = widget->off_val;
    398                 to = widget->on_val;
    399                 break;

Smatch does a fairly naive analysis of the callers and thinks that
event could be 1-2,4,8,16,32,64,128.

    400         }
    401 
    402         for (i = 0; i < entity->pde.num_max_delay; i++) {
    403                 struct sdca_pde_delay *delay = &entity->pde.max_delay[i];
    404 
--> 405                 if (delay->from_ps == from && delay->to_ps == to) {
                                              ^^^^                    ^^^
Potentially uninitialized.

    406                         poll_us = delay->us / polls;
    407                         break;
    408                 }
    409         }
    410 
    411         reg = SDW_SDCA_CTL(SDW_SDCA_CTL_FUNC(widget->reg),
    412                            SDW_SDCA_CTL_ENT(widget->reg),
    413                            SDCA_CTL_PDE_ACTUAL_PS, 0);
    414 
    415         for (i = 0; i < polls; i++) {
    416                 if (i)
    417                         fsleep(poll_us);
    418 
    419                 ret = regmap_read(component->regmap, reg, &val);
    420                 if (ret)
    421                         return ret;
    422                 else if (val == to)
    423                         return 0;
    424         }
    425 
    426         dev_err(component->dev, "%s: power transition failed: %x\n",
    427                 entity->label, val);
    428         return -ETIMEDOUT;
    429 }

regards,
dan carpenter
