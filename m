Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF4D4A3F27
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 13:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790344766; cv=none; b=vFYFV9XrHhSBNr3A6OFLUO4dlf14TH43OyJitn/KIhMsKP9dN0gJxILjN3QWKD97Q+eSihq0j2pLqhaT8gs2Xey0eh+4b6FGr1+RXv6pQOJB+zCcCFiRZxpgWGGU6ftdSgthYo9HuSDm8cVb358hvunM5v1+aJyNJZnN5emVCHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790344766; c=relaxed/simple;
	bh=CvPIC2JM+dKqbCoDovUv5x2Gr6pbwd0JSckpKYb0jQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jg40FaXNIQEoFvTp90/hJhTrBlpT4iv7ndECwH4adddZ0YWVmxWVN897A0FPwJrUygIvpHKR6r+0TgTWHmYQHEqsvmDpCPySaUtqiIzRqPpUy6+3kjM9wGSYuxuuunYKWb5LLKgwiiTrrEz1WBgflsSMHIH23SCmgZaBb+WqsvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KK31PW5a; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KK31PW5a"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso10000895e9.1
        for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 06:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790344762; x=1790949562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c13af8RtL0FVbjY4/4zJyKrfrJUuMzJXKHCQJ/nPs4k=;
        b=KK31PW5ac3XkC9oRVy2h26t9cgsdQ9ensX403IBWSdFHl5kKVllpl1QxYSQb+Nspwd
         4CJYmheQcdcIyoskD/04QowQrKmpPiaH7XEV989gYDuHX5eRKcqFnS+Y/zCTTAmBEuqv
         FGvQ0mzakufg7ndrq7a8qogjFWmkHO4ViW9d8PnD+pu1ZM50qNZ8lL0lQl6dwYesGKpO
         /kCQy6L8YJiv6yJTarVlB2VSNyIZwCt6ysYC4sixjrb8rmTz7JmOqKSRIAbdmWnmhqkD
         UwWjr84O0vJlXvBRTCwnNE1Wncs3UkgcIXqiCpU7Ls4dxX280z79udz4a+FOynDOi43h
         4oxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790344762; x=1790949562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c13af8RtL0FVbjY4/4zJyKrfrJUuMzJXKHCQJ/nPs4k=;
        b=dPfu3ztriUY8nFoDtt3qpJN+frZz17+LLs9A+mdkRxdF2dzfPhubUd2o2MZFhQV0uu
         LWErylLRKouBTudUEtgiE94JRmTWgFx/je/IlNujztETwia7KKKBsOtR9J08+BkpYC/+
         yCKJAFTiWTDq6K7d9YAcg67ObJnISliE1FK11GrgNnhgLP8p8mpIVGbbTMRJ+1OG5KD8
         WElTLJjhV/HQ//8jWjuOj5gH59tMDRFnbZO0ddVNQjoLEgRpomrHA5U1MKZ/hQmCt5oM
         EVq4zFvnkE6Ja3jMjWsfcELvQGFU64ZrGgAqlBRtEfXsvsV6JZ5vQjMZPgye2euZDqub
         94Ow==
X-Forwarded-Encrypted: i=1; AKwUvBylPq7oPge8sk32WvuraD2RIvCZAqg1PpKiYPJZmQJfaW4Ql2TjrHAn0SIr6z6RMeRojEEtWrha29nAeA==@vger.kernel.org
X-Gm-Message-State: AFuF++lCmdaHPk7/1P20Zjw6frJlHbhzAhLs1i129h4k1+uXRCu2ls8j
	3Nus/E+RUCucWRH+p2ZoYg2pceTMOvdaROOknIgFLFRJby/fat+BxwmK
X-Gm-Gg: AYBFou1aDETQT6j37IeoyXqoEHTQIl7lkYDUyTohgdQvHcaI4XlgRTrlS1/pNnxPFf1
	A65kMLA8+PFs9vJWBuiCaLnfz+eK45K9FRwZw6NXNlh3pHwinYHCI+00Wj2k1h5RrrmJZhWdh5w
	xVdkoQFxVwsebxs6BzjCj3redPizbjbaP3X7F3qIKMotf3niPriC9QUDjE+36ut1ny9+qmpjMWn
	77Gc6cpJy+AiGMiaUgBvcff1lWt7FigvgKXFaC48qhLnw+qRi5kK9wLeF9Z+g1Mh0ZtJc/tlbhX
	+yz2QMhK5fZpSyOQFhgZ9+oc87534fWkfpwyOGmTLeC4kfMNeD4rFisrhFOgubS+/kt39H1BNz6
	C+AI1FmaBcwztVy4Rlwm/srqyse0JQmvEGrKvYdH8/UIq7ZNquR1z2jLKNfJIASxLaC4Y8i44Qm
	0FfoCQzhKsDK8Cvz/bE7ynPwfJ7nZFE/VctbdLYotNXwz6s1p33F83HdKOD7wVl2Kwlqc8bOuus
	WiR1GQBcSb7oPYcvvXYfepCAdfaJ1G4E08wvwtkLXcXfy5NLkfsNQ==
X-Received: by 2002:a05:600c:a413:b0:49f:f21d:b504 with SMTP id 5b1f17b1804b1-49ff21db60bmr31269925e9.4.1790344762330;
        Fri, 25 Sep 2026 06:59:22 -0700 (PDT)
Received: from 1Z10 ([151.43.147.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a648895sm7170769f8f.28.2026.09.25.06.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:59:21 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Yung-Chuan Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yauhen Kharuzhy <jekhor@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v9 2/2] ASoC: Intel: cht: Add Yoga Book RT5677 machine entry
Date: Fri, 25 Sep 2026 15:59:15 +0200
Message-ID: <20260925135915.338670-3-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925135915.338670-1-mauriziocasciano7@gmail.com>
References: <20260925135915.338670-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91F/L exposes its RT5677 codec as ACPI device
10EC5677. Add a Cherry Trail machine-table entry that supplies the legacy
SST firmware and board names and the SOF topology name.

The Intel DSP configuration selects one firmware path at probe time. SST
loads intel/fw_sst_22a8.bin and uses the cht_rt5677 board name; SOF loads
sof-cht-rt5677.tplg through the standard firmware search path. The same
kernel and machine entry were boot-tested with both paths on a YB1-X91L.

The SOF topology sources are maintained and distributed separately by the
SOF project.

Assisted-by: LLM
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

