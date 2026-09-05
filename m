Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C57366562
	for <linux-sound@vger.kernel.org>; Sat,  5 Sep 2026 06:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788589193; cv=pass; b=X+AVydp9wUuMopJsG2fGjUykoyFDxwncgU1NMO/6REg28N1ZUDx27GpDseJ5/VjV4Xo9BSAQcwVuyrFp0tTDppnnlnAP5Wz3L/wmTPdstLOEswstL/wR6XjuXqq6qzoY2lKpXiWlSsJQNI9k9hB6CDgWGqFJq9iJ+L7DFCjNSS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788589193; c=relaxed/simple;
	bh=DgVweYSWbQFkjqzyjgTXapKpHPz95R4xlOm930OD0hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+Yi9oHTTxDEfr1qotFnGB3CJad3QaTVZUxLvWDp3vVJ0lE9cwlHBBtwy5fqQfHIoIICp6f05LUyTldPILtAXNnR7aZaFaCra2bWAfxs9ApF4/Dt6q0QCxSXph0Zm/BgUJC3Mra/iJ6rXt9Z5pK5tR2WXEz5a5lwzq9fA5ZzmW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/M7zchY; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/M7zchY"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b4adcce4b1so540252e87.1
        for <linux-sound@vger.kernel.org>; Fri, 04 Sep 2026 23:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788589190; cv=none;
        d=google.com; s=arc-20260327;
        b=XoW+RNh6AArTwaz9WB7N0cILAZ/YUIeJyMsMnBeh+5o4xCDRh+u/UAz/rXM5tPsYlO
         4ax0IqKSsY3Yvpi9OIjXp3AjykMg3MRk/tXLYHHP3+xHK1sUYvBmNg7R1yGK9KuHlZDb
         cVZDCHcF0Z3OU3oB9IppkcECqF4QUfnM5WkBMgvjJwPqkEPBMQ+6DyT87bsjN7A5ZV+g
         1I9ICLwTf/jb8ZAU0gRFW4sed38IwKw5UNBUweMginfMsOahkrt0ndbqX0jQyywCy+0V
         iTYV7cS60uwMgfSst+5sB2mjXQnru5lQm0diyd2sVUBucpW761CnxQqJqFGO/ioj3Ukm
         u39g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DgVweYSWbQFkjqzyjgTXapKpHPz95R4xlOm930OD0hg=;
        fh=dv0fz/vZD1b32DVbMM+90hIb/mSlxZzkXR7q6tsLarM=;
        b=Eu0y07p6ktK4KMsK01XN0Gnoz14mBO8H1+H3XZUYJQsRKA8tofXYZfNskzs185VdAa
         KlS++t9X8FWxq1Y97LREcBXoLZsrAPBZot/wIdrggxg5uOhgQlst/A+7PDtFh21ghLJO
         s1PK0PJk6CM8LW68RmEoeIVEOAbfk7lSyl397l4gNJKyfFdMdYBV+QFTuMe+/l6oLNbR
         ql9JUkwTn4OZMwPpY+0x/nDdKQE+eEMgrnkQGQtQFmV4306k5D56h+vd/Ftqz8gd1/zP
         wU78hjj1+Aa+YcnW+TMNnAwdcntjS5orrAFHo9oWfNAsnZtuFR0/JUeGCZuMnZnheHLj
         smvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788589190; x=1789193990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DgVweYSWbQFkjqzyjgTXapKpHPz95R4xlOm930OD0hg=;
        b=i/M7zchY78vRSJvpMh7Qa9vuaIfzWcJtyiI+soT50eSvXIXaCfkMHpyeyweSLozicX
         xAzMsoDxdqk0xm1y/ygEZXa0LeLOhouq8SmThqo9+dxibrHgNKYA20zA4cTL9NgsqBDj
         JpyE6zqy+81nU8XPY2EQXa3Tod02EnksR/f0hZwYQYwlbdJENy2IvRR6J8xNdZOJtdE9
         M8lAzQDmz4xVlCh3PhmkNPy9nD/agIfIG7lPvOSsuD3E2r7P+7y65A87V5RLWawDz3oI
         POS1E7vOeACWJFAZ+OlZjxEkQX/xblxACIK1vxH6GrtbH1cA5AM4GeN97vgP/+KlP8zE
         jaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788589190; x=1789193990;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DgVweYSWbQFkjqzyjgTXapKpHPz95R4xlOm930OD0hg=;
        b=JhpdwjPqDVVFGYk0QUumJZb3WsezXOak/INvYiycNHLoUj007SkSWUgs9phvUSz5qW
         ZfNhyL3H9FbQKl72llTn6l0fifEVIJsnYx0Sl8vMJ6WfJvCp0cXYW1DR6vayVPQHg/+i
         ZKP85+B9Hnz43ReJkxJ1A4EklQtNY2p87UO1H9/VTCkUuZ51/Sy4cc7k5M1gMYyKNvyA
         lflEvnOLKWpA7racDDkWFLCdsPg95ZFDB3GDM1CjYThNtOEpitXi9EkqWkx768Wjl9A8
         ZZp5YuNAU1p/raW4uamWwmEEWQf+gOqeVdaMErQ6tDOwqaRRpSWoyFD8mSdGMLYyvi3M
         madw==
