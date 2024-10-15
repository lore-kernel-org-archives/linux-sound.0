Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00811FF034
	for <linux-sound@vger.kernel.org>; Tue, 15 Oct 2024 18:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729018328; cv=none; b=EUeCzkH9zc2gXqJBke4grheGv0ZgDFkPF9p8l98D2m2IzemBPd5s1/f3vE7kcrFptrMRwSLMK8nrhqI9ejHaXWUGv0uy2yFBE0i3rWg7IOwBu9ZmnwoT6DgoQ1Zspr2ROVu15e4ufhXG7hEN2zAd488g3KpH9j8uihg941Kfm90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729018328; c=relaxed/simple;
	bh=pl7sVd3EkZjYz8a4hu3qyOtH7RHbVGi7fS/efUFEh0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qOUQ6Yj3PHeMY00aKXCAOV1E8AWcxL2LWIYt//pGBIavWaDYe6NgoJdabkdOpFGxGxjKM1uNiHkcuTOEeSI1ph9Bn1MjFIcKjuPVAoVOKBoBGeleLyw1Kc/9o6i98CDT9LcoZfbdDhx5gk5DsGF51MhaojtpceZh+YuaGZCNOKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=euys1lBa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="euys1lBa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729018323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i/tiT1oHv++iZFY5S8iNVJ0nRwrLe5bjQFEltGuWg0g=;
	b=euys1lBaWimYuPsd3pATiacwxgC2qFxyGWDsXYK/V38esHI/+7PjfaXSTb7XaAEbI9KxZN
	cdAEcHKYEjlvVvGtB1y8DCMogi4vPBwZaCQnZSLVJJ6WJkpxFFXJPNz6xW7+96ZHgLjdfq
	yIV9P30GjV6yFEZWOXEXWkZK/bTeKQ8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-Vfil8beCP9y9k04cZGrQiA-1; Tue, 15 Oct 2024 14:52:02 -0400
X-MC-Unique: Vfil8beCP9y9k04cZGrQiA-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5c934295846so4337980a12.1
        for <linux-sound@vger.kernel.org>; Tue, 15 Oct 2024 11:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018321; x=1729623121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i/tiT1oHv++iZFY5S8iNVJ0nRwrLe5bjQFEltGuWg0g=;
        b=u6NsTyGxBnMTmoCR8Z/XE23w5X25kDLNRMuosZ6F4ugQ0j4AmkQaUxYteST5fc1K9n
         WuHnCxK+vYiA5G5lGTBXE7NGbe3XPm8gmv2oU18ZoxVe7m+yS7YXWbDsKYmTr6aVZ4r3
         vEf3Xa675Idi8RiTYBWotYiVCGoQO2NUYbQhsJ1AalMdRUhK+Quo2rVADzwqmisK0wpS
         ds8xlXa4Mtqm86clPLxjZy997oeANPzwf353gyJ+zIrANkm3alMQucAvIFiIaWVmGSyR
         arGnM8j0CsNSgRJvrkyf/KSOBi6RPazMUY7bWdm/46PNNfy3vHJnWxqJkeji1vGe9bTP
         M6pA==
X-Forwarded-Encrypted: i=1; AJvYcCXTdqFOsNXMbyCRtzwuFRGg0rClN5RcuGnYlx0z4GLmh+rsEpEyVJnmVHJvp63usA9ZhLtDyBPpU4Q8Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyP829ytUxKltXya4F4nI+Rm86lwmPRY+9sv868CvlYGE5nbdwi
	5ETySFS1DaY8dk8+jKBtN3q69UBKDOXaD4XW80I1Y9sbC0lRFyGjQATErK81mAyK2XO4+s6N1Pg
	88W1D/V7xUP+odyvzJd5J9+ZJSh7oZCKSDZWwQW9LYjqlGYm4VUluuNLSBX97
X-Received: by 2002:a05:6402:42ca:b0:5c9:8584:12ae with SMTP id 4fb4d7f45d1cf-5c9858414famr4855327a12.29.1729018320677;
        Tue, 15 Oct 2024 11:52:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNUSaZzJFpcnbAyxu8SUqVbgRkCBc+0eZafkjjXXKs5iCySMs2In3PqmEp1mZm07oblnaLMw==
