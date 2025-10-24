Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC763245019
	for <linux-sound@vger.kernel.org>; Fri, 24 Oct 2025 11:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761305912; cv=none; b=t9UjLI9G3RrhW1GhvpF8pb9eZf5Zy9ERnS/Pg3+fYXLDYd8IVlQikd/JDBtRFuwWCzTsFY+LPTQkaUSe8v8BIIdCO3xNv69+Mm/8Q4oMK14SmwI94dzU3z7i2NNZpv0Nd96mcVa9mRw6EnZEYIZaqw1k4O7VEPIBk1jQfFKNRnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761305912; c=relaxed/simple;
	bh=TNli6Ukpfw5UHV+Xrq/gcko6hkpJhhAtafPSI2YFAV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CuH1tkoARUBT85x53iqjsTUlvJYDJVBWstWbodGnjS9apdEe02SBBAmRzkUAYbaBr7y3u2pmT2Zrsv6kDAnipBdM+5t0R6a7u+CK0coQ2jBVl9jGYh+uuJ76qRhhAIeA/XLVoTu8utpmdOzAD5AQxKDJqr603Zm0BVRYwFjXgwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=PzxRtq2y; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="PzxRtq2y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761305876;
	bh=MjdwSnj01bTkbpWB5cU/EqAQ+QiDj8n8LD3AVNdW+6Q=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=PzxRtq2yBAj+x+8je3cTn9a5G1SdaKAXY0jLZbwiMWUJn6+LoGJsbQUoN04dmVUn2
	 hYFUs6Mr+L4FdJKe6YZt3QV1OJeQnsFaMw8Z9nAPsojvPo/HUddlMZ4TfbA4bABCBC
	 LLeVtEaqpOppkMKkl60FJa3Q+PyNz6eld7245tx8=
X-QQ-mid: zesmtpip3t1761305872t6eadf488
X-QQ-Originating-IP: 8WK1tlEJ7yZ0q3mM3vOdg+UHsoeSnVI0ZdcYi7boKGY=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 24 Oct 2025 19:37:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4615944976332714915
EX-QQ-RecipientCnt: 4
Date: Fri, 24 Oct 2025 19:37:51 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Dan Carpenter <dan.carpenter@linaro.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-sound@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [bug report] ASoC: spacemit: add i2s support for K1 SoC
Message-ID: <E26A36F90026E89B+aPtkgbhoPoTzVnRN@troy-wujie14pro-arch>
References: <aPtiNCZ_KBezL2Dr@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPtiNCZ_KBezL2Dr@stanley.mountain>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MHTX0sLToyeqFOKYEbBTwkOr1XGnYR63r1LS4pYikDyA9Ywi0yA/Rie+
	eG3KSXGeNnsBalaoAR33IIi63LwTLMDHTdz5SgyRSpKoSceeyo0bxK2RcXN/R8cGrZq6VPn
	Z+5OcwGsFbP0TzVnX217ID6dORvlCnI2rK6UkiEYG6ir0tiKfa+7+CrBUrA1DRFFsv/ri6M
	aqLQNycL2IprYJzJgO3S0kImP/4MRS1d2TsVW3jx7YDGwnDi5B1bLPEG8hIPz0ldRLyvBTT
	MAm517t9luU/e+QEfiIh1rXRzihmXxzvtVgloGuFUWgvkIpX7eY8QcDEgZ/lr3PPkcHLaaz
	DMSdmBdsYdeWZRqbR2VtXzexhKflws54nSPXoFL+nj6fKTlc0JaIOZf8ShVKcMRyB5zjOt3
	tzJ0h4cgJ90Fz6uCQdejqZTAWd1SyI1p3AmQoO6P6QNvwHEU98gYNkH/ZzY6I5MjssWAeum
	eesBWOMr46RU1EpGI3igo9Roy4XTmYKrPvTGiy7bD2U1BCEtM14fC79WI3EFjjGAbT/pfHz
	VEWrvy38ZloGySdd+aIQ77iSDmBBe3QLblzjZbIIxIiGXYwzcet1qUBnMO7aG+EUutXhJnw
	2ybeXEWASem4dHP5M33YjWGmyvA3YsUMa42WJmx5T2g8VDMu/Bt2+FvZXXWnzuUZ8XHHlQs
	kjKhrL1+fHX/PnGFs8jcskg5zTZ/a9VyncQJ3t4jOL72HksDmg6+nphgkMsLc2DHtkZSN6T
	aRYng/ZE8wegBuHR/64qNSCFX2eZHXglCAOP88D+NI9+9f+jFUTqb/BNebJGoEuZ/vEaubl
	j9cNalb7gvaW3WRoU9uDun90Q6sIByhhsA05ljOH6ceGdSMRSqTLXqIgns/Ixyqca89DYmA
	iHkcOOxEe6zmc4rTsJ4dIjDTGrE42Kd98zT/arxQztsUGSu8R7xCqe9+1J5mKecloHcPFJ6
	zXxBpEGvZvLtk37I+K1FjrNanuNQX8aghsF2fJPLQj9VDUtw49RWu9qlHJjJlY5dt5zvKe2
	jyhtxcNanwWcc8xwCO4PqMRbNJ1pc4V4Bt5BPpN3FvyVs+I+3ozoVKlnH09Sc=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

