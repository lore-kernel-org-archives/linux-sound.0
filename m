Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8567740FDA1
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 13:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777557193; cv=none; b=b78DEBh3FSgFouhgU85W5GG/8EzxqRb0Wxjz4pXhmmnTlg3l1a/622c14NxkYRpTZlLlmaIOfNOtZAd7gZanAw5AL2IoW13jdbwtDGBR+OTighXWhqY4XoWT8GiQJI6MfVDAKI+aqglJVy6EXgedFNNJ4X//5iRWdwbsAZuvkz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777557193; c=relaxed/simple;
	bh=MPfDizBH7aocjPVeSDjuEbWJd94TF82mwI/e3iYO9JM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W4KKxaYj+3y/FgqtLo8c6dVnXw9BdgOYTbV1LJaip/6efktM+Xjmw/D5dz+aBh4RxxWx7K1Bk4KcDme6bAJ7Um337d1u6TShP4Ns4STQsKf7eBeMF1U0QBxMne2PylV23NXP4cWibxNILA3FJu8GVfvuOxBWG2Bd2TIIWlFrswQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=XZB+jin8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="XZB+jin8"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so9737155e9.2
        for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 06:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777557187; x=1778161987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3uXfI6s6jlopqht6FoMpwoEwymk7j/uUyLRGL6X0LQI=;
        b=XZB+jin8ASGBh/e9yUdZv1gnjIxSGkcbPkTBxp+rDvx1mPkEjrlXlywEuKfHA11bI6
         hqwcUb51Bzq9Rb48pX4OaXoV4jVSVdalAsOkmHRsmgC2y3ZBtmfFF89tThD5N4fKoCE3
         K4c+DmfNwaoXXV8mfWS+85RSvVv7SgFGy5Yi+izuUbFWxmtYYg1wFPPc8mpM3n4Mo30F
         HuKobh++9d9XRG50rjQgdMXqnXk7QGZxFYyAejL4lGWAgKKUyvZFzCf8R6BjLxk9fzyD
         bIC63pAyHxQ3ILPmBCrGOGoTMd6P6NO9PvqiT5E8oInrfKa+e94DwfN1MAiNw8BqLMq+
         UYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777557187; x=1778161987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uXfI6s6jlopqht6FoMpwoEwymk7j/uUyLRGL6X0LQI=;
        b=joS8EM0+Tuh8XDzVUOGvOvdTG+eKlnRBB4zadAycmHHqIdH8Rys8gwd6Uv3rJliWI/
         HGf9Z4VrKXV/lhP+RnIIga4bPNjMhYwez4DP3q6d6jBy+gKzjajhtLVd8ojX4qlf1ojv
         goAjMVGK+7CkYPiFdv512Y8OKg8AwZoCvoQAua4qokQR5fDxjAP0KIsGaXDIvU6VBkNE
         98Stf+B6cj18EAfEiNB0mjexoRdt2GaymRXIpiprjoP78uLEQDdy+lSv10S7olibmmUt
         /TGomTYjLfMhh3XGJ/noUmnTepp0XOPcBp6r2QgO2C5ZFoNQ0whkB+bQJyQtPhpW9zxb
         VmAw==
X-Forwarded-Encrypted: i=1; AFNElJ8SLoejESEEeuBrjuIjNv4Z/znPhHZP5NKIlUMZ/9HHhBLfMdS80KLWqtOHw2qIQEg5fRx/MHCkUutQ+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyZuwfCSYgVIPfzT1dFCtKLD+MmWWsajZ+cQqT2keka9P6HIit
	QB5EZ59+AHxTLa2OhlhSh0oluuPQea+G4ov/+nZljX0yeyw0lGlZmBfyZanA76zkDCg=
X-Gm-Gg: AeBDietS9mcVajTDxo2sa+wExqoB398A9ovM7QzUCYTv4u5ieTiiuZ1GKPpRU3Az0aK
	Ut/vPvaTQji1aWpmfQIrLH4S0ntNZ4u0wUldLlx4/vcwHY406wUXoBy/VuOAdoytGHYp5HJaWzI
	wDLFjKe04R785BwaC+q1IvdDELHt+1ufOrSsPSmVMQXYwaOZVU8/IPoqjP8RDmWyedBcyiwtC+H
	UOaPaoYclp39AvPMCtCHfk0rIrAYp5A5hTUuixRRAFm1228//KFhu1sXdFJ38/Z3kfNS8XQpvWV
	7CjmvKW+ME2f9ez0TBPsO9gJv+a8snDOzOq4Ga0r5FiDWcv4eQ31wkCNAaFFLDmvGTWYy5a0tLF
	zBRcmw7jdVnqIay6nQalWvN3c5dNN84yXK++0fzup0RfKkDA2vmq4sKyaXxmqJLxyScHo2u+3sY
	JlvEaFtbIPC+X+Jzh2IVsU2778/FdpcVFLjVLXh4Ha88Ic5xIXywBq3yZ0C3bpX7KwdIoMgYaUQ
	K1CIBwmMHFtN4EN68S+0moLfg==
X-Received: by 2002:a05:600c:c4a5:b0:483:2c98:4368 with SMTP id 5b1f17b1804b1-48a84467651mr50297675e9.18.1777557186416;
        Thu, 30 Apr 2026 06:53:06 -0700 (PDT)
Received: from localhost (p200300f65f114e0859f76ff87a50eb14.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:59f7:6ff8:7a50:eb14])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48a7b8c2dd7sm91436475e9.0.2026.04.30.06.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 06:53:05 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Kees Cook <kees@kernel.org>,
	=?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>,
	Jihed Chaibi <jihed.chaibi.dev@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Chandra Mohan Sundar <chandramohan.explore@gmail.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Wentao Liang <vulab@iscas.ac.cn>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	tanze <tanze@kylinos.cn>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH] ALSA: Consistently define pci_device_ids using named initializers
Date: Thu, 30 Apr 2026 15:52:53 +0200
Message-ID: <20260430135255.279393-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=54031; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=MPfDizBH7aocjPVeSDjuEbWJd94TF82mwI/e3iYO9JM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBp8163Q/b1fDaK1LsvwIu9qd06CSp+PgGTyUEr1 d7OKIbDY1OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCafNetwAKCRCPgPtYfRL+ TgZvCACv02oLNeVIrxfFEaKghT2NiXWru40atzvgYZaPzBTNT/w68RJkp1nnitCEXvYXJjbj9We 72qbjVm/b1vm8iSH6VpcQ5DDgnEJWQnfMMsU2lC5rZnZxgfycmmW5Xwxnl6cCz3FbBaKBFP6cD7 6vkqSM+ZEqJkdzijblCLQZJE+TFBhE0wCiXPlIFYENpAWhZoUS5F+NBGezcD/yZbEssJl6H6PYl 3a66acdaTZPo6sTX04HwMJylhXVFHw11pw09NsEIkrTc+Pyu6KLdGY8A6cLAQnTNPIIpqayMokD sKDuFsPYDlnrkJhhpFY9bFJcqq3AWocTdx4MvUdz5+xJvLMK
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

... and PCI device helpers.

The various struct pci_device_id arrays were initialized mostly by list
expressions, some of them using the PCI_DEVICE macros. This isn't easily
readable if you're not into PCI. Using named initializers is more
explicit and thus easier to parse. Also use PCI_DEVICE* helper macros to
assign .vendor, .device, .subvendor and .subdevice where appropriate and
skip explicit assignments of 0 (which the compiler takes care of).

The secret plan is to make struct pci_device_id::driver_data an
anonymous union (similar to
https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@baylibre.com/)
and that requires named initializers. But it's also a nice cleanup on
its own.

This change doesn't introduce changes to the compiled pci_device_id
array. Tested on x86 and arm64.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

the mentioned follow-up quest allows to do

 		PCI_DEVICE_SUB(HPI_PCI_VENDOR_ID_TI, HPI_PCI_DEV_ID_DSP6205,
 			       HPI_PCI_VENDOR_ID_AUDIOSCIENCE, PCI_ANY_ID),
-		.driver_data = (kernel_ulong_t)HPI_6205,
+		.driver_data_ptr = HPI_6205,

which gets rid of a bunch of casts and so brings a little bit more type
safety. This patch is a preparation for that.

I assume a single patch for all of sound is fine. If not please instruct how I
should split the patch. (per driver?)

Best regards
Uwe

 sound/hda/core/i915.c           |  30 ++++----
 sound/pci/ali5451/ali5451.c     |   4 +-
 sound/pci/als300.c              |   6 +-
 sound/pci/als4000.c             |   4 +-
 sound/pci/asihpi/asihpi.c       |  17 +++--
 sound/pci/asihpi/hpipcida.h     |  18 ++---
 sound/pci/atiixp.c              |  10 +--
 sound/pci/atiixp_modem.c        |   6 +-
 sound/pci/au88x0/au8810.c       |   4 +-
 sound/pci/au88x0/au8820.c       |   4 +-
 sound/pci/au88x0/au8830.c       |   4 +-
 sound/pci/aw2/aw2-alsa.c        |   5 +-
 sound/pci/azt3328.c             |   6 +-
 sound/pci/ca0106/ca0106_main.c  |   4 +-
 sound/pci/cmipci.c              |  12 ++--
 sound/pci/cs4281.c              |   4 +-
 sound/pci/cs46xx/cs46xx.c       |   8 +--
 sound/pci/echoaudio/darla20.c   |   4 +-
 sound/pci/echoaudio/darla24.c   |   6 +-
 sound/pci/echoaudio/echo3g.c    |   4 +-
 sound/pci/echoaudio/gina20.c    |   4 +-
 sound/pci/echoaudio/gina24.c    |  10 +--
 sound/pci/echoaudio/indigo.c    |   4 +-
 sound/pci/echoaudio/indigodj.c  |   4 +-
 sound/pci/echoaudio/indigodjx.c |   4 +-
 sound/pci/echoaudio/indigoio.c  |   4 +-
 sound/pci/echoaudio/indigoiox.c |   4 +-
 sound/pci/echoaudio/layla20.c   |   6 +-
 sound/pci/echoaudio/layla24.c   |   4 +-
 sound/pci/echoaudio/mia.c       |   6 +-
 sound/pci/echoaudio/mona.c      |  20 ++++--
 sound/pci/emu10k1/emu10k1.c     |   8 +--
 sound/pci/emu10k1/emu10k1x.c    |   4 +-
 sound/pci/ens1370.c             |  10 +--
 sound/pci/es1938.c              |   4 +-
 sound/pci/es1968.c              |  27 ++++++--
 sound/pci/fm801.c               |  15 +++-
 sound/pci/ice1712/ice1712.c     |   4 +-
 sound/pci/ice1712/ice1724.c     |   4 +-
 sound/pci/intel8x0.c            | 118 +++++++++++++++++++++++++-------
 sound/pci/intel8x0m.c           |  88 +++++++++++++++++++-----
 sound/pci/maestro3.c            |  51 +++++++++-----
 sound/pci/mixart/mixart.c       |   4 +-
 sound/pci/nm256/nm256.c         |   8 +--
 sound/pci/pcxhr/pcxhr.c         |  70 +++++++++----------
 sound/pci/rme32.c               |   8 +--
 sound/pci/rme96.c               |  10 +--
 sound/pci/sonicvibes.c          |   4 +-
 sound/pci/trident/trident.c     |  16 +++--
 sound/pci/via82xx.c             |   6 +-
 sound/pci/via82xx_modem.c       |   4 +-
 sound/pci/vx222/vx222.c         |   6 +-
 sound/pci/ymfpci/ymfpci.c       |  14 ++--
 53 files changed, 443 insertions(+), 270 deletions(-)

