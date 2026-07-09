Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177D63DCD9D
	for <linux-sound@vger.kernel.org>; Thu,  9 Jul 2026 10:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783594604; cv=pass; b=M0G5Y9LDKCsFrDFCHeg6bqZE4APNN6xsTVz1Jk/j3rma2Nham43o3/tinv03Xp+C5CaF5e1D+1oF5dsJGLGtUnRw6bbJa2PmMztvklwbkauEzRBkkGjJs3eoV4w0WHjB7yW1V35BMJebC4z6PkH0xM7ZK1bHHhR5O9QQnVa2C/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783594604; c=relaxed/simple;
	bh=Y+uJfstw+xxbcZdy+Li+i6wOuNfsIiYRchvUdl2Ijss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YqkNu1JQ6vFwGQI6ph/kB6O3jGpLjlo1lzHitWSdyu439JGRFrapw0uG6iWkhaxcP2rTHCY1RILhT4j4kiulMKWOPet0FAR4m5kfyIowIVVDbi605sXz3Em0HSdUBJF1fbhiNff3Mk27pl55UO+lWsEzU42X1HAHMhYLQyovq4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rfpNJz3A; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rfpNJz3A"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2caced6038eso9385655ad.0
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 03:56:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783594600; cv=none;
        d=google.com; s=arc-20260327;
        b=QTYH1Vph0c2a9lm+y5ra3D9XUsuuDuqltQrWOteOEv1SngMA/ifSAIhTiUe9BkJw6N
         1sRdM7pwVHbsgNzjUD8lqzmyYPBudgP+bSyH2p9i6RsnOCj4chWoXBDkvZ+Ka93naRv3
         lL5dkRwzon3NUqhJWlNkev9udsauIRmZZByVysMjNVKuX0j4Zd6XiMr6D+Ug+TfgXA9a
         EF5Z+lhzSxvpQsyiMP4V0Lj0j9phLfL210Xjua3vL+m1OFCsbCWlq9ej1EN9NAbpMVjm
         1a3E1+7Aizel7GqYXwrQD8ho3hu30z9kv4ZQvcekfUoTESh5EJI8oJLpowM8TIUJbmhA
         e22Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=X5lcCVhiA32q32R/4JFuFa+uUZpV6do9ieFMQQf0JMo=;
        fh=H7lvMbfh+wWk5qPLnB8UMDk6tDRWZwmECuQRZYOmItI=;
        b=O7tS8VuRQFgtUxGy/YjQPKUtWfu1NdBB1UHhmE0NW8Abc5U5zCqMmFdPjJzPuDOA7S
         NTKP71q21hdoANAotA3y7swdAXA7DzPrEYDwaFizKYcPDWgP1LEm81cf/ybwjIYCqGB6
         ORJ9I+X0WQk38Z9NPkhEIux3HVxwtuUkj98ha13E1MCFyG1KwpKfKxrRab2z+zYKkCHy
         4aAKx+EA+9/WH2g7eqIII2aOyHwZkHgrAGs1jMfVhJ3hWiiDVFpoLu7Ojd16KbV18hU9
         nWKRdSP9a3W+YFcnrjmPqeX8L9/L8q1wRbuO1KS2X38dpP8qKshCDQhBmzejhkZjaMn3
         4bMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783594600; x=1784199400; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X5lcCVhiA32q32R/4JFuFa+uUZpV6do9ieFMQQf0JMo=;
        b=rfpNJz3Acs7rMYwL4/+Rrq/1o3GvhXIEe2i3+lgxP+4RgQCBwdD3nKx6ZTBqqI1i5k
         aLTa/5VyGT4JqzaFuRsru4EcfLqVapkW9wtzV/9l2Y5nTgjK7z/Q8xTqOhE+0AiUVTzy
         xfXr+8BcC68eepGgjsmYqYINZHUa0OT/zf0653Cs+gw3c48PSBbgRnsk06SKekH7ukC1
         yniowgOGcEf1dkFKfkiHORuXZHApUc8Pfvkc/11mgLqhxSPjjQl3Unw/+MkI9gpeOvPA
         ZqgJsgXYuuNrKDb6YKFv14UltglkHvbIUAbXwH5DDCTVvZP51LPSvrENiC26dBjz+Srh
         xDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783594600; x=1784199400;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X5lcCVhiA32q32R/4JFuFa+uUZpV6do9ieFMQQf0JMo=;
        b=Q6WhsdgB3pbC3PC9BE7hq+Lzxdj7S2KLpYV933ACTTnOpjBydzKcuqBGmJO76RjXKu
         wsNugYKMvrCuCaLnH/ccYtJ9xmog9UAPER0jmLuEgEwHrl4VIg2j3Iu5NodYEYEWmL+m
         JwJF557VxTEAhUdJm3rceAGsl24jav1Bgu85c0O4qL7bdVack4Nrf+6PnQ59PUmzoRG/
         X/5VNBso4joFdOCWUF9vO7srOm20V+N73SX1hGq9zyzr00s1mC5u8HuvjpSUwE9mPgnC
         W6SA3kMaTpAZhC89f3IawAtX0s4v9zR3/68Q4XgusWcQ+pbfVbalMam4dN4K0XjZu0ru
         faGg==
