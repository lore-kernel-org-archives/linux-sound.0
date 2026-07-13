Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAC42BEC34
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 07:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783926952; cv=none; b=paw2AKk4dX2xgzfE5/o+yaHxxL0gcnIV/5HH7fmE8KxifP55rDNOpDjO34ARY54GO61c21oao3M8DazXEieCJ1qarNuqcY74MKZPj8kz9kzkrRmkSSM3OsVpaVnP+4RkAqI7p1GSSEG+eeTGeZBzNU1/wxwRkQ+bl/SHwWibnAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783926952; c=relaxed/simple;
	bh=hAKGgd+eyWYsOVmA8tKCv7sB4BvxPMg7Y969IvjkRiM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NeG7MufM77o/95cxtHs7VqgNomeJTw82xXEUtHZEcI0G0wj8HRMb+ZbVyQGfFQhZpEXF5em6oY21vDyiyEesvEiTCWSAF68wL86HsfrWmSFbaXlPS0OQPmERMun4xEb5dRuV4xKVz/U2ChNmpA3ysftge7NTeWekuYSBVtDy5IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hT9aSInO; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hT9aSInO"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so44197115ad.2
        for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 00:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783926951; x=1784531751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=81rPNZTdUEVTmG3i5/CNvXVNSIlUq1klAsjkynHXubM=;
        b=hT9aSInOLIDhcMG9qPsLCjPzW3Oc2ZYXno6bf7yhbeg5aye07jZ5xI6RMCoIhwyVdM
         w07a0WfZm/BeAJWLMG1OaLG9iD9vBptBYHDChVz8htj3WkbKj0wApfCMe8+t0s29dBHS
         qjmvbP2IIfc/40GkX+bjIFtRwuETh2eYCepoJp2sxY9M/SgJXRR1eQYgzr4RVGGCAneH
         seWLGz1JAYrC7RxYRoXTlTtXaKsbiXolavIM8hvfziCGuIY5WR2BONsxCuUWOZRIsXo/
         fG335oBpPD07isCtYPLq+vkc2AwJfBUFBgLvQ1k0rjhZk2KQGxdhFB6DD2W4q6KgZtmL
         iBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783926951; x=1784531751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81rPNZTdUEVTmG3i5/CNvXVNSIlUq1klAsjkynHXubM=;
        b=Rvk8Z+dE24mmlEsPy3gHmdC6MFqB/0bB2JYr0tvUdyFX+S117cp/a9eaTkkvFgca3K
         RxNu/P9zPdK271L4kGd0i1T90iX/AQURUOLNYbcDija17Llq+v1rmttmGvdQ5d7+gZxG
         nLyU0qRYsa056M0CeUL1ZzllAKzvbvuV6Aoybwq2yWxmBlMw2wEhAwHtVsVYCdngrHV8
         2QUia9//FUJKI8wnV7NEeOMAKSgJE7TAYFnbaV42Gyyc5IjykdLOh73lhglF3nUmE3T/
         LRBYiT9bRInJNr3exoDPyIMcL/MlTTt5/LtdEm2kkd6HozkLHi/rmC9Ru9n66xddy7ts
         8WOw==
X-Forwarded-Encrypted: i=1; AHgh+RpPsPG/C0rOOph+Ngo0tFJLQXzo2w1Hev2m5vHNINCrCy46+vYI9RQu6JAw8wpiGTyU3pBdLTKIOoT+FQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyR1A0viNOlIQFddtTYS+tE+fkHU+6HKaOmFyze5qdcJFqAkkos
	Kqv0Gz6715dCqO0iL7gDLWs5ACVCiSXoJliSZmgRaDXAfcdhw05fA1Q2
X-Gm-Gg: AfdE7clBf0QODsp/Fc1/Aq8RkX4Zc4x0/ZFtdpv63yg9tPuTmsJwB0OcnF7BlMFBbkR
	BaqsjD5itx22rFPsGj+D96EnDP0nOgEpwkofEthE0wdURe8efqSR0C029N7LdeGpJAwgMzQ+t9L
	z+CL6RPHXWkHy1u/AFoqqvDbUZxDbCL8dULCVloCYllJIMNQC4C0EI5AykRDmFY6Edi6wcR05Bp
	G6jnFauUwLVTHZpYQxRTlDEU39cbXrnsd46uZjUvnO20gF/o5wBD/A/L1tOQJr+DEGj3IKerIwo
	tfG6lMj52pcTzSdhuMAlvpBVsxCVv1criu03QlYh1S452BSvsMU/RDNxV3qIME6a+gRWFb30LUF
	urtvr2Owl+PTI0FOchEU/8Xu1DP2xsxYB8V1xAgLYj2bvHMuG1G+mpg7xfcUO7AbqHE7KPCB3Gy
	7Qva5g8wEfNJCkTzbryL6ZKSLfc+DcsOW4nqkGBgo5YTnJblZDgF6/TaWp7X4DyQEc
X-Received: by 2002:a17:903:fab:b0:2ce:8551:318c with SMTP id d9443c01a7336-2ce9f160242mr72965685ad.40.1783926950831;
        Mon, 13 Jul 2026 00:15:50 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a60:5a63:5c40:25d1:91b:1b22:c7d2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d2efsm94055435ad.64.2026.07.13.00.15.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Jul 2026 00:15:49 -0700 (PDT)
From: Eric Wu <kunjinkao.jp@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eric Wu <kunjinkao.jp@gmail.com>
Subject: [PATCH] soundwire: stream: validate slave port against DisCo port bitmap
Date: Mon, 13 Jul 2026 15:15:44 +0800
Message-ID: <20260713071544.35722-1-kunjinkao.jp@gmail.com>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sdw_slave_port_config() checks that the port number falls in the
generic valid range, but never checks whether the Slave actually
exposes that port for the requested direction. An in-range but
unsupported port number (or the right port with the wrong direction)
gets accepted without complaint.

sdw_get_slave_dpn_prop() already does this lookup against the
source_ports/sink_ports bitmaps for other purposes, so reuse it here
instead of open-coding a new check.

Slaves that don't report source_ports/sink_ports at all (both zero)
are left unchecked, since that's treated elsewhere in the driver as
"property not provided" rather than "no ports supported".

Signed-off-by: Eric Wu <kunjinkao.jp@gmail.com>
---
Only compile-tested: x86_64 gcc, arm64 and arm32 clang (LLVM=1),
all clean with W=1. I do not have SoundWire hardware to test with.

 drivers/soundwire/stream.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 4ed8fb7663ad..30cb8a8552d8 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1054,14 +1054,23 @@ static int sdw_slave_port_config(struct sdw_slave *slave,
 
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
+			 * source_ports/sink_ports are optional DisCo properties:
+			 * both zero means "not provided" rather than "no ports",
+			 * so only enforce the check when the Slave reports them.
+			 */
+			if ((slave->prop.source_ports || slave->prop.sink_ports) &&
+			    !sdw_get_slave_dpn_prop(slave, s_rt->direction, port_config[i].num)) {
+				dev_err(&slave->dev, "port %d not supported for %s\n",
+					port_config[i].num,
+					s_rt->direction == SDW_DATA_DIR_TX ? "TX" : "RX");
+				return -EINVAL;
+			}
 		} else if (port_config[i].num) {
 			return -EINVAL;
 		}
-- 
2.25.1

