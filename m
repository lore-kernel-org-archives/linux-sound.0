Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3FC40244F
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 11:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785758339; cv=pass; b=ULDIz8CJdBtIhOzt9DZwge4g31zkvEiQZVPy2dichHfQty8E3Nl3cjQ5xduQOgS9MPJ3ZiVL0scN8oWHvG32ZvXVr2Xh9x7UBNyrb4JcYbYd1p4U0P/FD09J8oNzsbCwOPdz1MAiqG3LJCAiNTvh1/hUTIsCe6cq2E+FnIJVyVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785758339; c=relaxed/simple;
	bh=NbsHGjLcIhieFm37EnpTyWX92usDbmlvgxKxSyw86hQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nu1l6av9w4ZiWFOPrvwtiA2IwsMKoc3mOgwY4tV07kOJ9jPT4+dKWglj9tga39f21nGObnQXd4JLx+f1E+maE5GgkgVEaOoc7eNx/FhfMI8K7apvRTObJGxGpG61JiU1vOCwM5wbSetCBmOqda2mULllfga3Ru/c2X65bnU2SdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xfg2Bi4K; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xfg2Bi4K"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2caed617615so42309325ad.3
        for <linux-sound@vger.kernel.org>; Mon, 03 Aug 2026 04:58:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785758334; cv=none;
        d=google.com; s=arc-20260327;
        b=p9cbTe2uJLAmuWc/ECFWw8Xl7wiCtR0poG5HwDtsgW62mJEWzbzEb5iS+8qs9MT5dY
         8JiGc9RRfKWv2oO98q0cV5IGTygGPiH7YmjSx2j2k3BSMkgC6Uoch8xic8w26iM4Gw6m
         /TMxS9MIiJLslwLVqTdSgecmPFHxu5pT4J3k1tqTl8lIa7YvppU5cmfrhQsY2AyAHMsd
         Eakx/AnzsH7z4Em7YLuvNoE4jyXkzuF+FxCnwlJL2rIb8icJ/83UMJqrcA0FBTU7bETo
         zwcYhehy8ZSJ4DDP7UAOG6GYXpbs5nkAoERjse4RQEtoqFd46M7eEMCV4bOB+brP5u6v
         +DWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NbsHGjLcIhieFm37EnpTyWX92usDbmlvgxKxSyw86hQ=;
        fh=GZIeDYatAXZkZov1S/rApON1h5hCvx+iEsDci9k5IS0=;
        b=gfN3gSHkxRSxeutrAgL+vcTHaLQkDQTiWsrc39nxrJNhMrIMhLS2JgrWgBFJJ4bIrs
         +JRe3X95sVzLpASCS9rY/qp2ap5jHISdbVjnvKtkyDj9srWdjjkZZ1flIgHmvVY8CzsN
         bbkedW9qbrLRDdx0cw6WrPGMPMHRhW+fJD+DvE1eoH5a3aPOEr3bfF+7qppcxYcNa1oh
         jdSsLS2UxoPEfBUHHptL9g7Z6BOl8G9+xZmZgCy9siCDqAoJSWvyg7AWL81MjE+9tdlT
         suBU9TVNTqMOtlCpBuEk5buaY3rcSq4FWdXgz3iW2gbifpgVgV4Wr332Er/0gBWukWvs
         epxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785758334; x=1786363134; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NbsHGjLcIhieFm37EnpTyWX92usDbmlvgxKxSyw86hQ=;
        b=Xfg2Bi4K/pLHhbRqphSOOHYl1WWG3BDcq0FdqROoNykORXocrcAdJ9zdd2w4GZpuKm
         ggsQ1GNvCDf5zY1M0tWfYR9YR+1jxqQ7Q/NE4DG13FQ3pWHls9BigRlOB0B46kldu6v3
         eaR2qpHqNbxfxMWFoeZRgr1BqG8ahMjWG58rMpT09TF5ihcYeRcxaKi5gZbSDLVTrnGK
         5UynD8DMuEMvP3GHbovOjE3rW+iNZQLL+82vvXEeOzdMdsvUfCtW4Zg75u9VlkDu4lXA
         3h9darnv+bv6qfOrILLDTwDq++/Cx2Wrcv5YGx7iPOaWr+m8/7Bgo+Txraqy3KfPbR/X
         92Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785758334; x=1786363134;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NbsHGjLcIhieFm37EnpTyWX92usDbmlvgxKxSyw86hQ=;
        b=hIIO6IyDyUyqecjHieNk17VSY6U9mBzw1nt++yLc1bFgcQP7RaDfnO96DdgBddI9Ox
         6STPRt8XBjz7iqSRqxDny/VVyMoD2AoZdPlcivxuSk0cCCOhpLUFXfsnRStIbBSjg0TS
         r6PLthaHqd6JlrMgSMcOwjzpVVDb9bNDQCEczVkIhiheFtaxIykZt0NOicafYZw0AoJ9
         /AWLqWDOmBJIIaV6tDMg0u1XBEA4CjemEBBSRHWB0Hrwh/Hz4ZEVz2GlILVPrLkyl0Ms
         P8e9Dt+Wu9d9DjBtwcsTuPujmYkpPNMZhD5zfvoHnAALac9rHl427/Iic6ZnuK4idR1Q
         Ijjg==
