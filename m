Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C810C1EF93E
	for <linux-sound@vger.kernel.org>; Wed, 30 Oct 2024 11:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730287717; cv=none; b=nvGq/gDCNz3/hU8brG5FGoBf8A/wbBHRr11yzc8IJRBwV107K6CGr7FFhBQzvdSg3/zjlgZM1a86keNFIuieP9k5pT6CmgpUNyKy3d5UCKEUeEh1/wjlHbVrohwPeEtMOpgSgUZiVWSSaWv5CWgdLnbPtPNOkL9y/WAzi0mJjRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730287717; c=relaxed/simple;
	bh=RRyy0x2PiBX++bfjCGlA/9AZOm7xwGM5wtpW6IKXyVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r3Ltv+5q20B5tqmrKhnrRMuj1CvBkugc0nQmiHQMOp64g8WqD3R5ApP+GyKGP4jAedsZoAX4/m1XyzoZzrs77m77XcJ4Sylt4NynnvJvpkc1THU6XSIom86tvVvk7ofZFjfUtO5M9//QI7B+zSqV9RpKUYXAla1Y7eVvHjqxreM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GnHqRY7k; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GnHqRY7k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730287711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WxQ5Vib/1yt2THpDXWI2rA9CY+VRhy0DxtAlfuLaLe4=;
	b=GnHqRY7kIMsN4XU++l+g+KWcQQUFWPR4fCGrTRqhg3bMH1wJejV7u6jZjoR+LNKKilDant
	8JALd4gs/t1vvK7cJMm5F4/jStw0xptke2R8UbjDHMoZwD+WeivY2hIrZs3NZdl3em8in9
	Od4LK9PVVNloyjop8qNgzoAwVomNBrU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-WLrfo1iiPbqhhw53u92V9w-1; Wed, 30 Oct 2024 07:28:30 -0400
X-MC-Unique: WLrfo1iiPbqhhw53u92V9w-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a9a0ac0e554so79653566b.1
        for <linux-sound@vger.kernel.org>; Wed, 30 Oct 2024 04:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730287709; x=1730892509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WxQ5Vib/1yt2THpDXWI2rA9CY+VRhy0DxtAlfuLaLe4=;
        b=e5Yz8GgEIcj9pEstey0Z6rwaU1xltSyBADVxVNedH9RDpq+7KN0DjJ+AAVGKpwDlun
         PKu/gsIyT7XUl/4V1/p+T/kJogFvpmlJaGvFotXqstoDUF8mfAFwOMfKAfILesZo0be7
         bGByMRrE/ZU/r17J8UmXSwXrgI+MzpvB1zsa7X+oAXPqAEl6PP28x/kZq85p7uSGTlxE
         vKfSMFcc0XXa2ncgNDTaNwtDkVT5kc7bRAq0AWxKG3FvqKEDU03yOTmEZoVkr8Giewkf
         PhkE+Tcc5ARXaXbcu7ZTLB/zAl77PhN2Hg7RDGtVl2vMtsT+tRocL/hE8qjV9y2ibkFi
         VYsw==
X-Forwarded-Encrypted: i=1; AJvYcCUUrSmf52YcwAJj/GvFuAMFDDXafFIEDT37ahxte6NK5InRgc1XCSSZTR37A4lAUojse9Yy6iyYsLbTRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc0M9DEjqkFqQ1CVJBCPjXEIUM6aj5eqygzeXLybLFN5BC7ovE
	xMW46C8Rq1XEHVV02WSaFZBijven9ZxT66p+wbP/fDdr/MwPa35v7xeuaZOaXI7A9SVNuDAMQZS
	gYquORoR/rCaERf/bZqZhdOvXZTZk5U8nNMXQ10fAeO26CI9zAyJEo19JcoRq
X-Received: by 2002:a17:907:7f8a:b0:a99:fbb6:4972 with SMTP id a640c23a62f3a-a9e2b6333f2mr407079766b.25.1730287708939;
        Wed, 30 Oct 2024 04:28:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFETLfwRScQnX2tbEFkH21PzK0bXXqnKMORp76UY23sUZYI9iNafni9BvKTHyCoXNkZxPgyFg==
X-Received: by 2002:a17:907:7f8a:b0:a99:fbb6:4972 with SMTP id a640c23a62f3a-a9e2b6333f2mr407072266b.25.1730287708339;
        Wed, 30 Oct 2024 04:28:28 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3db7:f800:98bb:372a:45f9:41e4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b30f58991sm557324566b.159.2024.10.30.04.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:28:28 -0700 (PDT)
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
	Philipp Stanner <pstanner@redhat.com>,
	Jie Wang <jie.wang@intel.com>,
	Michal Witwicki <michal.witwicki@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Adam Guerin <adam.guerin@intel.com>,
	Damian Muszynski <damian.muszynski@intel.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Nithin Dabilpuram <ndabilpuram@marvell.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Breno Leitao <leitao@debian.org>,
	Yedidya Benshimol <yedidya.ben.shimol@intel.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>,
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
Subject: [PATCH v6 08/10] serial: rp2: Replace deprecated PCI functions
Date: Wed, 30 Oct 2024 12:27:41 +0100
Message-ID: <20241030112743.104395-9-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241030112743.104395-1-pstanner@redhat.com>
References: <20241030112743.104395-1-pstanner@redhat.com>
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
Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
---
 drivers/tty/serial/rp2.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/rp2.c b/drivers/tty/serial/rp2.c
index 8bab2aedc499..6d99a02dd439 100644
--- a/drivers/tty/serial/rp2.c
+++ b/drivers/tty/serial/rp2.c
@@ -698,7 +698,6 @@ static int rp2_probe(struct pci_dev *pdev,
 	const struct firmware *fw;
 	struct rp2_card *card;
 	struct rp2_uart_port *ports;
-	void __iomem * const *bars;
 	int rc;
 
 	card = devm_kzalloc(&pdev->dev, sizeof(*card), GFP_KERNEL);
@@ -711,13 +710,16 @@ static int rp2_probe(struct pci_dev *pdev,
 	if (rc)
 		return rc;
 
-	rc = pcim_iomap_regions_request_all(pdev, 0x03, DRV_NAME);
+	rc = pcim_request_all_regions(pdev, DRV_NAME);
 	if (rc)
 		return rc;
 
-	bars = pcim_iomap_table(pdev);
-	card->bar0 = bars[0];
-	card->bar1 = bars[1];
+	card->bar0 = pcim_iomap(pdev, 0, 0);
+	if (!card->bar0)
+		return -ENOMEM;
+	card->bar1 = pcim_iomap(pdev, 1, 0);
+	if (!card->bar1)
+		return -ENOMEM;
 	card->pdev = pdev;
 
 	rp2_decode_cap(id, &card->n_ports, &card->smpte);
-- 
2.47.0

