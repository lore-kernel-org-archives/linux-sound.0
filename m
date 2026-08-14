Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E603FBB4E
	for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 07:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786691792; cv=none; b=dGh0kOKqrHG0J8GC1OhFg2b2Iah6jyihKo5WTTuRJ5fzhYr+KZm7pafUAn8hpeLkcQBzOjBIopRMo5U38ENYINq5p6w8tZJnoTMHQWG8onQsRY1w9lc92XTphphW0quceWV0n+b3YrnooJlPBtMRGc3TNnY7SqDk2tw43WmU1H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786691792; c=relaxed/simple;
	bh=zar0ocNDpzcvZswjGBpDM/SllOQPVDJKH/Jt/EEOME4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fegHLEaFLmIaB+/0QokAt+WDWGhPerZ6MnUyVjLcVbANvfk3yaTGRwHmlSKlaTxGr7OArwIChWPhBTZdEREeliJ9V3TJgJ4VKNh8PS6ZKV6A90TOUHA8/CNfsBW1Q2qna2CVjp0F0QlU4ArTlWCpfRbzDVUn6Ich00G8XMPA35g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZvkVnzbG; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZvkVnzbG"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aea0fff535so670864e87.3
        for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 00:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786691787; x=1787296587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LzIj66XKEQ6RIkUHTy3rFsHtC76rnm8Vm0nnybk33G4=;
        b=ZvkVnzbGlwD/bbvxuHyRVl0lkiK8gce/82cHu7RHr0hsk0Elrf2ENOGf1JZilNt2FK
         CZc5mXQbWssxIlQp2k2dXQwlJY9snCYTN558EOT9dmj1uBJjWxG2mh4/DeF2NX79IEM5
         l8XWH4GU+Rmw6i9ejOHjtXlHwgYZ00YirMdX6P5lm1H52AXWJDPVLxIX/NB4zKQJm2sr
         qebGo2GxLRxZLEdEozdUO8NlTGlhxQfC0rGq1op0Y24gGCnc7QRUHqCbys/hDRqhQdYI
         tBiONe+6mibJaaWR/ob/vvhhd3AsF06Eb2sEupJgOU9pp/GlGXl2yQTfnCUbLkGzjFal
         0pJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786691787; x=1787296587;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LzIj66XKEQ6RIkUHTy3rFsHtC76rnm8Vm0nnybk33G4=;
        b=gyh2z+OtFKwGJnvhlxrQNmnA3VKSx1n7dGiHBx3d3sWKNiRbWyyAquy00OY3KnL8o7
         kH12oMUJZOpDeJhrQ1qPorcBFIMt67fP08PxF/OK1g+Td561xWWWtR3KjGBRQHXHDbIH
         gYPpy1bCOHvDAyj6b9hRw75iPIoNeFZyvwJywvQ6LWn2f5ntf2/ftOEDU56cSG15dTYF
         dOGYmiwBX+xJVM4XqTpKQrJ98tTULeLA8WZJHQaC5P+EKROLcJaavZpzCvDkqhCcfXWd
         SVf6/Zkq9CST7ZkrvLfvSfhFEpC3XzcNPkSpfmW6VxwaGN0RsGRQr5ec0o17b7MM0l7O
         QrEg==
X-Forwarded-Encrypted: i=1; AHgh+Rppvfc6XVgDcJ5ku2sfa4lB7ED1joBe6wu2L63R3ENv0XqnkCJ9znI9moOh+5cqce+SdhQkJKFlPGzABw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyby0BWa4ULb0b50u+nvesafHh3NUFpuQqNn6olAcopX7GsSCas
	dxAtLQbpgvkJsLTr6bgo/IS57YwsTINp5EHeYOtZ5ZFtOyJvJKxIWzWS
