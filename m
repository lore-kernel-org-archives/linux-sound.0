Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A908F345721
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 20:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773780421; cv=pass; b=ar4ubWOzCUBg9tTbXUt3Ao/MtdFhN9akNLsnqgz5pjG6IioWtBZD6Qbsqy4qfUjID8IUaUpiPto/6SIvfMDm0SdKibd9VB9Ca6REUPWWtC6hQPyyK5G/VYtFJE031MNDdedXJXtVKtGTyQAXYJAvtvheY0ObUL+xBmu5e1TEavE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773780421; c=relaxed/simple;
	bh=1UqOfPikprRq6BleZK7camV+7IT1c8k2nbOkIlVFbsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ATfZwJjGCRD9MAeN9kSQLRpcuNVlbJs15I589l3I6sMDP/yIlrfRGslvRojSBIeTd69R1BLdaH/KPFFwmc7GRLsHNQDr/RUSvKOefLxKhbHcbtEXUvF3kennrg6LfwsJqW7Sya/kZCXH7ZepTSS/FQWbIV+jdtDZKiof2b3S6RE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gNoejq0Z; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gNoejq0Z"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-509062d829dso43801cf.1
        for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 13:47:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773780420; cv=none;
        d=google.com; s=arc-20240605;
        b=fqXOiDlt8sbph0yad8m+czpY6voGgC2eXhNwb+mfyS5gCdHL1NplIp/wwSq6o42hDy
         Co79syeNTh8/NFk9CejJYOiYOi48Fx7DyJ8kRFc2BE0LN7bmo8J/RFTsC1Kqu0nLve+Z
         +H+j19cFPPgZQFjHULJVB128Gpq3Bk3af8DpTPRDnZt5vkqm7s0S3ZAX8QZmub4zM/zU
         8JTC6TUhllsce51RheT531rxE2sPbqzx+3U2B6VyV4G3mZoqMLyg3jyP7uyLIvaTaakk
         DQWd2hLlufqhWD6V/RVEKZIynCezXmXLwUf8Xl4sMrdSDgHoHZjFCYBTnyYVMIHxtCLa
         nWLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U0g7Ha5KuBuAQFnpUh5T9xFIsqyLN9o7sep6G8COfJE=;
        fh=T4ySvPSRYtNhyVTR7YBTDFDws/Q+dkDavxBp2KBJN3A=;
        b=ilwYOrM1ZY2VxfsPjeLXXU+eSsRWQO9TYXTIZNuyTFcEDJM0c5Ul2aeXMHzE3mPRNn
         GrfqkpqZzN93SnEyb3F61JzIy9vm/Gi5LwZQKCtbOOB79z16NmUyDNtbpuwWtUI5oL+C
         xIYzZSWnGMxfeguOWuxrtlkk2J526qwNhrg24nuSeh6yLo8ntHx7dCHViQBzAVwUFHA9
         4ehKXrMpmyEDoNjSdp+P6jYomPGFhdIyLJUw2LzvxOEt8JYIA9cReyK2+l8lMIuSmk3d
         HQgIeCeQPGGWfbD40sDIMJO8mcCTaxtcsMXt5zrb0lveXUOANJcNN0zwQUKkxqq2BaYJ
         FEhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773780420; x=1774385220; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0g7Ha5KuBuAQFnpUh5T9xFIsqyLN9o7sep6G8COfJE=;
        b=gNoejq0Z+ZXNvAA5pW0oniBO5yuME5HQ4XIGsvFBArbL6ePhitEA13RlgvbVHhnius
         7MHZlWHdtLf12aMb0ljZQrWB/qFRoHV2husE81T4bo0KgkKQ3wqL3yCoAcowpbfTaQ4N
         X6l7i4bnrz5MPK6jvOKNbTkxt/kvAdCEMqTS53dHJT53XtUP3ddwHX/eCDHN0u6rRiV8
         NEsLPevI2mYkTBz6ffT6IdAFpSat0CPqLogKNVOCD7WfLv+mg+DAcOsalGjeu2bspjIU
         mDISn5QbIg3L1wWUqPqQzm1N9jvUttl/zxV9RvE1+UfJgnGL6/JItzovDUcvRMpx8Qol
         RAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773780420; x=1774385220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U0g7Ha5KuBuAQFnpUh5T9xFIsqyLN9o7sep6G8COfJE=;
        b=XAENDc578nCqXPYm35+5cfW/+Jzke9VO/F76QDRPmRxu/4svOoO1dYlZAZjvYfm/IA
         CBOr2IMMkJf2bB+zoHxIRtjwVF+K7xKAN3UdlgpsvLqA/Xi/7M82OcmTDQOjuH+I/88k
         +xibBUUtLP29ZVfBsiRRc2d2a+aupdtUexcrd3zV1UQSUPCIV3oQQWDD4BUrE2NAav31
         LzgF2d4+DNCB8eqBLkBTGByDPfpRtea8kvBUsJD2oJLqhdlbzyGTWCRUV8TUUUsWyIr6
         BAQbJXlLjttIcEs8Ko1vj92bNpFv6e12cnEU79UJmOqdo2CCKbp4XlW0rR5gt3V1lhPo
         TDkw==
