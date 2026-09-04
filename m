Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF77511228
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 16:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788541140; cv=none; b=f8/53Q+s5mv4CwLS+tfIGYPM7cdpkqBD8bv3xw4qR9NxwuTMWMytg++Cap65BnUi36X3WlfCpMMlr2mYXmzcAe9OZke8YG3Qol6vsfvu1lPiy1l9LEIjHlqurJuth7e8Qia4/QHyibobgCvd8SqZNk5HJ+xDmX1ulzxg+lMMx/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788541140; c=relaxed/simple;
	bh=Qc5uP05a3zHwbT/ShEWu54dR/A6V8Jxx5M+or8Kw8bo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ED3GIrddqeCj10ZSvoJM4m5T9KHgxsgmnglXYqzJwEoufTys2IBefEuPdPeTs2oFsmmnwNFkP6QcGS5/hQmRj+D1LcZsbVafBmqwX7LkxRfdSwNWnxdspdO6UHPkX3mzGdquvAGp7l456TlgTSxgsFu2LoHChiSfhZ61SC3OPjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kVi2sa5X; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kVi2sa5X"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a1585728b5so11103701fa.0
        for <linux-sound@vger.kernel.org>; Fri, 04 Sep 2026 09:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788541135; x=1789145935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDQyJlP84A1S6r01SROZEDvSk6bhKHfO/X7lscYcvx4=;
        b=kVi2sa5XzjO5rfslfEn0AjPnyKmtL1N37j7G236SugVqossnukN+aJtOC2QndHAiRH
         If2HJp67uHY1gb9lKx/Xdr9o7KaILof2kmrTwntuleQh9VQMAL0fVmRhlCeM3y2UjM6f
         HmmyggnKY6I4Mk8JEYEDh5gK4OK16aXcCKqR16FsVxB9Z9FmOC1OvOTImoYL8VVa6Z4T
         Ct5/2GG3ylzttuG5rSgiQeGgrRhzhUPKTKdbQkFd0rrTLnD8GVoOG4fQFZhVMfTAQcBm
         pHCzLYPaNDFeLd6zS9TUcAzozH3vBRLOBkMnjOdva+F5k6S+SctSPNclhWIOHijmsRYH
         c0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788541135; x=1789145935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LDQyJlP84A1S6r01SROZEDvSk6bhKHfO/X7lscYcvx4=;
        b=cO0I0+Kc6qQYu8xLYCgBhRfGa4TzjXNNRfLhY2WJFXP8ykpzltHIznjIvK66tK2JxJ
         zYALZppsnkMkoIiotnNdFSXhv4LFQqWjEWMfte1cyHhKZOMJBIkctAyo6qww1iqCwx7Z
         8ZFSIFGG0vIXR6QI9ggy8klqJhMxyKvhsM977QGO1EM7wJJYmJnY2z/HRDl9SqBrIDwk
         JloPO++Z2bxhVH7PN+GdBcFV/0sMB6iGkq8KiJea+RfJUQd/6BgdF9QggAFlPOuEa8gL
         LnxA0rCzKi5CLS984t+zAnZXEc5sum6SNNJV846V0i7/GQojhYHMUvUsEP8DIYsSkQaT
         Lerw==
X-Forwarded-Encrypted: i=1; AKwUvBwflR2QTqV6tPx+QvgeQAVvSmQDcOCxj5j384/74st2UYK545QEX8g7fzYlUlZVloSsqMkpzT9jvlhD+g==@vger.kernel.org
X-Gm-Message-State: AFuF++lQbtxDNk5/bWqvg2+g2sE69p6JqyPhQxHY6eSLMBHgK8VAusUD
	ETIECg46UrJPFr0RMUIzq9Z0XTRDKfrRwOIg/2BzvvHABU66i32zF6nY
X-Gm-Gg: AYBFou0Iw0JQlrOAqZA7Df/0HRCKzTcmcmnca8qkLpkej0l1+/X2eMfpTX271Lip1vY
	+Z33vQlBvIqrjbCU2DZWaBA3/J6x/GRUkyzMeIC0RwNlIP8OnNSt5ullQaZHP5bvkOPDZ1F3pv2
	3+12edjfSc2/q2lp3XElpydnJdP8AhE3O9Q5s4nIRzCgF16bL6GO3J93TRwIQjnGCwTc/ofHNuS
	RmOkCtLfiBozBXHdBhp3KsqsZhvgMnirucxf0MrOA6qPqp5xLLKUeFUom7tIz+yVStzIsT5l1VB
	/NQ/3X6tu+eACe4cuODjnucnoYP4ti5/wEOvSOxTCIquDKFKIjT2JDf0GiVmIEeMQ0ND37vpsMN
	H4Q3TUN73zOYWlrxvdJ3u+ZHcwpEd6CvOEBOrSrkyH9HlzB+IEIz7ArScwtVcVVvQRjDaNJZce5
	93NU8kuPfrE40wntXN0cC/ht3UuwqZvTpSF0h2FfE4tnc0kpZc7jy4rq5NIlE+JzYYOdh/Yvopr
	oBzwfGHTngs/Rot4tL33p36NhPIoebsewvKBwEWfjw27NDwF7AHHdeYRX0A8rtzxdImAkb5
