Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CCD3546C7
	for <linux-sound@vger.kernel.org>; Sun, 23 Aug 2026 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787494949; cv=none; b=FPdzrrdUR3rlsyWpPgD2fb+V8XLnrs87kHNplMQAB550HaJFParxVJJn/ykg2M1Go5iQt6/H4Ym8Vr3sl66fbCBlc+IjQ958pVCJeRcSoDWlVKKwxTzxIjM/9ZenO1FzjKztlslsHDjhrziMp+TtiNFuM4U88MrHh6kLiHKPVK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787494949; c=relaxed/simple;
	bh=XAVA4GsPJulYdTC1U7HRoo7PRQ4Xfw/23QXXI6zD3YY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tYhpb52isrme5DItijCQb8sH2B6jHcP+o7jScBHewNer1+Ku8BPT5q1gJXQPFX9YujIAXKRDq88H+Bc+9nkuP03RmjUSBUqilPkZfePtrTzEeV082RJd4dzw87P3yqHs9R+l/nTN7264ltbgduKQjvS9pEPCiRLbPXdeSgAcyjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNOLSlVo; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNOLSlVo"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aec201b582so3025074e87.1
        for <linux-sound@vger.kernel.org>; Sun, 23 Aug 2026 07:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787494943; x=1788099743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LxUnTB7qoqswJZnIJ6oxAON0IR3zkHXMNyQNy7CGibg=;
        b=UNOLSlVo6UzMbcriMgOfKC3qzKIiWvgbOOlIbqpOl/ep8CfaTdhZJtR0/Hx/f5jEbb
         +FYqRU7S/pMl+4wdMMTAFHPguJho8BzuR0mFZ2n5WR9XmNK/p0/hrgMLaFKpoc2Iu5Ya
         xMrrn2F2198qysiu3B9wrSxEwV1ybquqvcES1WYIGq+dmbYmtDqeB/hMSJqi5thN7pLd
         VmssHg9fKPHf5sr7HiMyw1p3tlA0isWEcHP1nG53wl3H3lcBBMn+5zadVR4qgmVuD6ei
         Y7H96f2cSB5zczgXUEzGjUHr/RwSy0n+/jEygrdgGIy+MwmJqN3d0sks98cD7q2eEPxW
         luTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787494943; x=1788099743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LxUnTB7qoqswJZnIJ6oxAON0IR3zkHXMNyQNy7CGibg=;
        b=b+Tj6k45xsVmNGY4vYZNZYtofvYN7GvWDbaJ1pTt1kRFX1yCxhtZ+YPZkB6jiIrtir
         cODMjKUnxjWvjJN1teqUzQRY7sMvQfPgT7TL5n8d5iwv7eqrChjszuKJqlXVKdHLvsQX
         Gmzu1rt5+XO9pIWxaxZLNZ9AbOdK1VWC3cV12UNkTH4EqdmdkCxCYErkHX44/1BV7MLm
         9FnZ9KlTOlHC3fJoDJxh7NUAbz9+fPe7PXZ3xO+6qhRa288f49haYYfZD/Ggx2Ggwbj4
         f5VoNTqMwfTxQ2BOWlKM1XiQ9gNrAw0RdnOwXPuDp3+kjWtKlc6wF1CQiDxH5mtRsZxz
         /EDw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/gNF6rK5mctR+YMPZOakKOAMwj1ivgNvF3iAuVfZsFiKHJ2Qo12gDZ3Q1pXpFO2SlA1nOOnlwY/Tshw==@vger.kernel.org
X-Gm-Message-State: AFuF++nQYFcxKNad3fUsX/wd3xYmk48xLOF4x5Pwp8ucLInqwEMoKcUB
	FS3lfQkdcuQAJEb6epnMmfqpFn6ReqOEnVpBGcHIih+5BZ0hjqtvrNEV
X-Gm-Gg: AR+sD13pt3vIm9ikaPzM/XmUTVQpTqlkkK8P/t7tNgygF6yWzCtVNNn4N50eHnMiD2C
	3IiohF61v24kaMtc2HrpuXQrvNvQvpveu5oVXJUGD7lauLy8rwrkMMD+upTj2Y0amxpm2K58Dja
	58REpwHm/Cu+lx2xKabAxnykjxrC9wXMftlkfi/Fxmr9RMw/pYCSrgv0awo5c76Xs0JDBmYP20Z
	5xSHoMgzRp0d/l7x/bYKnBl7eg03NfzUHVGaQI2jbMlZTEbpoLPHDitQY5Bbh7BFU0SSa+I70qt
	DSYSyijkQLLT3YS71W1X1SXU5IaxwXn7TF8Ql7vOGc3xpyJqcnEfhEYlH2PNY3CpAs8/CjJE9PZ
	/lOgHYw5hcVhVZVQHBz7YHrSM235b3JcKb/4eE6gVnGqpLhyJL93PsJEWVx5s9b/i3w3ytPmHYY
	T8Cz28BvxM6UG1JK4+P2m3Gkm8xikIO+ucXKyyUC6pDFD1emvH+qC43vBsRqDCAt37YSaHTAEv+
	nMKU3duC6es5bBODB9UAwhGvTHFI5THE2hyMwkk77e1f2VUNTBGjuKG8T7uo2CIRhk195o=
