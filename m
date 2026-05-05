Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6D93859DE
	for <linux-sound@vger.kernel.org>; Tue,  5 May 2026 11:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777979924; cv=none; b=EKpeXDvVBSgoUWn4R1/18lyVapTXRzcFXEckLe3Xd3zkMBlE9VHrQBTNmwg5j4XHflzBuN8aJHPSqqQ4Bqetgo5gspyJYCSBwi9GvldohHOfaYA3pk9WLnS00/nhLmGbjhNyyc9no5hdA6WuW16QH3iClv9i8rr/rEF6tK1Wu5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777979924; c=relaxed/simple;
	bh=goTqNX4LIT0yuiv/ihZXreJ6jCrxDpey8ywhTwK7eI4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k3uZqOUERRyeVnZwZD6E0CeAUNrtVa6mhf8RMO6XC4Ojh+l2hp7Z7MQYUjrrYG9hzh4jiD+38aDUqmY5fmnGQfl9MDdaHjVp9aIjNsYNo3PnVU38U997IUuhFfqIUr64X8fm9WIu2kCjpa5uLSXyCgrgRumTThLAbBAN+TzDmLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2RyVsO+; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2RyVsO+"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12c88e5f4aeso2946866c88.0
        for <linux-sound@vger.kernel.org>; Tue, 05 May 2026 04:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777979922; x=1778584722; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eMDieuGvwMdUNo4lHwtE/hWCLLdhMWURBnkYQ/fDr68=;
        b=P2RyVsO+1fESbSzF5RBCsUh2CfR0+NVd0DEW7rvm5kWpCOypLxbS0TNzAur70qdY4W
         d9rLRGHv8PsDeoGf/thxF+Cv6ozHoTtdkJSIdDxCN9/C9ueuVwudieOig1oSD/gKSaz+
         LJV6vpdkhLIhwOVj/stgkpiwdRKqVc9IrZkDdc32AUmtClpATdPuIdfvtAWJroEkOKtW
         YF5mOQ2OVQ2Q0kdB6pfYJmiGDuGLLSyjooFuGgvLmlL7lRe2j3MsutuErnfMLWPXxWkf
         lyjQIJMo6cdAmqU+Wv9HSxTUX2Dldm75bjZL9MhMhDbher5Ng9vdIqc9x9nN4L0PwMRo
         lgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777979922; x=1778584722;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMDieuGvwMdUNo4lHwtE/hWCLLdhMWURBnkYQ/fDr68=;
        b=Sonh+qFNDtyr9THNGpsCjGZVHHvogXG8vChN/rbW9VCoWxqfDb6ZuHZIh4RtQ2XIXb
         lYwn24+Rdedeh9pglUTwWLlZ/KsWq7x0oQ4aJKN+ObZXL2/+kFkY9LRgGjYGqNLHTNzz
         2Utlx/xy9cGNA+9KZGakCadgoV7zsR9FoJPVvhlaMeD5sQaOHPasVhYv9jIArXEAGRIb
         vRZXGIeNVgjvVUMTMZxWq6KPhT0JgP1AUGdBpqQfy972StShe/N+DtGBIeWH3Me6KWB8
         21cifqIbfymt63msMGBpzeuX15/ISPiE5fmMX70FEC6oNTNR2PBNocv40iWDwrHB1+c+
         rLBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/NlINmBkCdqbESXGXpBDPZ1LbJHofQZgsfFlCBDk008HKYjPHLs5Bxd6twk4VBlFTzx6PbEHD7dBGCLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDNV/frNpEFc5RxTN+wlWSSDB1yCzXHd0pEmCUlzDjbgt1Kg7Y
	9DVj7TkQynRNtoB3+7dWXQCTD3QP6+HXHrti5jCsU4iRSuQl93nFHy9s
X-Gm-Gg: AeBDietc7cdWg7MA+XGtaGqDCIX0uPfSRA/w5QNywdPXI22Dna9V2PBwNAtA/M6jVXs
	WedcT78S8uPNoHut2jd0RR3p4cd3SrHlbp9bKpvrLtRZ+jSoPf6YlQ04YAEGYB5CbBcCW7wSEbv
	ptT+pozct/bMAZ5Cyn93E20s3v9jkzQaATPBLf/FBJfKM4sq2P5EDydfA0TvHnX2jiWSUuTi2Aj
	HNb2EA/YfssvTP9WLOjEh7xsUUhwzBasG9W0xbksRvaf9gvcsA/dpnz3JvdcYJMoSdyVNKycf3e
	SpWmWkOTuTSpG6hdBFDanV6F7wMBiu85JCCVoVjJFIrJLZVFBOyaWv+quAA7Lxr9NpAEdCbGLIE
	1MySQMoPzUhaW2o0wKTKYkyBZ2/By12l1UP+aHsjbgX+JNczmToJ5Lhn8klWOpoeUgLDukgq0iu
	lpzEpF0ERTbVejwlQEocgBuilzS/ASxmvAhlTCctMqUJfZ2GkyDVZKraoCVeeIZgYLwNjYWUMIo
	nj5y3MCUiOA
