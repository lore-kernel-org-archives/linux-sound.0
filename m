Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EF9371873
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 09:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256551; cv=none; b=Vk/6kpHu9j0crOTSgDmNVTtL+LlajeZhj6VH/nGx7xfk8zBaG/0WEXSARW4U9hzdMz106BBKDrRkrIzPSlJEHUSh0w37CUHMrfX4eeZ4Z8yIbder05u+ph9VrYCkkK+ynvZT77zkeApFjVuyW+2x/L+u2kjazUfTfcvL0ZT+e6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256551; c=relaxed/simple;
	bh=cDfCpC2k5COsvd3GHRWIpuxPdl/asKWV7zeOf4SM5dg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O7RybmXwYuEj5hhU4xQfHHVoyAFgGwRd2R73ARNemDb+4Ttyc2PAX6YmPeDxDllOxJBmmRRGGdIDqq7ti8hI3R9t/4upl4nEtZQtABaXjGrg6U36OHy/kKDXOz7WdlOKL2GBeG4X44CSiWwNR+BsxP0DXQeW6l2qOu2pu43jvOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uyk7JJTm; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uyk7JJTm"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12a80c36350so1032373c88.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 02:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774256550; x=1774861350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tg0E61uEdPAy3sHgDaZndNka+4Nyveqsr6678EIZbOY=;
        b=Uyk7JJTmXtrOOi9pV42OguJldt83APHKG0w/Up3IdwACALVp66ir3E6eYKEkpHYnij
         BPTpajZ2efyBtH5VnFUNyhvnuIRhDPqQBIUnUXE1182a7TIfzyD67kZcEOvVgTboOOUk
         jD6Yn7dFB5pdBgFGYfeVI4319nA4s8yCNSayHg5v1GuCtwCs/d2yp3FyJU5uQwiYOeXv
         goLXjrGadaZEt0th3WgitbgTYsnD+r/E3++JC2Xug9Hu3nVr+fuEdG1rgkxlmZOj9zqw
         8B3yVxlAikY+2bzC6m4Q8uGYVhWMz+qxh019FIFQSoGtm2r7WGM1vFUFmUx2cmuhZOHf
         kPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774256550; x=1774861350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tg0E61uEdPAy3sHgDaZndNka+4Nyveqsr6678EIZbOY=;
        b=cUbWoRm4KXBcGvbT1zsj65HluZmXTeCx9xtaQ0i9FutdOp2HsrbdI0TnZAB1j5ijx1
         CU7Te4xX98h6AAekr7mZt5iODfz9U+e+CiVHivCWVQSLiStcGtStpZgBEQ4mwkzzc7cX
         s0vTYwSOQUUX0s6ihUtwWCq+9aovYhYv0M0FIapRGKLfndfBXoveGBVkgQ8rIqEHCOPB
         t4QIrJbPTaZiXsXr8kzC1XMq8dvQkgNjdp/fqY0Kzga/44WQR+LEnbvI/er1y9MlcORG
         UBkeA0FSp+U7tPVry0xXibGhAxR8TbdruR44Gc5vHfvIY2vYGv3sJZbVqaoynbpF2BK4
         fFiw==
X-Forwarded-Encrypted: i=1; AJvYcCV1OtAgCyd7LD4vJ+4Q9Ya3iYuI8O7iwiMF8K2X2X/U6yMJF9ZuVv0ZTy3OmxMLG+wDVyIrn2riTMnWjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4n8O97tOAYvTKgQdQbxWxudp7rr13chwl9pQv8YE1h0fa2pY2
	63TpZgeDs/lhSdsqO57gCnPFmA3dcNsmdAjiUR4iWu+mhQ4yRmWcNlGmTx6Plg==
X-Gm-Gg: ATEYQzy0mY37vYDwZZyvAECTWDwBHicd5ieLKO/mKqENb0ZdAwI4+diJZL/ktvDYRRZ
	A2gOLu3jR1mWtG7qi21YuWGl1t5OMWf33LKibMwu7nSdKCcpZ6L4j8HWRmtLN7iWm1WjVfO0akS
	BHlcxfyqawHbbdbntjVGoxS55/251GVgQbznPN6VN8pR10qiiyJQEQvO38PEXF1Zo5vNa0Tixwp
	jl445A1903LtNncf6T4TbfakSgKjzblyrHBNjIXUMZnS2F8K5n4k6YJU9UFo3+fD/GE14XySx+0
	KRS44SxZw6Db8qC3/9cY5y85ljgY9Z18Zp0YR5KBGzok51sBYsiPnrAntELFzObF0IuzFzqZnTp
	ur2fs4V0DAMB0xaccPiK9ZYsuYZm/8xqGr8tMpD25VXDcaJr9IrZDrDvhgC6yH8JZW/dZR9DX7z
	3AWPf+NJAoQWCieiROqIJtQjxelyfmtpFNO9Jwy/FRMzwHWD+U5ozIhjbdq2HZ9TH7IhRuOaAJD
	qBrIEMyr+CedxH1WYdZ1khBxdbNO3IkkPekDcV8PbpvqFbhj+o83ZQPQL6DEP51jr4=
