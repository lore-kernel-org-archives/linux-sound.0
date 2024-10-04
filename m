Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABCC156885
	for <linux-sound@vger.kernel.org>; Fri,  4 Oct 2024 09:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728034913; cv=none; b=kS7m6bgIsfUI8X300iwZ/8eE4XGuvdSAiUmh9QZdHf79FcXtMbjf0IZ4ZqYxYMqZqgEH53xq6L2QcjSWShrYUeqcXFJc0e8sdqiBvfSqxd/yjCawmicFkO6mffRY5iO2UcFJN/yn6xLQ5mgFLKMZPvVP2VETbhr2R5Y8mp0AmM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728034913; c=relaxed/simple;
	bh=skrrC9GqnVpyR9eDHr2w9tGv0UdqyDyZPhgrNzhIJOo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VcgbRd79i8UQXf3JK2zy2M7lgqrrA5w0fCvByzFLwsKIB5QNeEOIE5uAZAN+9lvji2ztKio4hYtD4LM7gQSB8Q9mbGcVyM6VXpMQ2MT52Lbjq7rJ6+BhP8AESgtF/SntOHrC8qxrqoIqexlCUzblqEC7w+owKgpJOqdxUUWwS/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YoAJWtXS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YoAJWtXS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728034911; x=1759570911;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=skrrC9GqnVpyR9eDHr2w9tGv0UdqyDyZPhgrNzhIJOo=;
  b=YoAJWtXSuPGByv1ADED6NWjU4NwLBsL4AfzPTP+Pa2Mo4zklzOHJuLzm
   oBg3De0zkjQqTgyWHShS9CrBEfBCYM0coMva79iwhd7USkPhuoxGbEt6D
   pOPvU4iRm9yWvWEmG9tg3nrvbQA8KhWnydVj2COnsn1Na30ve4hIbiqGP
   Csc9sxlO+NcJ3EjfG4KSJX6uRJRQ3v4PEB4FnoJFF97vmtbx02sHt8BPa
   0UQN/qXRs+audB4hZM9yUpF20+jg2x2u0hM80Y0GiUUTNaEJBXBaoFW3U
   rtzJEZFb6dAxLtuVgAt6n6NRbencnitlEgPxjUfmfp7ai3cg1o8NWiCSc
   Q==;
X-CSE-ConnectionGUID: buKrlhesSb+OTLH6bT/DxA==
X-CSE-MsgGUID: DWgafKMxSE6RvB6dMDC2JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27136194"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="27136194"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:48 -0700
X-CSE-ConnectionGUID: KuQn5VE7TZCxwBRowJE72g==
X-CSE-MsgGUID: 4Bomje3ETJWZVxw6UlbBEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="105492081"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:47 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CC58F11FA2C;
	Fri,  4 Oct 2024 12:41:44 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sweoi-000TfR-2e;
	Fri, 04 Oct 2024 12:41:44 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Sanyog Kale <sanyog.r.kale@intel.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 40/51] soundwire: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:44 +0300
Message-Id: <20241004094144.114031-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend() will soon be changed to include a call to
pm_runtime_mark_last_busy(). This patch switches the current users to
__pm_runtime_put_autosuspend() which will continue to have the
functionality of old pm_runtime_put_autosuspend().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/soundwire/bus.c            | 2 +-
 drivers/soundwire/cadence_master.c | 2 +-
 drivers/soundwire/qcom.c           | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index d1dc62c34f1c..ad07f21bcb87 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1812,7 +1812,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 
 io_err:
 	pm_runtime_mark_last_busy(&slave->dev);
-	pm_runtime_put_autosuspend(&slave->dev);
+	__pm_runtime_put_autosuspend(&slave->dev);
 
 	return ret;
 }
diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 05652e983539..3e75e07aee2f 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -485,7 +485,7 @@ static int cdns_parity_error_injection(void *data, u64 value)
 	 * also result in Slave devices suspending.
 	 */
 	pm_runtime_mark_last_busy(bus->dev);
-	pm_runtime_put_autosuspend(bus->dev);
+	__pm_runtime_put_autosuspend(bus->dev);
 
 	return 0;
 }
diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 2b403b14066c..f5313687ff5b 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -657,7 +657,7 @@ static irqreturn_t qcom_swrm_wake_irq_handler(int irq, void *dev_id)
 	}
 
 	pm_runtime_mark_last_busy(ctrl->dev);
-	pm_runtime_put_autosuspend(ctrl->dev);
+	__pm_runtime_put_autosuspend(ctrl->dev);
 
 	return IRQ_HANDLED;
 }
@@ -1295,7 +1295,7 @@ static void qcom_swrm_shutdown(struct snd_pcm_substream *substream,
 
 	swrm_wait_for_wr_fifo_done(ctrl);
 	pm_runtime_mark_last_busy(ctrl->dev);
-	pm_runtime_put_autosuspend(ctrl->dev);
+	__pm_runtime_put_autosuspend(ctrl->dev);
 
 }
 
@@ -1477,7 +1477,7 @@ static int swrm_reg_show(struct seq_file *s_file, void *data)
 		seq_printf(s_file, "0x%.3x: 0x%.2x\n", reg, reg_val);
 	}
 	pm_runtime_mark_last_busy(ctrl->dev);
-	pm_runtime_put_autosuspend(ctrl->dev);
+	__pm_runtime_put_autosuspend(ctrl->dev);
 
 
 	return 0;
-- 
2.39.5

