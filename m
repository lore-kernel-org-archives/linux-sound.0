Received: from smtp153-177.sina.com.cn (smtp153-177.sina.com.cn [61.135.153.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E654C92
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 03:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782704057; cv=none; b=qWD+5nskTDDCJcef9JKGps2qw8zftMv7WBM1Ud/oGCDIjv65iCk/3XzdbeigikuN/MXvcPkBMKp7KE5gdjt3ZIHx0OvI6EvLJ6saY4x5TIu4KoFMdZLSga9qeSgiJwRzp2MsgNptKTj9e4JV+HEvzqH/xA1wnqKAOL8TcSKIOTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782704057; c=relaxed/simple;
	bh=vScIyLGBiLbNmufq2gVWSj8oMyt4DasMj+oFf+SEEAo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=k3FFidWhQdKNxfT89kf4NjrHM/320PitNj79k8pSBBkeFbjVgKWuZx+cGrOXruP0CGIH3M0OtrtC6lmfI8fobiA1eaNbExKsueNX5KTZVahBENSgFr9c1N3Omc8SxWLxmK9pJXKh1o0TZT4V4JMUBj783HRQ+tcFx3idrwd5vso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A41E7AF00003D8C; Mon, 29 Jun 2026 11:34:08 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 487A58B55A7944C1AC4DDCDC3000C178
X-SMAIL-UIID: 487A58B55A7944C1AC4DDCDC3000C178-20260629-113408
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	zhangyi@everest-semi.com
Subject: RE: [PATCH v3 5/6] ASoC: codecs: ES8389: Add private members about HPF
Date: Mon, 29 Jun 2026 11:34:06 +0800
Message-Id: <20260629033406.3831-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <f5bd25e2-0f70-4e9c-a73a-e00a632be06d@sirena.org.uk>
References: <f5bd25e2-0f70-4e9c-a73a-e00a632be06d@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

> > +	u32 f, diff;
> > +	int i, j;
> > +
> > +	if ((target_hz > 1020) | (target_hz < 0))
> > +		return false;
> 
> This says the maximum target is 1020Hz...
> 
> > +	SOC_SINGLE_EXT("ADC HPF Freq Select", SND_SOC_NOPM, 0, 1021, 0,
> > +				es8389_hpf_get, es8389_hpf_set),
> 
> ...but the control goes up to 1021Hz?

Sorry, I made a mistake.
