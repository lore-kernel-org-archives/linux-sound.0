Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214A92C0F6F
	for <linux-sound@vger.kernel.org>; Wed, 25 Feb 2026 06:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772001970; cv=none; b=btr4UBM6BUDRTRTNF4KhZ9uVdAlaSUgcwb6nqYxgOMY91Hgw5PB432rJws++QTcSZmwWL8aTCH0PNTvrendy0lLvdg5no9aPU+wlG69WM1nKRLgdsi4Xe93CTCPpQFJhVNp7PMrB2iN7GgGyhYA1RkBOkSSUFUF7JUTfVQ2JwD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772001970; c=relaxed/simple;
	bh=FcYnhA40wSm/6OIMnGZ+9dkPjQW2cki8snS/gC9NApM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QKG4IxJK5fz69SAEzLGG/IuUzRw5RgSxkImeBaLyhcktEkH0rIclI+d6PJvRXyNjLkivqoBQxlLNuYoVQAm26k8TYswpw7nhjQHcEoHEikXpXWbqM61mSHQ1xxIuiE+hPBcS7q3v3Ew1CwcCzou9I7mmUScCICb+1iNOF/54g9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LZGloXmg; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LZGloXmg"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-354c72d23dfso38133491a91.2
        for <linux-sound@vger.kernel.org>; Tue, 24 Feb 2026 22:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772001968; x=1772606768; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5csDQ2S42k5WJW49iQ3pOEtVJoAgPTcMFYf2ie1hhyA=;
        b=LZGloXmgiuYUf41tkaofOLdwMV7tYHGZzn+/DsrT34NcueoczBVfKbb6WzSK/B12cs
         X9HdWdvQRv758FCFYuCPa2CKJTrcfehLLpqQC5iF5YO2n/66imTK/lJSXLcWufsDMEUA
         5qBBPLnhPDN92eDCXbFGT6h/rjC/fUOPxQFp5P0nSZL3Lj5kaqXV7hLTZ2X3n9DjM5sa
         DDlN+K7e4eHoSSsT+XvXXjE0AQzMfZnyfRTIH5AGXceDux5c1X6dPvQr562laO0+XnVP
         b4WHG3Lhrkd4xQltHDvD6NtzIktYQRpzy7uoSWszixuHFJUZzETYlus949t9+KY5dbc5
         SsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772001968; x=1772606768;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5csDQ2S42k5WJW49iQ3pOEtVJoAgPTcMFYf2ie1hhyA=;
        b=oyAIlkzJR4SF4AKfUJvwcqF/8eJqgZNhhkB2CiNA92su6sBs4YWA8GffeMCok2+8Vg
         qUr/3cNmIb+Nd2ZYtTnPEnE3aotWv4f3bFwNpqz/I30GWsyTpkHIo3T4c6EQjKpt66SY
         0KTYtXjuT0LnJuRGiMjruIjJFyX25e9IuKHWAkd4Fy0MNU+cZgAsf+94KiCEsjWOkMSb
         cz5Wppl3DxtUQj+sC4NQAecCCHUQ5RKW943JYwZnhmqsOvV/8zvX5QeEOBULCCom0PKC
         n20jLNWh8qIL3e2UkqASdxnN2A5bfOg0aXRKG8SgigkkF02QuPmTzvkDb9aS6Fk0NeNZ
         9cEw==
X-Forwarded-Encrypted: i=1; AJvYcCX7LzXxICeqsczYuKyO5SpnAsR7q0MJUIJ7SLq6mOrcGwSjDtSA5a35gCa/7lZLycDANeOC3qfjjUVkoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFf9WAL4+ZxUHeYV02/VKZYYA5pVykq3tZ5cyJ1oi4HBecCTum
	6YBzv5KtYEJiYvyRD0BSB0JPrHrGt9sKV6sjR9/UHt9kDXrV9FDUsWL1NPgFYis1fm7yLzH3XCc
	2crabmdsj4ibG5zH0Xw==
X-Received: from pjbbv16.prod.google.com ([2002:a17:90a:f190:b0:352:de4e:4038])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1b43:b0:34a:a65e:e6ad with SMTP id 98e67ed59e1d1-358ae7e9f7fmr11623755a91.1.1772001968119;
 Tue, 24 Feb 2026 22:46:08 -0800 (PST)
Date: Wed, 25 Feb 2026 06:45:49 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260225064601.270301-1-guanyulin@google.com>
Subject: [PATCH v1 0/2] usb: offload: Decouple interrupter lifecycle and
 refactor usage tracking
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, perex@perex.cz, 
	tiwai@suse.com, quic_wcheng@quicinc.com, broonie@kernel.org, arnd@arndb.de, 
	harshit.m.mogalapalli@oracle.com, wesley.cheng@oss.qualcomm.com, 
	dan.carpenter@linaro.org
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
2.53.0.414.gf7e9f6c205-goog

