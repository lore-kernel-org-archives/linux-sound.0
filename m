Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06941F583A
	for <linux-sound@vger.kernel.org>; Mon, 30 Jun 2025 07:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751268687; cv=none; b=TVk9shD0fweYOPAqcx/3wBnmgMTcin8H2doWeOPEDPcqhfWcuZYkvqrhHz6sFd02LTfkDELqNynw2d/q1KPZvW7JuHWeKqgKb9rfm1EnMl77+OerTru19fvjEvA/HUFmr/X92i3fy9TH9FU37/87moDN5XEvn7RRmnO1s/xihQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751268687; c=relaxed/simple;
	bh=IFIH+MZeZGncc5oPqvS+TkU1/Rq4qHZHJMPO62is7RU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qigINJ90mLuHybRsOkxNcTbIJAqBHhWtIHTe3yJWa0iJSPU8OjlwFVLvv20X5qA0kQsy9KLSQ/5CDG333AQKxcTCOBPvsvW97nvGl6Lkj2IWqByMP3Hj0edQeFrQ7DiwxxGEnZL22Mx2Ew/9e7IK1t9gjgSwEHpOJEmRSml4uAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=compal.corp-partner.google.com; spf=pass smtp.mailfrom=compal.corp-partner.google.com; dkim=pass (2048-bit key) header.d=compal-corp-partner-google-com.20230601.gappssmtp.com header.i=@compal-corp-partner-google-com.20230601.gappssmtp.com header.b=JFUprPnD; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=compal.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=compal.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=compal-corp-partner-google-com.20230601.gappssmtp.com header.i=@compal-corp-partner-google-com.20230601.gappssmtp.com header.b="JFUprPnD"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-748feca4a61so994129b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 30 Jun 2025 00:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1751268685; x=1751873485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=POxYgTmDu2e9RWNzg1dbBCkTKGEMfv0ASNz6IDybwM0=;
        b=JFUprPnDZVsEi7JTE1op6i7IyINe3LBrDwYzkNVK1Wvu7hyCyVp0mpndnuQHoZu2i+
         EdT4D7g7dY5U4FZgHgoqGKPEt4WVPFO6vWpWl84teRadFPqfy9MdQ3ovNlxo3MLuzX/v
         rjDVfVuBBIuo/p86/JVpHRlPHCsHe0kTwP7cPG4xTuMXVv59Cty9K06JKoEslt56yKmL
         CnaeJeWfY5bOPq3GQ9IAQxT5uIsLx4LuVvvlc12IjdI8OVQ+ZE/JOAwq//4csZpeWVp1
         zSrN55F2KZMLAgNIczBGLM0sV9s6SmwX4gbeFMF/puKb0UhQsuV6muSC1X7PcE9nCEtu
         oOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751268685; x=1751873485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POxYgTmDu2e9RWNzg1dbBCkTKGEMfv0ASNz6IDybwM0=;
        b=C7i1oLUxIyNzpTJ6rTeVqzphyRaNgy8s96WZeW8Ecb3ZNvwi/AOOQAoWBWSJZU7Evw
         Dn7b0VC5GJuDGe/MLf+gN5OXZ/4NYBVsrseWmhbTyq0t48+8roShsXXBHDPMFaYGpNb9
         9gfF1YFr0I2fgSGL3JCkcbidQuuOkrqTH4+Nxj5697sALi720wPbbBPTJFXWVtpJ/+32
         1wgSVBVPZYaGfQ8Exf8MEz1jZuV/Pp73A3bHZN14D/KdwBMV4qqW96XWywY+PdwauTJU
         7uMYTPn7z43SeEfdM3kR86oDC9nZVsEoxgrNNyfAS1/u6Grnhe2bujpZpgOq8hfghYrW
         0H6g==
X-Gm-Message-State: AOJu0YxkAnCqgp0y+PgZSai+EGp6Gqpfsx2kMSf4mIrc4rAvZIfnAGEt
	4+369SxdrYau8IkIDVlcSIwRXigXSb6g6X08CpbYxRFcZQLKzRVCgfNXyyDQd6UwsCs=
