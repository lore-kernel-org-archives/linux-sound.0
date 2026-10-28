Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153189;
	b=ukPt3wvsptEknp0CXeJ1n3Zq/RBa1Yq2dqkKHyOkhgb5FiO64xSZTXTtV/3LykTlNOJA
	 VyqwwMj9MbOMzJJru4dG2GPzAR5L8pvtcWp8QFdrRTcFutb5QNWFlbICfFi0J8VWE7iRN
	 j6guaTSG9eaoIqYVlEgyPOH3jQgHnGex/dyKARdjyJGrXmrWSC0+SYD5PV1zoBqefouaD
	 hbGYfhlQV6Jmng8bTId+iLvkXoI+LqWuftnPPtW9sxT3ctA6O9ndRDgp5Gs9e0KVKjCgV
	 TmBGv6qGG01/ZiGr5ZlFTJRPDbYc0v/EEbccIys0LfYhSzhV6tY59UcfXy9Qf7h2iFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Y3QUlAXMrpLyU+X/bo6T8uFjQZ64sjzHwbuQZSxHHds=;
	b=f4HUDV6uNhsxzD7xOnZnhfuqs8pajSQVmSEyJs8p7LJZ+5bb1plORiXx+V4u24LQg1HY
	 bw7qU9yyrvkjV9bWabDlQYP46lSicDYAUA7jJSvKVcEIkSsPnnwVwfCL5ZMOSc/qKobZM
	 FpHYBFc5UU2u19Nz5tdNE4bf0D9fEf6bkXJVgyDdv7bG6j753maVj0nnYm9X2eEGqrK31
	 Z9dXuFjI4S42YGU5IaxwnMnTQAXFQZD8MvZi7mHcqTKzhIBtDzA6Slqh96sCGZ98iY8kb
	 IXx7eHqDhxK9gjWN4vi6vSdGWJvMYKv8nYcKS38DDgYuMRz+5gihDIaFxuonV46QxHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nSg9pXQs;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5E5606A31E
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D5E5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nSg9pXQs
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-845788309b4so242266a34.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 19:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793153188; x=1793757988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y3QUlAXMrpLyU+X/bo6T8uFjQZ64sjzHwbuQZSxHHds=;
        b=nSg9pXQspuc25Che1EaHvXvoHMI2IEnbQhjCVNzibQZspVd/POK8rcQVnS1r46C/IR
         egE3MyWFJDpvWHBfiGpB7mScbK7d0DsTVccIDWJKxe24hVygW9J6nbg9zg21a6uz+vMM
         FO7kb5Hmt/59evIxuJyepDT/TKuCDwV8LC6Yl5jz0zhXZTr3wCZlkPtFONhnFBCJ41w1
         Wo6+EWx2Vq7q1NVnruLvaAYBN/kPcKESSSD4C2lJVrp1HCOVrp+tBw9i9kReE+MNylP8
         883qcJFjwUXCV4IlkFkRGhZoMExTtLRmz1Mp6Yssb5R0xs1tQJFyogfZxIRYUjc+wcMO
         L6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153188; x=1793757988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y3QUlAXMrpLyU+X/bo6T8uFjQZ64sjzHwbuQZSxHHds=;
        b=klp7iPnOORMu/Qmcu6WB9Me+Aho7ncSkyZ8ZPGGg+Qi/UL+mqmwUie2fibfkclbHaP
         tcfJyv4V003KeGSMOyM83MGZMcXr+jgYYG8eYzWLDFEhUqHAQ4w8f3kH/islUntNhrQO
         vu4oow94WA9FZ2iibTBN/G51zZj4u5JUT+iWgyKgKHAO8wDbOdhBlLtI/d2ZU8sJL5PZ
         m/BsI7ygp2Tusz/2vYcUCqQ5d5v7Q7kX4W5HKlL2Esu6Jd1iEeXvB9EmiaXSBu69e94J
         aUsrWR7PH8JAClcaqqo19dC7LP/2A48wcbR+CVeE1AWOmAb9piCLlpUCOGGOtnC4C5Du
         myGg==
X-Gm-Message-State: AFq9FYK8a3c4Zz3mEKMwl/D4We9GE/s1qF7JpYhRHivXDOz5a4Ir0/aY
	oO1AOzzdzB3vh2sw8yErMziIh9c53aDuIupEf3tkrCH5EHvjPCbTx/RM
