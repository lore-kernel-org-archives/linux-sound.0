Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F47237F752
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 19:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773774674; cv=none; b=RtaQ4oUx/pjXkXTWs7Su951DfYkjnll3sxqBRJV57zk72GEElPT1dA0jHNEzLnfeG2XkngBbJ7c4EIwJUEYDXIbJjEmqSZ3AQgbZqXbuAaXyDlIyWa1KHd0MutVqTPHCTnd5OuP+YV0nq7K4IljZ3Z+S7O+ttkeP8F0YFTaQZHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773774674; c=relaxed/simple;
	bh=e5D0ZDzECFt+AZZ7v2CLoTCt3POSgLt/y3yjbm312SA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EHADmHSq29Vj6yKEii2OyTDq1R+SHYkAaQ4S7B/T1rc2P2MGRjBJgoqg3Aw4I2V9S+KFGKACok7BipM4Z2STa2TVsDamUQFbHAfWhthvJitOIRd121cYp37qHdjScwe7JQHLWLDtLHe3tmVDvPrXcvYSpFYmEDUvFGxVCeTPNMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gV5dcVMC; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gV5dcVMC"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-829b2018c94so3324530b3a.0
        for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 12:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773774672; x=1774379472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ey5xOspEF8t8qpOzkawTxCYiw1oiTsiTR8cXxAAxS3s=;
        b=gV5dcVMC6KJYTCRJRjO903BDZIYiDP6cZY8Os1k4p36+TNM7iNKcUsMuUe+fiszy5m
         cKb6ZtShZiA8BH0+8esPUwWU2sdTThGlEnqwHymwAr6rnBb6vpQUAiYYxl8Zu9FMaytn
         FgmO3dT3QshxAVAdoSyv/j8BxWBJZEkbt0wnE9iaCG2GdAddo96ztgEAmgUHQX8eQTGS
         epZmlXIpc7hBPzRFfEJ8T2P445AtzCV1XXJcC3zb80koxN8rk2qic5iDUsAnCPRGBCku
         LUIHgsmpSWPBmHq9Ed8M8VV53pIv7BgxyI143fsJEDGzin2Tjbw7CYnub2u4Jc/535vj
         NBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773774672; x=1774379472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ey5xOspEF8t8qpOzkawTxCYiw1oiTsiTR8cXxAAxS3s=;
        b=ZAaou3tmsRQ6g4ZldT76WWWa8pxircQV0/f8sAnB5cyp1zozJtDJfu4EfGfCYyIW5q
         Al6o4BghLPJ/DkzFHuq7pLmZg6qPX+MO063uF8cWGA0bllbnZyGApUzTStNsT+CVUvd8
         Fqe3T5LtN4anFa2U6JVy4586AjbsQ4dhW7KL+sMp9Nyyu9nSvavzPuJxkRs8IvWkR1YE
         GE+Qg+uV16NF/LTs2RURVDsiyxP9jQ8V6aAr5hFjoQDZyET1SwAcZYC7P2kqYa6zYLEP
         vJhqAUzVEnryrvz5VJ1hd0OWPuGAVQ/7+KkEHeSw4JPwL7AL+r6Qeyzz411qhiUdQdYI
         b+dA==
X-Forwarded-Encrypted: i=1; AJvYcCXT8BYpNr77lwBsnp90+GK3zVIQBw9EjGMdg71tNGUO/yzsnhVy2+sQmXW94VFa5ShAZX7vlJXtXCpkiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5NR1hqWKwvrqqqU4FQ9VyAFTBHV500X6zNtdfDuj1EnBG94ev
	y+XxypcgPil+hjCsfxouGAI2++tscTT1ETwHMKwP+bfzLy3Yd//+lYmZ
