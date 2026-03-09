Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7475626C3B0
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 02:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773022931; cv=none; b=AwLv1bmabUTKnv2/V7RSONn6B8iUX6+lp0tz+VTxC4PL0lt4YNxfGXe9EVuJlC/AdWaMW/vGHLVvmnqpXjPtZj6Vq7ElwiQV72oihzIFRF1g7RlGDTEwQWbHAK84z88K/vPK9o/ZRUx/cerqcqyLvGUn4zweTx1xRDSwEbRwjNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773022931; c=relaxed/simple;
	bh=Sd/a1tIrlW5D639vCZPgs3bP/bIsPojyJrmCK2WuUNs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cIwhZxqOmJ2/DRJg+LsiTMfZShQTCkTy4sW2C/fE9NDz5fpOfTXKXOsgGJzIQ0pp2w7bZmeoHnrEXWU084yN2ssVAIAwa2Ggf/THanCVV2AVqH4n/eXk0YYpK3WoXostBALcfOALEFuXBxawKchKB6stiMb/anW3PdaDXqVdB1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q9M4McOW; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q9M4McOW"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2ae467f128fso74848065ad.1
        for <linux-sound@vger.kernel.org>; Sun, 08 Mar 2026 19:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773022930; x=1773627730; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G9r4lEyM4jHyROCAg8WVXHBssWIr19tUvRwLbPd6TH8=;
        b=q9M4McOWFE1NqiAcJd5eFKHH0sKHMF0Mq7NkvBaImGhSs8nhthpo0J49TEHtP71HKa
         heJ7DWsDHRIjSeHVHQO43Wb48ycj/6l2x21XLGygAapm/LSNWPZbzA9eWF7TKvcvcC/M
         B1PABk+duo8BAAGTfpkrSX8VMI1QiXeabux9zYM7G9u7ngXzeMzSe2JqWe3rmUG0lUPy
         ga7ufXPWu257DUSQCSaIbYFqN0O5WkVrxxDImNt5wGN9/AEJdJ2u/ShoG6cHTBAgI2Cu
         +y0eNG6Wcd0aIrTCz610cwGpV4kDWALSi7NA/NBDaTu00xXj6Xq029aYhu/4Ri0nQQR4
         c9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773022930; x=1773627730;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G9r4lEyM4jHyROCAg8WVXHBssWIr19tUvRwLbPd6TH8=;
        b=EXRORXReeD0iK9DfQv2IZsF9YOsOJgm48yZGPhHoifXnX9FLnM+UzNPL8M9miUjcUL
         MJRjANTcRPr3U1MWgQGLPMW8aJ78V9tPFcVCxYFvUcR3STN5hSEQvjAC/AjqRxmaUVWK
         zAwjTEf7V2LAPm6cyDJSdH0x2i0lFmFqxIc1YC0bZo+Eq8j8ZsvQT4llqSlC42/NNlzX
         TlxF0q1IkpTSOuVM6DirPyz817+tZLBrObSV6HmsCVxy2vrh9or/vgALNkvqTqk6ssZ9
         b7hNfmfBTzzjaQN3crQPEqc1qgp8/o53nWhzuCo+y8bicgOL15E1TRa2tSl1dju22gK7
         H7jw==
X-Forwarded-Encrypted: i=1; AJvYcCXcDy3Wz99gcmwlExpezR1C4hN53rCJcOwkk/XPOif0oBfppZ+V1k1vwIeOY+euumXf6Fcvx112sKw2CQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrT4oGJlQYH9y4kJgzkVClkevs1hQE7HKTwyDoLRr7PRJpS8E6
	We/I5JjyHYg4TU0hnXstZuIal5KqFk3OV7ODyMq0ipTabOsQ4dyqdGAKW58UWzSeYV2nl58hn5p
	2BLN7LXP1fM5Sz12ZNA==
X-Received: from plbkb15.prod.google.com ([2002:a17:903:338f:b0:2aa:ed18:fbb1])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e549:b0:2ae:6d9e:ed5a with SMTP id d9443c01a7336-2ae82439431mr88558145ad.13.1773022929572;
 Sun, 08 Mar 2026 19:22:09 -0700 (PDT)
Date: Mon,  9 Mar 2026 02:22:03 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260309022205.28136-1-guanyulin@google.com>
Subject: [PATCH v2 0/2] usb: offload: Decouple interrupter lifecycle and
 refactor usage tracking
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, perex@perex.cz, 
	tiwai@suse.com, quic_wcheng@quicinc.com, broonie@kernel.org, arnd@arndb.de, 
	christophe.jaillet@wanadoo.fr, xiaopei01@kylinos.cn, 
	wesley.cheng@oss.qualcomm.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"

The current USB offload implementation couples the allocation of xHCI
sideband interrupters with the device's offload usage counter. This
coupling is conceptually incorrect, as hardware resource availability
and power management state serve distinct purposes.

This series decouples these mechanisms by removing the usage counting
logic from the xHCI sideband layer and shifting the responsibility
to the consumer drivers. This allows interrupters to be managed
independently of the device's active offload status.

Furthermore, this refactoring addresses a recursive locking issue.
When a USB device is disconnected, the USB core invokes the driver's
disconnect callback while holding the udev device lock. Previously,
the xHCI sideband layer would call usb_offload_put(), which
attempted to re-acquire the same udev lock, resulting in a deadlock.

By shifting lock acquisition responsibility to the upper-level USB
driver, we ensure that offload usage updates can be safely performed
from contexts where the lock is already held. This standardizes the
lock hierarchy and prevents potential deadlocks during teardown.

Patch 1 performs the core refactoring by updating the offload APIs
to require caller-held device locks and removing implicit usage
counting from the interrupter paths.

Patch 2 updates the Qualcomm USB audio offload driver to explicitly
manage the usage counter during its stream lifecycle, serving as a
derivative consumer of the new API contract. This also ensures the
device remains active during playback, preventing premature
autosuspend.

---
Changes in v2:
- Collect the <Tested-by> tag from the OPPO team
- Link to v1: https://lore.kernel.org/all/20260225064601.270301-1-guanyulin@google.com/

Changes in v1:
- Fix build error when building sound/usb/qcom/qc_audio_offload.o
- Link to RFC v2: https://lore.kernel.org/all/20260213100736.2914690-1-guanyulin@google.com/

Changes in RFC v2:
- Move device locking to callers 
- Decouple sideband from offload counting.
- Link to RFC v1: https://lore.kernel.org/all/20260130074746.287750-1-guanyulin@google.com/
---
Guan-Yu Lin (2):
  usb: offload: move device locking to callers in offload.c
  ALSA: usb: qcom: manage offload device usage

 drivers/usb/core/offload.c        |  34 ++++------
 drivers/usb/host/xhci-sideband.c  |  14 +---
 sound/usb/qcom/qc_audio_offload.c | 102 ++++++++++++++++++------------
 3 files changed, 73 insertions(+), 77 deletions(-)

-- 
2.53.0.473.g4a7958ca14-goog

