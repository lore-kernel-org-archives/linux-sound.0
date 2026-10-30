Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793325308;
	b=Qq4tPgWsWRtOGX6DXx1si0y4piIVDWJyoPKxkXLZAmdhxOYeog750kz8ffTnAgwascBK
	 QfYczMtjP+WAfueLsQ2lTpTsoTboCxKjXXtSxwt0ufKUVU6ycvg+9/CYGMptz3a7YqExL
	 B9cE/Bd228YQr2GC9zKCRU+SD6ZsASyZHyeHlP6HgYdJZnpd36Z04QPQb8ETPjcu8eypl
	 uEop4IbcWjDUoL8TyBQbqAAgv5P+JbWjCDSYrTbfqEnMfTWfFEzkl83kLNknX7Bbm0+eu
	 OPtzcdBm7upJ0MgGci9cy8H9lK6r4XBrWXBoXgu0xlEtMwlXJt/ieSkv3fxmxwJPKqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793325308;
	h=DMARC-Filter:Received:X-Sender:X-Auth-ID:X-SMAIL-MID:X-SMAIL-UIID:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=LeIMVz0uJy30knxeOmtaYBMlOuv/Z3CD8ITY5XnLo/c=;
	b=uYsl3CCG9kIY1MzovhxHLXJ5uta5JujMYX2ELq6+ukmJti1iVFb7t06WbLMYVyUxNRJg
	 p7JkC+djctBMTcfqH2hX4JfX/ce8dvlnBC5X9mb8+B1ppRPWcaEOB4ZJ+HyC2tp71uOih
	 D0BhQcFGx0I9ciEPwly1sniuxtgJu0TVQ7ef9Z8+0GwJOfsTRRKDqwC51wxuiOT7gPl+N
	 hdGovyJG8ybHwJV2dSwLSedtc0chpCeI0dt8BXnsBnRX3zDcZUgEg2bxXR+schIauKRxa
	 inJ7I8ax2jhpa4DgHyt0htCgohO2nLQJe8yGuND3lNYdMswKlQO4HvBN6IRTfr2DwYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=everest-semi.com;
	spf=pass smtp.mailfrom=everest-semi.com;
	arc=none smtp.remote-ip=202.108.3.57
Received: from r3-57.sinamail.sina.com.cn (r3-57.sinamail.sina.com.cn [202.108.3.57])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DDA606A31A
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 01:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43DDA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.36) with ESMTP
	id 6AE3F8ED00005E35; Fri, 30 Oct 2026 09:54:53 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 7488C84494CC42EBA66E38E9DF3E8B0F
X-SMAIL-UIID: 7488C84494CC42EBA66E38E9DF3E8B0F-20261030-095453
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: ES8389: Fix the issue of hpf_freq keep increasing
Date: Fri, 30 Oct 2026 09:54:51 +0800
Message-Id: <20261030015451.32368-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <179330025628.62540.5715888103847414987.b4-review@b4>
References: <179330025628.62540.5715888103847414987.b4-review@b4>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

> > The problem is that on repeated stream runs the value of hpf_freq will keep on
> > getting updated and drift away from the original setting.
> > Until hpf_freq increases to a value higher than 1020, find_best_hpf_freq will return false.
> 
> > @@ -147,27 +146,25 @@ static int es8389_hpf_set(struct snd_kcontrol *kcontrol,
> >  	u32 freq;
> >  	bool hpf;
> >  
> > +	if ((ucontrol->value.integer.value[0] > 1020) || (ucontrol->value.integer.value[0] < 0))
> > +		return -EBUSY;
> 
> This should be -EINVAL not -EBUSY.

You're right; I'll correct it.
