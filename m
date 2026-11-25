Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603989;
	b=NlLWz90vk+90SgAkBkf9tRz77YEZwWpwoc8sMJoHjTh5khyApBs+COrCr9YPeVMyBqXs
	 eSnPug5PUa2eyDI6ag/d2h+w5PjIADsbk/qw1lwCcAarlODlNAbZ2w+Q5ExDKyw0VM8UO
	 kcnNWu+H0Fu9KYDjEFKKL/A8l885vu2Uldq3wEzrj7tweuHKbBW9PhQ92WPkFj1JbAo46
	 uhxLgClEIxOLjHnBD9yWi22SUsnZSpTg7fLmEPFJtCuUlZbxImhtJ4H2W2MvCfG9B8rfm
	 +B3ScH26vrgWxHgS3fu+FKNRALVjX5wf2KHFZORnDUHtVgU9Lf2XaamUByu4QzdlFbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:References;
	bh=fV/fAC/QDKTz1cack8MnvKfDF5j1H4CdXawKALoydEU=;
	b=E3f+OGuMXYYX+0tqpOOslUaeOCQFvuK+UeWWc4ig8Y4hkaY6xIGbenVlYXVVNmwRdung
	 /vQQs9LpuAewtI6TT7FfX0X1IHrFypq5ZZr46oR2YhVp3bCNYJvSblKNnhWKFVOJCjppo
	 Zwi8YR7KPObCc2UdJ9YgCDx3T86noKWo9OO1Nwsx26fsq3ruLyB8LU5W1xF9Uu9Ls8Nfn
	 nkKE3UEelTTGr01HXVX2AmSmVOHcZGvHKi4/tgNVBTfPfjTXhsQittrUxocdEQP14bT2c
	 GGtCOU3Bhs25TsjNfQeyNk5RjQjjklntBNxBMG+zQteXBTQGp2Pmv4kj3AVKSU4R+BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miloslavbrada.cz;
	spf=pass smtp.mailfrom=miloslavbrada.cz;
	dkim=pass header.d=miloslavbrada.cz header.i=@miloslavbrada.cz header.a=rsa-sha256 header.s=google header.b=NNYjZrzi;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACCD606A680
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 10:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ACCD606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miloslavbrada.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miloslavbrada.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=miloslavbrada.cz header.i=@miloslavbrada.cz header.a=rsa-sha256 header.s=google header.b=NNYjZrzi
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so57533225e9.1
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 02:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miloslavbrada.cz; s=google; t=1795603987; x=1796208787; darn=vger.kernel.org;
        h=references:in-reply-to:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fV/fAC/QDKTz1cack8MnvKfDF5j1H4CdXawKALoydEU=;
        b=NNYjZrziGfSpDsaGfVDUfLwUovYOvpGwbc6bgq1XOq3iKArSIFllo15+uvrWWqVUzE
         Tu72guU7/2pG2juAK1g8UBMkoulH1b0VmzPJDo6LSruEjtH0SENvREgOVcCXxsr31SAK
         OfuHruMtuyUern3Qd+t7bqMGxxlFH6GoiF+m2CbX4nd1o7pL7tO6ZT9GUIhoUkwgKV3P
         Nqg/Y5JNzd2n0IeoJm2pd1CzE2IOpXIVDtfB9fX9aGZJj2UTTHbiL9eree3J/PC+XJln
         MsgRoEP1U+am/E59w2rQTBfVnB0PQqdqQGS6LXbPWBKPihEJK9rJalB23Bz1676zJLRe
         I4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603987; x=1796208787;
        h=references:in-reply-to:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fV/fAC/QDKTz1cack8MnvKfDF5j1H4CdXawKALoydEU=;
        b=06JvRo5XoNJCp2r6hLW9u5QgKvM3eIgSEyDOww3XCxm9bBLLvkwj+NaR1AWzOxPk2v
         6jyvSqM0RJl487mn3942JiTHkcNYKuajI0UAvbLPi1kGBQJ4hJ4q1aiBqzB/MvtGnbPH
         XNusQkgbTfgrCdvVgpuYBk9s7G7h66VCt1r9FKmZGTKrqPxrEwAsKC9Bqny7+EHdgdkB
         bGIdmBBrJ5F1qDGUwAY9AMzNDuSyTws8fZgC/EoVzdUWvHbcgbHPO/c1WBv6uwbJZsaW
         C8Rag0Py0GKU4NlmBSSC93NCeZ6b/UoSEQYK9zQjYm/1Q41UVD2MiviEQ0e3uzCGO/Ji
         sRow==
