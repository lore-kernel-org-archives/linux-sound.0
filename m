Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DA539B979
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 12:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776688958; cv=none; b=gmBWxd2LmSC4+etE9jXzmSdsdEqU04BtwYW8TXrlRZDDk0heKfTEotXSruiSQ7ZRwHXuXGyrpbsPg+VE7c0fsVTXoV//A2sSYxIii0TWqdihhLUOQ8qnZJ5kEWNlSwCBfMV+IwXxxKvHk7rEiI/5UWuZKyo4BaPQbz2B1mleFkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776688958; c=relaxed/simple;
	bh=sNWrPKdgJgN4wDqDTIFsuQqmdu9qGGj8pSrpP6xnVSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hZAvSoSbL9maXiGpQSTMMJz+0qqIyXLqEbGfds+HfquQjw+5WbzVUqVHMs2NpUoad/lbKgUGL80rRhRTnSZNnK4eLWVhtpOJwDMQpfjGPOnPz4RKwAIoK2uq1TXOaViSjsLXLStqtOrRWH3FfVyNfTCd7wYzE3qRzoV6+OV8ZIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=k7PI1j9L; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="k7PI1j9L"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488d2079582so35229455e9.2
        for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 05:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1776688952; x=1777293752; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4trd1lG68gD9u1MDZvKe+ZbY4mqv6K/rfC6lhMlRK5w=;
        b=k7PI1j9LwDWTSvQxZkT4LRvWYktO+ZiMTsnsvfphQ/vxtG34qZc44HiwoWnrLfBkYp
         jkKydELyESKolL0ORuwH12TRljXASqIDf1w8E5ted9sgc6BiLcwWKGnlZbigDWiuDzZN
         J+bIiDwugYQ0LiqaIvoKUWqW6i8NItiBwA/RTEHdWur+WvidZxULQKzLdnsWyWbGlD2g
         MrDkuH2+znM1GwhFbAa9sbUEoZwmB0kTXye8B7dJ2NUTUZYTs8toKfjaUfy26X1mpf4E
         2+3P7mLYUNHX4Cnfg0kgCU/uil+Gxqs6hGoOIWZW1EUjyWCZkvPPC6hBZ8mo8VgUdQZz
         0Xhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776688952; x=1777293752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4trd1lG68gD9u1MDZvKe+ZbY4mqv6K/rfC6lhMlRK5w=;
        b=EKIhehva7OC/SZYMMuWyLovF3C7rE0L86FjCRiEfiH4c/MH6UcnJBN5Yvm40z3QfTv
         OiBGNL/r40xXet3OPljz4td+mgayC20W4SGFZLgt+GtzP34v17z4+5Mhmpotcl0ai8q4
         EGS5NX8L+j4ezUAg+mVXKqdZU8WMv0Jg6kEep/KT0Pt9B4zb7lX5utY8yJiXu6ohJ1Dk
         10WFRDpUMhWqpmUwbP1oZpkAPl8dMvV2nzI+s9a51j26oHa1/2amd7z0xVZcKK2fUjQz
         voGDSxyJSfIQBClD0ex/emeaZFDiC0Y01f29PENUBhWNKomHSOvu8Lxi5thxJpvloerO
         8D4A==
X-Forwarded-Encrypted: i=1; AFNElJ8tOCBPXo8F9CUvTURwsuRBWFRT0RwTdgnCkIu5T6hoIJpLSotx+Yz+J52cfQFqHfNgXslWinANGZrkZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGoGVdGbWyk5jRulFqfpujnB/8USNtlP5NUTMZydlQ0Ckyu1lL
	QIyRYl5jpiFJzRV1pE3rtZ+TPoQ1iEDGxoMaMcwZGGG0D7m3dhKd0NxCWHpdnzF8eBM=
X-Gm-Gg: AeBDietJBOriMUIuhepOG1NPyJvbSr2FdENPDRIT4zEzWXk00rink6Om83tV/z1nwy0
	2Iqyfkg8s3GxaFlj4weX7VEPndVpW64ciMj87uyH0aq6Zj3z0PhbMkbUDIKvOpLyXBhFYfVmOV2
	df7C/tTmqieWDtlAN32zXV+LphXacGTwx62RVs+yWQeuCi/wSoakzypxhZ8D89vt2M7M2Zcdeia
	ZEFRiPQahzuBNBl2h9QBsVOzeyR+TqunitLFymPlfmzXbKtfaq74m78opxMMVGp6U+2A/qf6DPV
	WI0Y6MzNIU+Qm2CRYChQ2VcAHJkp0WDHgIOqEgdCKp5pO8ohE+HqOugnmdj6xIz6VWBgD4TEFLA
	bsYO2F4wrbBMI6cqgbGOnmQkxtu8/2QgvXhR6utZVhe3eNaDFefKzC0SAXYiVQ7QPCEWO3IxCCv
	wGKuQmx3UgPueEUc4Ay7kfoV66JJEg8fWf/UA/lBN8HQ==