X-Received: by 2002:a05:6512:3d0b:b0:5b1:5ccf:5268 with SMTP id 2adb3069b0e04-5b616ede976mr2234793e87.1.1788541134401;
        Fri, 04 Sep 2026 09:58:54 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166f694bsm642070e87.31.2026.09.04.09.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:58:52 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: tiwai@suse.de
Cc: tiwai@suse.com,
	perex@perex.cz,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [RFC PATCH v6 0/2] the Topping M62's vendor controls, on the component framework
Date: Fri,  4 Sep 2026 21:58:46 +0500
Message-ID: <20260904165848.3940603-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904162236.3212370-1-mikhail.v.gavrilov@gmail.com>
References: <20260904162236.3212370-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the experiment Takashi suggested in the v8 thread: an
individual HID driver joined to snd-usb-audio through the component
framework, instead of a mixer quirk that claims the HID interface for
itself. It is posted as an RFC rather than as v9 because v8 is not
withdrawn -- it remains the alternative, and the choice between the two
is the question this series exists to answer.

I said this morning that I would hold this until the questions in that
thread were answered. I am sending it anyway, because a patch gets a
better answer than a question does, and because the last of those
questions answered itself: the correction I sent a few hours ago
proposed deferring the controls until the card reports, and working out
how that lands in code showed why it cannot -- which is in the section
below. The only question still genuinely open is the HID one, and it
touches one line.

Changes since v5:
 
  - topping_master_bind() warned when it could not find its context,
    treating that as impossible. It is not. devres_release_all() moves
    every node off the device before it calls a single release, so
    between a failed probe starting to unwind and the teardown action
    running, the context is gone while the aggregate is still
    registered -- and a HID component arriving in that window takes
    component_mutex first and reaches the bind. The window is narrow
    but it is legitimate, and on a kernel with panic_on_warn the WARN
    would take the machine down for it.
 
    It now returns -EPROBE_DEFER instead, which is what the situation
    actually is: the master is going away, the component came at the
    wrong moment, and it should come back. The framework does not log
    that return, and the HID probe is retried once the audio side is
    back.
 
    The bot described the window as opening in devm_release_action(),
    which unlinks only the action's own node and leaves the context in
    place; the ordinary teardown road is therefore safe. The window is
    real on the other road, which is what this fixes.

What the shape buys, measured rather than argued:

  - card.c is not touched at all. The v8 series had to add
    snd_usb_claim_iface() and snd_usb_release_iface() there, and had a
    defect I reported separately: an interface claimed and marked
    USB_AUDIO_IFACE_UNUSED never gets told to wind down, because
    usb_audio_disconnect() returns at its first line. With no claim
    there is no such interface and the defect has nothing to attach
    to. Watching the wire with usbmon: unbind the audio interface and
    the keepalive stops. In v8 it kept going.

  - the hid_ignore_list entry goes away, so hidraw stays available.
    That matters because five of the card's functions -- the mixer
    matrix, the mutes, the loopback routing, the input power and the
    EQ -- are reachable only through the vendor protocol, and v8 made
    them unreachable from userspace as the price of the quirk.

  - two M62s on one host bind to their own cards. The match is by
    descent from the shared USB device, and it holds: gains set on one
    do not appear on the other, and unplugging one leaves the other's
    controls in place. The quirk road could not be tested for this at
    all.

On the timing worry from that thread: it does not bite on an ordinary
plug. The master goes up from snd_topping_init() inside
snd_usb_create_mixer(), so the bind is synchronous and the controls
exist before try_to_register_card() -- the same ordering as v8. From
HID probe to component bind, 54 to 57 ms across five replugs. Only a
module reload onto a live card adds controls after registration, and
there a desktop mixer does not follow the renumbered elements until
wireplumber is restarted. That is a real wart and I have not found a
way around it that is worth the code.

What the card does and does not report

I got this wrong twice in the v8 thread and would rather state it
plainly here, since the design follows from it.

After a subscribe the card reports itself in two waves: jacks at about
0.9 s, then at about 5.2 s the jacks again plus the output mutes plus
the gain of every input whose jack is present. Every turn of a
front-panel knob is reported as it happens, gains and output volumes
alike. What is never reported is a source selector, because the card
reports events and a selector has no front-panel control, so no event
can exist; and an output volume before anyone has touched it, because
it is a setting rather than a physical fact.

