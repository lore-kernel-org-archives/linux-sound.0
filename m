Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3129B15FA7B
	for <linux-sound@vger.kernel.org>; Tue,  5 Nov 2024 03:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730776201; cv=none; b=NfTKrE8vtcPyYib5O5VKm9usfLyGAMSgUs1BwB3GAc1i5xPGWizuxCjtHVU37kIWlA2x7b9yl+Of1xuf2kCymqQX7e2/ZfXyfLbtd5VPH1E805cMYxwHs2dPnhoCl8n/FZpkf7xSFBlI8TT8AvxtjvLIWGqEg6A4Xy5OV86mvKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730776201; c=relaxed/simple;
	bh=iJiqEI4jeiISFUYA5z9mrx3IXzLlVPZzv4h1oYlPJgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HChgHwHHL/ENuuMeOD71f+PVVEEEAKKTqAkXOLA8D2p2Zix0uChs/hdCFDqfHcFgH9IddbQNA08ckZLdPY0EyWzVVKD/oTMM2b+oBiOmYpJn/hYjBnKh+lGbYJzxg9c+xUseatrraPa6XywIvVyu3d94VyayP2zxAFR45rWqm9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GgMMPnAO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GgMMPnAO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730776198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e798jqlARNKREu5f9NYLA+kZVVjz8QYT2h6TT0fZ7qY=;
	b=GgMMPnAODM0R33WDsyMPuhUsajUIfJ1Miob08DDSe3MQ5vHYBL/+TkVL4+hp6Xw8teBJfg
	7lL6reYelxKdbOOIoAvx0MoVaV/lA9E57MjWmmroElD2h7ZxUyqKorNx+ZyKyx7doCRT5h
	4bg/GLrVr4WednkEVOQuiuK/fUSborA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-tLBmFRZgPuuej8HP3Yca1g-1; Mon, 04 Nov 2024 22:09:55 -0500
X-MC-Unique: tLBmFRZgPuuej8HP3Yca1g-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2e2bb354e91so5077968a91.2
        for <linux-sound@vger.kernel.org>; Mon, 04 Nov 2024 19:09:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730776194; x=1731380994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e798jqlARNKREu5f9NYLA+kZVVjz8QYT2h6TT0fZ7qY=;
        b=ebpLVypJ2XqFQAU0IUZPfelEwNDx9pqI0LHb1rZr5UotZE2FWO78Kf23pcCi+koPf4
         Dx42yVoo0AAkfYe/7dGaHGJPIavkM3LsZ1UMQEOkxLuSRktsSiRT1CUT3ShNlW71xaso
         gFv40UA2jm2JuwN/iPyYkzNXa0r9TtR/fcmViG5u7tMRZd8LmetKX2QXW9X6wToWQkET
         Tv//O8bcNWdaS7p8rKGZ6wryZMJlthDbgd4iCEp2QsYCxrFuLFQUJuXG8bmucgAixYZs
         ddI7kM9C21yYBchwLi1EjToYVWEXHgdCx9Brf/BTAbQYwCzc65bF+X6L4EQjaeywK7uZ
         zdmw==
X-Forwarded-Encrypted: i=1; AJvYcCUwHxya5KMOMyUhl7Mt0GQnF0pZGdeg9hqVrv4L8CjbVen3ReU9dhUqPTeq0P2TNK9KUVNib9LEI+3XLA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/CFXjp+RmTEAjQfQpbvzTOtjDUe6EAmbGB2dSuc9X7ncBsehh
	uoYZVRBR9Blissty6TPfHiJ1vTZYiN1kKrxb4zTRvd5fcb0bGkooWF1/GF3nRXKOIeYmLNtz6rS
	1sOhektZ4b5RVri96gXDLFxZUMoyJxYDWuFwmnce0NRfsaUO48LFsDCAehtRd3FA6zFyHB+sq+e
	MLDyY4nVO8EFHeDcItUtMYbXOa6zJ2ekBfZ1U=
X-Received: by 2002:a17:90a:bc87:b0:2d3:da6d:8330 with SMTP id 98e67ed59e1d1-2e92ce32e36mr24812051a91.4.1730776193972;
        Mon, 04 Nov 2024 19:09:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYJVUVsmrlOV42/z3JLwA/lW5WLQWpnOFROwOF4DJyTXxU3SnSQkWNTS+6YVqbPJsVSZBiin0tuQPsU4ebyy8=
X-Received: by 2002:a17:90a:bc87:b0:2d3:da6d:8330 with SMTP id
 98e67ed59e1d1-2e92ce32e36mr24812003a91.4.1730776193416; Mon, 04 Nov 2024
 19:09:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241031030847.3253873-1-qiang4.zhang@linux.intel.com>
 <20241101015101.98111-1-qiang4.zhang@linux.intel.com> <CACGkMEtvrBRd8BaeUiR6bm1xVX4KUGa83s03tPWPHB2U0mYfLA@mail.gmail.com>
 <ZyRlC-5V_NTKgzXh@dev-qz>
