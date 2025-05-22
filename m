Received: from smtp134-90.sina.com.cn (smtp134-90.sina.com.cn [180.149.134.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86811C5D7B
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 05:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.149.134.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747893188; cv=none; b=l1BQA6oHHim/y5RgcFUWHTbWBVmZ1JhiGHH9IPAQ4tSRP/tVoxfqkO78rLS1a2HqL4oLw5SdrEYNFX7xYxqEmeo5Ntitc/lTIFOdz4nNX9FbD1NaFdcIUE7cLbQIjn3FUMAWsPrfB8XvwKqNrbvcBRjGdHbPGegYNFNnW6vlujk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747893188; c=relaxed/simple;
	bh=COoArKPhM0O1twtk8c40WHTH20QejO+o6b3Un7o8Eqg=;
	h=From:To:Cc:Subject:Date:Message-Id; b=H1uaFieQez0/sWgvFdPesYW5lq1sGh4B+/B/n498N4A/AzudmUL3sFeT+eF8BOGzCc5VxRYuyvosPQ51pRswmzVcVb99KpPKSJnf5H1ZFVozKkMguX4cHToS98QOzqiKKEiThonbudtGA7je7zUydRpOg0yHxiufQLYJsIKn/mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=180.149.134.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.172.39.205])
	by sina.net (10.185.250.31) with ESMTP
	id 682EBA75000072A0; Thu, 22 May 2025 13:47:34 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: C61064C92CA44517821FD0B647842F70
X-SMAIL-UIID: C61064C92CA44517821FD0B647842F70-20250522-134734
From: Zhang Yi <zhangyi@everest-semi.com>
To: krzk@kernel.org
Cc: robh@kernel.org,
	tiwai@suse.com,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	krzk+dt@kernel.org,
	amadeuszx.slawinski@linux.intel.com,
	broonie@kernel.org
Subject: RE: [PATCH 2/2] ASoC: codecs: add support for ES8375
Date: Thu, 22 May 2025 13:47:32 +0800
Message-Id: <20250522054732.9629-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

> > +static int es8375_read_device_properities(struct device *dev, struct es8375_priv *es8375)
> > +{
> > +	int ret;
> > +
> > +	ret = device_property_read_u8(dev, "everest,mclk-src", &es8375->mclk_src);
> 
> These are not documented for DT, but you have here other interfaces. We
> do not have such case nicely solved, so please add explicit comment that
> usage of this and dmic-pol in DT based platforms is not allowed and this
> is not considered ABI.

I'll add the description of everest,mclk-src.
But I noticed that es8375->dmic_pol is not used inside the driver,
so I'll remove it.
