Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DFC18D640
	for <linux-sound@vger.kernel.org>; Wed,  9 Oct 2024 08:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728463049; cv=none; b=N5j/VhdAdaWRmUCw5XOTrqfd5RRKLdWM6DtQhLNdIMq1FvXr06NrO/BI8lEGcAgvVxQjKmq0WAL0iIXbunCpGnD0udYhSwyMZK3pxxxj5PLTWFZdEhVaLIm1IZkJYNIaUydWaL2JT9A5PkP3ltzKg7Aur1UJaq4YFhLabdIEqWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728463049; c=relaxed/simple;
	bh=Q3eFd3k4APy5f74oOu2AfX19IhHLwjoIJ+ui5cmZ70c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qi7vUbexVMTGPu3f2bNLaBpF46kpAeBNjt3/XfVhLcsVePRXOJB10dZ+bpG1M7fh1XoDm9JB03vtWSxynnYR5gOT1CkbSDK/DpH+1uYAWFF59dl5UozlRvPM7brxHl+5LfVpAQPNr+tH/tir4qUctd7JNgIyFevWLVPnkqceDQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SqNsd+X5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SqNsd+X5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728463046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gnue2+gdLv6DtZCMne1e2l6o8jQm3Jw9vQelKyozb04=;
	b=SqNsd+X5GSfZ3eVDWRgyG5Qces3Q9DHLfushkqayZ97xOINfDlYVyh/TjrE/CmB47a8waW
	p7nevP0KhQaNgX1OoPD8Vwsm6idSMLPA2yIWBLATKay9XsW5Eywtp6DEWXkT7t402M3qt9
	f/5zN3r6lag2WEFID5px+6xw/RPnxwU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-fU9R7dzAOaeAhvckKucFDw-1; Wed, 09 Oct 2024 04:37:25 -0400
X-MC-Unique: fU9R7dzAOaeAhvckKucFDw-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7acdd745756so1285304485a.3
        for <linux-sound@vger.kernel.org>; Wed, 09 Oct 2024 01:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728463045; x=1729067845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gnue2+gdLv6DtZCMne1e2l6o8jQm3Jw9vQelKyozb04=;
        b=mBvryYZoltBX4diUP5LB3s2VF+8nuHSMHpVl/MAJohmOnPIg64OaiXRVE18eg6PhNa
         qqO8m6LAzpuuHrW7EBoKON2t3iIkFKGQ9s0x4tU8ttePyaEdTBuu2Bw2L3kiWL/TH6JP
         tNsMb4DHgxkyzytmta1jm01q6VcNEUjdDB3d74wlrVZoSSB2UzHVmyH4bxBuJ2xrohMO
         DBlQQ0xa/OLlehUAx9vTrf6mgu6IgDtda308Le32UiWzxJOdagKaWsT6hKVU3naHr3Q7
         6pO/FIA3F7VFUBmlEKl+u3J+H+4X0t1jcj4BLBcl1ShQYCVIX/E2z7Vlr+S2/GSdUl3j
         TsVA==
X-Forwarded-Encrypted: i=1; AJvYcCVJRxo5ChnLOj9t9CzEKX9Ph/wqqm/oB+v3CnO/FvzTxkg420w9xo9LQB4e/e2g8kbitDD0vhtR1bXBPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzatrvGohsoPT0BxYpai9KMRCZy/z5KNZ/FFb95U1LfJ08OSCOm
	DkI/niPBLcnh9PyQ1vfj1K5+5wNmgWz7fbQp/ze6HeYO5Pf77r2Ps+WDiQ9du0OJJCcyUrT9zgT
	zYoOQDJQfzU2Gi1AF0omSpnz+5RpVkNnJLGxRLYuZGuZsMemNEjDuNJVft5cP
X-Received: by 2002:a05:620a:1a8e:b0:7a9:8679:993 with SMTP id af79cd13be357-7b07952776bmr283211685a.13.1728463044967;
        Wed, 09 Oct 2024 01:37:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8iMtbRuVOzUsf8z3rLAbJgY7Sw8kyfd9EYZaEc1PG6rkZnmlQM8I/F6cPMCjVwViEvjtORQ==
