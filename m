Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B4741F37F
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 19:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784058694; cv=pass; b=OpwLk5YzQDZgn0r4SPNBd5nJYQlC7FZLm773NIrrOv6oL/3UafCP+JNVErHVObfOsChH+N2wK7LHqBvyzHR1xuE7bQSY2wY6loZmWuoynUzzm+Tq09/3ti8L/WDPiu3hw7C6eMmXedEs8rThRtkjorKuSrWxfZGRYm0floR5XaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784058694; c=relaxed/simple;
	bh=7sJlBmmuagnsA61ZpIWTlVIwLYgy5itt9DlOczCuJpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ID7QBqjJt4dIpokUkKaDZJbZf4DU8pXC386TGqmJFDTlFBvc50mEROqDkbGHc8T+ZIakFCfhaZI1jVCfIyklOwqMLVtnhmv3gAydZTy761E4QiaSscR45sBHRUYnVpsMQZPeZuIxxfhzigcdgBF9ixVPnqvDL5Pq6WZ2L7nWaPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eq1Rz6iC; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eq1Rz6iC"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-667923d86a7so2303132d50.0
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 12:51:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784058692; cv=none;
        d=google.com; s=arc-20260327;
        b=lRoSB3ZrLQCh4h1n8nT8zUHRhDll7sKLm7I+UTDtffzxmjaiX+6GmCD2GCj5HLRHD2
         izH2Cex+7ISA1ThvUCJt5uzXfosQBfp93UggtJv6Fyi2PZ9rqVKjzp485KHkIXLWLrbP
         B3w0GOc8ysnZri7ue618SXXZF3DzN53rWnJoiSLNbLsuxXYq1DCQHbaRYmTfM5+29VSH
         T6GahSoUgodzu/RKmdL2QN1zeN7E4u96nBDfHnhpLT8RgAUifFOlcBlVK3e/rTdIx0tS
         xrDD0vxAQmwDWEKQAVmWx1H0f0r1DG/XuLyqWU4gIVHgtQZS0WH/cyhufsdd0S+2jAuL
         L72A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=w/b1PDlWK/Eqd5ez4aKRjQEpdESMhQOUbn9dOPbBfns=;
        fh=WOKLPxFQ2uma51YL/CqRPLoMw013qrIFkWThNMMR+zQ=;
        b=CVurj+H/xI+1lfN+eebyCYTdSROt3+gkLRms67Dl8Sx4nW+I04bQ2bno34REdxgnjN
         Ep4ku0M9iwmbQ0eDdn2kHeFC4cQWDo/dB/l9grqr2YR8NJHOpndsrHZKbKGP8agFG/gW
         DXbeQCL+57okPEPbTYAOeBLntGMkBPPyJoA9OmCnPOWMcbEXW43kir5RJVxknrvJdBWf
         oAryIvkW7qriUpORqdenk0kE0jc1WYrvDZmuDL6Y0VQy8KUTecJDMxdQjewLmLc3qwMS
         Vw6kvLbehrA/FERCXmhl0bBwePPZ563MfK7AOrmAqtv0OwHvQaiSTVXFS0mjEdaoq5fK
         2UpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784058692; x=1784663492; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/b1PDlWK/Eqd5ez4aKRjQEpdESMhQOUbn9dOPbBfns=;
        b=eq1Rz6iCuQRwIMjy2SKm7WJ7yISh5VonRsZ3hbmgkrUkIqxd9OG9Uk6CMreSnVeK57
         c4pkI81RN/22Zd1Ua+rCuGD0oid/ANGoEUdK3REQ3bxmycI24EIbmxYa1RWb1orVILuQ
         f6kYAHsJW1iTci9ISZZmDwVcoxBKjuzI/7mck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784058692; x=1784663492;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w/b1PDlWK/Eqd5ez4aKRjQEpdESMhQOUbn9dOPbBfns=;
        b=Bg8iShMsm3jN/W52ecukBeTgAU/V/Ab4t+LwTnmZwm3VkDhDZbihpvmn8/uyUdSTWU
         AlTPKZZAgwQxYldmhbnQXBgypVzgZiq/LyXMi8Y2dBxtqv3ebhU0FsqD2n381XpojtZQ
         I0nobbXHTBoL6pY6udlU74l4W5U7TJkXQ/Ri4RqXP/ou3qToZos+2loYUuwb01TzKjln
         crnGr4UpHWN8VAvde3C3t3qWQUHBsrECsF+7M0rpfK3gQdB+u6A8YJlJvCX7/DL7WCmL
         s3V1qYRqA3GTU9qLdHkZ4m/W1TDw06yrvvKh+o4cVsujA7sgavMkBGdF0FZ/BCfsRh2N
         jRmw==