X-Forwarded-Encrypted: i=1; AL+hErGk5PgscacFdpaPl+S2cBh1sK4lKSDscbpCGZz2CilmZLZorGjwhc03Qmecho6P8MDb8PnaOCaBx5BAEw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/lNU7BDfYO1+O6/4/KRcYhax1sJ0bCKVrVt5rG6xyMixR1XCZo
	zT9HEQoCBlVla70JTKk5cVjLDBA5hMWtj0zAAZsMjtD4TFLRsMIzJsMUW9h/z3jPPw==
X-Gm-Gg: AZFdTZdpdLYXV8O64kJUqmVEYtMIc3nbAvzTioV9WzqV6X8ZQHMQBJnDBpFkXm5Ds48
	sCR6dtxy0715kLmKjObZFoNFR+KIWB0nG0qtbwdi9siv+rzzrJ+Y5dnNjfBls/6WBVox09F269E
	QAFRHq4DPF3bCPi9CnKQ4324tbP9w5ao4N1Yyo6MtC836qY6uxijmUDxJwjbjpjbUfQJLGadc4g
	/0653gKHJG5n+01yGSaw6fdzvzjURjx4hoCtIjISs7BEkCgn1luXTZ2RWueX5YRWZoPVwbSVoWH
	z8cAWswBwzBBqTtzYhv0ASQgEgXW9pun7MlmcSlNKG0j+gtWkaPsbl8fXkYwNvi4DQ8+n8FoUln
	PhFFYRK2aJHy6LUdhQ5BCWWzc4/n0QPGfguL0mrMALPuLJR9JYyHBLRd1CVCPNVep8MrPk/OOYR
	Y7eSWEUh1EelnKVHEd8LSEttbyNBJAgHZiQ6ErtWx+A9Nrn+Gp8eL6eu2dg5Nn94IH+bujUgQBH
	vthKrTLNy9jrG6MPiWopyDXzjFgNxmGCej1WG+Pu2WOn2jmIyMXuzK3ncfEuJT2AZfsi2lI6PaA
	bH8T7aVWLyBnHdQGZn+wCtmP3VFtJzHTxe2N+dTFODUZ
X-Received: by 2002:a05:600c:a15:b0:4b6:267a:dd6e with SMTP id 5b1f17b1804b1-4bb88938a62mr354031415e9.28.1795603987206;
        Wed, 25 Nov 2026 02:53:07 -0800 (PST)
Received: from localhost ([2001:41d0:700:348d::1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb906e4ce6sm292891195e9.4.2026.11.25.02.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:53:06 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by localhost [127.0.0.1] (msmtpd) with ESMTP;
	Wed, 25 Nov 2026 11:53:05 +0100
Date: Wed, 25 Nov 2026 11:53:05 +0100
From: Miloslav Brada <email@miloslavbrada.cz>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: Re: [BUG] ALSA: usb-audio: list_add corruption in
 push_back_to_ready_list() on 7.3.4
Message-ID: <awa-EWZ3tvDyOumt@genesis.transkript.cz>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tsl58js4.wl-tiwai@suse.de>
References: <awZs88beIhMcOchv@genesis.transkript.cz>
 <87tsl58js4.wl-tiwai@suse.de>

On Wed, 25 Nov 2026 08:14:35 +0100,
Takashi Iwai wrote:
> Yes, this should cover in your particular case, and that'll be likely
> the easiest fix for now.  Could you check the below?

Thanks! I'm running your patch since today (7.3.4, lowlatency=Y).
Given the crash interval of weeks to months, I'll report back in
~4 weeks, or immediately if it crashes again.

Miloslav
