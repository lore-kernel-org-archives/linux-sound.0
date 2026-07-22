Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6773B46F4B1
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 11:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784721022; cv=pass; b=Jfjfoe7ry0KmgofhT3+k1CBUT/udR38gInmErfX1+cZyxp7VL7XzWdI7Xs0LiLLv6ChNwiqqO9qw8NmTRNhcpvJcFF+Vt1WqLZudvVqkXiYru7S5sgqDiILxrjNBo85ELZZ7sFzWqup96xZHp4BDbO1/NPAow217Yv4V3aepfp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784721022; c=relaxed/simple;
	bh=Ftngr6uIQGGwpB63XFYD2rUJOFykaHdNqhOYri/BMvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hkY/KqpCLSeUfzdxEXA1Gw6KqBobwiFqg+wbG+2OuFA5OLBQKg3sbX0SmMJYaAQLPp2bamG4QskZnYJI8cfQB/LKcRXffV9t4RX9M5nOChP7FrhhUZ5mwCz4gyrCNTWOhTCtOMnDa/9pru+beoy0Cm9zUKxbEEbeVLd4AAzwlGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OK9Mtndn; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OK9Mtndn"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ceaf8a1265so124876855ad.2
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 04:50:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784721020; cv=none;
        d=google.com; s=arc-20260327;
        b=YVHJUmkvhEL6C5edVjUnYGkyTr/zRbS/rzWO6yHjly+CwlYUYWSqi5Mc/qsilR0izw
         ucRBc5P01MrxN7TeIjoGQlBDl1n1bs35RpClwKrSwwA5uUVnTrJzTgtPpKkwKf2rDxye
         dA3Jp/+o+NYSw25UtEIhMQq0OVKTK/S3p9wZVNDV0n+PDNO8isL5MsaCGixLqvPOoxs4
         vsK34zUNKGukSQx+8ax2tafa/FFsUriLuAHq+uORi3VeE6MdiZ8JDb/LlmyRbnzwUD14
         OkMm1SYYEImU6IR+oZCQFSSDC3zXKVD8qKoOTLGSHutOnUdSRtOx9n/e2kRwkzDncrsT
         8P9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ftngr6uIQGGwpB63XFYD2rUJOFykaHdNqhOYri/BMvc=;
        fh=p6XsD/9XXUwQKubhFQEnOqiiTXfdUY97AulINA5bQLU=;
        b=GvKBATbX52gaY1hOI3XkuAeLn0RWp59C2q1ju2gIX8XwR4kroGJDTt52wCaRCIUUbH
         MXuMDu6CHXsjcg9R4yjF1CiIE56cHG7SFURoz3zlp0/dxtCU80v/YnkMUIgVgYzHhjtk
         SdkAGevJi6n/ESbALZ4qAaZI2gColq7XcxYZrnDhSW7cDWW6tOCazeBLQX2xIztRN+Ya
         EYWx2wreblwLJot3fCtf6qUCgbfiyYEabEFRthi247io5Ln1vfvccMJCR9xdjCaNSUij
         PuGoORyec++zbe39xJZyuiIFar7dIqI+r5MZo+ujHzmkjwirWvtk7A+0eDo5hVw0d4g5
         3JMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784721020; x=1785325820; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ftngr6uIQGGwpB63XFYD2rUJOFykaHdNqhOYri/BMvc=;
        b=OK9Mtndn0VeDCviteB5RG2shrbO5SS0lADWPd+aTOp4OA6jaFdgXR76LxvdOEsu0KO
         1idBbcNd+iyo8l2b7WL/pECNoo1WCrQ/TYcQvVoDfFv5v55T7my2/ufiOU0R+05unrYy
         fP/OYf1EWHZDQ0j6TU/rOBU4lQLy7HA0e0pwf4ky4aScdZk3zVnqRretPwdiWlgjhf76
         UlrAiv9fKOMhji6Kn9b6oALWtJHAjJeV/1GujxxLXM16QgSLhve4ANVfL3mMmKI46F7c
         OenPnjBq9i5jk7M6EN2QcWdcYm9INzsaQExm20lIRsGYrAxGV5l/r0NsH8hYfy0d7tkJ
         Qgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784721020; x=1785325820;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ftngr6uIQGGwpB63XFYD2rUJOFykaHdNqhOYri/BMvc=;
        b=dmumXUGQtVC6dOOiN9Yf64imK9+b7wylOSrCZj/knNKTEqTtwsSXDLBTI2D/URq0Lj
         V8h3U9AFood25lN0QgjR08tpGbYfA181pYsBpre/14Qb6ThKkPZW8W9b4g2PGZrOArls
         xzdx+x1VYi9SBDElm3lfL+PJ1Khfpx29Mrjken4eZD7SvqBRVzHsgFJsqU5+RnmeOC/u
         VI4RXrWAzAgcd+xdYMmtorJVtfWxUjZFwDcqpMaDgCiwcELt8XTmDSLczCrr5H3QZqYf
         uLs1EhjxErRyFU8Pp9NZW7lvJf4Ve0T/ldDC+Xz/UzNBhcZn5h8731UrP2r+BSEcSPq6
         einw==
