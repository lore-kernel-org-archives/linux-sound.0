Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9343722B8DF
	for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 09:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782294573; cv=pass; b=rtYLW1P/eRmXFc5FnXp1SMWk7fi0+J7uO2Dxd4t634QaDnaRt2xSVYNsK/4ZMGyi0sRwsz+WuZrqUg8cpHivNAsnFyfanj/G4SN3rXva5mCfBII+U0rBewJc8wvCutoJ3X3KFyZ4C4ye8diIeO661zO0ucPfRSPq0MEmwhQ0yT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782294573; c=relaxed/simple;
	bh=WjyObAoqK/+sAvyWPbRHZXxx87IKxVT/WW8shyTxveg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p963aUbl+l8DCNJXDG7+7ANf2AYoO0A8EeeOPB8t5DEqHW8iV7xEkLi0I9vs2eYoWkQfw9je+1huyup/eIYB9MIO6miKfrg+ff77UoRw0Ctt7gU+WQjoFtHoChq+Iv4PLQ2K7jsSBkiFe9pVFDmVzNxq1+xuboYhD0hy/jpComY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEhyps8x; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEhyps8x"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36d98b9aa9aso699352a91.3
        for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 02:49:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782294572; cv=none;
        d=google.com; s=arc-20240605;
        b=UzGcPMiEvzzSbv3S1wX9HkeIJKIeBBVJ0+QM9cUePrPs5OVa64pQi1ouRf3P3yFVkF
         alQjBiMwF7r4jRdGfnBgj4TBU0AUCmvQ/ezKU+5loAwJVaZmKhtaoT7v8zKnH01CG1JR
         vpuHThSo6fcpujKHyqKE8OXPia9wBI7K2oQphcO6MBtiUYu89a6R3g8rBvU9kYrXz9z+
         uFcZ2wrAVwj6U/faZ7houVfuEkxYqCCAY7a0zGzaeSBl6sVenMP34GB3yIhK98Ou92sZ
         iZuMS3oI1xLRpGi2eJowvtNncZ+M6MTezBw83BN9WSGCxfRGSvfCIXJGnPnZmH3oXZlM
         8sRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4NkgwDyqWRquT+COCXTXR+EpYqeXTFaftqG/OAdVzU0=;
        fh=aRcCYWPKxq3FAoSJCFdtWA6WJU3K1ipYNGJNhDmkiIk=;
        b=SL/qF+68GJFtLRuDUwoGz5wz+TMbh26avUi5dIbhIS/dlxlCaZmMF9VZQFMoQO5DZM
         /i+7I6LpQmNDjE/ZKbOymT6/CiENuYEbEA9tBfiue4C0EkTjzvoehX6N4dDLrRQnSPIs
         tPJNhXnS2JfNclfvCg63TgS/+thNt8cpwOs6g9l6wiYou19a0cP0EvC43+rn7a/0Gp8G
         9sjRCDUjVv7EkOl5EOG6EADoRUhDK3C3yp/QmV4g3GKOj4E16Pdmcik1wbUehUuVowbg
         3/I4N0n4pCyeQaeObPKfQxVXSgvMjNDlR0A9bVzYrwp6Q+XRRV4/fTl/vLD9xtNcI7im
         dwVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782294572; x=1782899372; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NkgwDyqWRquT+COCXTXR+EpYqeXTFaftqG/OAdVzU0=;
        b=UEhyps8x2/vmhekpWfi/BTKKcm3wh4Uv838CilCkQbY3q20ZfjkSmbO9vKqNksmPtR
         j6qTVLqIYCnj0LjYw6NQcfSV5XVcmTRatKSbihqZHPGJVyTUJapAVinoGZpFxOLzBKD8
         gRshmjqzt38FIJ4GaMkH07UFkeofrV/9GBLqHgFg+w32RhPmqggW09Y9pnwL4+Loi6Vy
         gOS/DKG0Tflhs5xbbYe53rJnSzB/t1m/lqvncrq9Ktcx6gsk9syrAX6hUtXlr17K0k2b
         j11sL2VFNLvu123MtOnPnXynDDvEGQdHdRp+XKhDWGlyOCZTzGbKfkQBGMKB1pXzXJ1s
         5rqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782294572; x=1782899372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4NkgwDyqWRquT+COCXTXR+EpYqeXTFaftqG/OAdVzU0=;
        b=d/oH7gsnxH12etKBRWqg0fwji4OcN+MZyZdbf9UPc/IK/ORx3pmkMVGC3TzJgBqne3
         LshbV39Pv7CBhmcXA1HtCKN87GIkeSc6qErRTSKjUTPE7dMkplez95f3gew1ZWri9P0s
         1Olmp98EGsXXCUrINF7xQwQpRy39xh1cEDUCxXcy3vKrHmpZL+ARaH8iXjEYyqYAkmsy
         ushkjz4eGvc3hHqN0UBUTASPPerXDJIkOd+gPLLRkgTIC5rurKM/c9UMe3fTUMEfy5St
         9eRuhmjjPYNbUjeyP0fgHRywbPYkmJZu66jKako7cycq3aIREtNaFh+wkSLkE3F3Y3+1
         EGZA==
