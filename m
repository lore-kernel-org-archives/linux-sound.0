Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B2A38D407
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 20:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787602422; cv=none; b=i3ghBY0l/3T4zIv96WbKmQFYsM9OaeZ5lkhJHU8as5fEp9D+a1EtuUaQ1+mAUkAYbAIFN1xqHvrDQSfom1LO2aUxduGMnvAlfC/a1A9fATwpagl/4FAkAO/KoU7xW+8dWPi/fBCOrCtRJeOk5pk7k/Xtda5WU5lFwRZKy6INWZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787602422; c=relaxed/simple;
	bh=ZQ+RojUE9Abzm5WW0MAEQF+3be/n/8dUAUHXvOVL+tQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LvAkJbJI18+pxQkSTEZaLUPjiG/vev3F8GZ94LYTUPtiAVj+/5TddaHGir8lUgYMSZnFVqRXpaWY/uMbwF0/AFLeAul3ylqPDq+CZjFJjmpQrGibZIQ37OWdxGWoz965You1eMVdHAj/StjRi4zRQwXqCW2dE51haaSpVABS19s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/AtGW31; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/AtGW31"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b0148201fbso3669228e87.3
        for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 13:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787602419; x=1788207219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gwhgPmF85yfiYARA5MOlhptrJ5ijrLoS8y7nOa4/Mzs=;
        b=b/AtGW31zbBycT2983uJeSNoKIyVPq2kDqrsFrmABODPxC5Tj3cZcU5ZvsZiTrxdmE
         1ZIJzFl6Bbk2uUvoNKVwzx/AJYTHRJntJa84krossxIzUzdwEQ910f0VqRTwEHVP3sa/
         3cX6J8XPl1hOo5buAP6GKvrUrMUndnLDyueOdrbtId84+dnknfAKHODno4cK7g07j7yS
         ONnQNAXUz9ZEDO7riC/VuNH7o0YYsu91nq67/OiOKxSxxW2q+UKRVeXrz8n4zr8k19H2
         dV2Fbai9Yw6D9iviDsDnDxF/Yt9cGpez0PHOIdBibh6ZAt/ReO6vfSPsQv+mk4z3QqeP
         4UDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787602419; x=1788207219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gwhgPmF85yfiYARA5MOlhptrJ5ijrLoS8y7nOa4/Mzs=;
        b=Ak3sePQQ4QGvIkDZ25md1afzJCqmZ9Qua5XDq7x/NIX5hkHQYnyfajtSSsHKExj6mN
         SN1bG+o49EHMWqXYfFOGjujh4K+Qj87niRsS2ew7LzSlcE3Qdjy4f0LnQVCjr73+pkXK
         oBxaU38gNVwX543jHmESMP4cz4zpKaTern1zLwM/oC6TmCUIeyLJ6tXy6QKeUkvaXtAf
         shOPksmrl1n3scavDX9+8YCmg+BzOGi33aordxgbHrS3QjgSRcJ6lnjBIaxMCqkfYf7W
         dm//9xjsChYEvB3Hcmj1fDi/2i+HsU5NV0uk8LpfCQ/jkMRzscEIRd9DvqZruvPPo3g5
         9lmA==
X-Forwarded-Encrypted: i=1; AHgh+RqhjCG0dkX01XMJpzaeQH2RChXNcuZDetgpciOfs51DIU7MAhaKIJJc+PRfxcMAHLObuGoYr3XPkZeI4w==@vger.kernel.org
X-Gm-Message-State: AFuF++lr4RHLHzxRBJl5yO/k7Yu7xZD7y19qEaJsolrH7/w/hmlsBdUT
	pLylaqNwolGN4EbBz3YZu7g2fNFLoH1NenR+fOXhRZhU2BOiG99sEKtf
