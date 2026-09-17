Received: from mail-ej2-f15.google.com (mail-ej2-f15.google.com [74.125.228.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C8E4EFFAD
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 15:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659782; cv=pass; b=DB62Yp/pkpZOfZzaxGbCc054TeUJhX4xrd3zcQ5Ahkw9eMWDz1H+zrNNLVbbmrWN2qmE/lV4lQ5w8SiaKVL3PKIjwyKfRHKPGVFdFK+SBksybFA5n9IA43ORE1+jPeynK7EEkToxBl1s08v6/6NCvyRc8Zd6qWssm4Z7Rmw//LI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659782; c=relaxed/simple;
	bh=gt0dv7lUskys8+OlSX0pL27DcpnnuyXu2ozj7ZYCfBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sf+3aJRPXaA+Q0VpInaAn6Rb32QVGvfexTxHRiaxtsu8AXsjQCmx22Lj9KNSiwgDua4XPJQa7Qyu4vB+ZEcQ8DHOhANfbdvguWJ/lnhyY/EgdTY/kiolyoOxThkzcNeN6uGTNex+Jhy3N5h/1WjYhfMB73KjxAha75IZlhOXmPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVmqc6iN; arc=pass smtp.client-ip=74.125.228.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVmqc6iN"
Received: by mail-ej2-f15.google.com with SMTP id a640c23a62f3a-c254f9f7dbfso129334066b.2
        for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 08:42:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789659769; cv=none;
        d=google.com; s=arc-20260327;
        b=dyf7H8Q07AbhHe7IINWOkXYMAxRaQJVYh4aM92xPmuf1NWpGCXfP2hFGVa5L2S5OTL
         LVe6ukU2VnCfFNiT2tQf0Dq03EM0lhiWzJGpCuhGBNQCafSAffh7bVv6TQVMuhXx5pgX
         C+MT+C8KfkWFqZ1PVeyRO5H0W7NjjoAekpXBt4EtAf8u6kU/6oUlhG0DdYwjiuKPj4fG
         DRUEKry6WPiZwYQtM93QY5t3WTe0lXhmNQs4kt3Z3UkeCIobZkM4lKTy+jQCCsWS9s4G
         8kVCKPf7ZUOWITTjJZQpKN3A5oOh8C4bJ35my1oYZMX7ObR1nEuqgIbl2ILBPplJF8Id
         kAdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=b6QcRMWdExnJJ8C8eYRzuUZ+eUGTgGISBUbWC62+eRY=;
        fh=HFA0TIwmf3P8repN+1wHGrXM1/BQGyf0rqNJiAYf/w8=;
        b=CI7icZKczHRD5Wn/TvLbSBe8zBH9eUqiV1vQ12xrucKhSamsD/wUlQIsYYWHy+avaI
         obA25YE7aZvSaQx98H0xl+7diumsUVY56Lt6INkhWp+cdmkidwimoUxFezU2ozNfDZGR
         RdgyUhvjRPAnz9GVFigvUb+SZ1k5VWpqUFO6UoOHd9gblvnr1KbvLvV2BpBE/p5G7Ov5
         jVh4dBsj0kOpUkjNPDI/5iu2So3f7+6lLQq5wsOR8AVG/gBXRLqUIgQzHm21C/X+0WpO
         oU1QHK5rNY4C+h//Yfr9leq11N/FjrsUfWem4nzOeaGDsUFzuxTD8YNCwAttFlqqzVEk
         x29w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789659769; x=1790264569; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b6QcRMWdExnJJ8C8eYRzuUZ+eUGTgGISBUbWC62+eRY=;
        b=FVmqc6iNe9CVO5u5efXrUJTVIjT/dCzQbeRoYbazKkxyEpzRzfLd+8mGrLjF7ePVIT
         1ixJunoD854qbJwhKJcvpZ+rAt1gkX04l2oc1sAeGUqIK120rc12jjIrxro0fe+KlK+M
         15xQlJ+VQe9P5HqctP9qDybb5rqDU5M7/vjG37oT9Bgd00N9oE6rUtlv4qzTABK+S4L8
         ZmR4VKf3/lRTtwXL/5b7us0z1qKSnHl9Q3C5Xv2D+YjpOWMYtLWfsFg8PQMRAVuk8R0J
         SxVdorxMbxhG5Tc0qrIBVz6QKhPU+n0JrVkpryVtjjYDayL3NVltAa8hFLSA0O56mEcX
         e7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659769; x=1790264569;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b6QcRMWdExnJJ8C8eYRzuUZ+eUGTgGISBUbWC62+eRY=;
        b=te4/lfLGF+hXlpBi2GXWwt0DtVnMdfaqzEVe1fPzrRE/QQ5Pb8YmHTTOejZsvoMe3G
         W8U4NVnNxf7GiOBG6rpE6FTnuau9j7xAsxnuYDpdloRB/GS18q7qsF/cglU+vY6mn0e5
         UhCS4WrZH3jGrLeWrJPR35zSTi6nlpLqxQZHHXo3hrDdqMsJTV0MMxN/gm8IjmWccsHC
         IR0qT/tx2RIp3ELiUfaT67CjadWmN2xRJ2bN85HXgG28aoCdOwqJ2Ggdig/HMTdzv050
         kpsPy5ujgolUdBeZGDPrj+Z1SIT65ensbELhpBmxCngnco8A6GItCduIdvyHbAvanWdA
         2jQg==
X-Forwarded-Encrypted: i=1; AKwUvBwF63jNUekaO2HBi6eOSxN+6rfmrO/tFpE5VCYBAU/pgawHlVggdaexSclJoWm2PqmAtIK/0FsUdB2mGA==@vger.kernel.org
X-Gm-Message-State: AFuF++kqitKbk3w5DNo/fphyGatV/ylN4uiOhAdk+DwMmhZp0uLvcHqY
	R15ielYuX4/0ot58MUUHoEqDy6TVs/W83TPJbIF5aEYNwkUTrp5ughQBvR2nPH81C2QN2100iW+
	5HyYttDXWvHlGrmd/6pOt1dOq2mzb3/o=
X-Gm-Gg: AYBFou3y5Dz3cxIuGRT3aIktqyZ4S4sPXfyKBZkz1ThTeQQ1H9Ge//vssvbo5HQeyLp
	tgd89F5YZM1GsMnVwy7FmOBF1a8n3mEfjpLi2BSCNpT2cAkmEX9x0vRz0gck48ZL5jzS7KukIVT
	0assrCpgbCzY5+53PVsBVo778nAH38LvUfJAZAWDzPwx/UnW5jMOzqRxTwieo2kzVmuTqwngZCl
	z7+sQa5dEpXI4TVy8RBfSfE8B0FFh6P3TFo3wDxBYTgaiPM9ZX1MPiYHZKPIGsOXiIH7AWzfowk
	ECyL9TW0cF0anC2nYGIUadXIebGcgUgk+xMBABNVQzxrjlLGPimKNdulzPdvzdQq54PFLogUeB9
	JhM/9bryUs4AmJ31XI5CXyMY=
X-Received: by 2002:a17:907:1c12:b0:c26:19de:9adb with SMTP id
 a640c23a62f3a-c29e53956cbmr555627466b.26.1789659767907; Thu, 17 Sep 2026
 08:42:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACygGA9s1oWO53NPamL5tkaNhUt-W8S736OVAJZcYCU_UOni+A@mail.gmail.com>
 <87zexggmqt.wl-tiwai@suse.de> <CACygGA9h-qehZVFxRMOgtt8y-kHMwSCuuvZwBSi_7R0xpp-dRg@mail.gmail.com>
 <874ifogc5x.wl-tiwai@suse.de>
In-Reply-To: <874ifogc5x.wl-tiwai@suse.de>
From: A Akhil <akhilarul324@gmail.com>
Date: Thu, 17 Sep 2026 21:12:36 +0530
X-Gm-Features: AcwNN1WOwF372b5aZN6jQqBMCpHzRibzvDuWmE-PpVzaGQvaHkZOCiWUYPsk9rY
Message-ID: <CACygGA839V5fg=C7nBTTyT0hy=4LV7kKMz1AH-+E9z3s75p3Zg@mail.gmail.com>
Subject: Re: Sound/seq: hung task in odev_open - unuse callback sleeps under list_mutex
To: Takashi Iwai <tiwai@suse.de>
Cc: tiwai@suse.com, perex@perex.cz, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hi Takashi,

Fair enough on dropping, I'll leave that alone.

I'd actually already tried the 1 second limit before your mail came in, so
the short answer is yes, it holds up. Same rig as before, one thread
opening and closing /dev/sequencer2 while two others open it, three runs
each:

  unpatched              hung 10, 10, 10    worst block ~130 s
  your patch             hung  0,  0,  7    30.7 / 30.6 / 129.9 s
  drain capped at 1*HZ   hung  0,  0,  0    20.6 / 18.4 / 21.8 s
  progress detection     hung  0,  0,  0    11.0 / 11.1 / 11.6 s  <- new

I was running with hung_task_timeout_secs=30 to make the failures turn up
faster, so at the 120 s default the 1*HZ cap has plenty of room.

The last row is new, and it's the one I'd rather pitch. Rather than
picking a constant, it just checks whether the device is draining at all:
wait in HZ/5 slices and give up once avail stops changing, with 10*HZ
still there as the outer bound. A device that works drains completely as
before, nothing gets truncated, and a stalled one gets spotted in about
400 ms. Comes out at roughly half the teardown time of the 1 s cap here,
and it's about 20 lines inside snd_rawmidi_drain_output(), nothing
outside it.

One note in case you do go with the cap. MIDI is 3125 bytes/s and the
buffer is PAGE_SIZE, so a completely full 4K buffer needs 1.31 s to get
out. 1*HZ would clip that, and 10*HZ already clips a full buffer on 64K
page kernels. Unlikely to bite in practice since the buffer is rarely
full at close, but it's the reason I went looking for something that
doesn't depend on a fixed number.

Also a correction to my last mail: I said about twenty substreams, which
was wrong. It's one rawmidi device, midiC0D0, and the teardown just calls
the drain repeatedly, around 31 times per cycle.

If either of these looks fine to you I'll send it as a proper patch. And
if I find something better in the meantime I'll pitch that instead.

Enjoy your vacation.

Thanks,
Akhil Arul


On Thu, 17 Sept 2026 at 20:25, Takashi Iwai <tiwai@suse.de> wrote:
>
> On Thu, 17 Sep 2026 16:11:27 +0200,
> A Akhil wrote:
> >
> > Hi Takashi,
> >
> > Thanks for the quick patch. Right, it's not a deadlock, that was my
> > reading of it too. Nothing locks up permanently, it's just a wait long
> > enough to trip the detector. That's the reason I bothered with it though.
> > On the syzbot run the wait was over 140 s, and for the whole of that
> > anything else touching the sequencer is stuck behind it.
> >
> > I ran it on the setup I used to find this in the first place. One thread
> > opening and closing /dev/sequencer2 while two others try to open it,
> > hung_task_timeout_secs=30, three runs each.
> >
> >   variant                       hung tasks    worst opener block
> >   ---------------------------------------------------------------
> >   unpatched                     10, 10, 10    ~130 s
> >   your patch                    0, 0, 7       30.7 / 30.6 / 129.9 s
> >   yours + open_mutex narrowed   7, 0, 0       129.9 / 41.3 / 40.9 s
> >   drain bounded to 1s           0, 0, 0       20.6 / 18.4 / 21.8 s
> >   drop instead of drain         0, 0, 0       4.0 / 2.4 / 2.4 s
> >
> > Your patch builds clean and clearly helps, two of the three runs were
> > completely quiet. The third still hung though, and when it does it's
> > coming from the opening side rather than the closing side.
> >
> >   task 98:  odev_open                      holds register_mutex
> >              snd_seq_oss_open
> >               snd_seq_oss_synth_setup_midi
> >                snd_seq_oss_midi_open+0x8e  blocked on mdev->open_mutex
> >   tasks 97, 99: blocked on register_mutex owned by 98 -> hung task
> >
> > An opener grabs register_mutex, blocks deeper down, and sits on it while
> > it waits.
> >
> > I tried stacking my earlier open_mutex narrowing in snd_seq_oss_midi_close
> > on top of yours, so the closer would be holding neither lock over the
> > drain. Still hung 1 in 3, and the wait had just moved further down again,
> > this time into snd_seq_port_connect() on grp->list_mutex.
> >
> > Three attempts at moving locks around now (mine, yours, both together) and
> > every one of them just shifts where the wait happens. I don't think the
> > locking is really the problem here. It's the 10*HZ per substream.
> >
> > Bounding the drain to 1*HZ in midisynth_unuse() does stop the hangs, but
> > the cap is per substream and there are about twenty of them, so teardown
> > still runs ~20 s. Capping the total across the teardown would do better,
> > though that's more surgery.
> >
> > The one that actually worked was swapping snd_rawmidi_drain_output() for
> > snd_rawmidi_drop_output() in midisynth_unuse(). ~2.4 s, nothing hung in
> > any run. Most of what's left there isn't even the data wait, it's the
> > msleep(50) per substream for the Tx FIFOs.
> >
> > I did wonder about throwing the data away, so I went and looked. As far as
> > I can tell snd_rawmidi_drain_output() already drops the buffer once the
> > 10*HZ expires, so the bytes are gone either way and dropping early only
> > costs whatever the device would have taken during the timeout. For a
> > device that isn't draining, which is the case that gets us here, that's
> > nothing. Tell me if I've misread that.
> >
> > So, do you want me to send the drop version as a proper patch? Or would
> > you rather bound the drain, in which case I can try a total cap instead of
> > a per substream one. I can also test a revised version of yours if you'd
> > prefer to keep this inside seq_oss.
>
> Hm, dropping isn't optimal, as that's a clear behavior change; there
> can be pending bytes even in the real use case.
>
> Actually, shortening the drain limit would be an easier way.
> Practically seen, 1 second should be enough for the real hardware.
> If this is enough for the syzkaller report, we can take it quickly.
>
> Another option would be to offload the snd_seq_kernel_client_ctl()
> calls in seq_oss_midi.c snd_seq_oss_midi_open() and close() to a work,
> as you pointed out previously.  This would be relatively safe, I
> suppose.
>
> In general, I'd like to avoid touching too much outside the OSS
> emulation layer.  The shortening of the drain limit would be OK, but
> restructuring else isn't preferred.
>
> In anyway, if you can pitch some good workaround, I'll happily take.
>
> (But I'm going to be off from tomorrow, so it'll be continued after my
> vacation.)
>
>
> thanks,
>
> Takashi