X-Forwarded-Encrypted: i=1; AHgh+RoJhsUhGAutMCW9VDQ9qDWi9ahMWaaQEH5LCZn5igbI+jf8ohdTrotuHBiusKJrEdnruOWT4CuB1RzpNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhjpPCPwu7m3sbXNle4kxrzOuwSlZuarhM6uxZEOceg/OGXDx8
	LeUGRqFJGfFM+A6tlVb+aHCLuUEpyJNKs4XthmULyVf890Ko89yQa4kRBSn+uTQ4Xq2tDWPxVYI
	P42PPj86MoyaMMVOGJkmG5zkj4UGBLbU=
X-Gm-Gg: AR+sD10aarL+Ig0f4jMXldorpP/Vumg394Agr/X94FlNeR7ijWo8fVUXRgXnHTxMbDl
	q5MkOTYEB+T8AnvM+BhfatdGCt7FMPxi7WutukFzaR7k21m5YKEhpcbqaFbOpJfabWDdHvoHfrQ
	k9yBGPfJhN6qgPNxGsuouPWqTSi4FeGCvFccFDtHH7q9YjqG2gL36KNc7jlZysJPKtv64udQdNf
	zONmFt9xpxmsw0ma62hahX/UEDn1lEdPYxB+VG2g1SnRJcJbHv/wDqzMf0ujzVADlGXUdMBFHt5
	oCt7W2P9tUrRjtvw
X-Received: by 2002:a17:903:3c6d:b0:2cf:9c35:82d9 with SMTP id
 d9443c01a7336-2cf9c358a44mr8759895ad.10.1784721020533; Wed, 22 Jul 2026
 04:50:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622005613.21870-1-phucduc.bui@gmail.com> <CAABR9nG6BL+-urEg0qDzJHYmowm7O=du_0T4+K2ogdrcD30CXA@mail.gmail.com>
 <CAABR9nF8GebpxX0ry-MMLCfsyPJ6EUpkEtYdASAep2jX+d5gnw@mail.gmail.com> <xrl5n7J2R2GNQC1ABA20Mw@collabora.com>
In-Reply-To: <xrl5n7J2R2GNQC1ABA20Mw@collabora.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 22 Jul 2026 18:50:08 +0700
X-Gm-Features: AUfX_mzEis5-yMHxueiT7BVXSfRPH7RVBNtfS-uZsE6HjdS-QePUSBci-Ql7jW4
Message-ID: <CAABR9nEbm2UdqdE6hCrW0RJOqp26=A8CPPSfCTxDHy7=zx_jFw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rockchip: rockchip_sai: Hand over hclk control
 exclusively to Runtime PM
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Nicolas,

Thanks for confirming and for the detailed feedback.

> > Regarding the case where PM configuration is not enabled, with the old
> > source code, I suspect there is an unbalanced clk_disable_unprepare()
> > call on hclk when the driver is unbound after a successful probe under
> > CONFIG_PM=n.
>
> If "old source code" refers to what's currently in the tree with the
> devm_clk_get_enabled, then yes. There's the manual resume function
> call which isn't balanced.
>
> I think your follow-up patch does make sense in light of that.
>

> > I noticed that Nicolas tested and ACKed the use of devm_clk_get_enabled(),
> > so I'm not sure whether that testing included the CONFIG_PM=n configuration.
>
> Nope, I basically never build with PM/RPM disabled.
>

> > > You are right, pm_runtime_get_noresume() doesn't set RPM_ACTIVE. I
> > > think we need to add
> > > pm_runtime_set_active() before pm_runtime_enable(). Otherwise, with CONFIG_PM,
> > > the pm_runtime_put() at the end of probe() might skip the suspend,
> > > since the core still considers
> > > the device suspended .
>
> Agreed, this needs fixing. That is an odd behaviour of the PM API.
>

I'll update the commit message accordingly and include the runtime PM state fix
in the next revision.

Best regards,
Phuc
