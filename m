Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F151311AC
	for <linux-sound@vger.kernel.org>; Thu, 10 Oct 2024 05:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728538229; cv=none; b=qFMPf7a42RYc/LsV22qbfSpDIXj0+A1Du4OtZr1C0YpGUiUzoJIBbGzjM0wy1EeCdQD8g5LCTV6hYgh0QE8NEovMTz8Fg6L7sioFM+j1gFtMKnbjUKFf3QqnIqU0rNKdoc5hSRs+TyXdJjGkYjtFPNGpcrsjoRRNsT/snv7bAD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728538229; c=relaxed/simple;
	bh=8vrimWluOky7+aW1AAmoRPcEh4YVHM2VIY8aApW/HZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pp/fAch+zcfVK1Fsim9be0iUmYhFUe9teUgjlaBqC22Gjgm+TtnpPuIEXJHtRvlPA8fDLDwsFxkWhn/UU6PEELj/qH68IOt21VR0RPROnRynQRijIUhQEdzSvXmn46C+UaJ5i1QDmbxjYBPeX29zBB6kJLLQD4RtGpEKEzPTr6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z2HHIU/n; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z2HHIU/n"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43111d23e29so94595e9.1
        for <linux-sound@vger.kernel.org>; Wed, 09 Oct 2024 22:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728538226; x=1729143026; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Vsbn1te+zu6FOdxZ9pZKFB7CXsrSwAH4ylvWDXfwvY=;
        b=z2HHIU/n2aBAKKWCVeuWNYwBobqKgIz4HQ6ZiX8GDLe9iaTDCqU73JRYNkTrUv1WHs
         3EhoR2rK1nEh2q+H5ShTlt0QrW0MqNo/qShNozrDxrW9xM4Y2Pa8uFrIN0RxM1ow7szK
         WU3EwPR8BWLODS4qmptJE5pFSf5/hZEFtjkQqyamx7AuNcoh3X53IFeOuJGx7ArRROq0
         wHPQhAmGqlLOsTMtrMxo9gP+dZ+nlsxcNo1rNJTSXK6WVogW9GcpjwQ0GjXvsfPWvhWH
         m9QqFcefl3ZFRDircUHVkcUCvazxLoF1ubYHLhIJuSfg5yog2ke+tN6FjUl1aq9IrCb5
         jN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728538226; x=1729143026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Vsbn1te+zu6FOdxZ9pZKFB7CXsrSwAH4ylvWDXfwvY=;
        b=JmRZ7ghze6wf/pG3HTjpggoiUSNQfLpQGfkbDLl1J+ocksALVcgH0KGYIqESVZzsdJ
         wJ6M0S4yGOB/OLeYDq+o4f+PqOXIa1mvbhW67iDi/Sqfge+P12xZgBR+M8kUCJiqAkWw
         0K13ODnUr4HAxMXi1jYBVY/zPUdfyDa0Or+3qcTapj1fp1oFcpcHvX9h6e+x0YX7Xyih
         fxfP2CqjcA+V6Nm1Q6lSjiSLSFQkyl0fq0wJk9WAk7lXK9MEZY8RY/KEzXoQptFBJHo8
         NFk0B5cJo2NeEZGsgCMyIkrzWVS0HVhN8RLLKCKWXoZOz48eJBGHVPjNql1QWqDi0vss
         MKyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrbkHgV9TIbhQYjNF2+pa5rifUICNjjTU3O2SuzqzRlVIBiuVfPTdv4SuJ8bknDfMHmw2GFyzmcwVTUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDMe/lvqvnT8Z73nB65BUrO7klB9INorXrqQT9fXEbHuKzgCbz
	wZHbIAgiG1pMOCZW0+JSOcXZR+1MdOe0YNxypB65rWuyUnEcG0THyd+esyrtXlFcOJ3aUiu9oXZ
	cGny/CGXNNnhxNvryqOV22JafIlIdGc1demJY
