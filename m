Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB3C429CF9
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 13:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750636; cv=none; b=bOhPtZbv9z87MhG8thQpedUKHv82ARZVKoAsfAGmpZnvGiCO3u0dg+sBtbWdqtmUWqsSdrqBUKRXyLLnpcajpkB5th+MP935IN+VYAhbPTiTThGcN32QWrPK6R+7rMDbARoteln3SSiSgIPOMyJrkHA5SbjDn7K5n+FXtQlf+v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750636; c=relaxed/simple;
	bh=T+joPVnG6nvb8UuuJNDmhlDnO5Nd91bhNAODW8Wk1i0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b3+rO541T1kxE6Cznf79pqGM9xplITl2kR7PmOx/1M8lbeWMNOBLlOMPLgqui1or6oV+0szYAXAa/bQH495WiTP92Ubz7MLRMBYqZ3xxYurqP7ByotXq6py4yFM+DANSAeiqP3IFNxIxNhRZ4TedOhlgfM2w488dXpvSoHqA5g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=giqvG1Qm; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="giqvG1Qm"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15d3cd51b2so137878366b.3
        for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 06:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750630; x=1788355430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GiQlsaqiCq4AJU78JobgI8TyOaikqXTsloeCjW9W5G8=;
        b=giqvG1QmNvWw+jfopHSS3fNNjtlZV5WfkhkHWcpkyZbXImoXfKcgdghjNqJFkeM2Pt
         yL3lrzZc7wvwaV4j9fecx5qKsZDkMZG34qT+TmHEn4xMosw7UcZU7eiV8uIPxmRctIMd
         OdM7b3HBpBT3eXwZW6e60Vtkz4n2BJTk4wDA+JzupkHjU8iuGGggru6av9o87yUsyYW6
         kL+YfLUDAiZ5XltAOCUtXwR3tJrKQMyVnKNW+LmN9svbCe/c11XlT9worseifkK5vKCM
         FyLUplz3VGvWCYlYKH9oRa/x/hvqu3qdVLQqIAa+pXcLgpylZZBhq6bOmHMQyD/ccKje
         M4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750630; x=1788355430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GiQlsaqiCq4AJU78JobgI8TyOaikqXTsloeCjW9W5G8=;
        b=aO/98ev3hA2Zx4D2FELs5reUpc59X/WhFPIsOQoA6nJC3Ohgqe43PH2TJLHVnPAitV
         eKrvRro9CqQctxGtj1Fh7wd3IS7g8+fDuHddUWJXlSnqWKH9C56Qeg7N6CXuPeSnQ5aZ
         dokOTmmLVEn/iS/wK5QSgYO4gMN/aJKWyD5x8ICcWG5ErpPYWLSlCbGXJ7X5jfTDOgNG
         CUddsGuVsmdWpLO3023X6Zgms4opKo9Qd+HGTRcC9JcBJI5VBF5whL/tZJVd+FTR0m33
         WabzmT4c9NDRRLAbkhE1Gd4Q+3O4FZooVLQIWD5cMyUBZ4zZlmgXzuawN1GPZNhq6I9/
         gWow==
X-Forwarded-Encrypted: i=1; AHgh+RohvpMzc2pk5hvRKUfwtx57ARf3/uE5XN+5yVbawQ5sEWXhQ32yYoKTsg/qw8Ndvb/Jx71GjQX+axNQ0w==@vger.kernel.org
X-Gm-Message-State: AFuF++lpXM5yd0QlLBohxrUMsGibBLHPdSa3bhxC5kOXL8Q5fCFRolNz
	xvJdbHr7LlB+EcPYiADQbDKfr+MAlRf7xBFnqOoaTNvowVUbO4jDSTYn
X-Gm-Gg: AR+sD11QT6m8EHzo81zRNIyJpmPdRTma5djINFVu30HhSar36CaWfNS6diQO0pUBVm7
	6bLnt/GCiuo62xkfiCRYsTkonPJaz5JzHSOPGb6CQiiYYDfwEZBesoVFQO4DTq3BZS0QMbw0JdQ
	0NZNcehdPfnChqzK+P4u0nkr1KcIcChHbZ+bykpDP6Z33f9zv/+TkrOIrw67O4+//lspnfmgKnl
	zdqLS17fxWB4hTT0Ta9mo419HmdoTZ9K46xvSKU8u2JyTIsNabeM+PJjXqLvnC+eC+bbHXqNVUF
	8Fko2hPayczodjzFFsTR1PIBh4f6DHEEU6bErBXqwgkAUoxqN74K0ojAGnu/cJukuKdrBdoo2ZS
	Hxo21slkCzDJ31G/FDHDZYu+0yRAeiG3LCtlL/cWK+r115VpJHQAk3z/1nCHKDf6pNNBik5tyE0
	57SWw4q+IvCP1+QtYiFRawOeT7wjhnnzJbDpduawkdDVqVei1EFIXCLVTJCWeg9HQQQhtNhG8SV
	MJsBvIXKh0RbeU0k6hQGiJP0hH6WlyWpKIVqD07WTg=
X-Received: by 2002:a17:907:5c3:b0:bec:64d4:3872 with SMTP id a640c23a62f3a-c250c3cc2eemr811074566b.24.1787750629533;
        Wed, 26 Aug 2026 06:23:49 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250f99f6bdsm376856066b.0.2026.08.26.06.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:23:48 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [RFC PATCH 3/3] ASoC: Intel: cht: Add Yoga Book SOF topology filename
Date: Wed, 26 Aug 2026 15:23:34 +0200
Message-ID: <20260826132334.3344395-4-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826132334.3344395-1-mauriziocasciano7@gmail.com>
References: <20260826132334.3344395-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Cherry Trail SOF machine selection requires each matched machine to
provide a topology filename. Without one, atom_machine_select() rejects
the Yoga Book entry and the SOF sound card cannot register.

Associate the RT5677 Yoga Book machine with sof-cht-rt5677.tplg. The
IPC3 driver then loads intel/sof-tplg/sof-cht-rt5677.tplg through the
standard firmware search path.

The matching topology sources are maintained in the SOF project and
must be merged and distributed separately; this kernel change only
provides the standard firmware filename.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 sound/soc/intel/common/soc-acpi-intel-cht-match.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
index f9acf6a41c1a..4ffd4ab57b1f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
@@ -143,6 +143,7 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
 		.drv_name = "cht-yogabook",
 		.fw_filename = "intel/fw_sst_22a8.bin",
 		.board = "cht-yogabook",
+		.sof_tplg_filename = "sof-cht-rt5677.tplg",
 	},
 	{
 		.comp_ids = &rt5645_comp_ids,
-- 
2.53.0

