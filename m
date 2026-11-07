Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794093788;
	b=fJw82EuzN0TdW/bFt52oE6QNm/+LeIhB7bmaIliLbqZ1EwdQ+ChnGH7sjS+Vela+wRih
	 1chFY76AE1BMbc9cUG9WmwGUnrQnbAAYxYn8M044cq9TcTZlPx4XOBYl/tLC8bSSFGB5D
	 aqVMv/ZJJ/WXV/iEPoL7xoLJKaBvGfMgXKyir7PvckuudBVPswyGf9eo0Q1yr0Q+mYtPX
	 tPziQybBNKKkGbgwcxUEbVopM7ioEKbER1ZaJAvYT9jt8VNesqMlBwjRFeecG3zbs85T5
	 Xjv7aaiui/rTBIFPYHXty8xeF5fAIH5Ffbs8UqxLMbZMv/Scuf7kepZqrm5sEckYAkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794093788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BQnpxO6DVLd27PFbl6y8/Ftx0QGbzoZxrHPyWBBZYek=;
	b=HUKN3f3d+iEgbtijTuiIVj/1P2R8zoi/sKsIB32GjTjINFhXe3d7VCTn5uYunft31h/s
	 +xX3sGHIguyWRvAG8xGvGpKUEVNkc5URYj+OafPLcMYVLcezvR0OU1PnV9ldt3yPi2yvz
	 xCUGNKPXA5Le58dNOPPK1rG4M2gDBbq0qe+GAQO6Lhu3Ml4ap29bld9zEEuVhfZjlkyt2
	 Cgm3gCaolJ+9L4Qfv+eVFOWfILH2piY9RFBMXACVnkeHnZiArJqKN0mYlQ0fnFktkTUQq
	 Ss7dwV7rywrNJFTW9fu+n6KJM5TCAnnqmli++zNxRJB013ySe1iDGitZyHLFGmWB5vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ma4fc6eW;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04EF606A336
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 23:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A04EF606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ma4fc6eW
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-85a5455bd3cso32277a34.3
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 15:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794093786; x=1794698586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQnpxO6DVLd27PFbl6y8/Ftx0QGbzoZxrHPyWBBZYek=;
        b=ma4fc6eWvBe5WNjPBf4nw7Pf7ew5XdJn+YxFNYcJYRdN64XzE8uFNevvZywhwJQORf
         nsGpgxERAT93pZfzUOdMucAg1MSbj8nAQ0rZIHCeOB8n3S1dGPR+e8w8wF+2KLfm0TU5
         76tLV18hg0rYLrrPHVzqN3GjUFykngbQ9hWkUb8nqls484qhZvDypz93AEGZOOy7qbbu
         MxUYj+giVcYtbI+81mhXVDIOluXRQ4mZHIewdE2DHiGOkV+fNgwpjCzDVtDPUQDM6AEF
         56hRUwy6EXSDFRbqkCr0slV8/iYr86fkyPC5ahVfxQGUcTtdu2seC+g3dwU6fNzCm+3z
         W8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794093786; x=1794698586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BQnpxO6DVLd27PFbl6y8/Ftx0QGbzoZxrHPyWBBZYek=;
        b=2UpuCn7ID6+UcJe1XPysMN3P2vWJUS+jBaV0qqromS7eL4xGx9fjcJj6UWbPHa7XY8
         8zDpV6SORM1FtOp20GEmCmoUZDxURcAHiA7MHpiY/0W3XsKyz5Xbt/Tbx8cLGn14rPY8
         JTnw2wjWyNNBScn2cp8SeEK+E/qw9FhKs9nV5XW0vHDxltmbkaEGyZIAbs2nUuLR6f3t
         NbuN0LhybrqL5NumXcnr7U5xvv0F9uUn6+1LlRCEcGK72nruAkoDLeFyadntGlRsTVwl
         ykIUT8YlYcr3W4AmSTqi/4S28oNTSGpkRbGiuC5EshbPtVhNSD+dIL/9KYzKQfR3/Ibt
         oFvg==
X-Forwarded-Encrypted: i=1; AKwUvBwUuXCOfdO+nV76AZ0gr3mzIFCWcg4qh+T/vp6QFL/miooDmhFaZPOGr8q/hoVsGnFKaCtcHZKrM3HwdA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8F9bZ5M20Lpgaolepbz1RYLCi6jZbTH7NY/ulgD1MyG5ZuErxI
	iJzphw3VrRNFOCl1rPM67MZcJ2K0pg280/sgxoAZQaiyTiTBLUrAOn4P
