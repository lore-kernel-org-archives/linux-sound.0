Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBEA20CCE2
	for <linux-sound@vger.kernel.org>; Wed, 16 Oct 2024 12:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729082517; cv=none; b=sYHXZ2pL1m6wY2kFdVN1fV12SvquD0YvXQJ2kcJvqdRZpK6XbHt7rBKN/Vw3AMNGc9MfZnP18W6N7nnnrm9hJd5V0aAYm6RrkOisYlKyd/XaipcZnOIXrk+cY2wUWr5wbLqAprTI/F0UPPZpm1JGUxeuPYHrNmHAvQfuXp4o8zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729082517; c=relaxed/simple;
	bh=xqbcT0teETgc9gYJIx/Gpdlf6NMW2EiA0uF/aZLVnhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gKnekOE7f1xurDGOb+X3Ohrpms+wQFFD7/LWmtQHzpUiQcIw8YHyrKgARDQrRBlrvcoNmP1lEfgmeBj+aLN5qgDwNY05plH3T2IqX1+C8OR7+QfjJ5eUXQDpgFbAM/KsXt81IC96z+yxBRgPLXFl1Tn3aPYbR+TAO1LsDphWaDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LKNYv/Kp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LKNYv/Kp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729082514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3HQZvfLDOQXSIlF97X3lGTL3T04sTNcN/H3+TBJ6Tw0=;
	b=LKNYv/KpUh8KLHY7jdYqJQUil67gSwElG56+dJKdUF1X7xJwcjWBBb5VnfReo5MNRU99kY
	+MWtgwWC6U0RWrAIa9vu6hMgEy2f7VWy/AoXeGSZeQkqb+T4HqAHizRBabjX1T+2ZlJtcb
	tSIfPGWZjhSNnfe9d0MjBMkIYkPyAxg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-8dxMkQLGNa2Rpul1N853Hg-1; Wed, 16 Oct 2024 08:41:53 -0400
X-MC-Unique: 8dxMkQLGNa2Rpul1N853Hg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-37d4854fa0eso3349865f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 16 Oct 2024 05:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729082512; x=1729687312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3HQZvfLDOQXSIlF97X3lGTL3T04sTNcN/H3+TBJ6Tw0=;
        b=HcVMlnZabY3tINbeGj3Bha1UgJKo2fmPfpd870gIFIM5Zg3EVpERPHBouMt5B8qktZ
         AVgDNzNf1bROYiKwMP9otzL9nOW3onML5xrL/cqyTGdEvUB589sonnewQPiT/w8x1QEI
         F+/tH6nSse7KeX8SO3E/h/Zrzt0wkZ7i/EeWsuZMygfxeJlbOg4RLPj8v4j4SO3gAhhs
         urFPKg16fxYch+y+zA1KUIQ9Hwjqfv409ON20IV9WBQfEx+cIaXAsBxaiwHd/L5u0Zsk
         Uj41hFfvAVmSDpupN1CAARDxW3mv3Zh0JtdmzVv7EJ4X6Ivgu65EOrBIgOqscD062EU9
         K3kg==
X-Forwarded-Encrypted: i=1; AJvYcCUK9sIbwn1ECY9jzT6Xaixik9rcbXI0tRSomQhJBFuUYUy+UlKopHcjZtZpnL/Yn7nvGFTwaW4QdJWv0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTcWV/cGaYAnpeqTMPMmf2GLOlmKjNH3UcUJ/UEasqIj/G775P
	lGF6Ca6BkodD8gbvrV16ExuLljgLajQUH5mijXev3JbUi5Sdna8REcBUPpYpi+bgKwqRQOTzzk9
	gCk68l73rmWu2wi0/eMkGoS32InVEdIiJBPHXQ3nfskjp+mw2F9K6SjF/8eH5
X-Received: by 2002:a5d:5259:0:b0:37c:cf0b:e9e6 with SMTP id ffacd0b85a97d-37d86d5521amr2837782f8f.42.1729082512130;
        Wed, 16 Oct 2024 05:41:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuuOf1sTYXDilZR7nD/RZHfWfnDIJXaRup8pfdRiWUJNRcHMmBtXXl2psjBzvHRiWx8thnIQ==
X-Received: by 2002:a5d:5259:0:b0:37c:cf0b:e9e6 with SMTP id ffacd0b85a97d-37d86d5521amr2837729f8f.42.1729082511712;
        Wed, 16 Oct 2024 05:41:51 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa8ffd6sm4246879f8f.50.2024.10.16.05.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 05:41:51 -0700 (PDT)
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
Subject: [PATCH v4 05/10] intel_th: pci: Replace deprecated PCI functions
Date: Wed, 16 Oct 2024 14:41:27 +0200
Message-ID: <20241016124136.41540-6-pstanner@redhat.com>
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
2.47.0

