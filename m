Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B2339478D
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 23:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787612591; cv=none; b=oKdI9AycWmXtXqI4nQHNzds1BeSWvFQhMdusXYl/wDlk3Ny2LWOgg6v+Nw0AedUGO6OFbgVHlsweZPwKtlXJkHKVYJzAJYkbMRiJIMaOWAKZe4hLb5p0nMhiE+f9erDtlms3sz6jqd2xWV0JeuYSAK5TG3hd2+Ii4stKlfOMsKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787612591; c=relaxed/simple;
	bh=/1foBF7VlL/7uxu6yzqF78E0uZqgGsLOoVF68bHyOg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lv240KsxsMe+nXPR+vouEQFtcEHdi6Cu4ZWgc02SHJIueu1qLxaaaxO7pu2WivRU2JBsM2dCSaxQsB+8QVb8kYBoYh3lcLJCvUjF8Yy8ypd4Ep//pHV8nnveofVdtzlgGS1q64ovfaPsHVY2KPDKxmz9Ou0D2igLVHEl4rpsXmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k41L3R0U; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k41L3R0U"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-44cedfaab6bso2015263fac.3
        for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 16:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787612588; x=1788217388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NXTZP5NpaF1R+eK/ywU81m7+/uTCENAME72WUihn6KU=;
        b=k41L3R0UHAkdNsQEQ+4xDMI4mvAnLrOWYQWReZ0qljlkj7vH5rlfGW1in9q+4p1jYB
         12HS0nedAEJuQuJU84HnxmOtJV8a1BSA/hWnD3Dzj/P9Z6+OdZZd1Pt2jYSSRFy8aTuy
         HgAq4rblFBFhW/VawkgGN8F5HAvhNuxdRoCJ7nyS0UdRyKfTa5NevIK8lrJRTGgHb7s4
         nilySiqCt41iq0FpFhNxAPpB4PaHKkZxn6d0JINrF8OloLVa6BPSFoXkDDLL2u6EcJMp
         2zHv/ef8kOHQ2m9348dbQodFSS5GHKKXXlKAu6m3nTHcaVdMTb6ySM2slDMQlNxM3uJ8
         Mi5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787612588; x=1788217388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NXTZP5NpaF1R+eK/ywU81m7+/uTCENAME72WUihn6KU=;
        b=HSHmA+73W+AlDBy8qUFPYIPxYFfyUC/t7h/p7a23IWptzuAotf8HnUQge6F/qa0Boj
         m+MRFp8herszEuANLxRZBZIcBTewEAA61+a84XYmldZiHjZGRIzfUENdeJWmELFhc2pN
         5eiabRGoQr2V3qKa35l+RfbMu2xwo++qoQxZuJvYVVWzyLkstKEtoqJ3Z1sKe6LCjTur
         BImDIKylLZbTCJ5HriEGUCSFSwq4hcSmzy14gm/Hjc85lfO6C7IdwNK08VwvrnMu4SJM
         t1wFbaQWpS3X46COCXf1abHLyJ8VOqy5i5ggDd61oWVqh11iib5xADiSo9ajgRatm245
         gu8g==
X-Forwarded-Encrypted: i=1; AHgh+RpaJkd1h25FMAERR4X9jm5O/31eY2bUh4KkfN44lLGU0uhbNeE5XKb0LPfUQQmGZiEKqDKEH7svk3O1TA==@vger.kernel.org
X-Gm-Message-State: AFuF++kVIdaLs92qZZFiGmTywVBw5LPXY11uY+j8vssdbz1cFKOvs6SZ
	x+EZxkG7BgykSPAup/OwEGxpWdpxWbhpruDnqrxZ33dJwe8p9Ey3qiYx
X-Gm-Gg: AR+sD12cg9BJE2bgZ0u7MR75QQtXEQn66yVROoqun4LfEt9vaIXYj+i7y8b6q+n2t0O
	bS0Gnfr/j83ElJpdXgql2QU4Q3P08YO1Vaanfx6t3qX0s0m4+t78Z8JdtBxMG7JyHipTtD95KZI
	CnpWKHZsVYSdifFx9EtSbvP5PBaQRZ7AGYf5boFCVZ/kx1OLZqpQn8PzqMZPY6wlgRsjZPyKhc9
	4R+ncbmr5W3aW8E8JCnGxuxAwSb8CzIlh+bjWw7025Nn6xla6TTFTkb/+5ZWU5qEYHsRPYo+HPS
	8/j+dphPPpo7MOeJr/JmqvF0nyI8HAeMgKTXpMEZbI95eydDQQ4PSKxGDVueEUA48WpyvW4kKN6
	eVM5Mi4CX3GuHszHfAl50NGoxk5JMevnmaPVExOV1bPLVTZKq5Hs81wsZeeQ5zrQ1sWz7H/jeCJ
	J/UvYOJh+nBE0h+gRpwPJ/trOwCZzpeAQxFVsuf7QO7SxISHfLTXF/lacven/JLT8e4fWNGhz9b
	EJwBA==
