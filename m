Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BB236AF6
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 14:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806411; cv=pass; b=cVbQjsNtDX0B3sIrMRRzmxvHq0otO40lPoLOqkeGCjihKCIzGnXkmKBXkeTbhvG8s1XhLA95tMHNsm3KGjTGhsphxd8P3OGlC/4DT9BjrY0frWKYjtcuX4NcoOJaEAzdy4cmthckatOaUemNc3Fwpxn8o/PEQ0xY5UWAblUFfRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806411; c=relaxed/simple;
	bh=rmzp/7qJfLDhqsp2zKy6jByb/gToJSLriiMQRH2otEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OaSH9Iew9wroSh/A9M7mOYJwKy4n6f0EXGUBNd240njhol8teMnu5DxzSzqEcPtjohGmDI1DaLwyruQZ+QVVUHznuyKvv/OR61oG6HVz1sUw8jZL9XzMaR/r9+aBBr6C4zLpJi1v8fDgtMdQ9LWGW28FT2vH3ice9WoF5UoA6Uc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IzNPklpl; arc=pass smtp.client-ip=209.85.208.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IzNPklpl"
Received: by mail-lj1-f194.google.com with SMTP id 38308e7fff4ca-38e7d983f79so98269701fa.0
        for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 07:40:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779806407; cv=none;
        d=google.com; s=arc-20240605;
        b=VTsO6abWaIceAAJUqjxuslPa3sGHQQvlCh0HVcyQm2unpnSf41KK8Xfv06uUNSJL6t
         pQ0Ychxl8LU+lAWodwLQDdZYTumomPXmrCjkbLLZrFxuOXMfM7b7AcSQNocmHwmhOImP
         rU5xu06tfpB8zq6rtwqHupnhpIDcMUBm6uX6hCghYKi92LKtxZenvXpbrAtOp+P8Df54
         lqqoxhbec2/xtci5anLcHAW5WHULGZmLaIsJg+sN70J26PwmjquoArZK9ionk2jW02TE
         jCIE/6WRVXgBXUi/pduw5+O6lSx5urhWcHG+yO9xQeYpPJ2tQS1w6igTZNiM5dnSPY0Y
         FgiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q38GAq5uWPmRx8pUQMoKu3tVUAcaerlLFOM0odcfoOk=;
        fh=yc2bJ3EzfLeFo8SkESgavjumiVGAb63cM+KE9LCxJbs=;
        b=fXZBn/MpcdC1yTdjAMz8JtinOiV3Nj+XQ9DsBIpGv+ER8iLDOP7R7T8YKI/cgZb2K6
         7bBHYZxV9nZkmRSUSFqPAcR16f/Jn8CD12tT1nfgFEyS2EEhzbhBQwsthoWOR0xtudyl
         lJvtXhOU7jK89muQf75O8HwX5YEdQJnw5r4BCswW3i5FxECbYdnuXKmlFVONvxDU5YY8
         nxjTd596P0mNa/xdX9wJM8oVWr1qqeIN40Qgh97QHNCPQGNU+DlNOLqaxG8LeprtUaKg
         Br5KgJ4GlgikgE9IgoXUFQFmndfdbeCrJ/YwHUNIvfc9aGh7bF+S3VC8PKVFzBRy655Z
         Yk4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779806407; x=1780411207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q38GAq5uWPmRx8pUQMoKu3tVUAcaerlLFOM0odcfoOk=;
        b=IzNPklpl6GZ/rghWvVCMTO0uY0lqdpy8jRDMJ7Rv+UrK86i2swaDRvE/tXQJHWGlLq
         iZSdYwjyW4emNPFr/8KLKh2+t+d8L/uYaSBj7yM+krIxMqK++5HFN2cI+0aEvHI2B4Bl
         b+7EwyDTZfLMg7w+Qz+6RW1PUWxMWIL5HW5+m5sviTwmmpxOl2gq6GwTD4Ak/UjzOMXU
         U1X0es9rAKAuE78PHJEUsVXkOtmKS7eAc8y0QPfEWI76GYiixfQo7wf/Dh03J/nch+Mb
         wMGzoQMU9+tP2d6SCYBKvVINoBHFUjWsjG5obSNo3mwFnEuhM7qJRaP9M9ssaMypY5Ph
         2FvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806407; x=1780411207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q38GAq5uWPmRx8pUQMoKu3tVUAcaerlLFOM0odcfoOk=;
        b=Bzz4Jupi4OVgYf9uUBqzmIicnJb9sVz6eykgtJqtKOj24oaOPTQHr/24bb/LdXZVBk
         VgTj4QGZEuqPq8rSzLiLpdBNc3pVvWStohyMxECs4MiNtRzkmcC0mepF7pXD6XNfY6Ia
         Pemjiu/wSDpInXqLa54HGhwQ3Dh6BuaIs1wvz6atCee1/1qxKjedQpSyBpSs+ahAAfab
         QpzMvyB5hNpcJ1x2ioBkwCV6KHvrBJxEC9AmWTMb70//+r09IF1vz3+6jkOUC8ueP6zo
         uaqhYrUkrb+pt69TRTWNSN8AHyPeWyC+S2unw5Z6pk6Y2miKmAkgGKfJIIjOYarcJLQK
         qLlA==
