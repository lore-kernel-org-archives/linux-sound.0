Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667120;
	b=g/egBuk1X4Gmiws4J4LuWRocFqnKnMf+1VuSEntMJyuWUkluY/48dxa5CMhHGUbL60Iv
	 V7fiA614+0AV8GzcBG9rClzTeac+cxSRt0gDXUDZFTngAf5kB3tyOuZw0q8MWf6CL0OUG
	 X12Ias7WZUib2JAcnyf2MXMzQFFPsVSguU+YPET1wTg/TRXGbAbbW51mRyCmUbCvppXXO
	 tu/KaMbFB1hetBc5cfvruDCzuZcYM2Eg+gRv3H+IwaMsq59qKBBRK3CapZbNkGplFPnZl
	 XIsqCiHgmzGboNrGMWbJj78sXlCN3O/T4b5wjykJN+CbLG9Y152nw0IaOKByGMib7IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=bssKkRJttN/djRWQQQ53FlBk/rLPxh8KkyC4HXMLAqM=;
	b=ciDYHPznR/XDftd0c6/AZm+Vr0hZY9eDQGjr1KNCPrVD6empBL/Ycud3PyKaylrkZLu6
	 esAMck1sXsJRTlye1zTxtuXXWpt8wlivfQp5uIKeuHNQLh+9xnjkWv5legHdJFxiVuN5l
	 Prq4lyrkfroZMiDOVHdgZxwh0D/HGR1YVMz509kFdvUKo/Zl2sSl7Ds8b03P5ictqf2dY
	 6O1S9HAtB1AppMSiOpkJzFOXnWlrEVegsTmsBXJ3CQUMIezPBR6Py5JGGjOMgXA3iiDCS
	 PEu0v4PFJXi4ZeS6JXN48Nlr2FIqXYaR9t3/Ldluq22uqT0k3xOWQpjQAdDTPCNHDVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=so726Gus;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F622606A327
	for <linux-sound@vger.kernel.org>; Sat, 14 Nov 2026 14:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F622606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=so726Gus
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-84a248254f4so1790979a34.0
        for <linux-sound@vger.kernel.org>; Sat, 14 Nov 2026 06:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794667118; x=1795271918; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bssKkRJttN/djRWQQQ53FlBk/rLPxh8KkyC4HXMLAqM=;
        b=so726GusKYHIPd7pN8gN6MqjcFO1I9hplRnn3hCNOAYG7JrXZzeWHiE4pT7U1Y4l0n
         cMBYq5mqQ5nZ/oGAlSNszTqYAhXhLmU7prvajELN1fYIENxKYvhPwkBmynUoKtzTTJo6
         HrxJbHStKT0YaYbxM1EzQulXBNM32k7/oex8nSk2cvmsMKQ2pWawkty7pd5/s+NdoitC
         mC1JzgNgS7bQagbuyGJ0NVHH94NzPcTfNdhCXNDdJYQNaFE9CgDaRrcLnnEtT52+dD4x
         DObAW5CTGlJi/T0nyQnweiqIhDkyCygXVgMNiEOeeKsqgxf/YdZ7s4l+XMI+o452h7iP
         pzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667118; x=1795271918;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bssKkRJttN/djRWQQQ53FlBk/rLPxh8KkyC4HXMLAqM=;
        b=BDBv20eYyY83MTXyTOrUZ+9Km8WmdpqnSra9vG4bwDA4RI+L9MWMPYPzXk4qsWSlTI
         n+ZlSNVHp7IqL2l8Y/HGgiVqqth6DPUU65aZtNgLMNOG67HOk4lSMDhFuPBVueXbd2Tq
         EmtM+tbDvmqT01xJu1skOQrZa9W4cmW9BE/vDw2gGANimSkH4d/ToqnOWx1L4pMEkMMU
         N/L4uvF2U43CP1nwpfzs8OFV0TuTo07NnE7Hee0WihqcWfBYzRU35zllu+fA8usib+w+
         FuT98QoMnfYEzWYHLZztX3mQ9fncjz+jClcKhpmBLR0Bh6QP2HRH4ITcL4xfnYdCFJI9
         hyxg==
X-Gm-Message-State: APuU4Z8BCX2jD/h4iMX85a2ZO8+WGa9CF2/pYtOgdSH+6tx3vf7DwpXZ
	SWYYUFU+SQwOiYFEH0/a5pA3nwRlqzyfdssZ+mBPP7KWE1gtKEXLEthkAe2Bs0g0kNc=