X-Gm-Gg: AYBFou3mKRTEsUaSoGFIHbojF2GWT7W4QCSM06/dC/0+HABY2tx5e86qbyaxI8d22Pe
	Z3nh3pwz/WNISNxq0whaKGwWqJMwlblNal3mVlBCUjWmHqHFeJv/KRoFBksw1Z2VOZM5Wvy28R9
	3P3uq7wnpdUQ4OO3wMEEioYLUFJXI8NJz5lI7RxPhTxbVzsWV2mMC61p1WpB2l4uFZ5mFbzZocE
	a7YFjAqTm3+MWPl/EMPn06e77ncxYOOiGNZmC1Ql0HfND8g1Xn9418f0XvgJWehAMgIBQ0tV7vi
	UjXITph3Jvd9sEuo955Kg2kT1rg21w6Bf5ChEXtRHcVzXFx6kv5PdVmaY5OvyaxlaoLdZgOxPXo
	Edg9KvkwVqnRFTRVDxbBAX7EBYizh4YMEVkmIw3KmGiRXJEa5YEMb1RUmtv7RS3XH3M+cNFg1Dl
	ulmahAu8Q/1mKWPQljvWbX73FhY+dekoTOGRS/IgeH3Lq1U7XXbhAQQ1d/6d4Y6yiGaZ1oTR2tx
	l6rxoncXKgd7hNLo0CC/MGX7AJmE3g/HgGvMIgxV+0bQybSJSYw+MQ8il6SZjndLdKWOoYh4lZR
	/aeG0tnhbsRqZBieRBCuLDwB7aLOWmV6j4BuD3i72RBsuhowo0Zs0D5rSa9ajAVoYhnhL1lS51P
	192c+M+NHZ7Gpy27JpmRhphPrqpamLUttVG232EOVfkA=
X-Received: by 2002:a05:6830:411a:b0:843:d5ee:5785 with SMTP id 46e09a7af769-85ac0038ca3mr1300771a34.12.1793153188474;
        Tue, 27 Oct 2026 19:06:28 -0700 (PDT)
