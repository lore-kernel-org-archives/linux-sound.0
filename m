Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BD917DFF2
	for <linux-sound@vger.kernel.org>; Wed,  9 Oct 2024 08:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728463094; cv=none; b=m1oFni4p6m2+Iy2iaYH/q0NpEBvxzce9kwoJKniIiG96knfpV38a2k+1UDQfup5hSoEGIzlW2QsBbK95mB7VEov4z2tQ+s+45zb8MtHZRlZdc36k8NWZRZ7wmw240DfCbXgklfrI3YZLmV/W+wR2QU3u3CHVmksZWoEwVOSN9AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728463094; c=relaxed/simple;
	bh=WtIqqb3Qz76cjqi0EoDty0yZzRmnvQrkK4n/LtQ6xEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z+qNfJ4IzLmwC42EqhPuL9yCW0YjRlufDPu4GduAfXyedbxu7iMWR4uoLF3jeOGsLSehwHAjEA9qNne8MgLpezuhQDZfiTSm6Qf6H9MGmizgq2kvIYNhQt73k/KxCYljAiyk9GjO8C+s2Z2JJ5OMrFRBiebMCJu+URsz1/JO8qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bz6g2jtM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bz6g2jtM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728463092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=whIiuNRJJmYlfQ3wiaGZ/HmATem6GNPoxo7pUmmbAqQ=;
	b=Bz6g2jtMcXJ35p1DBRCmU+vHVfDIx21l8GhMaNcfvqZnKjJOkcqnTegv+C0dclJFjMYyt0
	218CqExSDlE98E2qUhFYk/qY28u4iXVhj2dWchIu8lJFW4Kw0CB//DYVrEMwmcedRcsojA
	yA+GaUSgX9KvP/DiWg9m87GIzUWhTbc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-8_Wl0uYDP3ehhMTPiOXLNg-1; Wed, 09 Oct 2024 04:38:11 -0400
X-MC-Unique: 8_Wl0uYDP3ehhMTPiOXLNg-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b10e7958c6so78220085a.2
        for <linux-sound@vger.kernel.org>; Wed, 09 Oct 2024 01:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728463091; x=1729067891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whIiuNRJJmYlfQ3wiaGZ/HmATem6GNPoxo7pUmmbAqQ=;
        b=BwiS+14CuB6IoGUmPp+yzWW9JSetjJg1eLPmS56rPxAkCkBeaJSWBsM7DwsAttbC2C
         WUuy8WWDegn9gEBzHlm5zFzJ9nvQWifIzP4ZC7305k+8Rze0/9zYci0+gs1/QX2tHtKS
         THmpCof/hbWISPv1ZYEFLudoudBDVaUa5egJKD+WXBhGHrcgztTACDrqYTqWTMFW415t
         lgNLrUSp4oTgrrkkSu3RseBwOaAs0ujN55A1tXAWenK7SValKhK7O7j6KBVhsw6Y2IXZ
         rF9J4Rl5eQ/dTqvZqJWEGOdHtIfozz8Mbk1Tk7MyLMcsYe+EVW6CX2/JVCB9qmW46v0z
         94KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZP0jP5ak7lFH5lTWcfUMArE3b8/X4gxFE5clDZn0fE4xAVW1rIr/UX3Hquf7pzhkReKrzIOv3sRYEIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwhg3hGoYlY9k3xqMrGgg1wCpZ4++vYt4NtAnXqy2T+XiUkNL+
	6V06HdxjrTc8UJj3j2FOfitnPdlgIfIw+wucI2oHprIjuX5y2YIhSdhxpP/svUq9DjDNd46HkLI
	DLyPMHe8S48WMt8hYycN9p/4twsd0tWUU+GcGKeGUht3bR5f0xSn4l4V9ndBI
X-Received: by 2002:a05:620a:6006:b0:7a9:ab72:7374 with SMTP id af79cd13be357-7b10ed4fff8mr102278485a.35.1728463090663;
        Wed, 09 Oct 2024 01:38:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/MgCEUv0CJEAIc6rr0qvcu86NTMXEfUgLL+h2hiKBHzQb8C5W8ydxW51ghGpiTPgzdZQtmw==
X-Received: by 2002:a05:620a:6006:b0:7a9:ab72:7374 with SMTP id af79cd13be357-7b10ed4fff8mr102275485a.35.1728463090297;
        Wed, 09 Oct 2024 01:38:10 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae75615aa2sm439643585a.14.2024.10.09.01.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 01:38:10 -0700 (PDT)
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
Subject: [RFC PATCH 10/13] staging: rts5280: Use always-managed version of pci_intx()
Date: Wed,  9 Oct 2024 10:35:16 +0200
Message-ID: <20241009083519.10088-11-pstanner@redhat.com>
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

rts5208 enables its PCI-Device with pcim_enable_device(). Thus, it needs the
always-managed version.

Replace pci_intx() with pcim_intx().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/staging/rts5208/rtsx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rts5208/rtsx.c b/drivers/staging/rts5208/rtsx.c
index c4f54c311d05..4831eb035bf7 100644
--- a/drivers/staging/rts5208/rtsx.c
+++ b/drivers/staging/rts5208/rtsx.c
@@ -246,7 +246,7 @@ static int rtsx_acquire_irq(struct rtsx_dev *dev)
 	}
 
 	dev->irq = dev->pci->irq;
-	pci_intx(dev->pci, !chip->msi_en);
+	pcim_intx(dev->pci, !chip->msi_en);
 
 	return 0;
 }
-- 
2.46.1

