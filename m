Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6ABC344038
	for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 13:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770731741; cv=pass; b=g7h5onbb6nwLF+duJSDVLKD5PMsZW3aoVOdbzhghiJXDwH6rZkP8JTFHG7XDlqg8bPewNIO99Z/zP+rg+iEztUR7dt/IMSHqgE8VqgMGnx8KlRfP0sufM1da0nGSwckwHlgh2arz7RdnDD14/mtoLyEZ1jNk6qyORrOXJqMXqp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770731741; c=relaxed/simple;
	bh=C6CHJ+p9/7HEzY64sCOZ+wdqxbVNa54jaWP9JDGY1Z8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q4XuzEpd2TWySMam8plohSUQiQSb2yYmAFykZxOQIiYcrOyilAEHN87c2+6w0BSt0mki+xKGUdS624GOGCZMBxE7tqH0RsStRPLo6zibDalmf3poLWAGcwX9t+lVig6lPYxZIfMiArXrm8W0HefEijJzrbXiJ/Z4eBbYkROo62k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu; spf=pass smtp.mailfrom=u.northwestern.edu; dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b=WSg3CPGN; arc=pass smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b="WSg3CPGN"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7cfd8ca8191so1512987a34.3
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 05:55:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770731739; cv=none;
        d=google.com; s=arc-20240605;
        b=eZihadjcpJ0cb8dONDdonmQN9okDgO+kKeSpGsS9RLoKbjzXEAA/yTDAfGUv0O7+wm
         BewoRdZtI/YHlM54+K5XAwRN9sx+nkl82Esydc4lDB8T5kM144fHmqxfZ5ggEd66CzKM
         NuAJVJCgbtyNmc7liQsJxD1rDSnZFS1JAlQAWp2HM1/bEBDujY0FSBZJkmekr6MsBwrs
         sq1MR4JzdW6FlxiKCMjjZosuXCl9AhWdzuItZv4JXLOoaDZFpOp1zXsyLEcFkJokID+X
         9J6TgOYqirFZmQmsYD++4Fz2i5StfWbbu+jC9bE8i9DSSiCagohNyHkl+znYyDkiZfHu
         aWDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rXCYsv0h9Dcx7ZfhjKMFomiTtFLzzPoEUHbQkrHUzsQ=;
        fh=CiP2ULHMSzOJDtIcO6sn24ubfaAObbjY0qoOUDQjr1Q=;
        b=JWAzlvbntB6PctPBqPC5Gn9Sgg8ePy66osfpynDGI+ZlCqAZvHtyWcHVQBlT3vR9K+
         oQiE0CuOf1hR07uHYPplIUVrpthwruoNK5EtxYF0kou48n7iJ6NJ929UqpVOPWU2lbHP
         /2JlmPXRgSII/00NEp2Sal2iBNYfbH+3JzSS2+Ppzwm96KTcws415iWVcDeTzSfZNIWs
         mUzq2Up4WBBBQ83ljP0ttsXaHFA0dIJ1VopnEMAbw5Z2b0jgJwrS/4tNgyj40znAkpux
         ADQfc78KQgWIYuGjGixBKFP3XcHBx4X8b49UShMmHPFt90RdcC1GRPrlPEXb9JtMRfY5
         BSyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1770731739; x=1771336539; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rXCYsv0h9Dcx7ZfhjKMFomiTtFLzzPoEUHbQkrHUzsQ=;
        b=WSg3CPGN25gcyeu5DCMBb5PfsbtkM2tY1eTIxgbLOHEd6Pku64J8fYla1gS1An+QlA
         6y623rlsISx4mjjzSyqlbn2nZNsR1ytsTCIqCKDPiJhVjZl77qT7TvnD2KuQkZonjbzD
         NUk/4inTQ8eNdlwYyDuJ7tyJoaeu5a7yrCllGxicB6ja39nBp4yildpWt7ahECn2nczE
         aFrDAbq/hKyeuGWksxVjV7Vx4NX7DqPUB6yLmoGZvqO5trhzk+cK9Swc4+L77CZrcqfu
         gbRhRqhqdumJGleGy2JIF8OsAiEEhN1d7a9mvrW2xwOSitdlReQloiL1fenhVwN4+Nfr
         P/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770731739; x=1771336539;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXCYsv0h9Dcx7ZfhjKMFomiTtFLzzPoEUHbQkrHUzsQ=;
        b=uAhlV8Dw9evGrQMAntCJLzEfO6i5kzXbHZGV8CB9tgwi7i3SRS+mzM8/RjM90fClv6
         I1g7hPusC3NA02LX1EwxvrxmRyIM2aMUvLi1cx+nN98XuTVffHnlXXY9d2P/UMt8Eqqa
         S6ZwNjld14CwXRCGm39rqx1LmQPjrukAqa8CYwJKyvPlyW/GzI68lITGRgzBbMak4qfo
         vLwI3uj5NtQahiM0w/0ssVpdYFsSZQqBKzZdTpjHotdhq0Bhk7sxtoaWAwLiHtwAd3SR
         h1uUk/PJR4UtMD5pw0URABFt7quxt9MlIzzvuKSLKwGSsja8Kco9WGqZHg1mVNI4W57e
         aQ2w==
