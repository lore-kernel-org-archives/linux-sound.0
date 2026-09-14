Received: from r3-55.sinamail.sina.com.cn (r3-55.sinamail.sina.com.cn [202.108.3.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B93374A19
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 05:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789364708; cv=none; b=oAgEKsAY+O36Pvv9gIPchgFF+gv2dLigpqqFNSKqMbyylycpcwYGdeE+LZOm1PnShow8A+oAfLvBlg9jmwehncblBfFPYU1ojjIARIh0iI1+Yc8+JatIozmHWF87gSgLoobOMIzrZ1yhzzDQIpWnfknZeV70uMmdL3QFH8MXQHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789364708; c=relaxed/simple;
	bh=DeHrRNZ/G2RuwfVYMei68vhxA5LYsvTNp9wK4CIXPUo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=GBz9Dq2TnU/EKHMPii028LYSM74FCxFSxk0MaKg0BkL9mukYSPtsIrvmto+2DtnM9oI2QWqiBqgBXhhPWNCoVJ8t3knqswCWTIAb9TDD0eUztPt7aLYdQXYwZMJWMwPeOhuSpYSODiCpZh9w74nt+7tGZX1T3+7/epK9lGfnd4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6AA7889800006DC8; Mon, 14 Sep 2026 13:39:36 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 13D6BF5EF5174DE8B3402D569CC84CB4
X-SMAIL-UIID: 13D6BF5EF5174DE8B3402D569CC84CB4-20260914-133936
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: RE: [PATCH v3 1/2] ASoC: codecs: ES8326: Add private members about HPF
Date: Mon, 14 Sep 2026 13:39:35 +0800
Message-Id: <20260914053935.15473-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <f6378ffc-7f25-4bbe-bac1-622fdf0f29a5@sirena.org.uk>
References: <f6378ffc-7f25-4bbe-bac1-622fdf0f29a5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

> > +static int es8326_hpf_set(struct snd_kcontrol *kcontrol,
> > +	struct snd_ctl_elem_value *ucontrol)
> > +{
> > +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> > +	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
> > +	u32 freq;
> > +	bool hpf;
> > +
> > +	if (ucontrol->value.integer.value[0] > 1020)
> > +		return -EBUSY;
> 
> Sorry, should have mentioned last time - value is signed here so you
> should also check for less than 0.
> 
> > +	es8326->hpf_freq = ucontrol->value.integer.value[0];
> > +	if (es8326->capture_rate) {
> > +		freq = (ucontrol->value.integer.value[0] * 48000) / es8326->capture_rate;
> > +
> > +		hpf = find_best_hpf_freq(freq, &es8326->hpfl, &es8326->hpfr);
> > +		if (!hpf)
> > +			return -EBUSY;
> 
> Since this can fail it might be best to move the assignment above to
> the end of the function so we don't update the value if we get an error.
> 
> > +	} else {
> > +		dev_dbg(component->dev, "PCM_STREAM_CAPTURE is not active.retain the input frequency\n");
> 
> dev_dbg_ratelimited().
> 
> > +	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
> > +		es8326->capture_rate = params_rate(params);
> > +		freq = (es8326->hpf_freq * 48000) / params_rate(params);
> > +		hpf = find_best_hpf_freq(freq, &es8326->hpfl, &es8326->hpfr);
> > +		if (!hpf) {
> > +			dev_err(component->dev, "The HPF frequency is invalid\n");
> > +			return -EINVAL;
> > +		}
> > +	}
> 
> We need a lock that protects against concurrent writes to the control.

OK
