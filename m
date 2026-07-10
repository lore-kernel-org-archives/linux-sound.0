Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A786E35F170
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 02:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783651889; cv=pass; b=Ydj0XQfg6o58oO3U/TS26h5ZHoGWPLNfmVod0yvy5s9GKJY/YV2R5xL1j9T3t6lY/jGd1UWigv3EwU17lzbNjc0psvatLovbXsTz0D3XAz6x+yfPkBNvUoOPV7dBNfEeGgoxNtx6p+oOL1KL93i8Kl4zhw/OBZJRTQvS+FczPhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783651889; c=relaxed/simple;
	bh=TYJCNG2fDtW2YXlWLWreTWMZILERR+1xxW9UOGT1R7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DoZaNqkUSD94Jd17HghG9UMzZbm+6CmEGhMHCzZye2mke6jAGn8PlMg4RF9abSKToL6EsuBbPOrChFdmOTEOEPYVbKl3btoAURDJeGovJ7RnXczekV0FVYVUY+8Qy+EZIEjuV9GRv+3S7KUIou+faJzulrSJ0l8aqud51/GeaN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xd6coCSj; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xd6coCSj"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc6ae3e7f1so2487625ad.0
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 19:51:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783651887; cv=none;
        d=google.com; s=arc-20260327;
        b=h6CAD8vWsghmEgJh70nWcMCCj/oove1MJcWyaF4F31kgo1MJqYTiADAmrAPuB22Pxr
         Qi7Ol6U9/6UWSjjNlxrNH4q5SbI7gCFc3jYlK3wCrv6p4cOdpiO1neg3fHPOtMiAsvJK
         rTQqfO+MUMft9d5p1erPOKGIOGjysWNiP1mY8WFMFAaILVuf33NEvUxTddriTQvsbEQQ
         xyvhzr94ubqpRuOnCXjmJp3V9xXIiBq2YdSFPwLX2YmGPyEay+AZe4jUY4XZ6bWuQXjq
         TnnFcxEPv6eMnaysvJoj/9P3yUQmqD55/EdfP47HmKXNGj8dfslPSdlZ/3DZxhxxDYYb
         SM2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DXskAuXcmmsGe4Ohi8vT7q8qmXuhtnSBv8Z1pLImEOY=;
        fh=fyc+zmYGBkw+4YRf1eP+tiHh2MnBnS06HElWRkUcY3k=;
        b=gaVDf5G/rEmXRyTmug559zYSz/xR6xJBFm/XTGf3UPzhEPqm1Nw5Fk1f91HSO7BaSI
         WQ8Df801Wh3DJEFbWPB1Fqrxy2E8hBbvw28PsoEhb2l5M8xTeNPk7LHo5txrOFtzzOT9
         wnKothiG+l+9gaoZWLBe5SMDgWUy+a1rk4vEn/aVBtDdJU9KLq0hOMII6xuc/mRZ2Dil
         nvmDK0BlgZYGdUZkz+X5Ht48qwegQPTM/PgPbuuVqByj75RXfpaTM7ZoQ7Jd07lMEelR
         ErXO1wKs2Yp+7hTwlGlqcM2WIs4Rq1becd3goJlRbj6ktpQ2GQiwo++Ok3bqAPayZI0S
         I+bA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783651887; x=1784256687; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DXskAuXcmmsGe4Ohi8vT7q8qmXuhtnSBv8Z1pLImEOY=;
        b=Xd6coCSjAoJhwsi90Fpbf+ZDTlf6VNSWFjMIo1RCiqQq04UlaodjsZFUjo6A77Q576
         uCkbZwtoUyzq9Apvj3dNdOsfcuD+YhcKCiUS3YrVVshYgRVWp3sXvhzvRodmWPd6u7rF
         HdnbBC+8FIpQL8VbUwsIWfHUnPKTb9YXkwegXepCVc2/ThFKHFClcH12mJIXkTmALxPm
         UZA5hEfhBRyd0ZaxHWVs+nsvmKSSc851mRvHimyfnooRQNpWFhPMSbW0FrHLhTNlv6xk
         oGT37nAwcZ43YSQdKJzfmAQTtlq3QKMxiq0SiV0RnSAsTXc0AX9f0TWm3g0nBhgjT0T2
         dAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783651887; x=1784256687;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DXskAuXcmmsGe4Ohi8vT7q8qmXuhtnSBv8Z1pLImEOY=;
        b=VAHFK3FCdtlk0/KP9YtgG2+iZFV/3xI4V1ib26L6c95tL8OtFdGjZMwrFqaue1qcZA
         /YLk8t8cwQpn1er8jyWgKgKOSn5nxlhjO1mRlEMrMWciJbJ6G8Xwt7YQsiEYpsCmZTtz
         TVMqtSICoACAUjGslDDu9QthkETt/n7M6aFkW6BJcNuARgEI6iKffFelLWjvuWNZmM5/
         cJSkrrgwuK/3YxjGHwnV+JgFVOYAVRtScHFMUtl088EYRU0pqmayu879qOW5PFpkts1+
         5PjyAsQZux0BHhrdaoepxVd3VN3XjzWGmzOh75FcamAOh6OYFqTGW35WduE1k22N53FC
         AAmw==
