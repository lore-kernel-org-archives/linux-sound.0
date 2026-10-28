Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153194;
	b=jPju0XJKSz7V5IRkZRm1uBLdA234o+NFrWJ73WAtKUHifQMO0aOzxROKhS/+REjhXjXQ
	 vhLDwInRuyTbqQYLiSjbm0MUp/S8ivYcVGLYcllneStgunaYo7mNy2c3EW/LroD9lYxrV
	 OFxnD73A+W9aQaOE3fcMDPoBcTnU4rIBERQfoWfEvSfX4tThC261+8x7Y6uwVTxBXfZh7
	 ticNZ0FvkWbFvrfac5Bd7RzVaPkdoT8u5xYAFqGfN5CaWrhq4faW6bsHCvwl0/m+MKBxG
	 4ehayy6Q2eeM1j+nyMpkAIHyG8Dfh16M68bdCVeQRqHSNde9lwN3qSG7Ch3+M6XmGIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cYWV7ECkHQYswdgEZXeMyVwwzpRqyeBelZqFEBmxMJ8=;
	b=O5k/shTq2zH10bX8rpp5Y2GkWo2jezLnZ/JXoNfHbaq8XwPV1vMcqB4RngKIitw6g6PW
	 5p2AHmv/dkpzex5XK1LQ5l8AG8vsLreKDDmVgja3/v8axoI5IFS72/Ln5MseDvWeUl6Ck
	 zXjARg7FbhQPueLoVnKGF+VniBO5sO+CqAwDbzLHwWSqgfY0R597arAZCYt5koL8cA0Gg
	 zus9b69zrNPpUv1dI4Rts3kVQEl4s1rKH4LtOlvhJSCaj2SlgaShrZaE86oxtrRXwxHaI
	 5VDO/OH2oLNXw5X6jCCmzLRervqyoCLKAulPWa4GjGeq7fgTd6btIrXaz+H3QktSKew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W+WP09I9;
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE90C606A31D
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE90C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W+WP09I9
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-53ec9237600so321392b6e.3
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 19:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793153193; x=1793757993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYWV7ECkHQYswdgEZXeMyVwwzpRqyeBelZqFEBmxMJ8=;
        b=W+WP09I9Ah6Qx9vsN+CkCrJqqCFRksH8p7pqovEFXOhlhvHB7oBNh2d5grNfIZw9Oq
         uj3jWEqUlyM2u2R0nXz9LxNaupnmu11qIn7LjlN9nTaCv3Yhy7/FpMJReDz0XlOdR/uU
         +v6Gsdcm/moytFmJk4Laey6GgK5F0qEami1Phw5L9fcwd1qO3MdDhsP1uqFGvyOp66kY
         AYrNoWHZwr0DoaFwysB3au1efltfHiG3aOJrJAu/Jtk9ScVEstboouvl+eN9tsRetVj/
         3e3o56xMimscQNxJa0f/RJ5eSRSz6C2vaZDH5IP193wEneWwLTZg3ZyFERqbdzez+vdD
         rZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153193; x=1793757993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYWV7ECkHQYswdgEZXeMyVwwzpRqyeBelZqFEBmxMJ8=;
        b=znV9/WnksYiJ1SBZwomDzP2k+vWuqussVHKVs+T0GEXVogLp29Eyz2yPxKuI0tV2rB
         ZmZ5BTdq3cTetZt8+Gs6WM+6hyYTpNaYIQTZ+zZEzCHgmoVMEei3uUZ0WnRL1qwp7hhR
         QJT7EvQrRA3VimrmTXEe3MX4rWIvB3/BK1ZY0sOUmSS7CxPPOpvNI62K4expmhUqS14m
         fqyYcgKcJIkJ9O5iRqrM138Z2h7TphHz1DZqxPeCOkayXYa9upNwhkbpY43lfjbAIxcz
         G6FyEyAwswiePlunOycKRIB8Xxo3sEGnQT9LPu+dGXuQzLB9YujnRB/gaN/UxMEgQoJG
         7upg==
X-Gm-Message-State: AFq9FYI4LPn7JukjAKV/B4xPehc9IAu/BnEiaH22VgZsIdRYOB2yh331
	aW77rPx7nRY7wFoh/TAZMFMGvrH+JccwvT69JKk78g96FO8gvF49/7Fz
