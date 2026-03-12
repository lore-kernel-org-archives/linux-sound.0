Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C943914E0
	for <linux-sound@vger.kernel.org>; Thu, 12 Mar 2026 17:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773336294; cv=pass; b=qUZs7BSwQSD3OPJC6qj6w7BJovTgTWNiTQVG8Bahu2Dy+3D1kbfRG60s4bLIUK1PbiJ9yRy6xG0cpzi9Ho17TVGJrmWmGw+vI/yiQpAY1IA+xxIQ20dNJV5WpTpNX2JxcaBPaPCdLVsPzEtlQQU7T8TD2jumXcwK8p+lG8Qa9UU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773336294; c=relaxed/simple;
	bh=bA7SOYOZ5VpR5LevIqMsHdzI87xzujJLmcIyV5G8kSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y2MSTvI2eMh1Ocnp84YFJaJpGRpXqrzVoWner4ja/uXZRxQTeCIrQcuqoCBdhYDDHkzaJhLi9oB57Z/Dkaf628+gPccU6/k5M0m/3Qu48mBI5UA/RvlNcQaobKtbGv9WXcrFujXoyVJb2OpRc8WdHUoBngoCPYNAmqDXGgZmcEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qcorwusU; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qcorwusU"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50906a98ffeso35701cf.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Mar 2026 10:24:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773336292; cv=none;
        d=google.com; s=arc-20240605;
        b=RmtabF5HLABqF9/ew2UTY/h+X+wONQYEEGVrsk4lbggGGpx9TLJPDrLEf1Juc3VpD9
         Fl4fZf/h4X0dADfH+j8VR05jdOCcUuaPJHtS0w8f4k01y015+K2GXEDev1A6KhsFnJIT
         v8gmPbi2J+V4ruebtle/VWbVE/C6LuXZf/7SdnlEg9f+Djv2gm87gfqy97w0h7GC7Oc0
         ex1vN2YHkVA3j08u8JVpzvxesNxYMEJoyZdv8WZBYkqqU84WcF1TcUKXMzGzGd1bO3BN
         y7KIX3qP5OPsvRTI1UCHciXTBOT9hXQlOINT7fRCFcQ1+SyK5CCP13CEzGogn2+Vdej8
         OZFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xjwzPu73xn+DNGk07wn7qgGLfPtqT0k3FiNx5Ciz7IE=;
        fh=okdTWNUhNoU7ezIjwU+X5F1GUc3DKCQvVLZrjBBgm64=;
        b=fSqmbnlbTUMdN1+hR7YpVPpwrKcA+rcXGOeAnVFuUYzT1sV07MGYWWo4GygZLcF84j
         hkb6fZWnyLap5in67VXv49PRhNQgKgzXsPEztRAkKZbsrnFc0l2SlbQqdAHtrSAOCetO
         HrXbk0+J9pA4wowbiacU8DRm0aeHivzC/8JqA9dIvuEGd40G8HEeGc0S/MzkqDjTnAeF
         C/0TJN3ea4//LD85W20LEel5tuwFZa2iE2rpfoKcsWw3/TrK9tWDV6d3iiK67FH8b7QW
         IGN+TcdSQ7UtOpNm4OLM3EGHOPmJt+dWEEij1JfKbwTwFD0hwU1ps0ZyWE+JvGs/lEjQ
         zoFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773336292; x=1773941092; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjwzPu73xn+DNGk07wn7qgGLfPtqT0k3FiNx5Ciz7IE=;
        b=qcorwusUWgLEagS0h0wqRTUMJSSeiBzXm8fFgA4Q5yDqheU1lBokG8aU8Af158shen
         OgoAH26GfBTkTMD9MScsHu154PNnGkPc1TOu50VstIaVkGfmF+dqJEqhdKDKwHhX6w9y
         X1/dDqMYnSRUgWPVkDKKq6tfUTLQLD91iUgQN4A5htAqWzToujaKvRI+6PhxIEo86v6S
         Lk+qZqmc2il7DpvXyuuEu/wgPVUiLwoqJUVX07WWIAfgLrfz25xgOa3gMZWAwrOK2Ncj
         8+sWGmQMmhc/SBQi7qlQtZwkw3jPHFiSovSj5R2nNrIm3J8S0/E/4aGI++/WNmGAfcgN
         dlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773336292; x=1773941092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xjwzPu73xn+DNGk07wn7qgGLfPtqT0k3FiNx5Ciz7IE=;
        b=CDniws2D4IVyrPJS+pSXhq/byrCvbv4tbPEQ/5Z2/j+rVqLB9ae6dk4EJ4TGQihQAA
         ELypGW1ss5vfiwoRo0CyRVSnyxiDrVZBaSsD1+rJZNqMldLVLkv3ww1rfEKQc8hM91A6
         K99c930Nk7F97EWtFqx6nj3XE4e4q3GUwlwOr1ux3OILzNBVFUeG0+NvGOdfO8XbS5ri
         QiORCYTMTA79RE/eZC2sd3hHRZequhUJjq1VwN/DfWbKuygXh2GDsM/CfwtMCWBQBX3x
         9fqSYD1+KZayoBQjrgvpN07Y5xVa2JPQhwVwsk4Qb6RjWf9QxMuKyVksaTmfLnghGtkm
         v7WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVlUhCI9erpVdNx56xfrUKhXmq9rg9xdOc28zcWenX85ZbVRfHIF8IImbxszetrWAzeniXRsMkLxL9Xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMem3WwxmVaFNrBJxc4DasoYLOn0cIi2GyrCE5fwXgWgP0MzSM
	qd2OVU5J0J3KQ0iz/H8/kHOjlsv8UwH55t771NAoCp1CXYPKEJ4qbsp8SUsPNI7nyF44syJNx4u
	Rm3Qd33QwvvyCymnAaRFX+0Kdf6G83YJiZbUksfQb
