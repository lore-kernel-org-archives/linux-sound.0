Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB1E3314D9
	for <linux-sound@vger.kernel.org>; Thu, 13 Nov 2025 10:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030502; cv=none; b=mJtAl56Gs5i9+vgDRyrsSAmUi4gCO+PA9sV4d7PC58xTwmCTK1OKaXPyQE33CKLL9faZsYbzU9IIXmEd/YZk5p7bp1bIuXiuEApOFtynpoznG5WXl4+TPFfgQThpy61qAj00dyMKtomfQobJ0SZz19eYpl4C0ExTUu0aT6QunSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030502; c=relaxed/simple;
	bh=aNIpEp0tWzp6Hm7TmTE9jYjQYZRYZ+L/GDzDkm2PqH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RByuwTj9Eh8K0VYwW5Sjsw3XIbPH+sbem4K57n4mJhc3gYug2IoT2wJjSP2DK0YLawxCxke1UVgZxq4FWzXieWhlUEZFtghufqeZZzq8r3v15A+flf8Vp6J9oh4BJsFcCFsRn/5Fa623V2AbKV2SrVt4cg4ENp6xyKuZjpEdeog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20230601.gappssmtp.com header.i=@cse-iitm-ac-in.20230601.gappssmtp.com header.b=Jvt26m+a; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20230601.gappssmtp.com header.i=@cse-iitm-ac-in.20230601.gappssmtp.com header.b="Jvt26m+a"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-34374febdefso631987a91.0
        for <linux-sound@vger.kernel.org>; Thu, 13 Nov 2025 02:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20230601.gappssmtp.com; s=20230601; t=1763030498; x=1763635298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DJz+ux1agXrbz0s4q+1/StE2n0vhcodsi2hiIHN4wt0=;
        b=Jvt26m+ajkc4zu8OwRBlgSgN0CKhqTIYNB7h4BKiTs6cnpO1i1Ba4s/iAjkZC4/a9T
         A0AK0G+DEM+m4AJ/a53W+DqoZT/J7eWRbXR0mbCqaARgAv9VX9vsr8eHUusyAr12oB4K
         JsnzB6c2uGHWOFO2DTsTrUAkLGx6ZUH3pmKs/wBCnBWXxrPterS487Oy4GJPNtUYdWYz
         wmxczMK+84lzHYsnThrPMuRvwPibun/RMWdt2qhE0Z1EonGKOa4cPQrckH5A0LzEKdM6
         Erztm4918qbbSdkwp3ACyaqNBlSflJmourlCvVFHddhUFby4ydICi7pbnnZaNYZJttcn
         SxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763030498; x=1763635298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJz+ux1agXrbz0s4q+1/StE2n0vhcodsi2hiIHN4wt0=;
        b=URvzYpQRoFnAJRiRt8dW1BakkjbdOXGysoUG8pQ3ztN/S2InkVbFrGLr5DyyWcTlob
         U7yFyI5x4pBpU9y66YY9/SNSjEN6U6EJwr4CMrxkz4TgXgnnEiTsxS+sN6aCKDSk6LKT
         SaL/JKEoKtGQXWrxIBEPIKbkXu3EbgRP/05BFIHbuF4Ux2w244PRvBMuhLN6cuLFgkUv
         HnSTl4zMxWGuUcJOuBvp3wbLRXsu4QOoJJMja/PGVVjfJXq/gYjQ2fZ1Trp0qZIEp0EH
         pkz8RPal5o+dR/7JcqzojKVQPtqLPUtRCWedNGSPjc8j+h05y3Zz4FepAgKvg+F9rzfb
         p6pg==
X-Forwarded-Encrypted: i=1; AJvYcCUwRWdIDe8A0fVRaBBh49rzzPNDbXfM041jb7SZzsSe8W/1cJA5A2dNmye5/jh3jEA6NGzBNSHtbCVAjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsp3JG7vSuyYKb+BZUpSWsZ6CugMhjJ30MNOpB26uz7LyWpaGy
	TrVZPl8YQfNo7VGfVjmu0eYL813ELvyeEjK78Qfwrn/7PugiOf+ibwUtLn+BMZfqxWQ=
