Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF0F20C010
	for <linux-sound@vger.kernel.org>; Tue, 14 Jan 2025 20:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736885253; cv=none; b=QkdevEOYxN/iUeoFmOBE2uLBV6avNtAOdTYbjdJM7Q7xBIZGH9gs2HcjLq38FdRePEHMaPWFAlo7v5nVxLhlAt1atRQKQZ5jwlzvLaV8FPa+7azk0HWfsqEidJYP589GHDMBl7PNKfp0tZos325QMflE2yPmtrKxTDSERcROAro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736885253; c=relaxed/simple;
	bh=7B6kyAiupF62kaPfm1JUZNDYqJWr8hGZNAtwxV5qv1g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T2Ei0ugYhyvl9hSyJRvLch1XkJL7Zclo5Ab4OfQWUrFItrf8Zl4f6t+VkmkCKUQ5QMhlDyNwRck8U0cnKwMgoe3OPZKo55fB33rONiOiJA3LZHx8YD/WvY+6vPL6P84+vZH4fxi1GXf7Ul6vbMQyHnUWNiY9TYOQ5rbaP0XMwFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PxZMTOy4; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PxZMTOy4"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385db79aafbso493418f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 14 Jan 2025 12:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736885249; x=1737490049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fk9bg9Fvbyh2/MUDhXbi+FEpTJ36YRKNsAKXHLaeSm0=;
        b=PxZMTOy4b0iLdPfvJn9B+hi7Z0UjyEymsM7x2v01bB88ulatyLICitrCkO9a2Pc6d1
         almIWDkfZLBO0KKfN79tKkjK9NexfimF6LujvP4UEtrYOb2h+A6sMiEfehy/KXUy6aHH
         D/CBST7KUnfiBFaFHqxIgwf4I0MI7QcGBUyhGTvnUC+E/HL//LPBWJLn1UPizBLwgwVa
         RWb2lijV4DgA6QAvXWV/mCtdtkL1/YTHr7WwCt0sEvAi81VKmpbkaTs4ztBgCYJvCchr
         aCTHoqnx9Pa0Hb8SFT9b/iJeDwO+DarNGCILBxs6Au54D2cw2BTcsyHww22h68yVQh5g
         mc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736885249; x=1737490049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fk9bg9Fvbyh2/MUDhXbi+FEpTJ36YRKNsAKXHLaeSm0=;
        b=iLTLiFUjGs4XfdiPeESmrRyPleQ2yFmPWnljbeb6ogDvvrgn9hsbKtRJ+Nfs/fqly8
         W7SCCntvEPVV5YYpSDAy3IybkQpq9Hkkl7H8uoomPaSwDEoejPhSupPTtwYOJmncys5X
         7+fe9GYd2f/dKDzjekU19uqhOL0BE8Rb+vwtZsQTUDAdkUUh+VKj66Z7628afF1QVu1x
         d+6vpB0eYA7MMyYVqi8sVW8CCnbJSyjiQ8q0gt2Nl4DHeVBzLKf+iMEsZ6Yt4nKAikXC
         34YD8jMOcc4zt/MYPUW75WLM8eA18aU+IVNlJtZf1jwP7eIux7J4EsgUeZ4WDNKZMo4s
         fpOw==
X-Forwarded-Encrypted: i=1; AJvYcCVWnajItlaH6iouRzI5+mgjHGOJHSzjuy+Gwt8gjsFd5MDXHdmJxA1ajXgLdiY+4zcZksvoGONDm0Iycg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUWNzZHOqWEhkIWCJMbgXYF5zXAheT7edstbMh41dCbm5uZgWa
	kZHQpVoB3fQPDC7KPcezdMZjyIbjMnMjZaQP56w6oUOHFsOqHSRYAgtNrgk10JE=
