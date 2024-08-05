Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C560315574D
	for <linux-sound@vger.kernel.org>; Mon,  5 Aug 2024 08:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722844941; cv=none; b=tVdS3zmuBayWhCkfhUzQYQ6Hl11cp0i6xxcw9OLHiSQP3E4JGGkp1PCw6lGCeeZ3DWpLuxj3+3ib+Z0l1AyTk/498GPGE3f/DnaZkFOdqq8Pmta9U9ZlHVCkLl+8FfSwSfjV4OmjIz5cL5eKyZZL7mOaK6OKb7FXhbDroYI7c6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722844941; c=relaxed/simple;
	bh=T/Lr5R3ZpRsNgk4LNzf4i3JOmIq6wzNv8zvkRdHooAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ukxBsO9O45pt9OQHH3p3mpFegoGkSMU+S5uypAzwNhKLV7MpbdGchkfX0fdP/L0wCUj0egGOdez8/Q7Y7R/NEB4OQXMCaNwjbWjAN2SoRqfbF0J19Z73KMUgzALpX9xWfogPi/9MZbstO6e6vFFxM0q5YEpmpniWJni1GIDJieI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d4vgyc9/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d4vgyc9/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722844937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VIcu667vSRZRiKEHakO3GAIgbzPtgHQvNS3his8mZEo=;
	b=d4vgyc9/qz+CA7eCztwIFc2fxpmnjLR8m1xbya8FUIoKoldGXi2LxSDxWNXmTrhGZu0aGd
	JTUYpz1YY+Ag/zd8HVe9rs+OMSBjG2mSiDo4WKOaYbt6ZdP5BCxCZZqt49KUgS7hojPLAb
	7ta8A6jpF9AqitgmCSmYVe4HFKf5rnQ=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-c32Wm3tQPc-8RiD_ca572g-1; Mon, 05 Aug 2024 04:02:14 -0400
X-MC-Unique: c32Wm3tQPc-8RiD_ca572g-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-52f89aa7019so1007875e87.2
        for <linux-sound@vger.kernel.org>; Mon, 05 Aug 2024 01:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722844933; x=1723449733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIcu667vSRZRiKEHakO3GAIgbzPtgHQvNS3his8mZEo=;
        b=HrApzp15LPXMOVrDsGlWBKOlvPsr6f7BO5qi45i0+8GaIy6cveGnLD/0Qk69Pb2pOc
         IuD/mptRzb9SXC97o0Toi8Uep1bzRyD2Ze1Zj/YEpNr/rcVfi15Ya2U4eZzCE/qaSSCf
         +SGoTyXq78oKvfUqvpr0vOgHWVnhHD8JJrmeuaJ4JB05VoKY4FPWL3hQZK5jZmeUe06W
         N51wbvozkJkllHAw/8UTMLsoKzkwn2G8htgPtxdUvryi5EfpIrSQXrWJ3kzQ3fgGfauq
         f1f7C9Urou/AlisDAQmhjBlbfEqpoA/l/wDMim8dnt/kIVp5Q07gDhN+rkEWxVzBvb3L
         vt3A==
X-Forwarded-Encrypted: i=1; AJvYcCU9ll/gFJmCmhUBhn/8l/pZncHLl1F+51UXJMptCjMXHPpt+XknJCxfctQm/otC483RaJtmpqTU2Oji8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzH8Z8rAHy7X177ok+NHeTP0z7yOQbNIUJmCVmQ/KqhjNCAqOGy
	/CioYajjmMx5sc4s+h6gXSzO8Tb/u3u9Ws/i3rMaxMoielT1A08VGHiojdbRiJ6muH4pfLTVJDE
	BNobsHJpXstflc49Ql2w/ycqzslXAfDs+yOw2aKSNiPDLTK7ER04s6AFPX2L4
X-Received: by 2002:a05:6512:1307:b0:52e:ccf5:7c3e with SMTP id 2adb3069b0e04-530bb3bd143mr3696341e87.7.1722844933151;
        Mon, 05 Aug 2024 01:02:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwcaUohyPPqlQalc7Ds7xBVbw16Nwe2cO8DiX+lGZ7pO2pVwTP2h5T41+23RRZFgk9XX2iTg==
X-Received: by 2002:a05:6512:1307:b0:52e:ccf5:7c3e with SMTP id 2adb3069b0e04-530bb3bd143mr3696318e87.7.1722844932669;
        Mon, 05 Aug 2024 01:02:12 -0700 (PDT)
Received: from eisenberg.fritz.box (200116b82df07e000a5f4891a3b0b190.dip.versatel-1u1.de. [2001:16b8:2df0:7e00:a5f:4891:a3b0:b190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7de8d0868bsm277958966b.143.2024.08.05.01.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 01:02:12 -0700 (PDT)
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
Subject: [PATCH v2 05/10] intel_th: pci: Replace deprecated PCI functions
Date: Mon,  5 Aug 2024 10:01:32 +0200
Message-ID: <20240805080150.9739-7-pstanner@redhat.com>
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

