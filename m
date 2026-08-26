Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9168742A168
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 13:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750633; cv=none; b=BZgkklUakjODKuTue+ji3rhk3wpozyPTHVY7FT/uWmvQt/ajoBBeT0R221d7MKGqfpDo1Q32LlLPwlRZFXfVgM7Y+ZUYYwUwuAZrhwzEdVth73kJ3zgeb+KvifeQ6dOkqjh+mT7RKUwbDhgB32ua/8VCmSBC1k1P9qPs3DK3+/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750633; c=relaxed/simple;
	bh=NJ6RnEv70zpJM8I9fP8i0P+6NmKcI0fX6zr6eP4Q38k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TinZoeVrET7HbRfA/79KfoM5CMlDhs7YzSnwc3fiFyDfbxluMzGAu8HhHB+I//Vo7UXHPQfneQNlTkdK/URGhtRw91UKze9FozusdvQxyQQODca2fcxO46f2vvKfI7PA0LGQvIMAnF1HiJaYnhrwFD/lUAz4JkCo2q6qlH5B2lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJjUOdP2; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJjUOdP2"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c197eaaab00so153424466b.0
        for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 06:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750628; x=1788355428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4VAT0T5auzwEUMc8PKzeTgZNflNYpYN7TUG5tnzFp2w=;
        b=KJjUOdP2QR/TtXIVZQhuNN05dIUBAEj957g+SO8oZoDh+r71d46EWNZLsyUi5zaJI6
         LBaLmU8sKpRoTTC85tMG4Md0d8vCrGmgFZCk4f4wPlhIOGc39PEJEKDqLLNtKVpgxOsn
         WA8eVyGiQGgOf71p2xHfV2KsIxPfHAuX0s0b53KDm45/xXXKynqvW1TuOfhzz3Tce8WQ
         4ghboFwrqHuLt8WMMVNRnmHPN2owkiSRA6LfCRXd41VvKIIZ5df3/7faYBFsy3iRPFTc
         i/xpSj6sqY7RJb/ybgPd8BhGjqwGM/pvk8DLwjdUf+dPeyKSssZ7JQRWDPJFP+RmQZst
         6xpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750628; x=1788355428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4VAT0T5auzwEUMc8PKzeTgZNflNYpYN7TUG5tnzFp2w=;
        b=MiqKPlBfivHX7DrNDQBqpLh/Nn8jw5OFVF9eoZm+EQP0f0h8Krb+CHAd2CwWQkNbyX
         NkMRD1+Pzxvxby4U4Kqpe/d8iQqoakBZb6AKr7Fxq8DXgE8HdmLDglNeCJNOR0okKMPK
         DIvCSt4O4gS2hVZL151e1aDdL5BeU9xMQSTNazjYVGYcUDLBoqUO7fEBizpSk2ZVmlPD
         6k2n5VZOqsh3m8t9lp0q9gHdAfG9GA/+beQuB6BCDG2HHngSW1/rD1pw6thpQAyJr+7i
         jIwBjBAmFU4r7BcRC94E5LfwRdhpZwlcETYltbVsn9qwjZQAspCg48ZyJ4MZFwHjYsPr
         oM9Q==
X-Forwarded-Encrypted: i=1; AHgh+RoQiO6qiSouWBBSauETYF0W+aml9MPWT8j43VKVCD/oU2sbtj8iOn1n1Za3V5rqVeFawdm6/hMi5iJGIw==@vger.kernel.org
X-Gm-Message-State: AFuF++kR+E0vj8fEA0EqitSFhZXxjTox5QNxslZiOWCSWUNr3kD5+50J
	b51JThiiQCuRMzdBJxK+EXSifia3fRTULCWefjgD08d0GXw00o77lCBwFBrBAz+i
X-Gm-Gg: AR+sD135ftY3PK2VIS6dkIYjvhMcacaOnA7z0bHLBrgsYlZmT9SXxqT4ltKOFOWSPan
	aItB+5e+kRTEliry/DCevbpz46v3B9kNVhyLkY8Dy1MJTHBdKX2sx+UkVo6QjybHSp645wDwYcC
	/COh/z6nlDGNwZRK5J0vFjfbIy/T89qmiijTySJ4f2LIMs6WH+KBxS4ZaWNV+hc4QPcMnoneVnL
	i7NmqioK2pPyEc4fed75Go2/kQJyHw4XG6TZWNZkzc1+sDYD5tOq2GX2IvAOm7AWrNete0ULJfK
	rhPOJ9Ovf/WcNvJa5XBsvjcI4NGUp9HWB9inqm9+fK6YUvIqtTwELPQEcyCsvmhgys6X7XFSg0h
	CmRqC92ZOwH1Z26lBPqXsF4brSnMajPC4LC1Phl5tyk0s8up7jmeBjpu0dKmt9G2jn5LjzL72Vq
	pkKbioeofmLObSylE/yVrI72iecXagESuc83Zme270rusfWwDD7scCu8oqrdAkiTAUbMA5RMrsG
	aCJaMVR7tFZWT8AYI3WckSOZA+stGqCKtnqXyM8Upg=
X-Received: by 2002:a17:907:9815:b0:c20:5798:7b9f with SMTP id a640c23a62f3a-c250bc1567amr880518666b.10.1787750627651;
        Wed, 26 Aug 2026 06:23:47 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250f99f6bdsm376856066b.0.2026.08.26.06.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:23:47 -0700 (PDT)
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
Subject: [RFC PATCH 2/3] ASoC: Intel: cht: Match the Yoga Book RT5677 machine
Date: Wed, 26 Aug 2026 15:23:33 +0200
Message-ID: <20260826132334.3344395-3-mauriziocasciano7@gmail.com>
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

The Yoga Book YB1-X91F/L exposes its RT5677 codec as ACPI device
10EC5677. Add a Cherry Trail machine-table entry so SST creates the
cht-yogabook machine device and loads intel/fw_sst_22a8.bin.

Keep SOF topology selection separate. The following patch names the
matching topology and documents its external SOF project dependency.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 sound/soc/intel/common/soc-acpi-intel-cht-match.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
index e4c3492a0c28..f9acf6a41c1a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
@@ -137,6 +137,13 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
 		.board = "cht-bsw",
 		.sof_tplg_filename = "sof-cht-rt5670.tplg",
 	},
+	{
+		/* Lenovo Yoga Book YB1-X91F/L */
+		.id = "10EC5677",
+		.drv_name = "cht-yogabook",
+		.fw_filename = "intel/fw_sst_22a8.bin",
+		.board = "cht-yogabook",
+	},
 	{
 		.comp_ids = &rt5645_comp_ids,
 		.drv_name = "cht-bsw-rt5645",
-- 
2.53.0

