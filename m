Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6566A1DF75B
	for <linux-sound@vger.kernel.org>; Mon, 22 Jun 2026 01:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782090547; cv=pass; b=XPWU1s1schu5Ji6D/BbSUuRxjsJzJKJqH2QEJSY0XXdj92kry3rnN3ibcx9n393+uuRnXvg89G8UYh4iAGymZYiDj/FfghORIVB5aF9k8OSzl1avxmC+SrQ5p/1ebkgY/a8d6QJKwziBPLSapx+tG8LRBQzWpC83vFHgb3CbHtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782090547; c=relaxed/simple;
	bh=q9f8PIvMVF+hZapXjR2Pan8tM2MhsJBoGLqzWF0navE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q3M/10nQBTH7M1cQGUEfulpcanefa/26ErHuI0k35Wc4BGkN6xg3tgQRXm5Dvgzqi9Sq05xhJE/PmvpDpTFEMT20MHcAr0Weay2OhqxlMfFDuzeDgzUp0JF2Vok3rNOM9Vtp3Elo1ZnlI6Q6oloNHg/CSNjb9Y/QZFZyArB0j4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kE+E4JIL; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kE+E4JIL"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36dac5d5da0so1536371a91.2
        for <linux-sound@vger.kernel.org>; Sun, 21 Jun 2026 18:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782090545; cv=none;
        d=google.com; s=arc-20240605;
        b=UuPakVERzFA9huUdpfxuTPU3zclEPSyFBPHWqhfID2morJo+OIYc0QssoVbSBXq8EO
         VtMWK1vS3FiigsvASY1oU8CaKUqsGDJ+YqjtkSqmicUfnsSTabR2Z5VgYBoVuRKsgB9t
         kxC+adJ5K8m9+BZKAjB056YgeKNO7C9v4ruWiUZnscBLgkz0aLgQzMXvpQMoN2iI1mPN
         N8aIbvVtAQcBHaAI/mmOvvtLmBhB+P3wllTRcbmVykk0xZsYWyY6ayMH3Jut/uXTVTmO
         Ye+cU7We0vhv7W5MH4WqAZ6eo5xbshcOPY8R8lO7bR748uWyGD/5nMJ8x2oS4H0nUCv7
         scHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=q9f8PIvMVF+hZapXjR2Pan8tM2MhsJBoGLqzWF0navE=;
        fh=zyHHzvop1HhEqNiPoxigM97RVfM3sIi9LMIxjX7BNLU=;
        b=U6hDCaJkiwFxhcOCqCaVN86/CxahokWRDZ1KEvD5ElVeNqMg19LFCBNNp2w874Y4ca
         P10fnq0KPNNuRziwa/th5+rkWO+fA5tYUibPRFGl+jmQELgiHiPH/OmVFx18Bkw3sg1a
         fAx29+bOu9UnDb1P5AtYDl93fLuE5rX0tRjsdV3PBq4FUG7QPdGa2jhdDRX8hEAmHXSL
         3HJ5ft7+9psVm6NSQROytD/q2VSB354dHb+vZp6mOIzolC8sdtiyq323rmqnKfnrlXzj
         W24F/MnFvVa5BhmgZugMVbCI1RIAFgf9W+1ueNILI8M1ejNHMdK8GLu8BuQsX3KIP8Gi
         YwNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782090545; x=1782695345; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q9f8PIvMVF+hZapXjR2Pan8tM2MhsJBoGLqzWF0navE=;
        b=kE+E4JILxKsbTKGdDyIuXjq8t6TQFsVkoM5WKNdtsiJQBBHVwgJhHSLbjp3A2TdZiv
         tjwZ11C/4x0zcVj3RPNuvuwtFufd3XFNp2t5mHIp1AL0d8iGksiDK1cAo1gPjN7J5Jk5
         uLVG25n+JO06VFppPeUrJeatULOpW88AKnK0v1dIPywhB3Qi3AzNQrY2tMiurA0pRTht
         GBzFhsmD5FEKL4wVEEWkdhY6n5KLsZV+tNTaotpJtDF7sRS4oEZnkePHAZSm4DdKYpDc
         i7N29U2VJsvRymNPaACfBOlfBPKMyrIHEakc4UyPYvWzaMrpjDUyxiVs4BktaQkJh4j6
         rlzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782090545; x=1782695345;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9f8PIvMVF+hZapXjR2Pan8tM2MhsJBoGLqzWF0navE=;
        b=WNRIYIloOKI8NacpXbpJzRNmhzw+b9LNxAkskc3soglmfoKmoOeGwyumIQu9Ax7pAZ
         NPVL8A7mOf48KQdVZBsBt9nYbDGDcG2O4u4rSKVaDeTe7YXrfQ3tThpjZV0Ox8ZoT6tn
         pYiDm4Wb6aUW1z5WTGWATwP3jw1x0M2mbaW/jrWYjee7fzSm4Fmpvqs9ru4kXomjMk/p
         MqsMT5jYoDjgVgZciRNsHeJ8CdEzf1+FCJ7PP7AZnZGaYyOo/SyRt9RuQSlbA4cD+vKf
         LRriWfDVgsns55IDr9dxk/pnEJFOC/6Yr8GLCovHVGBPIDsXWTYoHROMSgf78Xf6lHNy
         H2mw==