On Fri, Oct 24, 2025 at 02:25:40PM +0300, Dan Carpenter wrote:
> Hello Troy Mitchell,
> 
> Commit fce217449075 ("ASoC: spacemit: add i2s support for K1 SoC")
> from Oct 17, 2025 (linux-next), leads to the following Smatch static
> checker warning:
> 
> 	sound/soc/spacemit/k1_i2s.c:435 spacemit_i2s_probe()
> 	error: uninitialized symbol 'dai'.
> 
> sound/soc/spacemit/k1_i2s.c
>     389 static int spacemit_i2s_probe(struct platform_device *pdev)
>     390 {
>     391         struct snd_soc_dai_driver *dai;
>     392         struct spacemit_i2s_dev *i2s;
>     393         struct resource *res;
>     394         struct clk *clk;
>     395         int ret;
>     396 
>     397         i2s = devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
>     398         if (!i2s)
>     399                 return -ENOMEM;
>     400 
>     401         i2s->dev = &pdev->dev;
>     402 
>     403         i2s->sysclk = devm_clk_get_enabled(i2s->dev, "sysclk");
>     404         if (IS_ERR(i2s->sysclk))
>     405                 return dev_err_probe(i2s->dev, PTR_ERR(i2s->sysclk),
>     406                                      "failed to enable sysbase clock\n");
>     407 
>     408         i2s->bclk = devm_clk_get_enabled(i2s->dev, "bclk");
>     409         if (IS_ERR(i2s->bclk))
>     410                 return dev_err_probe(i2s->dev, PTR_ERR(i2s->bclk), "failed to enable bit clock\n");
>     411 
>     412         clk = devm_clk_get_enabled(i2s->dev, "sspa_bus");
>     413         if (IS_ERR(clk))
>     414                 return dev_err_probe(i2s->dev, PTR_ERR(clk), "failed to enable sspa_bus clock\n");
>     415 
>     416         i2s->sspa_clk = devm_clk_get_enabled(i2s->dev, "sspa");
>     417         if (IS_ERR(clk))
>     418                 return dev_err_probe(i2s->dev, PTR_ERR(clk), "failed to enable sspa clock\n");
>     419 
>     420         i2s->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>     421         if (IS_ERR(i2s->base))
>     422                 return dev_err_probe(i2s->dev, PTR_ERR(i2s->base), "failed to map registers\n");
>     423 
>     424         i2s->reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
>     425         if (IS_ERR(i2s->reset))
>     426                 return dev_err_probe(i2s->dev, PTR_ERR(i2s->reset),
>     427                                      "failed to get reset control");
>     428 
>     429         dev_set_drvdata(i2s->dev, i2s);
>     430 
>     431         spacemit_i2s_init_dai(i2s, &dai, res->start + SSDATR);
>                                            ^^^^
> dai is not initialized on failure.  Generally in the kernel we always
> check for allocation failures.  Even when they can't happen in real life.
> I was hoping they were going to make a rule that allocations under 4k
> wouldn't have to be checked but it hasn't happened yet.
Should I send a fix patch now, or should I wait for the maintainer to
revert it first, and then fix this error and send?

Thanks for your report!

                                - Troy
> 
>     432 
>     433         ret = devm_snd_soc_register_component(i2s->dev,
>     434                                               &spacemit_i2s_component,
> --> 435                                               dai, 1);
>     436         if (ret)
>     437                 return dev_err_probe(i2s->dev, ret, "failed to register component");
>     438 
>     439         return devm_snd_dmaengine_pcm_register(&pdev->dev, &spacemit_dmaengine_pcm_config, 0);
>     440 }
> 
> regards,
> dan carpenter
> 