X-Gm-Gg: ATEYQzwuBdRQIYRb8AFICkuQ4L1lOt3E17WICASVqX3kq5sm6IZRjb7aQ29aEI9pnSR
	C4kV1d28Tq/we2EFAB6GmAZ6CkE68+HLOXXSmfS99y4636s1bfL4BiTNxEhigCKIPwl6VA9A69A
	/Db2g2TMenTCcLrHrqRiidi3rbHEMrT9g0C+xNdolF1xv5Qny6MZ7lz9AoahWyVRWjO6fjFcqO4
	LMwj7VtRzDhCfyGLsy97/yLqnEpLuzUOmln2Fw55NCM9ZujSnGHHnuOWXyBKFy6NzafUptJxrfK
	XT2EV4wv
X-Received: by 2002:ac8:6618:0:b0:509:1cf9:ea11 with SMTP id
 d75a77b69052e-509585b0cbcmr211941cf.7.1773336291836; Thu, 12 Mar 2026
 10:24:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309022205.28136-1-guanyulin@google.com> <20260309022205.28136-3-guanyulin@google.com>
 <2026031115-unboxed-spouse-1dcd@gregkh>
In-Reply-To: <2026031115-unboxed-spouse-1dcd@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Thu, 12 Mar 2026 10:24:37 -0700
X-Gm-Features: AaiRm53x3rooP9tpQYr_vJVM2HZqK_Gt4rD4pP0lr2DOh0rRnTjTeszILknzfPw
Message-ID: <CAOuDEK3k6nyiHxhcL1kv=QNQaZMF6ms=sLerSZ5JBc5WBd7nAw@mail.gmail.com>
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