X-Forwarded-Encrypted: i=1; AJvYcCXXlNAo7W2uX1+Ff/gUVwXhk+dobfhwjaiYbjUiGop4Zcam4yYP8HgW8fVgg7v01Yg3umfqy9443DhElQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhAvPtavxdhuIHExEPNrfADCdAEw9FF5edDc7SlKulqkIQxazf
	fOJKVLz/vmJesATog6dRsIED9YOSb2HGAgq97Wu/sfrpgEdLQS38scQaVxQSMdS28mGJtkDTLte
	rq6CLO7E9ImFnKJoF9WQEAuCqSrKm1Lpo2j0P0WYNJQ==
X-Gm-Gg: AZuq6aJw2MCBYJNH1D5jmrHlGTGa7wm2JZhNigvcoaYsnPXYRy2US/R6NuO4o0HWpkr
	AyVqtnBc39+J5TYP4r9kK2XAbyK8ZKJN1AhoHCh8EiCHa3sT8uW3oKcos76Zf42cgXHf0mZkS9n
	EZ67N/T0LyMwbrAxlwvC5J4DUfAFmdahY4FFE60j49pLIwj6lZDodyRnBjOyk7XW9FI4giQj6SB
	qN3Fdoba2+NLVImTC+pAZiKd9tMekmr8MXNMMdKJt1+uD94N58ivb0kUsjIGLbzL4raOtPACuCX
	WTSQxKO7VaIH7OyEf20XDvDx1HnZOfAPhX+14Q/V2UiJ7yD1sQ9EWFDJQBGrLYXjt3OYOSWT
X-Received: by 2002:a05:6830:6a9b:b0:7d1:94d0:e8f1 with SMTP id
 46e09a7af769-7d4644294d4mr8355464a34.15.1770731738773; Tue, 10 Feb 2026
 05:55:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202174112.2018402-1-n7l8m4@u.northwestern.edu> <5056506.GXAFRqVoOG@steina-w>
In-Reply-To: <5056506.GXAFRqVoOG@steina-w>
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
Date: Tue, 10 Feb 2026 07:55:28 -0600
X-Gm-Features: AZwV_Qgn409JcyKfCJ9Y2iSAHnNv868P9lwiucSfI8dxwC4J1Cd0Lrp-pLGta9c
Message-ID: <CAMFT1=aJa92RO4j8ipcRc0NJ7DjAvgStkTiSx-QsrqQQzqkV=Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: fix missing lock in fsl_xcvr_mode_put()
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> This lock causes a blocked task on my TQMa8MPxL based board:
>
> INFO: task alsactl:1969 blocked for more than 120 seconds.
>       Tainted: G        W           6.19.0-next-20260209+ #3331
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:alsactl         state:D stack:0     pid:1969  tgid:1969  ppid:1      task_flags:0x400100 flags:0x00000a01
> Call trace:
>  __switch_to+0xdc/0x120 (T)
>  __schedule+0x258/0x790
>  schedule+0x30/0xb0
>  schedule_preempt_disabled+0x20/0x40
>  rwsem_down_read_slowpath+0x214/0x68c
>  down_read+0xb0/0xb8
>  fsl_xcvr_mode_put+0x4c/0xc0 [snd_soc_fsl_xcvr ac1b31380c6a6ea0d613bd5f78489e314a40f91f]
>  snd_ctl_elem_write+0xdc/0x180 [snd 852e63996474051c57bcd1a86ebfd81083073853]
>  snd_ctl_ioctl+0x7a4/0xaec [snd 852e63996474051c57bcd1a86ebfd81083073853]
>  __arm64_sys_ioctl+0x9c/0xe4
>  invoke_syscall.constprop.0+0x58/0xcc
>  el0_svc_common.constprop.0+0xac/0xd4
>  do_el0_svc+0x18/0x20
>  el0_svc+0x24/0xa0
>  el0t_64_sync_handler+0x98/0xdc
>  el0t_64_sync+0x154/0x158
> INFO: task alsactl:1969 <reader> blocked on an rw-semaphore likely owned by task alsactl:1969 <writer>

Thanks Alexander for reminding this, it seems that in the context of
the whole put operation, the lock is held through upper ALSA core
layer, so we don't need to add lock protection simply for
fsl_xcvr_activate_ctl() in the driver layer.

Thanks for your time and apologies for the inconvenience. I think we
can drop this patch.
