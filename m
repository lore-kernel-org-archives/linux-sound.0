Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3E714A08E
	for <linux-sound@vger.kernel.org>; Fri,  4 Oct 2024 09:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728034910; cv=none; b=g3gyXSqu0lOi5WpQWcsaKQtcVtDonT4NpUauRsUFKB33woOZKlOLlKY9ckBAlzD7R6cgcSXuvny4zNGgkgoSEbwiDNPnK3mTAeB4IkFr/e6zZJpVEGlIoJ7o3hyFscthnpYEl2inG4mrE13K3k3TRHn7SXCwBudtJM7Pyw/CCBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728034910; c=relaxed/simple;
	bh=Qw/klgQD9fyYUbOWZPQswiATbgxDa99MRyh1In8E/9g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nunk/zULboYYXS8XWTsLUq6XGwnq/P6zfGl5ryHGG5hZE6KypUs+7vTAf6Bk7NwFbN/Qsr8ne3c6S8BbuXYH8aKXK2tDxECQ/cOkyPyHqA7lvozyZwrj33guek+9gL59Hlzh2gCc+RaXWFbqzqW5Py8iNPpF3+NjMd5zRnqXZYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cy4xu9B2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cy4xu9B2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728034908; x=1759570908;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qw/klgQD9fyYUbOWZPQswiATbgxDa99MRyh1In8E/9g=;
  b=Cy4xu9B2FPFLRcFBj3yfWfjSl1szmPgW3IWsFk+J5eoR/Q5gHkHqICcS
   GshzrFSFFUEvY8CdExIAbbYSvThptvO9cGU1jHutgMxV/lNCKKPlUNZYl
   Z9eEX8pDaMcciixrJ6uA4qjP8lzyoRxSxJUBJiIj2zy+hg5EfAsEt/tBo
   M4noEFj3QcsZMf/fFZbcUjc6QDh/6XAon2JfaSsIUSSNTYU5jgoXM7xHu
   FtmeBMQtxW+QSkYd4N1c15C597GBJN7GTfdA210K9yKA+2ye9Xp1pp9mF
   YM2Qmt+6Cmm8bpajGTvIjmVOsYonSZR1Ze7rJ3ggkEWVkcEXBcYz+6GbA
   A==;
X-CSE-ConnectionGUID: bPUUq8AbSraaX0xcwKe+gA==
X-CSE-MsgGUID: A8wJOIQbT8++ZCx/hNVy6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27136187"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="27136187"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:48 -0700
X-CSE-ConnectionGUID: sfoo47wiT/S5hgnV65T0RA==
X-CSE-MsgGUID: RfXsiko6RyCJRJ4aJKpFoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="105492075"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:47 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B809011FA28;
	Fri,  4 Oct 2024 12:41:44 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sweoi-000TfA-2O;
	Fri, 04 Oct 2024 12:41:44 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 39/51] slimbus: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:44 +0300
Message-Id: <20241004094144.114014-1-sakari.ailus@linux.intel.com>
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
 drivers/slimbus/core.c      | 2 +-
 drivers/slimbus/messaging.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/slimbus/core.c b/drivers/slimbus/core.c
index 65e5515f7555..0c1127854f85 100644
--- a/drivers/slimbus/core.c
+++ b/drivers/slimbus/core.c
@@ -512,7 +512,7 @@ int slim_device_report_present(struct slim_controller *ctrl,
 
 slimbus_not_active:
 	pm_runtime_mark_last_busy(ctrl->dev);
-	pm_runtime_put_autosuspend(ctrl->dev);
+	__pm_runtime_put_autosuspend(ctrl->dev);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(slim_device_report_present);
diff --git a/drivers/slimbus/messaging.c b/drivers/slimbus/messaging.c
index 242570a5e565..992826556c64 100644
--- a/drivers/slimbus/messaging.c
+++ b/drivers/slimbus/messaging.c
@@ -48,7 +48,7 @@ void slim_msg_response(struct slim_controller *ctrl, u8 *reply, u8 tid, u8 len)
 
 	/* Remove runtime-pm vote now that response was received for TID txn */
 	pm_runtime_mark_last_busy(ctrl->dev);
-	pm_runtime_put_autosuspend(ctrl->dev);
+	__pm_runtime_put_autosuspend(ctrl->dev);
 }
 EXPORT_SYMBOL_GPL(slim_msg_response);
 
@@ -171,7 +171,7 @@ int slim_do_transfer(struct slim_controller *ctrl, struct slim_msg_txn *txn)
 		 * if there was error during this transaction
 		 */
 		pm_runtime_mark_last_busy(ctrl->dev);
-		pm_runtime_put_autosuspend(ctrl->dev);
+		__pm_runtime_put_autosuspend(ctrl->dev);
 	}
 	return ret;
 }
-- 
2.39.5