X-Forwarded-Encrypted: i=1; AHgh+RoB64LwMeMlU+aTWijO28xWuZ9oZ2e2GbXMMBo5D+QUddPE39bCsTEig4Q95VhETM7gfP4UMmJ3XrTSsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTxP/IEXEsVYnz1pD+n3p8pa67YHaWGLljuDpNqrdXMYk0npDW
	avoNqQfR2MRj3s6MkdQ3IPeMqp0SPdFlv6/niCXwDPFIWYUOSwG667kurRZZ3B7jK3PrRwioIS6
	EPzpwPIAsLFLaMFuRBqXHVYA8ua0/Uto=
X-Gm-Gg: AfdE7ckaEYppG0oXVsM4/ryG7fQ0P0OBIx7Ixx/amlUDrZE411OEkGZJu76rzP9wip/
	k8JBoVHEi/QU3fSKvcH2IQiViKrnwZrWpe1AXOGDCUUnvS0DyRmrgf+UA68G2bp71t4HzBHFGwf
	0L/nOhHfmPFH37OLLXzBQTx3YvB3bVGfDMPlhCZTPCwvzHiW3JYX37eQ3LDLGsBJL6Gd3H+GWfB
	W5j6z04NwAv5GmhnPuntDsskWUKU/Nqhs/z9GBg+uY5K9qzJYc5xOSXSGAumjC/4zsWaUskOYTw
	8ztLd2UKD/ETGFuBVY2dbPOZpf0=
X-Received: by 2002:a17:903:15c7:b0:2c2:62ee:5a0d with SMTP id
 d9443c01a7336-2ccea365fd6mr97336635ad.14.1783651886934; Thu, 09 Jul 2026
 19:51:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706084950.49331-1-phucduc.bui@gmail.com> <20260706084950.49331-2-phucduc.bui@gmail.com>
 <ak-zMNq_gSa9g8nx@stanley.mountain>
In-Reply-To: <ak-zMNq_gSa9g8nx@stanley.mountain>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 10 Jul 2026 09:51:12 +0700
X-Gm-Features: AVVi8CdUaMjzS6XZN0gd8MVZuQs5R8O9zg-_iaKayLykr9CX_yy1X0NvQSJmWYw
Message-ID: <CAABR9nH5Kc0D6RLBSFcjt17b6mn5THJ_qS7JQz3Qwf1fu3oBOw@mail.gmail.com>
Subject: Re: [PATCH 1/6] ALSA: control: Return -ENODEV instead of -EFAULT in snd_ctl_open()
To: Dan Carpenter <error27@gmail.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, cassiogabrielcontato@gmail.com, 
	Kees Cook <kees@kernel.org>, Cen Zhang <zzzccc427@gmail.com>, Len Bao <len.bao@gmx.us>, 
	Mehul Rao <mehulrao@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

Thanks for the feedback.

>
> When you're sending email, then you always capitalize your name but
> when you're sending patches then you don't.  The Signed-off-by lines
> are supposed to be formal like signing a legal document.  So which
> ever way you sign off a legal document is fine...
>
> I normally don't capitalize my name on email because I guess at some
> point I decided it would be fun to disobey the rules.  But I do for
> patches.
>

Previously, Cezary also brought up this naming convention, and I shared
my perspective in this discussion:
https://lore.kernel.org/all/CAABR9nH6b8kSQt5w8vPGFiXGH3h+QDQdjKgsF-C3pa2hUh1Wiw@mail.gmail.com/

As far as I know, there is no strict kernel rule mandating capitalization in
the Signed-off-by line. In fact, our real-world signatures on paper are
often just undecipherable scribbles anyway.

Since it still represents my real name and identity, I would prefer to keep
it this way as long as it does not violate any official kernel rules.

By the way, I noticed that while most people use an email address containing
their actual name in the Signed-off-by line, yours is error27@gmail.com.
Is there an interesting story behind that?

Best regards,
Phuc
