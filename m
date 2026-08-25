Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C40B3EA973
	for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 08:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787648230; cv=none; b=h5MS+W8yaykicOkbFUSVzhmGq04bO/57HBIBKzoP9R1pVPfPZ3hhIsuWlvqFjVZgnVMl1X7Cic9I6Ba5wgrD0FnIe5fy6nXyfnI0TdNVQ2tgBQAD6kxc0x/d2co/EwYdTuEimG+01Sxrl3Bme3ABytwgkabZOzNGPnDONH5gJi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787648230; c=relaxed/simple;
	bh=ZoNtM5t+Z5PI0+lWUD4C9jSd6KLHw0073ADCXdfpqS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GzgkC0FPgJ78vH1qbrSlRRFicbz3NE5BXQL29pPS9MS5HrA1hclNKqTelc4UdoA6SE5H7DQabXfPHyTsk1NHcycXtjik4M6nTMPvcslKKsj8JzNgbWv+2a/FH8FBZfcwnLEisuwvXZJQWh92Bjoo9Q7lOtG8xsiJwRaixvC55mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dz8SBMl0; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dz8SBMl0"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39c74c469e8so27495941fa.0
        for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 01:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787648225; x=1788253025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nyONsrEV8TZnFTN6/Rlk0LvFdDftzmWhi+OkpXgB5SM=;
        b=Dz8SBMl0NoNQGCI/10QzNajUplrEhUBRMN8q3PJKPhAfc1cPeLih36oSMzOljdH+P+
         qjhRh0ZHEQe1840v17gLk2r5dODdmU7oiWbV74Kb/+MHo6D37Sw46kuSNLkM6UcifKAG
         0cb1gbdf/7LtjnurfqAuxKCOEhwR9q2XtBHvf+78sZu43c8k0bvngIgv+KO7ANx5KaVb
         FglUQ7bvScXDRBKsFnQ7Ci8l+HUdYq8W0zUonmMMONVPzWaPCpGQsfEeLSgyKuRP69GA
         V+HcYfX2kp+owgUYvhYZxTB7W43BY+LCn8IwWjOSGGRYwATcPTQLgLku5s3yRhIId6Te
         rYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787648225; x=1788253025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nyONsrEV8TZnFTN6/Rlk0LvFdDftzmWhi+OkpXgB5SM=;
        b=rPic55YX/05rwQJlSWcWns+P2zZX7Jz89ZvsOgSuVE6SrIQAMfmI4+Nb9+s/5o9SCF
         PcD2/9i1QfUZ9d/deJi8Uxtf2VzYhAMT4bkplpDBXPlKT1JzgM8Q0oc/nAR/9SyV4wcA
         rLUZ/IDtkaABzC/XaLFg3Cu4KQdi30L5wzFTKr2ExwktCL16Ngnyv3KGcajtNs9Qkx+x
         /HoJoao7wShzJQTqukyz/aamgnKMNsTtLWx6r0MCld0RuzI1FUCm6S9plxbacApdVGeL
         4q3I3lTAP8CDViQaL5iMpe16EIuzyIwolroHYoV9Y6J1Jt8FV6OVAqQSjJucEO/pw1x4
         jqjA==
X-Forwarded-Encrypted: i=1; AHgh+Rpaq8U+d/fCtJeHamywn5dU7iscqTT04G1jjrZ/bp40cfLmKAmgOyHeKwyoFy/B1N59o2S5wcxcqJoRHA==@vger.kernel.org
X-Gm-Message-State: AFuF++n+jLzZWh0R4xCzeP7PSupi4Ufz1V21e6ryTgGk2fCsQZJdiPa9
	s4wOrCj00apzvAGtZb9yUgHFupGaJRREjtRE0z5iBHRhsMuZnWloYnJ3
X-Gm-Gg: AR+sD13Ue/aI4KVQlY+KAOZH3IUjMjlXM0whvLqrvWVa5nPpGy/CFL0JIxFsHY9md2W
	iL3Z2Lgso2JNVj8y80OIB/5Hxf2l/sevmRrv6f9Ao94nWlwOYGi+ev08CyYmpTvbNknG6GCu3vM
	nLZ2DzTf38qyU4mCoFE3OT0XBr1kMNPCHQz8gren54yCFh6TxO1jkiP7VRIeOwWdU3d+AXjByAk
	IpUwaySzNh0RSZVMo3bg4/iGR1/bHz8vIpAAxnfh9zEOSjEcZWNycB7Kwd9p6lkAqhOprvLMujg
	VyCsFwYHkSnJZAnqJd9/YciMKxyo2EeJcAVHuUzGKbFSRorj/bmORd8QZIAKDNj3Q1p3ZZWxT7f
	DDsWPIKdPLaPPvt5DJhscaOV18570v63Lq2CdsMaq1foRlYYU1OOT0qjN1RVCFrtjx/6bveeith
	b8mTIP1V54WBgvMlCLnhTHUsg2ltbR3Xl1NPqTnQs0EVy69AjUsbGsr9ta7ScgIZichEk+oOXg6
	XOC8panIsSbPK+5V9UnAaMEn3PN/zvxaJcH69xiApmxoHo1yom+ULol+1/5
