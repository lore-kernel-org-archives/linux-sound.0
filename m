Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF7E407579
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 13:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782738214; cv=pass; b=fbHHxdiyPaLI7J8V4+9ML5EXHxIuqpRYIlNZQrG0sdGo1gQm48NuPZCRkAzEjbj/k+ZB6Rp8DyAc+pXeL6lrd44Mhyrlo9BYMVAxVB5xRaq1YjNkgQlKeADyiFNVxiU7Rc4SyvmfSvHQSHTq8/XGQiEDDIYbBYEr5vJJiHKxHO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782738214; c=relaxed/simple;
	bh=vynTr1Hk7dP6PWuKeCIW2UxfYNdGBQppGIqGe8OJMXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZHNkFAUzcuKRoJGFvuuMgCPFltqws1VwK7UpFxzzXEhvRoTVVISqdLhvz48TMGC0sXd8FaH/KdfkHZlK9/w8oYIwzfHdJXvurGnbexTVaomXDE+O6hdQilRTKccLbJGrxR0eqfWgHQg6bPHx6OzFmUB8CmFyrZzc6sSdeR4U08s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbZc4zmc; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbZc4zmc"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c7ebfb63c6so20007385ad.3
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 06:03:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782738212; cv=none;
        d=google.com; s=arc-20260327;
        b=oGH6+vUMtTgfrr3t641V5VUgiOti0B8RkmLLvPuJxcrVz+63f4sKXaU1Cp2vAC0UWA
         qaLl9wieQq9uH5nbO5kdaCA4pVKPRhyiztdT4TkEVpmUgJHfazGGLvpie8WVMbVQV1tW
         nzFNpBdPB5bfbxTP7jTL8jnlJhnmIAOxkMUtNOAl26ZJ903hQsmpyuSta5RV5H46ffzu
         n53rKcFJl0ZYwIkNpISt+k2YVf6KRl2oCRC3GQqYlHEiGw09dg0LONuEF9niukBueI0C
         6YkBGhyCcA4v03YQLIuP2qnZNhjPd/9njvuSseUJz7ZTpludezTV9uVim/n7vPKog6tB
         tF5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vynTr1Hk7dP6PWuKeCIW2UxfYNdGBQppGIqGe8OJMXA=;
        fh=CeqwnOPNb+j4dLIU+qKc9gfFd86z2ji0yPVYgliDF5k=;
        b=g89/+qPZ5ILUmAXVmFIcGb14OVePFbPHW8a/iZF1iqIdx6dCMTu9cXJ1pNJgZYQzEJ
         NiClDrOYl4sFkTq6QLTt6ZCPH3DS0elQB6jPNSdvryE9sSIHFSHGmxA16bfgRVDOUP3C
         tWrCxxDCxFzYvsZn+O4jz/arU144vnpzwYMxn8ek60CvyoTGt9iplV3pOqF8bPgNpwFe
         blrKYiLpQvgeDu0NNN1SkqYN/V1ZMnOAddpUdL9tpQT2LDcuxI8tIhiQvB0vrkewTaGS
         GJgpnGCiK251g2IFoGIQWEr9r/PrP2bmRM3rmlUX2g8yuOR6c6UwuTzBKQZM/8TD6W4c
         XQxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782738212; x=1783343012; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vynTr1Hk7dP6PWuKeCIW2UxfYNdGBQppGIqGe8OJMXA=;
        b=XbZc4zmcIshjrF3XeoKBh2sA7ZbBkvT1cOgPVO+RJp+oIs4c2tguIOZ+dTvCW2dEYz
         33hWRZZJf8lhFJKjg5YD7CVeDfL9gOQxZcHGf85JXwhbS3Nq1NXMBCv6pN2og1Pv+5Dc
         VkQrBKGF5iY/WLMhxbFxq/eXoDFVw3u3n5Qc+bcgaYW7XJpEx31j27+zUDqKKrfOufdf
         hDXkwMXW/FvhqZ2g4RYY5+6NeaFYxf6QALf0lomhkvjTqRlnwkayvVWpOFsYVHixiNtO
         DEOWHWJSZzBSTDqJXGLaZb5+cCsdRXJyfIXBZvbLeMtGizkaJpl4fzwi9sk6KLi4cb5U
         KJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782738212; x=1783343012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vynTr1Hk7dP6PWuKeCIW2UxfYNdGBQppGIqGe8OJMXA=;
        b=YGmpQAOP6sWkqs48jfEuAoV5Kcpbs08gsR7KZlb6EfpE88BkvKUf0p/dVWXl8uTVhQ
         23XDAlgA+d2eFLsK5QkzduaikroLa05pTkzavKtD0Vppy02mgW5iDVp2kcZ0iDiJRf+N
         QHOg6I8YPwGkpzgCdJjYyiK5NElFQF9HJ7bYy+GGiP1Z4Fs2eCfFLZz5GDVT80QahJz5
         cyp7EKUPInqUXC8kh5Rzm5wGIWYQ+ztZdH1vCUNAKGTb9RmjBubx9xf8jJ29dnAPrCjl
         qLMgwS0TiYEwSLV2iRWvwP5fSVw3x6BL23cPS7OZl7zim4VyzUqw74GGJ+JxXj8XsnrI
         TtPw==
