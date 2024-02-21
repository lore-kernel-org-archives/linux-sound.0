Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8258060A
	for <linux-sound@vger.kernel.org>; Wed, 21 Feb 2024 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708530044; cv=none; b=ZxiOmcJbyT/tQAnaO14skwCVa6swRsGkTvNNizbU9A4pgpA70tW31m1a/6EBCrScLlJ8Jj4RhSGyyRZENKbfKf17Tp0S6JVTi4wGosDBs5dIvUr5HZAZR0vGqR7JpYRKK/XqNWAMfWgTPHjKCAxeWXtLUCPKp1goztka+AwHLdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708530044; c=relaxed/simple;
	bh=TJNXkizSShMtvcWSPYmsDvAjzar6qre/w0cVQV2Otns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O93DnKG0i0VNSwqt7FJF7qso95Ij679mL+5zfB3yxDpezVeHQafpOY4WZyFznLsOiqrTtMVvEv8kjz/loAN7pIHo60Hw/o+vG2sInOcYlSBSN5kd03GII+IBDuSEEM3efEZPSOGfYeyuhZ/GJ1SQRoTMD2SNeXqQK2bwehr+IzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cZNKAyuP; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cZNKAyuP"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-595aa5b1fe0so4422374eaf.2
        for <linux-sound@vger.kernel.org>; Wed, 21 Feb 2024 07:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708530042; x=1709134842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJNXkizSShMtvcWSPYmsDvAjzar6qre/w0cVQV2Otns=;
        b=cZNKAyuPFyJSHfGipdk/coNi3hyJbysX4WwZIQGRIKoIj6O0gnV4iBFJz8/SgiYX2q
         kssb8mCkh1Jk4Y67OSHshnSgrZq4KmNZQ9uCq0AKuA+UNgftX0+J4zx/R6wFniwk9w13
         lHGG2VO9VFwuiqIOOLsntY6EtinYbF8mkvBaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708530042; x=1709134842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJNXkizSShMtvcWSPYmsDvAjzar6qre/w0cVQV2Otns=;
        b=e8RxCnHCNn7VoWqyjJ5Gdj83kUVkm5cqvmjESNn5sKFKrkcZPQGOUblUPvruP2OVWV
         8yI5so3vDbIEEcPKNJviAMj0VX+rLZF6Th5OsmhqTFycq1ip0aFd/pl5DHzjgXAsinmO
         9N828dbQOSc0BulX8GgT24q7QK68zRReZTJo3nqUy6B2cn3SDUZ/fTtMSZYy6s6q+oVu
         bIDp912iNwF8VdV+nelRWlR4vIzyNblyQnzJHrrGEbh5VVUdbP+27Xl4lxJEkxi0Aa09
         SSbgZZRwQZxfdtMchrgaZPDhOgISBMfyTkWakH2k1sG9jQUN+bjVnnNIfV/H9SQq+wrT
         Z65A==
X-Forwarded-Encrypted: i=1; AJvYcCXfufSbDB4fQ0EkvPOGEOfEPjbu6uqi3VRqlKSAYRMonNb4zV2T31mIsMfdq8DMp3io+GuDaa9aDCmyQOhQom27UaVlITIBacKF7KU=
X-Gm-Message-State: AOJu0YzeWTQZ9YuVZhvasJhM352RqXC2ZhzZHZGDLvKWxNAQlqFLeGrK
	UTnk906eGcVmWQ6q0SA6LGYipclqd0Vve+FhuU63oJPxwFQyHYaHHjIpW+z9RQMYeO564Im9TsL
	4MgsKxdMeROwdWpPiqA32w/uSZiUAyQbcFtCE
X-Google-Smtp-Source: AGHT+IG9fiJiVZ3sgt6ThkuObMsIMuHe48ijTvcCFKf4u+aEJ+qF96oTdkX3z0ysfbLBVGafXqGjD13bjGzV2JUDNfY=
X-Received: by 2002:a4a:ea33:0:b0:59f:fe70:3281 with SMTP id
 y19-20020a4aea33000000b0059ffe703281mr5776435ood.5.1708530042119; Wed, 21 Feb
 2024 07:40:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214170720.v1.1.Ic3de2566a7fd3de8501b2f18afa9f94eadb2df0a@changeid>
 <87jzn0ofdb.wl-tiwai@suse.de> <235ab5aa-90a4-4dd7-b2c6-70469605bcfb@suse.cz>
 <CAG-rBihs_xMKb3wrMO1+-+p4fowP9oy1pa_OTkfxBzPUVOZF+g@mail.gmail.com> <ea61304a-81a4-402d-9d71-b13b9ac89ed2@suse.cz>
In-Reply-To: <ea61304a-81a4-402d-9d71-b13b9ac89ed2@suse.cz>
From: Sven van Ashbrook <svenva@chromium.org>
Date: Wed, 21 Feb 2024 10:40:31 -0500
Message-ID: <CAG-rBij0di69U38JzWK+rWHOn7AoX1OOBtVUZ4TqLCfysMFsEQ@mail.gmail.com>
Subject: Re: Stall at page allocations with __GFP_RETRY_MAYFAIL (Re: [PATCH
 v1] ALSA: memalloc: Fix indefinite hang in non-iommu case)
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Takashi Iwai <tiwai@suse.de>, Karthikeyan Ramasubramanian <kramasub@chromium.org>, 
	LKML <linux-kernel@vger.kernel.org>, Brian Geffon <bgeffon@google.com>, 
	stable@vger.kernel.org, Curtis Malainey <cujomalainey@chromium.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 4:58=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> Thanks a lot, seems this can indeed happen even in 6.8-rc5. We're
> mishandling the case where compaction is skipped due to lack of __GFP_IO,
> which is indeed cleared in suspend/resume. I'll create a fix.

I'm really grateful for the engagement here !!

> Please don't
> hesitate to report such issues the next time, even if not fully debugged =
:)
>

Will do :)