X-Received: by 2002:a2e:a10a:0:b0:3a1:4f33:f64b with SMTP id 38308e7fff4ca-3a1c1e271dcmr63296991fa.8.1787648224196;
        Tue, 25 Aug 2026 01:57:04 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1c2e56737sm20545111fa.6.2026.08.25.01.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:57:03 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH v7 0/2] ALSA: usb-audio: the Topping M62's vendor controls
Date: Tue, 25 Aug 2026 13:56:57 +0500
Message-ID: <20260825085659.52675-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260824223107.406504-1-mikhail.v.gavrilov@gmail.com>
References: <20260824223107.406504-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v7 takes two more points from the automated review of v6, both in 1/2.

The first is a build one: SND_USB_AUDIO now selects CRC16. The frames
this driver reads are checked with crc16() and nothing else in the
directory pulled it in, so a kernel built with CONFIG_CRC16 off would
have failed to link.

The second is another deadlock, and again of our own making. The
keepalive woke the device before writing; a runtime suspend arriving at
the same moment reached this driver's suspend callback, which waits in
cancel_delayed_work_sync() for the worker -- while the worker waited in
the PM core for that same suspend to finish. Waking is now the caller's
business rather than the frame writer's: a write asked for by a hand
wakes what is asleep, the keepalive and the resume path do not. The
first because a sleeping device has no subscription worth renewing --
resume renews it -- and the second because it is the resume.

That also fixes something nobody had reported yet: with a write every
two seconds and a default autosuspend delay of the same two seconds,
the card could never reach runtime suspend at all. It can now.

The rest of this letter is v6's, since nothing else changed.

v6 took four points from the automated review and declined two. The
first of the four is a deadlock, and it is worth saying how it got
there, because neither change that made it was wrong on its own.

v3 added a mutex around each write, so two writers could not reach the
device in one order and the cache in the other. v4 added a resume-time
write of the source selectors, since the device never reports them and
nothing else would restore them. Together they close a loop: a write on
a runtime-suspended device takes the mutex, calls into the device, and
waking it runs this driver's own resume callback on the same thread --
which takes the same mutex, held by the caller. The order is now the
other way round: the device is woken outside the lock, so a wake that
runs the resume callback finds nothing held.

The other three:

  - A URB that completes with an error is resubmitted unless the error
    means the URB or the device is gone. Bus noise gives -EPROTO and
    -EILSEQ, and stopping on those left the card silent until it was
    replugged. This is what snd_usb_mixer_status_complete() does a few
    hundred lines away.

  - The resume path now forbids I/O reclaim for everything under it,
    not only for the frame buffer: usb_interrupt_msg() allocates a URB
    of its own with GFP_KERNEL, so a polite flag on our allocation
    settles nothing by itself.

  - The claimed interface is held with a reference. Claiming does not
    keep it alive, and this driver hands the pointer back to the core
    when the card goes away.

Declined, for the third time and with the same reasoning the v4 cover
letter gave: a control callback cannot dereference a freed private
structure during disconnect. snd_ctl_elem_read() and
snd_ctl_elem_write() take snd_power_ref_and_wait(card) around the
callback; snd_card_disconnect() ends with snd_power_sync_ref(card),
which waits until every such reference is dropped; and in usb-audio's
disconnect, snd_card_disconnect() runs before
usb_audio_disconnect_components() reaches this driver's private_free().
There is a second reason not to do it anyway: taking the shutdown lock
in a get would wake a runtime-suspended device in order to read a
number this driver already has in memory.

The path was exercised. It needs the card in runtime suspend at the
moment a control is written, which does not happen by itself here: the
driver's own keepalive writes every two seconds and the default
autosuspend delay is also two thousand milliseconds, so the timer never
expires. With that delay set to zero the card suspends between
keepalives, and a control write then returns at once with the value
set. I did not go back to v5 to watch it hang.

Tested on the hardware as before: values arrive by themselves after
probe, a front panel knob reaches the driver ten minutes later and
after a suspend and resume cycle, a write reaches the analogue stage
(one source recorded at gain 30 and at gain 60 differs by 30.4 dB
against the 30.0 dB the taper table predicts), the audible selector
test passes, unbind and bind again works, and alsactl stores and
restores these controls without complaint. On a KASAN and lockdep
kernel; no reports.

The questions from the v2 cover letter still stand: whether
snd-usb-audio registering the hid_driver itself would be a better shape
than either road posted, and whether there is a convention for a
control that can be written but not read.

Mikhail Gavrilov (2):
  ALSA: usb-audio: expose the Topping M62's analogue gains as mixer
    controls
  ALSA: usb-audio: let the M62's outputs say what they listen to

 MAINTAINERS               |   6 +
 drivers/hid/hid-ids.h     |   3 +
 drivers/hid/hid-quirks.c  |   2 +
 sound/usb/Kconfig         |   1 +
 sound/usb/Makefile        |   1 +
 sound/usb/card.c          |  19 +
 sound/usb/mixer_quirks.c  |   5 +
 sound/usb/mixer_topping.c | 798 ++++++++++++++++++++++++++++++++++++++
 sound/usb/mixer_topping.h |   7 +
 sound/usb/usbaudio.h      |   4 +
 10 files changed, 846 insertions(+)
 create mode 100644 sound/usb/mixer_topping.c
 create mode 100644 sound/usb/mixer_topping.h


base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
-- 
2.55.0