X-Forwarded-Encrypted: i=1; AFNElJ9OfRYb0eLTBJastE/abvAX1mf34UVNhDdjaEHeBHa6aRBfCU5H6N5Ww6V0EwLoUynOnbSyH2Bv+Z9iMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0MsNOqk2b2rcD1tB0XUdzufDcundDalybMDY3aHAZF0+7McBI
	3MaIAiZGgXxFzK4B0utxnA16/YHdVKbFuJPqMts2MxGtyNViJAPHiUm60U2/0aJrMjzb6uBP5wx
	QAliMu/o/kHEahd4zn6F1Qs/4XuBXelI=
X-Gm-Gg: Acq92OFfk63/K/Ey1CxA7GXpTxu6GLJCgphiZr70ep6/sfRUFZ6BLvnCwRuhDDXDbAv
	Yd/xiuldatorH3J/Ac1z7q+ZawrsV1eoerx6utTbK2cl+xuvWsx02ROFHranxsaNIWIWsXHrKB0
	gLHp2DgK9lou6M3oZ7OKc6SlhQfZAzpiXkvyVS53MBzSSXxomecjfScq20Nyyab9m6PZ2OVdKEb
	jwOq1c6sxCXqLVuVNdatI45vKndsspX9Wtm2xKHIO+VtCiIIi8jmQIRqcVykqt8dYs2euanauHH
	cgz2Ib+nCxUhgh3Hgllu
X-Received: by 2002:a2e:be8f:0:b0:38e:8411:c304 with SMTP id
 38308e7fff4ca-395d8d1cd0emr59477241fa.16.1779806406739; Tue, 26 May 2026
 07:40:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521233900.478153-1-rollkingzzc@gmail.com> <87y0h6xph3.wl-tiwai@suse.de>
In-Reply-To: <87y0h6xph3.wl-tiwai@suse.de>
From: Cen Zhang <rollkingzzc@gmail.com>
Date: Tue, 26 May 2026 22:39:54 +0800
X-Gm-Features: AVHnY4JnNk2lwgU70QMbu8eGBdTF36cKghRs6-stsHFH_MQu8HYb-XtFJm8lio0
Message-ID: <CAB7XQsEz9bqm8FgZFvD3VyO7MG0xnOg+bbdLy+REbbdMWkj7WA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: seq: oss: copy SysEx payloads before handoff
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	zerocling0077@gmail.com, 2045gemini@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Thanks for the review and the patch.

I tested this approach with the same reproducer I used for
the report, and it fixes the issue here.

Would you like me to send a v2 based on this approach, or would you
prefer to take your patch directly with my Tested-by?

Tested-by: Zhang Cen <rollkingzzc@gmail.com>

