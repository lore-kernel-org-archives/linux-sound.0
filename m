Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B56537CD5A
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 05:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786080123; cv=none; b=htT0OAoxYdlbTRK2KH+6eFWe4znOVmaQybbSjnjpHBItBvrjTVuWXPsRZ8NwyK6YaI20aqt/m67d4scFG+jgjpANryqvZLAtUwDSg1cyGuIYktvCh43EGXNiDo2C63363BaXbMZJoQb+lOiHgBlZ/ADPzc86S0weWbrR1hq5q7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786080123; c=relaxed/simple;
	bh=irQF0YwW3acfxwL/zqk6X4Fj+mrLSL4EVdDK7ZkRCZA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CXCrWHoo0MggNhKf6+eeW0ZhZtjJ/8DZnP/jeUxBhDgosElIOnqDm+wd8z81ruh8JRgfL4w7EDAu2aQJHOGgLC2tXZK4dVyZ+vcet0gy1Wsf7sZwXF2I/j2uEq4jNjK/7vRpfjJHkIKk/jYQYy/5M/iFCl2DFKxhk26/ddkyV9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oFUvpUwi; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oFUvpUwi"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39ee96f8047so21070861fa.1
        for <linux-sound@vger.kernel.org>; Thu, 06 Aug 2026 22:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786080117; x=1786684917; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nNPTYC8lmnCo9oFCpMpkN8ZF60+LkO+W/UoLhXhHKG4=;
        b=oFUvpUwiixXKtc2bEFKe3ZMr3u78wvXXc2YJbwS2AV3MSmzakouMZ6njfK6dWxvheK
         Oc8f/KLieyfw7WFX2D6uR6iotSIj6ss8VdaBdhp+BHi69qxwXZPIotAqJYXb/4ewLFT4
         SchzGI8JqY6Ezrih6Kdc6fXpHFocrYY8kkEpRuqUgrneZjDdrFVPsRJ8xG7PXczzu5oL
         Z9bMNp7e7qeOvQrPDt7p1exO9PaSKaLxGQi9/bFAzDvQaDrMFhRVkjs1qohuEGFIHu5o
         61o/E5FCxNr7jeWNgaumFshLw0fnoHHz/AVn7ljq1QHMI5SBbXFnkDbEJAu26vsWTCzU
         97XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786080117; x=1786684917;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nNPTYC8lmnCo9oFCpMpkN8ZF60+LkO+W/UoLhXhHKG4=;
        b=Q42NpobK6RaBVicWuD7/8JlE0hJyGSz8YwW+xwfSuB7yHN0pwrowikXg3esluTz7sG
         O74feMjXidoxR7XhxlYopLxr+ynWpbiwB2wqi5yJDhYFBZn9o0SN4xEEYbnwROA1rVJq
         dc44dNtzvZaWafoJHziLmyS9w6snyavPNLMrOt52YtH12vl84ETSJrTAtf8P6xE+6t4R
         RP7+ckzvBkgryRJt8ZTU2/g+YA1O+3yAYK0KQCVGKGL8hQjqLGPepBIPzwZjjM7LSFnL
         oUW8Z3N8XDxpPydI7GYuWproaFsKZci90NbJBzEFKI4KqMJ164+De6/2hgQ2FAVdvmTF
         u98Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro8RRqWfo97Eb1XN/d6iBL2vidRxD6BxdQaz9wYUjo01P09ax4bLIttNbvyzeqPmXyeQNQ5SKjyT9PD0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrf+gTBurb0GUffglly94YbxrVjLo0bO4d+8IIlZhhLgx0+O5S
	Ma++a+nTom9ALMTAgebPlYXeAsgiv8YzaJz7ZTaZTCnpES50ARty4yHY