X-Received: by 2002:a05:600d:8447:b0:489:1ff5:edda with SMTP id 5b1f17b1804b1-4891ff5efe1mr26450215e9.6.1776688952186;
        Mon, 20 Apr 2026 05:42:32 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1405sm28007039f8f.4.2026.04.20.05.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 05:42:31 -0700 (PDT)
Message-ID: <5f495c4d-60b6-47c5-b84a-e1ad952f1c75@tuxon.dev>
Date: Mon, 20 Apr 2026 15:42:29 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: sashiko.dev review (Re: [PATCH v4 11/17] dmaengine: sh: rz-dmac:
 Refactor pause/resume code)
To: vkoul@kernel.org, Frank.Li@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 p.zabel@pengutronix.de, geert+renesas@glider.be,
 fabrizio.castro.jz@renesas.com, long.luu.ur@renesas.com
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
 <20260411114303.2814115-12-claudiu.beznea.uj@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260411114303.2814115-12-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

 > commit c08d50f3400ecf3dbc032455be7a589baf899258
 > Author: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
 > dmaengine: sh: rz-dmac: Refactor pause/resume code
 > This commit refactors the pause/resume support to use a bitmask for the
 > channel status. This prepares the driver for upcoming system suspend and
 > cyclic DMA support where multiple independent pause states might be active.
 > > diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
 > > index 04eb1a7f1e627..d009b7607d447 100644
 > > --- a/drivers/dma/sh/rz-dmac.c
 > > +++ b/drivers/dma/sh/rz-dmac.c
 > [ ... ]
 > > +static int rz_dmac_device_resume_set(struct rz_dmac_chan *channel,
 > > +                                unsigned long clear_bitmask)
 > > +{
 > > +   int ret = 0;
 > > +   u32 val;
 > > +
 > > +   lockdep_assert_held(&channel->vc.lock);
 > > +
 > > +   /* Do not check CHSTAT_SUS but rely on HW capabilities. */
 > > +
 > > +   rz_dmac_ch_writel(channel, CHCTRL_CLRSUS, CHCTRL, 1);
 > > +   ret = read_poll_timeout_atomic(rz_dmac_ch_readl, val,
 > > +                                  !(val & CHSTAT_SUS), 1, 1024, false,
 > > +                                  channel, CHSTAT, 1);
 > > +
 > > +   channel->status &= ~clear_bitmask;
 > > +
 > > +   return ret;
 > > +}
 > If multiple pause bits are set in channel->status, will this unconditionally
 > resume the hardware?
 > If a channel is paused explicitly by a dmaengine client using
 > RZ_DMAC_CHAN_STATUS_PAUSED, and is subsequently paused by the upcoming system
 > suspend functionality,

The upcomming system suspend functionality don't call rz_dmac_device_pause_set() 
if RZ_DMAC_CHAN_STATUS_PAUSED is set or the channel is not enabled(), it just 
return. The following could be checked:

static int rz_dmac_device_pause_internal(struct rz_dmac_chan *channel)
{
	lockdep_assert_held(&channel->vc.lock);

	/* Skip channels explicitly paused by consummers or disabled. */
	if (channel->status & BIT(RZ_DMAC_CHAN_STATUS_PAUSED) ||
	    !rz_dmac_chan_is_enabled(channel))
		return 0;

	return rz_dmac_device_pause_set(channel, BIT(RZ_DMAC_CHAN_STATUS_PAUSED_INTERNAL));
}


 > it appears this code will write CHCTRL_CLRSUS to the
 > hardware as soon as the first of those conditions is cleared.
 > This would silently override the other pause request, causing the hardware to
 > resume prematurely while another client expects it to be paused.
 > Should this update channel->status first, and only write CHCTRL_CLRSUS
 > to the hardware if no other pause bits remain active (channel->status == 0)?
