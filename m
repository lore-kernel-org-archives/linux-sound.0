Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B18B33066D
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 23:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773876607; cv=pass; b=Uh/tdvGlobVwZGvF2jRa3iBp4//zNnIV+M7KVVy5Dg/2c1TVI1sqxKLKi7TI3q3NG/5yVgzp6hsceGU8290q7Zj0Y0Y+jYkSDRrBO8ccBBliRlegd/0PCAL1rfa8Bbyn+3Wj4qLNoXDuBqRzgKS8FKGRRiG1wRSghAaMsT8+TiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773876607; c=relaxed/simple;
	bh=Ikbgl4NYJZhrpipjl4UKxG9763awCdXVVRI9/qm5ENs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sLObqf53XZSQeT/0cXSZ4L06arFkyCtexYVDhWwpXG6p68u8bZeTefNU6Oooj3Jfd6VonaqszItPzaC1cBCC1REFnSTovnuDI/T4VfvsGHRmrP9HSjpgN2/ObXTppgF9/dlevnTvvZ+Q5kZi3/pBSaGvwN9Kyher2sf1E56Ob+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cTXbWiyi; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cTXbWiyi"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-509062d829dso124571cf.1
        for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 16:30:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773876605; cv=none;
        d=google.com; s=arc-20240605;
        b=Iuxh2PBdJpA1qRy+MtUz+01WOnb3GT5gJMQAXWH0n6ivZGeU+Y9L+wNCCLF/eU0Or1
         9Gc+4eNKOXhtBTZoI5QSTSJdfKBsVRKAJGUyErSEvBHR76zvj4X31iMABx+hRuKrO9EZ
         i8nl8kCXDoXdv9yjvRGUPNwI2dCEM/a3M8WZMbl0DZVO3mNRNoCyMWAb1ol/Bo6dXZef
         EKmO+DzACKm2bP43ZJwFYBenFUeAdQFZwQuql0NwFOM3QtYzbgwjkei3WSfPXXBg7Bzo
         6A7w0GMYgnXtfIZyFisMNppIW9WmRKrK/dRy4nF8vQLH5qSog6q9TVP8rIqp7sYXW9j2
         OreQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n4VIi7EhCf6D8/1yLa+X0XyxMVZpW5bilaY68sBFKcU=;
        fh=QP9AQYMnAXqZCPt+6LvmVvOmbUWIFdIr8ZyQO2WfqZU=;
        b=V93pJiCeGb15Xja0Ln6LAcIcOHlDiu0wtaOlqxS/JSz6Cmt84FOLQjQy5BNevGayo8
         2CdJHIzTo6m1bw02TiVrHXDYJXrQq0J1UrhhMY71SzxuEz96W9knC47l1bzs84+nQNpU
         aIcYzSiuKzLMuTXjuVxUEwrYWk20EK1Gidk4UG3lPWEaU20mPjPIlfew4pcERuALVEzw
         gtUKpY0o454rMcM/LlWZ6miUnL3ziubXMXqA99t30ZkN2eZl5Knif2q2b2cLLC2iphS5
         jiK9/a0SHksmgnt6SnePoL9lPvBAb47nczRL5Vc+kVOsucRGzemdJx8foAmkjbdHC5+M
         nTgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773876605; x=1774481405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4VIi7EhCf6D8/1yLa+X0XyxMVZpW5bilaY68sBFKcU=;
        b=cTXbWiyijSJ0t3T95crRcKf1/YVSOclwuZaMoNJ/I4gAg6EGrQ30XihUiavHpYdXYh
         UohCN55CxiIfmX2+VfI5SOv7lcX47RZcHn8uf13vn10GJhpbuTGBVPv+E9s2NAYipmO8
         i2Mnw/81A08kctLkL/IMpata2ApOjlzBzNKkn2ocDHRClky2eYj/fB2wR3vRk0XJgDGO
         fQiEE2RGLlf0CcI+5QI+wlrrPO4t/qoAUBnaZih2aIt68tMIWx//JmB2wKwTiyPnMsQa
         ezAmNZQsaj/0jk9+/0nLL5UonCPuUFLnWK9GPAERnmDoYhWu9eNIpQ2HJFwUXe4A+uM0
         ee1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773876605; x=1774481405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n4VIi7EhCf6D8/1yLa+X0XyxMVZpW5bilaY68sBFKcU=;
        b=VSA9+qRWfDso+Tw1af9JA97upkVx8QuM/7Us0MdHuSTcz96HhPqk5f/qyclZ6RxZEA
         I4h4ikn1eD/owvC+u88oDbJLxAPw8PuFIHnWkgITq23pMEXkBDfaXaF2vownNfbIjEuC
         nTKrKgZIVG0KSXc/quAFKPGqtlPUl0GEXp0rpUAlh/C0xNfTBg2cwPW8ev+9Ifezb/t8
         aARXPHSAXwYepeyOZZIG6XhWaZwJiLabPzy2WRzd0BUhNnrQAQ5QyIJGYOdBn00/enQF
         Hay1upo/Bzr3WMJ+IG1AsjlY3IaI2VXKMUlii1bFWdM4hpvthRhe8GI0FNspb6O9H0kY
         VVHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBie193WN+fsIUhYAXX1wyweU/JiDxmtCdl1VnBgo3pnF/4GHp5sD5or1cp6zL86p9N+7Xd9rcd8IfBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRS8rieI3SWgPJI13TmVGKYJHA22PAWVoiQaDwAdmh3qnr51yM
	IHOi49x1CQZ1usKeCAcRPI7e7QKE92XcEWCwgLXAK1oUb0iisZ4S2IYddWyC0+62FKRtCoWeXFG
	Rf8/3rj/ChSUna1sSEr9wikq3Kr4Qj+tzVVmn1CP5
