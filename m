Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAB732B13C
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 04:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781239695; cv=pass; b=avB1fJ4mrsT9yBRhMS41dAinzcoiADuuOKWhImzFu23HQvz5hxdOIDl3WTKLzMEONxN7Antlc/S4Yw2Is7nFc58rdfnlF+o+7lme46TtsHo1g+I7fX9Ne70ChEnBBYnsuk0BcJo1GFp5dJCvlvIGc3wOMs1EJf6mipKjh/mgz4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781239695; c=relaxed/simple;
	bh=QBK/q/CeM4+J0u/rV3MEVxkna51y8nF4Aby7rQ4BeHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kmxm6jOeroes8GtDRklIp3B9QeBPjia1tVN2BxHBI9bbGMwJvxGJehdXS3iIg+WkomF19czOXneeeFuXALGyzwUtOzJ/6uG6iDhn6zepSlvTavbMo71TcbOj4vnpJzpc0orNwEqin9wRjMQoQEstKal7AWYm/QX0F+VP0wO0HRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6uwsczQ; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6uwsczQ"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8434840cea8so248575b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 21:48:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781239694; cv=none;
        d=google.com; s=arc-20240605;
        b=CVdIY3JRXGNOtkuER4BXvxSAK/vFLN8npZ9mGU29rjfca7LJNNXf3okt0d+hUflgHh
         BnPRkAX3V7KjHbBMZKawrGsuRRh98MRIQHxmnp4LN7V/ZANxotOlnJDA5qHSVavGRWTj
         Peu4zYz3KyIoH1R8/xUHhyvHfUuzw9iecmmC3hyOYNn3abpKpY4Yj6ZLey/v6il/7AS0
         9lRZn1/8jZOHg5FfqYYt93/zotbDB4Gr4OE9ZOA96HqQabDDiDTNg6J7KqmAaXzJdUeg
         IiAovRqjs2KD03eC/Q4gr6jt+9wjyU3zefYi+zdxXuP2taEX5TEf2riApxO9NjjmcvHL
         nuqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MxPao3wEiXb8pEOrjgXEUrwDSGB8H13YOD53U5nbduE=;
        fh=HnbA1b117w62cfwE5gBWnlGveT7G+C619EI2iK0wyJw=;
        b=M8HhxProL6HDSu3EtNwIXxpWwz4Tc5rQvAqf6531VuzYlaEc+J6nJ1XaAz4vCLqXim
         YYrxcqwliMwWMt61hXC2ZYV9ScMoSVUHVzohOaZslGZbS3+F2Q0N1tWb1hBUXzy5uHgc
         aqQTXDZeiozwJuv/eCy4TXKyyun0PhjFOPbiRVo4IU5YRhevqd281mMT7c5gkUpWU30o
         H96nFYOI3ogWtPSlJCQF8OSYuSQI0PRJwSWVF6wx6M36bcS8K+gTg20SZTMNxdlAX2rK
         /M/C9zej2grTgxlyqKHDBTx9H2M01ZFx82HDjcLw6x0HFyz1huuGBqsvvTUzLcJtCGaN
         IzsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781239694; x=1781844494; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MxPao3wEiXb8pEOrjgXEUrwDSGB8H13YOD53U5nbduE=;
        b=g6uwsczQZ8/SjlhappuvRQ2GWcRSWzw/sBQEIAiSzOiN35Sv7TxbBzW5g+2ZOEQOu+
         SvDYaYU+kYb0HyX1auxAd1m6KcmplKpACo6CF82UOeOCZ248CkY6V87dLgpU/clT+Nqb
         f+UaGXR7YSfhc05MmwedDLcNCHJTeB/TOsS+No+NROW3vAobDBuRlDn6TN8lu5gtSd0f
         bmjcsPKTcqdBXW64k223TmrGNwZoxFemKSNRhDefhY29RL5oQbpmnY3NTgSWCsTU87A+
         5VmmZNgCItnX3P4CW+EiBTbMCJb6dME/bkfGrvvtySw+NYggV3W3NJX0WwbAzznt/NAe
         gWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781239694; x=1781844494;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MxPao3wEiXb8pEOrjgXEUrwDSGB8H13YOD53U5nbduE=;
        b=MjKOwvKzTwGUcFv2GTQHzGY7vaR3S8RGRmDbeOW6ejrptB8hU2wj201QVsFcMaJRk1
         jvPei0Aer7WHKdgrdK7Y4ZeyDYgCkblJH2+Sm49NAMyHfmDdjXglDF7ZlZPmo9yS+MW9
         8RGnxmEe5qU8qCEsVVsD71DKreGFgNqGC1cH4GCkksZY9+reiqOeOFbsGNpzapDSkHGC
         bczjGYNwIqKdyNIj/PqVne5/tDfXtpWajeDqSINlq4oC9DMIGfT5+YH0cN7YFQea2+Hd
         jIuhGUxTa5bIAIz4G+FtVt/MRKuS5NnpMmenjkuMmFh+pw9tsQdu/53vFYj8s4TJ8i5i
         c4Uw==