X-Received: by 2002:a05:6870:3d8f:b0:441:3cdc:28c7 with SMTP id 586e51a60fabf-4637fb020a5mr22401924fac.9.1787612588135;
        Mon, 24 Aug 2026 16:03:08 -0700 (PDT)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46383539b74sm5916354fac.14.2026.08.24.16.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 16:03:07 -0700 (PDT)
From: Will Porter <mrwillporter@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	"Geoffrey D. Bennett" <g@b4.vu>,
	Asahi Lina <lina@asahilina.net>,
	Chris J Arges <chris.j.arges@canonical.com>,
	Nick Kossifidis <mickflemm@gmail.com>,
	Detlef Urban <onkel@paraair.de>,
	Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>,
	fenugrec <fenugrec@mail.com>,
	Frederic Popp <frederic.l.popp@t-online.de>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	Shipei Qu <qu@darknavy.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC] ALSA: usb-audio: missing PM guards in device mixer paths
Date: Mon, 24 Aug 2026 18:03:02 -0500
Message-ID: <20260824230302.27965-1-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I found user-triggered USB transfers without the snd_usb_lock guard in six
snd-usb-audio mixer files. The affected paths include ALSA controls in all six
files. mixer_scarlett2.c and fcp.c also have unguarded hwdep operations.

I would appreciate guidance on three questions:

  * Should the control callbacks take snd_usb_lock and preserve their current
    fresh-read behavior, even when polling prevents runtime suspend?
  * How much of each synchronous hwdep operation should the shutdown and PM
    reference cover, especially around userspace copies and protocol waits?
  * Should Scarlett2 flash erase hold a runtime-PM reference until completion,
    or should runtime suspend return -EBUSY while erase is active?

I checked sound.git for-next at e72d5659a260. Representative control paths
that reach the device are:

  mixer_s1810c.c     snd_s1810c_switch_get
                       -> snd_s1810c_get_switch_state
                       -> snd_sc1810c_get_status_field -> snd_usb_ctl_msg
  mixer_us16x08.c    snd_us16x08_meter_get
                       -> snd_us16x08_send_urb/snd_us16x08_recv_urb
                       -> snd_usb_ctl_msg
  mixer_scarlett.c   scarlett_ctl_meter_get -> snd_usb_ctl_msg
  mixer_scarlett2.c  scarlett2_meter_ctl_get
                       -> scarlett2_usb_get_meter_levels -> scarlett2_usb
                       -> scarlett2_usb_tx -> snd_usb_ctl_msg
  mixer_quirks.c     snd_rme_digiface_rate_get
                       -> snd_rme_digiface_get_status_val
                       -> snd_rme_digiface_read_status -> snd_usb_ctl_msg
  fcp.c              fcp_meter_ctl_get -> fcp_usb -> fcp_usb_tx
                       -> snd_usb_ctl_msg

I scoped this audit to user-triggered control and hwdep paths in the
snd-usb-audio mixer files. Other sound/usb subdrivers are outside this RFC.

The RME Digiface get and put callbacks in mixer_quirks.c share this omission.
Most other direct control transfers in that file already take the guard.

The Scarlett2 hwdep read and write callbacks call scarlett2_usb(). Several
ioctls also reach that transport. These include reboot, erase, erase-progress,
and segment selection when an erase is pending. scarlett2_hwdep_open() can
also poll erase progress. The FCP FCP_IOCTL_INIT and FCP_IOCTL_CMD operations
transfer data through snd_usb_ctl_msg(). The other FCP hwdep operations do not
transfer USB data.

The Studio 1810c, Scarlett2, and FCP drivers use private mutexes to serialize
their protocols. mixer_us16x08.c uses chip->mutex. Those locks do not acquire
a runtime-PM reference. The Scarlett Gen 1 meter and RME Digiface helpers do
not use a protocol mutex around their single control requests.

The common mixer paths do take the PM guard. get_ctl_value_v1() and the v2
path in mixer.c use CLASS(snd_usb_lock, pm)(chip) before snd_usb_ctl_msg().
Many mixer_quirks.c callbacks do the same. The Forte callbacks in
mixer_scarlett.c use the older explicit snd_usb_lock_shutdown() form, but the
Scarlett Gen 1 meter callback does not.

Failure mechanism
-----------------

When the USB device enters runtime suspend, usb_suspend_both() clears
udev->can_submit. An unguarded callback then reaches snd_usb_ctl_msg() without
calling snd_usb_autoresume(). The submission reaches usb_hcd_link_urb_to_ep(),
which returns -EHOSTUNREACH for !urb->dev->can_submit.