X-Gm-Gg: ASbGnct5PqsSrYyG2TasGdMX7GKw3N7SzbMs+akVUFTRl9ZACnFtPvlGsBia406NTWK
	muR7g/NzZvy9LJyBoqUyXpnP/9kvOtZxL1j3zsbAlmbzgLDEF+4cAxq9+WyNDj1FaGEYrRPkpeY
	Ob6uiH6EXdljKnbxKIMlSp2kEIPFHAENhDmI0pP7t/jbmkpns2qKyNDNVwgmeX215cXzq6hW9ZB
	jCuW94COwxMtbRL0K35XRE2D8Sw5CgrUWHKsu/+hdfPavMUVyZBd95igUSICmk6hJKesArJiXYZ
	VQRTdy3/G9PHMEQB/bYbllea1TbTwfW5ZMg5Rrilqb8av/9pK3PwJo/mDCiRfGrVBPxPhJVbfbJ
	HmKlDFZkXNUJpxD5XVWghdq/49lvGod/8v5oR8VHmRCNoi0uakuJL+h4Di3Xl1/rOHhIOV5OVMB
	6zv3BYGHZMuBElUVM4goF7JNggHItf7T44SYFEN8cuEimqseuo6rU1vhQ=
X-Google-Smtp-Source: AGHT+IF2dJnHM1Gkfw8ZKgifsBXM1Dg3mh0qy29vCF7Kn90HV7QpAS1LvEjYMDtwWkrjgbtM4CyJuQ==
X-Received: by 2002:a05:6a00:1403:b0:740:afda:a742 with SMTP id d2e1a72fcca58-74af6d381c6mr16618695b3a.0.1751268684834;
        Mon, 30 Jun 2025 00:31:24 -0700 (PDT)
Received: from ajye-OMEN-by-HP-Laptop-S.compal.com (2001-b011-2017-b5df-1684-9463-00f4-4a0e.dynamic-ip6.hinet.net. [2001:b011:2017:b5df:1684:9463:f4:4a0e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af56ceb74sm8512046b3a.135.2025.06.30.00.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 00:31:24 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Naveen Manohar <naveen.m@intel.com>,
	Dharageswari R <dharageswari.r@intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mac Chiang <mac.chiang@intel.com>,
	alsa-devel@alsa-project.org,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Subject: [PATCH v1] ASoC: Intel: soc-acpi-intel-ptl-match: Add rt721_l0 support
Date: Mon, 30 Jun 2025 15:31:12 +0800
Message-Id: <20250630073112.2823898-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch adds driver data & match table for rt721
multi-function codec on PTL at sdw link0.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
 .../intel/common/soc-acpi-intel-ptl-match.c   | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index eae75f3f0fa4..0257e12e8b6e 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -330,6 +330,15 @@ static const struct snd_soc_acpi_adr_device rt1320_3_group1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt721_0_single_adr[] = {
+	{
+		.adr = 0x000030025d072101ull,
+		.num_endpoints = ARRAY_SIZE(rt_mf_endpoints),
+		.endpoints = rt_mf_endpoints,
+		.name_prefix = "rt721"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt721_3_single_adr[] = {
 	{
 		.adr = 0x000330025d072101ull,
@@ -339,6 +348,15 @@ static const struct snd_soc_acpi_adr_device rt721_3_single_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_link_adr ptl_rt721_l0[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt721_0_single_adr),
+		.adr_d = rt721_0_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr ptl_rt721_l3[] = {
 	{
 		.mask = BIT(3),
@@ -664,6 +682,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-ptl-rt712-l3-rt1320-l3.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
+	{
+		.link_mask = BIT(0),
+		.links = ptl_rt721_l0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-rt721.tplg",
+	},
 	{
 		.link_mask = BIT(3),
 		.links = ptl_rt721_l3,
-- 
2.25.1