X-Received: by 2002:a05:7022:22b:b0:12d:b8e5:5e2 with SMTP id a92af1059eb24-130a9ff69abmr1380445c88.23.1777979921750;
        Tue, 05 May 2026 04:18:41 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df828849dsm17247290c88.5.2026.05.05.04.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 04:18:41 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH v4 0/2] firmware_loader/ALSA: Fix TAS2781 async firmware
 teardown
Date: Tue, 05 May 2026 08:18:15 -0300
Message-Id: <20260505-alsa-hda-tas2781-fw-callback-teardown-v4-0-e7c4bf930dc8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/52QzW7CMBAGXwX53EX+I3Y48R5VD7u2Q9yGBNmpK
 UJ5dxKoVMQJ9TjSp5nVXlgOKYbMtqsLS6HEHId+Bv22Yq7Ffh8g+pmZ5LLiWgrALiO0HmHELI0
 V0JzAYdcRui8YAyY/nHpQZCrNNVEtLZtdxxSa+HPrvH/cOX/TZ3DjIl8WbczjkM63Q4pYdr9Nx
 V9sFgECrNGqMr4iLWi3P2Ds1m44sKVZ5L+sEjhIZ7ytHSlhNs9W9Wfd8Ff/U9Rstb5urFFUG/K
 P1mmarlJRyX+YAQAA
X-Change-ID: 20260421-alsa-hda-tas2781-fw-callback-teardown-3b76404bb928
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2860;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=goTqNX4LIT0yuiv/ihZXreJ6jCrxDpey8ywhTwK7eI4=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJk/L/FWz9tzskQ32vnFwVcbV9V5fdOWOqXwJ+HXjsWnB
 JnnCy5K7yhlYRDjYpAVU2RZnbTIck/Xg6v1cSs8YOawMoEMYeDiFICJLLJi+CuVVvnHUu+YptHZ
 h45zmIU5z+T68Ga2W/yOmvDkQHuNbD4jw40DnEvcnc14zh34tHaug2DAwxO8tzd3hSR0vJ2Q7PB
 PmB8A
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

TAS2781 HDA I2C and SPI queue RCA firmware loading with
request_firmware_nowait() during component bind. The firmware loader
keeps the callback module pinned and holds a device reference, but it
does not provide a way for drivers to cancel or synchronize the queued
callback before tearing down driver-private state.

Add a small firmware-loader helper to cancel or synchronize async firmware
requests, then use it from TAS2781 HDA unbind before controls and DSP state
are removed.

No hardware runtime test was available.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Changes in v4:
- Use spin_lock_irq() in the worker and cancel paths, which run from
  sleepable contexts.
- Fold kfree(fw_work) into firmware_work_free().
- Keep irqsave in the request path so GFP_ATOMIC callers do not depend on
  IRQ state assumptions.
- Link to v3: https://patch.msgid.link/20260501-alsa-hda-tas2781-fw-callback-teardown-v3-0-8d9f873b97bd@gmail.com

Changes in v3:
- Keep request_firmware_nowait() manually managed instead of making the
  existing API implicitly devres-managed.
- Track scheduled async firmware work in an internal list protected by a
  spinlock so request_firmware_nowait_cancel() can find and synchronize a
  pending request without weakening the GFP_ATOMIC caller contract.
- Match pending requests by device, callback context and callback function
  instead of matching by callback alone.
- Avoid the devres_add() / schedule_work() ordering race pointed out in
  review.
- Leave devres-managed support for a separate devm_request_firmware_nowait()
  API if needed.
- Link to v2: https://patch.msgid.link/20260430-alsa-hda-tas2781-fw-callback-teardown-v2-0-2c7d89cb3175@gmail.com

Changes in v2:
- Add request_firmware_nowait_cancel() in the firmware loader instead of
  tracking the callback lifetime locally in the TAS2781 HDA driver.
- Keep the TAS2781 change to a cancel/sync call in I2C and SPI unbind.
- Drop the unrelated cached kcontrol pointer cleanup from the previous
  local-driver version.
- Link to v1: https://patch.msgid.link/20260430-alsa-hda-tas2781-fw-callback-teardown-v1-1-874367d6b41b@gmail.com

---
Cássio Gabriel (2):
      firmware_loader: Add cancel helper for async requests
      ALSA: hda/tas2781: Cancel async firmware request at unbind

 drivers/base/firmware_loader/main.c            | 68 ++++++++++++++++++++++++--
 include/linux/firmware.h                       | 10 ++++
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c |  3 ++
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c |  3 ++
 4 files changed, 80 insertions(+), 4 deletions(-)
---
base-commit: 0d672ef050d4e1c3891c9944f72c85769978bbee
change-id: 20260421-alsa-hda-tas2781-fw-callback-teardown-3b76404bb928

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

