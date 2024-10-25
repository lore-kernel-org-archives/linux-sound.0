Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3593D16BE14
	for <linux-sound@vger.kernel.org>; Fri, 25 Oct 2024 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868444; cv=none; b=GGPK8j7MHyYFVU7by9jIzyFKNjmRn9CObqhCOzcoERTeNfG78Wuy7Bmjeox66lWiQfzFYv8afqeR+Kvss91+dIiov1e3UkW+i2a/I7IsTqOsi6aFXZlv1vcmlu4gRRfp2XwwOt0hvhl9otHCfsxmktTDXRcpSSyeh3sZtdXgbdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868444; c=relaxed/simple;
	bh=pzHm+p7iOQ3ZHeJddCbAsTb72gDaFZfayku/dAdnQvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=riD+UkYbn5C52/32qaHUFagRrImucrqZcgNE19+49eX/Uririzcwyy6N4XDFCOd4apsLliSQlajwV1vGhfObrE+dm2lBzHwbvo6zJ/CZPruDtpEQNG2evxV8fZbLngMa/2PKV7BiJrnE5zRxeepOUwoL+9z/Thr5xPxH0Zf6ous=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XLP6svpu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XLP6svpu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729868440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y8B9LV+ler/WieU+IGPE+8OX97zcf6y+ob4ao9vxZG8=;
	b=XLP6svpuLEDY6bv2P/Ah16NXV8hcuYIhFOciwZLhoUMeCa+QSrXp8SBNfwjNG1/+R0ejIQ
	BcvhfaBz09QRcjIrAHOT9LMdr1GPlIhI6xfidDVnKgfo6VM1GedWnjMFKiaCB9ZFs7i18n
	lLT/urWqTH1RLV2a4ah5WhQeXKAYLxw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-e4Fet2qdOoSTRXn08cTvXg-1; Fri, 25 Oct 2024 11:00:38 -0400
X-MC-Unique: e4Fet2qdOoSTRXn08cTvXg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43151a9ea95so17189325e9.1
        for <linux-sound@vger.kernel.org>; Fri, 25 Oct 2024 08:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868437; x=1730473237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y8B9LV+ler/WieU+IGPE+8OX97zcf6y+ob4ao9vxZG8=;
        b=bAzU4rQ1RjH/+iELWkPpXJclwwt7IJFBYbBLeZSnrp+m/9jXEmU0h/gIbAQa5AwVEm
         JTZrds45wdE9nAczg5aW2aQbXLdkAPNfZ1lwi9AQQllekKBu3KvrHAgt3wHUSPIuZEtO
         Zo7KJrAYFPo/x7WAq6O3BJjI6x0D9EHeKK5d6PI/C70SCcSJ8K9XXkir1Ob3RaX3E4h+
         pxWGCMzN6I+gl3MYp6j68fDZsuG9CITPcmlcLi1TvSUvuFpec49Tarp6YInCgstnFVt+
         BnoWwhEaty+wvV4cgLUr3qHVoB0oANXufvBwIPAYlV93i3GTP8D5WTKxIjTOq2N0WEBY
         rHAw==
X-Forwarded-Encrypted: i=1; AJvYcCVVaOnWifEpXaMxfcYpn8K0PJglHRFSVT1DqcCaKTaK3ubnN7wbEHDuCMCCR4Jqdm9uFKNu2SCrHGqfGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3d46e0PCX2ZJKqiitDKLzZ62c54bVzQtQw3oiYxJ7puqoOyKy
	W/0t2wVEiiG/nmqKQtz0KmyaeKt4MDn9cmsWFeABQ0RKW90ZITo1fn491IM8wxzFeLzP+7UuYBY
	GfRc+jQnAl74MkfPd0SKDuKHvf7xRS3VHqaQbmSUN28Ri71ROOKTd/onknQI9
X-Received: by 2002:a05:6000:d84:b0:37e:eee5:80dc with SMTP id ffacd0b85a97d-3803ac6704fmr4258065f8f.28.1729868437478;
        Fri, 25 Oct 2024 08:00:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0kR0T6tO4HMLrjOiOdPK2NT4nWQw4oUfgmMiDyLMaWTYTtq+bTSQKDKbrlWpwhU7sEMawvQ==
X-Received: by 2002:a05:6000:d84:b0:37e:eee5:80dc with SMTP id ffacd0b85a97d-3803ac6704fmr4257961f8f.28.1729868436829;
        Fri, 25 Oct 2024 08:00:36 -0700 (PDT)
Received: from eisenberg.fritz.box (200116b82de5ba00738ac8dadaac7543.dip.versatel-1u1.de. [2001:16b8:2de5:ba00:738a:c8da:daac:7543])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b9216fsm1727189f8f.100.2024.10.25.08.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:00:36 -0700 (PDT)
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
Subject: [PATCH 01/10] PCI: Make pcim_request_all_regions() a public function
Date: Fri, 25 Oct 2024 16:59:44 +0200
Message-ID: <20241025145959.185373-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025145959.185373-1-pstanner@redhat.com>
References: <20241025145959.185373-1-pstanner@redhat.com>
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
index b133967faef8..2a64da5c91fb 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -939,7 +939,7 @@ static void pcim_release_all_regions(struct pci_dev *pdev)
  * desired, release individual regions with pcim_release_region() or all of
  * them at once with pcim_release_all_regions().
  */
-static int pcim_request_all_regions(struct pci_dev *pdev, const char *name)
+int pcim_request_all_regions(struct pci_dev *pdev, const char *name)
 {
 	int ret;
 	int bar;
@@ -957,6 +957,7 @@ static int pcim_request_all_regions(struct pci_dev *pdev, const char *name)
 
 	return ret;
 }
+EXPORT_SYMBOL(pcim_request_all_regions);
 
 /**
  * pcim_iomap_regions_request_all - Request all BARs and iomap specified ones
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 573b4c4c2be6..3b151c8331e5 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2293,6 +2293,7 @@ static inline void pci_fixup_device(enum pci_fixup_pass pass,
 				    struct pci_dev *dev) { }
 #endif
 
+int pcim_request_all_regions(struct pci_dev *pdev, const char *name);
 void __iomem *pcim_iomap(struct pci_dev *pdev, int bar, unsigned long maxlen);
 void __iomem *pcim_iomap_region(struct pci_dev *pdev, int bar,
 				const char *name);
-- 
2.47.0

