Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83198155A5D
	for <linux-sound@vger.kernel.org>; Mon, 14 Oct 2024 08:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896315; cv=none; b=CV5CIRcSYMg9AV1OTCiyR+YlOz97A/T9/TRKm54I52A8qKSJxUFRYSdq+B1pcAd5xKerUBO0yB19L0GAiQbpZvWpASMpwzhnCWB0TAoC+rh9l0KNHxHnTBlCN5Zw2ihiXAWJmN40h/IBZFO0br2ZpwFXPh/cvfzHM8ArH6VnLpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896315; c=relaxed/simple;
	bh=MMmxOqDhjHtTHjEFNTHIGe5QUnWTlaXxSiuoBkNwdls=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Yo/fmGiJiXQmqRdxmCCEZIbd02mAET1uCaoQi3nZ1OcGdDaDkfLWZ8e6GqqCVFFMP4z31SVxSAQotlCLNU5jyrEe3GW8DTTSYE4/npybEyWMFlrT9z8aeOMaZUffngETRQY+Vw+FrbgiX0hFalLUIqWlFcEi/uR3VVsuGSEq5tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vyR7KvOW; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vyR7KvOW"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e292a6bdd72so3542692276.0
        for <linux-sound@vger.kernel.org>; Mon, 14 Oct 2024 01:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728896312; x=1729501112; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tJDj6k1vZWgUdDR2yBxvdFEmNrvt6dXxlhPApMDJeNQ=;
        b=vyR7KvOWOewMpOqi2HAHxDueYFNKU4yoHUQGRPbGBtVK1kBAcCMQcHDKUOWgnzmOKQ
         SoopcLPBdcuzugGZ/zMF7GFDFBm2/RKHHDBb8hDW1BpesiyBLFLqVbr/RiL2KifNaXIr
         ut/w9zaWRcV8xkfQ3tKxz93pFdTU2yN4YKcJWqSO+ek8oqJm4C5RFw67Yxo5NtKn2u2/
         1Ydh1jUYzGPL4TZQKx4P6uGCKAnJR81gfkiaMygcqdvxg7oe4CZZszKW9xrFz4M5wtlV
         8w2K6KmzMDf7SMXdH0QvMl0RUzy/AABdcrXEfg9ozEZI7pfrwibWo4bwJzvhtj02EXt3
         /tmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728896312; x=1729501112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tJDj6k1vZWgUdDR2yBxvdFEmNrvt6dXxlhPApMDJeNQ=;
        b=rRT+7VA8EY3htFdisv1seJmc7pm6mSaggwi5SXvpqJIrspMddAUa0zu+sQywk3Kj/a
         uxdZbqZjg7T2/uXwcLgqu0AjEYuutvn+ErEZsbL12FX7DkLGp2dq522Wxnt+jr5IDPpz
         2UrhMSHttKkQluguXqDTyAHEO+Pm65XjELNEzI4BoMbNvsEjchIAQSKUB+1aty9g9ti0
         FqeEcrEk+QIpF9SPoW3UmPZgI/SUobzbUhSIxnzqKnrlpjUD/vkohIrYPengF1/6egz8
         EB+xS64SppIfGUCC4rNCChsUQFY3JxAtmiJn8P434JGBiT6oId9ileI0HWqZBVCmvmCO
         AsxA==
X-Forwarded-Encrypted: i=1; AJvYcCWTczAVsQiYbmSFxqh36gV4W7dNpO8M7rkoSyOLmA3rpN8yMl5x02MZTJ5NE8VvqvGJSMUG5RrOL0jDyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx6MVIi/2thJWiWYcdzZlp6Q1gEHYG0lxnbRyo6f3g5sOfZ3tL
	FBr97FQieH2raxFLzCGxLdhpG01Ga6OQwRUTiaw/3rihxBA943xyGKPsXs37fr/rn7RCSpxZIvG
	GEXgNHrSNKUu+yQ==
