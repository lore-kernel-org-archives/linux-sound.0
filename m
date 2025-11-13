Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FB734AAF9
	for <linux-sound@vger.kernel.org>; Thu, 13 Nov 2025 12:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763035560; cv=none; b=lIeIbMOhRsW8Cv3TtOxII9UIBkoGgNljrNw9hr0DrKQGVsypVgiMtRQ0O7wgVLg6Kys7x8+vJ1WWxdwNAhjw3UZlBCV5HeVM9MBDnuT9y7UEit2mmBnZrsRDOGJjaHS8t5iYbmKXrn7AEE9LquKqv9xtMBjQeQc7vagHSp7+TZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763035560; c=relaxed/simple;
	bh=FQCyISZnPOKJei2bgAKraXYH+mV70ZDTbaSgZq6DQ2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A/xPJdCiMFVUgF73Hw/FxRyK/B1SLAUubhq3kHdlADzmtlgyw3keZ3Z/jhNRM69UAvUNhCuvVeX4wJJG3zZ100rOW/uuoc8B7xseI/hQ13Mlce8YlUfAs4qksQrgb8Rypeno82oy/USfh3t1SSOSjiXx/W3FJ64sV77Dz3rYkxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20230601.gappssmtp.com header.i=@cse-iitm-ac-in.20230601.gappssmtp.com header.b=tw4s6Fkp; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20230601.gappssmtp.com header.i=@cse-iitm-ac-in.20230601.gappssmtp.com header.b="tw4s6Fkp"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b556284db11so511613a12.0
        for <linux-sound@vger.kernel.org>; Thu, 13 Nov 2025 04:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20230601.gappssmtp.com; s=20230601; t=1763035557; x=1763640357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GfHQGwR2IJ0YhvOVkLG4P4YqTO9ZoG8OUJ/4HMhDBS4=;
        b=tw4s6FkpCKcJOXXEMyAmR698AilOfHhB6SacnBOHt+2JYn76GZZxcts2IlqKBtU6rU
         6W8h+8J9KRDlaN4O3WLq5Bw/RDvtS4jEb2T+6S6Hunn5bqT9WLDUzAvUEJ8GvWYOPiqp
         8OYNuraP887WFGFQmUDjycYtG7qmz7BTBkQZ69dspJQ4jPxzfz9CAz9iTAyRUNHx5xww
         gTjoAY6ugASbQZ/dn4UbAtFn+vHhnYP60N3tNEZc3xMj+0zotcU1U47stdRbDa4d1d2j
         PwyBvvcwB2OB75E9YFECkWdmLZNU03b5klPCI4fubIbipx3A8i+G4shg97ve5FznVnze
         SNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763035557; x=1763640357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfHQGwR2IJ0YhvOVkLG4P4YqTO9ZoG8OUJ/4HMhDBS4=;
        b=qpcCz7gXNDw79RqdV/CjlTxkuUTs27OkDJrjJlkloHl0a30qSOvq8vKO8PfR/UF0BC
         6uNm2KEwoVK3lUDtgr/ddg8wzWDpuB26AnUNI6A29Bp/vgphUJW8bhqn8um6715I+Q8Z
         w//JCat7G/DE2p/G5qGDp9B/NmZwAF3Lv3+LfnFpTtF45CIyQDWTjC8UUoq5BiajQHSn
         R5wLRHyXx+TuwTB5FfdSb2CbPc4E8NIciHxvEzxEp4qru5lvpuwWdZWQV8fa9ThDIlmc
         3W0zEfIzEt8lY3v0nLYIgj6ULSEp5IlPZ/Tsd+4ZGG6laO0/tf4v1bydd4PCao/A/cNN
         VbiA==
X-Forwarded-Encrypted: i=1; AJvYcCXxpF4mRYVDBq76yuQrQauJKzerYZV8EU5e9ggzE7P8wq77ArCFmiAdnffo9px6ka8wuzRprxHiZIW+xQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt4Q3uYvx3FQLgsbEQ+OZBUOyNRX1i8X3l+G6duC7uIvSi4OZQ
	wMPixx+6H+2E1P18p7+JPUge2XDTwBAxR4nLWWoVpWJILQBZ9cSzbvbDrTq+ZyWPoAY=
