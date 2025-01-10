Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EBC2046A5
	for <linux-sound@vger.kernel.org>; Fri, 10 Jan 2025 07:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736492776; cv=none; b=Uq0Uo/M5B63T0I2B18LWbA3lTSbeMs2NkHB+QcLzGriqN+udy8qGLfCOknWCoC9OQsbrAQGi4hlOe995/AiV8HVb76Tbm78HFFQZ/7uDpwA3UFX+FF72ECqe3clhy4jclUDiko6UovLxcOb4wsQIQJtvr3X/qPmxWf+n5vsmNjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736492776; c=relaxed/simple;
	bh=4gCEy/UGKy7TMyIwbT9c7vnZLGccQIM4j4oMHxFEwgM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bxJLN5Sc2Xc3SjyBjXxTwTtRI0bdGUQmEhY6AkmnCm8INK/nMobXmTtTm2B6BJg86aQY22OpXowQ5jhlObUzUdgmPA7QbRi9fVdbQCBxSGQbVhs+iid3EZVJv+d0Js2cdgWn8emzb+bENvU1nQTxTOZP0RQnRUYDIywv78WhoYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fn6zvf7g; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fn6zvf7g"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385e3621518so955983f8f.1
        for <linux-sound@vger.kernel.org>; Thu, 09 Jan 2025 23:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736492772; x=1737097572; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=orGOn3C4RAOEBpN75vB9Yfm5NOOKIRgbB7jEULEXqqw=;
        b=fn6zvf7g4LxfR8Pvx7xOAxVe/D59DDLP75f2dJWJYuWFxziz0OhKSoAfx9PQ5iKj/S
         yD02h7S+g6dKom7X7uvJVWt4rSauGK/ARMwHuz3HAJR4utrqzvpEbeu/nCEsZwoJNhwV
         wFjfuadD+rg0ZzcrgkAlW9Z97keBzacTMGfMBSu1WHh8aKY44omKDrQc39yWIsrr3Dto
         5nBAWtT/HHBreUtAlq/syNNEHS+UAw2wglwI7ySDRFPfcrli3cHgahK3JyTgRvp3VJl+
         VGkW0Nl1axAL/bja9CXkfV91VDVY3FK0JKbrxK0i4FvsROHHy0XdNsQqWK25HbCRXyDC
         bMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736492772; x=1737097572;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=orGOn3C4RAOEBpN75vB9Yfm5NOOKIRgbB7jEULEXqqw=;
        b=pidFFRBExWer+hTzxFvzXlXtjmiemCSnxbeFRXrpFTZZyqXl3epfzz1blPeA1HEVj3
         sv3LnT383aj+1ktmx9QlFM0s4x7mcEb3C1bp0Mjpg4zO5ZwY4x84+IvCsoRYR0IwNNIv
         PwsSzzxZ++Tpe6qEGjsmyifHHihEQq05uQ2shV7M+oQMTl2KWcFPCD3BcUHOnbIHLF87
         6Of8I3EIi9QMKpt9yft5QERE4ZB+CTpdy5kHMJwUtBC+Zwi5sL9MiUrxRd90ujkkb5UT
         QRfEfIl6rpccydYr+l67XD7W/VPujkeerTbYwkBxLl/0eLptddZkF/bO2IVW4V0J8g7f
         75ng==
X-Gm-Message-State: AOJu0YwSFQV3OopomI19DDKDfmFNvb6rG4A4OQHp4q95wLMFLs0wBnYo
	uuuMmEAmWpUVtXUunu8itoahyOksl4dWr1v44VCvfhcZKhtNvFIo7exEjENISh8=
X-Gm-Gg: ASbGncsew0td3BPn2YybTDP/T5n3KRhWodmMFaiQu8OsTtZpP2LHm6MXCd7WrLzuwDc
	4o65Tup7TSqAjxMEky2Ma/5Hl8uepSuc6TkWirtGKufvn9oSLKEn1JC9D82IN/jIHxogLQAQeTm
	R43DPgJXh38BE1Ok6jqo2gqdk1WpPdF1cU5jMGbjTx154fhSDGQYOZjDNOPFr0zx4LrtwSzL1TO
	rq16I159ZSBDZULQaaPyC5L22UN249nYle6qZfBEjLIhU023VZLLfhP4qfr4w==
X-Google-Smtp-Source: AGHT+IFXA1v+SThZDcH2EbZJis7eGng96OTFu7CEeGPe0SWggtcPgI+JBW9bnIWhNIjICyJCn9P/gg==
X-Received: by 2002:adf:9793:0:b0:385:f631:612 with SMTP id ffacd0b85a97d-38a87303f9dmr6879304f8f.17.1736492772121;
        Thu, 09 Jan 2025 23:06:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9d8fc51sm43231175e9.7.2025.01.09.23.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 23:06:11 -0800 (PST)
Date: Fri, 10 Jan 2025 10:06:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: [bug report] ASoC: soc-card: add snd_soc_card_set_bias_level()
Message-ID: <0cc2e26b-f7a3-4e87-843a-e0c9c716d690@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Kuninori Morimoto,

This is a semi-automatic email about new static checker warnings.

Commit 39caefda0a30 ("ASoC: soc-card: add
snd_soc_card_set_bias_level()") from May 28, 2020, leads to the
following Smatch complaint:

    sound/soc/soc-dapm.c:733 snd_soc_dapm_set_bias_level()
    warn: variable dereferenced before check 'card' (see line 729)

sound/soc/soc-dapm.c
   728	
   729		ret = snd_soc_card_set_bias_level(card, dapm, level);
                                                  ^^^^
The patch removed a NULL check before this dereference.

   730		if (ret != 0)
   731			goto out;
   732	
   733		if (!card || dapm != &card->dapm)
                     ^^^^
But this NULL check is still there

   734			ret = snd_soc_dapm_force_bias_level(dapm, level);
   735	

regards,
dan carpenter