X-Received: by 2002:a05:6402:42ca:b0:5c9:8584:12ae with SMTP id 4fb4d7f45d1cf-5c9858414famr4855284a12.29.1729018320158;
        Tue, 15 Oct 2024 11:52:00 -0700 (PDT)
Received: from eisenberg.fritz.box (200116b82d5d5a0006e2615320d1d4db.dip.versatel-1u1.de. [2001:16b8:2d5d:5a00:6e2:6153:20d1:d4db])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d39a9a2sm974438a12.0.2024.10.15.11.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:51:58 -0700 (PDT)
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
	Chen Ni <nichen@iscas.ac.cn>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Ricky Wu <ricky_wu@realtek.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Breno Leitao <leitao@debian.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mostafa Saleh <smostafa@google.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Yi Liu <yi.l.liu@intel.com>,
	Christian Brauner <brauner@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Eric Auger <eric.auger@redhat.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Ye Bin <yebin10@huawei.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Rui Salvaterra <rsalvaterra@gmail.com>
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ntb@lists.linux.dev,
	linux-pci@vger.kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 06/13] misc: Use never-managed version of pci_intx()
Date: Tue, 15 Oct 2024 20:51:16 +0200
Message-ID: <20241015185124.64726-7-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241015185124.64726-1-pstanner@redhat.com>
References: <20241015185124.64726-1-pstanner@redhat.com>
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

cardreader/rtsx_pcr.c and tifm_7xx1.c enable their PCI-Device with
pci_enable_device(). Thus, they need the never-managed version.

Replace pci_intx() with pci_intx_unmanaged().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/misc/cardreader/rtsx_pcr.c | 2 +-
 drivers/misc/tifm_7xx1.c           | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/cardreader/rtsx_pcr.c b/drivers/misc/cardreader/rtsx_pcr.c
index be3d4e0e50cc..e25e6d560dd7 100644
--- a/drivers/misc/cardreader/rtsx_pcr.c
+++ b/drivers/misc/cardreader/rtsx_pcr.c
@@ -1057,7 +1057,7 @@ static int rtsx_pci_acquire_irq(struct rtsx_pcr *pcr)
 	}
 
 	pcr->irq = pcr->pci->irq;
-	pci_intx(pcr->pci, !pcr->msi_en);
+	pci_intx_unmanaged(pcr->pci, !pcr->msi_en);
 
 	return 0;
 }
diff --git a/drivers/misc/tifm_7xx1.c b/drivers/misc/tifm_7xx1.c
index 1d54680d6ed2..5f9c7ccae8d2 100644
--- a/drivers/misc/tifm_7xx1.c
+++ b/drivers/misc/tifm_7xx1.c
@@ -327,7 +327,7 @@ static int tifm_7xx1_probe(struct pci_dev *dev,
 		goto err_out;
 	}
 
-	pci_intx(dev, 1);
+	pci_intx_unmanaged(dev, 1);
 
 	fm = tifm_alloc_adapter(dev->device == PCI_DEVICE_ID_TI_XX21_XX11_FM
 				? 4 : 2, &dev->dev);
@@ -368,7 +368,7 @@ static int tifm_7xx1_probe(struct pci_dev *dev,
 err_out_free:
 	tifm_free_adapter(fm);
 err_out_int:
-	pci_intx(dev, 0);
+	pci_intx_unmanaged(dev, 0);
 	pci_release_regions(dev);
 err_out:
 	if (!pci_dev_busy)
@@ -392,7 +392,7 @@ static void tifm_7xx1_remove(struct pci_dev *dev)
 		tifm_7xx1_sock_power_off(tifm_7xx1_sock_addr(fm->addr, cnt));
 
 	iounmap(fm->addr);
-	pci_intx(dev, 0);
+	pci_intx_unmanaged(dev, 0);
 	pci_release_regions(dev);
 
 	pci_disable_device(dev);
-- 
2.47.0

