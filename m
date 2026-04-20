Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991833A1E67
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 14:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776694533; cv=none; b=S5IZmZSp2/gT54M+7syur5vm/95HEb10uvPUSC8YfOh/ctxEUAMFKo4kJixFofdjk0QGYgTHKo86eJDBFP5yS0wGv+Xxtm8iYnLwDY6nvUkb6fwrjro770Yw65nPCN/0lG+0N5pwrqWf9fcALpYIEuZjdzfx71oTPdHM5qxRiHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776694533; c=relaxed/simple;
	bh=ppsjy5cDgZ57Fyuoqm+hMsyL1FzmZJz4ryCWUG3qf58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X20JyykZJLxhGbGsVXk5I05j29oTsuLms0KUXH3o7y4iqP/MlRgjDHFriGeJNEj35wWXKPa3l7AYyoP2VjUmzswjfr6M5rPM2erLva8yRGM6vRP4Ubxny9nF+64sgXu4N89lrFp3w8OseegYQL3y5qPP9wvmxGf5QiDu0Po6Agw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Mt6szZCq; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Mt6szZCq"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891f625344so9853145e9.0
        for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 07:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1776694530; x=1777299330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t1bUvFpr3NIXY40lz2U87H/IH5ItVZVdVUddh0JtzjI=;
        b=Mt6szZCqaIMKyCOHFVNTJN3cvaGHM6/ZUXjXZeA7ru/cnIwI8HL4M79vTKch9fbIIt
         g20pVkGMmv3p2Nk+SVjcnvXbu3Iue7lVTRrPGsBSJogI3mTwRYGP+Cg1KoHQ4bHLixyU
         Mjo8jGNuM4bbUn1IZUmhXTtA2l4cJ61n2snD4pkJULN2OV/jDvE2hQ99wBx8tqKoFbNl
         IfzLfy/LhaIOg0NwlgjSH3J+fll9yBFfd9q/+tDu0ew4aJ4vWgnj9Xeo8CLbEs22AYXm
         3CDF8OFsQLiAg1dYzUFGH8tJHvTieOv7EAcdGNYDKAiGP+mHTz5wlXIVW3If/yjbUZM3
         d4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776694530; x=1777299330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t1bUvFpr3NIXY40lz2U87H/IH5ItVZVdVUddh0JtzjI=;
        b=VzEoJ7jZSJ9SfzKzRx5rdXVCIJNuD9upMdYrs2nGQnDu39NEiSAdKZl9tn219YQAa/
         X2/nT8gqdr+5ftL3AgteerezIZsRpzzaouvvK0RjyhrKgqA2xMuwr73ByRTrXGqGD/N/
         C0SF8bLnEuKlqBbbn61kh8SNuQ6ssZ99j+7+BCzDL4OFcU/Tvx93HNvKSaVlYqtZHf2O
         3Javmfg0vtbblTuLcK/kpSnU9tX4aAl/hIWhZsZTLc/yaoAH+BzYaQRca87iJV8fjf4F
         ppQMu2WnWWrQ7wfTYn2QQ1s+YqMoUBG4wl79TdnzsRCG+1NNiDzbclaTG9URPiFSLGFk
         j82A==
X-Forwarded-Encrypted: i=1; AFNElJ9i+63O59SF8qnNt0cy0Cc3zpq5seSdDGDdjLPoOzLI9hLqjRA2nDpp0dN0ErCsR+9oeGJUXRqs8Q6HNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/iynknvtRjuiLMj5L/wmPUEo9RnlsBkGbtBt75/rtlkAGxLqc
	fVWgamFW6fTBebF7QMjKL6d2VM4eD5SM2lfUhI8bWwX5iTD8bSSveItwfyLPoqRkd/g=
