Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794542984;
	b=A9PsbTHd1xaaLrcZaGVoX5gl4o70tUIo+Mb8/X2V1z+prKsZbZsA6aA3NdjAM4tDdGqE
	 iSpMRXtvl8/5Tg7ruPkR2zniMD85gGv8HErRDTslHam1yVFxsFtn4IrjoWMTjcF4md10u
	 ObHWgAjCZssUeLhfFbCeoyB9xBRrR0UYjM14tHrP/eB9JKkvbUUGgy4S94OzC5odlCSwx
	 +bgDZdkfQm/a5BUzFoZCR/Cm95K3Kmy48SFRikUpmp2dUCqoB+z/FqzKbg4Mcg7CZVpj/
	 rGdxYhTe6QtG8MsTy4Pj1hOVNDei/bLwaCZR3ssQekTx9RirwPVW0EYmYfa+g9iTfNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794542984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=XoLZzG396KJyQUQ2LxytgjwSvwf8GibKblRMQQWhxnE=;
	b=pX7alO63Diu9sgBrHcZy+U7lYD/hzpep661vY+PNsgo5zerErn6ZI2aE1zECIaXL9ICu
	 zqcRzENKrhcV6Vs4uUxGvEhNWcHehByNT7qYlpZWKCGieM9fQGTKDgO4ZOY9XTxGgv0sg
	 o5LAph+U97/IqfSJuFg5Fff1NkLYEtDPbJxk6Z0Bu+XJr1R+TZXQ74ZHUdsVOjJmor7Vb
	 vZcuxK80sr2YrUAWFdPna9uW47NT8T4/AUJLSL3df7tZdPF5p6nYYn5HM8YNBpElW5hKT
	 /W1AS4Q9XZMHziPKbq1l/+WJc59+3LA3MWbPlqlUBhLbZTYQT0iECBfM7/YswgP6i1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D25Wx7Qy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E5F606A31C
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 04:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8E5F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D25Wx7Qy
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9d7791b00so6991205ad.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 20:09:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794542983; cv=none;
        d=google.com; s=arc-20260327;
        b=ScpCdeqDLua1I1pJQnnitfuxSp/sIEfYny6+63OEbjDF2WKDpNwohSbKugZEIS/Cca
         kli7DqAs8gmt3uQHLxqOm7+gIa/+KIjNWyjQ9ff/tSDtI1il+TQw1nQ0A0zvoxiG0TGA
         pMbC9LpgxV1RX8lAyH43kaI2q2Ho2oTPLBuTyDWpzAdgGGyk8sFJ72F5JFg3psTM8nqE
         lsipihoQUm3FQScPKNFxdxwRHSBOgP+fclYzZVY4TsXwU7gB67Hx4SUJaqLY/P9nNy0c
         qeKk7F5EBFyXFCepWgj71sjUHhcFp+m422ey8adKGPf8J+v0M9+rRefJXySMrwGPL+YH
         VYqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XoLZzG396KJyQUQ2LxytgjwSvwf8GibKblRMQQWhxnE=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=gZq8azgpbWwrk3T5hcBZUjSi6Oj0rO/NMyyEWj42XaqBWWqw0mAxNsRNHoA7pHDqXw
         86ans2RNu3I8QwwRsQIW1kFYDtb3eCVg9zTTsLw4bHa9Ow4UJbZpvVjFrw4I1vfwFG6Z
         f71FHAcHp5Pn/NAR4ZNNaKdUCiZiLXrILcRYmthUuEyGYEkY+znS3warXi3spC4EVMLP
         oIXAQ/OQuofIii0bYs2ssH1Y7y/cZfXPxDNkp4irLwYLxC75/63Okd4t+7nGEERsm2zV
         DmGhuhJ3frVwfFo3p8xd/Zo0d/k4oZxseViJ0kw43yce0f21gfXdaprQNLthcTH12nxn
         TB6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794542983; x=1795147783; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XoLZzG396KJyQUQ2LxytgjwSvwf8GibKblRMQQWhxnE=;
        b=D25Wx7QybbOHYc0rzpJI8b4Tf3i8DOVVKrwv6MjE4jWsCXmsLS3w9NP5+YLXGBB+2D
         y9ztlLLYI7wcTaQXImP8Jf4c1E1H3uBg03S+H5d3cZ/KK4b5n4Y5fc5ZTc3AUi0VmXE5
         jOxJAXmh0+1evLwtHhhTdjMWOL2+anMPjHXyxUYl0+intcZhQnrzGMo5+pDhsCCwMpRL
         MniKEyZw+ZNOmgflisFgT0tVy3Zyt1SfsjZxA0WeFtN7RASCpjiFLH3+qT3z6vspc1qy
         sqBhuhSKW3TYj2ERWCiQjY3zcigrNvjEVoQVcsROmqFRCr0l/mLD0EbsygGwVXxli4bP
         U5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794542983; x=1795147783;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XoLZzG396KJyQUQ2LxytgjwSvwf8GibKblRMQQWhxnE=;
        b=Zr0UPoikQXjW2KJuBJXCzqBts24UyXGdp+K234F0VPG4R2TBbdlAeZgLIgUxQkogli
         G48OlRIC0rRElTSQvBQd23p4wq21YM1FKs8ItC6wb/HrRzM11Y8UTWmZSAtQ2jKvhQ3u
         PVYjCP8VCCImt29Iu7JiJPv5Q3vy80VW+juhIfLbfjaJ2raDezgm3QsqCY5uNmXk0+Xv
         ImUBj9jOpEe+ttJ4rcz031Ut3wt3dp8Owz2pHE6VqEtXllCXRvvU8VlD0t2/FEFCxg1g
         aCeGAKBfD3FGi6GDol50oxgRG17sqMgUTBnejJm7J7FRdJJOtyBjZyJh43q5tbO1ptYx
         CAxQ==
