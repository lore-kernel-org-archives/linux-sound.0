Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA5B32D0E6
	for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 09:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770715970; cv=none; b=EFOfQEZN4if0v6uDUUsTJRvtZrJIcowReXzXQ0CcMCRI2myZ+Enzx6Xr40Bs0aAKOt/mZnfkzydpL9CyFFpunkfI/Xh6b3r+joYZGFOXn9g5D7Sdk5w41wf2fJNuZBQhCFFprnpVtLdEyPbj9jMUaWXIswGr/e16m2/aIZn9t0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770715970; c=relaxed/simple;
	bh=laKkbAsQf0SJtxRljSNn44EolGwtZv0xIZlmeJAHA0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qt1ATIN3DgZqX9o82R9lMeXxIr//x0L0ed+aBBD7siR4ZU/SyNjTVDjqK1qCpnSPLCiPF4F14AWu3jTMtMkmXJUJp2cpwNwtX1VnVl2QwCt9bdhNKaD4O74LnsbIZxeMkLMGqWDQSgcIJu/+tvox1+n65tjLqccNGCudjvIEZZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfXYf+Mg; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfXYf+Mg"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-482f2599980so6949255e9.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 01:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770715967; x=1771320767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kDX1cQwulzVuiLj3eO/jgS06mt+GxmC17rynSR+42DU=;
        b=XfXYf+MgNrpjM9F2C/C4PKZjNKGijbUnuiUN1RfeLblhP6d51TmZDRAfv9l20fqiwK
         kwM7RunYYoVNJPQgUtMXJLJaY1/R4B0zMXQRgiYD5Udda/vgYXWHwxkw3v6I49MgSFq2
         dh9tpuvtz6Vi2OLHWbGElL7fH7SpFpWiH7khR7zeszNiQNTS2SHOLHj39C8z8ixYwyrV
         r328avN7fdNEzgRtrSGvtVM82u3t5PU9Miv57RJ2d9EJ8ELs9jgVCU0JFHNAE7XdwPOl
         GcZ6BZN0f2LI4Zw1cgo3s3zh6RYEHJCAsweSN7DCz7b0zX3T3gm80Hl7QkD67DTZD1aO
         7XCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770715967; x=1771320767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kDX1cQwulzVuiLj3eO/jgS06mt+GxmC17rynSR+42DU=;
        b=T/RBj3DMOnXGMBwlhW7la82Lk9d9XuPf+9/qiDk+D6y1aeSLUWuiLx7ecJnafhvUbZ
         jhr/Vp99haaPNF6iRL+YrrUFk1LuJKG47E6yGFjN3GD7Fn2V+CdAm9a19QMt85tGvukD
         E2wuVqTJ4zcWzhcxNajhxQzVlg3rCqp3+j/Qsv7/PBMx36jCGBLqSXKWV9PNJI7Kyimp
         TJX1CDqjlMvB9xE3ag2o7yDfPkZXdS35fogpMmAZVzmk5VNazAth8uDFV6p/Rs0yZpIb
         q7yQ2nta0sbJT31mv8upXygdHVknWWJYS77oyp6p16wzUBW0eRiwg7FiLn2HgNwaC7Ke
         4GuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmIqehBEz3QtVS9j6wYVfk6uJG14wDLZ2hqxIKllIKRw0sJLrI0vvrDUK0lh0LIA4JN2iWtL/ziUt+4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7U/IAItnE+x9UVKcy3wUwLfgMRxoim6+9GzWyUJVF8v0BBO/6
	PBQxdNKtJ2QUrUnk1OX2FtUQCjo5bDn6b7eHIIzejCpeC1YSpR0rAzoy
