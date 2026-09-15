Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2007A3A1CEA
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 10:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468823; cv=pass; b=kwmyeEZV5R89864EosHp3aoI8tg32Jm6N6JfeU/icJB17ntAXBNSMr05eU4myeBn9Qy5kJ6pzXL4hlHGvww1/JGWN/ABPxkHCUdu3O1A8mHSgZXpxY9bZ9bi+oZ6YZCo+/apuO6imQ8+uMwjsEDNrkgjXI95auT9pDK/Z6b9OCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468823; c=relaxed/simple;
	bh=1dPvPHlQ14j0yBmcnl+yP4L2b4M/3WUmrDKtwyEqswI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oMqRbH1aWAhrrdflOjqGqi0h1V3RwGJ9rzTk4uwzxO1XyeYjrULM+uWDR9bx09n6sU9I4rctR1QqNJ9H74Y6YdfDgPI7xKaaR8uwjq0IT+XRCq7+kyOflb8tfGQ5z2aD+46P2TuioIOcY+iqP8TN5B8eEn8zKibiQrZp6bKqxqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KVG5S1QK; arc=pass smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KVG5S1QK"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-86ec25cf7ecso752781b3a.1
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 03:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789468821; cv=none;
        d=google.com; s=arc-20260327;
        b=GIsJRmwASORSCojWkHB9bLWu+LL3mW59INc9AiF9tDn607BN83fFhK39+9y5Vf6bJW
         iRrwuI/zK9Ea1ACMJjioXEzhGxjlIO91pTH85P+CKeQtGTR9TTJUt44Ou+QyZoUGXpUw
         NqFikZqxualxPH/5BpXNnxT6zSeYYMGcrwv1G5UXDZfMghejd3NSLfCs3Cc2HAwNUEMW
         n/pMm4K8qtC31Olzytt5z2UB0br6bDiEiotLNyaCCjSqDIAoUMs+ZdzyLHHYE+ASGlgV
         /UmWse6oyvqosAXISHrNW80FFFboLgyElAcXqlBNbVnltaY3Z3ymUxWyzrpav+ZZbMxE
         4WfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WT2qHqDaqkWnFf8saA6OrL4B3kEyzcKEnsDM7DTCKVc=;
        fh=OekKhrHb2jp/mqm51V6FgXnn2vBc1eqykDvDAYwuYnE=;
        b=rXVOXqAAYhasgilmYOYEihXH/3NSV2/GSkCV+xJ8okBvW6VrNyVwLOMMxZh4zCbCdF
         GYuWMF+DB/2fYMcXtFWZjAlblayKBcqVnBLCp+ONR5YrErUKa5MwXvjYsM+co5g2bbIf
         KetigQyLKoPzpmPuJgIwK20HNxCXIzsOy+qPqpv7m5WLEUVh8FUTRJS2DkyuRlgcm7xB
         uzWLFrM2f48Xmfb4A1J+6q5BqMVpVAaswH9bF/JLNtPjyjpn2Pbv6A+0+xqTiRV1H+Rm
         UL1c9WJdV8BtIvHE2h4ru59D4bKleQJRcHPa4tY3ga8mA2YH8a/aE/ZGkczFMZDvzDgQ
         csJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789468821; x=1790073621; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WT2qHqDaqkWnFf8saA6OrL4B3kEyzcKEnsDM7DTCKVc=;
        b=KVG5S1QK86uTjPLi0yGWquWIxL014Sg6gIv6IgKSVCc8AUgN7QmD3L/xWgaeJd/ruI
         7m/z4XX4k+FCZGLAIt4HnRRFTwejwD45Fv9PD0ZIRkHHOP29AwuztpDGbCw4gCyusXCC
         fNytTUDKtm4a6ZbSSxPNGeN1GcuAL3a195dZGnkECWuhWoVE1Oz+S51vBC5HEPvKk3WE
         LB5SstkLUb0RhunJjIVl70GVHt2q6YJoVFhht7RBYsNbvFVz2v2JTz7OzQZRUxS29LB+
         r7RBDtQ3FJ6+dd4QndOXXXaZGMo6J82FQU0ZafCBXApGsR6xfowxAGulOXGon8OBSVsb
         pVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468821; x=1790073621;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WT2qHqDaqkWnFf8saA6OrL4B3kEyzcKEnsDM7DTCKVc=;
        b=n3UnmPmG1ksm/2gBUnyr6QS3GHMyV/bfo9flo9jLXOTdcHv+bK1xcG+IHNQfn5UAcq
         faJmk6XyqOLEItOYYquhed4lJkrVqKZ606AswnFZTnNuWoncmjNqR1qvJPnO7EmmTqPL
         Cqa/pHOtqdFsGYwv+rK068XE4g746PWHVTy5cVrigA1gA9whCNLyQHS0mJeUpIkL+Xk+
         ncjZjjlKAM3NNy8rK56zsx+1qfSBeFCRSzCU0qj76topqHHLaLqHOApcMsqTgVdD4O4P
         a1dNtWFcNMQTeT0kv7iztxPGaYzhaJHGtnyBW/9MvE0aOJsVdTIO3Z9JRAStzRm21luy
         JF2A==
