Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884E533999
	for <linux-sound@vger.kernel.org>; Sat, 14 Sep 2024 09:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726307448; cv=none; b=h8JYzDd4lR/Wk+zWHmZ9MgU52a8QR7mzqIALKSl3JJTWvLGvGkRUWxZfBoEcOiUWMRuOhRI68WOc+x4zxFVabU6jc2ISdfiuulcNEXd598JI1GwppB3+QXLIgobn4/T7oLlPK5drVH/7TrD4x6fTRNmiNXy+BlSlsqXYJuwQcyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726307448; c=relaxed/simple;
	bh=zhSneWLXFCVVLqmMTD6MnQSH5pGQ+P7hTFbFd5EsMYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mg0n3CxCzWliCjQ/xjcHai9DwWWslKd+gPx2XVNU3S21ydIRnWfJ0oOsQp1UG+OytOo9SIES0xtdb3ssn/tBZqcfuUFLFt6sc6JfE4ksBUAZkLRwpYVCxIUZDkQI7qe4IHA+kjKYXwKwUVXksOl4413RGiJDZx6sqdReQhTo7ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NAtbNUkn; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NAtbNUkn"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a8d60e23b33so362182366b.0
        for <linux-sound@vger.kernel.org>; Sat, 14 Sep 2024 02:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1726307444; x=1726912244; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0Z3Kfeu0LIfwumusNuh0KHY7evirzDwLG/vl9vmdqxI=;
        b=NAtbNUknod/zrD7cOjpOJaG5516LZY93mbWUQdQ1bG/57ywBA2LZADf10WLbslyCxi
         EgYM/pg6ePrEsFXhklCtwbkgERbMWwOAHqRsAIk98wNuHfRc7xthoE0Z/p3k6FumSBSs
         F3RecaHOxzcinryYyhr3Nvl7A0h/LTKTp0YMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726307444; x=1726912244;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Z3Kfeu0LIfwumusNuh0KHY7evirzDwLG/vl9vmdqxI=;
        b=YGb1DPM+Z+UGsIx8xXmdt6PPH5NUbSr9nPVzP8d34pFa1YURkAW4KFl/tP/wKZ7qVX
         RE4yZCKXv75d0NUL1ppYgJ6Ba3tTWCho3G8thALVWQMxCgZ6r9sXwllsKuq+4wCrFu44
         XotGarnACIaIFuzQyKYHdmoEng9O294DqJvOLFS5+5vtagV1aHQBkPnqYdxzvGk/kb1a
         Hcxx7syXwA8d4y3Efe94YQD3HwfR1NT42R7ZY0IK4fBaP+IUpkkDdEqc22Nq9P6FtyzX
         3PpSUsTo8NNAYIi88pbSumDi0ItCNn1TPHuOl2hu7BA3blhKt4u4s7tKTzxy+0PzK9z/
         bEDw==
X-Forwarded-Encrypted: i=1; AJvYcCWHiqTBZnKywfHZ0NZjYg0NzleJYZ1RCOGC4/Db+g7qrWlNXUBz6WR+rHEpv0lO8iP+UCetDz716wmFpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqy+bzbIzgUfz+RbrjLuwrTzcS9amdgWH9+E5GDSTQc5cFUZ41
	BWo4IJVvd+N1SEe2F7VkOb7pYJJzpD9efZ4VWBPI1qGlgKNcHh8/ot4xVtt5Go+131q5j673jlG
	fzCMNYQ==
X-Google-Smtp-Source: AGHT+IGhgwgfSwYgVJzMeaCDZlHQsCIWiToEDSKmSy7P0dk9oiO1YbFCuTPxaK2jx5+o7VTli0CIFg==
X-Received: by 2002:a17:907:7242:b0:a8b:6ee7:ba25 with SMTP id a640c23a62f3a-a9029617e57mr858070066b.47.1726307443807;
        Sat, 14 Sep 2024 02:50:43 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9061328dd2sm59292466b.200.2024.09.14.02.50.43
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Sep 2024 02:50:43 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c245c62362so3189528a12.0
        for <linux-sound@vger.kernel.org>; Sat, 14 Sep 2024 02:50:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXnLpS4dhkJWqi/URZY0/yEHgctxXdME0Me4+xzAZuMYfMbknk4pxaF/gUVCnbSunRZoyjV/CTrFxzFLg==@vger.kernel.org
X-Received: by 2002:a05:6402:42c5:b0:5c2:6a7a:5795 with SMTP id
 4fb4d7f45d1cf-5c413e06c05mr7363046a12.6.1726307442755; Sat, 14 Sep 2024
 02:50:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87ldzubqgr.wl-tiwai@suse.de>
In-Reply-To: <87ldzubqgr.wl-tiwai@suse.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 14 Sep 2024 11:50:25 +0200
X-Gmail-Original-Message-ID: <CAHk-=wi+31+ctjVhgVww4MN9vD=vc27uw_KepbufhgzxaEHViw@mail.gmail.com>
Message-ID: <CAHk-=wi+31+ctjVhgVww4MN9vD=vc27uw_KepbufhgzxaEHViw@mail.gmail.com>
Subject: Re: [GIT PULL] sound fixes for 6.11-rc7
To: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Linux Sound Mailing List <linux-sound@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 14 Sept 2024 at 10:15, Takashi Iwai <tiwai@suse.de> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.11
>
> The topmost commit is 134536c21275bb3410cd1f10c5e369d30702741d

-ENOSUCHTAG.

I see the branch with that commit, but no signed tag. Forgot to push?

                   Linus