diff --git a/sound/hda/core/i915.c b/sound/hda/core/i915.c
index 44438c799f95..6c068b135b7d 100644
--- a/sound/hda/core/i915.c
+++ b/sound/hda/core/i915.c
@@ -130,22 +130,22 @@ static int i915_gfx_present(struct pci_dev *hdac_pci)
 	/* List of known platforms with no i915 support. */
 	static const struct pci_device_id denylist[] = {
 		/* CNL */
-		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a40), 0x030000, 0xff0000 },
-		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a41), 0x030000, 0xff0000 },
-		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a42), 0x030000, 0xff0000 },
-		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a44), 0x030000, 0xff0000 },
-		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a49), 0x030000, 0xff0000 },
-		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a4a), 0x030000, 0xff0000 },
-		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a4c), 0x030000, 0xff0000 },
-		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a50), 0x030000, 0xff0000 },
-		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a51), 0x030000, 0xff0000 },
-		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a52), 0x030000, 0xff0000 },
-		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a54), 0x030000, 0xff0000 },
-		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a59), 0x030000, 0xff0000 },
-		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a5a), 0x030000, 0xff0000 },
-		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a5c), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a40), .class = 0x030000, .class_mask = 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a41), .class = 0x030000, .class_mask = 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a42), .class = 0x030000, .class_mask = 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a44), .class = 0x030000, .class_mask = 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a49), .class = 0x030000, .class_mask = 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a4a), .class = 0x030000, .class_mask = 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a4c), .class = 0x030000, .class_mask = 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a50), .class = 0x030000, .class_mask = 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a51), .class = 0x030000, .class_mask = 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a52), .class = 0x030000, .class_mask = 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a54), .class = 0x030000, .class_mask = 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a59), .class = 0x030000, .class_mask = 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a5a), .class = 0x030000, .class_mask = 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x5a5c), .class = 0x030000, .class_mask = 0xff0000 },
 		/* LKF */
-		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x9840), 0x030000, 0xff0000 },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x9840), .class = 0x030000, .class_mask = 0xff0000 },
 		{}
 	};
 	struct pci_dev *display_dev = NULL;
diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
index 571d89a6a8da..f07c5f4c2380 100644
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -247,8 +247,8 @@ struct snd_ali {
 };
 
 static const struct pci_device_id snd_ali_ids[] = {
-	{PCI_DEVICE(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M5451), 0, 0, 0},
-	{0, }
+	{ PCI_DEVICE(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M5451) },
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, snd_ali_ids);
 
diff --git a/sound/pci/als300.c b/sound/pci/als300.c
index a73893a2cbd6..00f0720169c3 100644
--- a/sound/pci/als300.c
+++ b/sound/pci/als300.c
@@ -127,9 +127,9 @@ struct snd_als300_substream_data {
 };
 
 static const struct pci_device_id snd_als300_ids[] = {
-	{ 0x4005, 0x0300, PCI_ANY_ID, PCI_ANY_ID, 0, 0, DEVICE_ALS300 },
-	{ 0x4005, 0x0308, PCI_ANY_ID, PCI_ANY_ID, 0, 0, DEVICE_ALS300_PLUS },
-	{ 0, }
+	{ PCI_DEVICE(0x4005, 0x0300), .driver_data = DEVICE_ALS300 },
+	{ PCI_DEVICE(0x4005, 0x0308), .driver_data = DEVICE_ALS300_PLUS },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, snd_als300_ids);
diff --git a/sound/pci/als4000.c b/sound/pci/als4000.c
index 636f309c9424..6396aa6c3bf0 100644
--- a/sound/pci/als4000.c
+++ b/sound/pci/als4000.c
@@ -102,8 +102,8 @@ struct snd_card_als4000 {
 };
 
 static const struct pci_device_id snd_als4000_ids[] = {
-	{ 0x4005, 0x4000, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0, },   /* ALS4000 */
-	{ 0, }
+	{ PCI_DEVICE(0x4005, 0x4000) },   /* ALS4000 */
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, snd_als4000_ids);
diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index b1c7ed7f1604..4dbc79899c09 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -2933,13 +2933,16 @@ static void snd_asihpi_remove(struct pci_dev *pci_dev)
 }
 
 static const struct pci_device_id asihpi_pci_tbl[] = {
-	{HPI_PCI_VENDOR_ID_TI, HPI_PCI_DEV_ID_DSP6205,
-		HPI_PCI_VENDOR_ID_AUDIOSCIENCE, PCI_ANY_ID, 0, 0,
-		(kernel_ulong_t)HPI_6205},
-	{HPI_PCI_VENDOR_ID_TI, HPI_PCI_DEV_ID_PCI2040,
-		HPI_PCI_VENDOR_ID_AUDIOSCIENCE, PCI_ANY_ID, 0, 0,
-		(kernel_ulong_t)HPI_6000},
-	{0,}
+	{
+		PCI_DEVICE_SUB(HPI_PCI_VENDOR_ID_TI, HPI_PCI_DEV_ID_DSP6205,
+			       HPI_PCI_VENDOR_ID_AUDIOSCIENCE, PCI_ANY_ID),
+		.driver_data = (kernel_ulong_t)HPI_6205,
+	}, {
+		PCI_DEVICE_SUB(HPI_PCI_VENDOR_ID_TI, HPI_PCI_DEV_ID_PCI2040,
+			       HPI_PCI_VENDOR_ID_AUDIOSCIENCE, PCI_ANY_ID),
+		.driver_data = (kernel_ulong_t)HPI_6000,
+	},
+	{}
 };
 MODULE_DEVICE_TABLE(pci, asihpi_pci_tbl);
 
diff --git a/sound/pci/asihpi/hpipcida.h b/sound/pci/asihpi/hpipcida.h
index 0673e8278070..6dceff2b4741 100644
--- a/sound/pci/asihpi/hpipcida.h
+++ b/sound/pci/asihpi/hpipcida.h
@@ -15,12 +15,12 @@
 */
 
 {
-HPI_PCI_VENDOR_ID_TI, HPI_PCI_DEV_ID_DSP6205,
-		HPI_PCI_VENDOR_ID_AUDIOSCIENCE, PCI_ANY_ID, 0, 0,
-		(kernel_ulong_t) HPI_6205}
-, {
-HPI_PCI_VENDOR_ID_TI, HPI_PCI_DEV_ID_PCI2040,
-		HPI_PCI_VENDOR_ID_AUDIOSCIENCE, PCI_ANY_ID, 0, 0,
-		(kernel_ulong_t) HPI_6000}
-, {
-0}
+	PCI_DEVICE_SUB(HPI_PCI_VENDOR_ID_TI, HPI_PCI_DEV_ID_DSP6205,
+		       HPI_PCI_VENDOR_ID_AUDIOSCIENCE, PCI_ANY_ID),
+	.driver_data = (kernel_ulong_t) HPI_6205,
+}, {
+	PCI_DEVICE_SUB(HPI_PCI_VENDOR_ID_TI, HPI_PCI_DEV_ID_PCI2040,
+		       HPI_PCI_VENDOR_ID_AUDIOSCIENCE, PCI_ANY_ID),
+	.driver_data = (kernel_ulong_t) HPI_6000,
+},
+{ }
diff --git a/sound/pci/atiixp.c b/sound/pci/atiixp.c
index 2a0c59d5afa5..b738295b41e5 100644
--- a/sound/pci/atiixp.c
+++ b/sound/pci/atiixp.c
@@ -272,11 +272,11 @@ struct atiixp {
 /*
  */
 static const struct pci_device_id snd_atiixp_ids[] = {
-	{ PCI_VDEVICE(ATI, 0x4341), 0 }, /* SB200 */
-	{ PCI_VDEVICE(ATI, 0x4361), 0 }, /* SB300 */
-	{ PCI_VDEVICE(ATI, 0x4370), 0 }, /* SB400 */
-	{ PCI_VDEVICE(ATI, 0x4382), 0 }, /* SB600 */
-	{ 0, }
+	{ PCI_VDEVICE(ATI, 0x4341) }, /* SB200 */
+	{ PCI_VDEVICE(ATI, 0x4361) }, /* SB300 */
+	{ PCI_VDEVICE(ATI, 0x4370) }, /* SB400 */
+	{ PCI_VDEVICE(ATI, 0x4382) }, /* SB600 */
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, snd_atiixp_ids);
diff --git a/sound/pci/atiixp_modem.c b/sound/pci/atiixp_modem.c
index 91f31e2ad3d3..8aaeb197ce45 100644
--- a/sound/pci/atiixp_modem.c
+++ b/sound/pci/atiixp_modem.c
@@ -247,9 +247,9 @@ struct atiixp_modem {
 /*
  */
 static const struct pci_device_id snd_atiixp_ids[] = {
-	{ PCI_VDEVICE(ATI, 0x434d), 0 }, /* SB200 */
-	{ PCI_VDEVICE(ATI, 0x4378), 0 }, /* SB400 */
-	{ 0, }
+	{ PCI_VDEVICE(ATI, 0x434d) }, /* SB200 */
+	{ PCI_VDEVICE(ATI, 0x4378) }, /* SB400 */
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, snd_atiixp_ids);
diff --git a/sound/pci/au88x0/au8810.c b/sound/pci/au88x0/au8810.c
index b2bfa50bfe30..f712e32d3370 100644
--- a/sound/pci/au88x0/au8810.c
+++ b/sound/pci/au88x0/au8810.c
@@ -2,8 +2,8 @@
 #include "au8810.h"
 #include "au88x0.h"
 static const struct pci_device_id snd_vortex_ids[] = {
-	{PCI_VDEVICE(AUREAL, PCI_DEVICE_ID_AUREAL_ADVANTAGE), 1,},
-	{0,}
+	{ PCI_VDEVICE(AUREAL, PCI_DEVICE_ID_AUREAL_ADVANTAGE), .driver_data = 1 },
+	{ }
 };
 
 #include "au88x0_core.c"
diff --git a/sound/pci/au88x0/au8820.c b/sound/pci/au88x0/au8820.c
index dbc2263b49c6..aa841b615182 100644
--- a/sound/pci/au88x0/au8820.c
+++ b/sound/pci/au88x0/au8820.c
@@ -2,8 +2,8 @@
 #include "au8820.h"
 #include "au88x0.h"
 static const struct pci_device_id snd_vortex_ids[] = {
-	{PCI_VDEVICE(AUREAL, PCI_DEVICE_ID_AUREAL_VORTEX_1), 0,},
-	{0,}
+	{ PCI_VDEVICE(AUREAL, PCI_DEVICE_ID_AUREAL_VORTEX_1), .driver_data = 0 },
+	{ }
 };
 
 #include "au88x0_synth.c"
diff --git a/sound/pci/au88x0/au8830.c b/sound/pci/au88x0/au8830.c
index e963c4e2f026..aeb8d458c629 100644
--- a/sound/pci/au88x0/au8830.c
+++ b/sound/pci/au88x0/au8830.c
@@ -2,8 +2,8 @@
 #include "au8830.h"
 #include "au88x0.h"
 static const struct pci_device_id snd_vortex_ids[] = {
-	{PCI_VDEVICE(AUREAL, PCI_DEVICE_ID_AUREAL_VORTEX_2), 0,},
-	{0,}
+	{ PCI_VDEVICE(AUREAL, PCI_DEVICE_ID_AUREAL_VORTEX_2), .driver_data = 0 },
+	{ }
 };
 
 #include "au88x0_synth.c"
diff --git a/sound/pci/aw2/aw2-alsa.c b/sound/pci/aw2/aw2-alsa.c
index e2c501f4394c..60a87322eae4 100644
--- a/sound/pci/aw2/aw2-alsa.c
+++ b/sound/pci/aw2/aw2-alsa.c
@@ -142,9 +142,8 @@ module_param_array(enable, bool, NULL, 0444);
 MODULE_PARM_DESC(enable, "Enable Audiowerk2 soundcard.");
 
 static const struct pci_device_id snd_aw2_ids[] = {
-	{PCI_VENDOR_ID_PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7146, 0, 0,
-	 0, 0, 0},
-	{0}
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7146, 0, 0) },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, snd_aw2_ids);
diff --git a/sound/pci/azt3328.c b/sound/pci/azt3328.c
index 6cdf76e2b7d2..ccca82417657 100644
--- a/sound/pci/azt3328.c
+++ b/sound/pci/azt3328.c
@@ -305,9 +305,9 @@ struct snd_azf3328 {
 };
 
 static const struct pci_device_id snd_azf3328_ids[] = {
-	{ 0x122D, 0x50DC, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },   /* PCI168/3328 */
-	{ 0x122D, 0x80DA, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },   /* 3328 */
-	{ 0, }
+	{ PCI_DEVICE(0x122D, 0x50DC) },   /* PCI168/3328 */
+	{ PCI_DEVICE(0x122D, 0x80DA) },   /* 3328 */
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, snd_azf3328_ids);
diff --git a/sound/pci/ca0106/ca0106_main.c b/sound/pci/ca0106/ca0106_main.c
index 35392f6525b3..cf923f551211 100644
--- a/sound/pci/ca0106/ca0106_main.c
+++ b/sound/pci/ca0106/ca0106_main.c
@@ -1820,8 +1820,8 @@ static SIMPLE_DEV_PM_OPS(snd_ca0106_pm, snd_ca0106_suspend, snd_ca0106_resume);
 
 // PCI IDs
 static const struct pci_device_id snd_ca0106_ids[] = {
-	{ PCI_VDEVICE(CREATIVE, 0x0007), 0 },	/* Audigy LS or Live 24bit */
-	{ 0, }
+	{ PCI_VDEVICE(CREATIVE, 0x0007) },	/* Audigy LS or Live 24bit */
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, snd_ca0106_ids);
 
diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index cd73b6833639..f5382b10865a 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -2721,12 +2721,12 @@ static void snd_cmipci_proc_init(struct cmipci *cm)
 }
 
 static const struct pci_device_id snd_cmipci_ids[] = {
-	{PCI_VDEVICE(CMEDIA, PCI_DEVICE_ID_CMEDIA_CM8338A), 0},
-	{PCI_VDEVICE(CMEDIA, PCI_DEVICE_ID_CMEDIA_CM8338B), 0},
-	{PCI_VDEVICE(CMEDIA, PCI_DEVICE_ID_CMEDIA_CM8738), 0},
-	{PCI_VDEVICE(CMEDIA, PCI_DEVICE_ID_CMEDIA_CM8738B), 0},
-	{PCI_VDEVICE(AL, PCI_DEVICE_ID_CMEDIA_CM8738), 0},
-	{0,},
+	{PCI_VDEVICE(CMEDIA, PCI_DEVICE_ID_CMEDIA_CM8338A) },
+	{PCI_VDEVICE(CMEDIA, PCI_DEVICE_ID_CMEDIA_CM8338B) },
+	{PCI_VDEVICE(CMEDIA, PCI_DEVICE_ID_CMEDIA_CM8738) },
+	{PCI_VDEVICE(CMEDIA, PCI_DEVICE_ID_CMEDIA_CM8738B) },
+	{PCI_VDEVICE(AL, PCI_DEVICE_ID_CMEDIA_CM8738) },
+	{ }
 };
 
 
diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
index d00b2c9fb1e3..f51f4bb63766 100644
--- a/sound/pci/cs4281.c
+++ b/sound/pci/cs4281.c
@@ -476,8 +476,8 @@ struct cs4281 {
 static irqreturn_t snd_cs4281_interrupt(int irq, void *dev_id);
 
 static const struct pci_device_id snd_cs4281_ids[] = {
-	{ PCI_VDEVICE(CIRRUS, 0x6005), 0, },	/* CS4281 */
-	{ 0, }
+	{ PCI_VDEVICE(CIRRUS, 0x6005) },	/* CS4281 */
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, snd_cs4281_ids);
diff --git a/sound/pci/cs46xx/cs46xx.c b/sound/pci/cs46xx/cs46xx.c
index 9c1995737eb7..0cb7c2a2929f 100644
--- a/sound/pci/cs46xx/cs46xx.c
+++ b/sound/pci/cs46xx/cs46xx.c
@@ -43,10 +43,10 @@ module_param_array(mmap_valid, bool, NULL, 0444);
 MODULE_PARM_DESC(mmap_valid, "Support OSS mmap.");
 
 static const struct pci_device_id snd_cs46xx_ids[] = {
-	{ PCI_VDEVICE(CIRRUS, 0x6001), 0, },   /* CS4280 */
-	{ PCI_VDEVICE(CIRRUS, 0x6003), 0, },   /* CS4612 */
-	{ PCI_VDEVICE(CIRRUS, 0x6004), 0, },   /* CS4615 */
-	{ 0, }
+	{ PCI_VDEVICE(CIRRUS, 0x6001) },   /* CS4280 */
+	{ PCI_VDEVICE(CIRRUS, 0x6003) },   /* CS4612 */
+	{ PCI_VDEVICE(CIRRUS, 0x6004) },   /* CS4615 */
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, snd_cs46xx_ids);
diff --git a/sound/pci/echoaudio/darla20.c b/sound/pci/echoaudio/darla20.c
index e295c71c7a39..48c25bd3f401 100644
--- a/sound/pci/echoaudio/darla20.c
+++ b/sound/pci/echoaudio/darla20.c
@@ -52,8 +52,8 @@ static const struct firmware card_fw[] = {
 };
 
 static const struct pci_device_id snd_echo_ids[] = {
-	{0x1057, 0x1801, 0xECC0, 0x0010, 0, 0, 0},	/* DSP 56301 Darla20 rev.0 */
-	{0,}
+	{ PCI_DEVICE_SUB(0x1057, 0x1801, 0xECC0, 0x0010) },	/* DSP 56301 Darla20 rev.0 */
+	{ }
 };
 
 static const struct snd_pcm_hardware pcm_hardware_skel = {
diff --git a/sound/pci/echoaudio/darla24.c b/sound/pci/echoaudio/darla24.c
index ae816e78f599..c8cdd1b052df 100644
--- a/sound/pci/echoaudio/darla24.c
+++ b/sound/pci/echoaudio/darla24.c
@@ -56,9 +56,9 @@ static const struct firmware card_fw[] = {
 };
 
 static const struct pci_device_id snd_echo_ids[] = {
-	{0x1057, 0x1801, 0xECC0, 0x0040, 0, 0, 0},	/* DSP 56301 Darla24 rev.0 */
-	{0x1057, 0x1801, 0xECC0, 0x0041, 0, 0, 0},	/* DSP 56301 Darla24 rev.1 */
-	{0,}
+	{ PCI_DEVICE_SUB(0x1057, 0x1801, 0xECC0, 0x0040) },	/* DSP 56301 Darla24 rev.0 */
+	{ PCI_DEVICE_SUB(0x1057, 0x1801, 0xECC0, 0x0041) },	/* DSP 56301 Darla24 rev.1 */
+	{ }
 };
 
 static const struct snd_pcm_hardware pcm_hardware_skel = {
diff --git a/sound/pci/echoaudio/echo3g.c b/sound/pci/echoaudio/echo3g.c
index 3d37bb4030ec..e8b476e07307 100644
--- a/sound/pci/echoaudio/echo3g.c
+++ b/sound/pci/echoaudio/echo3g.c
@@ -70,8 +70,8 @@ static const struct firmware card_fw[] = {
 };
 
 static const struct pci_device_id snd_echo_ids[] = {
-	{0x1057, 0x3410, 0xECC0, 0x0100, 0, 0, 0},	/* Echo 3G */
-	{0,}
+	{ PCI_DEVICE_SUB(0x1057, 0x3410, 0xECC0, 0x0100) },	/* Echo 3G */
+	{ }
 };
 
 static const struct snd_pcm_hardware pcm_hardware_skel = {
diff --git a/sound/pci/echoaudio/gina20.c b/sound/pci/echoaudio/gina20.c
index 4f864ddc9530..b5f88922e19a 100644
--- a/sound/pci/echoaudio/gina20.c
+++ b/sound/pci/echoaudio/gina20.c
@@ -56,8 +56,8 @@ static const struct firmware card_fw[] = {
 };
 
 static const struct pci_device_id snd_echo_ids[] = {
-	{0x1057, 0x1801, 0xECC0, 0x0020, 0, 0, 0},	/* DSP 56301 Gina20 rev.0 */
-	{0,}
+	{ PCI_DEVICE_SUB(0x1057, 0x1801, 0xECC0, 0x0020) },	/* DSP 56301 Gina20 rev.0 */
+	{ }
 };
 
 static const struct snd_pcm_hardware pcm_hardware_skel = {
diff --git a/sound/pci/echoaudio/gina24.c b/sound/pci/echoaudio/gina24.c
index eff69e83ca0a..fe0e510209ed 100644
--- a/sound/pci/echoaudio/gina24.c
+++ b/sound/pci/echoaudio/gina24.c
@@ -74,11 +74,11 @@ static const struct firmware card_fw[] = {
 };
 
 static const struct pci_device_id snd_echo_ids[] = {
-	{0x1057, 0x1801, 0xECC0, 0x0050, 0, 0, 0},	/* DSP 56301 Gina24 rev.0 */
-	{0x1057, 0x1801, 0xECC0, 0x0051, 0, 0, 0},	/* DSP 56301 Gina24 rev.1 */
-	{0x1057, 0x3410, 0xECC0, 0x0050, 0, 0, 0},	/* DSP 56361 Gina24 rev.0 */
-	{0x1057, 0x3410, 0xECC0, 0x0051, 0, 0, 0},	/* DSP 56361 Gina24 rev.1 */
-	{0,}
+	{ PCI_DEVICE_SUB(0x1057, 0x1801, 0xECC0, 0x0050) },	/* DSP 56301 Gina24 rev.0 */
+	{ PCI_DEVICE_SUB(0x1057, 0x1801, 0xECC0, 0x0051) },	/* DSP 56301 Gina24 rev.1 */
+	{ PCI_DEVICE_SUB(0x1057, 0x3410, 0xECC0, 0x0050) },	/* DSP 56361 Gina24 rev.0 */
+	{ PCI_DEVICE_SUB(0x1057, 0x3410, 0xECC0, 0x0051) },	/* DSP 56361 Gina24 rev.1 */
+	{ }
 };
 
 static const struct snd_pcm_hardware pcm_hardware_skel = {
diff --git a/sound/pci/echoaudio/indigo.c b/sound/pci/echoaudio/indigo.c
index a9f2efc58f6e..496cc5aa9516 100644
--- a/sound/pci/echoaudio/indigo.c
+++ b/sound/pci/echoaudio/indigo.c
@@ -57,8 +57,8 @@ static const struct firmware card_fw[] = {
 };
 
 static const struct pci_device_id snd_echo_ids[] = {
-	{0x1057, 0x3410, 0xECC0, 0x0090, 0, 0, 0},	/* Indigo */
-	{0,}
+	{ PCI_DEVICE_SUB(0x1057, 0x3410, 0xECC0, 0x0090) },	/* Indigo */
+	{ }
 };
 
 static const struct snd_pcm_hardware pcm_hardware_skel = {
diff --git a/sound/pci/echoaudio/indigodj.c b/sound/pci/echoaudio/indigodj.c
index 14e9769ceba1..45ad92e8f531 100644
--- a/sound/pci/echoaudio/indigodj.c
+++ b/sound/pci/echoaudio/indigodj.c
@@ -57,8 +57,8 @@ static const struct firmware card_fw[] = {
 };
 
 static const struct pci_device_id snd_echo_ids[] = {
-	{0x1057, 0x3410, 0xECC0, 0x00B0, 0, 0, 0},	/* Indigo DJ*/
-	{0,}
+	{ PCI_DEVICE_SUB(0x1057, 0x3410, 0xECC0, 0x00B0) },	/* Indigo DJ*/
+	{ }
 };
 
 static const struct snd_pcm_hardware pcm_hardware_skel = {
diff --git a/sound/pci/echoaudio/indigodjx.c b/sound/pci/echoaudio/indigodjx.c
index a14a7dc8c87d..b1878ecb8375 100644
--- a/sound/pci/echoaudio/indigodjx.c
+++ b/sound/pci/echoaudio/indigodjx.c
@@ -57,8 +57,8 @@ static const struct firmware card_fw[] = {
 };
 
 static const struct pci_device_id snd_echo_ids[] = {
-	{0x1057, 0x3410, 0xECC0, 0x00E0, 0, 0, 0},	/* Indigo DJx*/
-	{0,}
+	{ PCI_DEVICE_SUB(0x1057, 0x3410, 0xECC0, 0x00E0) },	/* Indigo DJx*/
+	{ }
 };
 
 static const struct snd_pcm_hardware pcm_hardware_skel = {
diff --git a/sound/pci/echoaudio/indigoio.c b/sound/pci/echoaudio/indigoio.c
index 97e024450d19..2c6a6f74b0bd 100644
--- a/sound/pci/echoaudio/indigoio.c
+++ b/sound/pci/echoaudio/indigoio.c
@@ -58,8 +58,8 @@ static const struct firmware card_fw[] = {
 };
 
 static const struct pci_device_id snd_echo_ids[] = {
-	{0x1057, 0x3410, 0xECC0, 0x00A0, 0, 0, 0},	/* Indigo IO*/
-	{0,}
+	{ PCI_DEVICE_SUB(0x1057, 0x3410, 0xECC0, 0x00A0) },	/* Indigo IO*/
+	{ }
 };
 
 static const struct snd_pcm_hardware pcm_hardware_skel = {
diff --git a/sound/pci/echoaudio/indigoiox.c b/sound/pci/echoaudio/indigoiox.c
index a017c966b4dc..dfaa563317ad 100644
--- a/sound/pci/echoaudio/indigoiox.c
+++ b/sound/pci/echoaudio/indigoiox.c
@@ -58,8 +58,8 @@ static const struct firmware card_fw[] = {
 };
 
 static const struct pci_device_id snd_echo_ids[] = {
-	{0x1057, 0x3410, 0xECC0, 0x00D0, 0, 0, 0},	/* Indigo IOx */
-	{0,}
+	{ PCI_DEVICE_SUB(0x1057, 0x3410, 0xECC0, 0x00D0) },	/* Indigo IOx */
+	{ }
 };
 
 static const struct snd_pcm_hardware pcm_hardware_skel = {
diff --git a/sound/pci/echoaudio/layla20.c b/sound/pci/echoaudio/layla20.c
index 7e38bc9c025d..82c089f7b452 100644
--- a/sound/pci/echoaudio/layla20.c
+++ b/sound/pci/echoaudio/layla20.c
@@ -65,9 +65,9 @@ static const struct firmware card_fw[] = {
 };
 
 static const struct pci_device_id snd_echo_ids[] = {
-	{0x1057, 0x1801, 0xECC0, 0x0030, 0, 0, 0},	/* DSP 56301 Layla20 rev.0 */
-	{0x1057, 0x1801, 0xECC0, 0x0031, 0, 0, 0},	/* DSP 56301 Layla20 rev.1 */
-	{0,}
+	{ PCI_DEVICE_SUB(0x1057, 0x1801, 0xECC0, 0x0030) },	/* DSP 56301 Layla20 rev.0 */
+	{ PCI_DEVICE_SUB(0x1057, 0x1801, 0xECC0, 0x0031) },	/* DSP 56301 Layla20 rev.1 */
+	{ }
 };
 
 static const struct snd_pcm_hardware pcm_hardware_skel = {
diff --git a/sound/pci/echoaudio/layla24.c b/sound/pci/echoaudio/layla24.c
index 95c52210fb65..efd676467a37 100644
--- a/sound/pci/echoaudio/layla24.c
+++ b/sound/pci/echoaudio/layla24.c
@@ -76,8 +76,8 @@ static const struct firmware card_fw[] = {
 };
 
 static const struct pci_device_id snd_echo_ids[] = {
-	{0x1057, 0x3410, 0xECC0, 0x0060, 0, 0, 0},	/* DSP 56361 Layla24 rev.0 */
-	{0,}
+	{ PCI_DEVICE_SUB(0x1057, 0x3410, 0xECC0, 0x0060) },	/* DSP 56361 Layla24 rev.0 */
+	{ }
 };
 
 static const struct snd_pcm_hardware pcm_hardware_skel = {
diff --git a/sound/pci/echoaudio/mia.c b/sound/pci/echoaudio/mia.c
index a2d4b0003b57..950aaec74a43 100644
--- a/sound/pci/echoaudio/mia.c
+++ b/sound/pci/echoaudio/mia.c
@@ -66,9 +66,9 @@ static const struct firmware card_fw[] = {
 };
 
 static const struct pci_device_id snd_echo_ids[] = {
-	{0x1057, 0x3410, 0xECC0, 0x0080, 0, 0, 0},	/* DSP 56361 Mia rev.0 */
-	{0x1057, 0x3410, 0xECC0, 0x0081, 0, 0, 0},	/* DSP 56361 Mia rev.1 */
-	{0,}
+	{ PCI_DEVICE_SUB(0x1057, 0x3410, 0xECC0, 0x0080) },	/* DSP 56361 Mia rev.0 */
+	{ PCI_DEVICE_SUB(0x1057, 0x3410, 0xECC0, 0x0081) },	/* DSP 56361 Mia rev.1 */
+	{ }
 };
 
 static const struct snd_pcm_hardware pcm_hardware_skel = {
diff --git a/sound/pci/echoaudio/mona.c b/sound/pci/echoaudio/mona.c
index 1b45a2b5066f..4f999324f388 100644
--- a/sound/pci/echoaudio/mona.c
+++ b/sound/pci/echoaudio/mona.c
@@ -81,13 +81,19 @@ static const struct firmware card_fw[] = {
 };
 
 static const struct pci_device_id snd_echo_ids[] = {
-	{0x1057, 0x1801, 0xECC0, 0x0070, 0, 0, 0},	/* DSP 56301 Mona rev.0 */
-	{0x1057, 0x1801, 0xECC0, 0x0071, 0, 0, 0},	/* DSP 56301 Mona rev.1 */
-	{0x1057, 0x1801, 0xECC0, 0x0072, 0, 0, 0},	/* DSP 56301 Mona rev.2 */
-	{0x1057, 0x3410, 0xECC0, 0x0070, 0, 0, 0},	/* DSP 56361 Mona rev.0 */
-	{0x1057, 0x3410, 0xECC0, 0x0071, 0, 0, 0},	/* DSP 56361 Mona rev.1 */
-	{0x1057, 0x3410, 0xECC0, 0x0072, 0, 0, 0},	/* DSP 56361 Mona rev.2 */
-	{0,}
+	/* DSP 56301 Mona rev.0 */
+	{ PCI_DEVICE_SUB(0x1057, 0x1801, 0xECC0, 0x0070) },
+	/* DSP 56301 Mona rev.1 */
+	{ PCI_DEVICE_SUB(0x1057, 0x1801, 0xECC0, 0x0071) },
+	/* DSP 56301 Mona rev.2 */
+	{ PCI_DEVICE_SUB(0x1057, 0x1801, 0xECC0, 0x0072) },
+	/* DSP 56361 Mona rev.0 */
+	{ PCI_DEVICE_SUB(0x1057, 0x3410, 0xECC0, 0x0070) },
+	/* DSP 56361 Mona rev.1 */
+	{ PCI_DEVICE_SUB(0x1057, 0x3410, 0xECC0, 0x0071) },
+	/* DSP 56361 Mona rev.2 */
+	{ PCI_DEVICE_SUB(0x1057, 0x3410, 0xECC0, 0x0072) },
+	{ }
 };
 
 static const struct snd_pcm_hardware pcm_hardware_skel = {
diff --git a/sound/pci/emu10k1/emu10k1.c b/sound/pci/emu10k1/emu10k1.c
index 548e7d049901..3b21bd2883b6 100644
--- a/sound/pci/emu10k1/emu10k1.c
+++ b/sound/pci/emu10k1/emu10k1.c
@@ -58,10 +58,10 @@ MODULE_PARM_DESC(subsystem, "Force card subsystem model.");
  * Class 0401: 1102:0008 (rev 00) Subsystem: 1102:1001 -> Audigy2 Value  Model:SB0400
  */
 static const struct pci_device_id snd_emu10k1_ids[] = {
-	{ PCI_VDEVICE(CREATIVE, 0x0002), 0 },	/* EMU10K1 */
-	{ PCI_VDEVICE(CREATIVE, 0x0004), 1 },	/* Audigy */
-	{ PCI_VDEVICE(CREATIVE, 0x0008), 1 },	/* Audigy 2 Value SB0400 */
-	{ 0, }
+	{ PCI_VDEVICE(CREATIVE, 0x0002), .driver_data = 0 },	/* EMU10K1 */
+	{ PCI_VDEVICE(CREATIVE, 0x0004), .driver_data = 1 },	/* Audigy */
+	{ PCI_VDEVICE(CREATIVE, 0x0008), .driver_data = 1 },	/* Audigy 2 Value SB0400 */
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, snd_emu10k1_ids);
diff --git a/sound/pci/emu10k1/emu10k1x.c b/sound/pci/emu10k1/emu10k1x.c
index 1b207ca25814..ed4630c8342b 100644
--- a/sound/pci/emu10k1/emu10k1x.c
+++ b/sound/pci/emu10k1/emu10k1x.c
@@ -1518,8 +1518,8 @@ static int snd_emu10k1x_probe(struct pci_dev *pci,
 
 // PCI IDs
 static const struct pci_device_id snd_emu10k1x_ids[] = {
-	{ PCI_VDEVICE(CREATIVE, 0x0006), 0 },	/* Dell OEM version (EMU10K1) */
-	{ 0, }
+	{ PCI_VDEVICE(CREATIVE, 0x0006) },	/* Dell OEM version (EMU10K1) */
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, snd_emu10k1x_ids);
 
diff --git a/sound/pci/ens1370.c b/sound/pci/ens1370.c
index 657056a59175..0b9eb55a2121 100644
--- a/sound/pci/ens1370.c
+++ b/sound/pci/ens1370.c
@@ -426,14 +426,14 @@ static irqreturn_t snd_audiopci_interrupt(int irq, void *dev_id);
 
 static const struct pci_device_id snd_audiopci_ids[] = {
 #ifdef CHIP1370
-	{ PCI_VDEVICE(ENSONIQ, 0x5000), 0, },	/* ES1370 */
+	{ PCI_VDEVICE(ENSONIQ, 0x5000) },	/* ES1370 */
 #endif
 #ifdef CHIP1371
-	{ PCI_VDEVICE(ENSONIQ, 0x1371), 0, },	/* ES1371 */
-	{ PCI_VDEVICE(ENSONIQ, 0x5880), 0, },	/* ES1373 - CT5880 */
-	{ PCI_VDEVICE(ECTIVA, 0x8938), 0, },	/* Ectiva EV1938 */
+	{ PCI_VDEVICE(ENSONIQ, 0x1371) },	/* ES1371 */
+	{ PCI_VDEVICE(ENSONIQ, 0x5880) },	/* ES1373 - CT5880 */
+	{ PCI_VDEVICE(ECTIVA, 0x8938) },	/* Ectiva EV1938 */
 #endif
-	{ 0, }
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, snd_audiopci_ids);
diff --git a/sound/pci/es1938.c b/sound/pci/es1938.c
index 280125eff362..f4c7a9532f4a 100644
--- a/sound/pci/es1938.c
+++ b/sound/pci/es1938.c
@@ -222,8 +222,8 @@ struct es1938 {
 static irqreturn_t snd_es1938_interrupt(int irq, void *dev_id);
 
 static const struct pci_device_id snd_es1938_ids[] = {
-	{ PCI_VDEVICE(ESS, 0x1969), 0, },   /* Solo-1 */
-	{ 0, }
+	{ PCI_VDEVICE(ESS, 0x1969) },   /* Solo-1 */
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, snd_es1938_ids);
diff --git a/sound/pci/es1968.c b/sound/pci/es1968.c
index b7282b3fa1b1..f04628c8cbb7 100644
--- a/sound/pci/es1968.c
+++ b/sound/pci/es1968.c
@@ -549,13 +549,26 @@ struct es1968 {
 static irqreturn_t snd_es1968_interrupt(int irq, void *dev_id);
 
 static const struct pci_device_id snd_es1968_ids[] = {
-	/* Maestro 1 */
-        { 0x1285, 0x0100, PCI_ANY_ID, PCI_ANY_ID, PCI_CLASS_MULTIMEDIA_AUDIO << 8, 0xffff00, TYPE_MAESTRO },
-	/* Maestro 2 */
-	{ 0x125d, 0x1968, PCI_ANY_ID, PCI_ANY_ID, PCI_CLASS_MULTIMEDIA_AUDIO << 8, 0xffff00, TYPE_MAESTRO2 },
-	/* Maestro 2E */
-        { 0x125d, 0x1978, PCI_ANY_ID, PCI_ANY_ID, PCI_CLASS_MULTIMEDIA_AUDIO << 8, 0xffff00, TYPE_MAESTRO2E },
-	{ 0, }
+	{
+		/* Maestro 1 */
+		PCI_DEVICE(0x1285, 0x0100),
+		.class = PCI_CLASS_MULTIMEDIA_AUDIO << 8,
+		.class_mask = 0xffff00,
+		.driver_data = TYPE_MAESTRO,
+	}, {
+		/* Maestro 2 */
+		PCI_DEVICE(0x125d, 0x1968),
+		.class = PCI_CLASS_MULTIMEDIA_AUDIO << 8,
+		.class_mask = 0xffff00,
+		.driver_data = TYPE_MAESTRO2,
+	}, {
+		/* Maestro 2E */
+		PCI_DEVICE(0x125d, 0x1978),
+		.class = PCI_CLASS_MULTIMEDIA_AUDIO << 8,
+		.class_mask = 0xffff00,
+		.driver_data = TYPE_MAESTRO2E,
+	},
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, snd_es1968_ids);
diff --git a/sound/pci/fm801.c b/sound/pci/fm801.c
index 4ca992449ea3..9cc96b807dd7 100644
--- a/sound/pci/fm801.c
+++ b/sound/pci/fm801.c
@@ -240,9 +240,18 @@ static inline u16 fm801_ioread16(struct fm801 *chip, unsigned short offset)
 }
 
 static const struct pci_device_id snd_fm801_ids[] = {
-	{ 0x1319, 0x0801, PCI_ANY_ID, PCI_ANY_ID, PCI_CLASS_MULTIMEDIA_AUDIO << 8, 0xffff00, 0, },   /* FM801 */
-	{ 0x5213, 0x0510, PCI_ANY_ID, PCI_ANY_ID, PCI_CLASS_MULTIMEDIA_AUDIO << 8, 0xffff00, 0, },   /* Gallant Odyssey Sound 4 */
-	{ 0, }
+	{
+		/* FM801 */
+		PCI_DEVICE(0x1319, 0x0801),
+		.class = PCI_CLASS_MULTIMEDIA_AUDIO << 8,
+		.class_mask = 0xffff00,
+	}, {
+		/* Gallant Odyssey Sound 4 */
+		PCI_DEVICE(0x5213, 0x0510),
+		.class = PCI_CLASS_MULTIMEDIA_AUDIO << 8,
+		.class_mask = 0xffff00,
+	},
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, snd_fm801_ids);
diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index 1e39b985bef2..0e27e84d2ce4 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -86,8 +86,8 @@ MODULE_PARM_DESC(dxr_enable, "Enable DXR support for Terratec DMX6FIRE.");
 
 
 static const struct pci_device_id snd_ice1712_ids[] = {
-	{ PCI_VDEVICE(ICE, PCI_DEVICE_ID_ICE_1712), 0 },   /* ICE1712 */
-	{ 0, }
+	{ PCI_VDEVICE(ICE, PCI_DEVICE_ID_ICE_1712) },   /* ICE1712 */
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, snd_ice1712_ids);
diff --git a/sound/pci/ice1712/ice1724.c b/sound/pci/ice1712/ice1724.c
index 65bf48647d08..2e64f9c020e5 100644
--- a/sound/pci/ice1712/ice1724.c
+++ b/sound/pci/ice1712/ice1724.c
@@ -62,8 +62,8 @@ MODULE_PARM_DESC(model, "Use the given board model.");
 
 /* Both VT1720 and VT1724 have the same PCI IDs */
 static const struct pci_device_id snd_vt1724_ids[] = {
-	{ PCI_VDEVICE(ICE, PCI_DEVICE_ID_VT1724), 0 },
-	{ 0, }
+	{ PCI_VDEVICE(ICE, PCI_DEVICE_ID_VT1724) },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, snd_vt1724_ids);
diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index 3b53c5e63c29..e2ea9016a73e 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -384,30 +384,100 @@ struct intel8x0 {
 };
 
 static const struct pci_device_id snd_intel8x0_ids[] = {
-	{ PCI_VDEVICE(INTEL, 0x2415), DEVICE_INTEL },	/* 82801AA */
-	{ PCI_VDEVICE(INTEL, 0x2425), DEVICE_INTEL },	/* 82901AB */
-	{ PCI_VDEVICE(INTEL, 0x2445), DEVICE_INTEL },	/* 82801BA */
-	{ PCI_VDEVICE(INTEL, 0x2485), DEVICE_INTEL },	/* ICH3 */
-	{ PCI_VDEVICE(INTEL, 0x24c5), DEVICE_INTEL_ICH4 }, /* ICH4 */
-	{ PCI_VDEVICE(INTEL, 0x24d5), DEVICE_INTEL_ICH4 }, /* ICH5 */
-	{ PCI_VDEVICE(INTEL, 0x25a6), DEVICE_INTEL_ICH4 }, /* ESB */
-	{ PCI_VDEVICE(INTEL, 0x266e), DEVICE_INTEL_ICH4 }, /* ICH6 */
-	{ PCI_VDEVICE(INTEL, 0x27de), DEVICE_INTEL_ICH4 }, /* ICH7 */
-	{ PCI_VDEVICE(INTEL, 0x2698), DEVICE_INTEL_ICH4 }, /* ESB2 */
-	{ PCI_VDEVICE(INTEL, 0x7195), DEVICE_INTEL },	/* 440MX */
-	{ PCI_VDEVICE(SI, 0x7012), DEVICE_SIS },	/* SI7012 */
-	{ PCI_VDEVICE(NVIDIA, 0x01b1), DEVICE_NFORCE },	/* NFORCE */
-	{ PCI_VDEVICE(NVIDIA, 0x003a), DEVICE_NFORCE },	/* MCP04 */
-	{ PCI_VDEVICE(NVIDIA, 0x006a), DEVICE_NFORCE },	/* NFORCE2 */
-	{ PCI_VDEVICE(NVIDIA, 0x0059), DEVICE_NFORCE },	/* CK804 */
-	{ PCI_VDEVICE(NVIDIA, 0x008a), DEVICE_NFORCE },	/* CK8 */
-	{ PCI_VDEVICE(NVIDIA, 0x00da), DEVICE_NFORCE },	/* NFORCE3 */
-	{ PCI_VDEVICE(NVIDIA, 0x00ea), DEVICE_NFORCE },	/* CK8S */
-	{ PCI_VDEVICE(NVIDIA, 0x026b), DEVICE_NFORCE },	/* MCP51 */
-	{ PCI_VDEVICE(AMD, 0x746d), DEVICE_INTEL },	/* AMD8111 */
-	{ PCI_VDEVICE(AMD, 0x7445), DEVICE_INTEL },	/* AMD768 */
-	{ PCI_VDEVICE(AL, 0x5455), DEVICE_ALI },   /* Ali5455 */
-	{ 0, }
+	{
+		/* 82801AA */
+		PCI_VDEVICE(INTEL, 0x2415),
+		.driver_data = DEVICE_INTEL,
+	}, {
+		/* 82901AB */
+		PCI_VDEVICE(INTEL, 0x2425),
+		.driver_data = DEVICE_INTEL,
+	}, {
+		/* 82801BA */
+		PCI_VDEVICE(INTEL, 0x2445),
+		.driver_data = DEVICE_INTEL,
+	}, {
+		/* ICH3 */
+		PCI_VDEVICE(INTEL, 0x2485),
+		.driver_data = DEVICE_INTEL,
+	}, {
+		/* ICH4 */
+		PCI_VDEVICE(INTEL, 0x24c5),
+		.driver_data = DEVICE_INTEL_ICH4,
+	}, {
+		/* ICH5 */
+		PCI_VDEVICE(INTEL, 0x24d5),
+		.driver_data = DEVICE_INTEL_ICH4,
+	}, {
+		/* ESB */
+		PCI_VDEVICE(INTEL, 0x25a6),
+		.driver_data = DEVICE_INTEL_ICH4,
+	}, {
+		/* ICH6 */
+		PCI_VDEVICE(INTEL, 0x266e),
+		.driver_data = DEVICE_INTEL_ICH4,
+	}, {
+		/* ICH7 */
+		PCI_VDEVICE(INTEL, 0x27de),
+		.driver_data = DEVICE_INTEL_ICH4,
+	}, {
+		/* ESB2 */
+		PCI_VDEVICE(INTEL, 0x2698),
+		.driver_data = DEVICE_INTEL_ICH4,
+	}, {
+		/* 440MX */
+		PCI_VDEVICE(INTEL, 0x7195),
+		.driver_data = DEVICE_INTEL,
+	}, {
+		/* SI7012 */
+		PCI_VDEVICE(SI, 0x7012),
+		.driver_data = DEVICE_SIS,
+	}, {
+		/* NFORCE */
+		PCI_VDEVICE(NVIDIA, 0x01b1),
+		.driver_data = DEVICE_NFORCE,
+	}, {
+		/* MCP04 */
+		PCI_VDEVICE(NVIDIA, 0x003a),
+		.driver_data = DEVICE_NFORCE,
+	}, {
+		/* NFORCE2 */
+		PCI_VDEVICE(NVIDIA, 0x006a),
+		.driver_data = DEVICE_NFORCE,
+	}, {
+		/* CK804 */
+		PCI_VDEVICE(NVIDIA, 0x0059),
+		.driver_data = DEVICE_NFORCE,
+	}, {
+		/* CK8 */
+		PCI_VDEVICE(NVIDIA, 0x008a),
+		.driver_data = DEVICE_NFORCE,
+	}, {
+		/* NFORCE3 */
+		PCI_VDEVICE(NVIDIA, 0x00da),
+		.driver_data = DEVICE_NFORCE,
+	}, {
+		/* CK8S */
+		PCI_VDEVICE(NVIDIA, 0x00ea),
+		.driver_data = DEVICE_NFORCE,
+	}, {
+		/* MCP51 */
+		PCI_VDEVICE(NVIDIA, 0x026b),
+		.driver_data = DEVICE_NFORCE,
+	}, {
+		/* AMD8111 */
+		PCI_VDEVICE(AMD, 0x746d),
+		.driver_data = DEVICE_INTEL,
+	}, {
+		/* AMD768 */
+		PCI_VDEVICE(AMD, 0x7445),
+		.driver_data = DEVICE_INTEL,
+	}, {
+		/* Ali5455 */
+		PCI_VDEVICE(AL, 0x5455),
+		.driver_data = DEVICE_ALI,
+	},
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, snd_intel8x0_ids);
diff --git a/sound/pci/intel8x0m.c b/sound/pci/intel8x0m.c
index 84e1b7ea34e2..27dbf6125427 100644
--- a/sound/pci/intel8x0m.c
+++ b/sound/pci/intel8x0m.c
@@ -190,26 +190,78 @@ struct intel8x0m {
 };
 
 static const struct pci_device_id snd_intel8x0m_ids[] = {
-	{ PCI_VDEVICE(INTEL, 0x2416), DEVICE_INTEL },	/* 82801AA */
-	{ PCI_VDEVICE(INTEL, 0x2426), DEVICE_INTEL },	/* 82901AB */
-	{ PCI_VDEVICE(INTEL, 0x2446), DEVICE_INTEL },	/* 82801BA */
-	{ PCI_VDEVICE(INTEL, 0x2486), DEVICE_INTEL },	/* ICH3 */
-	{ PCI_VDEVICE(INTEL, 0x24c6), DEVICE_INTEL }, /* ICH4 */
-	{ PCI_VDEVICE(INTEL, 0x24d6), DEVICE_INTEL }, /* ICH5 */
-	{ PCI_VDEVICE(INTEL, 0x266d), DEVICE_INTEL },	/* ICH6 */
-	{ PCI_VDEVICE(INTEL, 0x27dd), DEVICE_INTEL },	/* ICH7 */
-	{ PCI_VDEVICE(INTEL, 0x7196), DEVICE_INTEL },	/* 440MX */
-	{ PCI_VDEVICE(AMD, 0x7446), DEVICE_INTEL },	/* AMD768 */
-	{ PCI_VDEVICE(SI, 0x7013), DEVICE_SIS },	/* SI7013 */
-	{ PCI_VDEVICE(NVIDIA, 0x01c1), DEVICE_NFORCE }, /* NFORCE */
-	{ PCI_VDEVICE(NVIDIA, 0x0069), DEVICE_NFORCE }, /* NFORCE2 */
-	{ PCI_VDEVICE(NVIDIA, 0x0089), DEVICE_NFORCE }, /* NFORCE2s */
-	{ PCI_VDEVICE(NVIDIA, 0x00d9), DEVICE_NFORCE }, /* NFORCE3 */
-	{ PCI_VDEVICE(AMD, 0x746e), DEVICE_INTEL },	/* AMD8111 */
+	{
+		/* 82801AA */
+		PCI_VDEVICE(INTEL, 0x2416),
+		.driver_data = DEVICE_INTEL,
+	}, {
+		/* 82901AB */
+		PCI_VDEVICE(INTEL, 0x2426),
+		.driver_data = DEVICE_INTEL
+	}, {
+		/* 82801BA */
+		PCI_VDEVICE(INTEL, 0x2446),
+		.driver_data = DEVICE_INTEL
+	}, {
+		/* ICH3 */
+		PCI_VDEVICE(INTEL, 0x2486),
+		.driver_data = DEVICE_INTEL
+	}, {
+		/* ICH4 */
+		PCI_VDEVICE(INTEL, 0x24c6),
+		.driver_data = DEVICE_INTEL,
+	}, {
+		/* ICH5 */
+		PCI_VDEVICE(INTEL, 0x24d6),
+		.driver_data = DEVICE_INTEL,
+	}, {
+		/* ICH6 */
+		PCI_VDEVICE(INTEL, 0x266d),
+		.driver_data = DEVICE_INTEL,
+	}, {
+		/* ICH7 */
+		PCI_VDEVICE(INTEL, 0x27dd),
+		.driver_data = DEVICE_INTEL,
+	}, {
+		/* 440MX */
+		PCI_VDEVICE(INTEL, 0x7196),
+		.driver_data = DEVICE_INTEL,
+	}, {
+		/* AMD768 */
+		PCI_VDEVICE(AMD, 0x7446),
+		.driver_data = DEVICE_INTEL,
+	}, {
+		/* SI7013 */
+		PCI_VDEVICE(SI, 0x7013),
+		.driver_data = DEVICE_SIS,
+	}, {
+		/* NFORCE */
+		PCI_VDEVICE(NVIDIA, 0x01c1),
+		.driver_data = DEVICE_NFORCE,
+	}, {
+		/* NFORCE2 */
+		PCI_VDEVICE(NVIDIA, 0x0069),
+		.driver_data = DEVICE_NFORCE,
+	}, {
+		/* NFORCE2s */
+		PCI_VDEVICE(NVIDIA, 0x0089),
+		.driver_data = DEVICE_NFORCE,
+	}, {
+		/* NFORCE3 */
+		PCI_VDEVICE(NVIDIA, 0x00d9),
+		.driver_data = DEVICE_NFORCE,
+	}, {
+		/* AMD8111 */
+		PCI_VDEVICE(AMD, 0x746e),
+		.driver_data = DEVICE_INTEL
 #if 0
-	{ PCI_VDEVICE(AL, 0x5455), DEVICE_ALI },   /* Ali5455 */
+	}, {
+		/* Ali5455 */
+		PCI_VDEVICE(AL, 0x5455),
+		.driver_data = DEVICE_ALI,
 #endif
-	{ 0, }
+	},
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, snd_intel8x0m_ids);
diff --git a/sound/pci/maestro3.c b/sound/pci/maestro3.c
index 3353980d5cd8..dd45ffa171e1 100644
--- a/sound/pci/maestro3.c
+++ b/sound/pci/maestro3.c
@@ -779,23 +779,40 @@ struct snd_m3 {
  * pci ids
  */
 static const struct pci_device_id snd_m3_ids[] = {
-	{PCI_VENDOR_ID_ESS, PCI_DEVICE_ID_ESS_ALLEGRO_1, PCI_ANY_ID, PCI_ANY_ID,
-	 PCI_CLASS_MULTIMEDIA_AUDIO << 8, 0xffff00, 0},
-	{PCI_VENDOR_ID_ESS, PCI_DEVICE_ID_ESS_ALLEGRO, PCI_ANY_ID, PCI_ANY_ID,
-	 PCI_CLASS_MULTIMEDIA_AUDIO << 8, 0xffff00, 0},
-	{PCI_VENDOR_ID_ESS, PCI_DEVICE_ID_ESS_CANYON3D_2LE, PCI_ANY_ID, PCI_ANY_ID,
-	 PCI_CLASS_MULTIMEDIA_AUDIO << 8, 0xffff00, 0},
-	{PCI_VENDOR_ID_ESS, PCI_DEVICE_ID_ESS_CANYON3D_2, PCI_ANY_ID, PCI_ANY_ID,
-	 PCI_CLASS_MULTIMEDIA_AUDIO << 8, 0xffff00, 0},
-	{PCI_VENDOR_ID_ESS, PCI_DEVICE_ID_ESS_MAESTRO3, PCI_ANY_ID, PCI_ANY_ID,
-	 PCI_CLASS_MULTIMEDIA_AUDIO << 8, 0xffff00, 0},
-	{PCI_VENDOR_ID_ESS, PCI_DEVICE_ID_ESS_MAESTRO3_1, PCI_ANY_ID, PCI_ANY_ID,
-	 PCI_CLASS_MULTIMEDIA_AUDIO << 8, 0xffff00, 0},
-	{PCI_VENDOR_ID_ESS, PCI_DEVICE_ID_ESS_MAESTRO3_HW, PCI_ANY_ID, PCI_ANY_ID,
-	 PCI_CLASS_MULTIMEDIA_AUDIO << 8, 0xffff00, 0},
-	{PCI_VENDOR_ID_ESS, PCI_DEVICE_ID_ESS_MAESTRO3_2, PCI_ANY_ID, PCI_ANY_ID,
-	 PCI_CLASS_MULTIMEDIA_AUDIO << 8, 0xffff00, 0},
-	{0,},
+	{
+		PCI_DEVICE(PCI_VENDOR_ID_ESS, PCI_DEVICE_ID_ESS_ALLEGRO_1),
+		.class = PCI_CLASS_MULTIMEDIA_AUDIO << 8,
+		.class_mask = 0xffff00,
+	}, {
+		PCI_DEVICE(PCI_VENDOR_ID_ESS, PCI_DEVICE_ID_ESS_ALLEGRO),
+		.class = PCI_CLASS_MULTIMEDIA_AUDIO << 8,
+		.class_mask = 0xffff00,
+	}, {
+		PCI_DEVICE(PCI_VENDOR_ID_ESS, PCI_DEVICE_ID_ESS_CANYON3D_2LE),
+		.class = PCI_CLASS_MULTIMEDIA_AUDIO << 8,
+		.class_mask = 0xffff00,
+	}, {
+		PCI_DEVICE(PCI_VENDOR_ID_ESS, PCI_DEVICE_ID_ESS_CANYON3D_2),
+		.class = PCI_CLASS_MULTIMEDIA_AUDIO << 8,
+		.class_mask = 0xffff00,
+	}, {
+		PCI_DEVICE(PCI_VENDOR_ID_ESS, PCI_DEVICE_ID_ESS_MAESTRO3),
+		.class = PCI_CLASS_MULTIMEDIA_AUDIO << 8,
+		.class_mask = 0xffff00,
+	}, {
+		PCI_DEVICE(PCI_VENDOR_ID_ESS, PCI_DEVICE_ID_ESS_MAESTRO3_1),
+		.class = PCI_CLASS_MULTIMEDIA_AUDIO << 8,
+		.class_mask = 0xffff00,
+	}, {
+		PCI_DEVICE(PCI_VENDOR_ID_ESS, PCI_DEVICE_ID_ESS_MAESTRO3_HW),
+		.class = PCI_CLASS_MULTIMEDIA_AUDIO << 8,
+		.class_mask = 0xffff00,
+	}, {
+		PCI_DEVICE(PCI_VENDOR_ID_ESS, PCI_DEVICE_ID_ESS_MAESTRO3_2),
+		.class = PCI_CLASS_MULTIMEDIA_AUDIO << 8,
+		.class_mask = 0xffff00,
+	},
+	{ },
 };
 
 MODULE_DEVICE_TABLE(pci, snd_m3_ids);
diff --git a/sound/pci/mixart/mixart.c b/sound/pci/mixart/mixart.c
index a7760a23bfe9..f451554cff5f 100644
--- a/sound/pci/mixart/mixart.c
+++ b/sound/pci/mixart/mixart.c
@@ -48,8 +48,8 @@ MODULE_PARM_DESC(enable, "Enable Digigram " CARD_NAME " soundcard.");
  */
 
 static const struct pci_device_id snd_mixart_ids[] = {
-	{ PCI_VDEVICE(MOTOROLA, 0x0003), 0, }, /* MC8240 */
-	{ 0, }
+	{ PCI_VDEVICE(MOTOROLA, 0x0003) }, /* MC8240 */
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, snd_mixart_ids);
diff --git a/sound/pci/nm256/nm256.c b/sound/pci/nm256/nm256.c
index da74b923bc88..a7da55d9c025 100644
--- a/sound/pci/nm256/nm256.c
+++ b/sound/pci/nm256/nm256.c
@@ -245,10 +245,10 @@ struct nm256 {
  * PCI ids
  */
 static const struct pci_device_id snd_nm256_ids[] = {
-	{PCI_VDEVICE(NEOMAGIC, PCI_DEVICE_ID_NEOMAGIC_NM256AV_AUDIO), 0},
-	{PCI_VDEVICE(NEOMAGIC, PCI_DEVICE_ID_NEOMAGIC_NM256ZX_AUDIO), 0},
-	{PCI_VDEVICE(NEOMAGIC, PCI_DEVICE_ID_NEOMAGIC_NM256XL_PLUS_AUDIO), 0},
-	{0,},
+	{ PCI_VDEVICE(NEOMAGIC, PCI_DEVICE_ID_NEOMAGIC_NM256AV_AUDIO) },
+	{ PCI_VDEVICE(NEOMAGIC, PCI_DEVICE_ID_NEOMAGIC_NM256ZX_AUDIO) },
+	{ PCI_VDEVICE(NEOMAGIC, PCI_DEVICE_ID_NEOMAGIC_NM256XL_PLUS_AUDIO) },
+	{ },
 };
 
 MODULE_DEVICE_TABLE(pci, snd_nm256_ids);
diff --git a/sound/pci/pcxhr/pcxhr.c b/sound/pci/pcxhr/pcxhr.c
index e7d63972c2ca..1eea40e94c43 100644
--- a/sound/pci/pcxhr/pcxhr.c
+++ b/sound/pci/pcxhr/pcxhr.c
@@ -89,41 +89,41 @@ enum {
 };
 
 static const struct pci_device_id pcxhr_ids[] = {
-	{ 0x10b5, 0x9656, 0x1369, 0xb001, 0, 0, PCI_ID_VX882HR, },
-	{ 0x10b5, 0x9656, 0x1369, 0xb101, 0, 0, PCI_ID_PCX882HR, },
-	{ 0x10b5, 0x9656, 0x1369, 0xb201, 0, 0, PCI_ID_VX881HR, },
-	{ 0x10b5, 0x9656, 0x1369, 0xb301, 0, 0, PCI_ID_PCX881HR, },
-	{ 0x10b5, 0x9056, 0x1369, 0xb021, 0, 0, PCI_ID_VX882E, },
-	{ 0x10b5, 0x9056, 0x1369, 0xb121, 0, 0, PCI_ID_PCX882E, },
-	{ 0x10b5, 0x9056, 0x1369, 0xb221, 0, 0, PCI_ID_VX881E, },
-	{ 0x10b5, 0x9056, 0x1369, 0xb321, 0, 0, PCI_ID_PCX881E, },
-	{ 0x10b5, 0x9656, 0x1369, 0xb401, 0, 0, PCI_ID_VX1222HR, },
-	{ 0x10b5, 0x9656, 0x1369, 0xb501, 0, 0, PCI_ID_PCX1222HR, },
-	{ 0x10b5, 0x9656, 0x1369, 0xb601, 0, 0, PCI_ID_VX1221HR, },
-	{ 0x10b5, 0x9656, 0x1369, 0xb701, 0, 0, PCI_ID_PCX1221HR, },
-	{ 0x10b5, 0x9056, 0x1369, 0xb421, 0, 0, PCI_ID_VX1222E, },
-	{ 0x10b5, 0x9056, 0x1369, 0xb521, 0, 0, PCI_ID_PCX1222E, },
-	{ 0x10b5, 0x9056, 0x1369, 0xb621, 0, 0, PCI_ID_VX1221E, },
-	{ 0x10b5, 0x9056, 0x1369, 0xb721, 0, 0, PCI_ID_PCX1221E, },
-	{ 0x10b5, 0x9056, 0x1369, 0xba01, 0, 0, PCI_ID_VX222HR, },
-	{ 0x10b5, 0x9056, 0x1369, 0xba21, 0, 0, PCI_ID_VX222E, },
-	{ 0x10b5, 0x9056, 0x1369, 0xbd01, 0, 0, PCI_ID_PCX22HR, },
-	{ 0x10b5, 0x9056, 0x1369, 0xbd21, 0, 0, PCI_ID_PCX22E, },
-	{ 0x10b5, 0x9056, 0x1369, 0xbc01, 0, 0, PCI_ID_VX222HRMIC, },
-	{ 0x10b5, 0x9056, 0x1369, 0xbc21, 0, 0, PCI_ID_VX222E_MIC, },
-	{ 0x10b5, 0x9056, 0x1369, 0xbb01, 0, 0, PCI_ID_PCX924HR, },
-	{ 0x10b5, 0x9056, 0x1369, 0xbb21, 0, 0, PCI_ID_PCX924E, },
-	{ 0x10b5, 0x9056, 0x1369, 0xbf01, 0, 0, PCI_ID_PCX924HRMIC, },
-	{ 0x10b5, 0x9056, 0x1369, 0xbf21, 0, 0, PCI_ID_PCX924E_MIC, },
-	{ 0x10b5, 0x9656, 0x1369, 0xd001, 0, 0, PCI_ID_VX442HR, },
-	{ 0x10b5, 0x9656, 0x1369, 0xd101, 0, 0, PCI_ID_PCX442HR, },
-	{ 0x10b5, 0x9056, 0x1369, 0xd021, 0, 0, PCI_ID_VX442E, },
-	{ 0x10b5, 0x9056, 0x1369, 0xd121, 0, 0, PCI_ID_PCX442E, },
-	{ 0x10b5, 0x9656, 0x1369, 0xd201, 0, 0, PCI_ID_VX822HR, },
-	{ 0x10b5, 0x9656, 0x1369, 0xd301, 0, 0, PCI_ID_PCX822HR, },
-	{ 0x10b5, 0x9056, 0x1369, 0xd221, 0, 0, PCI_ID_VX822E, },
-	{ 0x10b5, 0x9056, 0x1369, 0xd321, 0, 0, PCI_ID_PCX822E, },
-	{ 0, }
+	{ PCI_DEVICE_SUB(0x10b5, 0x9656, 0x1369, 0xb001), .driver_data = PCI_ID_VX882HR },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9656, 0x1369, 0xb101), .driver_data = PCI_ID_PCX882HR },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9656, 0x1369, 0xb201), .driver_data = PCI_ID_VX881HR },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9656, 0x1369, 0xb301), .driver_data = PCI_ID_PCX881HR },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9056, 0x1369, 0xb021), .driver_data = PCI_ID_VX882E },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9056, 0x1369, 0xb121), .driver_data = PCI_ID_PCX882E },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9056, 0x1369, 0xb221), .driver_data = PCI_ID_VX881E },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9056, 0x1369, 0xb321), .driver_data = PCI_ID_PCX881E },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9656, 0x1369, 0xb401), .driver_data = PCI_ID_VX1222HR },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9656, 0x1369, 0xb501), .driver_data = PCI_ID_PCX1222HR },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9656, 0x1369, 0xb601), .driver_data = PCI_ID_VX1221HR },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9656, 0x1369, 0xb701), .driver_data = PCI_ID_PCX1221HR },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9056, 0x1369, 0xb421), .driver_data = PCI_ID_VX1222E },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9056, 0x1369, 0xb521), .driver_data = PCI_ID_PCX1222E },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9056, 0x1369, 0xb621), .driver_data = PCI_ID_VX1221E },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9056, 0x1369, 0xb721), .driver_data = PCI_ID_PCX1221E },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9056, 0x1369, 0xba01), .driver_data = PCI_ID_VX222HR },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9056, 0x1369, 0xba21), .driver_data = PCI_ID_VX222E },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9056, 0x1369, 0xbd01), .driver_data = PCI_ID_PCX22HR },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9056, 0x1369, 0xbd21), .driver_data = PCI_ID_PCX22E },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9056, 0x1369, 0xbc01), .driver_data = PCI_ID_VX222HRMIC },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9056, 0x1369, 0xbc21), .driver_data = PCI_ID_VX222E_MIC },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9056, 0x1369, 0xbb01), .driver_data = PCI_ID_PCX924HR },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9056, 0x1369, 0xbb21), .driver_data = PCI_ID_PCX924E },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9056, 0x1369, 0xbf01), .driver_data = PCI_ID_PCX924HRMIC },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9056, 0x1369, 0xbf21), .driver_data = PCI_ID_PCX924E_MIC },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9656, 0x1369, 0xd001), .driver_data = PCI_ID_VX442HR },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9656, 0x1369, 0xd101), .driver_data = PCI_ID_PCX442HR },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9056, 0x1369, 0xd021), .driver_data = PCI_ID_VX442E },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9056, 0x1369, 0xd121), .driver_data = PCI_ID_PCX442E },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9656, 0x1369, 0xd201), .driver_data = PCI_ID_VX822HR },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9656, 0x1369, 0xd301), .driver_data = PCI_ID_PCX822HR },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9056, 0x1369, 0xd221), .driver_data = PCI_ID_VX822E },
+	{ PCI_DEVICE_SUB(0x10b5, 0x9056, 0x1369, 0xd321), .driver_data = PCI_ID_PCX822E },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, pcxhr_ids);
diff --git a/sound/pci/rme32.c b/sound/pci/rme32.c
index ca9bbf554650..454a30a2c07e 100644
--- a/sound/pci/rme32.c
+++ b/sound/pci/rme32.c
@@ -211,10 +211,10 @@ struct rme32 {
 };
 
 static const struct pci_device_id snd_rme32_ids[] = {
-	{PCI_VDEVICE(XILINX_RME, PCI_DEVICE_ID_RME_DIGI32), 0,},
-	{PCI_VDEVICE(XILINX_RME, PCI_DEVICE_ID_RME_DIGI32_8), 0,},
-	{PCI_VDEVICE(XILINX_RME, PCI_DEVICE_ID_RME_DIGI32_PRO), 0,},
-	{0,}
+	{ PCI_VDEVICE(XILINX_RME, PCI_DEVICE_ID_RME_DIGI32) },
+	{ PCI_VDEVICE(XILINX_RME, PCI_DEVICE_ID_RME_DIGI32_8) },
+	{ PCI_VDEVICE(XILINX_RME, PCI_DEVICE_ID_RME_DIGI32_PRO) },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, snd_rme32_ids);
diff --git a/sound/pci/rme96.c b/sound/pci/rme96.c
index 58b8ebf1a24e..892fcc598557 100644
--- a/sound/pci/rme96.c
+++ b/sound/pci/rme96.c
@@ -242,11 +242,11 @@ struct rme96 {
 };
 
 static const struct pci_device_id snd_rme96_ids[] = {
-	{ PCI_VDEVICE(XILINX, PCI_DEVICE_ID_RME_DIGI96), 0, },
-	{ PCI_VDEVICE(XILINX, PCI_DEVICE_ID_RME_DIGI96_8), 0, },
-	{ PCI_VDEVICE(XILINX, PCI_DEVICE_ID_RME_DIGI96_8_PRO), 0, },
-	{ PCI_VDEVICE(XILINX, PCI_DEVICE_ID_RME_DIGI96_8_PAD_OR_PST), 0, },
-	{ 0, }
+	{ PCI_VDEVICE(XILINX, PCI_DEVICE_ID_RME_DIGI96) },
+	{ PCI_VDEVICE(XILINX, PCI_DEVICE_ID_RME_DIGI96_8) },
+	{ PCI_VDEVICE(XILINX, PCI_DEVICE_ID_RME_DIGI96_8_PRO) },
+	{ PCI_VDEVICE(XILINX, PCI_DEVICE_ID_RME_DIGI96_8_PAD_OR_PST) },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, snd_rme96_ids);
diff --git a/sound/pci/sonicvibes.c b/sound/pci/sonicvibes.c
index a4c72799d034..a885d544acd6 100644
--- a/sound/pci/sonicvibes.c
+++ b/sound/pci/sonicvibes.c
@@ -227,8 +227,8 @@ struct sonicvibes {
 };
 
 static const struct pci_device_id snd_sonic_ids[] = {
-	{ PCI_VDEVICE(S3, 0xca00), 0, },
-        { 0, }
+	{ PCI_VDEVICE(S3, 0xca00) },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, snd_sonic_ids);
diff --git a/sound/pci/trident/trident.c b/sound/pci/trident/trident.c
index ddb6ccc72e44..8dcbd022ca1f 100644
--- a/sound/pci/trident/trident.c
+++ b/sound/pci/trident/trident.c
@@ -36,12 +36,16 @@ module_param_array(wavetable_size, int, NULL, 0444);
 MODULE_PARM_DESC(wavetable_size, "Maximum memory size in kB for wavetable synth.");
 
 static const struct pci_device_id snd_trident_ids[] = {
-	{PCI_DEVICE(PCI_VENDOR_ID_TRIDENT, PCI_DEVICE_ID_TRIDENT_4DWAVE_DX), 
-		PCI_CLASS_MULTIMEDIA_AUDIO << 8, 0xffff00, 0},
-	{PCI_DEVICE(PCI_VENDOR_ID_TRIDENT, PCI_DEVICE_ID_TRIDENT_4DWAVE_NX), 
-		0, 0, 0},
-	{PCI_DEVICE(PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_7018), 0, 0, 0},
-	{ 0, }
+	{
+		PCI_DEVICE(PCI_VENDOR_ID_TRIDENT, PCI_DEVICE_ID_TRIDENT_4DWAVE_DX),
+		.class = PCI_CLASS_MULTIMEDIA_AUDIO << 8,
+		.class_mask = 0xffff00,
+	}, {
+		PCI_DEVICE(PCI_VENDOR_ID_TRIDENT, PCI_DEVICE_ID_TRIDENT_4DWAVE_NX),
+	}, {
+		PCI_DEVICE(PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_7018)
+	},
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, snd_trident_ids);
diff --git a/sound/pci/via82xx.c b/sound/pci/via82xx.c
index 41b322fbd9ef..24ee1302f27d 100644
--- a/sound/pci/via82xx.c
+++ b/sound/pci/via82xx.c
@@ -389,10 +389,10 @@ struct via82xx {
 
 static const struct pci_device_id snd_via82xx_ids[] = {
 	/* 0x1106, 0x3058 */
-	{ PCI_VDEVICE(VIA, PCI_DEVICE_ID_VIA_82C686_5), TYPE_CARD_VIA686, },	/* 686A */
+	{ PCI_VDEVICE(VIA, PCI_DEVICE_ID_VIA_82C686_5), .driver_data = TYPE_CARD_VIA686 },	/* 686A */
 	/* 0x1106, 0x3059 */
-	{ PCI_VDEVICE(VIA, PCI_DEVICE_ID_VIA_8233_5), TYPE_CARD_VIA8233, },	/* VT8233 */
-	{ 0, }
+	{ PCI_VDEVICE(VIA, PCI_DEVICE_ID_VIA_8233_5), .driver_data = TYPE_CARD_VIA8233 },	/* VT8233 */
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, snd_via82xx_ids);
diff --git a/sound/pci/via82xx_modem.c b/sound/pci/via82xx_modem.c
index a6f176d612e3..9b84d3fb9eaf 100644
--- a/sound/pci/via82xx_modem.c
+++ b/sound/pci/via82xx_modem.c
@@ -246,8 +246,8 @@ struct via82xx_modem {
 };
 
 static const struct pci_device_id snd_via82xx_modem_ids[] = {
-	{ PCI_VDEVICE(VIA, 0x3068), TYPE_CARD_VIA82XX_MODEM, },
-	{ 0, }
+	{ PCI_VDEVICE(VIA, 0x3068), .driver_data = TYPE_CARD_VIA82XX_MODEM },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, snd_via82xx_modem_ids);
diff --git a/sound/pci/vx222/vx222.c b/sound/pci/vx222/vx222.c
index 693a4e471cf7..0b89ca859e66 100644
--- a/sound/pci/vx222/vx222.c
+++ b/sound/pci/vx222/vx222.c
@@ -47,9 +47,9 @@ enum {
 };
 
 static const struct pci_device_id snd_vx222_ids[] = {
-	{ 0x10b5, 0x9050, 0x1369, PCI_ANY_ID, 0, 0, VX_PCI_VX222_OLD, },   /* PLX */
-	{ 0x10b5, 0x9030, 0x1369, PCI_ANY_ID, 0, 0, VX_PCI_VX222_NEW, },   /* PLX */
-	{ 0, }
+	{ PCI_DEVICE_SUB(0x10b5, 0x9050, 0x1369, PCI_ANY_ID), .driver_data = VX_PCI_VX222_OLD },   /* PLX */
+	{ PCI_DEVICE_SUB(0x10b5, 0x9030, 0x1369, PCI_ANY_ID), .driver_data = VX_PCI_VX222_NEW },   /* PLX */
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, snd_vx222_ids);
diff --git a/sound/pci/ymfpci/ymfpci.c b/sound/pci/ymfpci/ymfpci.c
index 764ca59e98d1..d3fb047c9a45 100644
--- a/sound/pci/ymfpci/ymfpci.c
+++ b/sound/pci/ymfpci/ymfpci.c
@@ -46,13 +46,13 @@ module_param_array(rear_switch, bool, NULL, 0444);
 MODULE_PARM_DESC(rear_switch, "Enable shared rear/line-in switch");
 
 static const struct pci_device_id snd_ymfpci_ids[] = {
-	{ PCI_VDEVICE(YAMAHA, 0x0004), 0, },   /* YMF724 */
-	{ PCI_VDEVICE(YAMAHA, 0x000d), 0, },   /* YMF724F */
-	{ PCI_VDEVICE(YAMAHA, 0x000a), 0, },   /* YMF740 */
-	{ PCI_VDEVICE(YAMAHA, 0x000c), 0, },   /* YMF740C */
-	{ PCI_VDEVICE(YAMAHA, 0x0010), 0, },   /* YMF744 */
-	{ PCI_VDEVICE(YAMAHA, 0x0012), 0, },   /* YMF754 */
-	{ 0, }
+	{ PCI_VDEVICE(YAMAHA, 0x0004) },   /* YMF724 */
+	{ PCI_VDEVICE(YAMAHA, 0x000d) },   /* YMF724F */
+	{ PCI_VDEVICE(YAMAHA, 0x000a) },   /* YMF740 */
+	{ PCI_VDEVICE(YAMAHA, 0x000c) },   /* YMF740C */
+	{ PCI_VDEVICE(YAMAHA, 0x0010) },   /* YMF744 */
+	{ PCI_VDEVICE(YAMAHA, 0x0012) },   /* YMF754 */
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, snd_ymfpci_ids);
-- 
2.47.3

