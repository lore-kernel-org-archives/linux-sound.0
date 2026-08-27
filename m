Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A3C499F14
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 18:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854374; cv=none; b=S1otHWTKYHMYl4yIKJIUUcW/Kpql0bJuAD6C3nEcJDd0bz848BQhIIrMPR6DAZ0VYotAM6QMiM5jGxVPaj7XKGx4/TDXX0n4M/DF6YAE9hzSAqZJCuO3J446j8spua2JkRN+IlDUdF+tXgXc7inGxSiolFlZGbpR5EeAKVaboww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854374; c=relaxed/simple;
	bh=p+PsdWMYgDeEzYR8CJuUDvk5UXQMtpQbuHidEtNGz/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uQJwAKW50C9Ghm+OeB+Ozv7cuc/r9XhCk9B/3BMIs5ixSqV0EX4fyfw/BjbOM5OyHheITYrBO9wQkFj70xxJh/XGDbOlNdYq8keEZUZvrcpwRthdJ5ufkWER5QeOiPzrc9EWiTMkHeqVqLUAibn/T+Bix8IB769wxnmhdqIi3HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2DczBCN; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2DczBCN"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so91003f8f.1
        for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 11:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854365; x=1788459165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sMNGNdzcXKEoePKaXgyC7xmNkieewX0FtVFEtM4oZI8=;
        b=F2DczBCNlEFzzLJ6lsNivfc4JG8UITqQCmtE7qwrcyt+QO9fjFgYz7MUSLwRZeC/Sz
         eim/mOOONbmxZ6E900cj/WsN1SQywuLANQ6KzgDhGp5oMJET/732VnV8fHQEV93iMQ+r
         Tg8Z9yRuxX/i6ABJOJ77hZbBJldnm4/TsMrzwiVl3j3ZOLrvHiEl7H1VlCYP6SHcH4KB
         CCoVCI4dJbtsIaAH02L4YM7ccNEeH1gxB1RgkRs7v8nmg1h5xBgqzQZVV/zN4alX78Q2
         w1kTwQHqXZJYjBnwQyisuel37CkiA1DSYYl5mY3H1g3/deb71HnHJsMNk2EYCCMWpL2f
         3YsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854365; x=1788459165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sMNGNdzcXKEoePKaXgyC7xmNkieewX0FtVFEtM4oZI8=;
        b=VigjyAa45hVQ+svedkrHsSxRo+V6nPvkgabC3EqTFq1c8/g3EZ//rsiLJJFsyb6hbk
         TJaG1pBVpJLDAYm7wwLhglu3p8x/VT8e5b0t1dlIN2Kt5qkO54JRniO0gM57XAcbMpMn
         Bi8UzehR0uKx35CHRyHZAw/JmySEOc09Sqhe7e9KDhFhBvK1Mx3TYaHb8zuTPn5+nK/O
         tBRxmKhSjo+b/fjKs4XIsCocJuowzYKM9ngsJJbSoUULyKGZlv6Y2L5Vldfw9tS6cInC
         Iqw8j2zL36d39D0dKUkvMwsJBIKgSndm0IB4PqqwNJFPoKalE4r9/POBDRnKbZRZzxwt
         XylQ==
X-Gm-Message-State: AFuF++muCX+/DVHczEnwVGNrCWY4UTjdEcIUyC4hu9oWg3crP+PUmPX1
	lwPQbmPp++wtcSCAn+C8+o/x/6lLmxocuH0+hYMEpee3IrwcJZoRAV7NWxHkDMFa
X-Gm-Gg: AR+sD10oA350mgDnSGNaX8vW4ZvBGYWixc/cmUuB2LJy7PMAYosZLyA7sLG71Gqdkiv
	69jpKDIz5dHOcDYx203ofzigiOnMGludW9zhU3pcRxZFBZKCX7Ho+/KDLaJArXc9uf0xj2tOoCS
	qYXcwMPYnslosYbV3nhMoISGvZJlZw546T1SvfpcWnOlww2uWPzygdlNncFLzi+bs2aMHhBlr/M
	TGSybjYtmOCNINBGlr1S8cQ8eXpSbhyYMiJ3S3vI/VmTzEWs9fc6V9SjzGPj3pQsCws8ViRSH/5
	8oty10SZyey/EAEv92Qs7e1lsg0bqiRcWUb1K9rGqpHM/BMLI2B1EMm8O8ykPyvTr3e9NR6+8WW
	NNwr/mc+LaRIM8p7Coi53xobGKZPn6qEzeP8MAfAJ5EL+fvoQkByRh+5kt3GlJm3qbCGEVJE1tZ
	ttHpuzAiLSd6Cu1ZeVMEnmzEg0RSOkOm89nsmuJWVlYb5kFIzVRpZRM+wGTC37IaBWXV1lcAJG5
	vIRHh7jztfzgtvUFT/sT6V9eTJjIuq0mQCZ1ZjkFm6t
X-Received: by 2002:a5d:64c3:0:b0:47f:7759:89df with SMTP id ffacd0b85a97d-482f7977513mr896312f8f.3.1787854365279;
        Thu, 27 Aug 2026 11:12:45 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f6917sm10189895f8f.35.2026.08.27.11.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:12:44 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yauhen Kharuzhy <jekhor@gmail.com>,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v5 2/2] ASoC: Intel: cht: Add Yoga Book RT5677 machine entry
Date: Thu, 27 Aug 2026 20:12:35 +0200
Message-ID: <20260827181236.2421882-3-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827181236.2421882-1-mauriziocasciano7@gmail.com>
References: <20260827072517.1401173-1-mauriziocasciano7@gmail.com>
 <20260827181236.2421882-1-mauriziocasciano7@gmail.com>
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

Assisted-by: Codex:gpt-5.6-sol sparse
Co-developed-by: Yauhen Kharuzhy <jekhor@gmail.com>
Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
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