X-Gm-Gg: AR+sD10H0Bvc76tMGDBKX0mhr//BXubOPjfWF+/mwJHAiupIBQi1gnSuq9x+nQrkoDf
	mWIMVZSR52M/FPKXXXHAcL5gO4fkaB7cTogohadIIAWBbqwAQOB8kwS0YoQTxAPXKMzTJXAd9lj
	IBN9WXZ0AEUGO9yv2dZeczwDoBfaWsCkkTVJSnR5mrmzF9n0L+CSX1OZNucuqjMyDZlRD15Orau
	et7lpdT3kdRdg8oeyPQ7DS9dkIlOy6/nv1M0muwNIAfW9rYGco3wa87C0EH6ybO74To+Qn7mPfK
	1Q4CQTcZ7X1mAr35Pg0yvCvWfqTb52go9LO0qe21DrVg3ph35L34hb/wzVT7zIZpfh62z2YV2A4
	/KVeAYw7b6WGBtK7i7rw+vJIDcAILgjpbmReEldMa/LJnd65qFELUu/7nk8civzbFLtBMovq9y2
	wvgKoTk5XuC9BFU5vXU2r6BAPgiIKdQHJhHe8vuNhJkfcNPXexeyBGfPywhvItoO1HXEuuFp+/a
	XLC2sJcdBt16pwIdLNmhDI=
X-Received: by 2002:a05:651c:19a8:b0:39a:e7f6:49ae with SMTP id 38308e7fff4ca-39fbad4a49fmr25090321fa.0.1786080116753;
        Thu, 06 Aug 2026 22:21:56 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fdda97903sm1327021fa.11.2026.08.06.22.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 22:21:56 -0700 (PDT)
Date: Fri, 07 Aug 2026 08:21:55 +0300
Message-ID: <cf25e8d6e9625f774c793e66f8a59b8d@gmail.com>
From: Andrey Golovko <andrey.golovko@gmail.com>
To: Antoine Monnet <antoine@montane.tech>, linux-sound@vger.kernel.org
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Robin Everaars <robineveraars@pm.me>,
 linux-kernel@vger.kernel.org
Subject: Re: ASoC: tas2783-sdw: no stereo channel split for two mono amps ->
 mono output (AMD ACP SoundWire, ASUS ProArt PX13)
In-Reply-To: <778f017a-e1c2-4ab6-9968-6e4c6285180b@montane.tech>
References: <29e8c08b-9475-4aba-bce0-6d4a45a26d3b@gmail.com>
 <20b6c100ec50c0b9eb1dd31a338dbc9e@gmail.com>
 <778f017a-e1c2-4ab6-9968-6e4c6285180b@montane.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On 7/27/26 13:21, Antoine Monnet wrote:
> I logged name_prefix against the resulting ch_mask and got tas2783-1 = 0x8
> = left, tas2783-2 = 0xb = right; the split is correct by ear and by per-amp
> mixer mute. Since your unit is the same HN7306EAC the prefix ordering is
> identical, so this should give correct L/R for you too - a Tested-by from
> the second machine would be welcome if you get a chance, but nothing needs
> re-deriving.

Tested-by: Andrey Golovko <andrey@golovko.me>

Confirmed on the second machine: ASUS ProArt PX13 HN7306EAC, v7.2-rc4 based
kernel, same two TAS2783 at unique_id 0x8 / 0xB plus RT721 on SoundWire
link 1.

With your patch applied both amps render, and the assignment is correct by
physical placement, not merely by control name:

  speaker-test -Dpipewire -c2 -s1  ->  physically left speaker only
  speaker-test -Dpipewire -c2 -s2  ->  physically right speaker only

Both amps at full scale, all four Left/Right Spk[2] switches on. Before the
patch, -s1 was audible and -s2 was silent, with only one amp contributing at
all - so this is exactly the behaviour you predicted for an identical
HN7306EAC: the prefix ordering matches, tas2783-1 takes the left channel and
tas2783-2 the right, and that lines up with the physical speakers.

One caveat, measured since by Robin Everaars, who reported the same
issue on yet another HN7306EAC (added to Cc):

  https://lore.kernel.org/all/20260805183517.8665-1-robineveraars@pm.me/

The ch_mask *value* is not what selects the channel:
sdw_compute_slave_ports() assigns payload offsets positionally along
slave_rt_list, and Robin showed that inverting the two masks between the
amps does not move the audio. A one-channel mask fixes mono because it
stops the mirror-mode offset reset; L/R then follows the codec order in
the DAI link, which on this platform happens to match the speakers. The
Tested-by stands - the split the patch produces is correct on both
machines - but the name_prefix -> BIT(n) mapping reads as if the bit
picks the channel, which is worth a comment or a reword before a formal
submission. Where the binding should really come from is being discussed
in Robin's thread.

Thanks,
Andrey
