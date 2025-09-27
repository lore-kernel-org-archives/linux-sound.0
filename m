Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2141119E968
	for <linux-sound@vger.kernel.org>; Sat, 27 Sep 2025 15:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758987676; cv=none; b=Y0be88pKSGcxk/zsZ+L65XuaTVXBK8LamSJUzEmG/vTkyXTSVwJypLZ7GuL2S2rZ+Me2jbWdzdtybAUYEngJc7RMYkQHFxkiiLpTRsvxRDA93K/I6Uz/ZsCQlZRPEUp1Wes0zLscQ9ucF/sNApPsNe8aSGivL8rwxnAVqp9aOEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758987676; c=relaxed/simple;
	bh=FPmwv6sV7hm4RdMnP+owJF/j0SUOZOnBAU0EQjBJ4QM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QS3dty8zCDbOdklBJjT1GquOJVrEYII4cj9KTp09FDxxjHYYQkQ9uz/5aKDKNiTwikgB7Y4wZ/rLrN38qPFfT0BWr0FlkH+OpjUUGvgQSbVKz+4QzRxOOsuIjLb2fXBKdUaVRadurrKUkYPaPsBe2irUzJxuxzMRQpgq9whuiMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZamBSF3M; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZamBSF3M"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-781206cce18so1339281b3a.0
        for <linux-sound@vger.kernel.org>; Sat, 27 Sep 2025 08:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758987674; x=1759592474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+guc24UFix+87mZw75ftkg3HVWAUb97VQeNgK+6EGk=;
        b=ZamBSF3M0YvdqbjPmmtb10pmoRkFeK15WxiSNjklDZs9Y9IZ7LqCvyAOHLRIwaUUNi
         Il5N83bPAw6cCIG/bcpoRery2U0dR/lnUPj84xEFvtRsv3fuWFza2VDiTeYkLbEk71ka
         KEHh7POM5Rl8ySC4XN9LeEil3USDNYage/b1vhBTqCZjQauJA70liT6PjO+uISdZ8J7M
         QXHMlXHSD5tFXsspJ6frZB/62sJET2tk56XPaI+pj7gGiszVlzyt2ru4VGXNE5izHQ7H
         tV+sgPm3I1ZviIFIc42/HMhzeQcEkifmYol2c5NPvD8iri9KHJaeBMhaAPp3annPhPQG
         jFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758987674; x=1759592474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+guc24UFix+87mZw75ftkg3HVWAUb97VQeNgK+6EGk=;
        b=FB3WmAAf+kW6A+kNTYVYIPYpO55juR1ll199RSbaLc8X0vnZG0p0E+DI/RTbW5cemC
         M7mA4Uao2++L1vmo0WlCv9Na4KD7R4xa3oWosQh+5Vo4t4o1KUZXoOshfR55mZeJMPB5
         0ILTmLuYSnO3WFhPblwbBcc210JnDQGV0a0SzzZrbkyB17RWtUI2ms1VBWVtAs4h6of/
         ftgJ2ydeCVYa1kuX5DtIXJGnkle8KxWQUOn8DXfilxbPqYKKEF5JmmZLgXjtE3flkIqz
         guabkiX2i8zUyWpHCGkhzIEdklMNRSofCKmtwQcZ/Nio5LE3TLOtlW/wGytxnlRNRWS3
         hM3w==
X-Forwarded-Encrypted: i=1; AJvYcCVhUEjfXDIZFuAd9+n+xWtE3U2+3BWa62ZuTf/uqCTIedROMYQ6J5iObeLWIyj6zYYiNdDlvxAwhgrwug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC6fFR07t3fGyFnp6EIrntrD5xVvmISYC6sNRAsN5jMdcxXuqn
	Slto7ArVT1BfrfWn+ZbloYCCL58MfvAE7NmHApfzojozVPgj4Zhol7Lo
X-Gm-Gg: ASbGnctcyyh2VitK+irjDMDbhvpBEMga6axPzwG3Mubx8xBr6wS/euLok71gteJyQqt
	M1WjVlFBK1zU++kRi8Ti720zBH8EETYOy3Limy7+SCNmJNJRDNuv/zjr3E7BWuddHSFM4DLxnoq
	YhUtaFz93FxwoCr3QKymHMaqouJAtVSi+x/goCdDftgMTnhWPCVxO+Q0OE0s9p0XKNEE/RUZJQv
	mg8ZsRIDu9heMdkqdmfrtUdV3WnYtBV+blh6GrKuBMi+VE+F7BXFYBPx9oe+GkFXZzRnUDuM3H8
	N1dSn0RDPshF1rZepvqknqdjaqjMPPtbFND/jhX73+LTH4/bYr4lo27F8fiNU2DBQrbc0S/RwZD
	tko6BiBNWXl9niF9nrG6gONzIS01ZfXXmPrNV1NU4nVudbnMkyQ==