X-Google-Smtp-Source: AGHT+IExR+gZgJ9+ZjEm/14g9BXJdiE3901d7DoQIau1dkDL3xiK2Bq9ZBBLMMTnoABIwrRyI5YGN5iG92XsC0UWHcA=
X-Received: by 2002:a05:600c:3d88:b0:42c:9e35:cde6 with SMTP id
 5b1f17b1804b1-431161221eemr2758015e9.2.1728538225796; Wed, 09 Oct 2024
 22:30:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009054429.3970438-1-guanyulin@google.com>
 <20241009054429.3970438-4-guanyulin@google.com> <2024100941-limping-dislodge-5c74@gregkh>
In-Reply-To: <2024100941-limping-dislodge-5c74@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Thu, 10 Oct 2024 13:30:00 +0800
Message-ID: <CAOuDEK0a43yLhCoA8iq=stj+QQAmKTCVWGKHvKM6-GPEaN9C3g@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] usb: add apis for sideband uasge tracking
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thinh.Nguyen@synopsys.com, mathias.nyman@intel.com, 
	stern@rowland.harvard.edu, elder@kernel.org, oneukum@suse.com, 
	yajun.deng@linux.dev, dianders@chromium.org, kekrby@gmail.com, perex@perex.cz, 
	tiwai@suse.com, tj@kernel.org, stanley_chang@realtek.com, 
	andreyknvl@gmail.com, christophe.jaillet@wanadoo.fr, 
	quic_jjohnson@quicinc.com, ricardo@marliere.net, grundler@chromium.org, 
	niko.mauno@vaisala.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, badhri@google.com, 
	albertccwang@google.com, quic_wcheng@quicinc.com, pumahsu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 8:44=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Wed, Oct 09, 2024 at 05:42:57AM +0000, Guan-Yu Lin wrote:
> > +void usb_sideband_get(struct usb_device *udev)
> > +{
> > +     struct usb_device *parent =3D udev;
> > +
> > +     do {
> > +             atomic_inc(&parent->sb_usage_count);
>
> As this is a reference count, use refcount_t please.

Acknowledged, will change it in the next patch. Thanks for the guidance.

>
> > +             parent =3D parent->parent;
> > +     } while (parent);
>
> Woah, walking up the device chain?  That should not be needed, or if so,
> then each device's "usage count" is pointless.
>

Say a hub X with usb devices A,B,C attached on it, where usb device A
is actively used by sideband now. We'd like to introduce a mechanism
so that hub X won't have to iterate through all its children to
determine sideband activities under this usb device tree. This problem
is similar to runtime suspending a device, where rpm uses
power.usage_count for tracking activity of the device itself and
power.child_count to check the children's activity. In our scenario,
we don't see the need to separate activities on the device itself or
on its children. So we combine two counters in rpm as sb_usage_count,
denoting the sideband activities under a specific usb device. We have
to keep a counter in each device so that we won't influence the usb
devices that aren't controlled by a sideband.
When sideband activity changes on a usb device, its usb device parents
should all get notified to maintain the correctness of sb_usage_count.
This notifying process creates the procedure to walk up the device
chain.

> > +bool usb_sideband_check(struct usb_device *udev)
> > +{
> > +     return !!atomic_read(&udev->sb_usage_count);
>
> And what happens if it changes right after you make this call?  This
> feels racy and broken.
>

Seems like we need a mechanism to block any new sideband access after
the usb device has been suspended. How about adding a lock during the
period when the usb device is suspended? Do you think this is the
correct direction to address the race condition?

> > @@ -731,6 +732,8 @@ struct usb_device {
> >
> >       u16 hub_delay;
> >       unsigned use_generic_driver:1;
> > +
> > +     atomic_t sb_usage_count;
>
> Why is this on the device and not the interface that is bound to the
> driver that is doing this work?
>
> thanks,
>
> greg k-h

If the count is bound on the usb interface, I'm afraid that the
sideband information couldn't be broadcasted across its usb device
parents. Do you have some insight on how we can achieve this?

Regards,
Guan-Yu