X-Gm-Message-State: AOJu0YwtiQkG/yWbg+gExuj936LXd15dofXp4VO8xG4xmgJy1P3OCbtk
	bgdVWf7fVp/p06/AmrxWEqhKvPdaiXxjm6UGIyk+zDgrFOvBdMCfMn5bDcs2oW4bltcHWmO54sO
	TVqmoopstR0DAXgQDBZz4kqHtrpPq868=
X-Gm-Gg: AR+sD126a+c2WXJ1hp/mI+KbibnhW1GSCzerLbu8ROWtPE6rX+8v4KFnGZzthCAqpdf
	4N23WrP0ZnnEMWjcpCS1YloUKtpOki8cvnbzdUCZq2XR0rNTA3wf9Sr0ZMeHDtgpQDB8RUaEs2s
	Ik/26pTEPypBUv3vqhxGLloVQJV2DHG2360Yp9pzlsDLPvrYI17iL4IH5vKKebpwiXZFSbbQq12
	M5/BWyQIT/5mJbQI8PynpEJfBlBGQdTTNLecE8/gTMLX9nX27KfC8mbNP9BCknOQfgsMd2BpV8k
	KkAl5qUtdpeRP5Hsd9ATRYuMoWW8FBab8NmZ/QazmOTufzcNkUzVOZkNXH844BUq+QlBxVOmgQY
	6UKcQub9+OQ2fXIRcbXYXigaH4ABFpqBHlX8xwBbrcqUYaliAetYWcVVxMZQQS+zZDvkgUCZI0e
	RyIRFEOGzal7V92JQ=
X-Received: by 2002:a17:902:d54a:b0:2c6:a172:55a6 with SMTP id
 d9443c01a7336-2d0521bb453mr97416735ad.9.1785758334236; Mon, 03 Aug 2026
 04:58:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803102739.55569-1-phucduc.bui@gmail.com> <f7c2eafb-84c0-4c4d-a359-8c80ed989c24@intel.com>
In-Reply-To: <f7c2eafb-84c0-4c4d-a359-8c80ed989c24@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 3 Aug 2026 18:58:42 +0700
X-Gm-Features: AUfX_mwfSNNltVJ_PS1XgmCZ4NdU4cvd4OO04EdfBrw5qJDpld2pVriBoR_kew0
Message-ID: <CAABR9nHynGR4TjdpGW9-sjEC8p1x4D8omq8ouPR6E-3ifDhBqw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: core: add snd_BUG_ON() check in devm_snd_soc_register_card()
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Liam Girdwood <lgirdwood@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

Thank you for your review.

>
> Not sure whether we need such defenses. If we are to follow such
> approach, many ASoC-driver APIs require BUG_ON/WARN_ON() update.
>
> register_card() is typically called as a last step, once 'card' is
> already allocated. At the same time, the register_card() typically
> occurs in probe() context of given device so we're always certain the
> 'dev' is not NULL.
>
> TLDR: this is not a UAPI, (obvious) NULL-checks can be skipped.

I completely understand where you're coming from.
My thinking was that this function is referenced quite widely
(currently in 112 files).
Given how frequently it is used, I felt that adding a simple defensive
check here
could make the API a little more robust and help avoid potential
NULL pointer dereferences for both existing and future callers.

I wasn't suggesting that every ASoC API should be updated this way.
I was only thinking of APIs that are used very frequently, especially
those commonly called from probe paths.

Also, it's not always obvious to callers what assumptions a core API
relies on or
the context in which it is expected to be used.

That was simply the motivation behind this patch.

Best regards,
Phuc
