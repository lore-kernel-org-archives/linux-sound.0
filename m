Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6E02857EA
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 15:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779980536; cv=none; b=nM3+ikpo7WHvdoVumXOAmKVuMFM28qV4ejlfC77jgFFzNx9P50oMtq6Jmn+rwZTlt6r92SIzP76rsrySybmHmkVnv3kMm3tOQ6CTM8TanRIJ/j2TtvgIgMQPm3OAjJ8OdetsgknLrnFbP/1NG5XZgoU0bhzOJguECp4Ut3UAVD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779980536; c=relaxed/simple;
	bh=ulQcYVPQcAiNbTMN9AaZzT6CfpirplbnyUzjJk//kt0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=E6/XxXrOOEjMGbUbWV7Hw0YGZLPupErnIUdYVxZdDzQWssDhWYfZNW2nd6s+HWGCEvoBY11S9p3WSbbBJNh1k//akjBWFuvs+EY4R8EY7uqOyjxAl8bsPksHyZ0fTsiuFd+fwoRqkRvZcFsqkrvzJJwE7Xfx9SZzZs7A9MYbbus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=g+GLC6I1; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="g+GLC6I1"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso112400625e9.2
        for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 08:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779980521; x=1780585321; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ECS7M5UdJ33XaahEVws6tW0y/69FCVes8kzgWMXuvmQ=;
        b=g+GLC6I1FXvPRvuvVXKkV+1IiP9azsMqdDjzQG0QTDWa3Hz5IgrDqgKTJC9Zucp4O6
         LTARgLsEHwlaCislv3vFE8quSS6r2nQsZUWsLKFBO6Qp5UoZvodU+bKg29WB7iadc4Xc
         /e1jsBBprsqxLRUMCAi1wAQiuhFLDIV2oY8lqRyAGfYcwUa9zCTiZEUqEdWuODVB+d/Y
         OcG6d1d3LMgrhLRWf0Yf5czqoAzePvij0xWPbnxrG4qwpDbIvAiDYfBAzRjOH0QAwd3F
         XAz6CQOz1UgfUzXZSDY0U0x6XASjd0iUKCT0gCBflXd0h0DkHqBjz0/Bw6g4zTjw+80U
         5h9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779980521; x=1780585321;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ECS7M5UdJ33XaahEVws6tW0y/69FCVes8kzgWMXuvmQ=;
        b=fQZPBGKgctp/3oglkvuht0YXGAPo3js00We29TBNtgRmi/2JUxizeo49Wozu3dPT4E
         fJuR6KNsz3sE2dYwuAUyq7GxQWSoHS3t4cm+3YS7pX4nsxTlXo+t5SfsPPCTxknEuH4C
         xjS+u0gGrl+83r6+cM+roq1O2/ARJTL6XDiqwilCmVlplOzjt85RRpgYFCI3YJaqN/ST
         Hx7CaW2zao6dpJuguzqiU1UtV30cr9gekab77G9yu1bJNQi8Nwm+yX/8vVUUIfaiwSuU
         PrCeX+Ou/H3c/2o9UWC91cd86JTs1YYD5/72lJ+HkAaTYMWXQrcN1j7BoNl6zTHgewMo
         L9Fg==
X-Forwarded-Encrypted: i=1; AFNElJ+ukrlTpFDZITNpWWPrxKXAv8HLst3Po07rSu9WMdFa3d/LpDBCugoACY44qTfWa9/I3xNXimIQAT04Fw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJds8nJrrH3xh1AM7nZvs3ClqzsrQOK7nh0Ux7cQm4kNu0kfao
	tN8x/h1kW7u+cK5goYf7nbmwJzMBHZKAXLkqMIBHOIERyk0YQDQCEZ5f0HDUpurRPH0=
X-Gm-Gg: Acq92OGO4kJV3/B49rVXwPMJYlfMh/SG2f3WANIvnqCmuaQri8p9gV3ylxZ88cio0YD
	ek4pV31N4q0mwpcSQPwoL0O5kZPfEW6HeoK4wCT6CoJ1ZHdMhdxPX5XKxOd9ROWdQKcIHKtrZ0K
	ExyCSQWAhchLSZiINfja4kmaLiH425KgRjMx41PJoEXHVOp6Ht6UlfPtjhyHaul0ujIZKrvEBF9
	7CwP6FFMfUw1uZGBULobNUD1Xx6gpWqSLkMWJUiGrtak9yv8qP6aiHaU15uWyH5N02YrTp69O79
	uAPkrubTh4kZS7YS4lpSd0L2jOkhwqCZfF25LbTMlKwRfws1MtGuInqYXWhr11t8yD9klTQdN0A
	eoGVCBvjX2iGrB8KupkRxxNCAaoUe+EIMWpiCeBP18nUnwSTyMyPo1HXwrl8I9PPxL3TtWMs4CY
	x97jesL9UqC0ocjHmcJNiAfcGpfzQZ+7IJTeOB
