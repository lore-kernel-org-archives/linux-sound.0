Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392DA385527
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 09:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256460; cv=none; b=uc3UVPh9xmlcc1cOy4E4sov2JSxVe2P3Imz220fdwpI1GQzcKytj0ykLz+VReJkYbsmx02XDp+/NDQVWXaOp3WKK11cogJRI6jGJfFgCYlV8oAAFHNofqMC5zFMIjEuqExkj3vzfKuD774kY5xdHYsSan/cq1LcQ3IyYxz+pe2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256460; c=relaxed/simple;
	bh=Cl5yPFxk//8Ej78GNhA/VX9CqrDUv6u1CQCqFHTaYvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lxw87MdGhbSb0tVBAOSSNzpq4FySOfMAwibz6ibq6b1RiwRQU/ljcyfNdyRhEHwHw0/9Ks/cU90enk2HJ+2rWUR35H+bJdQVJnsuyYjQ9tSdtMOC3CKfznw1lHrHItYPL0JL/HNIYgBx0hKmjWm7WOPEA7EtP8L8lUXWn65SUyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NaOKfm+e; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NaOKfm+e"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12732e6a123so5214082c88.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 02:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774256457; x=1774861257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0lLd0QkDOzCbjNYQorhBBOJpZyLtToijPDM8Z8Tmtc=;
        b=NaOKfm+eKRX7z/WY8Tcwb9pewt5lx9HRDQ0vTOSYaGxc64YykdEhIO6fdE5UlUUMwh
         YpUVeoHO5zwXKFs7m5hzYgXGyOyA6B89ouCcONKj69ViTZeq/TD7K8k1qKuVzqdLp/Cu
         gWyKbQto8r03tcG+N2W7Zc5ht8oJ+b7gQs14eeqZNw4gbCwucieAX8ajBuJskoxmYb1J
         90V569/3FTkau1ljRMENCvmm4EfiNjnS07XIqOw3MM+bKR8NqAqPzojDF05Yrbnbl6bq
         hM8END4ViQfzSNIPtZtu+FX3wKJt7A46NOJQfnDJEYuNQVzk7SQ6VvAq+DPloANDDPaQ
         6HIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774256457; x=1774861257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u0lLd0QkDOzCbjNYQorhBBOJpZyLtToijPDM8Z8Tmtc=;
        b=MtyZgHCwLSZJzS0nN6v/8ChDigqHEy4fGDRwzSBuDcU2egVgYRCUXVKUlrFrg9mB1+
         GQK8eCa9r6rSsBB56fnMD9j275zYdhgJl7+EwIpXmaa24xRX6m4BlNkVbeVuInXa58Yl
         jPUeJV1C0WR/k60lcCaCVs0aO98lAMtRQ/J6bcC8XzPeGeXfee62r8rI53Gk2zI6k8Ox
         tRl/uoTXha2+wLNyAieZPdyJFmczPCKdLjWYrRXJ9bEJ/2b6T9oY3JYkhpfCMTdBAiPc
         heKJk4UID0dqOZgzWc++QqMk7AZ/enj31Khs9VCsn6G0ToG4jjX481tfRXucyLykKBKZ
         SM5A==
X-Forwarded-Encrypted: i=1; AJvYcCUimpZ41+1uDb87D1xMjGKmSMwCsihTe9zbuTAwXE9P2ndvKquHdWWaRGUeed2vNd5VtbmsVwyivHWzeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0eBbA0ra1hx44fApClb/k2zMxg13QbLdvjDTiCaUz7y778nRb
	dyVvbb2aI92+vE/XsBFX4Vqul5uVeOw8tLycx5UeIGAp79XkC6QttAEm
X-Gm-Gg: ATEYQzyBDsQ5X8S3WM1MsPQT9v+rRNOU1QUXvC6IcLfvyI9aFzypqLcif+0t07JuRIo
	dFQLnfnkX+m0y7rd9E3mgXQy1WiwYV51Kp7/khlyn+b8HiCiFaAF1Cu9N4mI7aT2v6eVMI8krIC
	m45vMG5ua0yLztu3Rg4Oe2oRdm2MAM1OPj7oiZc9ETXHr3HS4AOhbemo8ooaPeW2DVEXUpmHy4Q
	poawm713u4bXBNP9lyeOGHJLB9xu0BJTWbPYfw09YG6hVwiFle1eDzSOOWvH+PKenf1Rg4yn4vg
	Ng8aqNhOCWJEKA5t8pVboVJOeRpisBT7Ty2ujPDMv2FR0Hp/VTP+Pcjfh35kGer677goUbNmo4j
	VwrWpzCryYcAb33V9osWOgrv5qQ22F5GD9ySVUB8soCnXoSD1mv0wyGik5PQ7TbMHTRMIeqP27j
	C2IUn/iwKLjrbvd0+lbDRrUYQvCjbcQob3+es8637q9uF1fjfqj2fvs+GckoPUNrXEx5Yjbg+ag
	96pvowz6osmguJ/aTjX4HqO4l15RtOrl2KqKFQJG0OrTx7CgupYaAyLyztzhxF6i/g=
X-Received: by 2002:a05:7022:628c:b0:128:cf5c:5352 with SMTP id a92af1059eb24-12a7266f502mr5323136c88.4.1774256457159;
        Mon, 23 Mar 2026 02:00:57 -0700 (PDT)
Received: from 2045L.localdomain (90.sub-75-221-98.myvzw.com. [75.221.98.90])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a734bb33fsm8620227c88.9.2026.03.23.02.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:00:56 -0700 (PDT)
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
Subject: [PATCH v2 1/3] debugfs: check for NULL pointer in debugfs_create_str()
Date: Mon, 23 Mar 2026 16:58:44 +0800
Message-ID: <20260323085930.88894-2-hanguidong02@gmail.com>
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

Passing a NULL pointer to debugfs_create_str() leads to a NULL pointer
dereference when the debugfs file is read. Following upstream
discussions, forbid the creation of debugfs string files with NULL
pointers. Add a WARN_ON() to expose offending callers and return early.

Fixes: 9af0440ec86e ("debugfs: Implement debugfs_create_str()")
Reported-by: yangshiguang <yangshiguang@xiaomi.com>
Closes: https://lore.kernel.org/lkml/2025122221-gag-malt-75ba@gregkh/
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
v2:
* No changes.
---
 fs/debugfs/file.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index 3376ab6a519d..a941d73251b0 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -1127,7 +1127,7 @@ static const struct file_operations fops_str_wo = {
  *          directory dentry if set.  If this parameter is %NULL, then the
  *          file will be created in the root of the debugfs filesystem.
  * @value: a pointer to the variable that the file should read to and write
- *         from.
+ *         from. This pointer and the string it points to must not be %NULL.
  *
  * This function creates a file in debugfs with the given name that
  * contains the value of the variable @value.  If the @mode variable is so
@@ -1136,6 +1136,9 @@ static const struct file_operations fops_str_wo = {
 void debugfs_create_str(const char *name, umode_t mode,
 			struct dentry *parent, char **value)
 {
+	if (WARN_ON(!value || !*value))
+		return;
+
 	debugfs_create_mode_unsafe(name, mode, parent, value, &fops_str,
 				   &fops_str_ro, &fops_str_wo);
 }
-- 
2.43.0