X-Forwarded-Encrypted: i=1; AJvYcCVoDKpnCEuxdtQn+jel7jsqJL/1qaePunURdSJDrWB1pZFxSS4pIk21lR3Rw47E2wvFmbv0hq49S9sKYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4FNiVn9Q2I528S2NnY+2fDxptvWUbGLcK2foGxfJOx+ICK+sj
	bgV3SLf5YWSriTShWOj3TwR3+j+8MGU0Ow1SKsJby2e4606F2yTaJUd9uKTrvqO8o4Pv2jfhH7e
	NjIg+BG3MVntRr1ZyhWwqSeVjGqEGtRXAKHBe0dlA
X-Gm-Gg: ATEYQzxAt2V7dO207Lqe5lxzt5aAkUbD7vRRyka4oelkczVa/UzSDjdFYOJPGerCQwG
	5Rae3Bo6DuC8bhN8lGO63kM+HoSOTGchnmaTbBFTuKYcFk9Bx1usnLFcsPyrGXYibFbbUTfpzGM
	qavP3CfvZE04yO+sKQMYMWtnjhx/1gRmJeRtecXzLKH4szCFxaaE9SJ4pw1XzShw2OkfgEPaa/1
	ETzW/l6lJKzzG5ChmQc6/OMpy2BSe4p0bFV/UZa22HLs8L7dR5WMQqVxnjyxL1CTuYpvI+RJrvT
	HfJsrQ==
X-Received: by 2002:a05:622a:452:b0:509:25d8:9991 with SMTP id
 d75a77b69052e-50b148afba4mr3544991cf.16.1773780419110; Tue, 17 Mar 2026
 13:46:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309022205.28136-1-guanyulin@google.com> <20260309022205.28136-3-guanyulin@google.com>
 <2026031115-unboxed-spouse-1dcd@gregkh> <CAOuDEK3k6nyiHxhcL1kv=QNQaZMF6ms=sLerSZ5JBc5WBd7nAw@mail.gmail.com>
In-Reply-To: <CAOuDEK3k6nyiHxhcL1kv=QNQaZMF6ms=sLerSZ5JBc5WBd7nAw@mail.gmail.com>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Tue, 17 Mar 2026 16:45:00 -0400
X-Gm-Features: AaiRm52oebfHWYMuJ454hQral2Qma88MIrRh798G5MT3B5G2QN7X35-2OnybgKY
Message-ID: <CAOuDEK2pyt4nKWxXXwtzgRuP6u9kvi_Joe8Ec8qDDHVzSue1rg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ALSA: usb: qcom: manage offload device usage
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, perex@perex.cz, tiwai@suse.com, 
	quic_wcheng@quicinc.com, broonie@kernel.org, arnd@arndb.de, 
	christophe.jaillet@wanadoo.fr, xiaopei01@kylinos.cn, 
	wesley.cheng@oss.qualcomm.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On Wed, Mar 11, 2026 at 5:31=E2=80=AFAM Greg KH <gregkh@linuxfoundation.o=
rg> wrote:
> >
> > You have multiple levels of locks here, which is always a sign that
> > something has gone really wrong.  This looks even more fragile and easy
> > to get wrong than before.  Are you _SURE_ this is the only way to solve
> > this?  The whole usb_offload_get() api seems more wrong to me than
> > before (and I didn't like it even then...)
> >
> > In other words, this patch set feels rough, and adds more complexity
> > overall, requiring a reviewer to "know" where locks are held and not
> > held while before they did not.  That's a lot to push onto us for
> > something that feels like is due to a broken hardware design?
> >
> > thanks,
> >
> > greg k-h
>

Hi Greg,

Thank you for the feedback. I understand the concern regarding locking
complexity and the reviewer burden. The usb_offload_get/put functions
track sideband activity that runtime PM cannot reflect. This is
necessary to prevent the USB stack from suspending the device while a
sideband stream is active. Ensuring atomicity requires orchestrating
three asynchronous subsystems: System PM, Runtime PM, and USB Core.

To address the concerns effectively in the next iteration, I would
appreciate clarification on your primary concern:
1. Preference for fine-grained locking:
Using USB device lock ensures atomicity across these subsystems, which
is inherently a device-wide requirement. A fine-grained approach risks
races during concurrent software events, such as a reset occurring
during a runtime suspend transition.
2. Preference for improved transparency:
If the coarse lock is acceptable but the implementation is too opaque,
I will refactor the next version to be more explicit. I plan to
include device_lock_assert() calls, __must_hold() macros, and add a
"Locking Hierarchy" comment block documenting the vendor-mutex and
USB-core lock interactions.

To clarify the "broken hardware" point: this isn't a hardware bug.
These races are triggered by standard software events, such as a reset
occurring while a sideband stream is active. Please let me know which
direction you think is more appropriate for the kernel, and I will
refactor the next version accordingly.

Regards,
Guan-Yu
