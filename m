Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16EA20F3D7
	for <linux-sound@vger.kernel.org>; Fri, 25 Oct 2024 15:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868462; cv=none; b=NkHYbTduB5V9EZcPJ/HOf/atfES+l4wa4eC99lQfYw6sXTndRwyMtbuOWCPzEt95G+zdsVcwYLipZVFgxJohkMqVOXL0xjUs5shgnylzsOaEK7Xom4pOPcplFvmy9rqFspmXgW6+snSgjhGxQ1+fimOEWuUVm9zEnTu1eu1ZH9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868462; c=relaxed/simple;
	bh=RRyy0x2PiBX++bfjCGlA/9AZOm7xwGM5wtpW6IKXyVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UPAleR7UmsVcBGy5I5FnsWp0/VXA6+ruN+bL8rDXmgrJCexp5F/n7pNpMpd65HmWG147jWwQ92DWtMOT2A+ly4JnW2sKSzxF/VuNM2Edsh9BHvQGeg4Tgi2W1A2Nve5Tg0z7c1gdrWXRz/LmsgHbQrn3G2bvcOjfUwyjYk+ylco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UaZeddGM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UaZeddGM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729868455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WxQ5Vib/1yt2THpDXWI2rA9CY+VRhy0DxtAlfuLaLe4=;
	b=UaZeddGM6A7BpfasIJOSrkPQIVzmgoeRkl/MEi38fvlQHEJZAmF/AWDWKJGIKivEASAm8q
	7KaWiLR5w5YeNQQgpAfY2PHywv10WqKhUDCpKhnSd1VPBtvRrx7JBBpOwXyYR8cdEyZH7b
	rr1FQ7UhGKqZ8rNuvM5PqKYpA8kVf/o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-LyOPO7XTPDK69DxcLw4G2Q-1; Fri, 25 Oct 2024 11:00:53 -0400
X-MC-Unique: LyOPO7XTPDK69DxcLw4G2Q-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-37d4cf04be1so1031038f8f.2
        for <linux-sound@vger.kernel.org>; Fri, 25 Oct 2024 08:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868452; x=1730473252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WxQ5Vib/1yt2THpDXWI2rA9CY+VRhy0DxtAlfuLaLe4=;
        b=fdsGDhtgzhLzYHFtVPQxV+hlhG9V3klU7+ahiE93dAVHuhlN3wOusx5p6Tgrh4UgS7
         Vd5sVmSoZTVTCUNz6puAYn/hD8ynBd2X7ClUvNBFHbF5s8VaLAj0fZeZyQu54G8tpzUS
         71eaDlkKSdCm9aMFaCXA8GxevzFB7ZeqKGIEdWXWwfbA/YLU/DOWXFwEnIFFvfv4LJPr
         Kwe8sABUxa+aPCUphmGP+2Du+2yaODxsgHs/MmrbIHz8xKWYYfrSeNVTrTuxDmHEBP+u
         YNxa1w1xUuW3o0f4Cdjw3R5cDfN7fpn46U0edeGrDMhjh85ElmwA0lbtZez+z4mx1KSA
         E74w==
X-Forwarded-Encrypted: i=1; AJvYcCU8chT5QboAdcUxN5C2I2855XCnRv2YjnTgeaghtQt8Om0jbjz0kykSh+RfGVlsEC3rpyYhXyr6Ru+owg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfOvV2t/3sFZEWbVaIj3pDPEvS3iCE/IQWC8bJjVu+Mnb2lMD4
	daaw+oNKCaUKShS0meGO/U3PDMKw3ktsvIxJVv/1OJ20FaVfKNazCUW1HvFzSqbcoBQjMtqyTfq
	h8b28B6tTWMa1rPBTEq437dWcjESnQ54CBTq1eE5C6ywUmNeEJBb4TY89ziBK
X-Received: by 2002:adf:fa51:0:b0:37c:cc96:d1ce with SMTP id ffacd0b85a97d-37efcf1f8a1mr6808546f8f.24.1729868452214;
        Fri, 25 Oct 2024 08:00:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa7Kz6+PrKx8KcDC+E98x5hc+UgRFrJFo2Tc4bVFvRSnBAJrHJ7dhWBhof8LHoIINcGd/8TA==
X-Received: by 2002:adf:fa51:0:b0:37c:cc96:d1ce with SMTP id ffacd0b85a97d-37efcf1f8a1mr6808341f8f.24.1729868450198;
        Fri, 25 Oct 2024 08:00:50 -0700 (PDT)
Received: from eisenberg.fritz.box (200116b82de5ba00738ac8dadaac7543.dip.versatel-1u1.de. [2001:16b8:2de5:ba00:738a:c8da:daac:7543])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b9216fsm1727189f8f.100.2024.10.25.08.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:00:49 -0700 (PDT)
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
Subject: [PATCH 08/10] serial: rp2: Replace deprecated PCI functions
Date: Fri, 25 Oct 2024 16:59:51 +0200
Message-ID: <20241025145959.185373-9-pstanner@redhat.com>
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

