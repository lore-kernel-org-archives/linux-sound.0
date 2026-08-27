Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B1135CB81
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 07:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815527; cv=none; b=sdhPqbcbNs1fmXaq46Ja24mtjHAMUXunIgecd82M6p+vdmKs0K+i+alyhjX4g4nBLGvXOLgoRHQW0nDT1dKuXeDIOIh9QnI4MeK41zRBWt5VZxLJeSKI+YISqvD24W/2+EwJpBc+bdYVdSvE/LQ+FI2L76m7prj/VSHvfXu2iW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815527; c=relaxed/simple;
	bh=mpqCgIgbVUyjd+F1WZaymXLSN6NVJ3r7+KdT58O0YQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lknsq88TeAbA/sNZeGY6B9g9UQ+v7tq5EoDEodn1AAHX8QeYxSJLvzjEn2dkacsfbSGkllGepgiW9OoNorsDspu6RymW7i1Qq8o5uPW5UNiYbKgBre3H1r5RCZ6wKKlRYGzDE2NpDEftvdlF+Vxrwd6TtgC0DNjzY+56FSNlhHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZHB9yBE; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZHB9yBE"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so671775e9.2
        for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 00:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787815524; x=1788420324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8nOuW96iCEmlcVyEdR6sfhI0AvZg4dcgmRG78Orem0Y=;
        b=hZHB9yBExUL4Z+k9HIRT9Icb0bf4jnVomOA5T20c1UEhWlDnPjUn35TZE48OLr479J
         +DLEiHwEcbkqUcbf2Z3X5n0xxqWVBVa7JdGi9G2QKq0/VOM0/6InwRzSl80tbHV2LbDZ
         a7Nv9QLUa6rJlrdKp9KemBhOjckJGXYh1QhwiY3mhq9/LWe5MT+hDIbrOOv96/iYrF/C
         nQDb6MhfftfT19UcdyQbWaNahe/1v1epqTzOUoz9Rm9wUvTZ8Kb/XTRsJrpa/CvQaUkD
         uH+HwKQNRTcjq1t4HBDZwbA4d7MIk8GuSkMa6moQabMgmoVmA7WoP7x6pWRjkiaW4rHA
         EFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787815524; x=1788420324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8nOuW96iCEmlcVyEdR6sfhI0AvZg4dcgmRG78Orem0Y=;
        b=E4UB4GUU/9bSyqbsNDdNlf0W31nNBzkgr2Tg3R4Y4/SG9HKSZ4aUR6Wc2ij4KXSUx5
         e6kOsjW2t4iekeOf2e4bThwRzXguDJ+PfnhvW0vE2X4DGFpEwz4Qky3Q9sa9d+Hjq9/d
         +vG9srpItRrE+TxKKWPOAX2g3E8WXJOAJe/g73gUH+nMjZPs9P6MY8mzHMqjcy8xNv1S
         2fww9oVPWm7mmgx+JVR4CzRd78UWBDlGgkymCWwL9OLM2TgZv3KmUX8bNw1a62jyKHV6
         BuOinCol1eBrI67uUcf/09S7DUV19EzICOQJlQc+Y+3h9VHG+JOrLTgZBi5AWQ8CP14X
         W/Kg==
X-Forwarded-Encrypted: i=1; AHgh+RpROznJJWkNPcBHi1Sbetq4Vmb1MG4FyEEYBtt7BbS51Zq1zfps7VEq8x0XlijowiJt/I++3lJn6eXtBQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lc9nHnzbLxMAawYl+3Fyeot+ouDnI53LeDiLVdVKMtxGB0SOI7
	JmkiiLvN1FEt1kMlWJOAVjFj1kODFcsRhN0xH0fxHyst+iWgJ+PX6FM0
X-Gm-Gg: AR+sD10bixrYYU2lNVp0GaOTFCbE64zOkOtqQpEcvYpjM2cvnDvxwPSYPi7+lTWDdui
	5477B9RkoBElk6GhB2bLKr5J+g6tyg7Jf4dpWZbb32krzSPECGvQQFGrcDZ8Mc1w2asOsIbMSS9
	L1dz0hwTZ9Cl2jD8ZVqWj6HJqZs/soWYWXBfaGrFD7GNHYORxJjPdGgUkv/6HI7j9NopMC/5Dhk
	mCRAAK5xcqF2P7VPk1fpYCb46E/Tfz8mJQHHRcFx5TysS/17xfZUUpRmqGsSAhlOX+DjG8rKQJT
	a2tUHM5lBRjQe4qE6tCi2q8i8bR/qcwsk9OG3iAYmOuGtmNGzz7ddKDAIjvE8Lu1txZnY2reucT
	jXVc1ca8+WvZDNmm6hOPUkg8WYnhWq0N9fYfGNmeSjfhSO0xWvl4Ed1rhAr4+2lFRqEj08CLMiC
	SwxAVtZvyE1GAio6vb1xcN0xkbUMrDdjpNWyHTrqvk/prGqMgEdONsX3sa/mU8gHrvk6HMQVZgr
	Yxlg4KWTHUX4EI4MMFO/fdDICQSToZJF00aQJmF2/fCbIsbpvwVeEA=
X-Received: by 2002:a05:600c:c8f:b0:496:bffb:fb7b with SMTP id 5b1f17b1804b1-499dc717efamr120968935e9.10.1787815524297;
        Thu, 27 Aug 2026 00:25:24 -0700 (PDT)
Received: from 1Z10 ([78.211.107.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28dbe1dsm7270686f8f.22.2026.08.27.00.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:25:23 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Yauhen Kharuzhy <jekhor@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v4 2/2] ASoC: Intel: cht: Add Yoga Book RT5677 machine entry
Date: Thu, 27 Aug 2026 09:25:17 +0200
Message-ID: <20260827072517.1401173-3-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827072517.1401173-1-mauriziocasciano7@gmail.com>
References: <20260827072517.1401173-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91F/L exposes its RT5677 codec as ACPI device
10EC5677. Add a Cherry Trail machine-table entry so SST creates the
cht-rt5677 machine device and loads intel/fw_sst_22a8.bin.

Associate the same entry with sof-cht-rt5677.tplg so SOF loads the
matching IPC3 topology through the standard firmware search path. The
topology sources are maintained and distributed separately by the SOF
project.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>

Assisted-by: Codex:gpt-5.6-sol sparse
---
 sound/soc/intel/common/soc-acpi-intel-cht-match.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
index e4c3492a0c28..442ef30ffcc7 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
@@ -137,6 +137,14 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
 		.board = "cht-bsw",
 		.sof_tplg_filename = "sof-cht-rt5670.tplg",
 	},
+	{
+		/* Lenovo Yoga Book YB1-X91F/L */
+		.id = "10EC5677",
+		.drv_name = "cht-rt5677",
+		.fw_filename = "intel/fw_sst_22a8.bin",
+		.board = "cht_rt5677",
+		.sof_tplg_filename = "sof-cht-rt5677.tplg",
+	},
 	{
 		.comp_ids = &rt5645_comp_ids,
 		.drv_name = "cht-bsw-rt5645",
-- 
2.53.0

