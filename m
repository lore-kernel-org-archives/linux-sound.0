Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D3D54B1DA
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 16:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792081707; cv=pass; b=izXTqU3T6dnikBOArwXBrmpiHhvFWk0ZDwdyjeQEbvcE9sIYn4SNQ9Azi5e30nSRauDPhjVCUo9+GANyy3zNsbbUTvlk+TZcQSeXMpRFygA2iHyGaYvoO960bDZ6LinlghRGbPKaMJPxbex2zU88zg9VI+eKBhbdj9O+LW+fM+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792081707; c=relaxed/simple;
	bh=vgjMkfB5AFxaee5+Kwz2qMYoZ0igEfUvX5a78hOyGF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cP29dM9mFy3lIIb81/AQu1XDXziRBzgzXW/9tlTDHw+cxk3taCNUFKPkqEHg6g/aKD5SBSNFlP0zoSqsXrpjnULWUfrPxxTueBxNP7adTpxyVgr3sQpNs8AaGuiF2zLcXyITIp2lp/Tqk8vXJ7f15YBe4OmWoWz24kmsFB97QvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n6hJA2MR; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n6hJA2MR"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-675617e81f9so5995882d50.3
        for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 09:28:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792081694; cv=none;
        d=google.com; s=arc-20260327;
        b=RbHZ5X0Oy14GI3uU9dPNqb/oUQcHgbjXEmMooPKvwcxj1NzjoWXr36Dn2gE/5AJDnY
         RX/28p1tXNcUzXvFWWrDwYcFXJrmurGLxBZyAolj8JWr5iUDJylNJGAPPzt0tJg9kL3N
         RKnWGH7IeSr1kZvZSJtPO/BwwFDcRDW4ieJwwAO/OGDaeBf6FmkZ6s+UNxjW//ltbF/l
         6YB1rbvPeq/fdWfVLD4ahC0rV1Wzkktl/uZDQ6JjrxjKslADhgZwHOh0TwAWh5l8xw8p
         3E2lHuBuztzr4Z0xLcLoeuxdOc4d1VssI9B91jXLUs/nfTaUU1qzzVfU0/CAdyK4SR/n
         Xskg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n2BZinCZ54N7UvTW1neOvwJj3/H4yG3CbAwjf384cj0=;
        fh=qzKAFZt6Lwhhoz659q0J4fqpe1EHJwpshCpa4tWUags=;
        b=XzoGGu6D4q7/ZQKuoELqBXdQAhihlNzMqTjeLfis4lIgmYakDkvb5uMpdL2BxWexEj
         yqRw0ifpNdWmOdRv8xSLNjJndO5/rmzE9Hyl6tPR13jTMtH7jycovXU+iRXKZ+KAJhHb
         WsCUTtoqIlqN4P7IDnID61m9UWaFBpxdl/B8S7DfN3qn7usMEyECMt4wLVXLwhVNZy0e
         Hb3gHo3qYlPTGav3kdsZ86VKawEaPEZsIdYqb+F8Ft2bRBYEPOseazlWg7pGzalRGVxq
         nTHpdgGMJWVSR3TYMVPBILTGCqhoJEhUyhZycu4hcybioHTHpI1L3Lr4r0JtYl+4ZwgL
         rsyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792081694; x=1792686494; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2BZinCZ54N7UvTW1neOvwJj3/H4yG3CbAwjf384cj0=;
        b=n6hJA2MR2RM9TRYvvc6KZz42TP/2t+clfAo45Yrchi4hcWjnvW93s3viU+Q5i8C933
         kylZxWrdI2GDr8/8MYRi641o9JEcVPGbQw63MaEGN9sHNh5ROnC8PbHhT3OpavEW6rO6
         kKusnchev8eeL07HDcckInZyoH046jljLUSEzoyc2ncfVp95sUjIHS8NDMYImTNDVVJJ
         JbbbFZKHv84Id+ni9Ja5Dfa5sgbk87SmSw1YTyWBrb1WfbT6iWU5qdDF7VwwF6q7LTHo
         R5bL2e6EkuDvy32h1JftWFIn9GaROwuGv8Qo1kWm7uBwGGEDAr/i2xzVxYrY7GyNvNu8
         mlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792081694; x=1792686494;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n2BZinCZ54N7UvTW1neOvwJj3/H4yG3CbAwjf384cj0=;
        b=2JSNChhr/SWavrIamQjHm9uEz8vv6vHmg+GDjrsicUKTES9Bk7RV3/f+3Cj0ns4S/0
         /Ib9xHAXu7r+AsQzlUOWFBddaujRrt60NfhesI4LSFG/nbztDkmgohsBzrx4jVM9vufP
         wRJCLYbCiHEG5H0FzxupbLPhaumiV+l7ETTpIspl9RM4g5l44efRaAUY5UQ5JCmMnZTW
         FRO+WNzd2G7Kf5PovNLz83jq3o5gqoesCH5X7FnF43t0oREBjHYvFQNDZo6/auB6Fq5C
         2ic4ycux4hOXQvGlS6SQlIhlmwhQcYojVSDPSxZk+5kyZ+lhobpCCEZjqnwVeVKrSdKH
         u0Hg==
