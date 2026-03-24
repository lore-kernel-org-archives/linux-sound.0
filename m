Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F88A34A77D
	for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 20:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774384740; cv=none; b=G+vTtz+poP3gnJ5gUjBrUC2/NSnk45Na3jh4bh0iZPkYbdEZD+Nd3ljZzFYD7KFFcs+y4if54C9jIfAWbQt0ELGfdPFwSYnb0OgXMHb9oSLmhheXn9Xdyln5UkDlOXecB+XpLgG0zlOSPDnRxIQYN9qU/xnzUh6+0NZE8N/EkeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774384740; c=relaxed/simple;
	bh=MQbazrkmdRYT99sVdqIvGG5jY4ZqY7LLsRLiPijFSDs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cElyHktSxghEQb/xgUECN6H99SA3qUw2NemUaUR0+SamTDQAuBItRghxd/VO9xS2fdVP2ASn8/0/45bLQXtQcr4t6Z3qGN4Pplyrmt7wpInTysP0DzwpyG0/VRmtxdyNTpcc0vOjPTWswT8WRVpTE5oWE6/CsxnN4t49wZd1rpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s9lcD/a/; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s9lcD/a/"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2b060c14ccbso162188705ad.0
        for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 13:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774384738; x=1774989538; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Kzhp1Qk8a0PdlJT7jxayKm1GkrTY1c3ya2dGHroCMvU=;
        b=s9lcD/a/Wp/g8AeorwaDfgehvbAJL8esc4tJuUUF3Glgy8+zytcGUVhb/oEvdgN2mK
         dv8SFGMW516pI75f+IkLEm3gTXnsTMdJpaCzc7jSR1hgVwK9Ce0gB8k/6OnzArFQvjph
         uOz0sera4KjjOUxsCyfl5PjNXlK0W9LvYc8LLlWeHzJtX9w9puiKNeOItpPAi6G1o0s4
         /y6MABxqTzOsu2ZHymBFE81+SWrODwaxBE6bZe/4vsuh5V/rGk9G+1UfGKG5O62MTkdX
         8wTA0CUWc8pAP3stYq+8SbnVU1o16x3yBg5bjnLZgVMkDfnnf+uzdhHuH6NSj4FmwUuS
         gWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774384738; x=1774989538;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kzhp1Qk8a0PdlJT7jxayKm1GkrTY1c3ya2dGHroCMvU=;
        b=rfhqdFV6eKTkA3OkyGs3lsqmOwM/QGacnpvhKVxFwgZdpsnRcmPSPc7Nyzy726wzZ+
         43isOQuzLt0kjqtzrnaPTzcs+XpSFMhLynS50y4Yd+twejHXFSCAF+ouP2F44L1ey15c
         sEwWyNOfdjyuaV8kywklndR7EVgtQmrOluKdyV/7yqppxpfC8Ao/txwV7UGSa90V1bYT
         Y+CiKpTbUKPBNCVOHUq3Jxjz40X8gwz1nrlCur+Bts3ESn/xnDiXQOrXqMIJG8coaH5U
         gsQ1B2UzrLyvHsBDy/51KGJym17YELDPyPdDRoOgugrYnLZ1cDESkTBhGMedeOPtnZ9M
         33Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUalx9lEXuXIDEp/2WsoBE1JQ+sunawgG5mvcUkXW8cB+XW9nA+yPxN3T53tP/+35ji6wVtpVN6j+jeug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxOW2YMvAugPAMLQy6sOa5tRjfeeoFQ3ROSg9uojnWusUyuIGt
	gYTUVoe2xTF5Nti1VQJfs6KmEDVrteNxFEz1keAOfM3awoGrFpnsQbpJoYehHqYplqiJFayZMgE
	LemU6a0R2Fkhyw0ZSGw==
X-Received: from plaq20.prod.google.com ([2002:a17:903:2054:b0:2b0:52e8:578])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e951:b0:2b0:665b:c7de with SMTP id d9443c01a7336-2b0b0aef15cmr10314125ad.40.1774384737642;
 Tue, 24 Mar 2026 13:38:57 -0700 (PDT)
Date: Tue, 24 Mar 2026 20:38:08 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260324203851.4091193-1-guanyulin@google.com>
Subject: [PATCH v3 0/2] usb: offload: Decouple interrupter lifecycle and
 refactor usage tracking
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, perex@perex.cz, 
	tiwai@suse.com, quic_wcheng@quicinc.com, broonie@kernel.org, arnd@arndb.de, 
	xiaopei01@kylinos.cn, wesley.cheng@oss.qualcomm.com, hannelotta@gmail.com, 
	sakari.ailus@linux.intel.com, eadavis@qq.com, stern@rowland.harvard.edu, 
	amardeep.rai@intel.com, xu.yang_2@nxp.com, andriy.shevchenko@linux.intel.com, 
	nkapron@google.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"

The current USB offload implementation couples the allocation of xHCI
sideband interrupters with the device's offload usage counter. This
coupling is conceptually incorrect, as hardware resource availability
and power management state serve distinct purposes.

Furthermore, the reliance on the coarse USB device lock for offload
state updates has led to potential recursive locking issues,
especially during device disconnect when the lock is already held
by the USB core.

This series refactors the offload synchronization by introducing a
dedicated spinlock for offload state, allowing for more granular
concurrency control and avoiding deadlocks. It also optimizes power
management by ensuring that offload state is only modified when the
device is already active, avoiding unnecessary auto-resumes.

Patch 1 introduces the `offload_lock` spinlock and `offload_pm_locked`
synchronization, replacing the coarse `udev->lock` and the legacy
`offload_at_suspend` flag. It also updates `usb_offload_get/put` to use
`pm_runtime_get_if_active()`.

Patch 2 removes the implicit usage tracking from the xHCI sideband layer
and delegates the responsibility to class drivers, who have the
correct context for managing offload data stream activity.

---
Changes in v3:
- Replace the coarse USB device lock with a dedicated `offload_lock`
  spinlock to reduce contention and prevent recursive locking.
- Introduce `offload_pm_locked` to synchronize with PM transitions and
  replace the legacy `offload_at_suspend` flag.
- Optimize `usb_offload_get/put` by switching from auto-resume/suspend
  to `pm_runtime_get_if_active()`, avoiding unnecessary power transitions.
- Explicitly delegate `offload_usage` tracking to USB class drivers
  (e.g., the Qualcomm USB audio offload driver).
- Link to v2: https://lore.kernel.org/all/20260309022205.28136-1-guanyulin@google.com/

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
  usb: core: use dedicated spinlock for offload state
  usb: host: xhci-sideband: delegate offload_usage tracking to class
    drivers

 drivers/usb/core/driver.c         |  23 ++++---
 drivers/usb/core/offload.c        | 107 ++++++++++++++++++------------
 drivers/usb/core/usb.c            |   1 +
 drivers/usb/host/xhci-sideband.c  |  18 +----
 include/linux/usb.h               |  10 ++-
 sound/usb/qcom/qc_audio_offload.c |  10 ++-
 6 files changed, 99 insertions(+), 70 deletions(-)

-- 
2.53.0.1018.g2bb0e51243-goog

