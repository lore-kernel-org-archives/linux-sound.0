Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45816FC1F
	for <linux-sound@vger.kernel.org>; Tue, 14 May 2024 09:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715677585; cv=none; b=rLWXPI+yYMMdPJQhN7MfL41n5ciEab8PirQolUILsguKuSf/VSYiKmMOIHQz37yM5zxEdBYiRXS0VRGarJZXyfonI9wKu5Ln2aWz1oWhIwyZ412wax7MC75hZNIFgalDMErs9hMzY1ofS3nKbhON+Xc9Lnd3PUkIooldpHKDR6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715677585; c=relaxed/simple;
	bh=JveulSWtJk0/yBRY2YIfL8dzWQxVPxJpo1BEZ+B42+4=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=FloPV0mrBDciuoPnkYHKeweX2Abl+LsYeJBBnDLgiQUGZw5eI1HFHkn/GeI9VVkZrHNPQFcsT/+8oD2GA7pbUnfWZkwZdagWK3yZ3EblVQ+LVpmUUJuJqvnzhD1OS8W42d/m087L3uVMnlGolSuh0oN9zVQIo8pxH8ErHYa4TGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Y0tji745; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Y0tji745"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-41ff5e3d86aso27509905e9.1
        for <linux-sound@vger.kernel.org>; Tue, 14 May 2024 02:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715677581; x=1716282381; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=oR0ReylhKEqKzH5kHG2G6k5ALzu913m0pq1siK/oT9c=;
        b=Y0tji745cF0/Jqw6sW1z8zpgoPYXNQmkB+nxg5TevefeUJ0thhTpZxhcrTXGroPPTl
         vfZH8iVzHsx9Ht3evrY1CWB3oCB/yrXsP1Qph+TMA4kW+Kbm/NYgkmA/Z8qS2YZFZuP7
         J5CdBQh0N7LPjGXNMUOeQLrWOCLcuu98/lHQFan4hl0RvdtkZyyajxZUgeXkdQfjwqSc
         aAYh1iglY633GJV/Er79mHhA2QnBAPnDeI3THiQRkK9Czy5hx0LhjVIo5cyCK9JiCRBa
         Y0Ea/q6x5sMi94lwMmX/7tD9MpZF0hDtYA3Zl44Z+SXDPdQ8MHytTsvLISsJlpwGhiHW
         vwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715677581; x=1716282381;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oR0ReylhKEqKzH5kHG2G6k5ALzu913m0pq1siK/oT9c=;
        b=kjhwqGaP12lHd+Rwc7XiMnYlqlGsjKtNRTLGETmMut/GqFb/UIkOdRlhyss96n/CJW
         Tbpot6VeQ1ilc6qAqgaHu+1McM1xGxggxsjyF/cLql3P/ThJpMGatyEJ/3ZEfu76UjXW
         FNe+99bYzMuEk769RNpvbJCLzqr2brLtR0bVjUOr95XdnCDijM1d0Clclr6Yzk+TDzjS
         FYUf1iUJfWtadeWY0S7UcjyCX2SFmc0/7AJt9MTeU+Ub61/YQFbUkWx9oe8tTFIaPSw3
         BnapvvzB2Ep6GgwYIbz2g9xmHnhfkXvpoRKVi7o1Vgl1u7Y1TSGbVqhegRaI1aEoAh9q
         O9Kg==
X-Forwarded-Encrypted: i=1; AJvYcCXeaF2yP5YVzM4i43BVJmJHqpnvEg5wWZibIXnWejl4uOxsoILmiB5bmZJgN9fMHp0HIJwlAZJSaDynGaQ9CHIJxp2O2bbcQtaqb0U=
X-Gm-Message-State: AOJu0YzURhG1LkkKHJFD0wAxtejw6HpxWtFWvjHueh4HPQEb0xsNmYEZ
	3XV4BngpqG6LdLu7TxmSR0PnezHhKUvPeVMQbiEES3TUt4o9F7pGFyTBslk6Jog=
