Received: from r3-73.sinamail.sina.com.cn (r3-73.sinamail.sina.com.cn [202.108.3.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570E83E5EE5
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 11:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177434; cv=none; b=bOyZLFHLRnV33dRaPd0txxeh39UB3qxc8ig7qJFfrCKodjmmBid/wSwzyk8FT4HXZwFP+RlpDKmoCP8OP7mljeJ6dl9gvOir9ArRf6zJWFUxJrTSylQReDUQdt51eUD5zUzwShzphBbFq6MDiXSPuJGlOhhelpLotiaJX9KoH1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177434; c=relaxed/simple;
	bh=n3otl8cPAQpDds00mT2pqekhJ7HJJW10lPDqxW3XgTA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=eJUzm9F+TT9OFZVef86BaRneFxlbInGX6NSPLg1tcovFK616gitnDKDbTPseV491YEIHlmUuAgEai6l9t/t9kxnQPWc3yB9v4PFY+EEECJPZ7NwXdiZXe2JAK48rftWY3O9jNGttICShpbYe1LRZR/R8i9J7wbLl2jBL+LHFoZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.39) with ESMTP
	id 6A2A9C4D000030FF; Thu, 11 Jun 2026 19:30:22 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 054A55A60D70428E8B9CEF385AC080E5
X-SMAIL-UIID: 054A55A60D70428E8B9CEF385AC080E5-20260611-193022
From: Zhang Yi <zhangyi@everest-semi.com>
To: krzk@kernel.org
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-sound@vger.kernel.org,
	robh@kernel.org,
	tiwai@suse.com,
	zhangyi@everest-semi.com
Subject: RE: [PATCH v1 1/7] ASoC: dt-bindings: ES8389: Add members about HPF and clock
Date: Thu, 11 Jun 2026 19:30:19 +0800
Message-Id: <20260611113019.5772-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260611-mamba-of-legendary-anger-af76a9@quoll>
References: <20260611-mamba-of-legendary-anger-af76a9@quoll>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

> So this is like third time you send the same.
> 
> You never responded to feedback, I don't see improvements and you keep
> sending the same v1.
> 
> Version your patches correctly - read help of git format-patch or just
> use b4.
> 
> NAK again because you just ignore us.

Sorry, I was wondering if you received the following two emails
https://lore.kernel.org/all/20260610100637.25568-1-zhangyi@everest-semi.com/
https://lore.kernel.org/all/20260610095820.25386-1-zhangyi@everest-semi.com/
