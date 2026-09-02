Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167AB377EC5
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 08:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336862; cv=none; b=EsaDeAcFT5m6ONeVGyWjwT3HQ0VkU0iGyKcNL63WHD1ZoLJ19O1/gp/QbZ4W17aFS/33CXGXrtJ3ADFX4+IGSAHH241ekJj0EaaO84eAzvr7SII2u993XU05Y5ojRWzBxoETdEn21rsHKSojdfwquWhH97HZN2BzUv9gxsyMzNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336862; c=relaxed/simple;
	bh=BAVdsAVQnJ5KdyOugV+Msv43Jgls7cyem4g7psGZQto=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GzaTlfi2VLigx98IjPSnkM5/xI4nwZjgpfGbRfU7Xx/RGUNPYPbaQKcngraHR7QodQ77IBRTbDugG6gc2rh5XzHMKpBdC9IsI6XybY3xLs7A+qc1rkjz7K7DBNC05zvUUN35l0dUkIzMdYch/RRl+WbzP6UNVH+Bwi0+xAmaM+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lGIJC9Oz; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lGIJC9Oz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788336860; x=1819872860;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BAVdsAVQnJ5KdyOugV+Msv43Jgls7cyem4g7psGZQto=;
  b=lGIJC9OzN5K8uW6DLNZM6D2wBwPQk7ge9w345N+IIK44bc9LFgRD1Oe3
   1qUyE/580JHqy2bNwjVKIAwft6PUmU4JB59PssL0MmuyJchXt8q351TOh
   hOchWmVLxzkjXqrsEnj+f1nWG4mQ8otziMinr5lAk7e8YVL5g2xYh2J/H
   dw/qenb0btGzZxCAK4GrnYW/cyEfPYYSeD2SpD0qudKqKrLPntcF1pjyO
   fwDTznCVJvoXmFp4N0VMk0PEDyEA3F6wJUOGypON8KeOPR/2QN2PPiMqy
   QznBsmZBw3+Zers9DGdJTKb4UCdMFqQiEEvYmItPsM8gX/YcbvoSQxD7I
   A==;
X-CSE-ConnectionGUID: +5x8Os8OTZaunz4dnxfi8g==
X-CSE-MsgGUID: 36GRtJR6TImEINxwN34/HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99121009"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="99121009"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 01:14:17 -0700
X-CSE-ConnectionGUID: uRQQytX2QViVGzpCT1QgHw==
X-CSE-MsgGUID: NRmjFmODSpyNgOLF1CXgoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="266099087"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 02 Sep 2026 01:14:16 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v4 08/10] ASoC: Intel: avs: Fix unbalanced module reference count
Date: Wed,  2 Sep 2026 10:18:12 +0200
Message-Id: <20260902081814.1590883-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902081814.1590883-1-cezary.rojewski@intel.com>
References: <20260902081814.1590883-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strace_open() invokes try_module_get() which on success takes
the module reference.  If any follow up operation causes
strace_open() to fail, the refcount shall be put down.

Fixes: 0a5fb3cc28fd ("ASoC: Intel: avs: Keep module refcount up when gathering traces")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/debugfs.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/debugfs.c b/sound/soc/intel/avs/debugfs.c
index 9ab503da3b75..bc02737720ab 100644
--- a/sound/soc/intel/avs/debugfs.c
+++ b/sound/soc/intel/avs/debugfs.c
@@ -9,6 +9,7 @@
 #include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/kfifo.h>
+#include <linux/module.h>
 #include <linux/wait.h>
 #include <linux/sched/signal.h>
 #include <linux/string_helpers.h>
@@ -236,15 +237,20 @@ static int strace_open(struct inode *inode, struct file *file)
 	if (!try_module_get(adev->dev->driver->owner))
 		return -ENODEV;
 
-	if (kfifo_initialized(&adev->trace_fifo))
-		return -EBUSY;
+	if (kfifo_initialized(&adev->trace_fifo)) {
+		ret = -EBUSY;
+		goto err;
+	}
 
 	ret = kfifo_alloc(&adev->trace_fifo, PAGE_SIZE, GFP_KERNEL);
 	if (ret < 0)
-		return ret;
+		goto err;
 
 	file->private_data = adev;
 	return 0;
+err:
+	module_put(adev->dev->driver->owner);
+	return ret;
 }
 
 static int strace_release(struct inode *inode, struct file *file)
-- 
2.34.1

