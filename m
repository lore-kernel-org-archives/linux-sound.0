Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E9219F13F
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 04:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773807377; cv=none; b=et7EdE6gqTvuFRD0rznnWKyABAwJ6o7+sse23Kq/9pWXu5EmDwh1Rf3v2W7MVIA/CG7fPw1MC7e7By13tpssnlE0NwUVMSHbpgxWdNeZVnfvyF+mUtldx4nU11731YdZA8Ik2m8JqlxEIuHVJvEveTR3TwzyU2WroyZrzdoT9KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773807377; c=relaxed/simple;
	bh=Bl3WeNXsYwqhtCfUXVQyix1i9349h84AWX2WLJCmfic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fHU/tjzwElp91q+Tt5yM7tBTxfPgYDUvoO0I4skWmQbRu4pRZ8vBvMyACix85R3tvhzC+FmV/vhFpmix9A6/6v40SJbNn7QcH+6F1TLTa/RlN/r1T/vhn0pYAByiCwANlKURj7cmOk6000ws/v8GuyR1O09xGet6/jnINIV81WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BANmj07X; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BANmj07X"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c0cf039a45so4116624eec.0
        for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 21:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773807374; x=1774412174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZvDiA5OjEH9jB/X3wjJ3qQao5asOiEdEuR+UFxLqYM=;
        b=BANmj07XvQel43Aed1cNz0pMqmOAKAEOPcDopXvwlle9ZhV/CvJqm2iNUWzdHfLwmY
         HJUqlckQgoI7dUqjZd5Vf3fKK9J2MfIM9TQS9k4ASe9ERpmi0uDVNkt4KFgS/zpXJaeM
         FBOoJ+j3zJSe7uZpGA+aeA30sVWgKgsIfJmd5YSkoWyMJ0iJXAc8ZfB44e+MXn01x7mB
         QXIj23E7seT8P1rXT0Z0MD13xNe/+h97ceQFt4Z16t3jSb0CXP7qjH8BdKChdHa9QXqN
         sOXSKStNMPU5k8yWGIpapw39U1MrFKCbbhmH5RJ5qm3umP5mGvKCtAEf76eAeKEN8H3Z
         0Ekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773807374; x=1774412174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JZvDiA5OjEH9jB/X3wjJ3qQao5asOiEdEuR+UFxLqYM=;
        b=SZ9HVDnNh0GUqQHvYSPekM1Y3eJVA8Q911DkD/GR3bkeDVDwsAXnnnf4u1vHad3qos
         RjcnsuXxDzYef9FR8WiaALF6cGOWfayIh9jVSradg3EBJXLd+zAzh0M3kGcBGn2RtMvl
         RcKZeqzsOVi/5Ceehn3hlHB+JrHgZuAfMfnd1jdqZl8QngA2ZAJTf+fQZijQLNRk0mQH
         EleaXVDcovdvmqSE8I1nN/KMaQU5sOI7RIQLda27w3LRxhIwsGRVMR0KfypnUV52TFln
         6puhYi9jHqzoPAsOUReGcbm4WZNVTy+T5L3MOZ8MKVFUu/u9B5yfoJEYMLOJ1IzcFTQ0
         5rAw==
X-Forwarded-Encrypted: i=1; AJvYcCWQNNk2H47aRW+tUPRZ7qA13Z7jsLb4NKv5CrqIwG3NE04jqEd4jQQfbTB1yyR0tyNUex55QWbv/WuY+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7d41a5KS4PIyq5OM0PU/ncPLSNnvUuMXeAG46VdDS698W7y8B
	/riy1BSk77Scbls338FFRDGhpt/z65QR/z1dEi9Z7wny13mak/vYbStB
X-Gm-Gg: ATEYQzzc4ZYNOc3RhSisGrmUCcbLHTfed/vUy6/tiYDcIJWI4/iUx0DTU2E1Rmizwty
	CP11l91wp2zq7pfDmJwoqqJly11sV3VWSvqDARbgXca3KHOL1OC4V4RmnkpS77XpfieCNYFo8P2
	/BSi7OdzYuC+gSpuvyYDswPEuLO44zHrTWl4xtwk8Bx0xeZGFaq+tpYwSMkPREKPC1oc43H39lU
	CCTORxopGBzkPWaIKgvPOtzMRDvBR9LZctpyKKLTG0vSM2VY+uH0rTuSWLtceP1QNXYHBKvNAhn
	5rkJtBG2G5NNEEt8zbguMhfkttskWvOplCFrfdq86UW+jby7snW6o9hfSJxOYRagM6gdzKk2JpO
	R/3WT+ibGWYG+DQDWRrX2vtfY0TrfMPn7kkt80gb3iTI6diASMzqfH2HfH43oF5lP988yDd5OT6
	jpQMYtWsoqnTGUHVVnqeWU1Fl2rTCNJ8c07Dhs+QI9ZVbqXYy2G5kLpTHKNw+ENYfNSuxg7ZoyQ
	jO94u58ySZMzxjSS9Rk0dgDsRq/oCvem6U8X7Hw6kdg72ROezHM8h089ytpXt6dtqCJBy2l
