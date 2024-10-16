Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62A81C07C0
	for <linux-sound@vger.kernel.org>; Wed, 16 Oct 2024 07:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729064407; cv=none; b=A11rYQOTGyKneK5dQ+9kYsS65hUfbNtCX+Ce3oOQqBqOjEE6RUflneyzyhoTRULjVsvjakx0ifBtp04y/4Mdi4pDG4HFkJv4MFGkUbwFjqaRXtVueUq33SwwhCoc7heKDRAMm87QmvVo7puYfkWgvpR3F8YMbys3IKK7E7wZyiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729064407; c=relaxed/simple;
	bh=rcYzwefzKTgPK3mB86FXObjcdy9RYBz+8Enp8eDLiqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fe8XOs52TwJG4PGKFYJpXBdcqG86ezBpdA1ZWNtF3/MOMWg29UVIXRJ3JyyHxYrPfCpkycm2/IeTxrNqcKOxKnDmHOb1XXacKlM6fBabb9pQqWYWMl0TzZw8Ci9O76yaV+VZ2sLzEinZIaw6f4Ifs4kkGL0fnKWFGzFUJVgPqj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O9QcEgLU; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O9QcEgLU"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539e66ba398so9277e87.0
        for <linux-sound@vger.kernel.org>; Wed, 16 Oct 2024 00:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729064404; x=1729669204; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ehTktfLGz6twLu/5oBplmy0RG+dW6zbCHDSQvLGj34=;
        b=O9QcEgLUy49dCdv5ZOhb5rgPLIb4V3tdKxOJMDXOZkVukcv3SjzrbMSXy5oJ1HFvKh
         Trm2ZlTKQWBio+r4pjuMMO9QE8VptyULNw0o1I3uu5v90brYC+3kcvXyycgwgzklnqFJ
         5Ce3ZBu0QeituC5obozZgGQZZC+EGagM3G/Iv6vATkBmpWNuIHN4dCs0hwGUV1dWGWlI
         PrPf4LWVVsXM9tsZL+90Q1RdavwUPafLaH46y8OtJts1N99I/dszfDKVs1/HbZOmTYk7
         XgZUosHTK7/hAhdEGn2kgVFya6YH/XFAPZcImSbogN9smm+iFwotjEfFS7culMi2yQLR
         Uo4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729064404; x=1729669204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ehTktfLGz6twLu/5oBplmy0RG+dW6zbCHDSQvLGj34=;
        b=cVyBZpTNcdleJGwz9fSX/MzZd/ANRj4rUz0e9qvQDVKuB0vxH5sw1Bj8sIV6JU+ysB
         JiFJcRtVxFYTxofZa/AYU8qBQdCbIuaH2BqAoqeYufISQbWlL54ja/lV/1WKGAqOpqOG
         GnIuN9QRy7xupScZJFmVNxUGYLoC1L8LwtqKSf5H9F3JjeCYRtzhkngJtirMucyiZtWJ
         EFsOncXM3Lc12NrcLNkR6o29j7i3Rc7T9CaHjNNWJ0m9+soR/PxjjDpBHmFfpSa1X+Bg
         FGZzBU1tNWLzBC5jd8ZEJ7Kk3qHj+voVt4ZFre+32YQFXbSyn2zk3cRE69YfCzZSG/QX
         XywA==
X-Forwarded-Encrypted: i=1; AJvYcCUcOsBn32t2G2UisBfwaEYdXfowdbYDpnKk4jViunj3uyzmKcnueR0yLv/6EAJrTZz1vAJZyHxWMuKAdw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrd91DRGKUHhKiBBoGfvVoIYlwXaOXvWYjch9MgGNioK54aRVW
	N1N5OZM5xY7xiSVz7GNyp1VI8Ft+qzUMXVhX6/43o30qO3JZKzmqbDSvGdmBZi/Kqt2GSzi7GsA
	IycvJvDUFznPbQqWk1Bn5ssjeGIbVzLdUxUec