Received: from localhost.localdomain (162-233-222-157.lightspeed.livnmi.sbcglobal.net. [162.233.222.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b1d363390sm355217a34.1.2026.10.27.19.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:06:27 -0700 (PDT)
From: Corey Smith <corsmith@gmail.com>
To: corsmith@gmail.com,
	Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 7/11] ASoC: amd: ps: probe the ACP6x SoundWire stack
Date: Tue, 27 Oct 2026 22:05:48 -0400
Message-ID: <20261028020552.35278-8-corsmith@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028020552.35278-1-corsmith@gmail.com>
References: <20261028020552.35278-1-corsmith@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Accept the ACP6x PCI revisions in the Pink Sardine PCI driver when the
FLAG_AMD_LEGACY_SDW quirk selected it and wire up the ACP6x specific
pieces:

 - reuse the ACP6.3 hardware ops (power/reset, DMA IRQ);
 - use the ACP6x register range for the platform resources;
 - select snd_soc_acpi_amd_rmb_sdw_machines as the machine table;
 - probe the SoundWire controller at ACP6X_SDW_ADDR (_ADR 0x02).

Rembrandt firmware does not advertise the integrated PDM (DMIC)
controller through "acp-audio-device-type", so enable the PDM path
unconditionally for ACP6x, matching the legacy snd_pci_acp6x driver.

Assisted-by: LLM
Signed-off-by: Corey Smith <corsmith@gmail.com>
---
 sound/soc/amd/ps/pci-ps.c | 85 ++++++++++++++++++++++++++++++---------
 1 file changed, 66 insertions(+), 19 deletions(-)

diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 729f9aa..a8032b5 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -418,27 +418,54 @@ static int get_acp63_device_config(struct pci_dev *pci, struct acp63_dev_data *a
 
 	acp_hw_get_config(pci, acp_data);
 
+	if (acp_data->acp_rev == ACP6X_PCI_REV || acp_data->acp_rev == ACP6XR_PCI_REV) {
+		/*
+		 * Rembrandt firmware does not describe the integrated PDM
+		 * (DMIC) controller through "acp-audio-device-type" and uses
+		 * the legacy "mipi-sdw-master-list" property name.  Boards
+		 * reaching this driver were routed here because they expose
+		 * the ACP SoundWire controller, and the PDM controller is
+		 * always present, so enable both.
+		 */
+		acp_data->is_pdm_config = true;
+		acp_data->is_sdw_config = true;
+	}
+
 	if (acp_data->is_pdm_config) {
-		pdm_dev = acpi_find_child_device(ACPI_COMPANION(&pci->dev), ACP63_DMIC_ADDR, 0);
-		if (pdm_dev) {
-			/* is_dmic_dev flag will be set when ACP PDM controller device exists */
-			if (!acpi_dev_get_property(pdm_dev, "acp-audio-device-type",
-						   ACPI_TYPE_INTEGER, &obj) &&
-						   obj->integer.value == ACP_DMIC_DEV)
-				dmic_en = true;
-		}
+		if (acp_data->acp_rev == ACP6X_PCI_REV ||
+		    acp_data->acp_rev == ACP6XR_PCI_REV) {
+			/*
+			 * ACP6x always integrates the PDM controller and its
+			 * firmware does not gate it behind _WOV.
+			 */
+			dmic_en = true;
+		} else {
+			pdm_dev = acpi_find_child_device(ACPI_COMPANION(&pci->dev),
+							 ACP63_DMIC_ADDR, 0);
+			if (pdm_dev) {
+				/* is_dmic_dev flag will be set when ACP PDM controller device exists */
+				if (!acpi_dev_get_property(pdm_dev, "acp-audio-device-type",
+							   ACPI_TYPE_INTEGER, &obj) &&
+							   obj->integer.value == ACP_DMIC_DEV)
+					dmic_en = true;
+			}
 
-		handle = ACPI_HANDLE(&pci->dev);
-		ret = acpi_evaluate_integer(handle, "_WOV", NULL, &dmic_status);
-		if (!ACPI_FAILURE(ret))
-			wov_en = dmic_status;
+			handle = ACPI_HANDLE(&pci->dev);
+			ret = acpi_evaluate_integer(handle, "_WOV", NULL, &dmic_status);
+			if (!ACPI_FAILURE(ret))
+				wov_en = dmic_status;
+		}
 	}
 
 	if (dmic_en && wov_en)
 		is_dmic_dev = true;
 
 	if (acp_data->is_sdw_config) {
-		ret = acp_scan_sdw_devices(&pci->dev, ACP63_SDW_ADDR);
+		if (acp_data->acp_rev == ACP6X_PCI_REV ||
+		    acp_data->acp_rev == ACP6XR_PCI_REV)
+			ret = acp_scan_sdw_devices(&pci->dev, ACP6X_SDW_ADDR);
+		else
+			ret = acp_scan_sdw_devices(&pci->dev, ACP63_SDW_ADDR);
 		if (!ret && acp_data->info.link_mask)
 			is_sdw_dev = true;
 	}
@@ -487,7 +514,7 @@ static int create_acp63_platform_devs(struct pci_dev *pci, struct acp63_dev_data
 		}
 		adata->res->flags = IORESOURCE_MEM;
 		adata->res->start = addr;
-		adata->res->end = addr + (ACP63_REG_END - ACP63_REG_START);
+		adata->res->end = addr + adata->reg_range;
 		memset(&pdevinfo, 0, sizeof(pdevinfo));
 	}
 
@@ -556,6 +583,8 @@ static int acp_hw_init_ops(struct acp63_dev_data *adata, struct pci_dev *pci)
 		return -ENOMEM;
 
 	switch (adata->acp_rev) {
+	case ACP6X_PCI_REV:
+	case ACP6XR_PCI_REV:
 	case ACP63_PCI_REV:
 		acp63_hw_init_ops(adata->hw_ops);
 		break;
@@ -581,20 +610,33 @@ static int snd_acp63_probe(struct pci_dev *pci,
 
 	irqflags = IRQF_SHARED;
 
-	/* Return if acp config flag is defined */
+	/*
+	 * Return if an acp config flag is defined, except for
+	 * FLAG_AMD_LEGACY_SDW which explicitly selects this driver's
+	 * SoundWire stack over the DMIC-only snd_pci_acp6x driver.
+	 */
 	flag = snd_amd_acp_find_config(pci);
-	if (flag)
+	if (flag && flag != FLAG_AMD_LEGACY_SDW)
 		return -ENODEV;
 
-	/* ACP PCI revision id check for ACP6.3, ACP7.0 & ACP7.1 platforms */
+	/* ACP PCI revision id check for ACP6.x, ACP6.3, ACP7.0 & ACP7.1 platforms */
 	switch (pci->revision) {
+	case ACP6X_PCI_REV:
+	case ACP6XR_PCI_REV:
+		/*
+		 * ACP6x (Rembrandt) is handled here only when the DMI quirk
+		 * routed the platform away from the DMIC-only driver.
+		 */
+		if (flag != FLAG_AMD_LEGACY_SDW)
+			return -ENODEV;
+		break;
 	case ACP63_PCI_REV:
 	case ACP70_PCI_REV:
 	case ACP71_PCI_REV:
 	case ACP72_PCI_REV:
 		break;
 	default:
-		dev_dbg(&pci->dev, "acp63/acp70/acp71 pci device not found\n");
+		dev_dbg(&pci->dev, "acp6x/acp63/acp70/acp71 pci device not found\n");
 		return -ENODEV;
 	}
 	if (pci_enable_device(pci)) {
@@ -622,7 +664,10 @@ static int snd_acp63_probe(struct pci_dev *pci,
 		goto release_regions;
 	}
 	adata->addr = addr;
-	adata->reg_range = ACP63_REG_END - ACP63_REG_START;
+	if (pci->revision == ACP6X_PCI_REV || pci->revision == ACP6XR_PCI_REV)
+		adata->reg_range = ACP6X_REG_END - ACP6X_REG_START;
+	else
+		adata->reg_range = ACP63_REG_END - ACP63_REG_START;
 	adata->acp_rev = pci->revision;
 	adata->subsystem_vendor = pci->subsystem_vendor;
 	adata->subsystem_device = pci->subsystem_device;
@@ -657,6 +702,8 @@ static int snd_acp63_probe(struct pci_dev *pci,
 	}
 	if (adata->acp_rev >= ACP70_PCI_REV)
 		adata->machines = snd_soc_acpi_amd_acp70_sdw_machines;
+	else if (adata->acp_rev == ACP6X_PCI_REV || adata->acp_rev == ACP6XR_PCI_REV)
+		adata->machines = snd_soc_acpi_amd_rmb_sdw_machines;
 	else
 		adata->machines = snd_soc_acpi_amd_acp63_sdw_machines;
 
