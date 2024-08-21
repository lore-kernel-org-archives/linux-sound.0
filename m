Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103F93D8E
	for <linux-sound@vger.kernel.org>; Wed, 21 Aug 2024 04:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724213415; cv=none; b=DBrG+G97Pdw5O885dtOa4+FKupasO7XSFCCFpixRYDE3ryFVwEcLgTGrgZEkYnh4mqLwnpNhfsR1qOK6651sNRtp34zoBhjjWJHb+VGv8ieKS3v4VcJ1GMkKbCv55Oas/JfrD+u59ZpubQQaqV/LkMTYuDUd4+YFSqCpnbREMDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724213415; c=relaxed/simple;
	bh=YDZNohKQqqPz/N5k8VbYl6Ec4oUtf7QY0sCd+uA3m+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Od7yHRgelhSXziM/HH3Vena2RE1QgEulCUxUvr6nR0j5keF3cF6Xl8pYUN1QLRqFkNTtadzlgB232jm32DkZ5kItonKo6dq1CPKeXvV21Z5H7Jrkcex/X/pW21VbhiNoZasNEHWcXJXrRwABFlkKq46xtff5QgJiAPsXMsd+ECo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=J890K5W/; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J890K5W/"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-710ece280b6so4748243b3a.2
        for <linux-sound@vger.kernel.org>; Tue, 20 Aug 2024 21:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724213413; x=1724818213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wb1BGggEIWmx1mLu9FEBtdmThLhgoJDxQRxO9C0cpI0=;
        b=J890K5W/1eE4tUTIksh3O5kIVFZTTLCezKNNgeEMUtSClU7KwA6C1b0VXB/YaULqda
         S1Yfeq1tTduU4F4wwlgB8Q5TKrGVFNpQ+tm182HrCV+6rMOb+aY7Fgh9tbllx5UZbABV
         R8fV1I3gVhepyiBQ+Et93igxokshNLjlrj604=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724213413; x=1724818213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wb1BGggEIWmx1mLu9FEBtdmThLhgoJDxQRxO9C0cpI0=;
        b=qLsw8O12jics25fBL8+5KowAER5w/stWRb8+ar93nL9NGzXGuNWIJEelS/GeRYCgQ6
         dchg+LAKg7AIu8F3/lQ74/cesZiVPtcF1PVEW07x0NVd/RtUcNLp4C5vdpM1S0Y7Qc9+
         hrfl0dArGiBXZ1kOeRaBKzXh2lBM4NfEiw37N+evp9ePk0s2f483RwkKuZR2J6ERu8A1
         ZMVD5sVGBPX/G+f2qev1JMPVgQPvUKqVN5E53NOECpGwAr8HiDi513wuPTe3CsCiFUig
         ZKJ1nfBYdE3zfknGWnX3xMV8/CuDEmG5k9umdYkKCArQgijLFy4fVwHYMCex5Yc29gUe
         WeoQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6DtiUAueqL+YtBMcAaUKlgvI/AHDiFt307EzZ+UpqiAbxBRwZI/4v5QiDaQytsVaV706St8AS/2peiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyHrVTXsVnLvmIoExiKalKRD7rW76k3DNfxvom1sbgIBjeoFKs
	/2a6itcIp4nG8Q48Hin3flobKOpUhoz6Oih5iv0eo6kTOPBzJksopMccODLUhw==
X-Google-Smtp-Source: AGHT+IGWCbre/KihO4WkHAHUcn8wEfYtDqXND56kswB/kXv6XyR8aIjMOshLV3AAsKFu3aOdvWQZ4Q==
X-Received: by 2002:a05:6a21:3183:b0:1c3:f4b6:6c0d with SMTP id adf61e73a8af0-1cad81a74c9mr1628745637.52.1724213413292;
        Tue, 20 Aug 2024 21:10:13 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8d56:286b:9a9c:b7d0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb917006sm527395a91.12.2024.08.20.21.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 21:10:12 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoc: SOF: topology: Clear SOF link platform name upon unload
Date: Wed, 21 Aug 2024 12:10:04 +0800
Message-ID: <20240821041006.2618855-1-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SOF topology loading function sets the device name for the platform
component link. This should be unset when unloading the topology,
otherwise a machine driver unbind/bind or reprobe would complain about
an invalid component as having both its component name and of_node set:

    mt8186_mt6366 sound: ASoC: Both Component name/of_node are set for AFE_SOF_DL1
    mt8186_mt6366 sound: error -EINVAL: Cannot register card
    mt8186_mt6366 sound: probe with driver mt8186_mt6366 failed with error -22

This happens with machine drivers that set the of_node separately.

Clear the SOF link platform name in the topology unload callback.

Fixes: 311ce4fe7637 ("ASoC: SOF: Add support for loading topologies")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 sound/soc/sof/topology.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index b54382131991..496162df5270 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2050,6 +2050,8 @@ static int sof_link_unload(struct snd_soc_component *scomp, struct snd_soc_dobj
 	if (!slink)
 		return 0;
 
+	slink->link->platforms->name = NULL;
+
 	kfree(slink->tuples);
 	list_del(&slink->list);
 	kfree(slink->hw_configs);
-- 
2.46.0.184.g6999bdac58-goog