X-Gm-Gg: ATEYQzzd4aEAkNsk0Qs0D+84tmUIWihKVybyOTgJ44do8ggwhsqVMbAk5mygMYsS5Hn
	uIct3+yqk31aeeOAtyPuyXdrEXnSN2jRwHQDThkkn30TmDl5SNcoHjcYwtQWdHD9uLQdWCXjGGn
	mLSjbIrIQ1MMYrtZSg7i0LM0dWpb/rbssJ9lyrUa5EQjpd+4cS6ckmLUVI+m0HPyv75dfyi0V5o
	pwQw/Bckksan2RgTxa7yJTJ+d29wDrPV2dxv2u29p4YuEuuyjtfEhiiF8IPNxGSANl7LTm4irEe
	svCcIw==
X-Received: by 2002:ac8:7c55:0:b0:507:35b2:6b9 with SMTP id
 d75a77b69052e-50b27456fe4mr3082721cf.7.1773876604768; Wed, 18 Mar 2026
 16:30:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309022205.28136-1-guanyulin@google.com> <20260309022205.28136-3-guanyulin@google.com>
 <2026031115-unboxed-spouse-1dcd@gregkh> <CAOuDEK3k6nyiHxhcL1kv=QNQaZMF6ms=sLerSZ5JBc5WBd7nAw@mail.gmail.com>
 <CAOuDEK2pyt4nKWxXXwtzgRuP6u9kvi_Joe8Ec8qDDHVzSue1rg@mail.gmail.com> <2026031815-heroism-devotedly-e730@gregkh>
In-Reply-To: <2026031815-heroism-devotedly-e730@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Wed, 18 Mar 2026 19:29:00 -0400
X-Gm-Features: AaiRm52YRSd54syzn1f4cmqFSKVxw7wlvtVlZkoP-XOuSr5tL6CUvSpQpQh1gbY
Message-ID: <CAOuDEK1YjqPeiPde3Sn34RSsMu9i+KYF7BJGca=n8j_f4RM55g@mail.gmail.com>
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

