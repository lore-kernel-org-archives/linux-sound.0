Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594A31F8182
	for <linux-sound@vger.kernel.org>; Tue, 15 Oct 2024 18:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729018313; cv=none; b=fzvZi99B0R08TsKYVH8OWIeqLRC2GdRtCWuwU+xENO97n2VImDFvB4/4wm81bmXKYTP0my59R2CS+/Z3gR4/1XLXXDiJIwh4vroJ8Oh7DGLjj91cdBVbYwBGI9+fBKPGWzftTpYbDfqi+OL6qr1hoBkg2f4Th59Iz1qpzfI6PaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729018313; c=relaxed/simple;
	bh=KHLKi60pv4gLVTsiuJyXLJXAzGodCYBvpuQkjf82Rd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nAEDffF0h2/wrxLzPwyzzQToFvUEeJTvkq90aAG2eCHmHBfSDp1HGvudO9dweMsf1DsAP0MCDdXb/ku68m+8pcSMNaVQDIfQ2a0dHJrCpFgjI5aiwyWSS5+johTPtjJRBu7l8sb2MpplXxc7VK80EakWk+3j7xCLdvHDMJh2k/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VR8nn9yC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VR8nn9yC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729018311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3bl3QB30NLAEEM3JzJm3v9Fl/AaPLWrckmhbzUoxAcY=;
	b=VR8nn9yCxW/vftARwUNvG63Kl3nakqo3oX/nXm4a+E42+EDIndWVbpsf6kWekOqTSs2IdO
	clKAieWCDgs8WArHXRcehQfEx6EepP/+byB5Zg0m3mdWBJLZt67E/YsRGfONSqz3Vyd1A/
	OVkzgFDBRddSBdbA1EGLmPN0GiTJg2M=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-5M0cU6b5OBOnPYCX0UdCxQ-1; Tue, 15 Oct 2024 14:51:48 -0400
X-MC-Unique: 5M0cU6b5OBOnPYCX0UdCxQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5c9217064f6so4369887a12.3
        for <linux-sound@vger.kernel.org>; Tue, 15 Oct 2024 11:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018307; x=1729623107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3bl3QB30NLAEEM3JzJm3v9Fl/AaPLWrckmhbzUoxAcY=;
        b=QpwqV9cn4uuVOQdOISiFQe/Bo2UHPZh4TzWlzFe1pEPYK0Gba+T+B4tIDpQLI3hAAn
         rNcHg0FvkHmQb4g4P92mPB0GXi4IB1MDTiW6O52ROBq+9uwO1/N0rllVU7Y3xvoPGoWM
         2Ria8gCsNl+KgwmH0Fsc0dm9LFpZOgItBQhUkE+mWO77AikvN1eagodFNy5CL++/frFl
         0S1SOHJKMR95ZtZQcl4isX6ldTFIeKKG3f6sxekCObS/eePY5SW7F1H0air9Pnk1bdhd
         EiMwUNAqvtuuPL/3PCJclAzlS8krVnVPVOKBUNN+p520GC87SBZ5eRVwOn5A1jkAFIYp
         weVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYrVqLDnD5Sq9WuKLb7a8g6l34pXuZ3PZ9sPIyFb+FW4xXQVOysSPE/k0ylL5bwlF4GXujRgIPtF2dOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSOfDvPIlyUom5Z29UeYwbqjodXqNS0OehUyJiLxymiWqNA0Y8
	o2ZK3u8lhc9Qowm+0I0dMK8DnCEV4TCmoemLV0qcsnHmvd5H2vEISMKwC1FyKdioupG3hia0o9M
	bvAYR2pmhBUCieRKHUn7LXkkGWOcznR9RtxRC1RfXsL3MwWPVWXy8FpEollYt
X-Received: by 2002:a05:6402:274b:b0:5c9:758c:307d with SMTP id 4fb4d7f45d1cf-5c995123e65mr1042691a12.34.1729018307270;
        Tue, 15 Oct 2024 11:51:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcpsVUn9n0QaeMUMW5c7DLX/r1R+cfZY7789CvnHFdFGuHG3lQrtgeZ9VzucvxMpAlT7QteA==
X-Received: by 2002:a05:6402:274b:b0:5c9:758c:307d with SMTP id 4fb4d7f45d1cf-5c995123e65mr1042656a12.34.1729018306780;
        Tue, 15 Oct 2024 11:51:46 -0700 (PDT)
Received: from eisenberg.fritz.box (200116b82d5d5a0006e2615320d1d4db.dip.versatel-1u1.de. [2001:16b8:2d5d:5a00:6e2:6153:20d1:d4db])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d39a9a2sm974438a12.0.2024.10.15.11.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:51:46 -0700 (PDT)
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
Subject: [PATCH 02/13] ALSA: hda_intel: Use always-managed version of pcim_intx()
Date: Tue, 15 Oct 2024 20:51:12 +0200
Message-ID: <20241015185124.64726-3-pstanner@redhat.com>
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

hda_intel enables its PCI-Device with pcim_enable_device(). Thus, it needs
the always-managed version.

Replace pci_intx() with pcim_intx().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 sound/pci/hda/hda_intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index b4540c5cd2a6..b44ca7b6e54f 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -786,7 +786,7 @@ static int azx_acquire_irq(struct azx *chip, int do_disconnect)
 	}
 	bus->irq = chip->pci->irq;
 	chip->card->sync_irq = bus->irq;
-	pci_intx(chip->pci, !chip->msi);
+	pcim_intx(chip->pci, !chip->msi);
 	return 0;
 }
 
-- 
2.47.0

