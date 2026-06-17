Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA8343E9FD
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692859; cv=none; b=Ju89wwucTIVk6YhvCN5AeD/vk3ELi38ScJf+BAxNIMW/UJm0UNRaz3xuHUw6GSUO4WM5TBGwj2aKJ2okvpeVIhSdl0P5sPsrzUq4l5JebuCpV4ZlV0xOUfAIyRy95iC0qhN/A89XP62wrGgXy304dkaxWd1IY9uNArcNN1LHX8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692859; c=relaxed/simple;
	bh=QkG7uMhxFhIgdfzJMdnxdGkaLUEDO6tHpYig6hGOA/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mZme1fs11MWvhMTQzPVmP9NOsKyD0zSslYyAP8N0yjMfBRFigZOBBNxhLxC2MdDtm9AmdDFAiJh/UUZ95qEv87wzfJb3WwJPTPAxRA430KmNmj+SnWkCT442LVAwpHZYKwv5XExbfWw7WlIbr2LkWGz4g6m62KAN11CLi6auNeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJzQgBPB; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJzQgBPB"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30759632453so8919228eec.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692857; x=1782297657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxB3SnelSJeC61Cb2O2sZ2DxgfCvfhJf77FHm8odZMc=;
        b=MJzQgBPBt2rwZXJjiBNEWBVl/FO9EPxRhpM9n5Ar2hXf1nnB4logthggFDDUpIoqQI
         1/dpahilPP7Ut8oSHrLqP/ZmwwxnYHqd+vxJmtfmMvu2ftuA/LkyP/hflyzz19H76aAJ
         ayexVvU3f9y7ZAsfWbrCAFRT6s5IfkOhUZI2DGlcKhz1lPMUMgkgy5ipGNs1zE8yrPug
         y/gKD82K4WNNMQ4ghV91VGyjCilqKCoi3xVUJb6RGly9WnkG6qW3jTf4s1TCQns86gOm
         JnlGcsqJQBEItFdzi5OQfx2dn3dl67geUfY3eB+ZwNkxMYRJ9w2uLBZF4WmFGC+Nk4uO
         TW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692857; x=1782297657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kxB3SnelSJeC61Cb2O2sZ2DxgfCvfhJf77FHm8odZMc=;
        b=qb2KR6wNqXJILmafPfmE7yRVO3CqCc//R5qamZUqOT3GrIIwBkMuX7dlobrCOIWFFL
         ZGYfjAjJtemmHvjPfBVaL2Kq/X9oAbU5tRwjVVich0T0k9ofQtlN1i3wjR0306Dsvaiu
         ND4MarBC/3mOLR+q4h1xzvcmkv0J9C1FyVHvVrwjaHpci7bTjJNHrnu5JFVwB9aV1UDn
         wGzYe5xiI9Jy4+PDx+vaZ2l3K4N5SPk7/J9qW1XrK/zhuvrdw0eTUGD4lwZ+zBaKjc4C
         5xuG2unHLi2l9QvYW57xxGwoXFLP0pKaO394NgEyb+9IorBssmX1LBTawVpYbAv7Vlqn
         V9Lw==
X-Forwarded-Encrypted: i=1; AFNElJ8S/mRiZCzNE9/mukOqCFtEaYFTZFqqjK45BYH5mat8NiHAOJsI2IJ4ymAmkDdRVQL+8rM3XbI30cahNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyOEJyKh6Na4s3lo9sGURk0yxlu6gxgF5DOoektTOQ6JEGQBUS
	dCNk85VxuCUU+WfJ5xkMF49MarnUvGdjF30xXPfgzz4DD4dRZ1ejJAz9