X-Received: by 2002:a05:7022:f68b:b0:128:d4db:447a with SMTP id a92af1059eb24-12a726cd01bmr4665776c88.29.1774256549584;
        Mon, 23 Mar 2026 02:02:29 -0700 (PDT)
Received: from 2045L.localdomain (90.sub-75-221-98.myvzw.com. [75.221.98.90])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a734bb33fsm8620227c88.9.2026.03.23.02.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:02:29 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Cc: peterz@infradead.org,
	cristian.marussi@arm.com,
	sudeep.holla@kernel.org,
	linux-sound@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	akaieurus@gmail.com,
	me@ziyao.cc,
	Gui-Dong Han <hanguidong02@gmail.com>,
	yangshiguang <yangshiguang@xiaomi.com>
Subject: [PATCH v2 3/3] soundwire: debugfs: initialize firmware_file to empty string
Date: Mon, 23 Mar 2026 16:58:46 +0800
Message-ID: <20260323085930.88894-4-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323085930.88894-1-hanguidong02@gmail.com>
References: <20260323085930.88894-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Passing NULL to debugfs_create_str() causes a NULL pointer dereference,
and creating debugfs nodes with NULL string pointers is no longer
permitted.

Additionally, firmware_file is a global pointer. Previously, adding every
new slave blindly overwrote it with NULL.

Fix these issues by initializing firmware_file to an allocated empty
string once in the subsystem init path (sdw_debugfs_init), and freeing
it in the exit path. Existing driver code handles empty strings
correctly.

Fixes: fe46d2a4301d ("soundwire: debugfs: add interface to read/write commands")
Reported-by: yangshiguang <yangshiguang@xiaomi.com>
Closes: https://lore.kernel.org/lkml/17647e4c.d461.19b46144a4e.Coremail.yangshiguang1011@163.com/
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
@SoundWire maintainers: Reviewed-by and Acked-by tags are welcome. Based
on my testing, reading a string node created with a NULL pointer causes
a crash, and writing to it returns -EINVAL. This completely breaks the
interface, making me highly suspect this code has never actually been
used. Additionally, sharing the global firmware_file pointer is
inherently racy. I will investigate fixing or removing it entirely in a
follow-up patch, as it falls outside the scope of this series.

v2:
* Replace devm_kstrdup() with kstrdup() to fix allocation/free mismatch
with debugfs.
* Move initialization to sdw_debugfs_init() to correctly handle the global
pointer and avoid overwriting during slave probe.
---
 drivers/soundwire/debugfs.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
index ccc9670ef77c..2905ec19b838 100644
--- a/drivers/soundwire/debugfs.c
+++ b/drivers/soundwire/debugfs.c
@@ -358,8 +358,8 @@ void sdw_slave_debugfs_init(struct sdw_slave *slave)
 	debugfs_create_file("go", 0200, d, slave, &cmd_go_fops);
 
 	debugfs_create_file("read_buffer", 0400, d, slave, &read_buffer_fops);
-	firmware_file = NULL;
-	debugfs_create_str("firmware_file", 0200, d, &firmware_file);
+	if (firmware_file)
+		debugfs_create_str("firmware_file", 0200, d, &firmware_file);
 
 	slave->debugfs = d;
 }
@@ -371,10 +371,15 @@ void sdw_slave_debugfs_exit(struct sdw_slave *slave)
 
 void sdw_debugfs_init(void)
 {
+	if (!firmware_file)
+		firmware_file = kstrdup("", GFP_KERNEL);
+
 	sdw_debugfs_root = debugfs_create_dir("soundwire", NULL);
 }
 
 void sdw_debugfs_exit(void)
 {
 	debugfs_remove_recursive(sdw_debugfs_root);
+	kfree(firmware_file);
+	firmware_file = NULL;
 }
-- 
2.43.0

