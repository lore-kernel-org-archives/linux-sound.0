Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD824A0150
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 19:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289452; cv=none; b=a+yYLueCJMphwShKVNtL7NV0opd/nGH+6b2XSvhzQxClUpk+aVo6zDLlYSPnr4AZg2RXjSR7FGU4cv94beeZ8+rMRiENXC0rgYevD4Z+ToWhs5DWVZdye6R9SaFGy0f4xwz3nr/PV2c4FMC0Iq+sY87wrj7e0k2oINQyTPriNMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289452; c=relaxed/simple;
	bh=woGNzvE4iPSir10vmudk26cn8v3fvEBVJv+vAOUGHdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XSwAjzcjtFJ0eM9AlZOLl5B2An9vIRTilow+/1UoRCnH0stebmBl7epBTgQu8XSYsjVfuDfiUCd+bhcdCrLaQepuE4ZAMGnWRHXNvyQPbQEiQN++mqLyKQ4DiFPr1Dg3Lvdvf2tQl6DmEqYTpOgqrZkBm43ngdnBdaYrrMWk43U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRqO/Q/t; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRqO/Q/t"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so1191615e9.2
        for <linux-sound@vger.kernel.org>; Tue, 01 Sep 2026 12:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289449; x=1788894249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PJ4zJMcWIe9U6Mn0EhBFrSMWXCkPAqIhl5MwEUmPtas=;
        b=gRqO/Q/tBG67k0ZnLf0CPj73aC49mljaKRjAbO1sxDZeNNm5YelDDO2VOC59gKW4Cy
         ZyTxeBVKcG5UIeURsj2BwAfz1u/hXPEhxmbbGhM80rkVMggv3FDolpCt8FXW/HMhX41C
         bckV2mgVK48gyTZWQwRNK8na1FL6P0Lk2x8/6Cp9uZFHu01k4Wy/N2r/0wPVFax/S4y+
         I8UD23UjhU3Cf040UIYXVogKav9lOyOBvI92dZEzWxVKWzli/zG906KgFAzpv9VIRibk
         +EEc0nBvtpFuU+Wk7W2wMj/aScpj0bvGyrOdbTGj5aRED4OZlH1UH3BqKXbOVts2BtDp
         3U1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289449; x=1788894249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PJ4zJMcWIe9U6Mn0EhBFrSMWXCkPAqIhl5MwEUmPtas=;
        b=bXsvZ7YYrL2SlBFv4X40vPmzbWaoGMnO58eL42vSbNqPO7be+uB++MTPJ1jISC7O1H
         H3HPAgz6VuLIMl3o0CZ50ITzqwn8iBba2AEfDSbC4AhVOUO0z0Vg3zSLIxhBdin4Y7qW
         aL9koh0jLkLXVIzJJGOjHM/k1dxKDq+bupyu0Le7WSfFL6K2vS0B/eY/Z2KYEfQaXu0N
         EMgodGMJwZrMnXp1N3wojfGi0lm6o2/uY1Yvpe08kwgnQrsEBWGS1vByS7vOe7ZblveX
         YpmCdKCyaAuOq/Knhlp36WtvtSZsxtI0viRnlUyC9RO/k9tJZZagGTOvVFQGz80bl3Oh
         Sqsg==
X-Forwarded-Encrypted: i=1; AHgh+RoK+YBZtE8nwrfK0e+7B6+D1rXfTpPIMK7KXpcDRwMRxUrS8B2TqK5MgEelfAcQpyEVoYISauckkgAT/w==@vger.kernel.org
X-Gm-Message-State: AFuF++lyrZiZv5WO/ftm/Fywg6GxCbPHSFxuPbKacMJZMiNcVKuQFPjI
	34FgjYNiul3Otuhh+1dIhbiEHEc4JQ5h1idEzOOvMHGLWtuEUIQfv0yy
X-Gm-Gg: AR+sD10ZfhAVk95kQbHgqa5hjIOBUAGhfN+Fl5jb/uRseCq7enew9ctbCJnIfnLmvfP
	7sABp0LzG2T9y3nk855/OVpG1emfKykOeCBXIbhrO8NDFRU3SgOlV1MHfvpwmaAYFsYbFfbEstQ
	61JXEof7CMZ9/J9lOLwGwwR8c1N9dVGN9TAeCs5DU1v+Qxm+dmx0Qylezh13v56E+1z/fNX+uIy
	JC84wb8IrRfhbYXDQ1UFAH0NAEHcnD7qe4aotnQwhui93P8SC5cM2O3mpv5gBAGJMLY00Cd5wqe
	GVLna7Dl210YOcWznQt4XnD2o6xGCXQHiB1ws9z57mEqjv5mjhgemi8trPLcTHXPDqY8WEUXtZe
	a3klpG1KPaswaa36iKcSuoZ4GJXf+OsOoSSmdcO3IOXQfL9Mp2K1Vou0dY9l1MheQR9n6FTO601
	Vw7NSjUIUREW9rpcpDbcstZ1ZUHvNCsMb9cOay7uKssUsR6qdyL5QBeZjmcJZdSfgRZYYbWomA8
	MFH1CHX+TqS23X+04CWLblDikDq+RzSxLkO11Xk3w==
X-Received: by 2002:a05:600c:46ca:b0:49c:db20:da13 with SMTP id 5b1f17b1804b1-49cdb20dd1bmr253971135e9.5.1788289449013;
        Tue, 01 Sep 2026 12:04:09 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492ce5e5sm802219f8f.36.2026.09.01.12.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:08 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	tiwai@suse.com,
	jekhor@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/2] ASoC: Intel: cht: Add Yoga Book RT5677 machine entry
Date: Tue,  1 Sep 2026 21:04:02 +0200
Message-ID: <dbdec4230d705e6e179099eeecf308e3ee8e0f1b.1788286335.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286335.git.mauriziocasciano7@gmail.com>
References: <cover.1788286335.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91F/L exposes its RT5677 codec as ACPI device
10EC5677. Add a Cherry Trail machine-table entry so SOF creates the
cht-rt5677 machine device and loads sof-cht-rt5677.tplg through the
standard firmware search path.

Only SOF has been validated on this hardware. Leave the legacy SST
firmware and board fields unset rather than advertising an untested DSP
path. The topology sources are maintained and distributed separately by
the SOF project.

Assisted-by: Codex:gpt-5.6-sol sparse
Co-developed-by: Yauhen Kharuzhy <jekhor@gmail.com>
Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 sound/soc/intel/common/soc-acpi-intel-cht-match.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
index e4c3492a0c28..b68f9c4feea3 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
@@ -137,6 +137,12 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
 		.board = "cht-bsw",
 		.sof_tplg_filename = "sof-cht-rt5670.tplg",
 	},
+	{
+		/* Lenovo Yoga Book YB1-X91F/L */
+		.id = "10EC5677",
+		.drv_name = "cht-rt5677",
+		.sof_tplg_filename = "sof-cht-rt5677.tplg",
+	},
 	{
 		.comp_ids = &rt5645_comp_ids,
 		.drv_name = "cht-bsw-rt5645",
-- 
2.53.0

