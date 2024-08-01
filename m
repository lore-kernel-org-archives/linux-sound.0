Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6A91BE25E
	for <linux-sound@vger.kernel.org>; Thu,  1 Aug 2024 17:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722534409; cv=none; b=gVu+nZtuL7yPy2R+0psBCBFJ0CkHkaOeP5kEnuWm3QYNOIFZQ4K78cJem9Q3kB+5ejrx9Pji6QnFcDcOyaai66Gs0FPGIhvoO1bqxyQXvmqWqtcN5S6DQANO97L/5qjUgff7IsiB2GHrbQJlrtPqKY/PmvPZvRzPilw3ghTFW4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722534409; c=relaxed/simple;
	bh=4GexEWYmB++TVKtf95ojSGSSevwi4ufn2RVpQzXAHG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mCjt8jZRJYxAeFAPyarBOVya7MGrg2NJ6XY9kfl9kltgKvQ5eonfXjAAvCaAK8g57/edo5y8snq0yLLNSmsLr4QIwE20d6q0/lWnSafx9ehaY1Yea1aNmM5zHmXE9Uun3JgfIa4WG/IaTh0OMnja5xtowSkVaVtgS+jwwJg1ZFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dpQh8Di7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dpQh8Di7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722534406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n5hpd+G0LExVaxl+UI//CFwTq02L8uYAsSV7qLlWbdA=;
	b=dpQh8Di7JdS4J8cUSNz2XL+rgYwU5+CjvHJ16ibAWSdLyeiPgO4BCHTuj1EuUWh3DtR4gn
	rt0eE2WUhpqgBTEwUtHDiLr47qsJVqvzDP9GejLV59XfscouZwi8L36KasHKZfn0lYM3bZ
	rzcu6PdeCuOigFCHPtou1tg8nbR3itI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-sAAVzA-CM0mHBC2_KH6G8w-1; Thu, 01 Aug 2024 13:46:43 -0400
X-MC-Unique: sAAVzA-CM0mHBC2_KH6G8w-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a7aae86085eso18149166b.3
        for <linux-sound@vger.kernel.org>; Thu, 01 Aug 2024 10:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722534402; x=1723139202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n5hpd+G0LExVaxl+UI//CFwTq02L8uYAsSV7qLlWbdA=;
        b=KL1c/ricc+g4JDASw3L4uSZZ9CgrY8n7kUnzPygK7df+P1aGOFdutIWT3j512MuZjV
         M19deT6DrSAvRRHHr9FpMOKOeLlX/FkjAOKFdBoqfu10nlSLhqYEI50HbUHA4zHZZmfi
         bkh9mHmDoa+ExkuTxpP7Ymgz2D0/hW0GLvhYE48SCtRRJiUL5Dn384hF+SVTWR/nHYuy
         ol+hdwKsxNfhmAMEskQJyg2dinewMQXzkAWjrbP9F11MYHlAANY9tDxxv5DcfjzlVkFw
         yWQKA1Ps092YMfV5QJdlax5YcupjCOpJdkIZVaCY/2hNOYtR3oQOxw3hybNfbR2U4+60
         blvg==
X-Forwarded-Encrypted: i=1; AJvYcCUkUzZVMa51Y3XSpnq9uaOWYynhm/q2aa/8SC1gDLLf0f/QzRCib3r7t5Mvrht/t9KASkUvTtahZXx407zAU0aL6bqbfIwWXV8rlYM=
X-Gm-Message-State: AOJu0YyUHBKCUeF1uSJMpy2YndBFnblFDjSgtLWdaXucXhjV1jGE34t1
	Tj8jut9fguNRdbhMpPRZNIY0ArnPBJIX4aDYmVUVtaMSB0CNKrfsSNHUFIUCSyz7xZBI/8H0LM+
	RP4d0FgGOHk+7wan6Ib1QdajR/mbvkc+GnYB98qBAq8M2NCaHxcwXfo63STY8
X-Received: by 2002:a17:906:cad7:b0:a7a:ac5f:bbeb with SMTP id a640c23a62f3a-a7dc4d9510emr40292466b.1.1722534402507;
        Thu, 01 Aug 2024 10:46:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAz8VECBqGLuxnHbBqNGh97d2AXukf5BmEUdwoQf65+BgJnzGGIwfvlOLLLnXxYF4IguemOQ==
X-Received: by 2002:a17:906:cad7:b0:a7a:ac5f:bbeb with SMTP id a640c23a62f3a-a7dc4d9510emr40289566b.1.1722534402107;
        Thu, 01 Aug 2024 10:46:42 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3d4b:3000:1a1d:18ca:1d82:9859])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e83848sm5339066b.177.2024.08.01.10.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 10:46:41 -0700 (PDT)
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
Subject: [PATCH 08/10] serial: rp2: Remove deprecated PCI functions
Date: Thu,  1 Aug 2024 19:46:06 +0200
Message-ID: <20240801174608.50592-9-pstanner@redhat.com>
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
 drivers/tty/serial/rp2.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/rp2.c b/drivers/tty/serial/rp2.c
index 4132fcff7d4e..b6b30bb956fa 100644
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
2.45.2

