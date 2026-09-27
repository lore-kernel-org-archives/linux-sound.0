Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFC91DDFE
	for <linux-sound@vger.kernel.org>; Sun, 27 Sep 2026 00:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790469396; cv=none; b=sZcWPvrWvpFZtXd+ajXFuP4gPqL2W77Ri0oK8+r7FcW5InPe6bkUnDhwNhhRGAYNVkPN286/9JemgvnO5m6P3qNmqroXheUwQSAHxN0By4hWAyil7e38kgUCXcZF1hQk8R0bqWl/RVzsCvhnlYAJbi2VgG68DUCtDwYo+veIaGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790469396; c=relaxed/simple;
	bh=jRWyEZeqiuCNOWNEsmNMY3M4EGe/+fpLa3LSJ6n13Cs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lYvyZYW8t6wrRkwqLva9zWQe/Cal3Vgmq4Yrt7J8P2G9Q7YTclRqe9GpqSvhdq5H9txXKvmO+eYn7DOqybOoCemBNA9Y7jA/Q8Vg6ESAXYshlnbjWaW+ug6dfrRhEu41CQJZd2UNh/1tKQuTTYWcvAShJWBUKqWvEZo8S89rMbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSPSt8G+; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSPSt8G+"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8e986b8b1so1724293e87.3
        for <linux-sound@vger.kernel.org>; Sat, 26 Sep 2026 17:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790469393; x=1791074193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0FcPchbcZ1AV4Xuk3NQ/0KOtqZwFOWxomTJHkiqEFaU=;
        b=QSPSt8G+gVQMASWYzN1EnGsX7ERzZoxsd0q8j1zYL3oLaUd6KYiZkwJAM9r1uKxJTJ
         b/Z3lEri14jHhPss0ZEDzNMajO5X5GwJZeK0c5ecMjgDwtelJGpMgWyDzZi9T8znRkcm
         b9Ylnl7J0+ne8C6vdPtHUpE24VJQhcHB43eyKL41IY8+HtfodzcBbwJeCDnpyf+6dRZ8
         fDvFn6RHyFs8yly3yGz7X/IHKY7X1JIfxFrF5MU9510V5vcQkFiIlh3zJWeYUcEmigJD
         Uzezzu7Hx6s4IjLiGu+sx02qIwfK1khK97ozpCzx2arJP1KwoRRRGcn4umbFIFq4jyK0
         edoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790469393; x=1791074193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0FcPchbcZ1AV4Xuk3NQ/0KOtqZwFOWxomTJHkiqEFaU=;
        b=kyQvcv4fTvq7e9zcZc+sIHJn8PCPkX6hLgIfelTbeoqPDhCJyZwoMK0PZYr2vdly9T
         q2pBOmgvlZqxYE1evVqPK2/4IRBPxKTOb1pZR9auxlCyHZ1BV5f69PkHt/fT53JBp7+D
         Wzdmt8MrouGzsbpQbDBLOw0LnKElXmAGaBAiMhniU9YAUiENdVzL0taVHsDA1B1LGo2j
         BqIkSzbBWqdJ+T8iZTIyPSnlUf0HwvWleC/0iexw3Cxg080/gTdJy0h94UHnuElxXJ/r
         DP6IJMPMrCkFyLDJOoBtJQslE4iIJbU/dFg7Ze2U9EpHP0N8zsMoKDeL5Wty6YeNdl7l
         V6kg==
X-Gm-Message-State: AFq9FYJ6WI20b6Rk1T8keUi3QRXUJmhs6bx0cxpy9g3RfgcDdvGm7VTB
	n26E/9nYBOcJTFklwOmZmXfyURWMtyuUXI9z+gGCkFnJ6NvSVfV0aB7H
X-Gm-Gg: AYBFou3MrcBbSAkxFRdAQUMIh6ufqhq/FHMDLmN7vDNIotRKRrzLPbmsCEKHZq/JJjw
	O+iPzz4YF7CIJuVGrpVFH1OQWVAgP7lqDZ+mX+/u14ygt2Lca/ZSN9iIOQjvFonIJwiRe/4Et0w
	YhjFbe0e9gv6HjXQTqL8711Zd9FsQfQHj8L/eZWT9a0MDXfGM6Pq17KaHSWXJSGLskOFjCecdzC
	MtMUZ4UaO8VNmb0t/C/fIkvXr4vSsxz0GWM15rmG01cV44A78wttgI6gmaNjUrnZX2mMAPx/VO5
	6Xy2GMZn1hHsfmTt9inOT1IMyz0puPNnHE8pFP1n+oS909qWSbzMLr2ZvN04ggMWdHBcvCKK7mp
	SAvypSCUFn+IV9MUfwUCHb/U4phxvdNT1PGS/GTAYn7eKyE3xzUSJUttr5gguJ/CbdrcNdQZFcS
	KdBS48k834d3Q9/h3K04uBz+AyS5MqFFQhPYvWeU/IGAovI909KZptbT1eKp26K0MYrk7Fez+4+
	OWXkIt3nD3aEN4V3v4Yj/+ujYYmh8za