On Wed, Mar 18, 2026 at 12:59=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Tue, Mar 17, 2026 at 04:45:00PM -0400, Guan-Yu Lin wrote:
> >
> > Hi Greg,
> >
> > Thank you for the feedback. I understand the concern regarding locking
> > complexity and the reviewer burden. The usb_offload_get/put functions
> > track sideband activity that runtime PM cannot reflect. This is
> > necessary to prevent the USB stack from suspending the device while a
> > sideband stream is active. Ensuring atomicity requires orchestrating
> > three asynchronous subsystems: System PM, Runtime PM, and USB Core.
> >
> > To address the concerns effectively in the next iteration, I would
> > appreciate clarification on your primary concern:
> > 1. Preference for fine-grained locking:
> > Using USB device lock ensures atomicity across these subsystems, which
> > is inherently a device-wide requirement. A fine-grained approach risks
> > races during concurrent software events, such as a reset occurring
> > during a runtime suspend transition.
> > 2. Preference for improved transparency:
> > If the coarse lock is acceptable but the implementation is too opaque,
> > I will refactor the next version to be more explicit. I plan to
> > include device_lock_assert() calls, __must_hold() macros, and add a
> > "Locking Hierarchy" comment block documenting the vendor-mutex and
> > USB-core lock interactions.
>
> At the very least, this is going to have to be required so that we can
> catch any future changes and ensure that changes do not create locking
> inversions and the like.  I guess we are stuck with this for now, due to
> this being "outside" of the normal runtime PM, which still feels wrong
> to me as runtime PM _should_ be able to handle this (if not, why is this
> case somehow unique from all other hardware types?)
>

The runtime pm doesn't apply here because when a sideband instance
accesses the controller, the main system could suspend. The runtime pm
only reflects whether the "main system" is using the controller,
whereas a sideband instance might still be using the controller when
the main system has suspended. Runtime pm couldn't reflect the
sideband's status. If runtime pm reflects sidebands activity on the
controller, it will mark the controller as active, which prevents the
entire "main system" from suspending. Does that sound right to you, or
is there anything I can clarify?

> > To clarify the "broken hardware" point: this isn't a hardware bug.
>
> It was described as triggering when a shock happened to the system to
> cause the system to reset in places, which is a hardware issue :)
>
> > These races are triggered by standard software events, such as a reset
> > occurring while a sideband stream is active. Please let me know which
> > direction you think is more appropriate for the kernel, and I will
> > refactor the next version accordingly.
>
> And how exactly can a "reset while active" happen as just a normal
> software driven event?
>
> thanks,
>
> greg k-h

I'm not sure what the OPPO team has encountered. In our experiments,
we saw the following call stack:
[  721.889147][  T228]  qc_usb_audio_offload_disconnect
[  721.889284][  T228]  usb_audio_disconnect+0x7c/0x268
[  721.889302][  T228]  usb_unbind_interface+0xc4/0x2f8
[  721.889313][  T228]  device_release_driver_internal+0x1c4/0x2bc
[  721.889333][  T228]  device_release_driver+0x18/0x28
[  721.889347][  T228]  usb_forced_unbind_intf+0x60/0x80
[  721.889358][  T228]  usb_reset_device+0xbc/0x23c
[  721.889375][  T228]  __usb_queue_reset_device+0x3c/0x64
[  721.889386][  T228]  process_scheduled_works+0x1b8/0x8ec
[  721.889405][  T228]  worker_thread+0x1b0/0x470
[  721.889418][  T228]  kthread+0x11c/0x158
[  721.889429][  T228]  ret_from_fork+0x10/0x20

In addition, if a process interacts with the kernel using
`usbdev_do_ioctl` and then `usbdev_do_ioctl ` calls
`usb_driver_release_interface`, we could also encounter a deadlock
issue.

Regards,
Guan-Yu