X-Gm-Gg: AYBFou3iTa0WBJFvBJDPCGtuRg9C5tcGTH/L2F8Wni27707sba5GeXhmBe76RZo88SU
	+vLWBGgrUB/SHvj0SCwLcaLnWenBj01CD4/C2DQVpf3lzs0hWc/9UEPwN6EeYkk2Xo51BSEKbvy
	mokoVx11ertlfDIH0y1fjsPXrsW/3JOr6DMeiIim4zPCEoyrnxaiTHYT/QfQoEkhAZExb7e9F3+
	iESVn/tvROgP5uRiN3F6A/vheZIvqtjcZduD0DlFKsLhGFnYIs8irQTSzAbd+JP+DlsDXovAawE
	HtO+OiwW5ByO6GsuUCUpObKd5ioQ5zqg2ETEWnMpZSFnC4vRgCRu5bPRlsySyUBam8SF0zgjhn6
	8LeyMsgng+tiT9lhdJHXBq4Ow31Hlg/LhXzL4zotivXvHxZtRlsZOrF9DWHTy+4/8rRKxL33pyi
	SWtG1WE+0fSwauY2Qb1Z9OGedD3XwW3yO8UboSF0Ct8Lz4pv15gAEOZznrlwf1gafRNANcp2qqX
	2GSik2jrPmkaOq+Bl03OMwFXR9dlUCzLHiL1HEFiKgzVtAplhU8sQ/libx8Xuo10Z5XtVLpfJA0
	nHJpPNlBcyg=
X-Received: by 2002:a05:6830:640c:b0:828:d647:332c with SMTP id 46e09a7af769-862898f6bf9mr4547004a34.25.1794667118508;
        Sat, 14 Nov 2026 06:38:38 -0800 (PST)
Received: from xhanost ([2001:18e8:3:3004::61ce])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862a56c4745sm1783913a34.6.2026.11.14.06.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:38:37 -0800 (PST)
Date: Sat, 14 Nov 2026 09:38:33 -0500
From: Alexander Toth <alexandertoth96@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Subject: ALSA: usb-audio: lowlatency playback runs 25% slow, no xrun
 (Scarlett 2i2)
Message-ID: <avhyadCiNUguBI-P@xhanost>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On a Focusrite Scarlett 2i2 3rd Gen (1235:8210), playback with
lowlatency=1 (the default) and a two-period ring runs at about 75% of
the nominal rate when the application does some work between
snd_pcm_wait() and snd_pcm_writei(). No xrun is reported; hw_ptr just
advances slower than real time. With lowlatency=0 every case runs at
the full rate.

Setup: S32_LE, 2 ch, 48 kHz on hw:CARD=USB,DEV=0 (EP 0x01 OUT, sync
type SYNC, 125 us packets). Kernel 6.14.0-24-generic (Ubuntu 24.04),
alsa-lib 1.2.9.

The test loop is: snd_pcm_wait() for a free period, busy-wait N us,
then write one period of silence. The rate is frames written minus
snd_pcm_delay(), over 5 s. Frames consumed per second:

  period x n    work    lowlatency=1   lowlatency=0
  128 x 2       0 us       47,999         47,999
  128 x 2     300 us       36,159         47,997
  128 x 2    1500 us       36,569         47,999
  128 x 3     300 us       48,002         47,999
  256 x 2     300 us       41,090         47,999
  512 x 2     300 us       48,010         47,999

Other observations:
- SCHED_RR priority 20 doesn't help, so it isn't late wakeups.
- Writing the previous period first and computing afterwards holds 48k.
- The loss doesn't scale with the work: a run is either at 48k or at
  about 36k (one period in four lost). Near 50 us, runs flip between
  the two.
- At 128x2, delay is 510 frames with lowlatency=1 and 512 with
  lowlatency=0, so low-latency mode gains nothing on this card.

From reading sound/usb in v6.14 (not traced): snd_usb_pcm_playback_ack()
only queues pending output URBs when !ep->active_mask. If the write
lands after one URB has completed short of data but while the other is
still in flight, the new data waits for a whole URB. With two URBs per
ring the stream loses time, but submitted_urbs never reaches zero, so
notify_xrun() never fires. Is it intended that ack only queues URBs
when none are in flight?

I'm happy to test a patch or collect traces. The reproducer is a short
alsa-lib program, and I can send it if it helps.

This was investigated with Claude Code (Anthropic's Claude Opus 5.5
model). It ran the measurements, wrote the test program, read the
sound/usb source and drafted this mail. I steered and approved each
step, ran the lowlatency=0 tests myself and reviewed this mail before
sending it. No fix has been written, no trace taken, and only this one
device has been tested.

Thanks,
Alexander Toth
