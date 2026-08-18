Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215E15B5AB
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 18:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787077237; cv=none; b=F1eef5BI/7pMK0LS+0ymX/9dWldP7WGXqnGLB3KDrfOKqH2QGYVWj9SGCjRWZBmKZnJiT2XeSn/k8Y/KY3hcFS9DvU6VTjY4yeuqUy0jDHfOAhuDiTfbe06J3VydfJ5s5lOkkWbDFXoBjBEuR9av9hUVa4FTjHJOtowc9voW2WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787077237; c=relaxed/simple;
	bh=4hl5rM509O+3cq+hCBUb7KPosvSyPqBTfEo6+lZjY3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uMHcTGB3oNmvEd32tnGSVAbsGY3DQUcP53g/nQMuhkWMUr+i0IQHFQlbgRi/IlTF1nxRMkqvDPCmIeHigmndRCr62mQPRPxD6j+YsIg/lGtbyIphi+6JTFt/ea8cst8vRVpf/yytOUm9IzJ4VxCZAd9gYKBthn66H5L9sEhMU9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFKEDROn; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFKEDROn"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cca0c5799eso1292915ad.0
        for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 11:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787077235; x=1787682035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GcSJnE+Dy9oUnfea26iykFmbYynKTM5Xrt62f/0M8/g=;
        b=JFKEDROnBq4FuJor8wtCe9ZTordRS3sf5YxC5B7E8D9bar60NflxG6ntrklCTCR9Z6
         qZ/kYjNophyAthyJtEJ085EFb9zyXc/KlzWJpA5AK+SSnycNAuCPMXEWDUrOfatO95o6
         7lbWKtYnapbOeZmTvAeKfKgdIFxpOBzFTWGDItgXj+zHM24ahk1CYgaVV11dTo4LVW1d
         GwQdNcyllXmB/19F2lyEd/GD8YArBW//CjlW4S5iZ/vSo0kPBJtWj+cl9QekLH/Wz26K
         AK/NR98IOQKhaKKgk8AUAQx+z46UjQky/ikQ7nKf+T4AIA7cgS5UzwegvoaszscuEWNo
         LaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787077235; x=1787682035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GcSJnE+Dy9oUnfea26iykFmbYynKTM5Xrt62f/0M8/g=;
        b=AzBjDElu6XawhbpnYnJD7EqlKzSpIBYsXm0CQVS8K61z4GOOfIipetHx/R2N7I7fuC
         7Wa8UTHA4paxbEnr/QAfT9fRJvRF4KYlxcCtc17jSgOUIrtKZjBW/ai0cvsFGoYx8cQw
         d8G1CPMDEL8ZONRiTDGgLAA3Us5JE9caulgTpFnkQ8qTw1nX38GwXM7etvh5l0ijOAPz
         UeDA7gZkdc1ZNg0zHgm9yBL3AxP0xqPLWXlUnORjFE6QyXmxrqtutmUXPV4vTTGCtRoi
         dhNVvU8gGQcOSqY0CnEohEY2tlBryz2HBNIxTDSUeoFXt/GLHZcbbRl57sIzTix1RM9I
         CDwQ==
X-Forwarded-Encrypted: i=1; AHgh+RqpLLwLc95tvaYzxHsedkx905qBZtoFNHMvfXfx4y35Qj+aAG7FNs+D++MFMmtQL0+Fuu+8qcCCCGw5MA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkwdHxgAJt3Ia61+Wgu0fkyzhkJ9ksknNn46my6hSoRccTK3P/
	lnTKiHkJmwufPKVZIMGedrbzVemaqmwkd/VCQE55+vvRE8E2yFQM0i4/PSS2Rg==
X-Gm-Gg: AR+sD104T6ZGOzHu29wRaafQU8L3ejxiBp07i2+4MPYYBWwqMR7gWPyBgmFDkh6MZ9G
	SEYTJ4mlh7ZWI9ifqWkI6BYOSucozMI5QRAhBgEomHBg8XPu8kKGRPMDoSIElOjije4SrWUJcg/
	hX5xTEH/GYG45e0w/kx396e/zziVauoq+Ft6UfKQL1LuCMawFATfHE1nQSyuhxA6qRW10K4pPjU
	jIDWkx7m2oTigrzOSlZXeJoyGsuLjUh6YPlrUJvXuIr15L/agDw6zhmFrfIB7QTHjM5xcZ8NiV4
	SRAOc80Gf6BPAzvDv8etXy7qu+ngRLBQ3l2vBmEa/98F21GlQLZL7DqssyXE3P7ZjDU3FqBz4rB
	BQCdDTTLISDGRB46rAqQheFQ5p+2wIwmRFw8GH4Wh86QSoLtBW9CBtC7xfSZQC93kkiiVk++dtj
	EKZcJmYTk3EObNJ6MaeJyM3gfkiPcMnzJZqs1kS+84PR2FOl+I1skypn2NUgNFzZibhe4yiAUZL
	WdYGsPOE19jhlWSf+yr2LI=
X-Received: by 2002:a17:902:d4c1:b0:2c9:c517:d070 with SMTP id d9443c01a7336-2d3b0ad45d3mr364600085ad.3.1787077235484;
        Tue, 18 Aug 2026 11:20:35 -0700 (PDT)
Received: from sataporn-yoga ([125.25.12.158])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3277dbc6d3dsm10847707eec.10.2026.08.18.11.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 11:20:35 -0700 (PDT)
From: Sataporn Saijai <excursively@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Sataporn Saijai <excursively@gmail.com>
Subject: [PATCH] soundwire: dmi-quirks: add Lenovo Yoga Slim 7i 14IPH11
Date: Wed, 19 Aug 2026 01:20:20 +0700
Message-ID: <20260818182020.143096-1-excursively@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Slim 7i 14IPH11 (DMI product 83QM) declares an RT722 on
link 3 that is not actually present and never attaches, leaving the
machine with no audio. Since the address is already handled by the
ghost_realtek table, only the DMI match is needed.

Signed-off-by: Sataporn Saijai <excursively@gmail.com>
---
 drivers/soundwire/dmi-quirks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index 32a46a2d9..8f74b0dd2 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -192,6 +192,13 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
 		},
 		.driver_data = (void *)ghost_realtek,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83QM"),
+		},
+		.driver_data = (void *)ghost_realtek,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-- 
2.55.0

