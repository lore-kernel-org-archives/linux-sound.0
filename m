Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501843BD657
	for <linux-sound@vger.kernel.org>; Fri, 29 May 2026 10:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780050407; cv=pass; b=AYL7ISzHGyC25d/tg4Md7EzRcKBXhL2v59trrp6pLXY05/lhDEiz2Dnkrsfsdbcfim1jXafnYpRnjJwheU+SJKHfHFk0aMawO2Nj09OwarnJrB+n5Y6QyvaqKd1slGqyvZd4ph+kp0EgsMpA/+vyNDy/igQ0wQUpfA+c45bJi9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780050407; c=relaxed/simple;
	bh=Ii+uRKFy6UwEhFw7CZArJVe/+6dF/ZP+JSJdukiMSrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C2IzX5buxCKamc/0Sgx3TfIIRpuHv7LbgB9GU2tWVgmiCADeIjiktRMbbhN/HDMUimVTMTQS5Cl+zte8XsZhT7a/zde2d8Gm2RLDppnrBSqi4nppPWluI6S2q/SaiQu3Szg9chfEyWKCSAEZlz5X8N9x7rm8xu/vT4rIUcytMqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxoVQMTl; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxoVQMTl"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bc763e2ba8so69654035ad.3
        for <linux-sound@vger.kernel.org>; Fri, 29 May 2026 03:26:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780050405; cv=none;
        d=google.com; s=arc-20240605;
        b=R8171YQB0QWZWDNXXf2m0BnSePedC8y1D/LSRkRGbIVLBcRZFmxusygsXfr4ag3zru
         DtrkHRVvCHBEieh+8H05L1jrMqAojqnFD81uksEys3g423D+mB1i1dsVcjSpuZ5Sw+JU
         RPhUR3hnsFErLdfcKCU/ZeY7+0Mu0SBKUmWDnF10n2XxSdaRshXAH+12lOMBL23YFZsO
         lfWMing06CACyUpCsJi3tY6hvqOZgYTn50B0Ouzut/5bWN/YcyDzXC+6st33A3tDCuZh
         gTNXgi08rkB8NulkNB8gik/jiJgxLFGsxDOZBnNo3YAQ59+IBIVVpA2VKsKl/7/RC912
         S5mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ii+uRKFy6UwEhFw7CZArJVe/+6dF/ZP+JSJdukiMSrs=;
        fh=1ZglTZJnE6jT/aTGJPsgnJv0QSYltlsQmKgwuUv1wkU=;
        b=TLFVzgfS5NQaCcKutlY+X/0+4+9uezdEXsyvb8aLxKV7Zg39JaDjiZae41HsXjKU9I
         as7lx7Vgb7JzrIhbDxiOhojax2oZ/hOsJScRR4vNHTHlknb1jZFEPGfRfVKEsNR11xVq
         +w5R+2V+rUAXoCDaKa/UyF6i2mDBtGTMTtUinp7K7XcosvMmQaVdSniV2LN+IMQxPuNq
         63rpAm7lnkatRyO9z6NUbDJFX9d9emX9lgW29ja1CZCeM10Wdootpko7UB6JWOuKjXnc
         Sj3WszVbJ98S7WJv2vJjfXofxr6fJBCHNygIl+SnEK62YusCckKoyiARrDTJ8afRnus/
         YwBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780050405; x=1780655205; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ii+uRKFy6UwEhFw7CZArJVe/+6dF/ZP+JSJdukiMSrs=;
        b=lxoVQMTlSbH5hNIxF0DPgNM4JBRurigpXefu+P6iJ7HrbLbfxFReL42c1SVj3D9Y5O
         9y6GgHj//75U6RIU7fBUde2U+WL29xkQsT5MESKbvGUkkG70wg6ajv9uHzu+FaeCmB3f
         HuUvGU8239pfvQ8a7v7fdD5CcI6FYrKfq0MXLlypgYYBM4ynGrF5fvWUOMfoS+Z49s2o
         tv+mmaujTJdwouvlup7ethwD4f5APlhg1zktVLHthqhrJmOzHRMFLp51lyPmoZJf9oBH
         ed+DCadcdNxD4XgwumpbBfuSt4JBbuZegS30uf2RE98+gkHQFR2ip0GJXO8vO5RETFQ8
         Ziyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780050405; x=1780655205;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ii+uRKFy6UwEhFw7CZArJVe/+6dF/ZP+JSJdukiMSrs=;
        b=kUTzrPXXXZN6qzBREcK6GzBOdSrea/Hh/iEF4wy6vhIVWW0cF7nOVMqZtlr1TUA6pY
         h90NYf7nUdzwJSPO7lpUmz1X5O9CmVJyZwOJHb6LXsST8665yrNhN0trAIXSnkaEZ7QR
         /ptM5FNfCYw/jQVgEs5j1miH5sjjPqoB6WLYfltlRewfVaYconMIgVDQTWlW56SzSvfx
         PVIMCPheVSrgfFP6S+Z+T/JXQ2Ee/pie2a3uqgBv2qbefzrsbgzKGDm+pvbY8763Wme7
         YMwOZoZrK1fGlyq/Ws537ZOdoeEL4MS5Fb0C5ItcRvSnyvCJODSwngumtZP1FtHb/mi8
         DEfA==