X-Gm-Gg: AeBDievcUkkOV07d2matz36UHQ4nG7dJ+9jmot20a/SFwh+aIZUM5MzuP0PtkBCPht0
	pyBNmjzLaaF4L1yZ9Kgb57J2zOL70z6CA6O+ieyx3O3prG4GVx4jux/UfqjZIa4ugdWu3TINfF8
	DrVI8VlaB7Moz/vACV9EQS3sK0Q98y0Zd0mAtScaHzRyBRGmvV805cW5Z4n/iWLw749sNyGCnpx
	p7DA5wvYGaX7Ss8vZIKlw+Ggb6FhyrSazFg62yAo2uDzDVYm9+5flAYiJyH/0LPr7dFxHkzTwke
	XYTqIqq6pYdErNJolpwj3RxbcrXgsw8OMK5ZTA9Dvr+NxGCyNYCX4idDKD/kBx6eGM9eh0iGjr3
	4yUjYy++WnsMYhm+srL6NqhGf7PVFvjUo7dgqfzVVzss4Sthbj6ZBfarR27emIHjWHEsFvkY6zz
	ZoTA9iU9a/Xxof2kRPqlUiC5McpQ+NQWzVZZuAhG82YPLQsqeXVBRX
X-Received: by 2002:a05:600c:570f:b0:488:a502:8955 with SMTP id 5b1f17b1804b1-488fb882f13mr152359325e9.4.1776694529960;
        Mon, 20 Apr 2026 07:15:29 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e46471sm28832892f8f.28.2026.04.20.07.15.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 07:15:29 -0700 (PDT)
Message-ID: <36468f41-7808-4fe3-b4bf-94eb128276fc@tuxon.dev>
Date: Mon, 20 Apr 2026 17:15:27 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/17] dmaengine: sh: rz-dmac: Add suspend to RAM
 support
To: Biju Das <biju.das.jz@bp.renesas.com>, "vkoul@kernel.org"
 <vkoul@kernel.org>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Long Luu <long.luu.ur@renesas.com>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
 <20260411114303.2814115-15-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346C39C7EABCC7A1BC64109862F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB11346C39C7EABCC7A1BC64109862F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/20/26 10:42, Biju Das wrote:
>> +static int rz_dmac_suspend(struct device *dev) {
>> +	struct rz_dmac *dmac = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	for (unsigned int i = 0; i < dmac->n_channels; i++) {
>> +		struct rz_dmac_chan *channel = &dmac->channels[i];
>> +
>> +		guard(spinlock_irqsave)(&channel->vc.lock);
>> +
>> +		if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_CYCLIC)))
>> +			continue;
>> +
>> +		ret = rz_dmac_device_pause_internal(channel);
>> +		if (ret) {
>> +			dev_err(dev, "Failed to suspend channel %s\n",
>> +				dma_chan_name(&channel->vc.chan));
>> +			break;
>> +		}
>> +
>> +		channel->pm_state.nxla = rz_dmac_ch_readl(channel, NXLA, 1);
>> +	}
>> +
>> +	if (ret) {
>> +		rz_dmac_suspend_recover(dmac);
>> +		return ret;
>> +	}
>> +
>> +	pm_runtime_put_sync(dmac->dev);
>> +
>> +	ret = reset_control_assert(dmac->rstc);
>> +	if (ret) {
>> +		pm_runtime_resume_and_get(dmac->dev);
>> +		rz_dmac_suspend_recover(dmac);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int rz_dmac_resume(struct device *dev) {
>> +	struct rz_dmac *dmac = dev_get_drvdata(dev);
>> +	int errors = 0, ret;
>> +
>> +	ret = reset_control_deassert(dmac->rstc);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = pm_runtime_resume_and_get(dmac->dev);
> 
> If this fails for any reason, the next suspend still be called and it will decrement the counter, potentially undeflowing it.
> Consider switching to pm_runtime_get_sync(), which suits better here


I think runtime PM usage counter underflow will be the less significant problem 
in case runtime PM fails.

Anyhow, could you please provide the code pattern you consider would be better 
for both suspend and resume?

Thank you,
Claudiu
