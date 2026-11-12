Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794516335;
	b=ryoGwoN9im0POD26ZHHj2gLHe3V5dLP6atrV3WiYt6PfEPG2krszcwmjTRi6rk9cwjhd
	 h8FSY1vRP9Tq5qpcvmtEbwx45xFGhgTxJeCvAO48vK05e0woHiEzyHEv+r1LT9L+VA+yC
	 L+hE1QwM6Tl0HOtQs3pn05bYi2JE57hXWujF3HrZ/9a3YLG4aAfSWdJ7yfgvY8Exde94W
	 7MC06sxH+61l66nnc0sfqnmubqky1hqBt5iCb3fBtQZS4BmBtGwoer4vMt0ld+tvN7EJW
	 SkylRGyTbTSY6+ncCii/HY2ht25enGo1MKSi9Q2SrZWdgaDK0jtLNcLAN119E6eZWAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794516335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Yqx6DsUclXi+OHVjns7RkQq8F++k4NcXoQVKPQfimpE=;
	b=32fLB7bT137gdTfxQcO3VZ03dtJiht9UlOy7FMLHHlg/FBdYrY6QA/rNxbOoJOVdBJvv
	 Ad9Mp8yY86yINMe7Mg0+bEQnVMWykUvUR1QDjbvzyMUvHwtQcjo5byqg/K/68jZCkykIv
	 1PkylX9LwJYwvm3kDNaFsn6+vQ7uQnm/db4unGPzcucCMEDRLfBVwtGpGDXmzAzuRLv0/
	 MbCTWp5iqtStHFxqGrOrXs0rJ021UOD18JYwqhJHdKt8LN8ILodh5xpKic4V53OTb/7IR
	 B998O3d3RF2C8eYZEO0J4Ky/pZe+545gLXRKWPZ8q6kMEAvMNZ9TVqD9YEdPH4q82oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=flNFuw+O;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D05F606A332
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 20:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D05F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=flNFuw+O
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so1752645e9.1
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 12:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794516333; x=1795121133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yqx6DsUclXi+OHVjns7RkQq8F++k4NcXoQVKPQfimpE=;
        b=flNFuw+Oe7caBoEotRe/EPdYZkd7AjWnpCMMSANsoCokyNv6RqDIQpBXUCj2njv3WK
         2xR0PI9NLFOj/0ob9wr6Yqwp4Rr21sEPqTQr5UpBe7m6mA+380RWpXxeQmpKV0k3S/Xt
         QZT5z/3CU6Xw38wabpE9XwW1m9Z/cvIEFm5gcyeChhyTeBAmFEG1UaLPn3X+Jw1nMNxB
         Xn3PPFcSxbyEe7iCDGpsbmvxG6lUSxyWIA2Ht7ObGm2unNs/b7/OFZQ91SHBCzMfudpp
         sS3LtMKkVXT1jpWhXCoqfXoZmOuP4BWe1mSYXwQ/ajoUOXoTNHhUoG+tWocOpRFtizv+
         Yh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794516333; x=1795121133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yqx6DsUclXi+OHVjns7RkQq8F++k4NcXoQVKPQfimpE=;
        b=dK6klQD+JrJRzsNj5sKWrXZ9dC1p0WyuHIqUQxusDWArn3eBbMrDrfSRag8w3r4a0O
         jVzXn0c2cUAJWcobRKFA/iGiFxpZpTntK/zC1bg0QjNvtKKzhUmUGkehCnkE+uTTWcKa
         EJ//gWf9SZIuXHmhOQ+yzcZTF9po8a1vQI8V4eFsaj7WZgTSX1e5MeqU1ejq/hMjZ7Of
         JdyhnYpT98AHOr5lV53qYM+/C/cYXLTH8WSRyKQgeu1KIt2sL07DVg5SCdPeMuDIxkP0
         sjqDQ+o455Nb8a1LvZSAjHH9IMpjWS3OJp+BotniGzGkUkymH7IaUTjlslyLHipMvuZk
         8uAA==
