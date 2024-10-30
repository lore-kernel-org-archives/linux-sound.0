Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033311F12FC
	for <linux-sound@vger.kernel.org>; Wed, 30 Oct 2024 11:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730287716; cv=none; b=HReei3HMDHUs8k1lnlf5mOYfgBGIwr1T4k1ARu2bH1DNoO31sxbI/CH2gsbF/F1+ZJ5xtq2mVC8oI3rrnlrqpbUac1S/9+LEGQJ3H4f0wwdo/8UYcwsfhHefckGzQU+8MRwZDjsucav0v/04JoNON0QrdOXBhJisJ4uPIa3g/44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730287716; c=relaxed/simple;
	bh=x2AO4woPu9H2aNxl2TylFo7TB42POmIv8HM+dl0TTWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FgSZ5mfgE/HEB7xT/jCETG8+jmIfyQDfbksbEdGBY9FZLBY7LDuuIZ6sLWseG5bGV3inJQjSBQcpW7J1A7gpKkT4MBArEqLnuH1F+Kkvzp9mX3Ma9dYlK0ig+c5FC7T2E5IpFa03rDyH9qqk0pImEtTiX3ThwVbGW44/xs2DwWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IXoyuP8u; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IXoyuP8u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730287713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vZ55uYUf11n7K97VlTpkijb2Akz5QQrQmQxQWIeLt9U=;
	b=IXoyuP8uCstOhXunjD9CUrg4fmvy3It0QpaypGq0/7H/Hl9lGHEU4rEnqOZS54x1mWipe0
	u62FcerSSqHENWe101o+DCs3QNNRhRxx16+P5fERb2R9qVnFJmgKX/hC1ikxlkZfelZWdi
	h6+1c5TltxlsWAhBphUyCwg/FOf9u7E=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-dvzxjP4mNhurr50tofNlqQ-1; Wed, 30 Oct 2024 07:28:32 -0400
X-MC-Unique: dvzxjP4mNhurr50tofNlqQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a99fff1ad9cso524470566b.2
        for <linux-sound@vger.kernel.org>; Wed, 30 Oct 2024 04:28:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730287711; x=1730892511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZ55uYUf11n7K97VlTpkijb2Akz5QQrQmQxQWIeLt9U=;
        b=uRU9tW1qkpjxq1XwIXaul+ZBROzraO+dGXeu/HbADiIFzkmsS2Jyq2c8C5NUAk7mj+
         vSU2ThCWjBYbtdZZfflPG/Tabma09yBZibKWeCtjTRiluD94HRjIdpAL692V849BqbuW
         oHQ1do1CC/11RNKXHJ1HIyb0w710+T135sE8ibIvNBOtJHknXTAl7lVUaraGjGYTbP2S
         FxhIMUCKXSx7zn6BVWRiuSBOzpGUeTIm0g37lQ0/p8S/egwfRcXtDb+lHS3/3Wapn6hD
         5Ewb0nWhqdiYpZ8RsdTOFbQbBI+IJJ5KQBYrQOLkvmWMJkengRTZw+5wLnyCXTErmihI
         7Btw==
X-Forwarded-Encrypted: i=1; AJvYcCV1hqHSe/b9+kzuFsK+qspI9cJ/a03CzJK+DfyNGLHoKBOmripGHzuLEWbgqOrpjZxBKjWwWI/3PHXWaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvtIKx36n12FeJXrmg+QBbzXi3vCgBW40/r1vTGQQEvKJAlxpl
	dJdtqcIeMvma2tHBNJD3avzS/zQXOV4wG38RwZVJqqT2W70SxpE/NyM1K+GPSYfYMXcDUo+rb2w
	0XNtq62PNDh70ItgOJJPJ5KCPXu6cebgggospswY+FQBVcB4ym1KGFYKrgz6u
X-Received: by 2002:a17:907:74d:b0:a9a:1792:f05 with SMTP id a640c23a62f3a-a9e3a620de8mr312281166b.31.1730287710740;
        Wed, 30 Oct 2024 04:28:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEypW41JHp9s0QMpUNgIGz0rguEz+SlI+R6m1S08Xc0YathnVPUssPJwfq+JcR1+Av7QYJ0Ag==
X-Received: by 2002:a17:907:74d:b0:a9a:1792:f05 with SMTP id a640c23a62f3a-a9e3a620de8mr312277366b.31.1730287710210;
        Wed, 30 Oct 2024 04:28:30 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3db7:f800:98bb:372a:45f9:41e4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b30f58991sm557324566b.159.2024.10.30.04.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:28:29 -0700 (PDT)
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
	linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v6 09/10] ALSA: korg1212: Replace deprecated PCI functions
Date: Wed, 30 Oct 2024 12:27:42 +0100
Message-ID: <20241030112743.104395-10-pstanner@redhat.com>
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
Reviewed-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/korg1212/korg1212.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index e62fb1ad6d77..49b71082c485 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -2108,7 +2108,7 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci)
         for (i=0; i<kAudioChannels; i++)
                 korg1212->volumePhase[i] = 0;
 
-	err = pcim_iomap_regions_request_all(pci, 1 << 0, "korg1212");
+	err = pcim_request_all_regions(pci, "korg1212");
 	if (err < 0)
 		return err;
 
@@ -2130,7 +2130,9 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci)
 		   korg1212->iomem2, iomem2_size,
 		   stateName[korg1212->cardState]);
 
-	korg1212->iobase = pcim_iomap_table(pci)[0];
+	korg1212->iobase = pcim_iomap(pci, 0, 0);
+	if (!korg1212->iobase)
+		return -ENOMEM;
 
 	err = devm_request_irq(&pci->dev, pci->irq, snd_korg1212_interrupt,
                           IRQF_SHARED,
-- 
2.47.0