X-Gm-Gg: ATEYQzxm6ndxzqUnyKjqFrdFQVD5D10s96liSUwfZ6kBoQg0WqBIlPkuFiZqQBIIEjC
	9XWIIKrtM6QZ94QuKs8QLX5n10wLSvrc9sW8FWz9pCYa6Sh5NvJ2EO3BX9R+sHBNCXe/6r3zxe/
	7oajN3hlnBMJEToSvClShb2PQY9zy/Z92BL7XRH7ckFz+0Ciyyzxg5howzcn+Tl5/mI4gh1uEhU
	nxNjNSUr5XkrN9MxxUH/wy4xCqzMCbq25PkCL1Bdzl93MqMXTkdiVZST0Mxjg5Rl6ZbwiDH8Kxz
	k+URxIlzaMbdsvZKfxlV5pKMFUAAg8qfBwI27IHBEEzhlvdjSANQ/wpEq33vNaGQU1ddqJ5L6Lq
	X+oSSSO/P669MizerU3uA9t+WFw5NwM1dEPeOKd8ph8A3hXla6xYz08aW382CsKCAo752s5eY9J
	o5EnByjz8pLlN+o+/A8K89BazXNyeNuj8sITnAQKUZYUoAvV9NLXZj0nAjCGCF1z0Ojtph9oZc7
	90WJYRJVSySgua3WWON7zusHQMUH5tBsjBbR9CCUt7BNwNtSlDJ5+BGhcUPMRo7e5EXqw==
X-Received: by 2002:a05:6a00:1ca3:b0:81f:4ce8:d64b with SMTP id d2e1a72fcca58-82a6ae4f234mr356985b3a.44.1773774672367;
        Tue, 17 Mar 2026 12:11:12 -0700 (PDT)
Received: from 2045D.localdomain (76.sub-72-110-123.myvzw.com. [72.110.123.76])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bf0cf5fsm224612b3a.61.2026.03.17.12.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:11:11 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: gregkh@linuxfoundation.org,
	dakr@kernel.org,
	rafael@kernel.org,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Cc: pierre-louis.bossart@linux.dev,
	rander.wang@intel.com,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-sound@vger.kernel.org,
	akaieurus@gmail.com,
	me@ziyao.cc,
	Gui-Dong Han <hanguidong02@gmail.com>,
	yangshiguang <yangshiguang@xiaomi.com>
Subject: [PATCH 3/4] soundwire: debugfs: initialize firmware_file to empty string
Date: Wed, 18 Mar 2026 03:10:29 +0800
Message-ID: <20260317191029.43515-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317185920.43387-1-hanguidong02@gmail.com>
References: <20260317185920.43387-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Passing NULL to debugfs_create_str() causes a NULL pointer dereference
upon reading, and creating debugfs nodes with NULL string pointers is no
longer permitted. Change the initialization of firmware_file to an
allocated empty string. Existing driver code using this field handles
empty strings correctly.

Fixes: fe46d2a4301d ("soundwire: debugfs: add interface to read/write commands")
Reported-by: yangshiguang <yangshiguang@xiaomi.com>
Closes: https://lore.kernel.org/lkml/17647e4c.d461.19b46144a4e.Coremail.yangshiguang1011@163.com/
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
 drivers/soundwire/debugfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
index ccc9670ef77c..d4abe8bfca76 100644
--- a/drivers/soundwire/debugfs.c
+++ b/drivers/soundwire/debugfs.c
@@ -358,8 +358,9 @@ void sdw_slave_debugfs_init(struct sdw_slave *slave)
 	debugfs_create_file("go", 0200, d, slave, &cmd_go_fops);
 
 	debugfs_create_file("read_buffer", 0400, d, slave, &read_buffer_fops);
-	firmware_file = NULL;
-	debugfs_create_str("firmware_file", 0200, d, &firmware_file);
+	firmware_file = devm_kstrdup(&slave->dev, "", GFP_KERNEL);
+	if (firmware_file)
+		debugfs_create_str("firmware_file", 0200, d, &firmware_file);
 
 	slave->debugfs = d;
 }
-- 
2.43.0

