Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059053A75BA
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 20:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774990446; cv=none; b=Himfl1Guv0cptP7yZEyhMaupTZ/DO8bc6EDDhSDi9LCvS/sdk++etdy4Z5WisfeoyuwJVYJGZUCM/wqjexL8se4ZyVYJ8P8OZlIWOWRSRuTnMDkZbeIwN2m8FeVymC/uAs2Waup7Q9/6LRTxAIDCB+igba/B1LLzjRHiigWg9Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774990446; c=relaxed/simple;
	bh=xzZNSyXLHafrytf3VN4xGFqU7adjtRPPfSXD0Gs3mLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hIulE4FRxEoB+ZfkgQgCyaHPw/aNcxmVreNsDHwmrT2KRXnxwRdi+vrbJCptJUYKpc8vdi5Y2DqNlCqwjZMj3Suy5QVKGZ6QGpEKeuJ4x60rTl5/00Jl+12QzFAQUnrvdOCK7WzYxXHpzbDap43mL1E/yB5EsWeaUmyELMJ0zkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=biARpTj9; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="biARpTj9"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c1632faeb9so11096199eec.0
        for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 13:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774990444; x=1775595244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZspNX5rs+mbfHqezyzp4ll5OJtm1yyo5L/3asPtSr14=;
        b=biARpTj9/QQwG/GWm2OaLc850ThcmromQWq0S6hENjGaLFnobmwzqhbIFFXNEonXtb
         oMZwypR6wkjVmzlTNTB58fS8ojw4OP6LfEvhyynI5zWCKLbE1qB5Ky402qp0Dxww/CmC
         r6pEDLb2JXGMEbQmLht7W6v/mFSQns1ymG8eAP7RXt6BQqYD2GlKU0xBmBJs29S2DKba
         719pCPPqmrDJLNPT96IGGo4yeZK6R4Dx7FpShMXuG9fXB/KP5U03cwq0XHZS0auqNZHy
         y/3maR/eD7DK0jm4ETq2uoj+PVX9HtTrUHOKmOd1GRcHki/Fkn6CILpTg4HbEYNoztli
         bm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774990444; x=1775595244;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZspNX5rs+mbfHqezyzp4ll5OJtm1yyo5L/3asPtSr14=;
        b=CIRDULInC7fs6QZmwJaexg0+LjFAteD/6s5QJFuJ0G4+9arn1XLnrPrGWzEPZAjHHB
         pQFYQXX52j/R/96ksbCaPEfJ6EsLWBPXq5PPgiulkuWGy1Z4Y3YDvc73rrImvgCqw3Xa
         JlymoNH+Ege+6JnYr6ukCn3w25g7LiuTpBG9WbYqt3p/f0rk59pFdYQK50hmRHEimvFU
         MkkIFIvZmtafItp0xic/Wj4/LwKoabJn9sxHVZOO6Yg486nRKh79ALlRz+bbZ+s9qrzC
         UIToJqZKi5qeJq0ttKQs4zbs1epoUciHwMtJFm4JKvGjVUmys508D7Mt9EaHkk+UPd7+
         E/JA==
X-Forwarded-Encrypted: i=1; AJvYcCWxZaNPUMT+LYGqDJjyT2RoMFJWdgwWWifpSCc9awwNKG2DMWMzP20fl8Ey2CyBzdEp+Ro0maCLXUj/CQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNHs7O75ltpDGqG3Q/jtby+2zpMb0KCCNT6BKAuDKEIzXwH9MJ
	AjFsfM3zJ2svNMHQJ2tchOWsPSnTYJp9ppqN9VH4M4340yiLz88spTl/
X-Gm-Gg: ATEYQzwtW8Q52iKhtYpgPLLsV1J0AyVPHUtRSOhZnv0cpQ5ynFOk+J1dXBKNx3MsOAt
	SgT/UPpydSSk1Cr3FH4VmOyryq0EZS8kWXObi7RZDI7Rwgvl4IP80WiTrLWAePm9hQuwpNOlxMm
	icTlmC+QAoyEmFwMxJSlNxaSkaCJGr2EUlc2SIqz0r9Z4Hr0k7LjabLB+7MQIC5JGRUZe8yelPZ
	xuJ3PcZksy/TCbo6d0qLMzHPOOkXWUYfmoPglzuMiU8pi60K41my1RFuTpLLqToPtwDGSxggva8
	l8Yud6wHsdcNTojpvQnxgjdxh6cuT7XcrTSyXh0HBEP+rBRFaUReCuAMc8T3+K6tf44YywaVIn1
	GPUh5zVoE60WY5eUvT6kdoyHl6Dody3ngMTuw6gTVsInTZVpWdX58vvVMChS2hNtKGfXzjLFiSn
	2IG9OAHRa5BQG+cLlTMdJX3PFiKTjTWRUfC+IebWegZH8VIEOioegPlIETkYeUH/azZiGEnU/Xp
	vs=
