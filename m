Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3937B3EDACF
	for <linux-sound@vger.kernel.org>; Fri,  6 Feb 2026 13:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770385301; cv=none; b=mnoomzVyAL4nnmv785G0xdZ2L1IpHHI/Q0nu7Q9RTeoZoJ7m3KQIfHLPrNNngro+UpGIm5JB9oQ0VqbZ1JZ14mnlDsnYMY6YZGPH3xYhZWbfBDptAOdkMFJvdLQD/X29xEp3CdKANVQP8TZnPdyD9P4eagC0aSKMLVZQWqmZ8w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770385301; c=relaxed/simple;
	bh=dltAOsfvqmiLl34gqv+BIiZQuyORgIiCPPcMRrqVJ1c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=L9ZetqwhcumLkjK2ySZyEFbFbzOhsW7bPP4IJEPxfuQfn0C5Dw4DOHKU4xMhH+ZckFEnE8Q5zcPrpu1egEAqtv+ezyrQb8Fu+oVf+KMHD5elPUnz0Tu6XNg6VpL8J/nRWE5sDVQ1yhWTkjZor9cikwqAWBiAOOK4SDzd8xAmgmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CovTZjX2; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CovTZjX2"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-4362507f0feso908521f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Feb 2026 05:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770385300; x=1770990100; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+DneofI0b3bWnhUm/hamnT1PEF7kcL7B2JETqoeLkGY=;
        b=CovTZjX2fbwNpO2HSiFMdH3zYIi20iFWidcmE1XIHUq65qOURRM/bvhUC5/QeiKzMS
         0cvt/7x/PqOCs8rB/XWlA+63SvTtb/tPd9unJpC43Nh7xbtlrJS6VvXJ8cIAxFvwnmUl
         0uQhbSqdp77tkRE8PXXGpu6Du/sN9LogiXLyRTe3haFXjWTgy4NbBJszinGB3jdvJVIa
         f/6CQO46iyf6/suhfIYajQTBlVdZjB7OQn/2YjZBCYx59gFLHX80oPFMPvFlcnwyRSQO
         TjOoavV/vkJjrw0/z4oHSoCQU7MAr0nW29Ut1UEKWMvXxMci58jNGg65cL22+eFFrJba
         +ztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770385300; x=1770990100;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+DneofI0b3bWnhUm/hamnT1PEF7kcL7B2JETqoeLkGY=;
        b=rumnb+YsMATAiK0reXwXtE7A4ToMe2pFVNnC2InL6s7Lc4HdEcSnZeGrGhvSFBtGLE
         LSCYXucnEVct7xUnE6CfQqA3w8cdtQmBqIZIVkTjdfpKjbiWtYHZCH10uRhVYIpqyDt4
         /gZPhtN+pqMnLA1zClu116R/Av/Vre80aw838OgUtEBXbAJFSz4z19ritgKDfcC8hzf6
         T8mZLwgiY4ySL55bpzPn3WHt4RP4RUB64sCw5bpZUht66LTEmZ2Tq/A2T2Xqq39ZasgJ
         r+CM20uzTCuQKacBMOPwxAdIHnJ2rkvKIYujEAz84iO/XmoeePDg9y0jzqcINvsT6l19
         Ykxw==
X-Gm-Message-State: AOJu0YyvRK7BFnrR38e/V1nJPSfK+RPCeUlzJuVasyXImPugOZSgBfx1
	AZzgtSSz03kVfoHBmgXxic+oPXhMoShpfuZm32Qg9Yy9o2ZcnsYy0wRRpAx23I+8h2b25MKH6kk
	iCeBH
X-Gm-Gg: AZuq6aINP5VFhrWkuSOZjbXSAIcVWt0V2zK5gIAxTfmOPAEP1srbzCxvS6AZA2AzdVS
	qo6Eh9fpUzM6eTzzQ3u2zXvuQ0+gtYiV/E2Yfl3ooarVYArzioIWA88bw8+5eWZTIq8TbjYSz21
	jeaNl6AM3O/VywnyfroI9S1bTJb7Z8+6bRabl7Vl2kWQkYr7rgpwLCQRgl7jdmlvePbBgr4syvt
	JDmpQXs6tNOFupqizV2dQAXuA/ebiyjnoe0PtF/3A9VGXJZtbANoVqhbr3jZFFdAknBXaa5tNLZ
	N1TGJjWoWvDJ6u5qDeuxhKx8FqKo3NQV1WSQPeLqswo/81r1Rn4tqy0SAFRXgK12ph1vn2vEMOk
	+Lz1mTHnWfnf++K8wtlclvfTCwifa+LRJAeGTWr2aya67/dG+pvrCWyScQKMqs/3hdaZz8TtFZv
	b5zyt5aBIiqgh5ZbcQ
X-Received: by 2002:a05:6000:186b:b0:435:9223:c625 with SMTP id ffacd0b85a97d-43629348118mr4453533f8f.28.1770385299743;
        Fri, 06 Feb 2026 05:41:39 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b2facsm5963511f8f.9.2026.02.06.05.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:41:39 -0800 (PST)
Date: Fri, 6 Feb 2026 16:41:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Weidong Wang <wangweidong.a@awinic.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: [bug report] ASoC: codecs: ACF bin parsing and check library file
 for aw88395
Message-ID: <aYXvkD03l40F-OZ9@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>

[ Smatch checking is paused while we raise funding.  #SadFace
  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

Hello Weidong Wang,

Commit 4345865b003b ("ASoC: codecs: ACF bin parsing and check library
file for aw88395") from Jan 13, 2023 (linux-next), leads to the
following Smatch static checker warning:

	sound/soc/codecs/aw88395/aw88395_lib.c:712 aw_dev_create_prof_name_list_v1()
	warn: double check that we're allocating correct size: 8 vs 32

sound/soc/codecs/aw88395/aw88395_lib.c
    701 static int aw_dev_create_prof_name_list_v1(struct aw_device *aw_dev)
    702 {
    703         struct aw_prof_info *prof_info = &aw_dev->prof_info;
    704         struct aw_prof_desc *prof_desc = prof_info->prof_desc;
    705         int i;
    706 
    707         if (!prof_desc) {
    708                 dev_err(aw_dev->dev, "prof_desc is NULL");
    709                 return -EINVAL;
    710         }
    711 
--> 712         prof_info->prof_name_list = devm_kzalloc(aw_dev->dev,
    713                                         prof_info->count * PROFILE_STR_MAX,
                                                                   ^^^^^^^^^^^^^^^
PROFILE_STR_MAX this is the maximum length of the string but we only
need to allocate a pointer to the string sizeof(char *).  So this
allocates 32bytes instead of just 8.

It's a small waste of space but otherwise it's harmless.

    714                                         GFP_KERNEL);
    715         if (!prof_info->prof_name_list)
    716                 return -ENOMEM;
    717 
    718         for (i = 0; i < prof_info->count; i++) {
    719                 prof_desc[i].id = i;
    720                 prof_info->prof_name_list[i] = prof_desc[i].prf_str;
    721                 dev_dbg(aw_dev->dev, "prof name is %s", prof_info->prof_name_list[i]);
    722         }
    723 
    724         return 0;
    725 }

regards,
dan carpenter