In-Reply-To: <ZyRlC-5V_NTKgzXh@dev-qz>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 5 Nov 2024 11:09:41 +0800
Message-ID: <CACGkMEvc+eA7KdJJAtjNPwqve8CwLZYzAmMhf0RWwQ-GwonaUw@mail.gmail.com>
Subject: Re: [PATCH v2] virtio: only reset device and restore status if needed
 in device resume
To: Qiang Zhang <qiang4.zhang@linux.intel.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jens Axboe <axboe@kernel.dk>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Amit Shah <amit@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gonglei <arei.gonglei@huawei.com>, 
	"David S. Miller" <davem@davemloft.net>, Viresh Kumar <viresh.kumar@linaro.org>, 
	"Chen, Jian Jun" <jian.jun.chen@intel.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Anton Yakovlev <anton.yakovlev@opensynergy.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Qiang Zhang <qiang4.zhang@intel.com>, 
	virtualization@lists.linux.dev, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-sound@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 1:23=E2=80=AFPM Qiang Zhang <qiang4.zhang@linux.inte=
l.com> wrote:
>
> On Fri, Nov 01, 2024 at 10:11:11AM +0800, Jason Wang wrote:
> > On Fri, Nov 1, 2024 at 9:54=E2=80=AFAM <qiang4.zhang@linux.intel.com> w=
rote:
> > >
> > > From: Qiang Zhang <qiang4.zhang@intel.com>
> > >
> > > Virtio core unconditionally reset and restore status for all virtio
> > > devices before calling restore method. This breaks some virtio driver=
s
> > > which don't need to do anything in suspend and resume because they
> > > just want to keep device state retained.
> >
> > The challenge is how can driver know device doesn't need rest.
>
> Hi,
>
> Per my understanding to PM, in the suspend flow, device drivers need to
> 1. First manage/stop accesses from upper level software and
> 2. Store the volatile context into in-memory data structures.
> 3. Put devices into some low power (suspended) state.
> The resume process does the reverse.
> If a device context won't loose after entering some low power state
> (optional), it's OK to skip step 2.
>
> For virtio devices, spec doesn't define whether their states will lost
> after platform entering suspended state.

This is exactly what suspend patch tries to define.

> So to work with different
> hypervisors, virtio drivers typically trigger a reset in suspend/resume
> flow. This works fine for virtio devices if following conditions are met:
> - Device state can be totally recoverable.
> - There isn't any working behaviour expected in suspended state, i.e. the
>   suspended state should be sub-state of reset.
> However, the first point may be hard to implement from driver side for so=
me
> devices. The second point may be unacceptable for some kind of devices.
>
> For your question, for devices whose suspended state is alike reset state=
,
> the hypervisor have the flexibility to retain its state or not, kernel
> driver can unconditionally reset it with proper re-initialization to
> accomplish better compatibility. For others, hypervisor *must* retain
> device state and driver just keeps using it.

Right, so my question is how did the driver know the behaviour of a
device? We usually do that via a feature bit.

Note that the thing that matters here is the migration compatibility.

>
> >
> > For example, PCI has no_soft_reset which has been done in the commit
> > "virtio: Add support for no-reset virtio PCI PM".
> >
> > And there's a ongoing long discussion of adding suspend support in the
> > virtio spec, then driver know it's safe to suspend/resume without
> > reset.
>
> That's great! Hopefully it can fill the gap.
> Currently, I think we can safely move the reset to drivers' freeze method=
s,
> virtio core has no reason to take it as a common action required by all
> devices. And the reset operation can be optional skipped if driver have
> hints from device that it can retain state.

The problem here is whether the device can be resumed without "soft
reset" seems a general feature which could be either the knowledge of

1) virtio core (a feature bit or not)

or

2) transport layer (like PCI)

>
> >
> > >
> > > Virtio GPIO is a typical example. GPIO states should be kept unchange=
d
> > > after suspend and resume (e.g. output pins keep driving the output) a=
nd
> > > Virtio GPIO driver does nothing in freeze and restore methods. But th=
e
> > > reset operation in virtio_device_restore breaks this.
> >
> > Is this mandated by GPIO or virtio spec? If yes, let's quote the revela=
nt part.
>
> No. But in actual hardware design (e.g. Intel PCH GPIO), or from the
> requirement perspective, GPIO pin state can be (should support) retained
> in suspended state.
> If Virtio GPIO is used to let VM operate such physical GPIO chip indirect=
ly,
> it can't be reset in suspend and resume. Meanwhile the hypervisor will
> retain pin states after suspension.
>
> >
> > >
> > > Since some devices need reset in suspend and resume while some needn'=
t,
> > > create a new helper function for the original reset and status restor=
e
> > > logic so that virtio drivers can invoke it in their restore method
> > > if necessary.
> >
> > How are those drivers classified?
>
> I think this depends whether hypervisor will keep devices state in platfo=
rm
> suspend process.

So the problem is that the actual implementation (hypervisor, physical
device or mediation) is transparent to the driver. Driver needs a
general way to know whether it's safe (or not) to reset during the
suspend/resume.

> I think hypervisor should because suspend and reset are
> conceptually two different things.

Probably, but rest is and doing software state load/save is common
practice for devices that will lose their state during PM.

Thanks

>
>
> Thanks
> Qiang
>

