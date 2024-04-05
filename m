Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F05D145B31
	for <linux-sound@vger.kernel.org>; Fri,  5 Apr 2024 09:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712308031; cv=none; b=awgBhBITLJDT1wT58950uMlnA07Zg3geWADQkennIFBSSxr1zUrhLKecRng32LkMGwVhwrbItFG+03FjvEDj+OnMlSo8XVznngZ+asp9NZ1G2Hw8U7BKcaE6m6AAunLQCUqTZ7m426BOLkG+crEqeEGFnc+L9WZXw9rdp7O06a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712308031; c=relaxed/simple;
	bh=wgbkCTuBbl1v4iGyL5raRIfbmwPPU/O4ePJXdJnc/o8=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=kjPOKkmTTNZZZfeRb/N/uaHydpmI0AB6lImqsxVfT51YFQ0XCNCKJe0O2VdFGLws2drozjtQYkr/7rzgaAtog0Fn3gkV67rn8VRyi6Zrnwsq5SAPi0rqqAXclpyIvnfpR7wKzc7GmgrMwb0xmCh6hCDA9Le5B/go/WgvjFDlmrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=C9R9cDmG; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="C9R9cDmG"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d717603aa5so24083561fa.0
        for <linux-sound@vger.kernel.org>; Fri, 05 Apr 2024 02:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712308027; x=1712912827; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=dx7Q6iClG4dKjPFFAd0xEXzHEYFgFMGOrT79d2/WULs=;
        b=C9R9cDmGdVmVPABB7C+XvrrlHmxV2araL0XH2McCsSRCYwbp1XV3YFgjutc0+CUc/y
         KkjDLtue7UIZO1RqulmYDLDXhEdGuh3tf+GdCqpimD5Eqh5/yuYKzIdeMw58NgZCl1dw
         CvJKAJ/U7JgPDXzR0a0bHh6DOirLXMyFlNQSjXuK+cPdeBr48lu8ag9McNFAAKwno2PL
         7RXS1nBiujgZnKiMofdG6yup5r4jI6wbL2wSNt73urSSezD23pWukMi4ZcrhUKkcWrf2
         CyRyzQ4Wpmg+JXJMtu6S2jCBTsb4Iu4vdt808ajDTXaYmVNKrYk4mS4oSyvk6EOL9a0Z
         jUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712308027; x=1712912827;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dx7Q6iClG4dKjPFFAd0xEXzHEYFgFMGOrT79d2/WULs=;
        b=gU+/hnXuUI+qM1en+Xmnn5DtJ1jrOBbXuIFLirUKDXvVMd8ACGPhFr9FYkZaguB27H
         Cxf2c6zcUqIzgQDlo0j682M4HJ22wdURio2pwxPS3c57Efl1ZlEJoe3hPUeqlqRRU27K
         /+cerPviXsJkQUqUNaGUNGs5CZG7LhVEXhzrkVf+eOcV2epcMjKyB/vttrCJ+eXr0z1K
         bPfmc82x7IIe7/U1yRjPOdt1PiRl/2RldE76gpsKw/7qflMFbGagGnZtK20aW1dVOI3D
         IC/gdNUwy73DDCw3KWrn67Yrj/uM5eba+aEzU+mtmLA75FMm8cPG5al/31XKmS30Q3BY
         69eg==
X-Forwarded-Encrypted: i=1; AJvYcCXY5M8+eNEg9zdZO0A4VkFDFvIwn55glk2S8NUwJPnnUeNzw/Hb9BvEiThsCE8LvZugOs1pdxvRL+eY8nVFAOBzoxMPTDA618CgxgY=
X-Gm-Message-State: AOJu0YzZtidhmQ0GEefF+q1ZleEWncUDr9dDNwceDKqV8ymwAA5w7Q0H
	hnJrk6oidCMHLEUTdRk68Yv3MsYhZSZFWjWAmRrXwvu9coO+vYllaYA6bJQHv04=
X-Google-Smtp-Source: AGHT+IFzNpI2nNYaTUkEnZn7gYRwkIeFIyuTNluFylKpIC0pmqbq+2qkk9YMdM/xrAATLZryy+1B1A==
X-Received: by 2002:a2e:8084:0:b0:2d6:ec7b:b69b with SMTP id i4-20020a2e8084000000b002d6ec7bb69bmr693984ljg.7.1712308027074;
        Fri, 05 Apr 2024 02:07:07 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:dd7a:d766:e9e8:454c])
        by smtp.gmail.com with ESMTPSA id c24-20020a7bc018000000b00414887d9329sm2122868wmb.46.2024.04.05.02.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 02:07:06 -0700 (PDT)
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
 <1jil0xplcu.fsf@starbuckisacylon.baylibre.com>
 <877chcraaa.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>, Takashi
 Iwai <tiwai@suse.com>, Sylwester  Nawrocki <s.nawrocki@samsung.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Maso Huang <maso.huang@mediatek.com>, Mark Brown <broonie@kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Linus Walleij
 <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Kevin
  Hilman <khilman@baylibre.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Jaroslav  Kysela <perex@perex.cz>, Hans de
 Goede <hdegoede@redhat.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Cezary Rojewski
 <cezary.rojewski@intel.com>, Brent  Lu <brent.lu@intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Banajit Goswami <bgoswami@quicinc.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>, Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-sound@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 00/16] ASoC: Replace dpcm_playback/capture to
 playback/capture_only
Date: Fri, 05 Apr 2024 10:59:20 +0200
In-reply-to: <877chcraaa.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1j5xwwp491.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Thu 04 Apr 2024 at 23:13, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Hi Jerome
>
> Thank you for your feedback
>
>> playback_only and capture_only have implication on each other. If one is
>> set, the other can/must not be set. This leads to conditions which can
>> be fairly hard to read and possibly bugs.
> (snip)
>> Wouldn't it be better to replace those 2 flags with a single bitfield ?
>> 
>> something like:
>> 
>> unsigned int directions;
>> #define PLAYBACK_VALID	BIT(0)
>> #define CAPTURE_VALID BIT(1)
>
> I think Amadeusz indicated similar idea, and basically I can agree about
> it.

I've seen it afterward. It is similar indeed but I don't think 'None' or
'Both' should have a dedicated bit. That would be yet another
redundance/implication between flags/bits ... so another source of
bugs/complexity IMO.

> But in this patch-set, I want focus to removing dpcm_xxx flag as 1st
> step. So I'm happy to create such patch-set, but I want to handle it as
> another patch-set.

Fine by me ... at least for the Amlogic part.

>
> Thank you for your help !!
>

Thanks for your work !

> Best regards
> ---
> Renesas Electronics
> Ph.D. Kuninori Morimoto


-- 
Jerome
