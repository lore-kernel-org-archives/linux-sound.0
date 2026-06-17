Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDCC402434
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 13:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781701336; cv=none; b=f0j+A9D5sI5krPeBeT3N+r96Ab2fL0EhbQ9XM2QBve1OVwJ/ceR6Q4YI8YUtf+tOpfa+PmOXVStx223q80/FlLFtePZvRTwhcx509cwQAcqgWPs7cnevIPY+K+yjK6KObok4aQTeUN993uFM3NOFFR3PAbwSCJDFr+f+m0iZc8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781701336; c=relaxed/simple;
	bh=ER7cBoORTtCo7YHQmTGpBnqKr/GhDtCtpgQSSh5vv20=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lBRB5cPURJXun9ke6OcovBP1/yEHrRRWB55l5hWHQ9QqC9cQNfjs33uq91alV1kGgAVJH0cAZ11cK6Z6G7xBDxBIwPpH5+rFXIYjeJusln0CtsP2QvX7gM83RvTlyuBUDxzdEbgCxdDZVEY+yd0VkJsZVHJfSdJkg6lsgW74MhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1iKvp6n; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1iKvp6n"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490ac357c55so54184585e9.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 06:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781701333; x=1782306133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KoyHU0/MnlEjPkHmAG8qUfE8grsoj3Z59or+Bu6rF3E=;
        b=L1iKvp6n911t1/z4RYAVzXONkBcZHcMSNrWXpD0u2bS8HOIQ34kFk7X6awUB7pVQ4N
         218Ufk2su+5ij6kCRPLZjz78DZLtdmj3inQiOglyjBdUQU0JHf0/mYn+kA24ZCYXBHr5
         YtrftHA6ZH02alaH3DcjucF/kG+P1w2EeFx6SjPdzy9Wirc2NrZm72ONjLZbj5zlk0eA
         KotaMTkmVn8gCxyhqoGzKbgjItmnAGfVe0zww95D854sqmHW81mMRZoPZ/GRvRNrsQZq
         oyA6CMMkDvVh9yc6+lFS1nyOVqchpQkZN3G6Z/5V1Fye/gghO4QsTxvL8XpUyYXjqBEq
         1zSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781701333; x=1782306133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KoyHU0/MnlEjPkHmAG8qUfE8grsoj3Z59or+Bu6rF3E=;
        b=FupkeX4I4MxGvIxLYrzSS3UuWsx6P/OksrxSDGdL0IYU+7zRKtA8qdO+kyRwMcFaW/
         bhpclnUJUI6EBvZbS0J3MyVS4fVRrQHu7/RMiiR6vLkRKX+i/sco8MAc4dFF4p1j49kh
         PFxL+fSNBRmfJhK8vStXC5lUSNatR/whAQeJgyO5j27Z2j8611tl6y+Ay5DZgL+GpcwI
         jnIp2A+061DF3phQHdSDmcRWOEjFK1vBhGpwkDM1E61uUyxlcwmcvUCDGDYWiX8VsSc7
         4bPnFijWX778MY5S6GTF9NnFvZVSsrFjt+aJmYaZKDb8+lWmdRuIlsCuZjxvVUNCmdrK
         2Plw==
X-Forwarded-Encrypted: i=1; AFNElJ+O0+06XMEzBD5oTg8iyCkdpBL/B1eCxSZWFeVcQwlOBRCPLYlphR8JbyDMOQm6Fd1OPn+PWq72DFtz8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfYBi5UFip1R8jBX7y1fLlBMepkGsYw1W+Jo2qMQE3NA3+OwRm
	h45nwxcEyQhcYMYoWw43S8aOQ05nr3C2mMfbd8zl14o4bvJZkfIl3LCE
X-Gm-Gg: Acq92OHiKMA7Nc1CDvAxVGhGVywW4iswYGkDL+L9RRKiRU4pEhrXUD/d1cLOBcSSrTW
	A9ZpDQXD/uvdaZKFivEYreicofLh8krq8aD+ZSGh0VPvjx4Ql9+8ohCLCTfakodfP91nCZzzCZV
	YDM2kO7DqZiHY4yowx+vU/dQOtqPaXVbNZxmy4ktbzHNmi0NnwuofWR0JC8KSdDyFj/hgMiGSnN
	ku1ATs+fZx5b4/6MUEVmCkSCzEx3qr/twToPpDg41wN9la7Gwcd9chsje+mHHisSzX9sZK9MzYI
	hNehrHtsSy9JWYVtxyvK7FaWejKyu1NmWYZ0HWfUveLGhZW7AyR4RjUFdO05KUPBNzKfpSkuitH
	H3Lp4vQ5X0S+XXa7IUfqS5jx46anz9aOQArq/3/rjA29vGmc3U+DX7APcRCFSBx2ImXcm4Tp392
	igD6cHpxhTyvJaFjmgxedBgRpjYqv9WzwspuiJDivqJGeqxN8XOA==
X-Received: by 2002:a05:600c:8189:b0:492:32a0:7f92 with SMTP id 5b1f17b1804b1-492333aabe8mr70111375e9.12.1781701332662;
        Wed, 17 Jun 2026 06:02:12 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4ff67sm157906775e9.6.2026.06.17.06.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 06:02:11 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:02:09 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih
 <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, Benson Leung
 <bleung@chromium.org>, David Rhodes <david.rhodes@cirrus.com>, Richard
 Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org, Support
 Opensource <support.opensource@diasemi.com>, Nick Li
 <nick.li@foursemi.com>, Herve Codina <herve.codina@bootlin.com>, Srinivas
 Kandagatla <srini@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
 <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Oder Chiou
 <oder_chiou@realtek.com>, Lars-Peter Clausen <lars@metafoo.de>,
 nuno.sa@analog.com, Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
 patches@opensource.cirrus.com, chrome-platform@lists.linux.dev,
 asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex
 locks
Message-ID: <20260617140209.3f89706c@pumpkin>
In-Reply-To: <ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
	<20260617103235.449609-16-phucduc.bui@gmail.com>
	<ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 17 Jun 2026 11:57:49 +0100
Charles Keepax <ckeepax@opensource.cirrus.com> wrote:

> On Wed, Jun 17, 2026 at 05:31:32PM +0700, phucduc.bui@gmail.com wrote:
> > From: bui duc phuc <phucduc.bui@gmail.com>
> > 
> > Clean up the code using guard() for mutex locks.
> > Merely code refactoring, and no behavior change.
> > 
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
> > @@ -913,17 +908,13 @@ int cs42l43_jack_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
> >  	if (override >= e->items)
> >  		return -EINVAL;
> >  
> > -	mutex_lock(&priv->jack_lock);
> > +	guard(mutex)(&priv->jack_lock);  
> 
> I believe you have to use scoped_guard here, as there is a return
> from the function above, if memory serves it attempts to release
> the mutex on that path despite it being above the guard.

Indeed.
I believe clang will complain.
That makes these mechanical conversions of existing code dangerous churn.

While using guard() (etc) can make it easier to ensure the lock is released
when functions have multiple error exits, I'm not convinced it makes the
code any easier to read (other people may disagree).

	David

> 
> Be worth having a quick scan through the rest of the series for
> this as well.
> 
> Thanks,
> Charles
> 