X-Forwarded-Encrypted: i=1; AKwUvBz2E2WvqjnmuKgqME50HGh/4eqPabEqAQFGfkOGlbzereI721KCMKXvIWC+CmYnQTojxkct6bHWqfob2A==@vger.kernel.org
X-Gm-Message-State: AFq9FYKDe8DjaLvWPD/so1YBa1UOFa/UjF3SiUjX8YGI2wTsKIUzohTK
	bDbwox+Fp6vybz2TvEinPAItOtl3mDGfyZ3VGrWHwGzUIS02nSvneuKLu5hYqTZOJ6eJNtJxgt2
	QaoEE/rH8+YHBPq92+L6e0Uy4zwawzSo=
X-Gm-Gg: AYBFou3YYiBuIC25KqjrziImNR5mU78nnDc1EyaKzVeBN8lGB/deZzmV3cJ+3QyFswW
	Glcg3cOzIns9ls1Txc0WMeodkeDPc+9QMmJFhYe9oSoi59pviFql4VgQr/pA1+MZU22h+9juEW7
	jVWNxZJdAViwfInwlTOXV2ZyVtpXOp4Ruaw9QJyFcZ/W44aU/tj1r/IeihRlBSk3HFciRqbWa64
	RdC/WzHa4Zy6YcuLw4H+nXfw5PrU7Xm7Pmha8Ux2EMvTLdFTzkXP9Vy7n1oeQzk2U48QF0ALCqS
	pg/LORRO8p71+BEGILmNl82cKPFMCfAKaFnF40h8pIq5/RvDyuoFcwUuYg==
X-Received: by 2002:a05:690c:e3cd:b0:8b0:ad62:19aa with SMTP id
 00721157ae682-8b0ad6230f0mr43580797b3.33.1792081693632; Thu, 15 Oct 2026
 09:28:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-9c80f858ccc13b3de84d-v7-fcd8c7aa0e837bf0b036@gmail.com>
 <87zewgcuhy.wl-tiwai@suse.de> <CAFRLqsX6Yz2dv_dV4BvV6_F-16WDWYTAk5ikC9WY7ZySkoJKUQ@mail.gmail.com>
 <87qzhrmnz3.wl-tiwai@suse.de> <CAFRLqsUY+RhE=CsMHAvcQtUmwE_hd4_WUhJKSJiwdUUE3a--Yg@mail.gmail.com>
 <87h5in6io5.wl-tiwai@suse.de>
In-Reply-To: <87h5in6io5.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Fri, 16 Oct 2026 00:28:02 +0800
X-Gm-Features: AclHuK-KzJZ7iZD0Ep4aQoIUqULBhdU-oUSqsjVTblhrNorNiC7ItfIWaHV51BI
Message-ID: <CAFRLqsWAkovmWbd9pf0hbTq=DRZOxK=W0JV0bo0K=L9g0f2zkQ@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: pcm: Unlink substreams before releasing them
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, phucduc.bui@gmail.com, 
	cezary.rojewski@intel.com, cassiogabrielcontato@gmail.com, 
	kees+treewide@kernel.org, yilinzhang@moonshot.ai, sammiee5311@gmail.com, 
	kees@kernel.org, thomas.weissschuh@linutronix.de, tglx@kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Takashi,

>
> Yes, and it's covered by another patch:
>   https://lore.kernel.org/20261015112256.3902-1-tiwai@suse.de
>
>
> thanks,
>
> Takashi

Sorry for missing that. That patch looks good to me. Feel free to add:

Reviewed-by: Cen Zhang <zzzccc427@gmail.com>

Best regards,
Cen Zhang