X-Received: by 2002:a05:600c:3e0d:b0:490:4e3e:b483 with SMTP id 5b1f17b1804b1-4904e3eb5abmr402523195e9.22.1779980521083;
        Thu, 28 May 2026 08:02:01 -0700 (PDT)
Received: from [192.168.3.100] ([151.41.223.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909236ab3bsm53549395e9.4.2026.05.28.08.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 08:02:00 -0700 (PDT)
Message-ID: <a5aa2965-3651-4927-acff-51eee2e4ab4a@baylibre.com>
Date: Thu, 28 May 2026 17:01:59 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ASoC: meson: aiu: use aiu-formatter-i2s to format I2S
 output data
From: Valerio Setti <vsetti@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Mark Brown <broonie@kernel.org>
References: <20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com>
 <20260515-reshape-aiu-as-axg-v1-4-53b457784ff3@baylibre.com>
 <758a4ef9-1a3e-475a-ae1e-83523330d006@sirena.org.uk>
 <891be10c-99f1-45b7-bd31-ec5080cfc780@baylibre.com>
Content-Language: en-US
In-Reply-To: <891be10c-99f1-45b7-bd31-ec5080cfc780@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/22/26 18:24, Valerio Setti wrote:
> 
> On 5/22/26 01:15, Mark Brown wrote:
>> On Fri, May 15, 2026 at 05:10:40PM +0200, Valerio Setti wrote:
>>> Create a new DAPM widget for "I2S formatter" and place it on the path
>>> between FIFO and output DAI interface. Remove I2S output formatting code
>>> from aiu-encoder-i2s since it's now implemented from aiu-formatter-i2s.
>>
>> This series, it looks like this specific patch, is breaking pcm-test on
>> my libretech Le Potato board, the clocking looks to be seriously messed
>> up.  I'm getting:
>>
>> [...]
>>
>> Full log:
>>
>>     https://lava.sirena.org.uk/scheduler/job/2786342#L1934
>>
>> The prior patches seem to test fine, it's this one that seems to
>> introduce the issue.
> 
> Thanks a lot for the heads up and please apologize for the problem.
> I wasn't aware of these testing tools so I based my testing on playing 
> with userspace alsa tools on the physical board that I have.
> 
> I will take a look at it ASAP and send a properly tested v2.
> 

Hi!

I investigated a bit on the issue caused by my v1 patch series and I 
think I've found the root cause. I suspect my patch series helped 
discovering a misbehavior that was already present, so I'm seeking for 
suggestions on the proper way to proceed.

# First: the background

By default on OdroidC2/LePotato boards the only available audio playback 
is through HDMI. From DAI point of view the flow is as follows:

"I2S FIFO" -> "I2S Encoder Playback" -> "CODEC CTRL HDMI I2S IN" -> 
"HDMI CTRL SRC" (mixer) -> "CODEC CTRL HDMI OUT Capture"

In this chain the mixer "HDMI CTRL SRC" by default starts as "DISABLED" 
so it should prevent "CODEC CTRL HDMI OUT Capture" from receiving data.

# What changed before/after the last commit of my patch series?

- Before: "aiu-encoder-i2s.c" was calling "aiu_encoder_i2s_setup_desc()" 
in "hw_params()". Audio playback shouldn't work in this condition 
because as I mentioned "HDMI CTRL SRC"="DISABLED" by default, but 
apparently configuring the AIU_I2S_SOURCE_DESC register is enough to 
make the playback to work properly.

- After: those configurations are only set when 
"aiu_formatter_i2s_prepare" is called which happens if "I2S Formatter" 
widget is enabled. Since "HDMI CTRL SRC"="DISABLED" then "I2S Formatter" 
is not powered up and therefore its callbacks are not called and the 
playback fails.

Simply issuing the following command:
$ amixer sset 'AIU HDMI CTRL SRC' 'I2S'

resolves the problem and all pcm-tests pass.
This also explains why I didn't catch this issue before sending the v1 
series: I tested with NXP SGTL5000 codec, not the HDMI one.

# Final question

I have 2 alternative proposals for this:

- Change the default value of "HDMI CTRL SRC" so that at boot it's set 
to some working configuration (ex: "I2S"). This should be done somewhere 
in "aiu-codec-ctrl" I think.
- Run the 'amixer' command above before running ALSA tests.

Any suggestion on what's the best approach?

Thanks a lot.

-- 
Valerio

