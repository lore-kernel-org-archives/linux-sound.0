Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794293754;
	b=XIjqrHfa5WXVLxwdSqBKb/gv5AOuypwOqTIbkkJAS672nQjsLvZlGY+1K1N9EdzB7XTV
	 VOjWohzeOHH0MRB6snfWle46bOs3Vh8KfJNRk5R4qKUClCj3WzZlC4oFXov+hAqOTrt5X
	 Q6Kg4xVD1H35F8eTUg+m/zdSliVyk6PFdRC7VN4ikZY6mIMjeT3B9qL6EaqJ0eYKQFONj
	 1BHWBfKsXm0pUdtA9Fw/gY6Vsnus7G3J8mvGKV9GPk7SkRAPnErVzGGbTDltANzMTg0bm
	 rZT4XC5o9cDmLRBALPT4F/KNSBTpTgnXVNRShX+mHMZiV1nMzyrrOhGQf+AtAEi4hDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=3aTmEw1cmKfvZxOC/KfyfgUg+Qvb/ZBdPdJ3Gf6JPiA=;
	b=KGAeMr42p0F2ADhpRcXdiMXp6s9X7ajgOaCmEEPzXpvPg3q5K7frFr7Sv6QDBxjSthsX
	 MHYeSvMI70suz0rl5Y0bNWX0xD/uPwRrv/mehpYFleAQCsFpRjjMfgnInNYahoS30hSnm
	 QY98tHVBXhEFu8tKU9nbue595XVNHfRyrTmKSuoSElw9PSx1inFkPM/sGWsAGlZY/gqQr
	 yfkaf3Nx7ciPsF5YDKkD6bEWyPAyyLF2ejC3xxe46DXCg9CW77buS7xDNCJ0VQzXwhE0/
	 eLiCfN8HTXxQZCmQv9WF9+qb2eDCNizqKRmjZRlmcgfs6Okr2DAvkIEGeQs5pUUEOZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nwIEfiq5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF23606A325
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 06:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFF23606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nwIEfiq5
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdaefe02d5dso1011639a12.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 22:55:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794293753; cv=none;
        d=google.com; s=arc-20260327;
        b=MdlzuASy8oYAfF6r+BID5Lar2c84pe2AbKRUxr02VA6jLrYm/nGBQnDuItqKPaCbbt
         GxAPvAW3+ykCKCZQxbzslHrQwug5Mit2uI34t9DNPTG0mizeMYZCFENBVJfnn1xF66pM
         95cq+H94HLDSi4G7n2vMYlOe/de9BqKrLjQU0tq/cD6z2bfnv5Vt/96Je5niLDPuN/wQ
         oKrtF21ZjX3a0Jpw3hbsRS0z4BEXNyuYsQK3NRPe/xHY3eQNn7pllDRIm1GYVQJhvZNt
         jMmfxU4MKh1vOBPAnc9MhpI7Z8lA4JHtd5ViJOwrzK1gCP1l54R7i+s2jFnTpT/Pf6+K
         vqrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3aTmEw1cmKfvZxOC/KfyfgUg+Qvb/ZBdPdJ3Gf6JPiA=;
        fh=G9xlrRA56ZZmqBdawW7ItGnw06SxVQOpmycZEWEhv2g=;
        b=MGPILVH5aotK4tM2TobSFDjb2BVWOc9+3eqM3P2J1VYUK9ieaEil7FpULPEsGalgaD
         oDNIU4Y0NLQtw66XJ2DtaWFdPQXFB7P8QZn686IcbN9hI5xUHPTgSm4XNfapkz156xqN
         Do/6Xk1gVFuPhriKtszLQboNZmBQ7jsViUkAVv6TO0IvaodTyDeEsWz8yJkkS7PVdqTu
         LUYtSmjvxDvcdcsN3PCwFnHljyR1qCnoRJ0aohHKE0k2QKEJpETh/XbpvJLgRwKV2UZ/
         UzFhVTfetFfVgCYtq85ccS2/0EA5l5lq/vtg8MrqSpg/wjnc/4uJhEZid8sYEY3nIMZv
         +YDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794293753; x=1794898553; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3aTmEw1cmKfvZxOC/KfyfgUg+Qvb/ZBdPdJ3Gf6JPiA=;
        b=nwIEfiq5SmYNbB/BtyPVYzVZpcpfKpqzwyDrpMhQb5Lw36MxfwSncZCBn3aZWyGPu7
         BbtlByHVjCSMr8SsAE+ozfLFF7UdHigLmHrsgHeeXFMRxolnLuIC1b/toZy1Z2o3LDgu
         Dw7VhQWwT6GqtpCOU8CoWoHVwmH5Co6Y7Wz8mFqTtbOyCmF7I7mL9C/7XBVXnM5PK6u8
         1FWHw+pBrIF9JyuCXNRcn1IOM/UYLIpx40yLDuClmWGIiNI9k4ZVfpSMOpXAcoHEJ9of
         2Cy7eZXqXz8E4Ksssh6ShRN0wGreKsuITQ8fEtvTWQLKWgsf9QLpNiU7AJY8m1hm4wV2
         NBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794293753; x=1794898553;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3aTmEw1cmKfvZxOC/KfyfgUg+Qvb/ZBdPdJ3Gf6JPiA=;
        b=JNl5vjDwW0q22JdQ9Hli7GN217rEleOPzIHpqSFjzBpK2uZiSkt8Wt8nV8BtuKyhG4
         FXBsDTFH+4TcnZS0JlHcea4cBDV/hPARwU/NHn7aoMTo4aPvXYuOWA+62HdHMLv21oRG
         afSerB8CLeW1qnhRTpkh1r5D7aVveGEZtY43BhfX2HWgUnqBl7bg01EzZrctK8FfxSdM
         fCxCgB41wZNmjQej4VgfIBLHverDAP0kEeWU8QzZ/H5bF/KuGpIIgTIDDaDecTK/h0zw
         1MTSHIabAi3qzwlm233vFX7plyCZ8hEaBgX0b7JTCdMkzb9TEzXii1AWszeUscAw/45l
         UuoQ==
