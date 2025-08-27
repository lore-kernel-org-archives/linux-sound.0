Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D0534A33B
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 10:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756289713; cv=none; b=iM9045SPcCDiiXdO4j7ANq/PUa25dyg1sjy+qM9raVVAnlPxnO76XWjgmdL6iHX7642nfNE7sRB1054a18omFj5P934zsk32MkxHtqaCzfLknufiTHv+cxh4K9Mf9MEXJi8bJFmMC4Aiq5rqUugzYv9JRnVFp55DAkGjI9teIUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756289713; c=relaxed/simple;
	bh=Sg+pGRRA7q2AByf2Hlbv0gumGdBGdBqUUkqNm4+1Y+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FVVW6QL3A7thv/vbB0rPPTYjgr896QeVtJFKyrb73XWlKXE4zKVld2Vz7GlrZ1kYmbRJ5ekjDcC8lU0W9kuXN+mRzqBQOsGGuL3biEFHh+CRkLWbxYAEXWLDhPFzLP77BlHGKJrB7mjeoHppNjRqtzh2qnHfzC+MmCJ5cE0JUa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Dzl19F0C; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Dzl19F0C"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3c84925055aso2698005f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 03:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1756289710; x=1756894510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N3r2zvx+5YXF75JhFWS8o9+taAgLNyjY1vPNNGnu0k4=;
        b=Dzl19F0CjbJhEK0Tv3RFHbcpTW33XbFoEXIIkttawea21oNFlvae5+7ZoBoEjvgUZC
         FUhbg7t+waI9lSjmmP8VvSbibKR3yMrM79zMKNoXmX4v6+QCq6hOaOxr7IUq/uiHJ3v5
         D7rM+qGQzFGlCTQNYgcYCcN/QXS/QUmRZkfU1F4hoQkJDPFQgXps1ipmDM22b7vKlx7/
         iToN6UpiXQUWA8JQ0l0Vaaa65fZEqqJ/epu1ACPhgUnW5sNJs5tJiHWq302rxLUqcmP7
         dwJYqzEn8h8hV0MkgGwg5KpQyW0s1fLTqS+IOvLgSj3bBM8d6oE06O/89JV3zDU/sshM
         WfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756289710; x=1756894510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N3r2zvx+5YXF75JhFWS8o9+taAgLNyjY1vPNNGnu0k4=;
        b=opJKytGVzK+Yclc74tz2WXV+M8Q1PfFDEtrolRJzHjY0Thf8I3AKGl3TdfuJ1Hr1cm
         p1f2b52Aqgxl75XZzM1O8mtZ+XL2ihNxLfvpp5R5kMfZZLtXNSMWh/yDWq15M/PZwrFH
         hxsQjOL/KpEcMlDa+UN2/LeGbwgbPRim/xJsw29EwWAt6JRmjO9qQjtQeGWHtUQTVr4Q
         5XdIb+rrDhUIlxzzp3hQ1cAzsBbCqCviOZYe9vFKZ8acNADbNu3TWTW2/anctQuw7AR8
         2+Gq6h2jTm0416VbdubqEPAWoXjnHRncFt7eo3oe0UmldqEx98X6IEJSdp6OskddfDmn
         VViw==
X-Forwarded-Encrypted: i=1; AJvYcCV1XuchxUEfhbnwJoH482C9j0s97ill87gnWnad5Z0/Lzk9tEO/fb+e7+kBtjBAvNYVp6YCEK0KuXvIwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/AtAnLammEjFEqPUNukmEpGVyBbT/n8brj5KEnSr3LkXj4KBz
	Pt6de+vW6xcuRKjI5epbVfNz0bFkef1phjdsfacJ4zEEjcCzy7NLHS2fpfjrO0B/EeY=
X-Gm-Gg: ASbGncs6cpCi1DGjj1cL8Jm2nzLbSfIsUTnK0oCv6RCeTDV6PkDKX67URjFusR/GL3Q
	lyiTpdevr8xa6AMn3WIqB4rnmVPupap300DXuzRYrCpmVQ1U942Cpzgxx7z9S6GkdVrnPhk0LeM
	wjmq4LH05YjbgBgSHMehpqOQ1sJvmIuJrMUNiKlBel3WRLUp4oe0ywsuKkVTGfzrsVgMHNT1V0V
	+9U4W++dacCJPDSVN3nmYLpiLE5dbz/BOonSOw3ZXbGDDiLN228C9xFaBmlzramuIl4f6O1Cf9/
	M+VhbQkMssPfr7dqhf+tnSNIh6Kb6gXZTNdvbo1DC+Ny2ARUVsK7HWZMcsioS5LxJACo7lNjd6t
	BhS5BA7A6P75Ms8k3MjiUSEP76g8IDXbZ7mAZSWYUZYAJ2VkeGz1/r3I7ydNyPnVMMUHwNrZhn0
	dk4fXw2/ggXLy+9omm
X-Google-Smtp-Source: AGHT+IFugYIwA+l4JVKOgLNNenAV9tWbVV+6SyjqknULzoWbKuNmfsapi7CzhBqr9zREZFpAQ20rfw==
X-Received: by 2002:a05:6000:2381:b0:3ca:d8b9:a4b4 with SMTP id ffacd0b85a97d-3cad8b9a55bmr5732389f8f.35.1756289710292;
        Wed, 27 Aug 2025 03:15:10 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6103:4200:a5a4:15e6:5b6a:a96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c70f14372fsm19787956f8f.28.2025.08.27.03.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 03:15:09 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	ulf.hansson@linaro.org,
	rafael@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] soundwire: bus: Drop dev_pm_domain_detach() call
Date: Wed, 27 Aug 2025 13:15:06 +0300
Message-ID: <20250827101506.927787-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Starting with commit f99508074e78 ("PM: domains: Detach on
device_unbind_cleanup()"), there is no longer a need to call
dev_pm_domain_detach() in the bus remove function. The
device_unbind_cleanup() function now handles this to avoid
invoking devres cleanup handlers while the PM domain is
powered off, which could otherwise lead to failures as
described in the above-mentioned commit.

Drop the explicit dev_pm_domain_detach() call and rely instead
on the flags passed to dev_pm_domain_attach() to power off the
domain.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/soundwire/bus_type.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index bc1e653080d9..91e70cb46fb5 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -114,7 +114,6 @@ static int sdw_drv_probe(struct device *dev)
 
 	ret = drv->probe(slave, id);
 	if (ret) {
-		dev_pm_domain_detach(dev, false);
 		ida_free(&slave->bus->slave_ida, slave->index);
 		return ret;
 	}
@@ -180,8 +179,6 @@ static int sdw_drv_remove(struct device *dev)
 	if (drv->remove)
 		ret = drv->remove(slave);
 
-	dev_pm_domain_detach(dev, false);
-
 	ida_free(&slave->bus->slave_ida, slave->index);
 
 	return ret;
-- 
2.43.0

