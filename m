Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591C9231836
	for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 14:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768834593; cv=none; b=jIwIc1wZCNELyZrDvMBKfO6hnoRJbyG75UagkQmcgNnoGuafPsY+YV1VwKCLEdjPvN0uZ0GeEYii2U7rlBlp8oYKw24Xtj2COwBwizyp1CvFYJ22WN81w+ncQKkuisT9MRdkg3Dh5KL8ATOg0i/sCeSvR+yO06FYGl0gkuy4SKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768834593; c=relaxed/simple;
	bh=Rf/JouzqWfXorM2/hEPpl85helirE5U+wtcXio9HtMw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R1xtkkfo1rJm/ZER7NS0Iuy6QjN6N7qb2bX3dLPMeuUGSBqu0yXQ7JD8zmAhza0T+vKJKwReNWwoByTjynalskDlkCM8yzknXR9as9qzybUcXT788LkuQjN67ipJO+pe6BefvoY32e/W3X95KpiDHX0q67CgnXD2GHYyvS76+ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YpnUqc+t; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YpnUqc+t"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-64b8123c333so6894767a12.3
        for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 06:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768834591; x=1769439391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W/9/j/9n4VAj3vozxwuN6C5caIUaITw/zX09yFVgGVg=;
        b=YpnUqc+t8Zz5PrOHoo7mYZfHiCeH2TU0MD39+4F/liC8hVgShDT+abl029T78ubOaE
         MfLKEOTBlSIZWFpp0s4dmIWMK+GG1SHiSFpx8A/hev6XBzzClUdFy0+mdY6CksKozhnP
         q6rxgR75SYbkfgOrMcF4roL9pNNRfIfj1vQAJ/dzEf0CVSgHyh4mPj9zR7pFZVhZWHtT
         qpYfRqIVVVR0Be7L56pvcAd9yKDKp7JkdrajFXxucesNEJU+WKnTHMQUDF62KRsFWKjv
         13IwnRxS64+v5VeEUoTETZrsNGqAeigZ7uzd1RXHE51NqYMFiAYvrmgsz4aw7FvczLXx
         /EHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768834591; x=1769439391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/9/j/9n4VAj3vozxwuN6C5caIUaITw/zX09yFVgGVg=;
        b=SlrhUNl6y/W49A61BYpPESgPkvNNgZ9+QYa3nRNRQ7S5wgH183EZRr4+rHVUZkOSbS
         iBgf/6dM3eMVsFWt7klm3Tzh/nDuWBE65de03zgiSAaWkIcaNmbyGLEBRwouJ1vpTut9
         jWp441HqR0LNC6Mt7VDhDfnHp4JxwzzAZY0037I8IDiKhRcLwGte6vmrhL9SiCzArHwl
         /TgEtt9B1sNsdepCfAjH3P9nph3pQu+AJsuabG2kkqIbFdKjMYoCqCu0zmbXQJye8bKW
         WOUIXOua6sn97M4H7jWtbj5A73EFViyd/bY9CQ3BkeSCRviax58DIncoOikc7OUnWYG8
         IL+g==
X-Gm-Message-State: AOJu0Yx2s71OK6X8JDXZeY+6RN0ZkrhURHso1EDaWoFNDNDYslBotOUH
	u9pYxMpbwBcngVvQBAvMOhKhp15xG2shvukAjs3AET2TI0SZPoMVJnxwg/uNmNm4
X-Gm-Gg: AZuq6aKrz3w6cpq0GBgsQ+mBEQhIbUHPxessEb3BuncmCWyuBa0sVVZB7LBciiC5+5x
	UE9tAvLnYYb7Be7bcaIcMshLV9P/GCreJMKwQoPuB7Buwlu98L/t6NWpYOtCDdlZd13QjQc0c6+
	nDaNQZy+XtrNV8f5u5s8w0Tr2d4o1itSjcXFA+ipGjWJ6EzHuKJMc/95p/m1Lr7YJ+A/DL2xa2y
	rmQZtPdbWbBCLM3jvY+VWXGTcxk1SFYdsHVW8BzxHcHVnwj8HpeBetezsmuuWO20zDs/O6y+vcM
	h6PBy5pzShshRBIdt7kReTpPOY2mca/ntWqy9y9FwbvEo10/fRA2T9SVDP7vaVP5re2usGCYB6Z
	V/mu9c/GrC2szilAsiNeixdtWtTG0HAzHvimjbIg4Y/o076eUyDhidrkjZ8ac4hPCaF5vSorac3
	GMFv00KeTE5Lafh1y+EguK9uaHITXRJ/+kxWOh1isFnII03j7ZsWLYPvmAxu1BFSNiITmNPCUZt
	Ilclof5lh273jQGgCcPfck4UPf4WVlnPO3y1C2zXzxwElK92sYJ7Xct9Nu1P90=
X-Received: by 2002:a17:906:6a1b:b0:b80:4108:f826 with SMTP id a640c23a62f3a-b8796aee516mr875495266b.36.1768834590246;
        Mon, 19 Jan 2026 06:56:30 -0800 (PST)
Received: from arch-expert-2026.fritz.box (dynamic-2a02-3102-4ea4-0c00-20bc-7360-f3a7-8f18.310.pool.telefonica.de. [2a02:3102:4ea4:c00:20bc:7360:f3a7:8f18])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fb973sm1099669466b.53.2026.01.19.06.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 06:56:29 -0800 (PST)
From: Anatolii Shirykalov <pipocavsobake@gmail.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	Anatolii Shirykalov <pipocavsobake@gmail.com>
Subject: [PATCH] ASoC: amd: yc: Add ASUS ExpertBook PM1503CDA to quirks list
Date: Mon, 19 Jan 2026 15:56:18 +0100
Message-ID: <20260119145618.3171435-1-pipocavsobake@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ASUS ExpertBook PM1503CDA to the DMI quirks table to enable
internal DMIC support via the ACP6x machine driver.

Signed-off-by: Anatolii Shirykalov <pipocavsobake@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 123456789abc..def012345678 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -300,6 +300,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 		}
 	},
 	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ASUS EXPERTBOOK PM1503CDA"),
+		}
+	},
+	{
 		.driver_data = &acp6x_card,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
--
2.43.0