X-Forwarded-Encrypted: i=1; AFNElJ83x8rckLXjEbRMniqxJThLIy0SqB9QeltiCkmzHVYfeF18MZRHIQY7GsIxQ4MANWZzr6U+QPadLwBHRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw2AZi/DlJTwkSJ1g1fAncammQXIQABG1PqnfB42dW+mc8F+Rj
	g7HXejzsLKoTybbNxOKtU2aivAcXySlkLffx1v6NAdnCGpC0mQAhebezqvB4Wujgq/rz0tHD0yP
	RPPalfKafaASzxK6vL4tgRsJhXfiVUQ8=
X-Gm-Gg: Acq92OHELwsfaanTyc7+sOPlWuOUY+gyH/QW9Rdu9D/c7kgwVJMPUKoWeWd6rOq9LOd
	2IOB7NBGsqDs8meL/t7CvlzcjwYhSoPlVWcl5ch+eVG+OgSvPY53F0AS+rfC+14W10/6sz346Z9
	Hi/5YU3HYCvt6qEvY9rftdhWIYI1RsXhkVFzwllNgBBJUG4GH+tfRXUEmDNG2R+mXhoNuo09HJK
	neAmW3274IZruj7n8Zr3FLNDb2v/azMlAug0fiyS3283eE1oOl2x6lUNbchPtP0bzEvhcbj+1je
	D+yISkuxsYhOv2T8jmynlSnv0IrubuaMMp5Qrg==
X-Received: by 2002:a05:6a00:4fd6:b0:82d:62ed:b01d with SMTP id
 d2e1a72fcca58-8434cee788amr1278327b3a.45.1781239693689; Thu, 11 Jun 2026
 21:48:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611115901.80438-1-phucduc.bui@gmail.com> <20260611115901.80438-5-phucduc.bui@gmail.com>
 <8bf70242-a64a-4980-90b0-ab0310685a7b@intel.com>
In-Reply-To: <8bf70242-a64a-4980-90b0-ab0310685a7b@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 12 Jun 2026 11:48:02 +0700
X-Gm-Features: AVVi8CdUWU3LTmAa_xIFCRWrtlOYqsBQeRUTh3lYm_w02kV-gpJkQqBdGNSkslE
Message-ID: <CAABR9nGVKMJjCOQ1S72HR6iAS8Sx+wDT3L0tNyvn2AaAdhWodw@mail.gmail.com>
Subject: Re: [PATCH 04/20] ASoC: Intel: avs: probes: Use guard() for spin locks
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <liam.r.girdwood@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Czarek,

Got it, thank you for the explanation.

>
> Well, maybe one patch per driver suggestion of mine was a little too
> much.. Let's separate guard() changes from scoped_guard() ones.
> guard()s carry no readability cost.
>
> I'm not a fan of scoped_guard() update for any existing code block that
> looks like below:
>
>         lock()
>         one_liner()
>         unlock()
>
> Adding tab to the picture ruins readability.  The cost of tab is OK if
> there are more operations between the locking/unlocking though.
>


To save both of our time and avoid endless revisions, here is the plan for v2:

1. I will keep the patch structure exactly as it is now (individual
patches per file/driver),
    instead of combining them into 2 big patches.
2. I will completely drop the scoped_guard() changes for those short
1-2 liner blocks.
3. For the remaining code, I will only apply guard() or scoped_guard()
    where it genuinely improves readability.

Does this approach work for you? If so, I'll send out v2.

Best regards,
Phuc