X-Gm-Gg: AYBFou0P9mYHgkiLcltXB2BO/CxKotdJp6qmI5axU6rRP0z0/RXNBAQG7wO7PgRAjj3
	psckxF1f4upynYkkSLS7nG9+6/6MVCQnf1YWRbRM6pRqL+EQp8FH2VN4G0zIlx6uQl47faCvcJ9
	Sd+MUfOXbTaDJyPwa85vwhKUfboqALnZ5jJRbHyfdJlXZ/LcYFvvyAF+O5D16AnsdOakSHSeWX4
	E/ori2Tfw2+b+yWqpFWjj5eDruDkjSXJSBgFD0GJ3wQXyi1oanywZMoWWYekC7Qm80blb00ajk5
	L1a9JeyjRdQ0xFd6y68HaBB3J1IY0DfFmjDEkeiGo5f9o4eEzB5NOP9H+64GpZwhAEsOjP4+S4F
	XbD2tcJJa/6o2ZnOPISvLxMFLdaCOE8dkwRoqentvI32dzC56Xfs3SujPwEmQuAhgr4lqI+iuLA
	k7uDk2kiR5Xrg2eIiLEqsN70+NvVS7ALTx7RyBTmGdJacpVqDcoOzsHBubn9rgUr2rS/P0ruiwf
	nL6opaac1FhxxRm9wtHPLvJXA1Ebi/nyYFkD0Zy62eFMnnvi3FGY1W66APP2Xa0oe0EGq+UhF7z
	up1LVhT+UEt2QaJTvPIxzZGL0Iz260ai6A==
X-Received: by 2002:a05:6830:719c:b0:85d:6045:52c6 with SMTP id 46e09a7af769-85f5084013emr174501a34.24.1794093786653;
        Sat, 07 Nov 2026 15:23:06 -0800 (PST)
Received: from huawei-d14 ([2806:104e:25:7de8::2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4f2df8dfsm329315a34.0.2026.11.07.15.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 15:23:06 -0800 (PST)
From: Samuel Leyva <samuelslg03idk@gmail.com>
To: broonie@kernel.org
Cc: Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Samuel Leyva <samuelslg03idk@gmail.com>
Subject: [PATCH v2 1/2] ASoC: amd: acp: Add DMI quirk for Huawei MateBook D 14 (NBM-WXX9)
Date: Sat,  7 Nov 2026 17:22:24 -0600
Message-ID: <20261107232225.3838-2-samuelslg03idk@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107232225.3838-1-samuelslg03idk@gmail.com>
References: <20261107232225.3838-1-samuelslg03idk@gmail.com>
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

The Huawei MateBook D 14 AMD (NBM-WXX9, Lucienne) uses an Everest
ES8336 codec connected to the ACP3x, like the already supported
BOM-WXX9. Without a DMI match the ACP falls back to the DMIC-only
driver, so the speakers and the headphone jack do not work.

Add the system to the ACP config table and to the acp3x-es83xx quirk
table, with the same quirks as BOM-WXX9 (internal DMIC and 48 MHz
MCLK).

Tested speakers and internal microphone; the headphone jack could not
be tested.

Signed-off-by: Samuel Leyva <samuelslg03idk@gmail.com>
---
 sound/soc/amd/acp-config.c                    | 14 ++++++++++++++
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c |  8 ++++++++
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 3d4c8526c..32c4d6319 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -237,6 +237,20 @@ static const struct config_entry config_table[] = {
 			{}
 		},
 	},
+	{
+		.flags = FLAG_AMD_LEGACY,
+		.device = ACP_PCI_DEV_ID,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.matches = {
+					DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "HUAWEI"),
+					DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "NBM-WXX9"),
+					DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "M1010"),
+				},
+			},
+			{}
+		},
+	},
 	{
 		.flags = FLAG_AMD_LEGACY,
 		.device = ACP_PCI_DEV_ID,
diff --git a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
index eb0e9a6af..fb675774f 100644
--- a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
+++ b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
@@ -364,6 +364,14 @@ static const struct dmi_system_id acp3x_es83xx_dmi_table[] = {
 		},
 		.driver_data = (void *)(ES83XX_ENABLE_DMIC|ES83XX_48_MHZ_MCLK),
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "HUAWEI"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "NBM-WXX9"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "M1010"),
+		},
+		.driver_data = (void *)(ES83XX_ENABLE_DMIC|ES83XX_48_MHZ_MCLK),
+	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "HUAWEI"),
-- 
2.56.0

