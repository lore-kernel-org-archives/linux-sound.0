Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436E9376468
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 22:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787610677; cv=none; b=beDjlAANT4kv8nudYkRZk8SNG43HAf99bkc6xMM5b0rcoqyBWP5BVxBTEtQCtJz2CZMhPHhqPy1i1eFqDqvzH+ebwl+OKsILqRCMrNxGtx66T5sKR4QIcHJ+iAd2vYUWob+qGWWbSNN4bRS2HwJZXJRP2FQxixaPFpj04iqn2Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787610677; c=relaxed/simple;
	bh=fbqTyJtokcTuL6vour0lyvrCwOvMVDEYtANX0WfYTts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y8iX1fUphmhQeRIAz++xRdbjM/YY/qxmzU8Ce11C7oC2B+1D+IkZNR8P46mbJNj6VTmxJdJe2ABnww2CYCL648j/kwY7j4Tf4yiSOcxxnV8EldrNuHzzSV+HQ5k6FwA9/t8AiE/w73o5wncLGTs+LjxhVowliMVxvpMDw7BN+dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVKtBlUT; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVKtBlUT"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c94fccf3eso35565001fa.0
        for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 15:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787610673; x=1788215473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ksjvPid7ngi7/w1htcfzCr0/e0S+8XeUcdpnrZtWQ2g=;
        b=VVKtBlUT+CfAXpAnc4XYU4QM0ATB80xf/DdJmLe3eDrCv9L4mqQqupDlAw8wVf6u/R
         UJul3L1lM7dEBJzuSBcUjzybJikz36XNyndoXB07+63N6kSyv0MqgXj5KsuHogPT9xn/
         o3Bj3w0q90XZH5qujAYSjbdMaaGqx/YJgK/hhpCcOqLAU5Ki7uYNdcESl97STfcBzL+H
         bAZZUIb7WgVWbmDrtXBbJaVL6gxuAbNX5uvkdLTW8LpKCK6miDuvmBjNSj3bnJOlRqZP
         WyXYC3SFVT3ndc7VGjuaPtXtFU96dX0IY3Jxzu5nrdObza6DvMoa2XwBaMZGmgBmmTvs
         YHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787610673; x=1788215473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ksjvPid7ngi7/w1htcfzCr0/e0S+8XeUcdpnrZtWQ2g=;
        b=WTdB+NeSaxp++G0bIbZ2EBK2fXqO01wzJ1SzzhPlfmV+b3RWFZ7KTHgInXkLK7+E0k
         X8l14sdhMLHze/QHeqpxfeCOvE2muJ5r3S8eHJkvlhVHVRWJ7fNkLthD4XL2YdSRROQV
         DiFphxUncoSAxoTH7d920M2cou2MReCbd3FWKT4mLEIoeX5N0ZZDAQj2uF3xP58El24H
         xALvXlAcMgSDMKfUq5vQw9JvMmKIRlysLBd6eJJBvrK7QPlJ4hnGddpuS/Aq6cfYTcfC
         w28OCdFlTMhdHcfZGsBbSAtzvcgXzQ39dI/yzR+25VXBfWFbsy/J+MPBiSW5IBIXQK58
         19sw==
X-Forwarded-Encrypted: i=1; AHgh+RraAkxfxD/WwyGjbsoMAqKrg3xOvtTcDx2OMV2gsOneLlQ2Ri2WIibojfNZLkp4+DLduhmvAVVjlkZrKg==@vger.kernel.org
X-Gm-Message-State: AFuF++lITC5HUN6wHaMwZr8n6Rml6NmXjAOy1DsScfWGGl0fAfmaX/R+
	slRS8QWeGeHeV/cvJ0kmDoSxNzf2wVY6DzqBfgZmVNP9mkZ1j29qmvy/
X-Gm-Gg: AR+sD13IxTFLRdvL+wbAd+Mz6a4UrQBpVXsHPf/BDq8ipLLhfUsXnXWsGA6UMgVvzks
	6soYhYwMLRRS9xhZApbeR9pH78B8mQxAfuCVSf9vU+TCk+w0FoJICGUsxM4GsYC3jfanOcq4zsl
	yuM1JSlb/OhxAGHwgQUB01eCqWPE5yRrcbEUWJIg59MBX9S7vee0gZgJyaPbxuJjnhGrUTRom2Y
	S94W5aFdWOehIaHNNBzBaGnyT5zWmujLNCt4QIvyQ8dnAjftkMkIy+ECjacqtzRKl7BX1/4t9+q
	rVHkxc6+HjJXbWgmkWrgQDr9x56obE9RR4W4R5qDOaLEYkN2ihLsJQsAdbXufddpezurapvIbf6
	UY+JdS0LiBp3IgeuzRBNbGVK2okTBF6GQVG5sK9D6ZFFG5iQrNpniABcq/n/Veex0AbChXSDLe9
	qNOYGgEHTcarwdiOR0V/sfSC73UEwp/oYZQ+HzIH5FKdqeqkOpyK0pRPvAuYlrfvZz5gXoySMPd
	FfalUspz/2DBRGXaO95/PJo0SkXDmWAaSbFc/Cw7yn6IvygV3n2jGH54jgp
X-Received: by 2002:a05:6512:108c:b0:5b0:eda:de26 with SMTP id 2adb3069b0e04-5b48b89fd8dmr5814697e87.16.1787610672929;
        Mon, 24 Aug 2026 15:31:12 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b48cdfdc49sm2073351e87.41.2026.08.24.15.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 15:31:11 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH v6 0/2] ALSA: usb-audio: the Topping M62's vendor controls
Date: Tue, 25 Aug 2026 03:31:05 +0500
Message-ID: <20260824223107.406504-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260824201331.304705-1-mikhail.v.gavrilov@gmail.com>
References: <20260824201331.304705-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v6 takes four more points from the automated review and declines two.
The first of the four is a deadlock, and it is worth saying how it got
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
 sound/usb/Makefile        |   1 +
 sound/usb/card.c          |  19 +
 sound/usb/mixer_quirks.c  |   5 +
 sound/usb/mixer_topping.c | 794 ++++++++++++++++++++++++++++++++++++++
 sound/usb/mixer_topping.h |   7 +
 sound/usb/usbaudio.h      |   4 +
 9 files changed, 841 insertions(+)
 create mode 100644 sound/usb/mixer_topping.c
 create mode 100644 sound/usb/mixer_topping.h


base-commit: 47096fc3d064a07c0842f748b99ebf01be120f2b
-- 
2.55.0