The visible result depends on the driver:

  * Studio 1810c control reads return the transfer error. Its write callback
    can instead report no change after a failed transfer.
  * The Scarlett Gen 1 meter returns the transfer error.
  * The RME Digiface callbacks return the transfer error and log it. Its
    VOLATILE status controls can repeat that log on each poll.
  * The Scarlett2 and FCP transports log the transfer error and convert it to
    -EINVAL. Their VOLATILE meter controls can repeat that log on each poll.
  * The TASCAM meter callback ignores both send and receive results. It parses
    a zero-filled receive buffer, advances its four-step polling sequence, and
    returns the persistent meter store as a successful read. Because the zero
    buffer has no valid packet signature, this usually returns stale values.

usb_audio_driver supports autosuspend. I did not find the affected USB IDs in
the entries that set QUIRK_FLAG_DISABLE_AUTOSUSPEND. Practical reachability
still depends on the complete USB device and its userspace. A sibling
interface or a polling process can keep the device active.

Hardware reproduction of the mechanism
---------------------------------------

I do not own hardware for these in-tree paths. I reproduced the mechanism
with an out-of-tree Audient iD14 MkI mixer extension that had the same missing
guard. I read an unguarded device-specific control and a guarded mixer.c
control in one runtime-suspended window:

  unguarded Audient control -> "No route to host", no value,
                               device remained suspended
  guarded mixer.c control   -> value returned, device became active

After I added CLASS(snd_usb_lock, pm)(chip) to the Audient callback, that
callback returned a value and resumed the device. This test demonstrates the
PM mechanism. It does not test an affected in-tree device.

The iD14 did not reach runtime suspend in its normal desktop configuration.
Its HID interface exposes the monitor knob as a mouse, and the desktop keeps
that input node open. usbhid then holds a runtime-PM reference for the USB
device. PipeWire also polls the control device. For the test, I stopped the
userspace audio stack, unbound the HID interface, and set power/control to
auto. Whether an equivalent masking condition exists on the affected devices
is unknown.

Prior design history
--------------------

Commit 47ab15459382 ("ALSA: usb-audio: Avoid nested autoresume calls")
introduced snd_usb_lock_shutdown(). Its stated purposes include autoresume and
delaying disconnect cleanup until concurrent operations finish. The current
guard is the automatic-cleanup form of that helper.

During review of the original FCP driver, Takashi asked whether its hwdep and
control paths needed suspend, resume, and disconnect handling:

  https://lore.kernel.org/linux-sound/87jzbidfs5.wl-tiwai@suse.de/

The v2 response reported system-suspend and disconnect tests while polling
meters 20 times per second:

  https://lore.kernel.org/linux-sound/cover.1735495639.git.g@b4.vu/

Later revisions added private_suspend cleanup for the notification URB. I did
not find discussion of runtime-autosuspend references for the synchronous
control transfers, or shutdown accounting for the callbacks that issue them.

Guard scope
-----------

The likely control-path fix is:

	CLASS(snd_usb_lock, pm)(chip);
	if (pm.err < 0)
		return -EIO;

The PM guard should precede the protocol mutex. This order matches the common
mixer paths and avoids a lock-order inversion if autoresume invokes a mixer
resume hook. Each driver still needs a lock-order audit. Callbacks that only
read a software shadow do not need the guard.

Existing code provides a policy precedent for meter and status reads. The
VOLATILE RME class-compliant status controls were added by commit d39f1d68fe1d
("ALSA: usb-audio: Add custom mixer status quirks for RME CC devices"). Those
controls take the guard around fresh device reads. Following that precedent,
the affected callbacks should preserve their current fresh-data behavior and
wake a suspended device. A polling mixer GUI can therefore keep the device
active. Cached behavior would require a separate cache and update design.
Omitting the guard does not provide valid cached behavior.

The hwdep paths need shutdown and PM accounting from the first use of
disconnect-sensitive driver state through the complete device transaction.
Input data may be copied before taking the guard only if that work does not
dereference private mixer data. A locally buffered response may be copied out
after releasing it. Otherwise, the reference must cover the userspace copy.
It must also remain held across protocol sleeps and command-response waits.

Scarlett2 flash erase is asynchronous across file operations. USB PM guidance
for asynchronous output holds a PM reference from submission until the output
queue drains:

  https://docs.kernel.org/driver-api/usb/power-management.html

By analogy, runtime PM should remain referenced from erase submission through
completion. Alternatively, the runtime-suspend path should return -EBUSY while
an erase is active. A scoped guard in one ioctl does not cover that interval.
A runtime-PM reference does not prevent system suspend, which remains a
separate policy question. I have not reduced the hwdep changes to patches
because this operation boundary needs review first.

The missing usage_count reference also means usb_audio_disconnect() does not
wait for these transfers through snd_refcount_sync(). Other ALSA lifetime
rules may protect some control or hwdep paths. I have not completed that
lifetime audit, so I am not making a memory-safety claim here.

If this scope and guard placement look correct, I can prepare patches for the
six files. I can compile-test them, but I cannot test them on the affected
hardware. Tests from the device owners would be valuable.

Assisted-by: Claude:claude-opus-5
Assisted-by: Antigravity:gemini-3.1-pro-high
Assisted-by: Codex:gpt-5.6-sol

Thanks,
Will Porter