X-Gm-Gg: AR+sD13Lm2ObMFDisW2vb7KQmuE8sGElZMAJWg/Nm4cemLHv6/wYu4Urg1akm5N5WtJ
	PfF4t+Z6JY4/Km++zAvH5iR8nAtLwHPd639zAVyNcOfs6Ij7LhOo4h1DM7WogXD5HBfxhNZ3lzv
	lYBPlee2/fxGSpblnwaH+Xaf6z3FHfqoghS4VhkhgPqAL6OdkkdNv3hlrjTAkV5RucTiKYhZ7me
	bEsgpsNV9P3HekwlBOKEHSJi810Ycq4kJ2XhfFh8wlmau2ClSjBrw5KMfdvHn0iqeLj0/8D6W03
	Vwj88dBcuBl/lzFg+Wkr+hBFA1r7NgLXVw2Rl9ExIkgaKne49bHY8ZbFhAFBhIUYBCzclBprIa4
	wuiTXBSyWDXl9VgLT4VMFz9/yq2mazDlIaqUcvv9E5kqSQ6Q7xtD3i7Bd65j/15R3AH87cwYII8
	5dbGlIHaBwtrI730fRzgyThsyW/fC1fsuK68XuS3/JrH8zB2zBmU/g+271o6E8WLIoksvQFvLEW
	7JEHmfNC7fF9C1O/j269Jc=
X-Received: by 2002:a05:6512:8388:b0:5ae:befc:97a7 with SMTP id 2adb3069b0e04-5b45915d054mr345710e87.13.1786691787350;
        Fri, 14 Aug 2026 00:16:27 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458ba5345sm372531e87.32.2026.08.14.00.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:16:26 -0700 (PDT)
From: Andrey Golovko <andrey.golovko@gmail.com>
To: Robin Everaars <robineveraars@pm.me>, Mark Brown <broonie@kernel.org>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Antoine Monnet <antoine@montane.tech>,
 Ville Saarinen <wiza@saarinenkoti.fi>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: tas2783-sdw: power the Function up before
 preparing the port
Date: Fri, 14 Aug 2026 09:50:00 +0300
Message-ID: <20260814095000.22512-1-andrey.golovko@gmail.com>
In-Reply-To: <20260813211858.17509-1-robineveraars@pm.me>
References: <20260813211858.17509-1-robineveraars@pm.me>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Aug 13, 2026 at 09:18:58PM +0000, Robin Everaars wrote:

> thanks. One clarification about my negative v1 result: it was not an
> active-playback resume test. The controlled pre-suspend tone had completed
> before system suspend.

Thank you for going back and checking, that is a useful correction.  I
had been reading your result as evidence about the resume ioctl, and it
is not.

Your second case is the one I would expect to have worked on v1: a fresh
pw-play after the sink was suspended opens the PCM again, so it goes
through hw_params() and prepare(), and that is the path v1 already
covered.  It failing on v7.1.7 fits your own attribution to the missing
b627da430357 - without it the DAPM writes that follow are dropped
against a stale cache, so the Function never comes up no matter how well
the port is prepared.  So yes, for-next rather than another v7.1.7 cycle.

For the third case I would expect it to still fail, and that is the
point of running it: the PCM core does not trigger a stream that was
left PREPARED, so nothing in the codec or machine driver gets a chance
to act.  sdw_prepare_stream() on a stream still marked PREPARED is a
no-op too, so even a call from there would not help.  It needs the
stream state invalidated when the peripheral goes UNATTACHED and comes
back.  If your readout shows PrepareCtrl=0x0 while the stream is
running, that is the same gap and not a second bug.

The module is on its way off-list.  It reads and prints DP1
PrepareCtrl, PrepareStatus, the ChannelEn of the current bank and the
PDE23 requested and actual power states, straight over the bus with
sdw_read_no_pm(), so the codec regmap cache is out of the picture.  It
only reads unless you ask it to write.

For a shape to compare against, here is what the resume-ioctl case gave
on this machine, unpatched kernel to the left, v2 to the right:

  DP1 PrepareCtrl before/after   0x1,0x2 -> 0x0,0x0   0x1,0x2 -> 0x1,0x2
  PDE23 req/act after            0x3/0x3              0x0/0x0
  440/660 Hz tone after          -1.7/+1.8 dB         +73.7/+88.5 dB

The tone figures are levels in narrow bands around 440 and 660 Hz in a
three-second capture from the built-in microphone, on a scale where a
capture of silence reads about 0 dB in the same bands.  The absolute
numbers say nothing outside this machine; noise floor against signal
does.

v2 of the series is at

  https://lore.kernel.org/linux-sound/20260813194000.10412-1-andrey.golovko@gmail.com/

Andrey
