Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9393D1BC08C
	for <linux-sound@vger.kernel.org>; Thu,  1 Aug 2024 17:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722534399; cv=none; b=AAx5lrBWc4W9Bwqy/F3U53BWR3Z/K/mPUFed8e7CBhjlVcZ4hlLXv9E9mwXmbX/SW53omNRU1Uidju+EYxMCrcT8MQ9ybK9D6ZwzGyD0Wt52EHbqLHy1i/7c016sGGw86I63EQxvwPCR9E0iGYyfjOS9Jn8+nvliZvwA0D8qnNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722534399; c=relaxed/simple;
	bh=51vSfDSVgQti7LBW5rABQwS2HP2YLgDybOBfw/NQIco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pt2Exzu9KYernQqiNabrvjzzSx0Ftaz7GZHtnvgmHG5Rog7SqFq4L0S2u0NYvFmBPP6NdK+NTpUJloP+lSr9g33Vwj2R1EBs0D9d/pcAXp0jz/++7FHAwSMC0rFqn8DzIlsElnujEuaIhZt7VeO29nmkVta8iOubV8OE2R1MVRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cJxuOC/H; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cJxuOC/H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722534396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EKYe3JG3XdG/Dr3y0kVEnJ2M1SarV+ljxBmGoY7N+1Y=;
	b=cJxuOC/HxFXA54VU0XjxSUtGY+FcLTqDbNh4nrLN3NFioJALy6KUmg13IJ96XRvHUK1d4E
	FnGkuE7KFgMMGKvG8L/lOqL0qrmXcn/G1KppO/3igfBCN3uQLmpUwhMO/+Byuv8QMARSjG
	RSe/DOJ0qRMAY3hmjtlvfc63SxcHGT8=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-zlmlhj0QODuyxumC8pE9fg-1; Thu, 01 Aug 2024 13:46:35 -0400
X-MC-Unique: zlmlhj0QODuyxumC8pE9fg-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-52efa5d94cdso1088680e87.0
        for <linux-sound@vger.kernel.org>; Thu, 01 Aug 2024 10:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722534394; x=1723139194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EKYe3JG3XdG/Dr3y0kVEnJ2M1SarV+ljxBmGoY7N+1Y=;
        b=aWg+ncKjGhciogLOJ1BbwMfuY1zNcDnC7xVqFSDuZeIJ2cG4pgWlCtzA5Gl8FtczJs
         6CUen6GvbSm7Y5Hlq5dgmEnD+ugvbBGA3lskFHnR9LFgykkY2Ij2znJOcDgyHocsqshh
         aYuOSJnBg+RltqXCFQYWCqS6UaIlSLDv/3wAx8hkf8BAcW0xvhcolqiruP9tOCXE1fG/
         ZsSFkdII3/iQyD9xB251Y4bpNSjBHThuVFdPRK037M9v+9RQXLh2Uuw/Q45DNnTTNpXm
         n6O3cBN28WhL3BDMJjCubmQS7Xmp3MF7EzmJd3jAnt4f3QcYZAP8hR8oJiLvHkzKocfz
         M3VA==
X-Forwarded-Encrypted: i=1; AJvYcCXsyb4SkcUmNOmqxUfq/89qVTCDZersH5sYtsw0ksqSLsbl56m8FTu+1MNKP7p3GuQ6adXGstCk9Y3vNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrC4YHKiPhf4hhJUHkQlrMaSP4ptB56OueHaNWSY0vcfQOhYwB
	Fw2KADY8gnPUkf/Wv1GuOL/ghbu3fBqHpuNLgkLOX+rTYyVnaxHL6poN/g/ZUMnDJ/lFatIyyr1
	0urrQWTISNOTRLkmPFT5posUPiN32B+u7RfgO/bULT2odO/u4OD8QYOwsZxDE
X-Received: by 2002:a05:6512:2828:b0:52e:93d9:8f39 with SMTP id 2adb3069b0e04-530bb3813f6mr276980e87.3.1722534393809;
        Thu, 01 Aug 2024 10:46:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiRPmNTV2ZA6V1LPRxwNZSZX9vWB7cl7Z1KhFnduhYLHpUfQISvAwB/WNUNSi2aOfRb9YJ/A==
X-Received: by 2002:a05:6512:2828:b0:52e:93d9:8f39 with SMTP id 2adb3069b0e04-530bb3813f6mr276942e87.3.1722534393186;
        Thu, 01 Aug 2024 10:46:33 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3d4b:3000:1a1d:18ca:1d82:9859])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e83848sm5339066b.177.2024.08.01.10.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 10:46:32 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Arnaud Ebalard <arno@natisbad.org>,
	Srujana Challa <schalla@marvell.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Kalle Valo <kvalo@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Kevin Cernekee <cernekee@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Jie Wang <jie.wang@intel.com>,
	Adam Guerin <adam.guerin@intel.com>,
	Shashank Gupta <shashank.gupta@intel.com>,
	Damian Muszynski <damian.muszynski@intel.com>,
	Nithin Dabilpuram <ndabilpuram@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Yedidya Benshimol <yedidya.ben.shimol@intel.com>,
	Breno Leitao <leitao@debian.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org,
	qat-linux@intel.com,
	linux-crypto@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ntb@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 04/10] crypto: marvell - replace deprecated PCI functions
