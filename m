Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA241917E7
	for <linux-sound@vger.kernel.org>; Fri,  7 Feb 2025 10:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738925659; cv=none; b=SFfdBHrxXXsJDGVjdjmD6MLydg5qq5SdGsQt3V3PsMwgHoH1G+OgUIzmpSegVLeY1lIg4DH7wz77mWehF9X3w2FBoW7s021xTceA1BzUI1RwECq1NuDwA+X3a/Igxe2MGHrOU6sGepzM9XdOTxYxpBxEMMb98cLGGcFLjXaILkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738925659; c=relaxed/simple;
	bh=dSflpRyFbrTCZVi6NediRQrPo4kuZnPLOGm2z/uaHaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hrRWh8Z6lV99OIWVAjgOQV0z5BTLhGJBRsJjZXgstA0kCyEE+7BgsGdnANoxHBAdCSHlDeVo8DiE5kXT32kz5hlrmKKE+JpthcYY1InIQEjF0JjR/HNKL0bb1JTP5a6YrdRSBX/LzGaC88n2hlxX+6HRgjRJ+hMWuiLB+hM4S+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kzvMGjJS; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kzvMGjJS"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5dcd33d9d9dso8301a12.0
        for <linux-sound@vger.kernel.org>; Fri, 07 Feb 2025 02:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738925656; x=1739530456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dSflpRyFbrTCZVi6NediRQrPo4kuZnPLOGm2z/uaHaI=;
        b=kzvMGjJSnUIqR/UCh2PbiPgU97eZO2gcUYO5oJBNJVWF30FVs9FComzsK6KVeGPJyP
         d7Lzl9da709MS1Qe3EDdkrxZY5zkGk/i/MsOnAbeNDt7wJ2cCnmE195pDf+5e15zWsUh
         dw7BwnaSZS9aYqvzPrlgm1KrI3loSAgKFU1u3xheTLIDpp2+upRkzKvEuDF39PVIpi85
         N2NEszzPAzGi1JfQya5TkVB5E/nHDpI78pOEpoYxJ2GCR9flUdLGkF6awAVIjI1Eeib+
         T/P2u4hfxHc6YjDzQasIZ0sllYqzQBF2Aas6l4S5bpZ2Juz+/Gs16amkKfRQZGO1xsbf
         7Ykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738925656; x=1739530456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dSflpRyFbrTCZVi6NediRQrPo4kuZnPLOGm2z/uaHaI=;
        b=d7qwmpVYooQ+AqYJ5uArtwg6Vc/Si+DgnCjSXjXhbyVJQjC2p0r9SBMoc75TvuzBXM
         aVI8apdc6R05tQULLR+fQCAcc6j+eXQUGpyhyjmj7QLSw9dMZDd6Myh6N29u/WxHtnTF
         h3KKNL4b5UStQIZ6EkuPTa/eFActxSe0HOsF0CqHQIFwrvpetNdnLpQvOxz+3ZvZbRhH
         WJhCtNB+VCNx6PyA0PX91cXEpTh8SOsElsIw3p2Wq+wMBh+FSL78nJNrpgoFqEfwpuXG
         l9oZvM2IJMEGUj2mU9gA97Sot9BIQRo1k56OXnFZnU2OihlEap4dd8jQliExXUBYxbNd
         ZZdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFxqqUYJ4oOvinzo4e7Ip+6CcxTAnJkEuxUlurgZHfk3CmN6ugsn23bZysDpJOFag23Vqb6YOkwZJUvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbsaJhoC8M49OdYNSY57731pY+Il45+chIK9HSMlPdJU8+QcKW
	eWz7mbJjAfCWwMd56xQBwKIi3JE/9l4yy+C7GttEClpzbgGYGWnClAFuIDOkgJd+oUgRFlhzcNM
	oo2Mv66KQWAwcnuBw5avpgL2atxOApjF4N9Pr
X-Gm-Gg: ASbGncuuSfJcZGOODVzVYMaXfD2lTuV5humtMOrqqiAJki6TaKe6yD3agrFx3+j3vSj
	gmySf4cJU0iybD8w07vejrJcX1us8A/oRhagxUEYfPG+gfTLuA9OYjHstyYO+gvIz9sGwn3v3lt
	cjopzXfLE+Z33rnwU46cUaydZ1