X-Google-Smtp-Source: AGHT+IF5SavWo6HiF0EKk/WneTyIT4aMwJqzb9YpJJYmmLH93XV8Gx3OlSgXCUZByk5zE4gjAPphiwPmqmu7LFo=
X-Received: from guanyulin.c.googlers.com ([fda3:e722:ac3:cc00:131:cd17:ac11:19c7])
 (user=guanyulin job=sendgmr) by 2002:a25:3607:0:b0:e1d:2043:da46 with SMTP id
 3f1490d57ef6-e2919dd4d81mr44625276.3.1728896312291; Mon, 14 Oct 2024 01:58:32
 -0700 (PDT)
Date: Mon, 14 Oct 2024 08:50:24 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241014085816.1401364-1-guanyulin@google.com>
Subject: [PATCH v5 0/5] Support system sleep with offloaded usb transfers
From: Guan-Yu Lin <guanyulin@google.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu, yajun.deng@linux.dev, 
	sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com, 
	dianders@chromium.org, perex@perex.cz, tiwai@suse.com, niko.mauno@vaisala.com, 
	andreyknvl@gmail.com, christophe.jaillet@wanadoo.fr, tj@kernel.org, 
	stanley_chang@realtek.com, quic_jjohnson@quicinc.com, ricardo@marliere.net
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, badhri@google.com, albertccwang@google.com, 
	quic_wcheng@quicinc.com, pumahsu@google.com, 
	Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"

Wesley Cheng and Mathias Nyman's USB offload design enables a co-processor
to handle some USB transfers, potentially allowing the main system to
sleep and save power. However, Linux's power management system halts the
USB host controller when the main system isn't managing any USB transfers.
To address this, the proposal modifies the system to recognize offloaded
USB transfers and manage power accordingly.

This involves two key steps:
1. Transfer Status Tracking: Propose xhci_sideband_get and
xhci_sideband_put to track USB transfers on the co-processor, ensuring the
system is aware of any ongoing activity.
2. Power Management Adjustment:  Modifications to the USB driver stack
(dwc3 controller driver, xhci host controller driver, and USB device
drivers) allow the system to sleep without disrupting co-processor managed
USB transfers. This involves adding conditional checks to bypass some
power management operations.

patches depends on series "Introduce QC USB SND audio offloading support" 
https://lore.kernel.org/lkml/20240925010000.2231406-11-quic_wcheng@quicinc.com/T/

changelog
----------
Changes in v5:
- Walk through the USB children in usb_sideband_check() to determine the
  sideband activity under the specific USB device. 
- Replace atomic_t by refcount_t.
- Reduce logs by using dev_dbg & remove __func__.

Changes in v4:
- Isolate the feature into USB driver stack.
- Integrate with series "Introduce QC USB SND audio offloading support"

Changes in v3:
- Integrate the feature with the pm core framework.

Changes in v2:
- Cosmetics changes on coding style.

[v3] PM / core: conditionally skip system pm in device/driver model
[v2] usb: host: enable suspend-to-RAM control in userspace
[v1] [RFC] usb: host: Allow userspace to control usb suspend flows
---

Guan-Yu Lin (5):
  usb: dwc3: separate dev_pm_ops for each pm_event
  usb: xhci-plat: separate dev_pm_ops for each pm_event
  usb: add apis for sideband usage tracking
  xhci: sideband: add api to trace sideband usage
  usb: host: enable sideband transfer during system sleep

 drivers/usb/core/driver.c         | 63 ++++++++++++++++++++++
 drivers/usb/core/hcd.c            |  1 +
 drivers/usb/core/usb.c            |  1 +
 drivers/usb/dwc3/core.c           | 90 ++++++++++++++++++++++++++++++-
 drivers/usb/dwc3/core.h           |  8 +++
 drivers/usb/host/xhci-plat.c      | 38 +++++++++++--
 drivers/usb/host/xhci-plat.h      |  7 +++
 drivers/usb/host/xhci-sideband.c  | 74 +++++++++++++++++++++++++
 include/linux/usb.h               | 13 +++++
 include/linux/usb/hcd.h           |  4 ++
 include/linux/usb/xhci-sideband.h |  5 ++
 sound/usb/qcom/qc_audio_offload.c |  3 ++
 12 files changed, 302 insertions(+), 5 deletions(-)

-- 
2.47.0.rc1.288.g06298d1525-goog