X-Gm-Gg: ASbGncu1Xrj/HzI99Be4/AJAkb6WiecsiMmnlwKvXhMZoNqYnQSPEmEV2t1ppzW7pqs
	RrIhcQhb1ySOVcdjyPa/Qm0h6jMiBn487tlkAblGUnd95wAxexZO3HMjXV1QksyIY1S9DbdACnd
	GuLc+PgVFaq3tKl3cD0enmqlKhgeI0ooEsW0rZueuYizSd4Uwy5uz44LbOFD0V6v0y39ogVe29r
	rJncgmljlFn1CjkwO/PUiJagUsn6R5FIuzpjmxEujQXtEKDFntPKxskuyKfWyyEXXjMmg2j918V
	5q49NugYI1rten0HlOaksQ+iSHapjqwomnZkWgjDppqUt+0sItIpcNzvK3+sM6jPE4FdcUQjGd8
	+vfAhx3l28Tlw66eP7/hdKdj9bd4wyVqSKVckomovKp5N5A0nk7FpvGsApLVtvAf9PDx32zRNn9
	prAPQC0wFgBN6FMQ==
X-Google-Smtp-Source: AGHT+IHJPNOxOgpSD+v9EzuulPA1PCX4HxiLuMt9tyYIQH59E/uUGS1fwIwf/FuYrqXa6iso6ctPZg==
X-Received: by 2002:a17:90b:5625:b0:341:88ba:c6d3 with SMTP id 98e67ed59e1d1-343ddec5702mr7551477a91.23.1763030498074;
        Thu, 13 Nov 2025 02:41:38 -0800 (PST)
Received: from localhost.localdomain ([103.158.43.25])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-343e07d3bb3sm5568870a91.19.2025.11.13.02.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 02:41:37 -0800 (PST)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: cezary.rojewski@intel.com
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: intel: avs: Fix potential memory leak in avs_pci_probe()
Date: Thu, 13 Nov 2025 16:11:19 +0530
Message-ID: <20251113104121.79484-1-nihaal@cse.iitm.ac.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In snd_hdac_ext_bus_get_ml_capabilities(), memory is allocated for
multiple hdac_ext_link structures, and appended to bus->hlink_list.
But the subsequent error paths in avs_pci_probe() don't free them.

Fix this by calling snd_hdac_ext_link_free_all() on the error path.
Also handle the return code of snd_hdac_ext_bus_get_ml_capabilities()
correctly, since it can return -ENOMEM.

Fixes: 1affc44ea5dd ("ASoC: Intel: avs: PCI driver implementation")
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---
Compile tested only. Issue found using static analysis.

 sound/soc/intel/avs/core.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 6e0e65584c7f..ece78a1c0e42 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -473,8 +473,13 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	}
 
 	snd_hdac_bus_parse_capabilities(bus);
-	if (bus->mlcap)
-		snd_hdac_ext_bus_get_ml_capabilities(bus);
+	if (bus->mlcap) {
+		ret = snd_hdac_ext_bus_get_ml_capabilities(bus);
+		if (ret < 0) {
+			dev_err(dev, "failed to get multilink capabilities: %d\n", ret);
+			goto err_ml_capabilities;
+		}
+	}
 
 	if (dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)))
 		dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
@@ -516,6 +521,8 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	snd_hdac_bus_free_stream_pages(bus);
 	snd_hdac_ext_stream_free_all(bus);
 err_init_streams:
+	snd_hdac_ext_link_free_all(bus);
+err_ml_capabilities:
 	iounmap(adev->dsp_ba);
 err_remap_bar4:
 	iounmap(bus->remap_addr);
-- 
2.43.0