X-Gm-Gg: ASbGncu4SjLemUVlFMmvdlwzzy0fSXehsTui8Pl8oIVkfqec3zbHbWyY1+iMdioY8w7
	hknrGmLGhtxyOiCKReCBi1CEUREGEXB8sXpUHO3SJNyKAMUCTaLT0Dmbt75jk+iBMvGvrJvKmf3
	UR6yHuE3cCb4/T4AZXNOqrHqVrxiq3xF5dUChOVDLN/LaEGsRYeJt+LlDE9qukmYBnNlZl2yFET
	Xd2hNb9wrnQe4/U4XZLgW4V2S705U6F1tMNfF0aA2kkvPIWaHuxZjZToXRMYs2PfNvyudg=
X-Google-Smtp-Source: AGHT+IG4QNSfKEGdbODnRfkgtkES/VQLAMYQWTj1XLLF8uY1GBB4vrLQlygciFe4X+jQEBLErZI9+w==
X-Received: by 2002:a05:600c:35c2:b0:434:941c:9df2 with SMTP id 5b1f17b1804b1-436e272c89cmr94469765e9.8.1736885249454;
        Tue, 14 Jan 2025 12:07:29 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e62333sm183268835e9.36.2025.01.14.12.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 12:07:28 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] soundwire: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 21:07:26 +0100
Message-ID: <20250114200726.969501-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/bus.c     | 5 +++--
 drivers/soundwire/debugfs.c | 3 ++-
 drivers/soundwire/stream.c  | 3 ++-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 9b295fc9acd5..25120aa3bd67 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -8,6 +8,7 @@
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_type.h>
+#include <linux/string_choices.h>
 #include "bus.h"
 #include "irq.h"
 #include "sysfs_local.h"
@@ -277,7 +278,7 @@ static int sdw_transfer_unlocked(struct sdw_bus *bus, struct sdw_msg *msg)
 	if (ret != 0 && ret != -ENODATA)
 		dev_err(bus->dev, "trf on Slave %d failed:%d %s addr %x count %d\n",
 			msg->dev_num, ret,
-			(msg->flags & SDW_MSG_FLAG_WRITE) ? "write" : "read",
+			str_write_read(msg->flags & SDW_MSG_FLAG_WRITE),
 			msg->addr, msg->len);
 
 	return ret;
@@ -1263,7 +1264,7 @@ int sdw_configure_dpn_intr(struct sdw_slave *slave,
 
 	if (slave->bus->params.s_data_mode != SDW_PORT_DATA_MODE_NORMAL) {
 		dev_dbg(&slave->dev, "TEST FAIL interrupt %s\n",
-			enable ? "on" : "off");
+			str_on_off(enable));
 		mask |= SDW_DPN_INT_TEST_FAIL;
 	}
 
diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
index c30f571934ee..5bf0d9552433 100644
--- a/drivers/soundwire/debugfs.c
+++ b/drivers/soundwire/debugfs.c
@@ -10,6 +10,7 @@
 #include <linux/slab.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
+#include <linux/string_choices.h>
 #include "bus.h"
 
 static struct dentry *sdw_debugfs_root;
@@ -153,7 +154,7 @@ static int set_command(void *data, u64 value)
 	/* Userspace changed the hardware state behind the kernel's back */
 	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
 
-	dev_dbg(&slave->dev, "command: %s\n", value ? "read" : "write");
+	dev_dbg(&slave->dev, "command: %s\n", str_read_write(value));
 	cmd = value;
 
 	return 0;
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index e9df503332bb..dd8de88d8b46 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -14,6 +14,7 @@
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_type.h>
+#include <linux/string_choices.h>
 #include <sound/soc.h>
 #include "bus.h"
 
@@ -358,7 +359,7 @@ static int sdw_enable_disable_master_ports(struct sdw_master_runtime *m_rt,
 	} else {
 		dev_err(bus->dev,
 			"dpn_port_enable_ch not supported, %s failed\n",
-			en ? "enable" : "disable");
+			str_enable_disable(en));
 		return -EINVAL;
 	}
 
-- 
2.43.0

