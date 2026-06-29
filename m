Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C8D374A02
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 09:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726826; cv=none; b=n13h2gqwl7Swue+E4EiqOH2p3AJu5nE+uuFbZOHY0n+ldswl6T8rQKcerGMqpoZOAGViNG4WMG5N8n7r1NCB8ffVPmOqLGK/Kakr5UQuaxmtAkiWeFUJpQoRZ5blmzMQbfCAEL3FWagBjntzvOOLA4F8Cwv51xWgWtuSZh4erRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726826; c=relaxed/simple;
	bh=eZXbYWd3+DHodzK/Nlp1aWVB4wmV32J/g2oDx39NSvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mTxRPdOelP/BiaktTxBue8eAqlVUTNG3nt3xP0WuxyF6zlKntrROO10/X7rBUWzlSyOb+w5R4nW/Fd3AfcpGX6LfrMYKsQ8r+vOrPGXpaKa9kg2jNJMtwVj3g71rQ0SZiSqw68tSdPhwGFssWRwl7AO1nQTTHZF7ZdVa4geLU2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCXdRHBL; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCXdRHBL"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30c965eab27so5796297eec.0
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 02:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782726825; x=1783331625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cmREBHA2uDvzogPUZ5pu6n0O9BRtVdNjBfYIRe4Dqqc=;
        b=cCXdRHBLLY07fLv9/XLk77wid48N7km1Tc4+5aUN+DoZ6OQeNCHj1qy4nDIM5eHD7s
         nwTDXJSPKP7RStyEykVtp6/DJKkQ9JmX+VkT0dSbl0KYaVW5DuV7N6MWnAlyhVV+86ni
         OEJB97LUcmrYWpksgE3BQfSgpkz0UfT2dT13LMmtIgx3iqD2p9NPH8/c4nIJwFt2GhMy
         rEDR7n0Esh1HDZcqqKFybG1kQSaWu1QB72DeGNWnF5bukvoj980HVo7aVmPuhFHvHwuQ
         bVVifJkUErzIAPlc7PAFWWdEV8Ri8+yXghfOH4yz5I0oJ+uBBSg8ZlqvUiFbRA/zxTIv
         qbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782726825; x=1783331625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmREBHA2uDvzogPUZ5pu6n0O9BRtVdNjBfYIRe4Dqqc=;
        b=LbMDNf3YCaeS+npH42B+nLaN0En/WL1JcblcY2gx7eYNcH27UkXouRYGJTnBaDNGgu
         53FVREHIo1TOH9pZyMuMUXXFHiBnbhGfOrTNc/hdtkw2P75pRg8loBvueUs7Hu/jJGfe
         DCShGc06QGHUW7WhAPplY8RlMXR6yK1442IYr5IQ5UcdOEL243/MU07SCDKvhTWDrWR/
         xnNyEKNT9uIjvgKxGdeDQ995/PHzXzzREd1hu0jqaZa9CI0cGgmrqWbWQJX6K0iNKVjZ
         N4ISYrT3tWvz30Pff7pO7bKYWTWCvl7l8yeNxv54qzvyZLL3Uz0hHWz6iffMrZY9hJ7U
         MeLA==
X-Gm-Message-State: AOJu0YznuE3VhFKUmca7vwmkAHFoE+V788cYgw1ExLpKsyN5xSqfxEfn
	XTF0MUhogxnoBibQ7qZvqUFDLsG1r6gV/KXt7XMpfdPmTO3XosW83OMj
X-Gm-Gg: AfdE7cmJZyyf6YmG4iR5IB7w86arBNeN/lPtBvaQ2QuWQcljEa3dvf9avAqAXmM9ZwE
	8TC4caAGMkLOHgHDBZaN+Z6lbYju21R6GLs4q3Bl+JX2lfatVJwCp/ypdqyxxqYdj5AdFBOzUs5
	t3P56NW1T+8+GVMglYXH395S49LyRCV3tLafZHW5vvF6vYkKEw478ynlEmobyKlMfO/iXvzclJ6
	92mjyPqdZrUaCwvJMSJgcdPTlDjYs9Jr6tt7dDBoXFn98m9W46lrCYZDmI8dTVWcriZjQGxAv7Z
	zgbCI9S/oRwB5XEEa907R6RQ1IqUqdBo1VQ+Ik2FJg8v6mXhP3DVJh6UHZn6kdSxrcQf1e1x3L3
	Tu3My54dMr9oFHO+iu1XjaQ1p8hN0bWH71a1xG0wOnvBcAjIsE7dkPAuROg6NcfIndUGcJDFoNF
	FP6i5f8Ge+Evshf18yig==
X-Received: by 2002:a05:7300:6dac:b0:30c:9f31:b631 with SMTP id 5a478bee46e88-30c9f31c2f3mr11313039eec.33.1782726824665;
        Mon, 29 Jun 2026 02:53:44 -0700 (PDT)
Received: from ahmi-PC.. ([2401:4900:88f7:9f6a:fa0d:2e9a:ebc8:7a93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30cf86deed5sm24767052eec.1.2026.06.29.02.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:53:44 -0700 (PDT)
From: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
Subject: [PATCH] ASoC: renesas: fsi: Propagate platform_get_irq() errors
Date: Mon, 29 Jun 2026 15:23:26 +0530
Message-ID: <20260629095326.37302-1-ahmisaranrao@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

platform_get_irq() returns a negative error code on failure. The
driver currently stores the return value in an unsigned int and returns
-ENODEV for all failures, which loses useful errors such as
-EPROBE_DEFER.

Store the IRQ in an int and return the error from platform_get_irq()
directly.

Signed-off-by: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
---
 sound/soc/renesas/fsi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index ae86014c3819..6be6587e1095 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1992,7 +1992,7 @@ static int fsi_probe(struct platform_device *pdev)
 	const struct fsi_core *core;
 	struct fsi_priv *fsi;
 	struct resource *res;
-	unsigned int irq;
+	int irq;
 	int ret;
 
 	memset(&info, 0, sizeof(info));
@@ -2007,12 +2007,15 @@ static int fsi_probe(struct platform_device *pdev)
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	irq = platform_get_irq(pdev, 0);
-	if (!res || (int)irq <= 0) {
+	if (!res) {
 		dev_err(&pdev->dev, "Not enough FSI platform resources.\n");
 		return -ENODEV;
 	}
 
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
 	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
 	if (!master)
 		return -ENOMEM;
-- 
2.43.0

