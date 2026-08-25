Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0162C3A7D9E
	for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 11:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787656373; cv=none; b=ijwrxSGNGoVwWJXs5wUfgyLGDgIkHOVlHyazV+dZ84Kv4x/Y3O6KZ701+RjWfPoL5isVJ3ihgEenNwtOSQlRSfLkVxqKN2VKI2pv8EeLNic8OHNKJF3NdFoOsX+ZTlY6zLRYwuPMCSAxt2l77DJUFdwCbxEektRiq9Yg/WKhzto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787656373; c=relaxed/simple;
	bh=3ut0+53ulLpqJ2yCGhneDj/ju6UfNOe2fXyCgV3wpgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aq7Pj05z6LY5/a4Sv6n+SOH6ZI6ntkoz1gnHXqr53e+IB7OdlGHTLi/PwMFjssAqNxKugk44EdM/AvgxDBPUysH3QQHpP7h6r07Dt6oscc1Zh6YGLM2oSRY0h65tVFwvbCNFtybsDIFdxXow5Xr+SERFHhE8faRvT2EddHwTHc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BwMq05XY; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BwMq05XY"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so803917e87.1
        for <linux-sound@vger.kernel.org>; Tue, 25 Aug 2026 04:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787656369; x=1788261169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rOVZB4vmPQPs6XTxAKIMJw/gGUbZuOLUKAQQWC3YOvY=;
        b=BwMq05XYEj5NYB9LSW1xkQypEbVr7fXOMSN8vgwxxQoqFxAmqFjJuxVj4gu0xmvp7p
         r2Sbw4ujjIzuNTCXrsfq7B7jVALy8MO3qn1CTfI1meV/teAfSXYMkOn2Xh2aYmigfi3s
         bHeQC7vXT8nKZGBIjknmTmvaF0biOcQLBOXCwf1fnGiCofBptvcT/vvac0Iy+e7SM14O
         YuJNSRUSEgnknFkQ2jpA6QbupDqneAJVxaLurh9BKUPWYiiC19bEjo+RsEieBPW23uJQ
         QnlTWgbIoFts1DuFCHxcGXkfDQSdm22F2JE0pk1awtwhfirop0O+ejaXN+YVXK1A7aPZ
         6Kiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787656369; x=1788261169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rOVZB4vmPQPs6XTxAKIMJw/gGUbZuOLUKAQQWC3YOvY=;
        b=sfZjvsDd/X5rFomjkzH//vCRjrzKFKMeVSIcIOi3bOaytT6XEIw0UwnU4gs2HltK0t
         I4kqPXwwWcC8jpQg2eG8qX/Aj3I9ThIVt6UKCNMyZCBwBdD3eJPznqP6CExCzCDaTEdi
         OripzDMnKqylHZIjKVff2SRWZXtB7eCnx+mAxeNUaLaoe9lQI6SGM/GTMSDNWjmhF+TB
         8ys4RMKoUXVviAZmj7P8NxmhVaHtMy42VAmZTjdLSbItm05+iAgqoY12+iMx+Q4Padrw
         6iVvwPYXq2QrqZxMM6DeGpJlPsiOnMgHO8buufJBBiil1MD37cuKlOiCbJ6QQ79CECkg
         DVuw==
X-Forwarded-Encrypted: i=1; AHgh+RrK/2QjT0Fuikipm+wo282wHOh7U+/WQfC9cHokJh11QvvM8VQDKT6Z45B91vvyNZcbTxywPGJv8HU8Og==@vger.kernel.org
X-Gm-Message-State: AFuF++lFpNGDq/CA33JqPnPk8TgfMg8YAYSI9F0Mht9NIS132paQRB4f
	B5k+Hy1MhtLhrCXjkdQAz5TNwmbP3ddutatun81aBU4lmD7+CUbVKGp+
X-Gm-Gg: AR+sD12b8xS58xIwMRinLz1SzSZmiNKrdTV+9mEWacoi5s9m+X0RckVdZP6AD7G3hvv
	4aVYz0JBk/clpufZ0ZUqcV382KszaJcusQodX39RF5CPK3daf8CYNco70coCg8laRA29E/Z13uF
	57/taLkjIN28S9zJ1wMb6QxLPJXhxmsJCjcRjVb9cnaA3LfifMOOzQCO54ToOz+1mwuRn61JYTN
	f3iAl00UKGqlOFMw/x3Psa3rYmhf5u39gcxt0m1U351v6IOFHuIUE5urdyNOnPjnDiNKEEr2pnC
	PIGShBpUVjmyQ0SJj3d5u7Huq3rsxwKjzENty6P94hBUkCbF6stwMarwJO9yuNlzQYvMzJWX7Fq
	Al92rnLqSka4jp7tgtuD+1hgJUSpDyIzdoh6/I+Jf9MAp6daXS/tXv5AnHFC54diNqz4pY/pQr8
	TqGzoaGQ3BWI6j/pml/xfVoHa+Z8YyrhNeBF0+7qvnXapD34WGrptmSJcs3USC6U6czOtkeM3zS
	do04BVlWY6gM40pisfOpMZvOE27fup2UfQJGjP+FGlVcQv8FvcB1Vl9oESXXA==
X-Received: by 2002:a05:6512:1244:b0:5b2:aa6c:3214 with SMTP id 2adb3069b0e04-5b49c7ac8e1mr1196026e87.12.1787656367993;
        Tue, 25 Aug 2026 04:12:47 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b48ce3a89fsm2337244e87.83.2026.08.25.04.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 04:12:47 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH v8 0/2] ALSA: usb-audio: the Topping M62's vendor controls
Date: Tue, 25 Aug 2026 16:12:37 +0500
Message-ID: <20260825111239.24834-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260825085659.52675-1-mikhail.v.gavrilov@gmail.com>
References: <20260825085659.52675-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v8 takes two more points from the automated review of v7, both in 1/2.

The cache now takes a new value before the write reaches the device
rather than after. The lock cannot be held across a send, and a hand on
the front panel during that window produces a notification the URB
handler stores; updating afterwards threw that away and left the driver
claiming a value the device had already moved away from. Written first,
the device's own report is simply the last word. A failed write puts
the old value back unless the device has spoken meanwhile.

And the keepalive stops renewing a subscription nobody is listening to:
a write that fails because the device has gone ends the cycle rather
than scheduling another two seconds later, and those two errors are no
longer logged, being an unplug rather than a fault. The review asked
whether the worker could reschedule forever after an unplug; it could
not, since the mixer's private_free() runs during disconnect and
cancels it, but the shape it pointed at was worth straightening anyway.

The selector control has no such race and is left alone: the device
never reports a selector, so nothing but this driver's own writes ever
touches that cache, and they are serialised by the mutex.

v7 took two points from the review of v6, both in 1/2.

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
 sound/usb/mixer_topping.c | 816 ++++++++++++++++++++++++++++++++++++++
 sound/usb/mixer_topping.h |   7 +
 sound/usb/usbaudio.h      |   4 +
 10 files changed, 864 insertions(+)
 create mode 100644 sound/usb/mixer_topping.c
 create mode 100644 sound/usb/mixer_topping.h


base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
-- 
2.55.0