Thanks,
Zhang Cen

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B45=E6=9C=8826=E6=97=A5=E5=
=91=A8=E4=BA=8C 21:36=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, 22 May 2026 01:39:00 +0200,
> Zhang Cen wrote:
> >
> > The OSS sequencer MIDI output path feeds bytes into an snd_midi_event
> > coder from snd_seq_oss_midi_putc().  When a SysEx message completes, th=
e
> > coder builds a variable-length sequencer event whose data.ext.ptr still
> > points at the coder-owned buffer.
> >
> > snd_seq_oss_midi_putc() returns after dropping the MIDI device use
> > reference, but the caller still owns the freshly built event and may
> > enqueue it afterwards.  A concurrent port-removal notification can
> > therefore run snd_seq_oss_midi_check_exit_port() and free the coder
> > buffer before snd_seq_event_dup() copies the variable payload.
> >
> > The dangerous interleaving is:
> >
> > write path:
> >     snd_seq_oss_midi_putc() completes a SysEx event whose
> >     data.ext.ptr points at mdev->coder storage.  It then returns and
> >     drops the mdev use reference.  insert_queue() later enqueues the
> >     variable-length event and snd_seq_event_dup() copies from
> >     event.data.ext.ptr.
> >
> > teardown path:
> >     a PORT_EXIT notification reaches snd_seq_oss_midi_check_exit_port()=
,
> >     removes the MIDI device, and frees mdev->coder before the queued
> >     event is duplicated.
> >
> > Serialize access to the MIDI coder and copy completed SysEx payloads
> > into caller-owned scratch storage before returning to the enqueue or
> > direct-dispatch side.  The copied payload remains valid until the
> > sequencer core has synchronously duplicated or delivered the event, so
> > teardown can no longer free the source buffer from under
> > snd_seq_event_dup().
> >
> > KASAN report as below:
> >
> > KASAN slab-use-after-free in snd_seq_event_dup+0x40c/0x470
> > RIP: 0033:0x7f2cb66a6340
> > Read of size 6
> > Call trace:
> >   dump_stack_lvl+0x73/0xb0 (?:?)
> >   print_report+0xd1/0x650 (?:?)
> >   srso_alias_return_thunk+0x5/0xfbef5 (?:?)
> >   __virt_addr_valid+0x1a7/0x340 (?:?)
> >   kasan_complete_mode_report_info+0x64/0x200 (?:?)
> >   kasan_report+0xf7/0x130 (?:?)
> >   snd_seq_event_dup+0x40c/0x470 (?:?)
> >   kasan_check_range+0x10c/0x1c0 (?:?)
> >   __asan_memcpy+0x27/0x70 (?:?)
> >   snd_seq_event_dup+0x9/0x470 (?:?)
> >   snd_seq_client_enqueue_event+0x139/0x240 (?:?)
> >   _raw_spin_unlock_irqrestore+0x4b/0x60 (?:?)
> >   snd_seq_kernel_client_enqueue+0x102/0x120 (?:?)
> >   snd_seq_oss_write+0x416/0x4e0 (?:?)
> >   apparmor_file_permission+0x20/0x30 (?:?)
> >   odev_write+0x3b/0x60 (?:?)
> >   vfs_write+0x1ce/0x850 (?:?)
> >   lock_release+0xc8/0x2a0 (?:?)
> >   __kasan_check_write+0x18/0x20 (?:?)
> >   __mutex_unlock_slowpath+0x129/0x510 (?:?)
> >   ksys_write+0xe1/0x180 (?:?)
> >   mutex_unlock+0x16/0x20 (?:?)
> >   odev_ioctl+0x65/0xc0 (?:?)
> >   __x64_sys_write+0x46/0x60 (?:?)
> >   x64_sys_call+0x7d/0x20d0 (?:?)
> >   do_syscall_64+0xc1/0x360 (arch/x86/entry/syscall_64.c:87)
> >   entry_SYSCALL_64_after_hwframe+0x77/0x7f (?:?)
> >
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>
>
> Thanks for the report.  I guess the analysis about UAF is right, but
> the fix looks too much.  There is a refcounting of the midi device
> object, and we can just increase and decrease the refcount between
> snd_seq_oss_process_event() and snd_seq_oss_dispatch() & co.
>
> Below is a totally untested fix patch.  Could you check whether this
> works for your test case?
>
>
> Takashi
>
> -- 8< --
> --- a/sound/core/seq/oss/seq_oss_event.c
> +++ b/sound/core/seq/oss/seq_oss_event.c
> @@ -39,8 +39,10 @@ static int set_echo_event(struct seq_oss_devinfo *dp, =
union evrec *rec, struct s
>   */
>
>  int
> -snd_seq_oss_process_event(struct seq_oss_devinfo *dp, union evrec *q, st=
ruct snd_seq_event *ev)
> +snd_seq_oss_process_event(struct seq_oss_devinfo *dp, union evrec *q,
> +                         struct snd_seq_event *ev, snd_use_lock_t **lock=
p)
>  {
> +       *lockp =3D NULL;
>         switch (q->s.code) {
>         case SEQ_EXTENDED:
>                 return extended_event(dp, q, ev);
> @@ -69,7 +71,7 @@ snd_seq_oss_process_event(struct seq_oss_devinfo *dp, u=
nion evrec *q, struct snd
>                 if (snd_seq_oss_midi_open(dp, q->s.dev, SNDRV_SEQ_OSS_FIL=
E_WRITE))
>                         break;
>                 if (snd_seq_oss_midi_filemode(dp, q->s.dev) & SNDRV_SEQ_O=
SS_FILE_WRITE)
> -                       return snd_seq_oss_midi_putc(dp, q->s.dev, q->s.p=
arm1, ev);
> +                       return snd_seq_oss_midi_putc(dp, q->s.dev, q->s.p=
arm1, ev, lockp);
>                 break;
>
>         case SEQ_ECHO:
> --- a/sound/core/seq/oss/seq_oss_event.h
> +++ b/sound/core/seq/oss/seq_oss_event.h
> @@ -91,7 +91,8 @@ union evrec {
>  #define ev_is_long(ev) ((ev)->s.code >=3D 128)
>  #define ev_length(ev) ((ev)->s.code >=3D 128 ? LONG_EVENT_SIZE : SHORT_E=
VENT_SIZE)
>
> -int snd_seq_oss_process_event(struct seq_oss_devinfo *dp, union evrec *q=
, struct snd_seq_event *ev);
> +int snd_seq_oss_process_event(struct seq_oss_devinfo *dp, union evrec *q=
,
> +                             struct snd_seq_event *ev, snd_use_lock_t **=
lockp);
>  int snd_seq_oss_process_timer_event(struct seq_oss_timer *rec, union evr=
ec *q);
>  int snd_seq_oss_event_input(struct snd_seq_event *ev, int direct, void *=
private_data, int atomic, int hop);
>
> --- a/sound/core/seq/oss/seq_oss_ioctl.c
> +++ b/sound/core/seq/oss/seq_oss_ioctl.c
> @@ -45,14 +45,17 @@ static int snd_seq_oss_oob_user(struct seq_oss_devinf=
o *dp, void __user *arg)
>  {
>         unsigned char ev[8];
>         struct snd_seq_event tmpev;
> +       snd_use_lock_t *lock =3D NULL;
>
>         if (copy_from_user(ev, arg, 8))
>                 return -EFAULT;
>         memset(&tmpev, 0, sizeof(tmpev));
>         snd_seq_oss_fill_addr(dp, &tmpev, dp->addr.client, dp->addr.port)=
;
>         tmpev.time.tick =3D 0;
> -       if (! snd_seq_oss_process_event(dp, (union evrec *)ev, &tmpev)) {
> +       if (!snd_seq_oss_process_event(dp, (union evrec *)ev, &tmpev, &lo=
ck)) {
>                 snd_seq_oss_dispatch(dp, &tmpev, 0, 0);
> +               if (lock)
> +                       snd_use_lock_free(lock);
>         }
>         return 0;
>  }
> --- a/sound/core/seq/oss/seq_oss_midi.c
> +++ b/sound/core/seq/oss/seq_oss_midi.c
> @@ -593,7 +593,8 @@ send_midi_event(struct seq_oss_devinfo *dp, struct sn=
d_seq_event *ev, struct seq
>   *        non-zero : invalid - ignored
>   */
>  int
> -snd_seq_oss_midi_putc(struct seq_oss_devinfo *dp, int dev, unsigned char=
 c, struct snd_seq_event *ev)
> +snd_seq_oss_midi_putc(struct seq_oss_devinfo *dp, int dev, unsigned char=
 c,
> +                     struct snd_seq_event *ev, snd_use_lock_t **lockp)
>  {
>         struct seq_oss_midi *mdev __free(seq_oss_midi) =3D
>                 get_mididev(dp, dev);
> @@ -602,6 +603,9 @@ snd_seq_oss_midi_putc(struct seq_oss_devinfo *dp, int=
 dev, unsigned char c, stru
>                 return -ENODEV;
>         if (snd_midi_event_encode_byte(mdev->coder, c, ev)) {
>                 snd_seq_oss_fill_addr(dp, ev, mdev->client, mdev->port);
> +               /* the caller must release this later */
> +               *lockp =3D &mdev->use_lock;
> +               snd_use_lock_use(*lockp);
>                 return 0;
>         }
>         return -EINVAL;
> --- a/sound/core/seq/oss/seq_oss_midi.h
> +++ b/sound/core/seq/oss/seq_oss_midi.h
> @@ -26,7 +26,7 @@ void snd_seq_oss_midi_open_all(struct seq_oss_devinfo *=
dp, int file_mode);
>  int snd_seq_oss_midi_close(struct seq_oss_devinfo *dp, int dev);
>  void snd_seq_oss_midi_reset(struct seq_oss_devinfo *dp, int dev);
>  int snd_seq_oss_midi_putc(struct seq_oss_devinfo *dp, int dev, unsigned =
char c,
> -                         struct snd_seq_event *ev);
> +                         struct snd_seq_event *ev, snd_use_lock_t **lock=
p);
>  int snd_seq_oss_midi_input(struct snd_seq_event *ev, int direct, void *p=
rivate);
>  int snd_seq_oss_midi_filemode(struct seq_oss_devinfo *dp, int dev);
>  int snd_seq_oss_midi_make_info(struct seq_oss_devinfo *dp, int dev, stru=
ct midi_info *inf);
> diff --git a/sound/core/seq/oss/seq_oss_rw.c b/sound/core/seq/oss/seq_oss=
_rw.c
> index 307ef98c44c7..111c792bc72c 100644
> --- a/sound/core/seq/oss/seq_oss_rw.c
> +++ b/sound/core/seq/oss/seq_oss_rw.c
> @@ -153,6 +153,7 @@ insert_queue(struct seq_oss_devinfo *dp, union evrec =
*rec, struct file *opt)
>  {
>         int rc =3D 0;
>         struct snd_seq_event event;
> +       snd_use_lock_t *lock =3D NULL;
>
>         /* if this is a timing event, process the current time */
>         if (snd_seq_oss_process_timer_event(dp->timer, rec))
> @@ -164,7 +165,7 @@ insert_queue(struct seq_oss_devinfo *dp, union evrec =
*rec, struct file *opt)
>         event.type =3D SNDRV_SEQ_EVENT_NOTEOFF;
>         snd_seq_oss_fill_addr(dp, &event, dp->addr.client, dp->addr.port)=
;
>
> -       if (snd_seq_oss_process_event(dp, rec, &event))
> +       if (snd_seq_oss_process_event(dp, rec, &event, &lock))
>                 return 0; /* invalid event - no need to insert queue */
>
>         event.time.tick =3D snd_seq_oss_timer_cur_tick(dp->timer);
> @@ -173,6 +174,8 @@ insert_queue(struct seq_oss_devinfo *dp, union evrec =
*rec, struct file *opt)
>         else
>                 rc =3D snd_seq_kernel_client_enqueue(dp->cseq, &event, op=
t,
>                                                    !is_nonblock_mode(dp->=
file_mode));
> +       if (lock)
> +               snd_use_lock_free(lock);
>         return rc;
>  }
>
