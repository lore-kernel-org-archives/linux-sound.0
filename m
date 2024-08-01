Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32141BE871
	for <linux-sound@vger.kernel.org>; Thu,  1 Aug 2024 17:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722534410; cv=none; b=rxwJTClJJMRc3NC/R3EySBK1lNdq+GwHwmOZW0tonmllaud41lY21VUptAggwhj4aCvNIRa/MJ0Lq6ScCVk+4qI9ov0qN0SwZTIJ3pEFVxiQ2EbPtIJtJXkWAdMqv0YTbsxu5ezOoOfzzQyxEFCaAN9CEZzu778+fYzsVyeSi+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722534410; c=relaxed/simple;
	bh=PowKNNK7ntiN8fDRwJEfgWzFgO0JzDMOq63Tm65TlRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VfYzuXpgyKf0PFY6pNabuybYl+XxeZ3B+A0H4AubsoWaLSfZIJW9izrOyNlQATy1mLGMFyMXxCPYItRv20CV4NonwG4Mindu5X2mUMlqQTBcttLe+fZnc427/T+orC8FfjHDbmF1PZbRLJlAlk+JtoevFCrTk+G1Gq4EIJgozwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HKmQnrIe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HKmQnrIe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722534407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4T8HAVKVFIndb0epInGCIUNTvqCq3Yx0Jxliq8oDWAI=;
	b=HKmQnrIe7C0eULHYYnovrF7jq5fVt9dQjCOWII/88Nird6+KyCP9E/T9JaMDGeth0Cdbwc
	RTVvUT/1sM+ufOZteAC15FEZP2kFruZinxfbPLTcH6v3hrvHlJCLJn7pNDUCVKwZI/5HPv
	Kdw+yjC5+2ZjT8dLSrRrMWZm4Csb+f4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-qgfopkVIM9qOiRBz9OrSnA-1; Thu, 01 Aug 2024 13:46:46 -0400
X-MC-Unique: qgfopkVIM9qOiRBz9OrSnA-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5a0f73ff43cso1109933a12.3
        for <linux-sound@vger.kernel.org>; Thu, 01 Aug 2024 10:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722534404; x=1723139204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4T8HAVKVFIndb0epInGCIUNTvqCq3Yx0Jxliq8oDWAI=;
        b=kexe1fzM0xiX5pzzbCoIxKar+LODCC7qKIMvkcaYcDwIZ9XKwg9WVk/r37axnu+Z/7
         McUDtF6aRXGWE2rLTylSF4RxWGL9A33uW9ud022KPTDctkkYAh8LwedIvi0mVm3gDM7O
         oPtRKwCvQhkhrKmvtkp9YTS5sbf5VITyTSAqznwP0x+FfSJt2gKy8kOyK9NSKHr1DA4R
         d9fuWCCzCzRn3oRsi21OEEi9/VfpItTKYBnHCUEwMdE9479IZ+WYpe2vN+8kWbIGfU7I
         CiAVykEmLGQaxLi2RVW+qoBz8Z7xhB2gqgiYL3Xw0ugwdJcuocyqNw3YiC/1/E98EpyT
         /JQA==
X-Forwarded-Encrypted: i=1; AJvYcCVoV0PntBrN2EVFo8bu0XxUer4ofYt0lZqSX32fbFRMdNY6IeHrE5cB+CdKZpdQ1NW//iB6ai3jkdFrdAtmHHuXkeEshQKsltTM/HE=
X-Gm-Message-State: AOJu0YyHHQjJ22iwEVcgInq5jVG/rEKbsDB4DJq37a0ONMKYCurBm10p
	K+03SWVLuth5aETJgozpIKcRuDAMa3ksEKjuK41oIVJvNvWuEgaucWvQk7u9v7VfiDm7mWrFiSu
	Lvz2GeNMbQAMT8IZ0zKLUuIwPHpPooGJcfh2HxQ0rH/MJ2L/+69elgQf0oeUh
X-Received: by 2002:a17:906:d551:b0:a7a:acae:341b with SMTP id a640c23a62f3a-a7dc511b140mr44582066b.9.1722534404446;
        Thu, 01 Aug 2024 10:46:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWw7p0vbE3J4abjSBrxyeauGvjPs9Iiwjk4nqGQ0MahZpjO/0TmVoD8LvCLea8dznFqsew5g==
X-Received: by 2002:a17:906:d551:b0:a7a:acae:341b with SMTP id a640c23a62f3a-a7dc511b140mr44575866b.9.1722534403935;
        Thu, 01 Aug 2024 10:46:43 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3d4b:3000:1a1d:18ca:1d82:9859])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e83848sm5339066b.177.2024.08.01.10.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 10:46:43 -0700 (PDT)
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
Subject: [PATCH 09/10] ALSA: korg1212: Replace deprecated PCI functions
Date: Thu,  1 Aug 2024 19:46:07 +0200
Message-ID: <20240801174608.50592-10-pstanner@redhat.com>
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
 sound/pci/korg1212/korg1212.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index 5c2cac201a28..b5428ac34d3b 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -2106,7 +2106,7 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci)
         for (i=0; i<kAudioChannels; i++)
                 korg1212->volumePhase[i] = 0;
 
-	err = pcim_iomap_regions_request_all(pci, 1 << 0, "korg1212");
+	err = pcim_request_all_regions(pci, "korg1212");
 	if (err < 0)
 		return err;
 
@@ -2128,7 +2128,9 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci)
 		   korg1212->iomem2, iomem2_size,
 		   stateName[korg1212->cardState]);
 
-	korg1212->iobase = pcim_iomap_table(pci)[0];
+	korg1212->iobase = pcim_iomap(pci, 0, 0);
+	if (!korg1212->iobase)
+		return -ENOMEM;
 
 	err = devm_request_irq(&pci->dev, pci->irq, snd_korg1212_interrupt,
                           IRQF_SHARED,
-- 
2.45.2