X-Received: by 2002:a05:7300:fb8e:b0:2c7:11f2:d072 with SMTP id 5a478bee46e88-2c9323b8c8cmr558693eec.16.1774990443987;
        Tue, 31 Mar 2026 13:54:03 -0700 (PDT)
Received: from [192.168.1.8] (177-4-161-218.user3p.v-tal.net.br. [177.4.161.218])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c41c1513sm11457738eec.8.2026.03.31.13.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 13:54:03 -0700 (PDT)
Message-ID: <c1aac723-8a60-4b37-9c8b-74b2ea4daebb@gmail.com>
Date: Tue, 31 Mar 2026 17:53:59 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: aoa: i2sbus: clear stale prepared state
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260330-aoa-i2sbus-clear-stale-active-v1-1-47a6c0a3ac9e@gmail.com>
 <202604010125.AvkWBYKI-lkp@intel.com>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <202604010125.AvkWBYKI-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/31/26 14:10, kernel test robot wrote:
> Hi Cássio,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 46a6512f4a74dd7b18d9a455669c226843fc49ce]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/C-ssio-Gabriel/ALSA-aoa-i2sbus-clear-stale-prepared-state/20260331-113724
> base:   46a6512f4a74dd7b18d9a455669c226843fc49ce
> patch link:    https://lore.kernel.org/r/20260330-aoa-i2sbus-clear-stale-active-v1-1-47a6c0a3ac9e%40gmail.com
> patch subject: [PATCH] ALSA: aoa: i2sbus: clear stale prepared state
> config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260401/202604010125.AvkWBYKI-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010125.AvkWBYKI-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604010125.AvkWBYKI-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> sound/aoa/soundbus/i2sbus/pcm.c:760:25: error: initialization of 'int (*)(struct snd_pcm_substream *, struct snd_pcm_hw_params *)' from incompatible pointer type 'int (*)(struct snd_pcm_substream *)' [-Wincompatible-pointer-types]
>      760 |         .hw_params =    i2sbus_playback_hw_params,
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
>    sound/aoa/soundbus/i2sbus/pcm.c:760:25: note: (near initialization for 'i2sbus_playback_ops.hw_params')
>    sound/aoa/soundbus/i2sbus/pcm.c:313:12: note: 'i2sbus_playback_hw_params' declared here
>      313 | static int i2sbus_playback_hw_params(struct snd_pcm_substream *substream)
>          |            ^~~~~~~~~~~~~~~~~~~~~~~~~
>    sound/aoa/soundbus/i2sbus/pcm.c:829:25: error: initialization of 'int (*)(struct snd_pcm_substream *, struct snd_pcm_hw_params *)' from incompatible pointer type 'int (*)(struct snd_pcm_substream *)' [-Wincompatible-pointer-types]
>      829 |         .hw_params =    i2sbus_record_hw_params,
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~
>    sound/aoa/soundbus/i2sbus/pcm.c:829:25: note: (near initialization for 'i2sbus_record_ops.hw_params')
>    sound/aoa/soundbus/i2sbus/pcm.c:323:12: note: 'i2sbus_record_hw_params' declared here
>      323 | static int i2sbus_record_hw_params(struct snd_pcm_substream *substream)
>          |            ^~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +760 sound/aoa/soundbus/i2sbus/pcm.c
> 
>    756	
>    757	static const struct snd_pcm_ops i2sbus_playback_ops = {
>    758		.open =		i2sbus_playback_open,
>    759		.close =	i2sbus_playback_close,
>  > 760		.hw_params =	i2sbus_playback_hw_params,
>    761		.hw_free =	i2sbus_playback_hw_free,
>    762		.prepare =	i2sbus_playback_prepare,
>    763		.trigger =	i2sbus_playback_trigger,
>    764		.pointer =	i2sbus_playback_pointer,
>    765	};
>    766	
> 
Oops my bad!

I had added i2sbus_playback_hw_params(), i2sbus_record_hw_params(),
and the helper they use without the struct snd_pcm_hw_params *params argument
expected by struct snd_pcm_ops.hw_params, which caused the compilation error.

After fixing the callback signatures to match the ALSA API, the file
builds cleanly.

I will send a v2 patch with the proposed fixes.

-- 
Thanks,
Cássio