X-Google-Smtp-Source: AGHT+IF5Uo+ip/0IVhP7Pd4XrUlYyoWYSwUDIYM9E+pUSFy/eEfINVsRLlW6lVJRybb2mEhD/UI0LJqdNWhb2s5k+zA=
X-Received: by 2002:a05:6512:2206:b0:530:ae18:810e with SMTP id
 2adb3069b0e04-53a05f2e6d2mr232691e87.5.1729064403721; Wed, 16 Oct 2024
 00:40:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014085816.1401364-1-guanyulin@google.com>
 <20241014085816.1401364-6-guanyulin@google.com> <9b5fe5d2-77a7-40b7-b260-856c35d9dcec@rowland.harvard.edu>
 <CAOuDEK2f_mtfiye7MdnOqEkq3pYW1kcdkwEMMBC5CkkQ1OGu3A@mail.gmail.com> <fddf19f6-d03a-469e-a56f-ef390c099902@rowland.harvard.edu>
In-Reply-To: <fddf19f6-d03a-469e-a56f-ef390c099902@rowland.harvard.edu>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Wed, 16 Oct 2024 15:40:00 +0800
Message-ID: <CAOuDEK3mmR9052FWEJAVBkUanVJ1MLLebZoANiasUpD9TDBjfg@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] usb: host: enable sideband transfer during system sleep
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	mathias.nyman@intel.com, yajun.deng@linux.dev, sumit.garg@linaro.org, 
	kekrby@gmail.com, oneukum@suse.com, dianders@chromium.org, perex@perex.cz, 
	tiwai@suse.com, niko.mauno@vaisala.com, andreyknvl@gmail.com, 
	christophe.jaillet@wanadoo.fr, tj@kernel.org, stanley_chang@realtek.com, 
	quic_jjohnson@quicinc.com, ricardo@marliere.net, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, badhri@google.com, 
	albertccwang@google.com, quic_wcheng@quicinc.com, pumahsu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 10:43=E2=80=AFPM Alan Stern <stern@rowland.harvard.=
edu> wrote:
>
> On Tue, Oct 15, 2024 at 11:56:00AM +0800, Guan-Yu Lin wrote:
> > On Mon, Oct 14, 2024 at 11:56=E2=80=AFPM Alan Stern <stern@rowland.harv=
ard.edu> wrote:
> > > I'm not so sure about this.  By returning early, you prevent the driv=
ers
> > > bound to this device from suspending.  But they can't operate properl=
y
> > > when the system is in a low-power mode.  Won't that cause problems?
> > >
> > > Maybe this really belongs in usb_suspend_device(), and its counterpar=
t
> > > belongs in usb_resume_device().
> > >
> >
> > To my understanding, after the system is suspended, the USB driver
> > will do nothing as the main processor has been suspended. May I check
> > what forms of low power mode and operation we are discussing here?
>
> S3 suspend.  You are right that the driver will do nothing while the
> CPU is suspended.  But what about the times before and after that,
> while the suspend and resume procedures are underway?  The driver
> needs to be told to cancel any ongoing transfers while the system
> suspends and then restart them while the system resumes.
>

Regarding the cancellation of ongoing transfers during suspend, I
believe usb_hcd_flush_endpoint() handles this as discussed below.
Besides calling usb_hcd_flush_endpoint(), are there any other
necessary changes before suspending the driver in our scenario? Maybe
we could discuss setting usb_device_state to USB_STATE_SUSPENDED.
However, my understanding is that this variable reflects the actual
device state. Since the device remains active via the sideband in our
case,  changing usb_device_state seems unnecessary.

> > usb_suspend_device() did close the required port/bus to maintain usb
> > transfer.
>
> I don't know what you mean by that.
>

Nothing special here, I'm just echoing what you've mentioned and
trying to bring up the discussion about usb_hcd_flush_endpoint().

> >  However, there are additional usb_hcd_flush_endpoint() calls
> > aside from usb_suspend_device(). Maybe we should consider not doing
> > those also since some of the endpoints are now handled by the
> > sideband.
>
> Those calls should not be skipped.  If the sideband controller wants
> to handle the endpoints on its own, it can go right ahead.  The main
> controller and the USB core need to know that they shouldn't use the
> endpoint while the system is suspending.
>
> Alan Stern

Got it, let me update the patch and put the related changes into
usb_suspend_device()/usb_resume_device().

Regards,
Guan-Yu
