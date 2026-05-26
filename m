Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637743EDE7A
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 12:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779797823; cv=pass; b=sJoyoW6QQOmk21mqM4Vj7KMjuA7czB7ESl3tEM30Lw7JhhrQIZdhplc4sa6RFfArynYMK5VbH4jPCiMN1yMsGyvfbccah4ukqJe0ma/Ra2IEyme93745yx8E+rw50GTuT6rHsDJfGKOJmcMLxSVo7SmVJL8MqNtY97WDd12Zu7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779797823; c=relaxed/simple;
	bh=DtObxo9XE3EzIiwd27kjN9EEcOHxqFMVaH3d/+QZW9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ahv0vzOHJK0g9Eh8wNRcI5mMmED6bgGE+JeV5MCP0Bfw3EXo4q81HNsK2IHCJ7k3CZB04D6dcqSa6/w2fgC7YMIAxSKVCiiShuNLjOkrkKWK8bRGWDbQ5qn1AhZ5yobgaL8FFznNR4yHu61Wduns0bBiTwUQBnmNUaxs0m0Ye4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N6YypTA2; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N6YypTA2"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-366139223e4so6337953a91.0
        for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 05:17:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779797822; cv=none;
        d=google.com; s=arc-20240605;
        b=R6RT4qc5+LS5YDjqWY1MbrJLz6tmQxEHLOOKZ0WrwqS8u/8pvxoYhAmwLBkURx4Je9
         wSKHs/j/PCeVmpLjYsNEvtvVTa+q46GpZc7h6prIIXnf2gKdMJz2i0zTIZf6fj5tD9CT
         GmretbT5DmpRoGkbQTp+zQ0RyDX1YS333KVDJ8RsJz8ErcSdL9zJgF9/NWQZWXOqkxm1
         lZarxpUTf3TmeRhD8OQs6tYTPHJ4HXIztGcJ4BUJJsrg2M7qtQAGZ/A24zZf3VwbiKyE
         n3igBORSMFDhBhzmkwmALBmu593Gwy4wKFPoS++qsAKpKg8cZBoD6RYANHtCk9aRwTol
         vqkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DtObxo9XE3EzIiwd27kjN9EEcOHxqFMVaH3d/+QZW9I=;
        fh=xTQswv+nGaen2jewAVTX2NiANzdgPqfghlfhZV0dkrM=;
        b=lYzMe7PZpAA+9Q9KjM91ks1ORq4JlNAS0ji2GJIc1rPyAt6GtGB6OfJUn5A0Tsh1a1
         eYYWPAB/CUc7SZWD687NL+KFBKGcZyNOFtoF7zqJ0hs+wHIVq4AEkOFvBis5YMAVUWzA
         fFOqAy4AhMLAf3n5VU2xfRNUIqbrke08svUj603WM8H98wjw/kwWZAcD4aRgbiceR/fy
         x13E8z8nql64ZZ2BDgMn+Bt76aFzl6OCB5OUNfMHGg/2qBL6kqThThlBKuji5vbAfIEE
         ppDarpiD9vQbEhJgi+UY2/wbvibNtg2sw4GEfyzytJ/QeqBpWY/JOXcb+ZBfnFhs0UvH
         0oUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779797822; x=1780402622; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtObxo9XE3EzIiwd27kjN9EEcOHxqFMVaH3d/+QZW9I=;
        b=N6YypTA2Xl3kPI/kJWbCL9hP95myhGUBo34AytS74EQEeBmVoVlyZiXYZRxvWsC0o6
         dpp+bcOc6aB0jJ/dYoRGseM77zeApktlLbkdVMOkTMUznhwknSF45k+zdXM/ari675I2
         XrrBu1NQ2X/19vtKcijJhgQkBGRkP30pUrw+TKUiSOk714dOWbwlfBbHIu2wxp0SKGaj
         zYRJASkroJnEEwFtFEmQU1AIkdu63dqdIckNOiQhQJ+NqxFHTQTy79c2auA6vHBlmfnE
         jqCd1l5xnzZ68UaRtRxSfk73kvL6JXqGM8aLwux8iaeAhvwkACn6IoJO1/AsV7OVZfxl
         +fvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779797822; x=1780402622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DtObxo9XE3EzIiwd27kjN9EEcOHxqFMVaH3d/+QZW9I=;
        b=cVXFj4VZPzQi6R9NC/nPqAakRGnQd420QkKXbejJ/hzM6N+EIrlXup3t2zhIPCYs//
         39PYruc+bLawXXdfOD4Wcn1hEe/zC9MsBvgGVadWBGMWyTtFwSekjTKThAXJkLuLAt9k
         QdvTfoxGCOkBa3B46HlMtOzbpD6PpTDdsQQZAht6jkegL35VRcj3kf/9mi0S6Kpox6H8
         cILkmDebGRYG5JvQhr9cAXKC8ccI/CXGTxqrEm17pC2ocwwdIveO5wzVEv+Fh7m9VXzT
         GNsWK1bQUmSrXtdFs+hoSj7FAo19OmCl0l81xktgXjMUBzxTBrM0ae4SnC1UBaob9q+L
         Nw3A==