X-Gm-Gg: AR+sD12ZQi/2Rw3Mf2EJYKDR/QmhbHmDpIUmO0mjzDc8bHSO5LPOHwsuMn4ijw9gM1s
	rNKdj0AO46Cl5jVuFCc0VGskxlxrYYVJ7cA92oErp1DHKCQYQ/L1fbQz4Dm1fopyoAyZfVHVv0Q
	nP7djQVi/dnuI8Tkr6WokbwlqVqFwP75LH6PHZdzyVrScr4qCD2TcfrnC6kkS0qxef6Cd8tEG4t
	2Mf42EkO+nm1lvFtc7885rQrM5pcAimgHv8CV8pkw0ikThOFsF9mcXMd3w4IOGLxHAVJAfAqbQT
	HEeacKZgMe58tu/cPSujdW+V0QXGUoYmn7WxJLDlnvsCxOqKtacNmmwebOBdTtq9cVHRoAh01rZ
	BPT4U83LT6PiTN8iwaAxjlCemyBhbG7oEJrET7RFZBgiAGr0ZNOy5c2gEkrdbS46LOgIJsHaOTK
	lfZRRsClpTcBGL0emNJC+AarNnPztWmPNkx5nMxpKuwr1BXUQspuvUVrrIn4I+6+3+CNZq5RU09
	9eWm/+PpPThIp1u75PfC4tuUSpI4u5Ra4ESvfIBOd7gF/QDbfGnk4ZfaKMF
X-Received: by 2002:a05:6512:2308:b0:5b0:17e7:67cb with SMTP id 2adb3069b0e04-5b49cdbd7ddmr324772e87.17.1787602418163;
        Mon, 24 Aug 2026 13:13:38 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b48cdfbddasm1942355e87.51.2026.08.24.13.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:13:36 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH v5 0/2] ALSA: usb-audio: the Topping M62's vendor controls
Date: Tue, 25 Aug 2026 01:13:29 +0500
Message-ID: <20260824201331.304705-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260823222946.171345-1-mikhail.v.gavrilov@gmail.com>
References: <20260823222946.171345-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v5 takes three more points from the automated review, all in 1/2, and
declines two that are a repeat of v3's.

Taken:

  - Allocation on the resume path now asks for no I/O. topping_send()
    is reached from topping_resume(), where reclaim can wait on a block
    device that has not woken yet, and the URB submitted there wanted
    the same treatment. This is what snd_usb_mixer_activate() does a
    few hundred lines away in mixer.c, so it is the file's own habit
    rather than a novelty.

  - A resubmit that fails with -EPERM is no longer reported. That is a
    URB usb_kill_urb() has already refused, which is the ordinary sound
    of an unplug rather than a fault. The line has been wrong since v1;
    nobody noticed until now.

Declined, with the same reasoning the v4 cover letter gave, since the
finding came back unchanged: a control callback cannot dereference a
freed private structure during disconnect. snd_ctl_elem_read() and
snd_ctl_elem_write() take snd_power_ref_and_wait(card) around the
callback; snd_card_disconnect() ends with snd_power_sync_ref(card),
which waits until every such reference is dropped; and in usb-audio's
disconnect, snd_card_disconnect() runs before
usb_audio_disconnect_components() reaches snd_usb_mixer_disconnect()
and hence this driver's private_free(). No callback can be inside the
driver when the structure is freed, and none can enter afterwards --
snd_power_ref_and_wait() sees card->shutdown and returns -ENODEV.

Nothing else changed since v4. 2/2 is unchanged. The questions from the
v2 cover letter still stand: whether snd-usb-audio registering the
hid_driver itself would be a better shape than either road posted, and
whether there is a convention for a control that can be written but not
read.

Tested on the hardware as before, including a suspend and resume cycle
and unbind and bind again, on a KASAN and lockdep kernel; no reports.

Mikhail Gavrilov (2):
  ALSA: usb-audio: expose the Topping M62's analogue gains as mixer
    controls
  ALSA: usb-audio: let the M62's outputs say what they listen to

 MAINTAINERS               |   6 +
 drivers/hid/hid-ids.h     |   3 +
 drivers/hid/hid-quirks.c  |   2 +
 sound/usb/Makefile        |   1 +
 sound/usb/card.c          |  19 +
 sound/usb/mixer_quirks.c  |   5 +
 sound/usb/mixer_topping.c | 744 ++++++++++++++++++++++++++++++++++++++
 sound/usb/mixer_topping.h |   7 +
 sound/usb/usbaudio.h      |   4 +
 9 files changed, 791 insertions(+)
 create mode 100644 sound/usb/mixer_topping.c
 create mode 100644 sound/usb/mixer_topping.h


base-commit: 2709dd5ae32f0828f386327c76bba9f39f63a1c6
-- 
2.55.0