X-Gm-Gg: AYBFou1eM+ksMRCcQYF1HlL/jCDPitXmJ7nSzYfFBR3ub8nsCYjCnCXjWyuKJUF/Z8T
	Lz8VzYOkEup9GqExvqeI1qwYwNLjYOCXCTfAbLhas58w8HEJWC/IhxEGTUhcZK3YnIqVUjB3+/C
	g/PlHz9Z5AFHFr7rdEAlUh3LCZJiV5NHNReuDYhJ0pOUyk3Eymn5ZK2OGS/FfdIxIuXYxSJs4Bi
	bneh8AQDiWHd8/gOMYwTXVSs9TryPsne9PdmQRHQy6tti6FAqrF3xLaNmm5sAEM82ykzqVHiDoU
	6CPgzp+M2mQy65P6psw4DADDht0Ae2RdwT0scz1i62hEOiUU27aykSX7nOwqZTJWXxMd5YY6963
	fkKrR1vRrthpzJB/wZo/thnGgBbf45724roBHwLAL6+uP3IeueP9+L7vZW3XlUOprZCiPBc+b/S
	CP1Vw7jrmVenNz7RbxBQTfRFJimOoL6ARLxODqBjbVv7Cq1gbGfVWhMUIIaa6h2TGMa7fAub9Vi
	XhzTq/OM1d3bicZpQjniD2axLFSVdysDcSVi5DW0ukedbMzjr3PoEJw950tIN+78hbpwCu13ZhE
	2M+QgEbYvZdZN2rkVQuoMk2QI1dYDOQiRtr7SB8YfhwkelAv5wVj9S3mijTmDvvV2Zq0Ahmac+Q
	DC+Kcr3mJEYzSMaq4zBie9Q==
X-Received: by 2002:a05:6808:179e:b0:4f5:6fff:3ac4 with SMTP id 5614622812f47-563a2b48631mr429927b6e.41.1793153192787;
        Tue, 27 Oct 2026 19:06:32 -0700 (PDT)
Received: from localhost.localdomain (162-233-222-157.lightspeed.livnmi.sbcglobal.net. [162.233.222.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b1d363390sm355217a34.1.2026.10.27.19.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:06:32 -0700 (PDT)
From: Corey Smith <corsmith@gmail.com>
To: corsmith@gmail.com,
	Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 9/11] soundwire: amd: accept the legacy mipi-sdw-master-list property
Date: Tue, 27 Oct 2026 22:05:50 -0400
Message-ID: <20261028020552.35278-10-corsmith@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028020552.35278-1-corsmith@gmail.com>
References: <20261028020552.35278-1-corsmith@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rembrandt (ACP6x) firmware describes the controller links with the
legacy MIPI property name "mipi-sdw-master-list" instead of the current
"mipi-sdw-manager-list".  Fall back to the legacy name when the modern
one is not present.

Assisted-by: LLM
Signed-off-by: Corey Smith <corsmith@gmail.com>
---
 sound/soc/amd/acp/amd-sdw-acpi.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/acp/amd-sdw-acpi.c b/sound/soc/amd/acp/amd-sdw-acpi.c
index 0160b0d..85dc1ba 100644
--- a/sound/soc/amd/acp/amd-sdw-acpi.c
+++ b/sound/soc/amd/acp/amd-sdw-acpi.c
@@ -36,9 +36,18 @@ int amd_sdw_scan_controller(struct sdw_amd_acpi_info *info)
 	ret = fwnode_property_read_u32_array(acpi_fwnode_handle(adev),
 					     "mipi-sdw-manager-list", &sdw_bitmap, 1);
 	if (ret) {
-		dev_err(&adev->dev,
-			"Failed to read mipi-sdw-manager-list: %d\n", ret);
-		return -EINVAL;
+		/*
+		 * Rembrandt (ACP6x) firmware uses the legacy MIPI property
+		 * name "mipi-sdw-master-list".
+		 */
+		ret = fwnode_property_read_u32_array(acpi_fwnode_handle(adev),
+						     "mipi-sdw-master-list",
+						     &sdw_bitmap, 1);
+		if (ret) {
+			dev_err(&adev->dev,
+				"Failed to read SoundWire manager list: %d\n", ret);
+			return -EINVAL;
+		}
 	}
 	count = hweight32(sdw_bitmap);
 	/* Check count is within bounds */