X-Forwarded-Encrypted: i=1; AHgh+RrF4VT5RSMDJnSFiVXpnJ0GbujNDFmbCTsaAJO1QVNHMCpQoIc5o2Mbj8FjvKx5HYiY4MxgR4pfj8B8/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Yx8LY8RCtHNE7+P8bThjQ8J12u8fqhLYdZhb5Z/5IaK2wUeg
	F3z43UPt43b9vIm9N7PKrdt0FqzaKLlnpVgkMslL/ySEL092WvxODw9S3t8EGkTpRc2OlFo9JyY
	iIwUMga1AXsPEjucOvcsXHsUiB0UYJnU=
X-Gm-Gg: AfdE7clCraVyTTI6EXq3DbJKpf1adI+GJ+ObCGQP9XCncTUMFikhxD5tNnGkhiI4u/v
	1FLdAighrE3EwlkN6wxPQz6CIE+64zEPXF+zzDRfO+7yKxAo3qPtWNYL0Ltm+oUKNOt5OHayrBw
	G/w9hG1zSPihYRaunkzkvduJ5ccGkpC1E1CM2FFWlEhMfPj2djcJJK/8kODsOSTvDFo3oJbspvf
	5P8gYaZiz7UntT90VKR2C36NorAKGhzBMFt8FLzcO2U9Mjv6zaxVDrd7vtIivt4WMgFPvUuOwJY
	+UR8s2JFNnrNEMql166EJ/FkWW4=
X-Received: by 2002:a17:90b:5650:b0:369:7421:75c3 with SMTP id
 98e67ed59e1d1-37dd0db4122mr7138627a91.16.1782294571735; Wed, 24 Jun 2026
 02:49:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623105721.25865-1-phucduc.bui@gmail.com> <20260623105721.25865-6-phucduc.bui@gmail.com>
 <b73445f3-899f-45f1-b450-8031044b5ff7@intel.com> <CAABR9nEWAcwTBet022zyDJPFVc55q4xZR7y8HNzc_x3WeCPtRA@mail.gmail.com>
 <ad96abd2-dd6b-4fdd-8033-bda4e1389884@intel.com>
In-Reply-To: <ad96abd2-dd6b-4fdd-8033-bda4e1389884@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 24 Jun 2026 16:49:20 +0700
X-Gm-Features: AVVi8CdRir9fywVaIC4y2JhwJFqjyJESboPzqsLAkDlMac-2dhzdDWSsJVuOAZg
Message-ID: <CAABR9nHeod1Y3nWxunRfyhkBYyCJc3Z516z9CrLH3Hr7fXeaXw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] ASoC: Intel: atom: Use guard() for locking
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <liam.r.girdwood@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 3:54=E2=80=AFPM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 6/24/2026 10:07 AM, Bui Duc Phuc wrote:
> > Thanks for the review.
> >
> >>> Clean up the code using guard() for spin & mutex locks.
> >>> Merely code refactoring, and no behavior change.
> >>
> >> The change looks good - just dropping by to mention that the cleanup.h
> >> is missing everywhere : )
> >
> > I noticed that both spinlock.h and mutex.h already pull in cleanup.h,
> > so the guard()/scoped_guard() macros are available without an explicit =
include.
> > Could you clarify the reasoning for adding #include <linux/cleanup.h>
> > explicitly here?
>
> Follow the include-what-you-use (IWYU) approach.  While the approach
> could be tailored per-header, in general it makes any future job of
> cleaning up the headers easier.

Thanks for the clarification.
I will explicitly add #include <linux/cleanup.h> to follow the IWYU
principle in the next version.
