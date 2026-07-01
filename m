Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D263B19DB;
	Wed,  1 Jul 2026 06:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782888632; cv=none; b=HO3mGRei5GFFvbzxU7TVdOyGuvDXIc7+emJRGyAtbbNzpCFRYsnB1JldKysRioguG3KmsATNZ5nZHPLf3YTLESYnDyPiOqtujC/fGO6HQ41UQ9hl4C13w2cOhCZDnYJRS8IGIhXcC9edpHoJvi+I9UBEuhCsHN50pI5LkkowtT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782888632; c=relaxed/simple;
	bh=vjeXzvJysBNVryqHGRY2qgTAFKsmujbZx1C+wxWRg10=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DfluFCDyWuZqdZu/daNgpJW6L9d2w9tlYauwrr3nb3vdQUfOTrvxxAajDhQGX/wq6Rz27vmL8xPXJ2c5j0Uw0rWD0Nb9sUCHMQCQB7j2N37yAj1d1eG5G9THSM2IxEMML5x/13MY1GG+T8HFoyUUtNTlM5P086iJC0ijaGX1h4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=BIhEKXvJ; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="BIhEKXvJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=B2
	KzJRY0o/yxWMt8IZ4bWs1sbL8etNvXMlVnjDa1lRQ=; b=BIhEKXvJHUXOdFfEjl
	Vp+j1VVbGFSjBd1DWTjej8FZ66y4Pamlyk0v3gbi+xRTTebpt82jKTGzN9VXz5ik
	iQaaijWtYS2QFygAh2HzoWVVx2J4wysAPXNRZXJPCcDYIDgPfs/z3AnYld7yf0fS
	KiHLJ8+KFisqsevCWqitNOxCM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDHDveKuERqvbJQGw--.29951S3;
	Wed, 01 Jul 2026 14:49:50 +0800 (CST)
From: wangdich9700@163.com
To: perex@perex.cz,
	tiwai@suse.com,
	wangdicheng@163.com
Cc: david.rhodes@cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH 1/3] ALSA: hda/cs35l41: Use scoped_guard() for fw_mutex in cs35l41_hda_bind()
Date: Wed,  1 Jul 2026 14:49:23 +0800
Message-Id: <20260701064925.593372-2-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260701064925.593372-1-wangdich9700@163.com>
References: <20260701064925.593372-1-wangdich9700@163.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHDveKuERqvbJQGw--.29951S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr1rKryUGr1DGF4rKFy3Jwb_yoWrJr13pa
	15XayfGrs8XF129r17JF4xZFs8uryFga15Wr1jya48Jw1SgryUJay3XF12qF1fXrZF9343
	XF17trn3ZryUtr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jFwZ7UUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCvw78TGpEuI6cYwAA3m

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