X-Forwarded-Encrypted: i=1; AL+hErH+cdgqLVVGkXkFy60/GfEEhc/O4uSX9s7VZA7mPYa32osNkix6pCYkk5JRoCtUXkMvyWWDNP+96/Xkxg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+tKzUnN63ZtsK4aXMkxgL4U9BTmPiTmX2WjLFB4BdynEiyOzc2
	cA7a4HMhbQw883gJrlzNx1/HI0tlXT0SzCnZ6xp7HblWFvGnyb3hYBvh
X-Gm-Gg: AYBFou12Y7g01jKX5CvETIMJ5EDPoxLlPwvqbMpTE4vQxWPKDpJKZV2D7oPObL5SV70
	QDFf1plw2OMQStcKqtAeML2ZsG6T3Fyz817FDJ9U8ctev6Zh2IwzrNVn8w+AAobZFdVCDokrLtz
	I3lZ1T5ur+q3ZppEOdChKOqZdjmZ09fya0IdYy6tqrNv8KLn/Efweian2HNRpeNx7H/YWz8jo2s
	WaGemx1vwfOxwE5HzROGa1tzv+Vl9uIZT5119DEyxGYRUSDjvDV3XWCU04MB55eI3zgXblWlPy8
	QV2oGvA6p9eLqFzpo+OI1OiJLvLezbJQwNMCOcXGE9fBrS10n/LuTzOaoFbvu5BVs8KzLQjjoxs
	nujl2pOOn2VKccwpBwr6Rur4LkvIRy6SflBPtlj7iTpNS9rX04K+90ccBvu0sEbEKM+Ye4L7iv4
	y4jhM112ftMZVaLs7Yw8DKeJB9+jVkpf/020m7jpJJICemxmcN5+Dd45kiMcmDOdpg7y1xzAQLz
	qRTJCprUOr6hxwxWluYSIPlUiOSYAmD53C4K0vcwtaCGYskP0kwJzPrYthUTBmmXbyq6cRi5IMc
	S05ouCDBdRw25Dn6KGkL+S5PvfcSorvF026Ut5V4Hs5MTCZvWHJvjK4VAfFbdMEB3RnDlijfo/o
	MdtU7EAFoHEl2
X-Received: by 2002:a05:600c:4ec6:b0:4a3:2f35:38aa with SMTP id 5b1f17b1804b1-4bb55a93ab1mr7495085e9.29.1794516332680;
        Thu, 12 Nov 2026 12:45:32 -0800 (PST)
Received: from LG-gram (117.red-83-35-151.dynamicip.rima-tde.net. [83.35.151.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56689bc2sm1160885e9.2.2026.11.12.12.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 12:45:31 -0800 (PST)
From: suso <gmsuso@gmail.com>
To: broonie@kernel.org,
	Vijendar.Mukunda@amd.com
Cc: jaehoon1744@dankook.ac.kr,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	suso <gmsuso@gmail.com>
Subject: [PATCH] ASoC: amd: acp: Add ACP70 ACPI flag override for LG gram 16U55U
Date: Thu, 12 Nov 2026 21:43:25 +0100
Message-ID: <20261112204325.4696-1-gmsuso@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The LG gram 16 (16U55U, AMD Ryzen AI 400 series, ACP rev 0x72) shares
the same SoundWire audio hardware (RT713 + RT1320) as the 16Z95U and
requires the same ACPI flag override.

Tested on LG gram 16U55U-G.AU85BN (PCI SSID 1854:057c).

Signed-off-by: suso <gmsuso@gmail.com>
---
 sound/soc/amd/acp-config.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index efd664e1c34c..93c9a112240d 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -154,6 +154,13 @@ static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "16Z95U"),
 		},
 	},
+	{
+		/* LG gram 16 16U55U (ACP 7.2) */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "16U55U"),
+		},
+	},
 	{}
 };
 
-- 
2.56.0