X-Forwarded-Encrypted: i=1; AFNElJ+Ye2dy4W/eNDmOUuX77m+49gcBXshC8SFpRI1aLZrmjdOgcVDML0P3k1rqrYAhO+W9kPg7RDx0iH2gNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdY9DeEBQO/DGcVWFz40i1xI9Sk7Yc1COI4T7jaGx0r36SKh4N
	dlDsBIQGAArHGcvzmrhTam2c2Gj/lIUz65R6fppXDW+y4q0LCZRWieBVLkOhH+UDZM0H3Qjhhtz
	17t1CySGb5qV/SWIKY9zFPp6NXn0dFt8=
X-Gm-Gg: Acq92OHi9Jo2Y6sV6VBk7O7hnALcRxk13Ce/1cleUphlkOtpro5CbEsIpurPgQaDr5/
	mTFFMXRtqFqt4cRM4+CXLQuaPwd5+ipeO0hvdeaQe/RI/xns6pFQq6+dcok0RDhnmrilvbku8Is
	oCwyZowRSlvuJtK9YVgpF1OGNLEnTjBhqhUwX4YF5QWYFAFCKfqtpv9CSO8czjKOpRQCQZKi/DK
	0+4VQieLKY+x1/DpkFj/6NWigy/2g/IUUU6SiluMiAzwg5v+oOtRaSEdZ7e0ONfOc2WKR3i9+Vr
	OtpWoy1O/Nva9co4ULGoGpY8asnornPuB3Hxg405SgXe6ed1
X-Received: by 2002:a17:903:19ce:b0:2b2:6cab:313c with SMTP id
 d9443c01a7336-2bf207629afmr29751365ad.20.1780050405455; Fri, 29 May 2026
 03:26:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528105900.85604-1-phucduc.bui@gmail.com> <a28adec5-1b34-439b-8d92-5ddaba7ffd56@sirena.org.uk>
In-Reply-To: <a28adec5-1b34-439b-8d92-5ddaba7ffd56@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 29 May 2026 17:26:33 +0700
X-Gm-Features: AVHnY4IPA4DZazxZwYXWbjOcFm06OQ-rI61yhY3P4b4GuRWf64zD-rgDCF6rPWE
Message-ID: <CAABR9nEuxGO2rkfpDLEDj6ZrMg-LFPbDOPg_Mq-=qkeNFT96gg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: sprd: sprd-mcdt: Use guard() for mutex & spin locks
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Orson Zhai <orsonzhai@gmail.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

> There's a mutex_unlock() in that temp == chan case there.

Thanks for pointing that out, and sorry I missed it.
I'll fix it and send a v2 shortly.

Best Regards,
Phuc
