Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB1B50276
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 04:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779769063; cv=pass; b=rKqReu2ScEmaNw31er+7tsfA2vMI1VEwKjoj5jw9xBdL+2Kn2kHtKD1/o+S+D5sGA6GZEWcmXtkuFJYL+8wWrJKdJia6yWHcSDK2MwVEEjA2r+eSKZQhI9ej9ba/pFgDIzlP/y3ce2oatRQvdVvmReOD8nNwnAGYTZ8k+aWzHl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779769063; c=relaxed/simple;
	bh=AjzT+YU+WzbbKcxJRdWZ4am57GNWqPjoWyeRr7PJJSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vfzu7WuP5M4Yg2epqYkb1GM0ElKjA5T9VGzI+goyBqvWnQ73+brpKvVq1aWrukQNsBj+LHl+cQenVtbr6zYLGJ79h32/c1+pvbBJAuOc8zer9qOcLTMWtPTNhupEUlmMLkgzmU3Ivbqstq0FDHSvjj+fEbkKY/nwNwt+P57dEuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cS1GAGlX; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cS1GAGlX"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36a8ee1e28cso2611857a91.0
        for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 21:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779769058; cv=none;
        d=google.com; s=arc-20240605;
        b=LUvcAOq73Ogln6dqGDGczG0lL8dRoDZFGHkAJ3lzOz9/IUMo4aBP2gnC0kwOeMBkP8
         cIEl9CgEBPSrw8adj1eu55KjJ1ygmEinPrGTiPEEURO8uN0RA+T1zpmdtmx4Zesm01YE
         UAkaFvBCcD0ZCRUn/1C2MI+GDJhZjwSEt1aG4dEwdGpIc7TZsEWPZF0MW3r02GRg/m29
         W/vdslfW1mDMYnjxzU9n2T+HTJZgK2HyDO/IzPryz3B5GGukLNQC2i+HQ7oWImKKLy/8
         NptjVRq2QM3iIpSbR4eQqg8l88j896HbMJQqrJu0Q5qJVEBchlwithfcHZrz3C+Okd0l
         E4Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AjzT+YU+WzbbKcxJRdWZ4am57GNWqPjoWyeRr7PJJSQ=;
        fh=quN1NLhTW21WWGf+3tRBCv/5Qx8/EUFMWDvRu9UasAo=;
        b=M43CpLytufBYrZVMfUxrBc1Oo7S7d/8Z/air+1EZtWB4sYIz5yGLR37twv1zV8jcV+
         Ruz3TZKUueYyq5vTPyp3inoa703qIG1yz5NEfGCZe/RKpubd1nEZ0lVzqKHePtvJ5kd2
         hd8JocJVfvJ7WiBOttCuwK1A/yUOn3J3xWcESld2qomi6QD4PqFQB5SzL0v2+ILUCHlT
         ky+YrKhdZdTngmiZ/1/3Iz6Eyk9uxqIcg8cxrafodC0ZQqEze9rwh5n+o1ooFpelGSMo
         9nOuWN9WV005VwqqM5c+TT9l2JQTZ+aR+WssH8X/zK9dzy9XLkrUeCcGeN8m9NkM2Ao3
         u/5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779769058; x=1780373858; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AjzT+YU+WzbbKcxJRdWZ4am57GNWqPjoWyeRr7PJJSQ=;
        b=cS1GAGlX5j3k38WLJOZdmmMYA5DC1DrGMDIgxn8L4laSSlZGZQSzx+h3ofmQGPkK5Y
         +tJMrMtl7Fx/2WLxZ0QSuY2JTY7QUoUfu5TJ+2ou/PLOJCA9pIvdu1GE+lXKX0AF3svT
         FSKx93xBN1ygCF4SYvTW0V1SS0G00+fN4PZUIv2rNFuYlLKYibxSQinRShN26E5BYMKx
         aeab6iEjkaMAmzEPLyv0NQtD47REmtYksLQoJ5ispOflRWQKQsk887id9cySMYMBiL03
         SplWeazeQ5e6dRZmOJVtBM4fwHs8cUs39hBYyOQFR9RFWubaXGvoESA6mSoUKjmIFwv1
         BUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779769058; x=1780373858;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjzT+YU+WzbbKcxJRdWZ4am57GNWqPjoWyeRr7PJJSQ=;
        b=ObLm0xetvEoOOFTf2vdhf3yLVLjSZAFIqDYVK3qX554Ram+Or5jQr+sPQmqQfDSFEG
         TxfxMn/G5u23zMwcYuyxvMir/udTc4kpefzVG9F1Q61dcF26wpnct4jh3SBmuEKR18Z0
         pCiB0HeGATILrxaXn2R2pB4P4hpRjxUA4pMrmMsst5vRxGdFgynSXiKEJ7iedGwYTcLF
         VpjP8PfQuJWikaDA4cDInjBD8j5tGMxDJVzV9w3+A3EWyO7dEsALr1UxSneDSM/kiJiK
         M1ZkJXOTwdDLh/5DZVhCE/DFNzJXg54QJoTIIULaN6525Nw2SUYt4EKznvUhHh5/C2DK
         G/eA==
