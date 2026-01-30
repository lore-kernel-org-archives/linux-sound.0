Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF59134CF
	for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 13:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769781348; cv=none; b=UcUn9oUAjI5zK5aEKT0EMS4MTejKLi+Pu2LiN4PWpDwTmeR2SKpObNaKnFQpABCABOk10Gyv+aYIu5dpF01kvb1teMISiTrA1zA1ewexm68iesisahrDqlKoQ9JaJCxWCfm1kPoRfEv1nl52vYo32QxtvKqGhmIYIVN3IGLhdGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769781348; c=relaxed/simple;
	bh=hko40ZQ+LNmx+B+wL7stl9ye8eQX5/GtMZrow51kN9M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ipby2yGLU5sgkUvpAWOxProF46vJJXnedwcvzaAIWh7GrSJDOzEmnWCK+5ogVClBak5d2aEhLGP5Jfb10EnPEjyrIT3PDzpWgkZ5R3MqUR5/Sy6US/xnRUeXkOtTD8hFy8pEFQPI8qtFPNk8/X7oOIuInvxWAAOzs5m1j9WwaYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KzNRtE9q; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KzNRtE9q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769781346; x=1801317346;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hko40ZQ+LNmx+B+wL7stl9ye8eQX5/GtMZrow51kN9M=;
  b=KzNRtE9qeAH1+l6vn14gRy2dscVebChOn8qNCK8HfrWWBDyC8dEmyRQS
   nHYgK9TX1qfIwRYuTPVqaX6whNDYDfItr5sfRDi+X7NEhEWsUwbgaCXij
   FkiPRjGRHb5W35+PJMn9BD0J1DKPoVxUrPWjQhE/kQX9s3TjDcwAGC3H0
   4rEUC2Tzr9UuOvD+W0nSFG6rZ7P1cv99pk1oZQPftj3DDdPm5KEw5D/ct
   RqjBpwrzNj/Im/zVqlOGtqwGRbt8ElD24VPhx8K4Ml+lf8gFbNWuQTNDt
   UtR5fcIfYcV3DsdtpT9r7XxbzXptZEToC43pzX8nUabX55fcf4YMDTLHE
   w==;
X-CSE-ConnectionGUID: tF1X0h+pTHmR1BPDWJLSxQ==
X-CSE-MsgGUID: KLDgZntgQSOpTh+qo70jmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70231812"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="70231812"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 05:55:45 -0800
X-CSE-ConnectionGUID: 6J2wba11Qeu2VQpDnfxT8w==
X-CSE-MsgGUID: 66hxROKXQvuHigrgzPfTKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="208663537"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa009.jf.intel.com with ESMTP; 30 Jan 2026 05:55:44 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: tiwai@suse.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	amade@asmblr.net,
	kuninori.morimoto.gx@renesas.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH] ALSA: control: Verify put() result when in debug mode
Date: Fri, 30 Jan 2026 14:55:41 +0100
Message-Id: <20260130135541.115574-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The put() operation is expected to return:
1) 0 on success if no changes were made
2) 1 on success if changes were made
3) error code otherwise

Currently 2) is usually ignored when writing control-operations. While
forcing compliance is not an option right now, make it easier for
developers to adhere to the expectations and notice problems by logging
them when CONFIG_SND_CTL_DEBUG is enabled.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/core/control.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 9c3fd5113a61..257976efece1 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -1264,6 +1264,32 @@ static int snd_ctl_elem_read_user(struct snd_card *card,
 	return result;
 }
 
+__maybe_unused
+static int snd_ctl_write_verify(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *control)
+{
+	struct snd_ctl_elem_value original;
+	int ret, retcmp;
+
+	ret = kctl->get(kctl, &original);
+	if (ret)
+		return ret;
+
+	ret = kctl->put(kctl, control);
+	if (ret < 0)
+		return ret;
+
+	retcmp = memcmp(&original.value.bytes.data[0], &control->value.bytes.data[0],
+			sizeof(original.value.bytes.data[0]));
+	if (retcmp)
+		retcmp = 1;
+
+	if (retcmp == ret)
+		pr_info("kctl->put() returned the expected value of '%d'\n", ret);
+	else
+		pr_warn("expected kctl->put() to return '%d' but got '%d'\n", ret, retcmp);
+	return ret;
+}
+
 static int snd_ctl_elem_write(struct snd_card *card, struct snd_ctl_file *file,
 			      struct snd_ctl_elem_value *control)
 {
@@ -1299,8 +1325,13 @@ static int snd_ctl_elem_write(struct snd_card *card, struct snd_ctl_file *file,
 			result = sanity_check_input_values(card, control, &info,
 							   false);
 	}
-	if (!result)
-		result = kctl->put(kctl, control);
+
+	if (!result) {
+		if (IS_ENABLED(CONFIG_SND_CTL_DEBUG))
+			result = snd_ctl_write_verify(kctl, control);
+		else
+			result = kctl->put(kctl, control);
+	}
 	if (result < 0) {
 		up_write(&card->controls_rwsem);
 		return result;
-- 
2.34.1

