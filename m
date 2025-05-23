Received: from mail78-63.sinamail.sina.com.cn (mail78-63.sinamail.sina.com.cn [219.142.78.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DA42F24
	for <linux-sound@vger.kernel.org>; Fri, 23 May 2025 02:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=219.142.78.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747967816; cv=none; b=kW06604X7McJertxr0WdTdfuFWutwceiH/j96mKUg+8tT6QBwmHh4Hwt8M5p9Ql+4mMAFe7QcZmsYXvEAKMHBJ/ZSP8XioYSXq492ktk6/lagHMXN6JdY3NAIgNQVh0JicOUYJA912Bso9ni8o7wMEqh28VuA1i9eGfH7mrBhyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747967816; c=relaxed/simple;
	bh=zun1QY8q1fAVtur2VQ7pww2aQwPnElLNn6ZMshj/Nnc=;
	h=From:To:Cc:Subject:Date:Message-Id; b=nTFPctmusY1uSFofdbBv3EoSgDaCJ24dPz8NgEe9Slw3Pi3oaMjx8w4LZWLV1Mnr4guc5QdkE3/pInvcdnMITNBdBScZ5+bHKVgPc9uXLKwAUybUdEJUumnEwOZbLvK4m/wfD3jvQyCV2ThrOt/K6IU1i3mRxbbC3WuTMaLAW7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=219.142.78.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.172.39.205])
	by sina.net (10.185.250.32) with ESMTP
	id 682FDF42000051ED; Fri, 23 May 2025 10:36:51 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 2C340DD7119046EDBCC7EA177B04D1E5
X-SMAIL-UIID: 2C340DD7119046EDBCC7EA177B04D1E5-20250523-103651
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
Subject: RE: [PATCH v1 0/2] ASoC: codecs: add support for ES8375
Date: Fri, 23 May 2025 10:36:47 +0800
Message-Id: <20250523023649.22785-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

> > The driver is for codec ES8375 of everest-semi.
> > 
> > v1 -> v0:
> >           - Add the description of everest,mclk-src in the yaml file
> 
> Version your patches correctly - that's v2. Or just start using b4.

ok, I'll change it to v3 for the next version