X-Google-Smtp-Source: AGHT+IH1j8iZ+VWe12C+/tThYXtmTrtzLYXhJdXhg11A+ZuNwyCqmcZMV00qeYbftkoEsVvjpMu9fQ==
X-Received: by 2002:a05:6a00:1f05:b0:77f:43e6:ce65 with SMTP id d2e1a72fcca58-78125450167mr3043482b3a.0.1758987674330;
        Sat, 27 Sep 2025 08:41:14 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c0709csm6923531b3a.81.2025.09.27.08.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 08:41:14 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: tiwai@suse.de
Cc: aha310510@gmail.com,
	clemens@ladisch.de,
	hdanton@sina.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	syzbot+f02665daa2abeef4a947@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [sound?] [usb?] general protection fault in snd_usbmidi_do_output
Date: Sun, 28 Sep 2025 00:41:09 +0900
Message-Id: <20250927154109.879926-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87o6qw9koa.wl-tiwai@suse.de>
References: <87o6qw9koa.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Takashi Iwai <tiwai@suse.de> wrote:
>
> On Sat, 27 Sep 2025 12:36:07 +0200,
> Jeongjun Park wrote:
> >
> > syzbot <syzbot+f02665daa2abeef4a947@syzkaller.appspotmail.com> wrote:
> > >
> > > Hello,
> > >
> > > syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> > > KASAN: slab-use-after-free Write in snd_usbmidi_in_urb_complete
> > >
> > > ==================================================================
> > > BUG: KASAN: slab-use-after-free in snd_usbmidi_in_urb_complete+0x389/0x3c0 sound/usb/midi.c:251
> > > Write of size 1 at addr ffff888074717943 by task kworker/1:3/5866
> > >
> >
> > Wow, the UAF bug still occurs?
> >
> > But... this UAF seems to be a problem with how midi handles urb rather
> > than a problem with my patch.
> >
> > Is there something wrong with the way snd_usbmidi_in_urb_complete() is
> > implemented?
>
> This can be rather a missing kill-and-cleanup in the code path.
> So the patch like below.
>
> Could you check whether this works for you instead of your fix, too?
> timer_shutdown_sync() is already called in snd_usbmidi_disconnect(),
> and the call in snd_usbmidi_free() should be superfluous after this
> change.
>

Since both my tests and syzbot tests did not cause any bugs when applying
this patch, I think the root cause of this vulnerability is the missing
kill error_timer + urb.

So, I think it would be okay to patch it this way, but in addition, since
most of the endpoint delete-related code that existed in
snd_usbmidi_free() is now done in snd_usbmidi_disconnect(),
I think it would be appropriate to modify it to only perform
kfree(ep->out) as in this patch below.

---
 sound/usb/midi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index acb3bf92857c..97e7e7662b12 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -1522,15 +1522,14 @@ static void snd_usbmidi_free(struct snd_usb_midi *umidi)
 {
 	int i;
 
+	if (!umidi->disconnected)
+		snd_usbmidi_disconnect(&umidi->list);
+
 	for (i = 0; i < MIDI_MAX_ENDPOINTS; ++i) {
 		struct snd_usb_midi_endpoint *ep = &umidi->endpoints[i];
-		if (ep->out)
-			snd_usbmidi_out_endpoint_delete(ep->out);
-		if (ep->in)
-			snd_usbmidi_in_endpoint_delete(ep->in);
+		kfree(ep->out);
 	}
 	mutex_destroy(&umidi->mutex);
-	timer_shutdown_sync(&umidi->error_timer);
 	kfree(umidi);
 }
 
--

>
> thanks,
>
> Takashi
>
> --- a/sound/usb/midi.c
> +++ b/sound/usb/midi.c
> @@ -1522,6 +1522,9 @@ static void snd_usbmidi_free(struct snd_usb_midi *umidi)
>  {
>         int i;
>
> +       if (!umidi->disconnected)
> +               snd_usbmidi_disconnect(&umidi->list);
> +
>         for (i = 0; i < MIDI_MAX_ENDPOINTS; ++i) {
>                 struct snd_usb_midi_endpoint *ep = &umidi->endpoints[i];
>                 if (ep->out)

Regards,
Jeongjun Park