X-Gm-Gg: AZuq6aK3T8l84xPLv3gv4KLheQ0vHhjYyh5pjhP/IikhJq2Ont68Z654KtV2MTASoB1
	6c5W6YojJ0PCsxWejon8Aqx6dsZznoolK5fJP7/uaMBoSaeqIAlqbhTWNkW5bZJF9rrnNFdpRrB
	LfgHzQeqdc/G3iDg35qcRk+9RR5moLzWsrklSvOyHfsXkKiBMtnoX/mFzERuNUVhKevXpoDVDAL
	Yy1ZqGvXAQ2fGw06+0pCdQ21Tma5rK5VbYRQHeFoTIP1RRSOiX8g+U1yLgjWDE1ccbiFmz2ORNa
	LelQCwoaH2p31lPAS1fbrfPi/psYskKNoxN+ty7A7D6nvBFosgzvP/8XA1cUCqfw14oabdG25mW
	S65K8gzd/WNVevG0X4WAf2iW0iYe+TeR2wMJfv+H5smXjM5mGh8upq5zqZO/jBbaNjsSN5B8Zdd
	1V9SSz8rUIzdZcP9r/RYkC/qItYcV45XUZyR4OaYHqzfn6nwjMV3oGJJXtEGTdEcfkw/3Scf0cp
	CTESPvR1hmibryH5fvcYUYR6VYUzw6xIA9ZcQD3bjQ13g==
X-Received: by 2002:a05:600c:4f0e:b0:477:9eb8:97d2 with SMTP id 5b1f17b1804b1-483201dce33mr230022905e9.8.1770715966548;
        Tue, 10 Feb 2026 01:32:46 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320410b78sm174961565e9.2.2026.02.10.01.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:32:46 -0800 (PST)
Date: Tue, 10 Feb 2026 10:32:44 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	alexander.h@variscite.com, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: Re: [PATCH v1] ASoC: simple-card-utils: set CPU sysclk before codec
 for mclk-fs
Message-ID: <aYr7PMyJ1ERcG8rp@Lord-Beerus.station>
References: <20260206134014.143057-1-stefano.r@variscite.com>
 <873439o1xt.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <873439o1xt.wl-kuninori.morimoto.gx@renesas.com>

Hi Kuninori
> 
> Actually, this is one of my concern (= which should be worked first
> (CPU or Codec)). I don't remember why current code calls Codec first,
> but maybe original code was.
> I guess, some other Card needs to call as-is (= Codec first), and
> you want to call opposite (= CPU first). It depends on clock
> provider/consumer settings, instead of mclk-fs, but based on each Card.
> 
> Not same but similar issue we had before about how we want to call
> .trigger.
> 
> 	356caf663deee8dc46ff3168ec0b24bcbeb00b28
> 	("ASoC: add new trigger ordering method")
> 
> It was fixed order, but is now controlled by flag.
> Maybe we want to have similar method ?
> 
> // unreliable name
> #define XX_CLK_START_CODEC_FIRST	0
> #define XX_CLK_START_CPU_FIRST		1
> 
> 	if (xx_clk_start_first == XX_CLK_START_CODEC_FIRST) {
> 		// same as current code
> 		start_codec_clk()
> 		start_cpu_clk()
> 	} else {
> 		// opposite
> 		start_cpu_clk()
> 		start_codec_clk()
> 	}
> 

Thank you for your suggestion. I agree that the default ordering should
remain unchanged to maintain backward compatibility, and we should
implement a configurable feature to change the order when needed.
Following your recommendation, I could implement something similar to the
trigger ordering approach:

#define SND_SOC_SYSCLK_ORDER_CODEC_FIRST    0
#define SND_SOC_SYSCLK_ORDER_CPU_FIRST      1

static int asoc_simple_init_dai(struct snd_soc_dai *dai,
                                struct asoc_simple_dai *simple_dai)
{
    int sysclk_order = SND_SOC_SYSCLK_ORDER_CODEC_FIRST;  // <- Default

    if (simple_dai->sysclk) {
        if (sysclk_order == SND_SOC_SYSCLK_ORDER_CODEC_FIRST) {
            // Codec first
            ret = snd_soc_dai_set_sysclk(codec_dai, 0, sysclk, ...);
            ret = snd_soc_dai_set_sysclk(cpu_dai, 0, sysclk, ...);
        } else {
            // CPU first
            ret = snd_soc_dai_set_sysclk(cpu_dai, 0, sysclk, ...);
            ret = snd_soc_dai_set_sysclk(codec_dai, 0, sysclk, ...);
        }
    }
}

This approach would work well for our case and is acceptable as-is for now.
The ordering would be controlled via the define in the driver code.
As a future enhancement, would you be open to adding a device tree property
to make this configurable per-board?

I'll send you v2 with this modification.

Thanks a lot for your guidance,
Best Regards,
Stefano
