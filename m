Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C3852F279
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 17:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913791; cv=none; b=lR0LkGUvsb6PySXy7Ph0kXW17gCxjFuG0PjMksA/63/k7QDGp55ZClpaicy5+mK1wA2+aSful/R5mYl5VuourVyu7BtFZPc0R0KTj0XHC/DiR0U6A+vcgNHlqEU6pmnSwMqDaDqhPuEQ19oo0RLWuCC6EXvzqC8GST5HHceieZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913791; c=relaxed/simple;
	bh=0ZVSDy/LDJO97vC3tLuh4OT4TgC75qZZvsTx5NjlANs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YsV6HRHx+fV6std6nX7/+6dzAFdWmKMp7yQ4h4LqCU9wJ+kN1Zq2Dsk3FQNh9Qe8hAQ+auTwljzteuoD+foB5bmeQce5sLyVXBb9cPVrWaHjA5mXXaagleeS0Y1zv2XFpRljiQkizdoEADZ9cD6qurvocws0a1eBH4nIOMCWWRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AedW0atn; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Hoko8MzG; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AedW0atn";
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Hoko8MzG"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A3EFE4E41210
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 17:49:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7979260362
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 17:49:46 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 130FC11D717E5; Tue, 13 Oct 2026 19:48:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791913786; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Na0mRyoPGBmF35tlBiCSnNCwVd3XJHe2sy4GlOzuQp0=;
	b=AedW0atnOWo9O2iOeDLwVqK5uEhASigACFgmJVwL8H1xWt/9FOEqcHSnNOPNl0i0fUms8z
	g3Y/iCqFFTmaPGFZ5X0J2cAyu1vmMYKzD1YK6AQpnYyKGBldGGeHPdewwG6vx4H9ceDGMm
	rPcAXu4whj5jOxowNLkkyhJPRm0nOvKET5Sx7Ncwpywnw5FjmaYDnTnXkcD2vRMt+Q5xIl
	b8LNVidwsBaLmWVJA+tBjEvkGsorL/p1/n3Ww8S6SwCh7QT9MFJ2jlqK1QFtS6pkAGairH
	APiSkszfqZFMkdD8bR5hJD1SbLwbZLL0H93AGlAok6brK6nE/WjLM6qEA/BDww==
Authentication-Results: mail.galae.net;
	none
Received: from mail.galae.net ([172.22.1.253])
	by 9e7fea892943 with LMTP
	id ELtXHsnuzGpsHhEAtaWaaQ
	(envelope-from <herve.codina@bootlin.com>)
	for <herve.codina@bootlin.com>; Mon, 12 Oct 2026 16:29:29 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7B30C11D708B4;
	Mon, 12 Oct 2026 16:29:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791815366; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Na0mRyoPGBmF35tlBiCSnNCwVd3XJHe2sy4GlOzuQp0=;
	b=Hoko8MzG9YghdjWsMWH1FG4mdeE/idc52QjtW1XaQfKmNgmixcNvP3Pwk4fBeEW4N16R4W
	feLtxyVvVPxmHPbqNm/sBeN4FFHtZtWeUJiUtNJwWjaCsu0ZN8ANNlOPGEVvqckN6s+Jgi
	30cPR0fZaP8wxQKKl3Nywue5xddaFrE2/kO7ELLwk24WVdyMRi6eDX8OCjUTfaD1TNrf7i
	va6HuIV/ZR5QNI8g6PwjngDZkHJI5H9ftwx8RqK5x0OVseGjQMoxUOoF2c9Cf3G3RUDi4l
	gv9/CNL6tYLEK5ZGZ/M4uwItriXO1INSIMphGPtlQm/L1jKUhJlBO4YkS2pB5g==
From: Herve Codina <herve.codina@bootlin.com>
To: Richard Cheng <icheng@nvidia.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <djbw@kernel.org>,
	Ira Weiny <iweiny@kernel.org>,
	Li Ming <ming.li@zohomail.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Lizhi Hou <lizhi.hou@amd.com>
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v13 04/10] cxl/test: Use device_set_node()
Date: Mon, 12 Oct 2026 16:28:18 +0200
Message-ID: <20261012142826.159178-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012142826.159178-1-herve.codina@bootlin.com>
References: <20261012142826.159178-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 130FC11D717E5
X-Spamd-Result: default: False [2.42 / 30.00];
	DATE_IN_PAST(1.00)[27];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	BAYES_HAM(-0.08)[58.67%];
	PREVIOUSLY_DELIVERED(0.00)[herve.codina@bootlin.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	BCC(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[herve.codina@bootlin.com];
	RCPT_COUNT_TWELVE(0.00)[44];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	URIBL_BLOCKED(0.00)[nvidia.com:email,intel.com:email,qualcomm.com:email,bootlin.com:mid,bootlin.com:email,huawei.com:email,localhost:rdns,localhost:helo];
	FREEMAIL_TO(0.00)[nvidia.com,lunn.ch,kernel.org,linuxfoundation.org,google.com,opensource.cirrus.com,cirrus.com,linux.intel.com,gmail.com,stgolabs.net,intel.com,zohomail.com,bootlin.com,amd.com];
	FROM_EQ_ENVFROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com]

The code set directly dev->fwnode.

Use the dedicated helper to perform this operation.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Richard Cheng <icheng@nvidia.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 tools/testing/cxl/test/cxl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/cxl/test/cxl.c b/tools/testing/cxl/test/cxl.c
index 62bd92b3be45..547ebc97bf59 100644
--- a/tools/testing/cxl/test/cxl.c
+++ b/tools/testing/cxl/test/cxl.c
@@ -1677,7 +1677,7 @@ static void mock_companion(struct acpi_device *adev, struct device *dev)
 {
 	device_initialize(&adev->dev);
 	fwnode_init(&adev->fwnode, NULL);
-	dev->fwnode = &adev->fwnode;
+	device_set_node(dev, &adev->fwnode);
 	adev->fwnode.dev = dev;
 }
 
-- 
2.55.0