X-Forwarded-Encrypted: i=1; AHgh+Rq5JN8sXpAfc5dPmQALaVXBPf9qP4VCMq2Xtw2zYwvvbjJeT1VEJV9XbRClIccAKJoeqcxfS/Muc0rWeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLUxNzS3IsXIb1MMe39Xc0xUoI8rjQa0zh/LgBm0OAdUWXvazw
	3XpOCnkoQ99qRn5zzOR6AE3mY58tot8QppLg/8a3bk4F2sDA1RnBV+mdlf654tRrkD3i8ELp5YW
	/NhGVoUI/6mB0Tusk5MbKXM7av7pEI7M=
X-Gm-Gg: AfdE7clHCeI9osJgKO+2iRd3qv17F4nqyR+1v32/tFx6yv1R3mGIH8T7u5AvPFw+qme
	nA2QEl1YNoDQiIbrimwhWy88x5E3/u8c1qDlsqGNCEA2uf8Q8FiAZTT+Iw7oS6CW0YX2GL5mXOV
	S8TNtudvRPR71+qHIysK1WfL/nZPPvXuzfaxOhO3VM2tFM/PmYG8crku56gEd5gcvzEcFcfzHni
	Mrni5vpZo6X9pkZoO4yq71GdpZf6NomuvuIicOMdFkXnD1OUgIZ9uUhQruW+wH0jXo6qtJhlV/p
	4lzNA74dGBXhMvV80O3k1fEqQzVrErd6O/xze7S0ZUKBPEqv6XxTjRq/WIRemA==
X-Received: by 2002:a17:903:2a86:b0:2ca:12aa:a390 with SMTP id
 d9443c01a7336-2cdb9de8ec2mr24313235ad.0.1783594599597; Thu, 09 Jul 2026
 03:56:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702050236.30751-1-phucduc.bui@gmail.com> <ak9xV8VdUT91gHZk@stanley.mountain>
 <ak9y9Nlxz2lu4ObE@stanley.mountain>
In-Reply-To: <ak9y9Nlxz2lu4ObE@stanley.mountain>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 9 Jul 2026 17:56:28 +0700
X-Gm-Features: AVVi8Cdvmccwhujv-pFKjyifU3_nqGQ0Jh3D7rHZ4-YS8BkchmMRt5_Vss9fOeU
Message-ID: <CAABR9nGjce+HD2JwTsR72J55ia8OC+dxD9vJL2-3PpPRdn3UfQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: oss: Drop redundant nonseekable_open() return check
To: Dan Carpenter <error27@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, cassiogabrielcontato@gmail.com, 
	Kees Cook <kees@kernel.org>, Cen Zhang <zzzccc427@gmail.com>, Len Bao <len.bao@gmx.us>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan Carpenter,

Thank you for your feedback.

> >
> > The idea is that it might return errors in the future.
> >

I looked at the history of nonseekable_open(). It has existed since Linux 2.6
days, for over 20 years, and its behavior has remained  unchanged.
The comment still explicitly states:
"The function is not supposed to ever fail..."
It also explains that the function returns int only so that it can be plugged
directly into file_operations, not because callers are expected to
handle errors.

I also checked the current kernel tree. nonseekable_open() is
referenced from 86 files,
and the overwhelming majority of callers ignore its return value
entirely, following the
documented API contract. Only three callers checked the return value:

+ GPIO (already applied):
https://lore.kernel.org/all/178332860255.18708.5813708689955494780.b4-ty@oss.qualcomm.com/
+ DRM:
https://lore.kernel.org/all/20260703020919.7958-1-phucduc.bui@gmail.com/
+ASoC:
https://lore.kernel.org/all/20260702084445.519669-1-phucduc.bui@gmail.com/

If nonseekable_open() were ever changed to return real errors, that
would change its
long-established API contract and would affect a large number of
existing callers.
Such a change would require updating those callers across the kernel,
rather than
relying on a few isolated defensive checks.

Given its documented semantics, its unchanged behavior for over two decades,
and how it is actually used throughout the kernel, I don't think
keeping redundant
error handling here provides any practical benefit.


>
> > Also the patch is kind of sloppy...
>
> The sloppiness was fixed in v2.  It's weird that there were no review
> comments on lore for this patch.  Are people sending private reviews
> now?

I was reading through the code and creating patches at the same time,
so I submitted cleanups as I found them. That made the earlier patches
somewhat inconsistent.
After Takashi-san reviewed one of the patches, I applied the same improvements
to the rest of the series and sent them in v2.
There were no private reviews. The feedback was entirely public:
https://lore.kernel.org/all/87echlam6x.wl-tiwai@suse.de/

Best regards,
Phuc
