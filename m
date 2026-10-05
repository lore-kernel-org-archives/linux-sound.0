Received: from mail-pz2-f36.google.com (mail-pz2-f36.google.com [74.125.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8FB41F5D1
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 09:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193015; cv=pass; b=gAvG3EXSeRsVkYs8dq7Wz7yD7aLjDDEvQ38a4kXIfbJIIYETePvxgUReFt2oiwN7prZFaDsI/9xK9nrPk7BjcmSf1582ooOOtbMyjog9kSNPKfmj7lilGMPvOPbGqdXrrBqtsZE65bpYmGYirY4VqfJBl4XtjIUxSQ39NsMikgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193015; c=relaxed/simple;
	bh=ALY8PRLZB7eYZm4BgZsEwueCWb0wgVU/gIyTN+rhhkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iSRNEO2UCYoSj7ncLwPbUgDQ3SLgY21K5hHRuWkGJnoQRZXbsC8SP/bENKDnL1aE6ykmWMKlwA81z4XSdpQF5zchdZ0LovaB572AM6G2sbWRnsoICxDBhCbk5yAJ3OPG2wXCrR4yNgnvXyZRoX65HliS8Lzvp7MgRh47Ai5YFX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rF8yAsmW; arc=pass smtp.client-ip=74.125.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rF8yAsmW"
Received: by mail-pz2-f36.google.com with SMTP id d2e1a72fcca58-88a0f29ce98so654155b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 05 Oct 2026 02:36:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791193009; cv=none;
        d=google.com; s=arc-20260327;
        b=mVw/qT5qwz63ReaZ4wGdq/r8RKDP+58/GOx4nuUlTDxyRygtk5CF6RfMrJAJ7ZTtZw
         UT8Yg9MKeOS1BLjkyPiflPl9HclFoNkWxINhbWjX5/r6pfD6BuwXLb7dW5CcE1yjMAnL
         viOdAiy4Sizf6SHUPG8cL8TIAsBsApvn30tpUhEGtzUsVs9VYXpNcgJWH+skL3JQE7ek
         eH6Chzgcqe1ykmlQsLnH4fWfDzmLb2SgW9/OU222nD3GL1hxt4Qo06u2tlwNvBkBIPR+
         XunwMrru5CTl32/TKxeZR/zCnkdAlriXG+rKJk0ZH52xQcddk8M8J/GU1mADok4QIK3X
         g3qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ALY8PRLZB7eYZm4BgZsEwueCWb0wgVU/gIyTN+rhhkE=;
        fh=An/4MuIeZBPl7Yt0cszoSWXwjCMT+m9sOLKWqmwca9c=;
        b=GTdfNc9FyGfaiq/ODXaxaJnZTa254RRneKNEcV8WdbXSc06IwJraQY9f6c4bcm+u4D
         PObNvZXthR4kfdtjvtfaVeet4+fwqwnVz5NpaXZ51Dr1D3MxDHSlM9nEdB+L25kjW+5E
         bAq1TIkz3lVi1bpVSjh5hrchUcwmu4QbMo1XckBXXT2cvAaGxgh6VEzjjCTUcCGoKc13
         vYrGoLhVH8JAjvGYaBCraVN+LlsU6OAJpHGw0p9gZj6O8VDAzv08ohKW1f8lV/Eycyeg
         7KTxLC3t4elNuMOwYphXsB4iyrRIesmQTlIx155NgDkZyKz8QglErrCKm0CmpH9gi7EP
         3Xsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791193009; x=1791797809; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALY8PRLZB7eYZm4BgZsEwueCWb0wgVU/gIyTN+rhhkE=;
        b=rF8yAsmW5VZM3zbBrA58w8NnuCXRjwO12yMmZ1bPqbBWLNpujUFrrx60abMf2ynIQe
         SAAkpG5F6xoBv5ah0gC7XrLjnMtqHlf0WL7U0GuWrukvE3pHIAk01NlOe4WlZADUkj+u
         h/wfE+9AV0mpGcxO3pMeFdC+1kpWYZB/Xe9OiGw6894ct/M/gup3Z/vhKbnbZeZBX4Gv
         ldr1nQNsG9W1+DJNCNfw0rVTAhppt0dnnSCd2y5WrMN6+/LFXXetjVlDoToL7Wb4EADD
         xQ2FXr4I+e8nL8IWp4EqQdTI8GeVZKD/eKYtWtRHBxk8iFQWMBGbES7ciao/uojzo3et
         0B1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193009; x=1791797809;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ALY8PRLZB7eYZm4BgZsEwueCWb0wgVU/gIyTN+rhhkE=;
        b=D7aWonhfzLLFcpz/56E+UEdfu2Co2khOC9E8884SA222PCRF8gMq6y7lwU1oYYEj4U
         89zfpU1AFcSeVV+jQbE3h9swuE8Qz+5Dpcwfs7HLEid5FGOXVxZzsDEZOTjWanXv6UgW
         fX2cJZ2nR524aYXyEFIFmtD5/BIQvyxT4Iwyirufha9a7owQ7gWvgfFqpskOBGCB3XFE
         sVlxGQ/3peDOx1QiMpCD8t1t2kz1Mwd81ttGfZuYhlUPAXhJk/bTc/Cpf+bLDRoLWEXy
         JUTbP4xdDR/bKCsukPCe6XFlNd3hG+wD2iBxtEJxq1Muj5s7G47J5zwqjIiSS9Y2GcYn
         YSlg==
X-Forwarded-Encrypted: i=1; AKwUvBxX98U5nyjoEcwiuaZGTvf+w7fTU8NfZjeTCUqGLgH4ApiaazgsSfcj9Sz1ZoW0f11gG1cjJL1qYyT3Dw==@vger.kernel.org
X-Gm-Message-State: AFuF++kiyPa+7imE2LydK6DtU3MW8jSSPeWvp2jriK/yJoxaIpT7OCth
	m1i7yAoMYvkXNQBhwPfaPZR7KoIDsFhdeC7qyCuZiQ0t0IQjoieEoAAfhrjjXYmtn+E9nIpQlWI
	LcOSJ9+1SU8YaWJUS1FACNkcBbeyiSmI=
X-Gm-Gg: AYBFou0KGOh5/1BL8c98UJBSF2ECgqrJaVckBCxpRxgtWTLmfGtl1rX6Q0O/DhOzl83
	UTxs9MOZYktUK28N5h3ljX6WU/zMjojdD5JAFtLJcmog2XoeRo26Q8q1HaTEbZh3+O7PPK0vEUt
	3Hei40Bb4Czx6Ono6zsffYNdo23lnGWiqISi/RrUQQF1Z+w50pNjH8RfADc9GQmoR27XiSHsikn
	jgdt5kny/3s++dCsBbcOrivxLW23QfXLWIzyHkE6nR9jjwb7voyd+mWBPxo+au7OC3z6JvjPxXe
	TP4tE0Dl+rilRW6FfgsYXMtnHlq9w8b5VnJvIQBoNXPFIccSrx3/HYeaBGKoCn7d6e8PkJ7e/b3
	kO+j3gkyLPoC5Ohiz3z0yPoRMI80tt06nOgDpaM/h4kqp7CpB7DJd/Cux1foEmu2sHy8=
X-Received: by 2002:a05:6a20:ad98:b0:3dd:a196:308f with SMTP id
 adf61e73a8af0-3e0bd41280fmr9275066637.63.1791193009054; Mon, 05 Oct 2026
 02:36:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
 <20260925044908.450775-7-phucduc.bui@gmail.com> <asKt42FgsbhSbQUP@sirena.org.uk>
 <CAABR9nFyEJBwXP=4SjuGNfGQJub2y_DPE87c6j6BPmqMBgjESA@mail.gmail.com> <asNbjSrPYVbeqSae@sirena.co.uk>
In-Reply-To: <asNbjSrPYVbeqSae@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 5 Oct 2026 16:36:37 +0700
X-Gm-Features: AclHuK8rGaIRVCf1BZigYTPKZbRcvBezN-u_N5cJZ31HBEOmlU5r-ZSIA4c-8uQ
Message-ID: <CAABR9nEXM1OSnV6L4=N1YCbtWn5yMNr+OMEZ4p8h3WMaQXbgmA@mail.gmail.com>
Subject: Re: [PATCH 06/14] ASoC: mediatek: mt8195: Fix FE startup error handling
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Haotian Zhang <vulab@iscas.ac.cn>, HariKrishna Sagala <hariconscious@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thank you for your feedback.

>
> > > This will return 1 if a new constraint is installed which is not a
> > > failure.
>
> > Do you mean snd_pcm_hw_constraint_integer() rather than
> > snd_pcm_hw_constraint_step()?
>
> Sorry, yes - Noticed it in the _fe_startup() that was called just
> before as you say and didn't specifically check that function.

Some MediaTek *_fe_startup() functions (mt8195, mt2701, mt8188) can
return a positive value on success, e.g. because they return the result
of snd_pcm_hw_constraint_integer(), which is 1 when it sets the integer
flag. Others, such as mt8186, return 0 on success. This looks
inconsistent.

On the core side, snd_soc_dai_startup() only treats ret == 0 as success:
it calls soc_dai_mark_push() only in that case.

Is a positive return from startup intentional/allowed?
If not, I can send a patch making the MediaTek startup functions return 0
on success.
If it is allowed, I can instead change snd_soc_dai_startup() to call
soc_dai_mark_push() when ret >= 0.

Best regards,
Phuc
