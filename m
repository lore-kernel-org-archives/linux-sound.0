Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD1C231A55
	for <linux-sound@vger.kernel.org>; Thu,  9 Oct 2025 16:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760028955; cv=none; b=jxFBDXVTCptdoWRr/I1rajC/HNwfS2OdT2JIPlxqIY877CpODtP6ZePzlQHOXOlAMY0IcYbJkVmbQlwF783clx6GU2ZTjJOXPlJzayM6/paDqnL3HjJSSpS586HKE8SXDq52H8+jFZhPeCP5qd76fdLwO2oG+33ixoIXuNR/LDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760028955; c=relaxed/simple;
	bh=R3CLaJhA7gq+Og3P/cSRClmlVF11WIVSyo2PEkqoTNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KNGqwdD6xTbia/L54KK/EJ/g+RGJSpSAjdeR5lbfsRgj9nsR9LXh9hnyFe5FFnTG6NJt8Z1S3F6wQnp8SXMT0HbarcAlKqnpuW12Fzfit8iLN5uZRI1xW4Sel76uz7mInSTM2jOGNLO5XlpH+unCCT2lT0PEr8yz9CY0xlHc3Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gc1PX2qs; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gc1PX2qs"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7abc631ae5cso896682a34.1
        for <linux-sound@vger.kernel.org>; Thu, 09 Oct 2025 09:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760028953; x=1760633753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3CLaJhA7gq+Og3P/cSRClmlVF11WIVSyo2PEkqoTNM=;
        b=Gc1PX2qsHRXZY4+c/sANi05Mt3H6Cxf4+Stk1CraSPr68I/fG7i4rXOr/PzL2XCrv+
         FZWrOvr5c3XMYUK/l+HlOocbm5+mTxRz0LpG8TSWsI6WQSTrlE6nSQlP4iOKzrrt6axW
         o+OJT/ebKZ8TZzGtZEULv6EQaONCu0XxouwCJC4AaVso+AzaQOPWRYZSH55lHB6bs4mA
         8esA9npHgMLdj4fzt3eg+Quc1jSBBp2jMS0QcAM/X4ldRlV5uosJB5E4IOOyUKy0Vwli
         trDc5JpklFl9fdKgcUDlPJcPDzdWJjm5i3uBiKZV4X/nPBLtG3/JEqyUWTwmAnaTNuAP
         jsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760028953; x=1760633753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3CLaJhA7gq+Og3P/cSRClmlVF11WIVSyo2PEkqoTNM=;
        b=WCg3BzXFtbg/KHlQ+fGRHSy25c85WGCCecMxdTX/b0wxFtTERtIY7C4ALrcAa4kmih
         NoTDzVkUcUnP2eL81JU5nu0c/PmmCuxWQDzdMJRGdDUVvw5F5MRcvx0wAE7nDmiXpNiS
         +D0tlUOd7byWMNXR2rhOjxoktdQGOQqqppSwkdoOQOAgv4fsLNr5CCOKrrueXmnUURdy
         xH4mtZGuP+0LIzrJFXap4ImsifwMwn1HocCv6xFlMvDDtGSCc5kxKXhlBnDmRYOPe5Yb
         5SCQV+pDgPSmWycpneaHQpYDUUKEjbadthxcP5qYLp3XeZU8VBc/0yHnrS0z+eorKK6Q
         hLUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLhDzm/bKjw+bD7CUDPfDmujIKGlezpyOTylaOx3nXIOtnqU1IglXN5NsR6yUVWtbVlKedA4pDi9OkGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/LvVZkFZJIQO0E26o/of1FxKHlXyr5aHY6JohGeaTmbDkze5b
	Xxgmkr9jUi2KKDUDy+Blw86dshcFYaHHqHmIoD44ThEXi2WjBoKvTy6u4UhTgOEjBIGKV+CbU6B
	Tq0z2ST4lBN7VfsEw+eVLh18FFMUTCfI=
X-Gm-Gg: ASbGncv5vw7ctR4yywCf2Hbh6EoHJJNPbO0DkoN83/FZVcie4oGTtSVcBAYtRRlGJRQ
	24/JxjOdSRfEnLlUNO9WwSheoWaD8FebDTjeJG98Q5phNmtxWgsUAPKDbuQYQb3LUPoAIHSpzkn
	zx5Z4j1O+N67e3aJ8+41rQzAd1LdizZvEReWne0wMF1x2mVXdb+ZFpyvtihl8hn8G+L0r79mLUu
	Jn5PeXbkAR1cKl4JkogeHBaQS/5KNA+6SqX5pd9/MH/Ai0HSXDO
X-Google-Smtp-Source: AGHT+IHLf0hz1LIW9mLUgXnTIY3sM3Q0Cu7moc3MCOrYonSnvCG+5CrCxjzhF5mjp/OiNtzpnxefy8/ost3y9B9JgJI=
X-Received: by 2002:a05:6830:368b:b0:78a:1d62:ff20 with SMTP id
 46e09a7af769-7c0df7e01d5mr4719404a34.30.1760028953205; Thu, 09 Oct 2025
 09:55:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008205207.1781-1-briansune@gmail.com> <aOd9yUj9H4L4fbtc@opensource.cirrus.com>
 <CAN7C2SBd8tDXG8OkjRt0sDw1OmtrLgtuStEfr=f=JHZMRvjq9w@mail.gmail.com> <0167554b-c3b9-4cc6-9382-d378e5b1227f@sirena.org.uk>
In-Reply-To: <0167554b-c3b9-4cc6-9382-d378e5b1227f@sirena.org.uk>
From: Sune Brian <briansune@gmail.com>
Date: Fri, 10 Oct 2025 00:55:41 +0800
X-Gm-Features: AS18NWCG0agAAAno9JmFiOQg3dDw0wh1zt0svMJv0yHR5M3Ofn0geI28L4Z0CkQ
Message-ID: <CAN7C2SD+9Sto7LzFSe6McTSTaEhwHQP4L_yDAdzbRdELbBfFZw@mail.gmail.com>
Subject: Re: [PATCH v6] ASoC: wm8978: add missing BCLK divider setup
To: Mark Brown <broonie@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

TWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPiDmlrwgMjAyNeW5tDEw5pyIOeaXpSDpgLHl
m5sg5LiL5Y2IMTE6NDnlr6vpgZPvvJoNCg0KPiBOby4NCg0KUm91dGluZSBjb25maXJtYXRpb24u
DQpBcyBzdWNoLCBjYXNlIGNsb3NlZCBvbiB0aGlzIHBhdGNoLg0KDQpCcmlhbg0K