X-Received: by 2002:a05:620a:1a8e:b0:7a9:8679:993 with SMTP id af79cd13be357-7b07952776bmr283201785a.13.1728463044398;
        Wed, 09 Oct 2024 01:37:24 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae75615aa2sm439643585a.14.2024.10.09.01.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 01:37:24 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Dubov <oakad@yahoo.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rasesh Mody <rmody@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Igor Mitsyanko <imitsyanko@quantenna.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Ricky Wu <ricky_wu@realtek.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Breno Leitao <leitao@debian.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mostafa Saleh <smostafa@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hannes Reinecke <hare@suse.de>,
	John Garry <john.g.garry@oracle.com>,
	Soumya Negi <soumya.negi97@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Yi Liu <yi.l.liu@intel.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Christian Brauner <brauner@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Eric Auger <eric.auger@redhat.com>,
	Ye Bin <yebin10@huawei.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Rui Salvaterra <rsalvaterra@gmail.com>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ntb@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-staging@lists.linux.dev,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-sound@vger.kernel.org
Subject: [RFC PATCH 05/13] net/ntb: Use never-managed version of pci_intx()
Date: Wed,  9 Oct 2024 10:35:11 +0200
Message-ID: <20241009083519.10088-6-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241009083519.10088-1-pstanner@redhat.com>
References: <20241009083519.10088-1-pstanner@redhat.com>
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

pci_intx() is a hybrid function which can sometimes be managed through
devres. To remove this hybrid nature from pci_intx(), it is necessary to
port users to either an always-managed or a never-managed version.

hw/amd and how/intel enable their PCI-Device with pci_enable_device().
Thus, they need the never-managed version.

Replace pci_intx() with pci_intx_unmanaged().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/ntb/hw/amd/ntb_hw_amd.c    | 4 ++--
 drivers/ntb/hw/intel/ntb_hw_gen1.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ntb/hw/amd/ntb_hw_amd.c b/drivers/ntb/hw/amd/ntb_hw_amd.c
index d687e8c2cc78..b146f170e839 100644
--- a/drivers/ntb/hw/amd/ntb_hw_amd.c
+++ b/drivers/ntb/hw/amd/ntb_hw_amd.c
@@ -791,7 +791,7 @@ static int ndev_init_isr(struct amd_ntb_dev *ndev,
 err_msi_enable:
 
 	/* Try to set up intx irq */
-	pci_intx(pdev, 1);
+	pci_intx_unmanaged(pdev, 1);
 
 	rc = request_irq(pdev->irq, ndev_irq_isr, IRQF_SHARED,
 			 "ndev_irq_isr", ndev);
@@ -831,7 +831,7 @@ static void ndev_deinit_isr(struct amd_ntb_dev *ndev)
 		if (pci_dev_msi_enabled(pdev))
 			pci_disable_msi(pdev);
 		else
-			pci_intx(pdev, 0);
+			pci_intx_unmanaged(pdev, 0);
 	}
 }
 
diff --git a/drivers/ntb/hw/intel/ntb_hw_gen1.c b/drivers/ntb/hw/intel/ntb_hw_gen1.c
index 079b8cd79785..9ad9d7fe227e 100644
--- a/drivers/ntb/hw/intel/ntb_hw_gen1.c
+++ b/drivers/ntb/hw/intel/ntb_hw_gen1.c
@@ -445,7 +445,7 @@ int ndev_init_isr(struct intel_ntb_dev *ndev,
 
 	/* Try to set up intx irq */
 
-	pci_intx(pdev, 1);
+	pci_intx_unmanaged(pdev, 1);
 
 	rc = request_irq(pdev->irq, ndev_irq_isr, IRQF_SHARED,
 			 "ndev_irq_isr", ndev);
-- 
2.46.1

