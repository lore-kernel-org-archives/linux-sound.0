Received: from smtp153-140.sina.com.cn (smtp153-140.sina.com.cn [61.135.153.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47E5477298
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 12:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131002; cv=none; b=no67cFhrRQuTGcLmV/9i/R23JtbZuQbqH0JeVrKbndBkpZF92vOiPrRx7PeWwi2OKxfv33pIx7owty32LCL8LVxblcW/8msd5qskALPnvniFusWa5bYGRVwHhB0aN7ZzXTyOyRXOz5thddnN5AlPqn1bE3+FzCl19rEVPDWa6ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131002; c=relaxed/simple;
	bh=ipV9Zsxr6VMqbyoynVFaKT+LHE79BUiG9ljyf3f8ryo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Y0dNoogiKKEXD9rI1RR6W4Mf50ruM3DM2DDy+C7vlo4mTN+QFM7SfCmHFKwxJxI3CRuEx6JtmrOPAo8iqxl/SopZwPvinrXriMGyIeXihsLCgqBZJ+kod3iyJ1tOs37T3DwEZKpWxLqtFvFbapDKr6xRlqtKmXZz0keujLpMXc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.36) with ESMTP
	id 6AA3F8EB000047BB; Fri, 11 Sep 2026 20:49:47 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: A17396EABAB84AA4980D5E5444F87B12
X-SMAIL-UIID: A17396EABAB84AA4980D5E5444F87B12-20260911-204947
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: RE: [PATCH 1/2] ASoC: codecs: ES8326: Add private members about HPF
Date: Fri, 11 Sep 2026 20:49:46 +0800
Message-Id: <20260911124946.2219-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <71b07c2f-7dd5-4344-9a10-f63bc67ccd4a@sirena.org.uk>
References: <71b07c2f-7dd5-4344-9a10-f63bc67ccd4a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

> > > > +			dev_dbg(component->dev, "At the %u Hz sampling rate, %ld Hz could not be obtained."
> > > > +				"the frequency has been set to the closest value, %u Hz\n",
> > > > +				es8326->capture_rate, ucontrol->value.integer.value[0], es8326->hpf_freq);
> 
> > > It's fine to just do this silently.
> 
> > Yes, but I'd still like to keep the information displayed here.
> 
> If you're going to do it you should rate limit it, userspace can trigger
> this and DoS the logs.
> 
> > > This will update hpf_freq, does that ensure stable values (especially if
> > > the capture frequency changes with different streams)?  We probably want
> > > to just store the user value without modifying it.
> 
> > We want to be able to change the values of the HPF-related registers when the capture frequency changes,
> > because the specific values depend on the capture frequency.
> > As for changing `hpf_freq`, since the codec cannot support all user-specified frequencies,
> > I will replace the user-specified frequency with the closest available frequency.
> 
> The problem is that on repeated stream runs the value will keep on
> getting updated and drift away from the original setting.

OK