Date: Thu,  1 Aug 2024 19:46:02 +0200
Message-ID: <20240801174608.50592-5-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240801174608.50592-1-pstanner@redhat.com>
References: <20240801174608.50592-1-pstanner@redhat.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

pcim_iomap_table() and pcim_iomap_regions_request_all() have been
deprecated by the PCI subsystem in commit e354bb84a4c1 ("PCI: Deprecate
pcim_iomap_table(), pcim_iomap_regions_request_all()").

Replace these functions with their successors, pcim_iomap() and
pcim_request_all_regions()

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/crypto/marvell/octeontx2/otx2_cptpf_main.c | 14 +++++++++-----
 drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c | 13 +++++++++----
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/crypto/marvell/octeontx2/otx2_cptpf_main.c b/drivers/crypto/marvell/octeontx2/otx2_cptpf_main.c
index 400e36d9908f..ace39b2f2627 100644
--- a/drivers/crypto/marvell/octeontx2/otx2_cptpf_main.c
+++ b/drivers/crypto/marvell/octeontx2/otx2_cptpf_main.c
@@ -739,18 +739,22 @@ static int otx2_cptpf_probe(struct pci_dev *pdev,
 		dev_err(dev, "Unable to get usable DMA configuration\n");
 		goto clear_drvdata;
 	}
-	/* Map PF's configuration registers */
-	err = pcim_iomap_regions_request_all(pdev, 1 << PCI_PF_REG_BAR_NUM,
-					     OTX2_CPT_DRV_NAME);
+	err = pcim_request_all_regions(pdev, OTX2_CPT_DRV_NAME);
 	if (err) {
-		dev_err(dev, "Couldn't get PCI resources 0x%x\n", err);
+		dev_err(dev, "Couldn't request PCI resources 0x%x\n", err);
 		goto clear_drvdata;
 	}
 	pci_set_master(pdev);
 	pci_set_drvdata(pdev, cptpf);
 	cptpf->pdev = pdev;
 
-	cptpf->reg_base = pcim_iomap_table(pdev)[PCI_PF_REG_BAR_NUM];
+	/* Map PF's configuration registers */
+	cptpf->reg_base = pcim_iomap(pdev, PCI_PF_REG_BAR_NUM, 0);
+	if (!cptpf->reg_base) {
+		dev_err(dev, "Couldn't ioremap PCI resource 0x%x\n", err);
+		err = -ENOMEM;
+		goto clear_drvdata;
+	}
 
 	/* Check if AF driver is up, otherwise defer probe */
 	err = cpt_is_pf_usable(cptpf);
diff --git a/drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c b/drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c
index 527d34cc258b..e2210bf9605a 100644
--- a/drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c
+++ b/drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c
@@ -358,9 +358,8 @@ static int otx2_cptvf_probe(struct pci_dev *pdev,
 		dev_err(dev, "Unable to get usable DMA configuration\n");
 		goto clear_drvdata;
 	}
-	/* Map VF's configuration registers */
-	ret = pcim_iomap_regions_request_all(pdev, 1 << PCI_PF_REG_BAR_NUM,
-					     OTX2_CPTVF_DRV_NAME);
+
+	ret = pcim_request_all_regions(pdev, OTX2_CPTVF_DRV_NAME);
 	if (ret) {
 		dev_err(dev, "Couldn't get PCI resources 0x%x\n", ret);
 		goto clear_drvdata;
@@ -369,7 +368,13 @@ static int otx2_cptvf_probe(struct pci_dev *pdev,
 	pci_set_drvdata(pdev, cptvf);
 	cptvf->pdev = pdev;
 
-	cptvf->reg_base = pcim_iomap_table(pdev)[PCI_PF_REG_BAR_NUM];
+	/* Map VF's configuration registers */
+	cptvf->reg_base = pcim_iomap(pdev, PCI_PF_REG_BAR_NUM, 0);
+	if (!cptvf->reg_base) {
+		dev_err(dev, "Couldn't ioremap PCI resource 0x%x\n", ret);
+		ret = -ENOMEM;
+		goto clear_drvdata;
+	}
 
 	otx2_cpt_set_hw_caps(pdev, &cptvf->cap_flag);
 
-- 
2.45.2