X-Gm-Gg: ASbGncvitk+O3qp3gf3Eqtw6nrc/i5qQhNXZW3/QzLhFiCITRbjyqRKJkJUaQueNeF8
	E2BugzguwVCeP9MwzVtSYRuu/JQAArIEUz0NVSyeOVsF8DDBDeEheccF6T7GtjXASdgirMDaI6f
	zZ/1vPdOk/a9k5y/RUi9UhhIfsb7BWL1tqUq0q6VSycNksZrsr9xmze3ydEBFR11lrW7Y24P6IB
	8zEHHNrvVM4dCxEJQDLQIEMTNUOpj9tzDwlQZG+LnJ1FcgetssrtSz8AWvmTGY7EExjOLO8f3hF
	OsKbmXMbgD5/K6ixv4ksX6uVr9TnlZ7XKBagVVnmrn0GCrrcoT171pK2beWERxHha1aj3gBP2+s
	43s2+U80JJXkzm5Vluc4XBAJEKiLgBpSepjHm3+X76Yp5Xj1BxFbD3ukLPeAPFfsPQH6bOBQKXa
	oVhDBGu9pYFQZVs5XXw503fanZ
X-Google-Smtp-Source: AGHT+IFgo9WsRupy+/jqOwQBJv80tuF4CK2JKSkC+PdQn2V45/Xn8leUXKdiJbwaz/ZGzv5fvvuF/A==
X-Received: by 2002:a17:902:ce0d:b0:295:7b8c:6611 with SMTP id d9443c01a7336-2984ed48d7emr84032885ad.15.1763035556593;
        Thu, 13 Nov 2025 04:05:56 -0800 (PST)
Received: from localhost.localdomain ([103.158.43.25])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2985c2bed7bsm24122405ad.74.2025.11.13.04.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 04:05:55 -0800 (PST)
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
Subject: [PATCH v2] ASoC: intel: avs: Fix potential memory leak in avs_pci_probe()
Date: Thu, 13 Nov 2025 17:34:41 +0530
Message-ID: <20251113120447.86911-1-nihaal@cse.iitm.ac.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The link resources allocated in snd_hdac_ext_bus_get_ml_capabilities()
are not freed on subsequent error paths in avs_pci_probe().

Fixes: 1affc44ea5dd ("ASoC: Intel: avs: PCI driver implementation")
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---

v1->v2:
- Shorten commit message 
- Handle the case when some of the links are allocated, as pointed out
  by Cezary Rojewski

Link to V1:
https://lore.kernel.org/all/20251113104121.79484-1-nihaal@cse.iitm.ac.in/T/#u

 sound/soc/intel/avs/core.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 6e0e65584c7f..f0d77f3f3a28 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -473,8 +473,13 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	}
 
 	snd_hdac_bus_parse_capabilities(bus);
-	if (bus->mlcap)
-		snd_hdac_ext_bus_get_ml_capabilities(bus);
+	if (bus->mlcap) {
+		ret = snd_hdac_ext_bus_get_ml_capabilities(bus);
+		if (ret) {
+			dev_err(dev, "failed to get multilink capabilities: %d\n", ret);
+			goto err_ml_capabilities;
+		}
+	}
 
 	if (dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)))
 		dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
@@ -483,7 +488,7 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	ret = avs_hdac_bus_init_streams(bus);
 	if (ret < 0) {
 		dev_err(dev, "failed to init streams: %d\n", ret);
-		goto err_init_streams;
+		goto err_ml_capabilities;
 	}
 
 	ret = avs_hdac_acquire_irq(adev);
@@ -515,7 +520,8 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 err_acquire_irq:
 	snd_hdac_bus_free_stream_pages(bus);
 	snd_hdac_ext_stream_free_all(bus);
-err_init_streams:
+err_ml_capabilities:
+	snd_hdac_ext_link_free_all(bus);
 	iounmap(adev->dsp_ba);
 err_remap_bar4:
 	iounmap(bus->remap_addr);
-- 
2.43.0