X-Forwarded-Encrypted: i=1; AKwUvBxl6L2QSx6zFR9Us4VX7ITyqk6UpWIjaxapv0QJaqw011llKpPCl3b4IgmWo0JRCpjifVCFeJi44zX9QA==@vger.kernel.org
X-Gm-Message-State: AFuF++lPvI76SqTZQdn0iM9gZjTSKujvXoGTVzYK9TDIg+kOQYC0veU/
	TlHaSCJVEXkmL83+g6EtnnZ+4K6ZZM2nkQAeONiEP8LPY/AYkvzGVJa50k8mKaLIMUnPE1+qX+T
	2I9ZizP61/p6wjeZ1G13SpUnvJPMvUDBshrS+RDE=
X-Gm-Gg: AYBFou0hfQ6R/dHuMr9NKFkZ6VhSviMi/9dB2G7eK/a3glg8fabewblW6npl0uKK73I
	GZF/u2Z7a5AO+/7kAeXwDwvRlCRsdfqDPwmrahSrRmEqlNDybscUai6LjvaS+efMB0GVVyHhav7
	C6mmE2PrxZJ3Mo7/hQ5CfV5ANXNbi+PlWvVPncskYIgmHBZJA3+OK+uc7gHf/iqXeqNkxu5hzTY
	Dq73/mWghnUuPdYaeVi1VIk9saqjqzfUvTaO1mc6zm0SW/CiPV/gAfDqet0z2br3FeDlhvtVQka
	vhItpOSfib7iQ6HQtPchCyaOdB6TyPNqhzWBktsTV9ySKg==
X-Received: by 2002:a05:6512:3ca0:b0:5b5:e265:5215 with SMTP id
 2adb3069b0e04-5b616f2389fmr2673007e87.22.1788589189444; Fri, 04 Sep 2026
 23:19:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEsQvcuaNZvLxyxNH_NOy5qwTmkrk-A9QdVtZD0GiCtPwk4A+A@mail.gmail.com>
 <20260904182023.4486-1-hhkieu@gmail.com> <CAEsQvcuMFt=m=njsPzRtKarz04Gwbds+f8p2S+SdSQmaiW1fLw@mail.gmail.com>
 <CAEWo5SpV6eyHo-tn+hKX4s98uCjGJg5Dz9fMkoWNDNqgofJ5og@mail.gmail.com>
In-Reply-To: <CAEWo5SpV6eyHo-tn+hKX4s98uCjGJg5Dz9fMkoWNDNqgofJ5og@mail.gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Sat, 5 Sep 2026 03:19:37 -0300
X-Gm-Features: AcwNN1Xcn7gxVJ-XcwGRHw8YjMjtJQlhyxhOoGl5Xct5WzB2wM4Yh49lGrcXjFs
Message-ID: <CAEsQvcsG_Q2uZQ8Q_MBhUyhY+n4HymMsuowSHfk-CHCBj6mbzQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: add Pioneer DJ DDJ-SZ support
To: Hanh Kieu <hhkieu@gmail.com>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 2:35=E2=80=AFAM Hanh Kieu <hhkieu@gmail.com> wrote:
>
> Hi Geraldo,
>
> I looked further into the is_pioneer_implicit_fb() check you pointed out.
>
> It seems the DATA case is intentional. In the original Pioneer DJM-900NXS=
2 work, Fabian Lesniak described the observed behavior as:
>
> =E2=80=9Cthe playback streams also tries to start the capture endpoint as=
 sync source.=E2=80=9D
>
> https://gist.github.com/flesniak/074ab23bbc833663b782f44174eae6a4
>
> Takashi Iwai later formalized this in the Pioneer implicit-feedback handl=
ing, explicitly accepting either USB_ENDPOINT_USAGE_DATA or USB_ENDPOINT_US=
AGE_IMPLICIT_FB for the secondary IN endpoint before passing it to add_impl=
icit_fb_sync_ep():
>
> https://github.com/torvalds/linux/commit/167c9dc84ec384c0940359e067301883=
ad2b42a8
>

Every other Pioneer device has that USB_ENDPOINT_USAGE_IMPLICIT_FB
on the IN endpoint. Yours would be the first without it in the IN
endpoint. Unless
your hardware doesn't rely on implicit feedback for syncing then there's a =
good
chance that implicit.c short-circuiting and still picking up implicit
feedback for you
isn't correct, but what you need to do is cool down now and wait for proper
maintainer response which takes time.

Geraldo Nascimento