X-Forwarded-Encrypted: i=1; AHgh+RoJrd2oAJjkOiwMyBSUpyRRhxrHzcN5z69KYAYVVEetQbNWqa+Xepuwt6Sl/g0DC8zg6nE+U95qIUcjsg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7gx5hIT/qZF+ifNd3VNZV8qhHIQ4aCYerTskFcJ3YnRbXiteC
	uRcJWr5gE+ozxT1yicJ9dFYctX+vGOWzkqIFPAGRAWmzwUlIGgNYLmNtsqW91kIdmyOQ3qlTzFq
	+3mnrHbApO8dmlWoNUNmTX9iMHnI4S8E=
X-Gm-Gg: AfdE7ckqU+ivuXzlulIl/V8IF/QkAB7VctUJdPzzr5RpR2CPkEpMq7FGIjMPRo6wNkF
	DXGsu9PAIoJG0A1rSuiepOhNFmoo24O299AG0k7b+l7+zIBLBC5XJ69ErOQyRY+y6T9Kp0Ow+WT
	LGg2E7nFE9ZStxkhx0TjFEHXl53DVko9R2Zp2uy6n7Yd3GCEJLXaA/tqifOPHz4sFfI79Do1HKL
	48i7lLC6NGgVT57K9pu7G3QlmRPi41xM1q3ECWDkQ4WHNxMnewnX3704p1+JpQ6GMDmBfu9SXa6
	AGxoryp2D29KytcGArmnjxoOWPLNqPNQlxr40+IXnktf2z/VKibOi4e0lo/2XQ==
X-Received: by 2002:a17:903:4b43:b0:2c9:aae1:a61c with SMTP id
 d9443c01a7336-2c9aae1a7b0mr75488525ad.20.1782738211965; Mon, 29 Jun 2026
 06:03:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626082904.32344-1-phucduc.bui@gmail.com> <0b095ccb-5208-4813-959d-e82480bda50d@intel.com>
In-Reply-To: <0b095ccb-5208-4813-959d-e82480bda50d@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 29 Jun 2026 20:03:20 +0700
X-Gm-Features: AVVi8CdmgsEHZRWUBH3L_j9sreVnf9OT4yN2OAu3pdzMn6CnYmHTdn4b8Yr8g3Q
Message-ID: <CAABR9nGtu83T-_riRpbndPyqbhxQpNrcXU-avy2m1VC-H4_AZg@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] ASoC: Intel: Convert locking to guard()/scoped_guard()
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

On Mon, Jun 29, 2026 at 3:29=E2=80=AFPM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 6/26/2026 10:28 AM, phucduc.bui@gmail.com wrote:
> > From: bui duc phuc <phucduc.bui@gmail.com>
> >
> > Hi all,
> >
> > This series converts mutex and spinlock handling in Intel ASoC drivers
> > to use guard()/scoped_guard() helpers.
> >
> > Most changes are straightforward conversions intended to simplify lock
> > handling and cleanup paths, with no intended functional changes.
> >
> > The series has been compile-tested only.
> The patchset looks very good, for all:
>
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
>
> Can provide Tested-by: tag but not today - tomorrow, as my CI is in the
> middle of waking up after a routine maintenance.
>
>
> Kind regards,
> Czarek

Hi Czarek,

Thanks, I understand. No problem at all.

The only thing I'm still a bit concerned about is splitting the kfree
and guard() changes into two patches.
Since the guard() conversion is mainly there to eliminate the goto
labels, testing them separately might
introduce issues that wouldn't exist when both patches are applied together=
.

By the way, I'm curious about your CI. What kinds of tests does it cover?
For example, can it detect regressions related to audio functionality
only, or is it also able to validate
audio quality? I imagine things that require someone to actually
listen to the output would be difficult
to automate.

Best regards,
Phuc
