Received: from r3-129.sinamail.sina.com.cn (r3-129.sinamail.sina.com.cn [202.108.3.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905A53DD526
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 02:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093148; cv=none; b=dPgdAx6uny4M96UhTRchkzWo3TIzY4dhcoa1hx25OaCJ5epmzq3TxiP0LBhkoPWtAUZ1/XITDyuf5iPOIU/bakZyGBoC4wu/eaE76/jercoZT13zrw7fs7mWFjIB7n6iOonekYZbUgFYQG8p18qyZyX+ALQmjtkgr+n05+Jb8lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093148; c=relaxed/simple;
	bh=VPbks/Ni6vfO7D5qwa/ezA9C3Tg4naQA7HkMCQOG2GU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=otNwfnKpDBHAaiNkyK8GGN2g6CghJLbeoTYoRAya5vZQCD8XiYNkRTe8R7MAMZ1gz1LWSvZ1fBu1eQ6Ei1WMLJGwu5jA3LPYyjpU4Bujas3N6pO34THef3FLug394QUvWxaPtXXqzOoiYGxLKABTsQST/WGhzKq9qB0/QZQyZKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.36) with ESMTP
	id 6AA3647800000AE8; Fri, 11 Sep 2026 10:16:25 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 3A36E1B529F04823A82F4990DD3FFECF
X-SMAIL-UIID: 3A36E1B529F04823A82F4990DD3FFECF-20260911-101625
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: RE: [PATCH 1/2] ASoC: codecs: ES8326: Add private members about HPF
Date: Fri, 11 Sep 2026 10:16:23 +0800
Message-Id: <20260911021623.29862-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <12182d7f-b6f6-44d3-9b4f-e73ed0253ef5@sirena.org.uk>
References: <12182d7f-b6f6-44d3-9b4f-e73ed0253ef5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

> > +	if (es8326->capture_rate) {
> > +		freq = (ucontrol->value.integer.value[0] * 48000) / es8326->capture_rate;
> 
> > +		if (es8326->hpf_freq != ucontrol->value.integer.value[0])
> > +			dev_dbg(component->dev, "At the %u Hz sampling rate, %ld Hz could not be obtained."
> > +				"the frequency has been set to the closest value, %u Hz\n",
> > +				es8326->capture_rate, ucontrol->value.integer.value[0], es8326->hpf_freq);
> 
> It's fine to just do this silently.

Yes, but I'd still like to keep the information displayed here.

> > +	} else {
> > +		es8326->hpf_freq = ucontrol->value.integer.value[0];
> > +		dev_dbg(component->dev, "PCM_STREAM_CAPTURE is not active.retain the input frequency\n");
> > +	}
> 
> This won't do any validation at all, but find_best_hpf_freq() refuses to
> run in the frequency is over 1020Hz.  We should be consistent and reject
> high values in this case too.

OK

> > +	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
> > +		es8326->capture_rate = params_rate(params);
> > +		freq = (es8326->hpf_freq * 48000) / params_rate(params);
> > +		hpf = find_best_hpf_freq(freq, &es8326->hpfl, &es8326->hpfr, &es8326->hpf_freq);
> > +		if (!hpf) {
> > +			dev_err(component->dev, "The HPF frequency is invalid\n");
> > +			return -EINVAL;
> > +		}
> > +	}
> 
> This will update hpf_freq, does that ensure stable values (especially if
> the capture frequency changes with different streams)?  We probably want
> to just store the user value without modifying it.

We want to be able to change the values of the HPF-related registers when the capture frequency changes,
because the specific values depend on the capture frequency.
As for changing `hpf_freq`, since the codec cannot support all user-specified frequencies,
I will replace the user-specified frequency with the closest available frequency.
