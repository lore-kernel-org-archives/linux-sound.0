Received: from r3-212.sinamail.sina.com.cn (r3-212.sinamail.sina.com.cn [202.108.3.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDB9BA3D
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 03:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782704306; cv=none; b=m1i0tCUczwCiP0zHgjY2r7uuou0Ypym8AMhSI7zlrWjI/jVTmO2cSxg+lX+thK0gJsvxLcQqpJnfzSowb9fdt1jtMyQWER7i0HZiiL+YZSMU3V78nyDAAtAjBEnBOq6gIcvOoMHOnZd2Hzo5KsJrmSsiYrIkC+wen0C8HFFS9DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782704306; c=relaxed/simple;
	bh=UykXNke+68MAdxwpv21yMIbhKNaYMs+YO6NtyiXK0xc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=D+PC16Amq6Wx+n8Z/kFQjennonSnWU6wmluaR8KKBsls8Nln0C2PE7M+/U33RS1rPaLh4yedC/Gx5G8EZ4zR9dtzhcGynsmbejTvcpJyRIgoRVYQnGYNJrb2sC0u6Xm8Bi11bMipcjo8PFn08t54ja6meHuJYNNEVNLm48o/jCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A41E7660000355F; Mon, 29 Jun 2026 11:32:55 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: C4DB14F2C91045DF8372E3FD5084B2CE
X-SMAIL-UIID: C4DB14F2C91045DF8372E3FD5084B2CE-20260629-113255
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	zhangyi@everest-semi.com
Subject: RE: [PATCH v3 2/6] ASoC: codecs: ES8389: Fix the issue about mclk_src
Date: Mon, 29 Jun 2026 11:32:52 +0800
Message-Id: <20260629033252.3731-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <ecf88274-4474-4856-b9bc-842a382ca772@sirena.org.uk>
References: <ecf88274-4474-4856-b9bc-842a382ca772@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

> > +		/*
> > +		 * If the MCLK property cannot be accessed,
> > +		 * switch the codec's internal MCLK_SOURCE to the SCLK pin.
> > +		 */
> > +		es8389->mclk_src = ES8389_SCLK_PIN;
> 
> If there's an actual error here I'd expect us to return the error code
> rather than silently ignore the clock....
> 
> > +	} else {
> > +		if (!es8389->mclk)
> > +			dev_err(component->dev, "%s, assuming static mclk\n", __func__);
> 
> ...if it's genuinely missing we'll end up in this case (which shouldn't
> be reported as an error, that's a totally valid configuration).
> Consider for example -EPROBE_DEFER.

OK
