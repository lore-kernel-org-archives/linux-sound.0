Received: from r3-78.sinamail.sina.com.cn (r3-78.sinamail.sina.com.cn [202.108.3.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E757D4C92
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 03:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782704035; cv=none; b=OveEFHEbjMWjfH0aYHAXpq00yatsmNf5U8pdlLMur2EHyIRijE6/xuAwYljhDrzgWg72vD7anc4U3MlW9cdxJb6nRgJNcJSY8nGcajw21CVVFQ+4JAzeSgCAFOrmREiVFGOuwGUcmswwRAu1YFxzQbqtfu40uvt4/Dh9lZ40rGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782704035; c=relaxed/simple;
	bh=aHpFss6odfoHOTVw4vxs1IeAs2vQkY5SYR5I1/0vONc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=AgigY7KocgmPi6U3oz51ZKCrIa5Unj5AETo0q6IfP6F8iHbv6oUEou0LRBfcjdB7Cx6imvw+P7HemqJKDNsxuaHwce/n2XlJsxOuNRaxpxK7z80lZ6QQsZA2C087jOTaT4doIH2tJLyCFkG6JJ0wYfPUOoFzTYf8ZksbqG2XtG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.37) with ESMTP
	id 6A41E79200000FED; Mon, 29 Jun 2026 11:33:39 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 9A5AB054795F4355961FB7F809BBD8AD
X-SMAIL-UIID: 9A5AB054795F4355961FB7F809BBD8AD-20260629-113339
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	zhangyi@everest-semi.com
Subject: RE: [PATCH v3 3/6] ASoC: codecs: ES8389: Modify the clock table
Date: Mon, 29 Jun 2026 11:33:37 +0800
Message-Id: <20260629033337.3781-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <df181e29-9c1e-427c-9c81-a0bf2cd9fdf6@sirena.org.uk>
References: <df181e29-9c1e-427c-9c81-a0bf2cd9fdf6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

> > Updated the configuration for certain frequencies
> > If get_coeff does not find a value that matches the condition, return -EINVAL
> 
> Do we have values for all advertised sample rates?  I'm not seeing
> 11.025kHz for exaample.

OK,I'll fix it