X-Forwarded-Encrypted: i=1; AKwUvBwD2oeXtUyceoOxglTk/4KHkqNWhE1/IX16leCWNsdNBwuNGPUw4PDI7t11c83lPD9F2/jE0a08NkiKmw==@vger.kernel.org
X-Gm-Message-State: AFuF++l2oGQ00aoMBL0+n1eq5K3XkAXtKfgqgv29y6hHsN/TpnrgmVFV
	VwJe7SS8JGijlrBhWJPBNn5e2GvzsO5K4ylVYRJmQceDbzy6YkerJyKyOryEYiZkC5h6xFpHHWP
	llQ62PeudbLkj7bVzXH/Uy1GIIGdkBAE=
X-Gm-Gg: AYBFou0nKTeFFgR1ixgm8Mmizotg2JJijNRv1+Rw0xXiNAa9LPEJPaQf/s/sS0GAy1k
	+rnDdBt0ySDUAM3msGrWD8/aP1+ImbQEfTViyiUSuqWrZ48QHSyoXgrUquXb/2Q4Ps+81f9bhlK
	wpRQzPgMmLEDI42bQjS1mkDeQuBu3A1UWlj/PFc2qsXXT6vqqLADA+PFGG75d+DG6iAnkJq+Vsk
	OIaCNRUpOZmxvL9R1vTznWdVERFspVfphsM5ZjU8DJw3DRulWMQyoweY0gim5kLb3g0Lu7T2RvB
	uoA0FYXppaqScGP+SfRjJdO+Qoy2mxXgEsZc9KPaInnhkBO2Vz2jt6LzlN3qts7iHllu8auqXDu
	i87bcJu6lL0dj3gjlxZIcOE357VtBRuPj+RoBkVI7uup+ldEP9//oLOa5WvsUcfJxsb0=
X-Received: by 2002:aa7:888a:0:b0:857:73c3:4469 with SMTP id
 d2e1a72fcca58-8708c367516mr4031436b3a.24.1789468821304; Tue, 15 Sep 2026
 03:40:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914072842.24420-1-phucduc.bui@gmail.com> <20260914072842.24420-3-phucduc.bui@gmail.com>
 <07add31d-5622-40eb-9bcf-f7cb2396fee3@collabora.com> <aqf7B_E7_Gv5iK2A@sirena.co.uk>
 <8f1ea5c4-d85a-43eb-8b10-3f80f8343b27@collabora.com> <aqf-pqvBNQ21EQZx@sirena.co.uk>
 <CAABR9nEB16gANTVf-B+sud0+11XhjCjqiCRY3hP_rnaFstB0tw@mail.gmail.com> <936fda6d-8e9e-41f1-b988-b2a4dcb4004d@collabora.com>
In-Reply-To: <936fda6d-8e9e-41f1-b988-b2a4dcb4004d@collabora.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 15 Sep 2026 17:40:08 +0700
X-Gm-Features: AcwNN1XiIsKmvO7R4Fhz5E7d9MTMT7jOpXuiLatg0K19TloBrHHj0Z2OJFenKUg
Message-ID: <CAABR9nGWG8hpkvQP_0d+JytRpW7oRYPDW8RvUOTxL9kuXyEN+Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] ASoC: mediatek: mt8189: Propagate APLL enable errors
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Dan Carpenter <error27@gmail.com>, 
	cassiogabrielcontato@gmail.com, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> You have reasons, of course, but have a wider view and check the full picture:
> apll{1,2}_enable() is called only by mtk_apll_event(), which is a DAPM supply.
>
> That call can only happen if the device is not in suspended state, so can happen
> only after a call to
>
>         regcache_cache_only(afe->regmap, false);
>         regcache_sync(afe->regmap);
>
> is done in mt8189_afe_runtime_resume().
>

I don't think runtime resume always succeeds.
However, with the code as it is now, it can indeed return success as
you described.

> > If that assumption were ever violated by a bug elsewhere (
>
>
> > a PM race,
>
> That would have worst consequences, and your system won't be saved by this error
> check because it would crash way before reaching that...
>
> > wrong resume ordering,
>
> If limited to ASoC, that would break most (if not all) sound drivers, as that'd
> happen at the API level, and would get fixed immediately since that'd affect way
> too many platforms and architectures.
>
> > a register missing from readable_reg, etc.),
>
> ..and that would be a driver bug, which is not the case here: the error check
> though would be useful during development where you definitely want to paranoidly
> check for literally everything, even "useless" things... but this driver definitely
> is not in development stage, is it? :-)
>

Oh, being upstream means it's already past the development stage now? :-)

> > this is where it would
> > get caught and reported,
>
> ...but then you still wouldn't be able to do anything about it during runtime, as
> there would be no way to handle this and fix it: the driver would still act in a
> broken manner.
>

I agree it may not be recoverable at runtime, but returning the error prevents
the driver from continuing as if it succeeded and makes the failure
visible to the caller.

Best regards,
Phuc