X-Forwarded-Encrypted: i=1; AHgh+RpK1cY0PXyID+Qn6eh6os2E9PgvE7LF0j1Ls0Rxj8J9sw+rheo1iItm/m7RALpZ6R4SE+9pIkWWJQs5jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvO0m+R0PeTA8ltihFx4Ti8OUq38KOJmC1gFMTQta8jXdasyRy
	ZgF4BaFfoqcI27O8NyVAFsunjRczibyqrMfvWWTVV4Esxw7v1/3S9zUNMeSzBCu2sqQGykvHIAa
	P3rXT8E5mS+6nVKpi8ViyeJ1OyeaDVGI/baZd/uZY
X-Gm-Gg: AfdE7clInRvCbqWS/dz8c/DNvIn03Sl4n0fnaH2/MK8vVJH/g9/fm/bVtEYxxYMpEFk
	k56zqxUkW1+yCJfQ5xMrRnXOL63+yzY/rUhlEw7mI8JqSIgOjzkXHslhnEgaB7bSCF3zkXh0qxh
	JJsSH4SU0Nwdce3IL2/uGQ+4S1e69fHPvsUXzAD9VqMK8oJU50XF5esdBo9qSLilI3hrnsE7Kst
	xrWjALT/gMCROYBvEnLkEwXcIFMC+bgRMcNgFtCYmBw++xTa5scZfTNkWWK4GNNOd77Fk+b56qI
	J7jVpvxH
X-Received: by 2002:a05:690e:807:10b0:666:2274:f9f7 with SMTP id
 956f58d0204a3-667d995de35mr7204098d50.42.1784058691759; Tue, 14 Jul 2026
 12:51:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713-fix-headphone-plug-cirrus-dell-v1-1-3c5157cd45cd@chromium.org>
 <87qzl6jf1o.wl-tiwai@suse.de>
In-Reply-To: <87qzl6jf1o.wl-tiwai@suse.de>
From: Steven Kendall <skend@chromium.org>
Date: Tue, 14 Jul 2026 15:51:21 -0400
X-Gm-Features: AUfX_mytNxbd4Zh52Bee1RDiY3xrRCrscsE76BQekKnVpIoaCyy4gg8kar6MaD8
Message-ID: <CAB1bpFCNC1NWYpBRzzuxQMFN2wugSYUq2G6tkeoiT=ThUE094A@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/cs8409: Fix for Dell Cirrus audio jack detect
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> This makes the remaining text not taken by git-am.
> And, I guess the text above should have been combined with the below?

Sorry about that! I'm using b4 and that was the result of having a
cover letter in addition to the commit.

> The jack polling is really the last resort, and I'd like to know why
> the normal jack detection doesn't work at first.  Is it the missing
> unsol event?  Or the jack detection itself doesn't work?
> If it's a missing unsol event, this drop happens always?  Or on
> certain runtime PM state?

In my debugging output I could never get the unsol event to trigger.
I'm not sure if that's the same as jack detection not working. I tried
a few timing changes and pin changes but to no effect. From the user's
perspective, audio plays both from the headphones and the speakers
when headphones are plugged in. According to my notes, I also observed
this on Ubuntu 22.04  LTS on its initial image, but applying its
latest update resolved the issue. One notable clue is that currently
on Chrome OS (with no patch), sleeping and resuming the machine does
fix jack detection, but I've been unable to fix initial boot behavior
thus far besides an approach like the patch here.
