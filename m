Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A7F1BC9EE
	for <linux-sound@vger.kernel.org>; Thu,  1 Aug 2024 17:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722534402; cv=none; b=jzD+FPifNgNKDiG5yQsDh2a/9LsO6ZNxPMj72arkT0Bznn7/4oCkQNLb8PDcba6T4rsJAN1teoyd6IuikIQvL1hlYSoN9VQmw821j0ezdJBi+ZUra0yAe7toMBYE3S9gaqc0WtMU/RUvYuIJl+whBTYD4XawXG7T5sGBN2OZfS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722534402; c=relaxed/simple;
	bh=T/Lr5R3ZpRsNgk4LNzf4i3JOmIq6wzNv8zvkRdHooAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YgACu7w35FHRJ8XK05XJF8yWp/fb0alRZqzyn74TsEJW/CBIdrt6rEj2DtGBbB0RcJ+6qQeiPJwufesWoffqK6aZEXuJKN58vR/0f+QYoo1PENnlPPnlojoHKUWsNPkqouVbr0z6UjpIWH9x3ZklwN36pO4Wufsp3oiPd0wX2HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eHSMwgXA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eHSMwgXA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722534397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VIcu667vSRZRiKEHakO3GAIgbzPtgHQvNS3his8mZEo=;
	b=eHSMwgXAhl2o18giTIxrHdD5TpWmAUVqdx+vsEzOwujreV3OmGBaqcuek0wpR2mqs3blbj
	NolMy7C5w8N2UDO+lCa2ZdLekcA/M2S/XiJAzBWrXFLIU6xu93BlZNWyzv4b+P+EAbnS4x
	DHBW7NhG5Hz94y7eBmcou5YWH5LNWfE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-3mu_5GSyOnyZVVgh6_nBRw-1; Thu, 01 Aug 2024 13:46:36 -0400
X-MC-Unique: 3mu_5GSyOnyZVVgh6_nBRw-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5a121cd4d27so965100a12.1
        for <linux-sound@vger.kernel.org>; Thu, 01 Aug 2024 10:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722534395; x=1723139195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIcu667vSRZRiKEHakO3GAIgbzPtgHQvNS3his8mZEo=;
        b=iAHFtDBT5UrrJl3+Ui75d0vs4edawmPgVwubmN3f9IcdT4ZYoe4P2nU+/6n3QlLdad
         pnDQKa8Vix23wmwED4ep/N7SUikpTkYRAv/bVNZts3rO8lNRJJ4k1FCNxQhNahw5Szhj
         W/+36KM2AQOwl0Uoo+i8CcdvxOMHTKkIOt8Fen1Z2QSVSHaNBHhtL4K9E1pragshspLE
         5zKwxPS5m8qoOoasP/P/BaO0nM6vG4rCC7xlPUGcFHuVJVfiD55FwZa6S5ySDxDeerJt
         SUrkkA9DfH/ckcUUbqKbOT6sCI+SjV6V5sKEL/6XSnb0VJ2pPZHxiutfd6qA/niqJx0E
         rl3A==
X-Forwarded-Encrypted: i=1; AJvYcCXNzSQE+lg8fpmaSAmO10bZEkL40TqFPY18RV/7KO1Bs+IWJXvdI+7nDymS3VlUTbWlaZkcQPnLQnF6Fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxM6coTlWE9U7G1EO0hl/POG0ntcOlhNCqTg7ldx3tGFFIKFZcR
	Lu0VccqHnqQTl1OLMcTONNXXCO4/OyiQ/ffKUHS2oYG6p2tsp8XJzaL4cKaIAq6KqpQiogJgBgO
	sivGKqGPIGZlWjJmnHyo4DNBP4YFXHDwL8lag4fcINdo5VuvVljYfaqorYqBP
X-Received: by 2002:a17:907:2d21:b0:a7a:9f0f:ab1b with SMTP id a640c23a62f3a-a7dc509f24fmr31652466b.7.1722534395624;
        Thu, 01 Aug 2024 10:46:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHsAm8ay3YLV5X2CKZi8aqVdjkY/Zte8gQFe54oKpkGHtEojyFbBE+V0V3Lk+EwhBeWW6VAw==
X-Received: by 2002:a17:907:2d21:b0:a7a:9f0f:ab1b with SMTP id a640c23a62f3a-a7dc509f24fmr31648666b.7.1722534395021;
        Thu, 01 Aug 2024 10:46:35 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3d4b:3000:1a1d:18ca:1d82:9859])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e83848sm5339066b.177.2024.08.01.10.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 10:46:34 -0700 (PDT)
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
Subject: [PATCH 05/10] intel_th: pci: Replace deprecated PCI functions
Date: Thu,  1 Aug 2024 19:46:03 +0200
Message-ID: <20240801174608.50592-6-pstanner@redhat.com>
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
 drivers/hwtracing/intel_th/pci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/intel_th/pci.c b/drivers/hwtracing/intel_th/pci.c
index 0d7b9839e5b6..e9d8d28e055f 100644
--- a/drivers/hwtracing/intel_th/pci.c
+++ b/drivers/hwtracing/intel_th/pci.c
@@ -23,7 +23,6 @@ enum {
 	TH_PCI_RTIT_BAR		= 4,
 };
 
-#define BAR_MASK (BIT(TH_PCI_CONFIG_BAR) | BIT(TH_PCI_STH_SW_BAR))
 
 #define PCI_REG_NPKDSC	0x80
 #define NPKDSC_TSACT	BIT(5)
@@ -83,10 +82,16 @@ static int intel_th_pci_probe(struct pci_dev *pdev,
 	if (err)
 		return err;
 
-	err = pcim_iomap_regions_request_all(pdev, BAR_MASK, DRIVER_NAME);
+	err = pcim_request_all_regions(pdev, DRIVER_NAME);
 	if (err)
 		return err;
 
+	if (!pcim_iomap(pdev, TH_PCI_CONFIG_BAR, 0))
+		return -ENOMEM;
+
+	if (!pcim_iomap(pdev, TH_PCI_STH_SW_BAR, 0))
+		return -ENOMEM;
+
 	if (pdev->resource[TH_PCI_RTIT_BAR].start) {
 		resource[TH_MMIO_RTIT] = pdev->resource[TH_PCI_RTIT_BAR];
 		r++;
-- 
2.45.2

