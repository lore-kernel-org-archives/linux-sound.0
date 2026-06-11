Received: from smtp153-177.sina.com.cn (smtp153-177.sina.com.cn [61.135.153.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009FB37E2EC
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 12:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179327; cv=none; b=c+sqyxH8UfCU09vMvAOWWJoZX8dCk50pwHPZts1MkHhYh4YkTUt6MgrVySUlbEXXjKcstpMe5YwH0Bg8uL5d8MdsKMyOPVn5xDaAbdv6JmdZ5I0w+9AHKZ8le9u3mRDcvrrKNkKxHg8cSl2bKeB4jKoETCTFoDtPz+moZMpW+Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179327; c=relaxed/simple;
	bh=3Mz1buIldYgIfV+mCp3fBzQK/aC8n/L3gRN7gf7mPno=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=nTCyijpBrPhEIkjhIK/Lp0Qk4iDXextOfKuLN4o/YP+bzCZqYpfB8CVKABxwDN2cVz3mzWno+m+XHP8seP6st1zv0FUXOo5zO5ME2vGZEYJ26Yry54mGXPzfqAQzptoc+HKyFJ+BWkWGkXTv9TIRKUZrkR9CbkcfHhK08JySC0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A2AA3B200002418; Thu, 11 Jun 2026 20:01:55 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 65226D66B1E341D581A6ACA05DEDBBF9
X-SMAIL-UIID: 65226D66B1E341D581A6ACA05DEDBBF9-20260611-200155
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
Subject: RE: [PATCH v1 3/7] ASoC: codecs: ES8389: Fix the issue about mclk_src
Date: Thu, 11 Jun 2026 20:01:53 +0800
Message-Id: <20260611120153.5915-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260611-likable-ultraviolet-moth-fdf2f6@quoll>
References: <20260611-likable-ultraviolet-moth-fdf2f6@quoll>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

> > Fix the issue with incorrect modifications to mclk_src When the system 
> > needs to be configured to use the MCLK from the SCLK pin, the code 
> > still sets the relevant registers to use the MCLK from the MCLK pin 
> > And setting `mclk_src` to `u8` is inappropriate, because the purpose 
> > of `mclk_src` is to determine whether to use SCLK as MCLK.
> > Therefore, we will change the `mclk_src` member from `u8` to `bool`.
> > 
> > Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
> 
> NAK, same comments as before. You just ignore feedback.

I thought I had responded to your feedback, but I haven't received a reply since then.

I¡¯d like to know if I need to respond to all of the AI¡¯s feedback.
Much of the AI¡¯s feedback concerns pre-existing issues that are unrelated to my patch.

At the same time, I assumed that when you saw a ¡°High¡± severity level on Sashiko,
you wouldn't be able to view the patches, which is why I sent the following patches and assumed they were all v0.
https://lore.kernel.org/all/20260608083540.12581-1-zhangyi@everest-semi.com/
https://lore.kernel.org/all/20260609025605.16945-1-zhangyi@everest-semi.com/
https://lore.kernel.org/all/20260609030623.17404-1-zhangyi@everest-semi.com/

If you can see my reply, should the patch I send next be v2 or v5? I think it should be v2.
I'm sorry for the trouble I've caused you
