Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AA63375B1
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 15:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757606281; cv=none; b=bQgJacrezJ2F2z16rX2JVa8l6EMIWC95zm9o06ZL4dtQcTx4f5+fkLJSFcabkBKay+9ErrXaFD8Xev23ph///rluIAKSQneC8ETgmG1ePxJVxqUJka+03Ln3ssGuGFs7TPCz6taqB13hULmQr0t4WU+I5liOxw8GhV8rYiZ73no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757606281; c=relaxed/simple;
	bh=hrcW5HRwoVO5AaCGG/ywl3j8o6ZmjYB2G9tHTnI0GQU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ctqUDWEeKdT3q0T91stnBbt6yCDRHWTmXn2ycmAh0R+ahNEkSebW2nkpZwME0qTPuKtNMNwshvLm4GnFIMAFQ7bk53o0Lz5soNUIIlpsmZ1YzcrUw5ctd0bpsDhWBliJjoUM3IWU1pa4BLuUE3pTGIu2hHtacPsbSN3QFWvCR1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HAHFalHN; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HAHFalHN"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BFvTcf411208;
	Thu, 11 Sep 2025 10:57:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757606249;
	bh=XUvv+AnBramso+YMdyYjMt/0odeuMKapNNe5YCj5NiU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=HAHFalHNdOZBGWEkZog/3AUSGk5wzVUi4wLMKwZoj6Pg6GPyuI/teiKx2kzO21tJx
	 jNYOOaa7NPNdErub87kPcfPpVO5Q2GL8fAnNgxvLl7X58PPwa2WVI1NVKDim6mDuJH
	 t7CQV3C9eNamBI4ZxGLoJdJfWdpONrAwxifgAwGY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BFvSOX2051076
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 10:57:28 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 10:57:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 10:57:27 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BFvFFJ2366393;
	Thu, 11 Sep 2025 10:57:23 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <alsa-devel@alsa-project.org>
CC: <linux-sound@vger.kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <perex@perex.cz>, <tiwai@suse.com>, <yung-chuan.liao@linux.intel.com>,
        <cezary.rojewski@intel.com>, <peter.ujfalusi@linux.intel.com>,
        <ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
        <pierre-louis.bossart@linux.dev>, <navada@ti.com>,
        <shenghao-ding@ti.com>, <v-hampiholi@ti.com>, <baojun.xu@ti.com>,
        Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v4 2/6] ASoC: ops: add snd_soc_get_volsw_clamped
Date: Thu, 11 Sep 2025 21:26:59 +0530
Message-ID: <20250911155704.2236-2-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20250911155704.2236-1-niranjan.hy@ti.com>
References: <20250911155704.2236-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

  Add API snd_soc_get_volsw_clamped to read
  the volume from device. This similar to
  existing API snd_soc_get_volsw. But has
  additional step to clamp the value to max value
  if the register value is larger than max value.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 include/sound/soc.h |  2 ++
 sound/soc/soc-ops.c | 22 ++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 1fffef311..34a490ece 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -553,6 +553,8 @@ int snd_soc_info_volsw_sx(struct snd_kcontrol *kcontrol,
 #define snd_soc_info_bool_ext		snd_ctl_boolean_mono_info
 int snd_soc_get_volsw(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
+int snd_soc_get_volsw_clamped(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol);
 int snd_soc_put_volsw(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
 #define snd_soc_get_volsw_2r snd_soc_get_volsw
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 59e91741b..4d1ee5cd2 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -354,6 +354,28 @@ int snd_soc_get_volsw(struct snd_kcontrol *kcontrol,
 }
 EXPORT_SYMBOL_GPL(snd_soc_get_volsw);
 
+/**
+ * snd_soc_get_volsw_clamped - single mixer get callback with range
+ * @kcontrol: mixer control
+ * @ucontrol: control element information
+ *
+ * Similar to snd_soc_get_volsw, with additional operation to
+ * clamp the register value to its maximum.
+ *
+ * Returns 0 for success.
+ */
+int snd_soc_get_volsw_clamped(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	unsigned int mask = soc_mixer_mask(mc);
+
+	return soc_get_volsw(kcontrol, ucontrol, mc, mask,
+			     mc->max - mc->min, true);
+}
+EXPORT_SYMBOL_GPL(snd_soc_get_volsw_clamped);
+
 /**
  * snd_soc_put_volsw - single mixer put callback with range
  * @kcontrol: mixer control
-- 
2.45.2