X-Forwarded-Encrypted: i=1; AHgh+RqVvpIKzxRBHqibf8KNIVK8nq5x2BYv5NMOIPsuSxE4LUAGN5pbagQ7fq9b7DC6SqZl4NJ/xQM3el+0lQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YypiBGhkxnQAKhpK0g2uj/AWuCGWxQG9DcffFJb7qyjcLihfcNK
	JAdRLRWlVsFeGYWqCvwRhBp0bpBCHCpxeJXqyZDXhIdb1W7gY5JxbxRiI9br0xHwVSKQjTjvAO2
	QRSZoplhkQabnllOg8uOCqngaKllpmrQ=
X-Gm-Gg: AfdE7cmylB2Knxfe8DaFIWLZK0UQS5YMJZGVZTuYrS8sf1uxzXp+3AJVMSCded2bzcs
	AuPyF766wgIh13ASMXgjbRaYfEQ1k8cocrKsXuSSffRK78bX4TXZfW0oEJH7t1+7l+QafKssoCD
	PYRJwAPVlenP6aq1HQRa5vGwPnSrBHw24oHhHsICOFtbIFaSkg0tTL172Wy1jMsDWS2+k7aW6cR
	oA+D9ke7PnpF9xsbgddU+x4Szlr2SDczezishPrCmEREuw95OKFRYS+YSht59rF8OVpIuNFUrVQ
	f8bUeq7JM0jfxlDMn90Q60WUGRrAR0lT8dDo0A==
X-Received: by 2002:a17:903:4b2b:b0:2bf:2114:ecc2 with SMTP id
 d9443c01a7336-2c718f965c7mr131313365ad.35.1782090545565; Sun, 21 Jun 2026
 18:09:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604033554.96996-1-phucduc.bui@gmail.com> <mPIrpl-QRw6_Q9DZcTQ5xA@collabora.com>
 <CAABR9nGEHmy4YSqFSyh+gqXVwNgpaGOjqBeUZyHBmMibHwvMxA@mail.gmail.com>
 <D9b19fqJSQK5FO2BflNEKw@collabora.com> <CAABR9nEJg2R9dkGOrn9aZ_b=J7qMU06UKv+HcwdLmzckBoGL3Q@mail.gmail.com>
In-Reply-To: <CAABR9nEJg2R9dkGOrn9aZ_b=J7qMU06UKv+HcwdLmzckBoGL3Q@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 22 Jun 2026 08:08:53 +0700
X-Gm-Features: AVVi8CcmgoD8a-6Hq5plimGJij8Yn44KzsAgWV7isqS6VvBWdYzEzn5_4Mf-32s
Message-ID: <CAABR9nHBcfmdJu2=gT6iJ0efi9QtqKFC6gAt1rLJaUpyOmPzfQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ASoC: rockchip: Use guard() for spin locks
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>> If the patch worsens code legibility through excessive indentation and does
>> not make any functional changes, then I do not see the point of it.

I completely see your point. While on the subject of rockchip_sai, I've created
an additional patch focused on improving readability rather than just moving
lines around. Please let me know your thoughts in this direction.

https://lore.kernel.org/all/20260622005613.21870-1-phucduc.bui@gmail.com/

Best regards,
Phuc