X-Forwarded-Encrypted: i=1; AL+hErGeCO4AgHjrlA7KT2i4e9ZTHEX2o1TbCWB87gDATEtfxmLvlpumNgWcTYxrtpQvmFE3j2ZnuFDWtc6VXg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+C+FiEsWvtCvHsIleoL3Cy3+bhmikGmo0Z/z5/4w+8hVIKZERU
	MDBgr+QyDuCbC8s+K0mXEOiHlodbP6WXj04KtBEdEiqVFIyhEziHOdh56idJ7VJr+2MaqeDdcJz
	j38fntg+BkxCFoxXaix/5/41jqgxUf8Q=
X-Gm-Gg: AYBFou25L5vwybXvO3987WidSG/wwTOvAfvkcEb4v74YGqK7t8SB8/9/QGkehCRYpGU
	NXFYNh+mwhnFbX97RsR7Jn6qVwVmMBA8dsJVNCj5x4ajyynLeaMPOAx0NhmU4wabPa1H1BRKh5y
	DrUDr3Y+mz5zyFc8dyMOanZOZB+0OdXGSQ0knzG/vj3QRXx31bGhk0zGhMiieDJmFQ+SADXktFc
	aOrapnd+mTCGFU8+w6mp/QyJodoLXS/asKm5JXQvHoyfvU4DDFjMfcVcpSdtqsfcBignMXoIgac
	KNYFO86ZV7qUMSJimwm/Q78zkRYDTv+xamJrHNZWekMHlipuG3vojMqeL2fzgdsY3OhNMMQJPpW
	mLYcXUll270W9z4TCI6zmqHR8kPQ99vB3JHgxldrVmwlA3JT8YrLNibLfQzcA/tcmIM8C7Wd35Q
	oIV43jq06Zh/TXw13rCFeH6YgfPbATSWeC+2I5zm6ohc+ZaeZU1w==
X-Received: by 2002:a17:90b:2810:b0:3ad:eb4c:26fb with SMTP id
 98e67ed59e1d1-3b166c84fccmr2048262a91.23.1794293753109; Mon, 09 Nov 2026
 22:55:53 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106112940.53550-1-phucduc.bui@gmail.com> <20261106112940.53550-3-phucduc.bui@gmail.com>
 <3be09e84-f36b-4718-aa83-176bce5752c1@inbox.ru>
In-Reply-To: <3be09e84-f36b-4718-aa83-176bce5752c1@inbox.ru>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 10 Nov 2026 13:55:42 +0700
X-Gm-Features: AclHuK8Idky8GO8hJSzXW1aBKXpxIRe-zJ31F5xwaXf6ppIwq9lG0SK6KiOcHBQ
Message-ID: <CAABR9nH6WbA+XzubhqS5=1KkRxhq2aqV7R9iJ6-j0S3OCYZ0gg@mail.gmail.com>
Subject: Re: [PATCH 2/5] ASoC: dwc: Fix error handling in dw_i2s_set_fmt()
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Andrew Jackson <Andrew.Jackson@arm.com>, Mark Brown <broonie@kernel.org>, 
	Xingyu Wu <xingyu.wu@starfivetech.com>, Tim Bird <tim.bird@sony.com>, 
	Yuri Zaporozhets <yuriz@vodafonemail.de>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Maxim,

Thank you for your review.

> > -             dev_err(dev->dev, "DAI format unsupported");
> > +             dev_err(dev->dev, "DAI format unsupported\n");
>
>
> Should the typo be fixed in a separate commit?
>

OK, I'll move the typo fix into a separate commit as well.

Best regards,
Phuc
