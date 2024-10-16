Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF6F20F5C1
	for <linux-sound@vger.kernel.org>; Wed, 16 Oct 2024 12:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729082520; cv=none; b=naAI1t+7EQaOtms14gRSkBYTZmVtWXy0gFsEmG7Ye1Eyz2HXJLa9XTHOkX0UbheLPOkADlLv4AjnAJENKA4RXdvjpx/wyOLoxBmgxwQHokp2ym7NTSKjhRoAQwysY54Yb67QHrUVHISrw80wBUZPcu3prcZlwzKcI5VO605tgmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729082520; c=relaxed/simple;
	bh=KRhL2deOZRHNfuo7/CizyodCPj2p+YqlhuhaNJFSYuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nglWT5IVXCA4AzzW2n6pN3uK1alOQYAsa5NRZX4T2Fp8AKmAFraW/eW+vEeQXG4g+0OqphVqvkUnSQL2Rk/qe3yiS/j2bj0rO5PfwCsL+ZhRgP9PWXn1YE8cCK0xsnGCVufp4yvbWBJimmKgA5c7bVFMrz9PQ+l4Iv4jdzHQ2vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dSAaofN3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dSAaofN3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729082518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oH83zA24aoDnwtpuZ+wclLhu+n7qeaaZUv7+D6hfs+0=;
	b=dSAaofN3gTAsghdXGLb0CK2qlLGpTSdcXh4jMx2S2MKf0S7CBDJru6GlMq1IXpG/NbwGEo
	j5ezpfYflhM6qFqODMcz6NlwAr/lmEJTGA5P2PqqDMToFnCzLLe8aTq4Fx0w1HBRa8UFEV
	ElxKHE4H2X3ALpqdj+8q7aMAJOZ5aEM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-I97MGTcAMli269VU5DUbjA-1; Wed, 16 Oct 2024 08:41:57 -0400
X-MC-Unique: I97MGTcAMli269VU5DUbjA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-37d4a211177so3305750f8f.0
        for <linux-sound@vger.kernel.org>; Wed, 16 Oct 2024 05:41:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729082516; x=1729687316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oH83zA24aoDnwtpuZ+wclLhu+n7qeaaZUv7+D6hfs+0=;
        b=Wu0n28OPdOSI57fsZb2etpPPFXNu7o9ESRwjWCuFMrza8iV8dAtDQ4qZh7LtGeRcQO
         UoISZRMatXdCX8mVAG7eNcvx3N5uMu2S7ew0tiMM8G2MmzxtRmY/1kHR/mIGp6Ak39z3
         iyVPO9ErfijHvgZzGaFB0vD8EU3h0IB9MRf+zDmoHjrBZb/8qsMvcd3bIzcxCgl1gQME
         mJ6AkVBAs1IkmPnjKZTthEGIiWJ1s92m3BL74nP1zrFqkPOO5Kb9gcXnKNpFwqr99jYq
         mG7dKcX6fvvekj1XNPEx8/sqXwa6A+uSWZy09xtiButgg5m2mIphklJxmDZsWexLSHXK
         Zvcg==
X-Forwarded-Encrypted: i=1; AJvYcCVNaWzt3C+8qFtJ7T+ouT3+cGFbory8b3rCcqEr333xrlLSXhSLj2FB+Uw3lrkSRiVbNB3ftSTjuNkVqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzglDuEtJM5bS25egZje1mST9ZJtLJCCsNp8/L5Q8nEwYRTitjX
	OBmoR9QzNnNX69DUhAte1MuOJC5uiFJRzfzhhblsVX1lsOQ0CaG0D8BY1i26t6jHI6WRPGnRnSL
	Xwh1PkMdfUycHhB00ijScqPxezg88TjX2gf+qwTUJvSeTPgCnhiSU0181L91+
X-Received: by 2002:a05:6000:e51:b0:37d:452b:478f with SMTP id ffacd0b85a97d-37d86bb6b99mr2654904f8f.4.1729082515875;
        Wed, 16 Oct 2024 05:41:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFK2H8/hCpU0cwTi4SjNpk9gLTo3Rp+q9K7qNZEaDsuWbxh1ss7QKO67/oTjHSIwVlBMGEQyg==
X-Received: by 2002:a05:6000:e51:b0:37d:452b:478f with SMTP id ffacd0b85a97d-37d86bb6b99mr2654843f8f.4.1729082515414;
        Wed, 16 Oct 2024 05:41:55 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa8ffd6sm4246879f8f.50.2024.10.16.05.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 05:41:55 -0700 (PDT)
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
	Philipp Stanner <pstanner@redhat.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Jie Wang <jie.wang@intel.com>,
	Tero Kristo <tero.kristo@linux.intel.com>,
	Adam Guerin <adam.guerin@intel.com>,
	Shashank Gupta <shashank.gupta@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Nithin Dabilpuram <ndabilpuram@marvell.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Yedidya Benshimol <yedidya.ben.shimol@intel.com>,
	Breno Leitao <leitao@debian.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
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
Subject: [PATCH v4 07/10] ntb: idt: Replace deprecated PCI functions
Date: Wed, 16 Oct 2024 14:41:29 +0200
Message-ID: <20241016124136.41540-8-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241016124136.41540-1-pstanner@redhat.com>
References: <20241016124136.41540-1-pstanner@redhat.com>
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
pcim_request_all_regions().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Acked-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/ntb/hw/idt/ntb_hw_idt.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/ntb/hw/idt/ntb_hw_idt.c b/drivers/ntb/hw/idt/ntb_hw_idt.c
index 6fc9dfe82474..544d8a4d2af5 100644
--- a/drivers/ntb/hw/idt/ntb_hw_idt.c
+++ b/drivers/ntb/hw/idt/ntb_hw_idt.c
@@ -2671,15 +2671,20 @@ static int idt_init_pci(struct idt_ntb_dev *ndev)
 	 */
 	pci_set_master(pdev);
 
-	/* Request all BARs resources and map BAR0 only */
-	ret = pcim_iomap_regions_request_all(pdev, 1, NTB_NAME);
+	/* Request all BARs resources */
+	ret = pcim_request_all_regions(pdev, NTB_NAME);
 	if (ret != 0) {
 		dev_err(&pdev->dev, "Failed to request resources\n");
 		goto err_clear_master;
 	}
 
-	/* Retrieve virtual address of BAR0 - PCI configuration space */
-	ndev->cfgspc = pcim_iomap_table(pdev)[0];
+	/* ioremap BAR0 - PCI configuration space */
+	ndev->cfgspc = pcim_iomap(pdev, 0, 0);
+	if (!ndev->cfgspc) {
+		dev_err(&pdev->dev, "Failed to ioremap BAR 0\n");
+		ret = -ENOMEM;
+		goto err_clear_master;
+	}
 
 	/* Put the IDT driver data pointer to the PCI-device private pointer */
 	pci_set_drvdata(pdev, ndev);
-- 
2.47.0