X-Gm-Gg: AfdE7clKlh77eff58DLMgPzI5shXghUha6KG4iIzj3PuC7dpggA4umgHyvlsbw82EGA
	+9cwe3MjbD8HltbQ/iZQbi4eGoTywUBJkDb6U0qtiSSJPDAQPlYOyBQ6pKI7+wfTtYq9cc7epOb
	qnBx7UFr4UzvQc9sW9htU8OgDVvtLPLE88VmWgo3u5cQ6zG8cQMTiYTfBH3iAO/gGdtjxz7LmGn
	l8y+0GDXKXeVoi0vRN0QSzzyhwpY20O6Rgaf2aLisA1IvBewfmfWXFAfrhULQsJL1VPSBRG38XR
	Lnj1LvL10PwJtU/dQovkta1PBK3H3p0WqOW/1m5fCPSXwUQU505itYSe531VqMDRDSnEmw1OgDz
	xU6v2q7Ehi41utWs+xBj2msQGhK04eIhaTDXPXOfCbcyFbh07wiGIVa5fKIOD8DmjLDaURN2cy2
	5m+5wB75iWCE3PBzFINIqRHw+v/+jh1SX4/XX8Krp4MAdZj7I=
X-Received: by 2002:a05:7301:10c5:b0:2e2:3381:2fba with SMTP id 5a478bee46e88-30bc9cad496mr1423566eec.3.1781692856764;
        Wed, 17 Jun 2026 03:40:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:40:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 51/78] ASoC: codecs: rt722: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:08 +0700
Message-ID: <20260617103235.449609-52-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt722-sdca-sdw.c | 33 +++++++++++++++----------------
 sound/soc/codecs/rt722-sdca.c     |  3 +--
 2 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 0f76492ff915..ca5a4ee6ce9e 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -368,7 +368,7 @@ static int rt722_sdca_interrupt_callback(struct sdw_slave *slave,
 	 * scheme. We do want however to prevent new workqueues from being scheduled if
 	 * the disable_irq flag was set during system suspend.
 	 */
-	mutex_lock(&rt722->disable_irq_lock);
+	guard(mutex)(&rt722->disable_irq_lock);
 
 	ret = sdw_read_no_pm(rt722->slave, SDW_SCP_SDCA_INT1);
 	if (ret < 0)
@@ -432,12 +432,9 @@ static int rt722_sdca_interrupt_callback(struct sdw_slave *slave,
 		mod_delayed_work(system_power_efficient_wq,
 			&rt722->jack_detect_work, msecs_to_jiffies(280));
 
-	mutex_unlock(&rt722->disable_irq_lock);
-
 	return 0;
 
 io_error:
-	mutex_unlock(&rt722->disable_irq_lock);
 	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
 	return ret;
 }
@@ -514,13 +511,13 @@ static int rt722_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt722_sdca->disable_irq_lock);
-	rt722_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt722_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt722_sdca->disable_irq_lock) {
+		rt722_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -542,13 +539,15 @@ static int rt722_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt722->disable_irq_lock);
-		if (rt722->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt722->disable_irq = false;
+		scoped_guard(mutex, &rt722->disable_irq_lock) {
+			if (rt722->disable_irq == true) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt722->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt722->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT722_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index 1b6729f363fc..5fb5dc2ee3b4 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -294,7 +294,7 @@ static void rt722_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt722_sdca_jack_init(struct rt722_sdca_priv *rt722)
 {
-	mutex_lock(&rt722->calibrate_mutex);
+	guard(mutex)(&rt722->calibrate_mutex);
 	if (rt722->hs_jack) {
 		/* set SCP_SDCA_IntMask1[0]=1 */
 		sdw_write_no_pm(rt722->slave, SDW_SCP_SDCA_INTMASK1,
@@ -317,7 +317,6 @@ static void rt722_sdca_jack_init(struct rt722_sdca_priv *rt722)
 		rt722_sdca_index_update_bits(rt722, RT722_VENDOR_HDA_CTL,
 			RT722_GE_RELATED_CTL2, 0x4000, 0x4000);
 	}
-	mutex_unlock(&rt722->calibrate_mutex);
 }
 
 static int rt722_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0

