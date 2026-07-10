Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7773F0AA8;
	Fri, 10 Jul 2026 08:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783672853; cv=none; b=gXttBdQfWu9H/xNH8IbSe7mQHdcGpChq65wRVg1M4tkm+VqmsQAt3LQxEnN2j1YGcYc40/ApQwnW2Av7xX6yHGMx9MtBdPlP/ls5J3dt2uZixOAKQkQ/lkx/3eFxnMAPNk68dkihxG5lIotT2UKsXkD/mzy3zorePaYd1D5f1rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783672853; c=relaxed/simple;
	bh=vjeXzvJysBNVryqHGRY2qgTAFKsmujbZx1C+wxWRg10=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QpEOwRypByt6sIFso+ebaPHaUrlPjyYSvh+RbPKCszxqyHbx88g83aSLP3MBxpHyBwnVXeuKWlfp6RfHiKbb2SFegOqGp5OQ0jaLvn6D1Zm5d79tkVPGLCAgp1MCrLtW47oabXzBIz50QI3IgJfZLFtOCYO3vdrAYWfADKAoJwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jqJpu4bb; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jqJpu4bb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=B2
	KzJRY0o/yxWMt8IZ4bWs1sbL8etNvXMlVnjDa1lRQ=; b=jqJpu4bbSUNZC3+fcg
	NETX0mMMNQZFdkwfsYST97viqAJzR27MtCpDfVXO2+GT5ZS/+MWZgdbz5Gs9CP7z
	bqHsgXXK5GWEfR/vG6xM+vXI+dNibfpLlOOfvzIPNGPj/f+mjqq9YHCprgbXHWcV
	624OzWJ0/s/o38K92wy2r77I8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wAn6Ozsr1BqBwqkHg--.166S3;
	Fri, 10 Jul 2026 16:40:26 +0800 (CST)
From: wangdich9700@163.com
To: tiwai@suse.com,
	david.rhodes@cirrus.com,
	wangdich9700@163.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH v2 1/3] ALSA: hda/cs35l41: Use scoped_guard() for fw_mutex in cs35l41_hda_bind()
Date: Fri, 10 Jul 2026 16:40:07 +0800
Message-Id: <20260710084009.665814-2-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260710084009.665814-1-wangdich9700@163.com>
References: <20260710084009.665814-1-wangdich9700@163.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAn6Ozsr1BqBwqkHg--.166S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr1rKryUGr1DGF4rKFy3Jwb_yoWrJr13pa
	15XayfGrs8XF129r17JF4xZFs8uryFga15Wr1jya48Jw1SgryUJay3XF12qF1fXrZF9343
	XF17trn3ZryUtr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pigTm3UUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCvxrYKGpQr-oybQAA3l

From: wangdicheng <wangdicheng@kylinos.cn>

The rest of the driver already uses guard()/scoped_guard() for
fw_mutex. Replace the manual mutex_lock/mutex_unlock pair in
cs35l41_hda_bind() with scoped_guard() for consistency.

No functional changes.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/hda/codecs/side-codecs/cs35l41_hda.c | 57 +++++++++++-----------
 1 file changed, 28 insertions(+), 29 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.c b/sound/hda/codecs/side-codecs/cs35l41_hda.c
index 64a5bd895fd1..818ea8e3f8d6 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c
@@ -1482,42 +1482,41 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 
 	guard(pm_runtime_active_auto)(dev);
 
-	mutex_lock(&cs35l41->fw_mutex);
-
-	comp->dev = dev;
-	cs35l41->codec = parent->codec;
-	if (!cs35l41->acpi_subsystem_id)
-		cs35l41->acpi_subsystem_id = kasprintf(GFP_KERNEL, "%.8x",
-						       cs35l41->codec->core.subsystem_id);
-
-	strscpy(comp->name, dev_name(dev), sizeof(comp->name));
+	scoped_guard(mutex, &cs35l41->fw_mutex) {
+		comp->dev = dev;
+		cs35l41->codec = parent->codec;
+		if (!cs35l41->acpi_subsystem_id)
+			cs35l41->acpi_subsystem_id = kasprintf(GFP_KERNEL, "%.8x",
+							       cs35l41->codec->core.subsystem_id);
 
-	cs35l41->firmware_type = CS35L41_HDA_FW_SPK_PROT;
+		strscpy(comp->name, dev_name(dev), sizeof(comp->name));
 
-	if (firmware_autostart) {
-		dev_dbg(cs35l41->dev, "Firmware Autostart.\n");
-		cs35l41->request_fw_load = true;
-		if (cs35l41_smart_amp(cs35l41) < 0)
-			dev_warn(cs35l41->dev, "Cannot Run Firmware, reverting to dsp bypass...\n");
-	} else {
-		dev_dbg(cs35l41->dev, "Firmware Autostart is disabled.\n");
-	}
+		cs35l41->firmware_type = CS35L41_HDA_FW_SPK_PROT;
 
-	ret = cs35l41_create_controls(cs35l41);
+		if (firmware_autostart) {
+			dev_dbg(cs35l41->dev, "Firmware Autostart.\n");
+			cs35l41->request_fw_load = true;
+			if (cs35l41_smart_amp(cs35l41) < 0)
+				dev_warn(cs35l41->dev, "Cannot Run Firmware, reverting to dsp bypass...\n");
+		} else {
+			dev_dbg(cs35l41->dev, "Firmware Autostart is disabled.\n");
+		}
 
-	comp->playback_hook = cs35l41_hda_playback_hook;
-	comp->pre_playback_hook = cs35l41_hda_pre_playback_hook;
-	comp->post_playback_hook = cs35l41_hda_post_playback_hook;
-	comp->acpi_notify = cs35l41_acpi_device_notify;
-	comp->adev = cs35l41->dacpi;
+		ret = cs35l41_create_controls(cs35l41);
 
-	comp->acpi_notifications_supported = cs35l41_dsm_supported(acpi_device_handle(comp->adev),
-		CS35L41_DSM_GET_MUTE);
+		comp->playback_hook = cs35l41_hda_playback_hook;
+		comp->pre_playback_hook = cs35l41_hda_pre_playback_hook;
+		comp->post_playback_hook = cs35l41_hda_post_playback_hook;
+		comp->acpi_notify = cs35l41_acpi_device_notify;
+		comp->adev = cs35l41->dacpi;
 
-	cs35l41->mute_override = cs35l41_get_acpi_mute_state(cs35l41,
-						acpi_device_handle(cs35l41->dacpi)) > 0;
+		comp->acpi_notifications_supported =
+			cs35l41_dsm_supported(acpi_device_handle(comp->adev),
+					      CS35L41_DSM_GET_MUTE);
 
-	mutex_unlock(&cs35l41->fw_mutex);
+		cs35l41->mute_override = cs35l41_get_acpi_mute_state(cs35l41,
+							acpi_device_handle(cs35l41->dacpi)) > 0;
+	}
 
 	sleep_flags = lock_system_sleep();
 	if (!device_link_add(&cs35l41->codec->core.dev, cs35l41->dev, DL_FLAG_STATELESS))
-- 
2.25.1

