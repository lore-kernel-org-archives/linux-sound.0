Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32267E792
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 12:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785501277; cv=none; b=aQ6dTqynYKnWH1XyFuiXv1xvR/BMo/UVMUvyRxOONuOVhpUI56vZ+enHR4s6d3eO6daH2qBJWyRgUji4aJ0T9bu8IzKCnGSzHh1cnZ+7fIRckllPfwxz+oGPOKiht4D/KigjNCZMJ1UpLwCHLFS2Ko232ghjtzZlOZn4nj6qyRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785501277; c=relaxed/simple;
	bh=Nh4PFm11HLdYfdaHE+StxaZNZMR/hpsrLROctxnaWoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n5A7VCHAfloBTNqPpH+X9RnnT4Uk2M2pfcahIVS9WTeu+m0bawH652hZKSxkMPm+Fix8spQzcG7Ag16ZurZ1FT7yTuwjjYyNBcHUD9LSIko+VgKnZ+z8MNBxLaQTDkRJ7QcTlHo98X+b/XqsV81jt/NtF91XRVq9C5fKDvIO1CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sibhL1LE; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sibhL1LE"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84867f07d63so1170311b3a.2
        for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 05:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785501275; x=1786106075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F8nuVI+qLwkDAX0IRPSjr+eNe4USoFr7whaO483gFLM=;
        b=sibhL1LEJcsWzdteX16452xdHdOk+NMUHtO9oAayxXRe3JaUUSBs67Eh80WSHNPYbt
         VoRAzbNe5CnRceo1Xhf/iyfxwp6RJM3R8jsR31rWMJZY0ZtxN2fNt+QK7eu5m41I1E2R
         yagoB4RutI4ZG6taeF1XY/qXpIpuA7EwW8NaREa6gOkq3VA2KwCvE7lSEDjCv8QD8yWk
         fng87fxVvoN562Dc5Ggd45qeliS5lJx7BPuV1LyOt/VBJtZjK/iabqHlonS3nouRL81g
         7eo2ZLtViM0CJ/TlCKDJI3OEOtRKtKW1XU72hAUZGL3WcuwOhljOrJZUDyJTIiZUg6jr
         wmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785501275; x=1786106075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8nuVI+qLwkDAX0IRPSjr+eNe4USoFr7whaO483gFLM=;
        b=dpM6GpyaNOdK0pVjRnz25aWYLA2H460zNIDdYyZT9LEtbwXTRtWjri9fg2jNXCjfkr
         sj3HJfsse8wRVWGnIdj9/Uv5iJMSjH/kYzbNiP1mqFkY1AxgJdIFlGQcQ/ILNJ7RnkTL
         Eu5ivsstJQBEsz7qbh1yy/To6Sg+k7QoaFq21GuHcA1dHHKISn2M3yBnJZAijYbVY+pe
         menUnx/GTpYrgZm1rZ2RIIO+9WJ6C2JIrWvOba/E59mTDLjPQrn5jD3lMO41Ibic1V5/
         xUHKF5RB26rl6YeD3SxS3zZnOyCFJuDEN0tXdtqms+y6ojQCuHni7NTktRJQeOhNEtx7
         R1dw==
X-Forwarded-Encrypted: i=1; AHgh+RpYHxbhDqnBIuhMSWfex3mb32J5fAp+ACoFO3t0/5Wk3IW6iLynWwfI+2LgKoIPFEsbVtR13FZNaDae4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSHRsNj9/j7qDqq2RYyuiOdza093waLsTuM/S/SrF6pDYVN3Iq
	2oUMcikcDnseY94oeG6XrkAeH4zppdYQiBT4AelAFKnLU6q+9zdjA1G21JseR6i/7Eo=