X-Google-Smtp-Source: AGHT+IHtlyXXzkvXmLUKCILij4rf4Kf6Xt30bOPrPbaEDL98V2QDPJq4D2CF12ijDlbmudrFmDB1UoNvTH8Vc+Diqvo=
X-Received: by 2002:a50:ee16:0:b0:5dc:ccb4:cb11 with SMTP id
 4fb4d7f45d1cf-5de46901c8dmr88336a12.4.1738925656242; Fri, 07 Feb 2025
 02:54:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117145145.3093352-1-guanyulin@google.com>
 <943a7b09-8e77-4813-810a-18fea0e61482@linux.dev> <CAOuDEK3aip9SLCUPOzpVPwx-O4rmF-+sQrF4GJasGPBzV=qJdg@mail.gmail.com>
 <e5b1c3bf-4457-4859-92fc-785f7d6037fa@linux.dev> <CAOuDEK2u509kNjyL6qm27QgvtoCscRcsLixW=W8ABz2NF8A-tw@mail.gmail.com>
 <c8c699f7-bf9b-4e36-910e-c6f1c7092543@linux.dev>
In-Reply-To: <c8c699f7-bf9b-4e36-910e-c6f1c7092543@linux.dev>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Fri, 7 Feb 2025 18:54:00 +0800
X-Gm-Features: AWEUYZl-ygjTK0GFUqDaE7UIIfIr1rSe0TLqJUl1pqqByXhtdHXZ0WZRgydueGo
Message-ID: <CAOuDEK1w9Xbik-VbXwSd1ZYUWx9EQ_TnvEdV3WX2L-8Wtuj5bw@mail.gmail.com>
Subject: Re: [PATCH v9 0/5] Support system sleep with offloaded usb transfers
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu, perex@perex.cz, 
	tiwai@suse.com, sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com, 
	ricardo@marliere.net, lijiayi@kylinos.cn, quic_jjohnson@quicinc.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 7:57=E2=80=AFAM Pierre-Louis Bossart
<pierre-louis.bossart@linux.dev> wrote:
>
> On 2/2/25 20:57, Guan-Yu Lin wrote:
> > On Tue, Jan 28, 2025 at 11:22=E2=80=AFPM Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.dev> wrote:
> >>
> >> I am not following, sorry.
> >>
> >> Is the desired outcome to
> >>
> >> a) prevent the system from entering S3 if there is an active USB audio=
 offloaded stream?
> >>
> >> or b) allow offloaded transactions even when the system is in S3?
> >>
> >>
> >> which is it?
> >>
> >> a) would be rather interesting, but currently we don't have any such b=
ehavior supported. When the system enters S3 all audio stops. The stream wi=
ll resume when the system goes back to S0. Do we really want the battery to=
 drain in S3?
> >>
> >> b) seems rather complicated, once the on-going DMA transfers complete =
then who's going to refill buffers for the USB offloaded streams? Allowing =
the lowest level to operate even in S3 is only a small part of the puzzle, =
someone's got to provide data at some point. Unless the data is generated a=
lso by a side DSP having access to mass storage or wireless interfaces?
> >
> > Thanks for the question, the intent of our proposal should be (b), to
> > allow offloaded transactions even when the system is in S3.
> > In our design, the DSP wakes the system before the buffers are fully
> > drained. This patchset enables the USB controller for offloaded
> > transfers during system suspend (S3). To be precise, this patchset
> > focuses solely on enabling the USB controller in S3 and does not
> > include other necessary components for continuous offloaded USB
> > transfers. I'll revise the commit message/cover letter to reflect
> > this.Thanks for highlighting the potential ambiguity.
>
> Thanks for the precision.
>
> It was my understanding that anything above S1 could incur a hardware/sof=
tware latency of two seconds or more to go back to S0. That would imply a b=
uffering scheme that's significantly larger than usual offloaded solutions.=
 In "typical" offload implementations it's rare to go beyond 100s of ms, si=
nce at some point you run into user-experience issues when applying volume =
changes or when changing tracks. It's usually a no-go if the user has to wa=
it for a perceivable amount of time while the buffers drain.
>
> Not to mention that quite a few platforms no longer support S3, since 'Mo=
dern Standby' aka "S0 Low Power Idle" or 's2idle' was introduced in the Win=
dows 10 days S3 became largely a legacy feature gradually dropped since no =
one really uses it.

I think for mobile devices, the S3 state is still used since the
hardware/software latency wouldn't be as big as you described, so
mobile devices could still use S3 for power saving. How about using a
"knob" to isolate the feature to specific devices? "Knob" could be
dynamically switched by some functions, or we could statically
determine it as a dts attribute or build config. Will a "knob" address
your concern for this feature? Do you have a preference on the "knob"
design?

Regards,
Guan-Yu