X-Forwarded-Encrypted: i=1; AFNElJ9ojfZFeMhkb/bp3lE4gjS5Ve1Jg9ZCgbM7cglfGYMd1ZaNFJ2aPyG1zcZ65ms7o74t/KCJdw3UAnd9CQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzP3ZmXKECYbjmYReIjfHPBghPM7W8iopQB6PnuPBOhhxwX/F7d
	PSCbRuRiFUtCX2fHlLz4aQzACObxJcSgyyfs10TsZtgf4QSbA9XmC6TaeOQ3bVVQLYsVBFLvUWq
	oj0scdMalOpWq5TNdCSC/nHcTb9XhOIQ=
X-Gm-Gg: Acq92OHFTajwpZj6el47GiByMKgb/GQ5EanbbRG8spBVpm5+OGF+fp/Daeq+uNiuO+H
	MzHJNil9TmtQG1ya5II2olk7yiphA4ok6vnsnqrdDNsfrB+Xud7ilFSrSDr3v/9H7HqQAW5IEtV
	jqmdF1Q5afjgjcqb6jP8O1PeU1+B0/OtLRmGZFUgw1eeIpOH8k7vjPUu+JuVW4xVDW2IxX+02HJ
	9IKnzsBL+2VW1i/8iqFL8WgM/VCZCc/RV+Up4Wu2ZtPLRc4tG7Axrk0oQ/Oysxt5UC0bJK25mAC
	OM4wNWP3CbHYKTF9GqdV/JLWMLKfwMIkx/kpCkgYrlSS1KnwR2I/P2khEhts+hK/Vfim9k69
X-Received: by 2002:a17:902:c948:b0:2bd:2de3:5181 with SMTP id
 d9443c01a7336-2beb034603cmr207644055ad.9.1779797821644; Tue, 26 May 2026
 05:17:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522095401.72915-1-phucduc.bui@gmail.com> <20260522095401.72915-3-phucduc.bui@gmail.com>
 <CAGb2v67UmMmM7bQOSf3VxsN9D8s3N8nMMX079_kiMcPU=VszFg@mail.gmail.com>
 <CAABR9nEB8jizn+NrVgrjcOOJRtaU0u+TH705unMTh7HYO=8Wcg@mail.gmail.com> <CAGb2v65zK7iOce_UZ+_F=dWtKYFGZj-K4k45MewvDbhivXPH2A@mail.gmail.com>
In-Reply-To: <CAGb2v65zK7iOce_UZ+_F=dWtKYFGZj-K4k45MewvDbhivXPH2A@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 26 May 2026 19:16:50 +0700
X-Gm-Features: AVHnY4L36KKu58qpYxsDJHrLwpA0fiNG3V0fNQatxdA3GV3-2n0FXUky_32u4G0
Message-ID: <CAABR9nEsKjgErDB3jnHrx=dOUajvvN6GbP+6XUb5Ay3VYYjNJA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ASoC: sunxi: sun4i-spdif: Resume device before
 kcontrol register access
To: wens@kernel.org
Cc: broonie@kernel.org, codekipper@gmail.com, jernej.skrabec@gmail.com, 
	lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, nichen@iscas.ac.cn, perex@perex.cz, 
	samuel@sholland.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chenyu,

> When you submit a patch, it is expected that you already tested it.
> If you only compile tested it, please remember to say so in the
> footer (or mark the patch as RFT) so that others can test for you
> and the maintainer knows the status.
>
> And if possible, provide a scheme to test it.
>

Thanks for the guidance.
I=E2=80=99ll clearly mention the test status next time.

>
> I can't say that it does. But since the only control that SPDIF gives
> is the IEC958 status, and that doesn't appear in the standard mixer apps,
> it's unlikely that a _user_ will trigger it. Plus the control was added
> after the basic structure of the driver was done, so there is definitely
> some possibility of a crash.
>
> But what you wrote in the commit message doesn't match the actual hardwar=
e
> behavior, like I wrote.

Thanks for the clarification.
I'll update the commit message to something like:
"The kcontrols may access hardware registers while the
device is runtime-suspended.
Ensure the device is resumed before touching the registers."

Best Regards,
Phuc