X-Gm-Gg: AR+sD10l2xzwtP8LWcyGEvdOVYFxRK3PCrP69R3427O0q6Dbd+nRgaz7rlyr0ivEjS5
	5WfDEhx4UpF1+go6yQjIpMIfHxb10IAs0iesAYC0eNY+t6jyg2MQf+UzFUD3d+k168TlKhzpqlV
	5uGHNxAj1tog1HgUnTtlsdVeVEyEJJ778TWXkDxzpWYwIHxOB9LrlzlijQnZpPFafOM25dwYriJ
	h/D8TbVHk35WbTTWxjD1v9uToodcFBOdGLZpfzHFU3FkPHIhS9vLd/fXxGYr9ohIbAdavMD4IPF
	eRMXa1lvxtqz6gd5DeFSfvYSf7/Atw+i3SKoLf/Vo+wTrOLnydHHaCFRFiOjgVbazMS4MAlJI0u
	6JhaJ/CjOV3Lo4AXEvku2hjBsiOB+89r86U+1XE1KGfbDDwOP4UjhEzCVmRUIwx1kCuM8nSSuGL
	Yp1m4mFShQXbCChpeAEP0YN2mAhqcc/wrCN0k0aiSl2NZ8LxV//YJOfNr6+NKn8XaDZvBKED8lI
	inVZg==
X-Received: by 2002:a05:6a21:4d8b:b0:3c3:91f5:82cf with SMTP id adf61e73a8af0-3c91b30eda1mr1743755637.46.1785501275101;
        Fri, 31 Jul 2026 05:34:35 -0700 (PDT)
Received: from localhost.localdomain ([188.253.118.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe39ea0a73sm535109a12.23.2026.07.31.05.34.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 31 Jul 2026 05:34:32 -0700 (PDT)
From: Eric Wu <kunjinkao.jp@gmail.com>
To: vkoul@kernel.org
Cc: pierre-louis.bossart@linux.dev,
	yung-chuan.liao@linux.intel.com,
	ckeepax@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] soundwire: stream: validate slave port properties
Date: Fri, 31 Jul 2026 20:34:15 +0800
Message-ID: <20260731123415.34070-1-kunjinkao.jp@gmail.com>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sdw_slave_port_config() validates that a port number is within the
generic valid range, but does not verify that the Slave exposes the
port for the requested stream direction. As a result, an in-range but
unsupported port, or a valid port used in the wrong direction, can be
accepted.

Use sdw_get_slave_dpn_prop() to perform the direction-specific lookup
and reject unsupported ports before storing the runtime configuration.

Signed-off-by: Eric Wu <kunjinkao.jp@gmail.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
Changes in v2:
- Explain why the generic range check is insufficient.
- Perform a direction-specific DPN lookup and reject a missing entry.
- Drop the fallback that skipped validation when both port bitmaps were
  zero.

Testing:
- Locally compile-tested with GCC 9.4 using allmodconfig, W=1 and
  -Werror for x86_64, i386, arm64, arm and riscv64.
- SOF CI was temporarily unavailable. Bard Liao manually tested the
  patch on SoundWire hardware.

The same revision was reviewed and merged into the SOF topic/sof-dev
branch as commit 54c1da4:
https://github.com/thesofproject/linux/pull/5849#issuecomment-5141207403

 drivers/soundwire/stream.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index cbf7bd3d4e7b..e85025a5aea0 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1069,14 +1069,23 @@ static int sdw_slave_port_config(struct sdw_slave *slave,
 
 	i = 0;
 	list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
-		/*
-		 * TODO: Check valid port range as defined by DisCo/
-		 * slave
-		 */
 		if (!is_bpt_stream) {
 			ret = sdw_slave_port_is_valid_range(&slave->dev, port_config[i].num);
 			if (ret < 0)
 				return ret;
+
+			/*
+			 * A port in the generic valid range may still be unsupported by
+			 * the Slave or unavailable for the requested stream direction.
+			 */
+			if (!sdw_get_slave_dpn_prop(slave, s_rt->direction,
+						    port_config[i].num)) {
+				dev_err(&slave->dev,
+					"port %u not supported for %s\n",
+					port_config[i].num,
+					s_rt->direction == SDW_DATA_DIR_TX ? "TX" : "RX");
+				return -EINVAL;
+			}
 		} else if (port_config[i].num) {
 			return -EINVAL;
 		}
-- 
2.48.0
