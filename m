Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467E614F9D6
	for <linux-sound@vger.kernel.org>; Mon,  5 Aug 2024 08:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722844934; cv=none; b=VJeOFfETSrQmyuy+gl+WQ1nor4QunMlZTO9hkLdU8kHPcTpcH6dmVK+fW1ng3qOVM+sL5bbrE0T/ba1chct6OeKlZuzBzGHIxsrxVYyJ4R1AhKMa9CBVFHCFNN5aaxPxhGZdnFqxm2snknWYH6LNAfLP/PN81YnMi6Tlyz+nW1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722844934; c=relaxed/simple;
	bh=PMvC17bGpWpI73UNcLQbu72jMyBfAq60m2YMRm7gpdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rt0tavuGos2DtgMkMkZLEtX40ZpkEhyT65ssQytK8ZaFVU6gFLzZVPvBGjUcO49e2om07O+SgqXRCsZIdHzKoZlwGjOBziX2LMynKQb6fAMlhgllKbFmCQrdK7Vo5tZIlPZLQNPlV1CbiqKBGx0BlCxAt79IKNcq33OOLhLTWD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LCXEmK6g; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LCXEmK6g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722844930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fCKgXS8g88Bg2YGymWSAuOupDyZ6pDfS4Oy1WWS2It4=;
	b=LCXEmK6ghy3eN4WmGm3dJC5sMq8r3eiAQJX3bGPRKpVZhqWVfhMthfED/lGqLqWRZBqbHj
	6zx+/K2oMj1YPbwUvBx35LPkDV+GU9tBcI3XAc4MOn6sgX38CLUZQgBb6p6j7lGsuLd7p+
	vbz7I02psJWGvBhOK3WmSkJg3Y0rObI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-CZe31u8FPaeycCEoJRwqXQ-1; Mon, 05 Aug 2024 04:02:07 -0400
X-MC-Unique: CZe31u8FPaeycCEoJRwqXQ-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5a0e93ebc78so1527672a12.3
        for <linux-sound@vger.kernel.org>; Mon, 05 Aug 2024 01:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722844925; x=1723449725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fCKgXS8g88Bg2YGymWSAuOupDyZ6pDfS4Oy1WWS2It4=;
        b=OC640llllOYnf2gutZptpLoaIcsRRvoVC5kmi5f6mIU+8Fod6xUOJbLD1cvuo7L592
         441Up37hrXxZ4Y38pguDSx7TTZTGzDg9RKf+1LS6E41K3BvKK6PQIoZpk6Rdwm4/bbU+
         NctsVRbKDKgrOufh+mlhqUMnzUUPOqMnnRCDndmVTIecytmlflTnnu9lIHPodrEVZgjf
         cm684GaObzNT5sNjWhcJRYZ8c+zt37+c+vUf5VFauf7p2mbRHkCEjaDzm4CzL31LIklT
         Gmpw3U28sT682VBWcr+fDBcBz/Keq0fquhQgBq4FbeNCvHgmLMq5S2JW04jmFBamzfIw
         KGqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM1aHz28F6PkMa/cRssP7MVOpCb5MuKAL6y916miKtsDcFKdv2WTG0sM3BoAx6ls7LUWdZgqMOAUjM7zQQ/VO8/5vulI90M3ZuWF4=
X-Gm-Message-State: AOJu0YzEbAU4biBK9yJQ7YRe6XYF45uvHJaneQBiKpoxDUGdXgR7zkN5
	lgnPaep89rP7darsur0G9qaHnUWJsvLmUHD64NF6i+q3reZvM/m80z0qOH6tQFkpu5870/c3Km5
	uwnMglGHxjg8iKWvETxhfy+/b2OLsMVO708mVFU/tqOPwOgIUReCIgm/itMEn
X-Received: by 2002:a17:906:cac7:b0:a7a:ab8a:38b with SMTP id a640c23a62f3a-a7dc50a036emr405426566b.7.1722844925251;
        Mon, 05 Aug 2024 01:02:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8B0uAdpCjmN8RXKqb6GrkT9cJblAYXyonWs0YpjO3v6slHT4MqkSoaoDsG7XIcg/iI+6TwA==
X-Received: by 2002:a17:906:cac7:b0:a7a:ab8a:38b with SMTP id a640c23a62f3a-a7dc50a036emr405424666b.7.1722844924726;
        Mon, 05 Aug 2024 01:02:04 -0700 (PDT)
Received: from eisenberg.fritz.box (200116b82df07e000a5f4891a3b0b190.dip.versatel-1u1.de. [2001:16b8:2df0:7e00:a5f:4891:a3b0:b190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7de8d0868bsm277958966b.143.2024.08.05.01.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 01:02:04 -0700 (PDT)
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
Subject: [PATCH v2 01/10] PCI: Make pcim_request_all_regions() a public function
Date: Mon,  5 Aug 2024 10:01:28 +0200
Message-ID: <20240805080150.9739-3-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240805080150.9739-2-pstanner@redhat.com>
References: <20240805080150.9739-2-pstanner@redhat.com>
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

In order to remove the deprecated function
pcim_iomap_regions_request_all(), a few drivers need an interface to
request all BARs a PCI-Device offers.

Make pcim_request_all_regions() a public interface.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/pci/devres.c | 3 ++-
 include/linux/pci.h  | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 3780a9f9ec00..0ec2b23e6cac 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -932,7 +932,7 @@ static void pcim_release_all_regions(struct pci_dev *pdev)
  * desired, release individual regions with pcim_release_region() or all of
  * them at once with pcim_release_all_regions().
  */
-static int pcim_request_all_regions(struct pci_dev *pdev, const char *name)
+int pcim_request_all_regions(struct pci_dev *pdev, const char *name)
 {
 	int ret;
 	int bar;
@@ -950,6 +950,7 @@ static int pcim_request_all_regions(struct pci_dev *pdev, const char *name)
 
 	return ret;
 }
+EXPORT_SYMBOL(pcim_request_all_regions);
 
 /**
  * pcim_iomap_regions_request_all - Request all BARs and iomap specified ones
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 4cf89a4b4cbc..5b5856ba63e1 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2289,6 +2289,7 @@ static inline void pci_fixup_device(enum pci_fixup_pass pass,
 				    struct pci_dev *dev) { }
 #endif
 
+int pcim_request_all_regions(struct pci_dev *pdev, const char *name);
 void __iomem *pcim_iomap(struct pci_dev *pdev, int bar, unsigned long maxlen);
 void pcim_iounmap(struct pci_dev *pdev, void __iomem *addr);
 void __iomem * const *pcim_iomap_table(struct pci_dev *pdev);
-- 
2.45.2