X-Received: by 2002:a05:6512:2c8b:b0:5b2:e890:e69f with SMTP id 2adb3069b0e04-5b48b781ec3mr3111608e87.2.1787494943000;
        Sun, 23 Aug 2026 07:22:23 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b48cda2b73sm1006644e87.23.2026.08.23.07.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 07:22:21 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH v2 0/2] ALSA: usb-audio: the Topping M62's vendor controls
Date: Sun, 23 Aug 2026 19:22:14 +0500
Message-ID: <20260823142216.79704-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820151329.18332-1-mikhail.v.gavrilov@gmail.com>
References: <20260820151329.18332-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2, and the road is the mixer quirk. The HID driver is dropped from
this posting; it is in the RFC thread if anyone wants to argue for it.
The cost of this road is accepted knowingly: with the hid_ignore_list
entry there is no hidraw node, so a future Linux control application
would have no channel of its own to the card.

Changes since the RFC:

  - guard() and __free() as you asked. The spinlock is guard() where a
    whole function holds it and scoped_guard() elsewhere; one goto that
    would have jumped out of a guarded scope is gone, replaced by a
    flag, since the cleanup runs either way but the jump reads like a
    trap.

  - The OTG input's gain is in. It was the one gap the RFC cover letter
    named: it has no front panel control, so it never announced itself.
    A capture of the vendor application moving it names it target 0x27
    on the same taper family as Bluetooth, and the indices it dwelt on
    match the decibels it displayed.

  - The subscription is renewed every two seconds. It lapses: a
    listener that subscribed once got the meters and the identification
    block and then very little, while one that kept repeating got the
    gains too, about five seconds in. The vendor application does the
    same.

  - New in 2/2: the outputs' source selectors, as enumerated controls.

A correction to my own follow-up, which said the HID road leaves a
hidraw node open for a future vendor application while the quirk closes
it. Half of that is wrong: the HID driver as posted calls
hid_hw_start(hdev, 0), which creates no hidraw either. It would take
one word to fix there and cannot be fixed on this road at all, so the
comparison stands, but the archive should not carry a claim the code
did not support.

Which raises a form neither posting covered: snd-usb-audio could
register the hid_driver itself. usbhid stays the transport, so hidraw
survives and no hid_ignore_list entry is needed; the controls still
land on the card the device already has, because it is all one module
holding the mixer pointer; and the claim helper in card.c goes away.
The cost is that snd-usb-audio would depend on the HID core, and I find
no precedent for that direction -- the reverse exists, hid-prodikeys
registers a card of its own. The probe-order and disconnect questions
do not disappear, but they stay inside one module. I mention it rather
than implement it: you have picked a road, and I would rather ask
whether this is a better one than send a fourth variant unasked.

About 2/2 and one thing in it I am not comfortable with. Each output
listens to one source chosen inside the card -- a mix, an input, or one
playback bus straight from USB -- and the device NEVER reports that
choice. Not to this driver, and not to the vendor's own application,
which pushes its whole workspace on connect rather than reading
anything. So the control can be written but not read, and the item list
starts with "Unknown", which is what it shows until a hand has chosen;
selecting it is refused. If there is a convention for this that I have
missed, I would rather use it.

Both patches are on mainline 98f21c54f995 and have been exercised on
the hardware: values arrive by themselves after probe, a front panel
knob still reaches the driver ten minutes later, and a write reaches
the analogue stage -- recording one source at gain 30 and at gain 60
differs by 29.7 dB against the 30.0 dB the taper table predicts, which
also confirms the decoded scale. For 2/2, the audible test: point an
output away from the bus being played and it goes silent, point it back
and the sound returns. Tested on a KASAN and lockdep kernel, including
unplug while a stream was running; no reports.

Mikhail Gavrilov (2):
  ALSA: usb-audio: expose the Topping M62's analogue gains as mixer
    controls
  ALSA: usb-audio: let the M62's outputs say what they listen to

 MAINTAINERS               |   6 +
 drivers/hid/hid-ids.h     |   3 +
 drivers/hid/hid-quirks.c  |   2 +
 sound/usb/Makefile        |   1 +
 sound/usb/card.c          |  14 +
 sound/usb/mixer_quirks.c  |   5 +
 sound/usb/mixer_topping.c | 636 ++++++++++++++++++++++++++++++++++++++
 sound/usb/mixer_topping.h |   7 +
 sound/usb/usbaudio.h      |   3 +
 9 files changed, 677 insertions(+)
 create mode 100644 sound/usb/mixer_topping.c
 create mode 100644 sound/usb/mixer_topping.h


base-commit: 2709dd5ae32f0828f386327c76bba9f39f63a1c6
-- 
2.55.0