X-Received: by 2002:a05:6512:340d:b0:5b8:f127:3477 with SMTP id 2adb3069b0e04-5b8f12736cdmr924006e87.46.1790469393091;
        Sat, 26 Sep 2026 17:36:33 -0700 (PDT)
Received: from Shigure.lan (n30b00u6luibwsaibf2-1.v6.elisa-mobile.fi. [2001:999:2c9:b0::44e])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6a8bdf3sm1572795e87.8.2026.09.26.17.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:36:32 -0700 (PDT)
From: Niko Huuskonen <niko.huuskonen.00@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Daniel Mack <zonque@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Niko Huuskonen <niko.huuskonen.00@gmail.com>
Subject: [PATCH 0/4] ALSA: caiaq: Kore controller fixes and LCD support
Date: Sun, 27 Sep 2026 03:35:28 +0300
Message-ID: <20260927003532.289468-1-niko.huuskonen.00@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Native Instruments Kore controllers (USB 17cc:4711 and 17cc:4712)
work with snd-usb-caiaq, but a few things are wrong or missing:

- The EP1 command buffer is shared by all senders without locking.
  Patch 1 adds a mutex. It is needed by patch 4, which adds a sender.

- Parts of the Kore key map do not match the hardware: softkeys 5-8
  come in reverse order, and on the first Kore the knob touch sensors
  are scrambled. Patch 2 fixes the map.

- The 128x64 LCD is not supported, and userspace cannot reach it while
  the driver is bound. Patch 3 adds a hwdep interface ID, and patch 4
  exposes the LCD as a hwdep device that takes whole frames, plus an
  "LCD Contrast" control. The display protocol comes from USB captures
  of the vendor software that the OpenKoreBridge project published.

Patch 2 changes the key codes userspace sees for softkeys 5-8 on both
controllers, and for the touch sensors on the first Kore. Userspace
that compensates for the old map, such as the OpenKoreBridge controller
script, would have to follow. Userspace can read the map with
EVIOCGKEYCODE to support kernels with and without the change. If
changing the codes is a concern, patch 2 can be dropped; the rest of
the series does not depend on it.

Testing: the series was tested on a Kore controller (17cc:4711), applied
to v7.2.6 and built out of tree, with a userspace MIDI bridge that uses
the LCD, the LEDs and all controls. Every patch builds with W=1, and
checkpatch.pl --strict only asks whether MAINTAINERS needs updating for
the new file, which the existing sound/usb/caiaq/ entry already covers.
The locking problem in patch 1 was found by code review and has not
been reproduced. A Kore 2 was not available for testing.

Tool use: the patches were written with an AI coding assistant (Claude,
an LLM), as the Assisted-by tags say. It worked in an interactive
session in which I asked it to make the Kore controller usable as a MIDI
controller on Linux, to find out how its LCD is driven, to fix the
button mapping I reported from testing the hardware, and to prepare the
kernel changes for submission. It found the missing locking by code
review, derived the key map from my tests on the controller, checked the
LCD protocol on the device over raw USB, and tested each change on my
controller.

Niko Huuskonen (4):
  ALSA: caiaq: Serialize access to the EP1 command buffer
  ALSA: caiaq: Fix the Kore controller key map
  ALSA: uapi: Add hwdep interface ID for caiaq devices
  ALSA: caiaq: Add LCD support for the Kore controllers

 include/uapi/sound/asound.h |   3 +-
 sound/usb/caiaq/Makefile    |   2 +-
 sound/usb/caiaq/device.c    |  12 ++
 sound/usb/caiaq/device.h    |  13 ++
 sound/usb/caiaq/input.c     |  29 +++-
 sound/usb/caiaq/lcd.c       | 258 ++++++++++++++++++++++++++++++++++++
 sound/usb/caiaq/lcd.h       |   7 +
 7 files changed, 318 insertions(+), 6 deletions(-)
 create mode 100644 sound/usb/caiaq/lcd.c
 create mode 100644 sound/usb/caiaq/lcd.h


base-commit: 4d4bc656580bcc448f8e6d6b3b3a903120eb29bb
-- 
2.55.0