On Wed, Mar 11, 2026 at 5:31=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Mon, Mar 09, 2026 at 02:22:05AM +0000, Guan-Yu Lin wrote:
> > The Qualcomm USB audio offload driver currently does not report its off=
load
> > activity to the USB core. This prevents the USB core from properly trac=
king
> > active offload sessions, which could allow the device to auto-suspend w=
hile
> > audio offloading is in progress.
> >
> > Integrate usb_offload_get() and usb_offload_put() calls into the offloa=
d
> > stream setup and teardown paths. Specifically, call usb_offload_get() w=
hen
> > initializing the event ring and usb_offload_put() when freeing it.
> >
> > Since the updated usb_offload_get() and usb_offload_put() APIs require =
the
> > caller to hold the USB device lock, add the necessary device locking in
> > handle_uaudio_stream_req() and qmi_stop_session() to satisfy this
> > requirement.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: ef82a4803aab ("xhci: sideband: add api to trace sideband usage")
> > Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
> > ---
> >  sound/usb/qcom/qc_audio_offload.c | 102 ++++++++++++++++++------------
> >  1 file changed, 60 insertions(+), 42 deletions(-)
> >
> > diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audi=
o_offload.c
> > index cfb30a195364..1da243662327 100644
> > --- a/sound/usb/qcom/qc_audio_offload.c
> > +++ b/sound/usb/qcom/qc_audio_offload.c
> > @@ -699,6 +699,7 @@ static void uaudio_event_ring_cleanup_free(struct u=
audio_dev *dev)
> >               uaudio_iommu_unmap(MEM_EVENT_RING, IOVA_BASE, PAGE_SIZE,
> >                                  PAGE_SIZE);
> >               xhci_sideband_remove_interrupter(uadev[dev->chip->card->n=
umber].sb);
> > +             usb_offload_put(dev->udev);
> >       }
> >  }
> >
> > @@ -750,6 +751,7 @@ static void qmi_stop_session(void)
> >       struct snd_usb_substream *subs;
> >       struct usb_host_endpoint *ep;
> >       struct snd_usb_audio *chip;
> > +     struct usb_device *udev;
> >       struct intf_info *info;
> >       int pcm_card_num;
> >       int if_idx;
> > @@ -791,8 +793,13 @@ static void qmi_stop_session(void)
> >                       disable_audio_stream(subs);
> >               }
> >               atomic_set(&uadev[idx].in_use, 0);
> > -             guard(mutex)(&chip->mutex);
> > -             uaudio_dev_cleanup(&uadev[idx]);
> > +
> > +             udev =3D uadev[idx].udev;
> > +             if (udev) {
> > +                     guard(device)(&udev->dev);
> > +                     guard(mutex)(&chip->mutex);
> > +                     uaudio_dev_cleanup(&uadev[idx]);
>
> Two locks?  For one structure?  Is this caller verifying that those
> locks are held?
>

The device lock is used for usb_offload_get/put apis below. We want to
maintain a strict lock ordering to aviod ABBA deadlocks.
The caller wasn't verifying the &chip->mutex lock before. Do you want
me to add it as well?

> > +             }
> >       }
> >  }
> >
> > @@ -1183,11 +1190,15 @@ static int uaudio_event_ring_setup(struct snd_u=
sb_substream *subs,
> >       er_pa =3D 0;
> >
> >       /* event ring */
> > +     ret =3D usb_offload_get(subs->dev);
> > +     if (ret < 0)
> > +             goto exit;
>
> Where is the lock being held here?
>

It's held in the handle_uaudio_stream_req function above.

> This pushing the lock for USB calls "higher" up the call chain is rough,
> and almost impossible to audit, given changes like this:
>
> > @@ -1597,50 +1612,53 @@ static void handle_uaudio_stream_req(struct qmi=
_handle *handle,
> >
> >       uadev[pcm_card_num].ctrl_intf =3D chip->ctrl_intf;
> >
> > -     if (req_msg->enable) {
> > -             ret =3D enable_audio_stream(subs,
> > -                                       map_pcm_format(req_msg->audio_f=
ormat),
> > -                                       req_msg->number_of_ch, req_msg-=
>bit_rate,
> > -                                       datainterval);
> > -
> > -             if (!ret)
> > -                     ret =3D prepare_qmi_response(subs, req_msg, &resp=
,
> > -                                                info_idx);
> > -             if (ret < 0) {
> > -                     guard(mutex)(&chip->mutex);
> > -                     subs->opened =3D 0;
> > -             }
> > -     } else {
> > -             info =3D &uadev[pcm_card_num].info[info_idx];
> > -             if (info->data_ep_pipe) {
> > -                     ep =3D usb_pipe_endpoint(uadev[pcm_card_num].udev=
,
> > -                                            info->data_ep_pipe);
> > -                     if (ep) {
> > -                             xhci_sideband_stop_endpoint(uadev[pcm_car=
d_num].sb,
> > -                                                         ep);
> > -                             xhci_sideband_remove_endpoint(uadev[pcm_c=
ard_num].sb,
> > -                                                           ep);
> > +     udev =3D subs->dev;
> > +     scoped_guard(device, &udev->dev) {
> > +             if (req_msg->enable) {
> > +                     ret =3D enable_audio_stream(subs,
> > +                                             map_pcm_format(req_msg->a=
udio_format),
> > +                                             req_msg->number_of_ch, re=
q_msg->bit_rate,
> > +                                             datainterval);
> > +
> > +                     if (!ret)
> > +                             ret =3D prepare_qmi_response(subs, req_ms=
g, &resp,
> > +                                                     info_idx);
> > +                     if (ret < 0) {
> > +                             guard(mutex)(&chip->mutex);
> > +                             subs->opened =3D 0;
> > +                     }
> > +             } else {
> > +                     info =3D &uadev[pcm_card_num].info[info_idx];
> > +                     if (info->data_ep_pipe) {
> > +                             ep =3D usb_pipe_endpoint(uadev[pcm_card_n=
um].udev,
> > +                                                     info->data_ep_pip=
e);
> > +                             if (ep) {
> > +                                     xhci_sideband_stop_endpoint(uadev=
[pcm_card_num].sb,
> > +                                                                     e=
p);
> > +                                     xhci_sideband_remove_endpoint(uad=
ev[pcm_card_num].sb,
> > +                                                                     e=
p);
> > +                             }
> > +
> > +                             info->data_ep_pipe =3D 0;
> >                       }
> >
> > -                     info->data_ep_pipe =3D 0;
> > -             }
> > -
> > -             if (info->sync_ep_pipe) {
> > -                     ep =3D usb_pipe_endpoint(uadev[pcm_card_num].udev=
,
> > -                                            info->sync_ep_pipe);
> > -                     if (ep) {
> > -                             xhci_sideband_stop_endpoint(uadev[pcm_car=
d_num].sb,
> > -                                                         ep);
> > -                             xhci_sideband_remove_endpoint(uadev[pcm_c=
ard_num].sb,
> > -                                                           ep);
> > +                     if (info->sync_ep_pipe) {
> > +                             ep =3D usb_pipe_endpoint(uadev[pcm_card_n=
um].udev,
> > +                                                     info->sync_ep_pip=
e);
> > +                             if (ep) {
> > +                                     xhci_sideband_stop_endpoint(uadev=
[pcm_card_num].sb,
> > +                                                                     e=
p);
> > +                                     xhci_sideband_remove_endpoint(uad=
ev[pcm_card_num].sb,
> > +                                                                     e=
p);
> > +                             }
> > +
> > +                             info->sync_ep_pipe =3D 0;
> >                       }
> >
> > -                     info->sync_ep_pipe =3D 0;
> > +                     disable_audio_stream(subs);
> > +                     guard(mutex)(&chip->mutex);
> > +                     subs->opened =3D 0;
> >               }
> > -
> > -             disable_audio_stream(subs);
> > -             guard(mutex)(&chip->mutex);
> > -             subs->opened =3D 0;
>
> You have multiple levels of locks here, which is always a sign that
> something has gone really wrong.  This looks even more fragile and easy
> to get wrong than before.  Are you _SURE_ this is the only way to solve
> this?  The whole usb_offload_get() api seems more wrong to me than
> before (and I didn't like it even then...)
>
> In other words, this patch set feels rough, and adds more complexity
> overall, requiring a reviewer to "know" where locks are held and not
> held while before they did not.  That's a lot to push onto us for
> something that feels like is due to a broken hardware design?
>
> thanks,
>
> greg k-h

A known deadlock exists in the current design, caused by USB locks
sometimes being held in the higher function (e.g. during the USB
connection change). Due to this nature, I think if we want a design to
cover these two scenarios, certain degree of lock mainpulation is
required. I agree this is not an elegant way to address the issue.
What approach do you think better addresses this problem?

Regards,
Guan-Yu