X-Google-Smtp-Source: AGHT+IHW4C09dzKGpNnXI4nTfM4zJ0z+4B+aD9rH4pjOFB4gyI2EBMozVqvi/q5TDnnmVbzVUKgD6w==
X-Received: by 2002:a05:600c:438a:b0:41b:cc7d:1207 with SMTP id 5b1f17b1804b1-41feaa4335cmr87706765e9.19.1715677581563;
        Tue, 14 May 2024 02:06:21 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3f47:f219:de13:38a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce24efsm186103125e9.19.2024.05.14.02.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 02:06:20 -0700 (PDT)
References: <87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com>
 <1jr0ee2ebk.fsf@starbuckisacylon.baylibre.com>
 <87pltxmakr.wl-kuninori.morimoto.gx@renesas.com>
 <87edaba5ze.wl-kuninori.morimoto.gx@renesas.com>
 <1j1q6b1gxs.fsf@starbuckisacylon.baylibre.com>
 <878r0ir1qw.wl-kuninori.morimoto.gx@renesas.com>
 <1jwmnzz5k3.fsf@starbuckisacylon.baylibre.com>
 <87pltqzi3n.wl-kuninori.morimoto.gx@renesas.com>
 <1jseymyxa6.fsf@starbuckisacylon.baylibre.com>
 <87h6f1jn25.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Amadeusz =?utf-8?B?U8WCYXdpxYRz?=
 =?utf-8?B?a2k=?=
 <amadeuszx.slawinski@linux.intel.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Brent
      Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Hans de Goede <hdegoede@redhat.com>, Jaroslav Kysela <perex@perex.cz>,
 Jiawei Wang <me@jwang.link>, Jonathan  Corbet <corbet@lwn.net>, Kai
     Vehmanen <kai.vehmanen@linux.intel.com>, Kevin Hilman
 <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Maso Huang <maso.huang@mediatek.com>, Matthias
     Brugger <matthias.bgg@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Vinod Koul
 <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/3] ASoC: grace time for DPCM cleanup
Date: Tue, 14 May 2024 11:04:40 +0200
In-reply-to: <87h6f1jn25.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1j7cfwzrsj.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Mon 13 May 2024 at 23:42, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Hi Jerome
>
> Thank you for your reply
>
>> However, I'm a bit confused. If it is handled automatically by the CPUs
>> and Codecs settings, does it mean dpcm_playback/capture flags are
>> no-ops from now on ?
>
> Yes.
> dpcm_playback/capture flag itself will be exist for a while, but it will be
> removed soon (v6.11 ? v6.12 ? not yet fixed).
>
> Some driver might is using dpcm_xxx flag as limitation of direction. For
> example HW can use both playback/capture, but driver want to use playback
> only, in this case, driver might have dpcm_playback flag only.
>
> In this case, driver authoer need to update to use playback_only flag
> instead. [1/3] patch will indicate warning about it, for a while.
>
>
>> Should I update my card drivers to ditch those flags completely ?
>
> If the driver is using dpcm_xxx flag as limitation of direction,
> driver author need to update to use xxx_only flag.
> If the driver have no such flag miss, I will remove all dpcm_xxx flags
> when end of its support.
> Of course we can avoid extra problem if each driver author remove/update
> it by themself, instead of me ;P

Makes sense. I'll check your v2 and prepare the update of the related
card driver

>
>> May I still disable a direction on a link from the card driver, like in
>> the case I described above, when a TDM link has no slots for a direction ?
>
> For example, in case of CPU can handle both playback/capture, and Codec
> handles playback only, it will be playback only automatically, no Card
> settings is needed.
>
> If both CPU/Codec can handle playback/capture, but you want to enable
> playback only, you can use playback_only flag.
>
> Is it help you ?
>

Path forward is clear. Thanks a lot.

>
>
> Thank you for your help !!
>
> Best regards
> ---
> Renesas Electronics
> Ph.D. Kuninori Morimoto


-- 
Jerome