X-Gm-Message-State: APuU4Z+gXC6mcvHUNMBH7B1vLZKGIUxnVPzm8vVAoNQhclLJKmkwoUvV
	Ln8dxYpgl3F4SeC/vqYXfgHh6ymE0U33nZ+Vfj00EuijwYHpfFTqRqZHdwg48chGUmtgricHvgu
	UGZcszuvREHrFdFn/1v8sCD8DD/LsO/59z9gj
X-Gm-Gg: AYBFou0BxcEu+IfbwRJFe5P/OY8PsJtfV1YHqB2FQ9x3KNbx0DJG2F5JdKCGWCjbWwX
	S0YS3si6T9zinLgY7TErSm03CkHaBH5RwHP55aA5vtrPZzBs9uC1cmyQQ5bzP0XGwuhrKEKstRU
	1H1XlDGbq05PpjVw5W7I4H3qB9nDYiF+w55GWhUZpTLwD/40cKFhD7CDFJD0B/Mqj3gDGCl6XN3
	Cjqrzy0ZqFGaDa3IWN1Um7TQA5gzTApcJ77mFHnoiLYjMafD2ZvZKNcggj4LpS5iar8IWYptvPm
	OJYYFyIJXlBMUZKDmRYS+VK3PGvK69Mi5unQ0L9XDBxz5LsW2hViYrzD7i295AgAWrphcbRRF44
	IjG0uoqPvS8a4EtUUAb/AkEDyT6BcG6/UsfBNdoaZdZCv7HYQGOwRF4a156NzdY4asfAVWVxw/U
	I3SnQL8D58OkrbtJb+hEh3lYw81iMUbItJ8Vx8PUhBLHTT1sTO
X-Received: by 2002:a17:903:94c:b0:2e9:8202:5083 with SMTP id
 d9443c01a7336-2ee0dd6dec3mr13813135ad.55.1794542982803; Thu, 12 Nov 2026
 20:09:42 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112105116.32274-1-phucduc.bui@gmail.com> <20261112105116.32274-3-phucduc.bui@gmail.com>
 <sashiko-outbox-210979@kernel.org>
In-Reply-To: <sashiko-outbox-210979@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 13 Nov 2026 11:09:30 +0700
X-Gm-Features: AclHuK_FT4t-gHEPN9lEz3pFi9xgaYKjHallEH_VKLm5TSQEzrOCBtvH2q8fMTY
Message-ID: <CAABR9nGRLeSheafnue9UONDT1My=d4gc7T93gCYxsoR7_SQhDg@mail.gmail.com>
Subject: Re: [PATCH 2/5] ASoC: fsl_asrc: Fix handling of deferred spba clock
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: Medium]
> This problem wasn't introduced by this patch, but can [1]
> fsl_asrc_config_pair() leave hardware registers with stale values across a
> warm reboot?
>
> Earlier in fsl_asrc_probe(), devm_regmap_init_mmio() initializes the regmap
> cache to all-zero defaults without issuing a hardware soft-reset first:
>
> sound/soc/fsl/fsl_asrc.c:fsl_asrc_probe() {
>         ...
>         asrc->regmap = devm_regmap_init_mmio(&pdev->dev, regs, &fsl_asrc_regmap_config);
>         ...
> }
>
> When fsl_asrc_config_pair() later calls regmap_update_bits() on REG_ASRCNCR,
> REG_ASRCDR, REG_ASRMCR1, or REG_ASRCFG with a target field value of 0 (for
> example, a 24-bit audio width or 1:1 clock ratio), regmap_update_bits() sees
> 0 in the cache and skips the register write, leaving the hardware running
> with non-zero dividers and modes from the prior boot.
>

This is not related to this patch, but I checked fsl_asrc_config_pair():

- REG_ASRCFG is volatile, so it is read from the hardware and is not
  affected.
- REG_ASRCNCR always gets a non-zero channel count (channel_bits = 4),
  so the write is never skipped.
- REG_ASRMCR1 is affected: with 24-bit input and output, IWD and OW16
  are both 0, so the write can be skipped and a previous width kept,
  e.g. after an unbind/bind.
- REG_ASRCSR and REG_ASRCDR can be affected only in rare cases

One way to fix this would be to write the register defaults to the
hardware in fsl_asrc_init().
I would prefer to keep it out of this series to keep its scope unchanged.