X-Received: by 2002:a05:693c:2c06:b0:2be:833c:14a6 with SMTP id 5a478bee46e88-2c0e5044091mr1153364eec.15.1773807373685;
        Tue, 17 Mar 2026 21:16:13 -0700 (PDT)
Received: from 2045L.localdomain (130.sub-75-229-251.myvzw.com. [75.229.251.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e560fb5fsm2790870eec.31.2026.03.17.21.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 21:16:13 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: hanguidong02@gmail.com
Cc: akaieurus@gmail.com,
	dakr@kernel.org,
	dri-devel@lists.freedesktop.org,
	driver-core@lists.linux.dev,
	gregkh@linuxfoundation.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	me@ziyao.cc,
	pierre-louis.bossart@linux.dev,
	rafael@kernel.org,
	rander.wang@intel.com,
	vkoul@kernel.org,
	yangshiguang@xiaomi.com,
	yung-chuan.liao@linux.intel.com
Subject: Re: [PATCH 3/4] soundwire: debugfs: initialize firmware_file to empty string
Date: Wed, 18 Mar 2026 12:14:28 +0800
Message-ID: <20260318041446.9066-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317191029.43515-1-hanguidong02@gmail.com>
References: <20260317191029.43515-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Mar 18, 2026 at 3:11 AM Gui-Dong Han <hanguidong02@gmail.com> wrote:
>
> Passing NULL to debugfs_create_str() causes a NULL pointer dereference
> upon reading, and creating debugfs nodes with NULL string pointers is no
> longer permitted. Change the initialization of firmware_file to an
> allocated empty string. Existing driver code using this field handles
> empty strings correctly.
>
> Fixes: fe46d2a4301d ("soundwire: debugfs: add interface to read/write commands")
> Reported-by: yangshiguang <yangshiguang@xiaomi.com>
> Closes: https://lore.kernel.org/lkml/17647e4c.d461.19b46144a4e.Coremail.yangshiguang1011@163.com/
> Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
> ---
>  drivers/soundwire/debugfs.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
> index ccc9670ef77c..d4abe8bfca76 100644
> --- a/drivers/soundwire/debugfs.c
> +++ b/drivers/soundwire/debugfs.c
> @@ -358,8 +358,9 @@ void sdw_slave_debugfs_init(struct sdw_slave *slave)
>         debugfs_create_file("go", 0200, d, slave, &cmd_go_fops);
>
>         debugfs_create_file("read_buffer", 0400, d, slave, &read_buffer_fops);
> -       firmware_file = NULL;
> -       debugfs_create_str("firmware_file", 0200, d, &firmware_file);
> +       firmware_file = devm_kstrdup(&slave->dev, "", GFP_KERNEL);
> +       if (firmware_file)
> +               debugfs_create_str("firmware_file", 0200, d, &firmware_file);

I initially patterned this fix after commit 8cc27f5c6dd1 [1] by using
devm_kstrdup(). However, I realized that approach is flawed:
debugfs_write_file_str() calls a raw kfree(), which causes a mismatch.
I have submitted a separate patch [2] to fix that existing commit.

Additionally, firmware_file is a global pointer in this driver. The
original code blindly overwrote it with NULL every time a new slave was
added.

To fix both issues properly, I moved the allocation to the subsystem
init and exit paths so it is only allocated once.

The updated v2 patch is included below for review. I will wait for
further comments on the rest of the series and include this updated
patch if a full v2 series is required.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8cc27f5c6dd1
[2] https://lore.kernel.org/linux-pm/20260318024815.7655-1-hanguidong02@gmail.com/

From bbaff3bc33746a965a2387ffe8302d05e700a1c3 Mon Sep 17 00:00:00 2001
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Wed, 18 Mar 2026 03:10:29 +0800
Subject: [PATCH v2 3/4] soundwire: debugfs: initialize firmware_file to empty string

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
v2:
* Replace devm_kstrdup() with kstrdup() to fix allocation/free mismatch
with debugfs.
* Move initialization to subsystem init/exit paths to avoid overwriting
the global pointer on every slave probe.
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