X-Forwarded-Encrypted: i=1; AFNElJ+S9hUNB9ZngJXwOW0aP64HFBlbISgLcG8EJwCbVhcDs5hmcd3ga0ihQicc2C1o1jmxxoy6xmktUIoNLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzU9bQ2RvTHPvgZnY6rxizRkt/5HLtTrS3w089C40TFRgIstsDd
	qM3OOSVAiKuf5nzOdwqqk57TwqZaBhmWNCdOOdElnwgig+g4r7z8muQWbZ5njjhD+xDvpB7pkyt
	VZ/k6ktGACNQ8Q57Eku+hq1CHp4dCNMw=
X-Gm-Gg: Acq92OGA4MvQQ6xZab6rp7MJUPAIkSzDm3AeKkCu/giBLneKf/W327w5/lLzXCq3cF6
	L9Ss6jPO0o/fDBTWmySPHsschPtk9JrZ3lEWHc/X7SUs8yCu5Hv0Q1+g5KlxmTNBzSTXKxuG0d6
	olTnIPs4PgzIweP/F9V/JQlXCuE7bbhafI803odfGlcQMCIFtvu5mUIOeHP5+4U3htPrV2MrBh8
	mCRf7HevFEwWwuoy9dp+fIxhp9GRW81oGHI+00Rmo/rMWd2+vYI5cyXGq48oBxSJz98vut6hGs7
	JqKnnrortRf0oV70qOUJMxIUsQCI+r1NsxIVPlAK9aHT8UaI
X-Received: by 2002:a17:902:ef11:b0:2bd:d7b5:83ed with SMTP id
 d9443c01a7336-2beb07001camr199500955ad.39.1779769058465; Mon, 25 May 2026
 21:17:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522095401.72915-1-phucduc.bui@gmail.com> <20260522095401.72915-4-phucduc.bui@gmail.com>
 <CAGb2v67aXgg8BmrtVVBi+_n32OBcQnQgEUe3XdRp6Jj=aEr8fg@mail.gmail.com>
 <CAABR9nEFGOX5GnQ9qpJY-T-92dA_kDcVS+qBz1ior590G_x6gw@mail.gmail.com>
 <CAGb2v66accoNhStHGhnoUM0cw3fyCxfuvS1a-brL9C-ZO07ChQ@mail.gmail.com> <CAGb2v644whCr6pRSfGMuQ=5afUMbfC2Y3W_kjdMdp9+5+kJhJA@mail.gmail.com>
In-Reply-To: <CAGb2v644whCr6pRSfGMuQ=5afUMbfC2Y3W_kjdMdp9+5+kJhJA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 26 May 2026 11:17:27 +0700
X-Gm-Features: AVHnY4KjIHp6k8PI6oQzPKSFMzC_yNK4NVye8enq3FNJPQ2UT-iy1gcG4S--peY
Message-ID: <CAABR9nHbwNheKRSzevSBnD+YyLeYVDA4FLH9AN8Fo1uX596rSQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence
To: wens@kernel.org
Cc: broonie@kernel.org, codekipper@gmail.com, jernej.skrabec@gmail.com, 
	lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, nichen@iscas.ac.cn, perex@perex.cz, 
	samuel@sholland.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hi Chen-yu,

> Oh, and you could also add that the resume order should (normally) be
> the reverse of the suspend order.

Thank you for the feedback and clarification.

I can certainly rewrite the commit message around the idea that the
resume ordering should normally mirror the suspend ordering.

However, I am still slightly unsure about which ordering should be
considered the preferred one in this case. If the reasoning is purely
based on suspend/resume symmetry, I wonder if changing the suspend
path itself to disable the APB clock before the SPDIF module clock
would be an option, which would then naturally lead to enabling the
SPDIF module clock first during resume.

From the hardware perspective, I originally assumed the APB clock acts
as the prerequisite for register access while the module clock mainly
drives the functional audio logic, which is why the "bus before module"
ordering initially seemed more intuitive to me.

So I would like to better understand which ordering is considered the
preferred model for the Sunxi audio blocks here: preserving the existing
suspend/resume symmetry, or enforcing the bus/module dependency ordering.

Thanks,
Phuc