So five of the nine controls have a source of truth on the card, two
have one only after a hand moves them, and two never do.

That looked at first like an argument for deferring the controls until
the first report lands, so that a value read at connect would be the
panel's rather than something restored over it. I have not done that,
and here is why: alsactl restores once, at card add, and does not
come back for elements that appear later. Deferring would therefore
trade an accurate value for five controls against no restore at all
for nine, and would wait forever for an input with nothing plugged
into it -- which on a five-input card is the normal case.
The controls are published at bind, as in v8, and the value at
connect is the restored one.

Open question, not blocking the review

hid_hw_open() sets intf->needs_remote_wakeup, and usbhid offers no way
to take input reports without it. This card does not advertise remote
wakeup (bmAttributes 0xc0, no power/wakeup node), so that forbids
runtime suspend to the whole device -- undoing something an earlier
revision of the v8 series had to fix. The driver clears the flag after
opening, with a comment saying so, because it resynchronises on resume
and has no use for a device-initiated wakeup. Jiri and Benjamin have
been asked whether that is acceptable or whether usbhid should offer
something; the question is in the same thread and unanswered. If the
answer is that the clear must go, HID_CONNECT_DRIVER replaces
HID_CONNECT_HIDRAW and the hidraw node goes with it.

Tested

Fedora, 7.3.0-rc1-bc35965f6940 plus this series, with KASAN,
PROVE_LOCKING and UBSAN enabled. One M62, firmware V87.05.45.48.27,
and a second of the same for the two-card test. Everything below was
run after the fixes listed above, not before them.
 
All nine controls read and written from amixer and from the front
panel, values cross-checked against the panel.
 
One hundred cycles of module load and unload against a live card,
which is the path the fixes touch: the controls come and go while the
meter stream keeps arriving, so .raw_event() runs against a set of
controls that is being taken apart. No splat and no lockdep complaint,
including on the lock order the first fix introduces -- m62->lock is
now held across snd_ctl_notify(), which takes the card's
controls_rwlock inside it.
 
An audio-side unbind and rebind, exercising topping_unbind() through
the master rather than through the HID driver's own remove.
 
The cable pulled out of a card while a control was being written in a
loop. That produces a run of failed writes and then the disconnect,
and after the last fix it does so without a line of complaint each.
 
System suspend and resume: the subscription survives it -- turning a
front-panel knob afterwards still moves the control -- and the
selectors are written back on the way out, as they must be since the
card never reports them.
 
Two cards on one host, on different ports of the same hub: the
component match is by descent from the shared USB device and it holds
-- dmesg shows snd-usb-audio 3-1.3:1.0 binding one HID device and
3-1.4.2:1.0 the other, each card carries its own nine controls, gains
set from one front panel move only that card's controls, and
unplugging one leaves the other's in place.
 
Not tested:
 
  - hibernation, and with it .reset_resume, which shares
    topping_resume() with .resume. This machine is not set up for it:
    there is no resume= on the command line and zram takes swap
    priority, so the attempt logs "PM: Image not found (code -16)" and
    powers off instead of saving an image. That is the same on a stock
    kernel and has nothing to do with this series, but it does mean
    the path is unexercised;
  - kmemleak, compiled in on this system but disabled at boot;
  - a card whose battery has run down;
  - anything on a big-endian host.

Ordering

The HID driver comes first. Between the two patches it binds, speaks
to the card and creates no controls, which is harmless; the reverse
order leaves a master that never matches, which is equally harmless
but leaves hid-generic making a bogus input device out of the
descriptor in the meantime.

Mikhail Gavrilov (2):
  HID: topping-m62: driver for the M62's vendor controls
  ALSA: usb-audio: bind the Topping M62's vendor controls

 MAINTAINERS                   |   9 +
 drivers/hid/Kconfig           |  19 +
 drivers/hid/Makefile          |   1 +
 drivers/hid/hid-ids.h         |   3 +
 drivers/hid/hid-quirks.c      |   3 +
 drivers/hid/hid-topping-m62.c | 925 ++++++++++++++++++++++++++++++++++
 sound/usb/Makefile            |   1 +
 sound/usb/mixer_quirks.c      |   5 +
 sound/usb/mixer_topping.c     | 236 +++++++++
 sound/usb/mixer_topping.h     |   7 +
 10 files changed, 1209 insertions(+)
 create mode 100644 drivers/hid/hid-topping-m62.c
 create mode 100644 sound/usb/mixer_topping.c
 create mode 100644 sound/usb/mixer_topping.h

-- 
2.55.0

