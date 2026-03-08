Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642BF16F288
	for <linux-sound@vger.kernel.org>; Sun,  8 Mar 2026 15:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772983135; cv=none; b=DE+Aw0Dgntbni2snf+enCXb6xlR9xLs1g9k7eOy2P+Al0qgnsAG6e1ipcyGkgkj0SIm06jlkZSOXaJKWwX4vDkKYrfa5mpPcJfbmaNNO9T/I1955bjIR3qsoGs3+nNKuZvm9vf16Igmv9ix6l3noNA/3mGAcFi9e8cTMlzcjvxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772983135; c=relaxed/simple;
	bh=RMFqJj7zB32V0mlvLvue/OsQFSKYVlKnOLllzfzZn/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nh9rddo9Dgk2NT1gOd/sEbUs+Vyl8wAizuDYFfmav1vtfvoQn8N4KwYAeahnHtQ3yx9+843mDIjnvDSF761FQCOT0gH1Gv9JD1puKQv4rK7HdGnBaz7CqFuny0r1YTJdL63l+H8mCaTFhRBCaFUUFoA/um7uHLZ4dH6kUDdnMK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3gA++Hj; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3gA++Hj"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-823c56765fdso5386226b3a.1
        for <linux-sound@vger.kernel.org>; Sun, 08 Mar 2026 08:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772983133; x=1773587933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YxXeNt2CQ3TG4EfUk36B0Jqxz24fdl+qGq7DVkkXee0=;
        b=R3gA++HjIdpgMIipXDCqxBJdw1nrLn67D0apwAZOPQ/RONvBwekHSteIhFBM+VMbHN
         nQnLhyR9gdtOfiDdlUsg8lhVLnTTUFhu+gIv6UQMzOKEryNUOhB/xazq1b9eb7rr5m+S
         flBmeCzFQvOfr5LTyOUFUasekZShzXJjq9wedmeUjJZCLMNzjVmpifSa63okSDvrxlHD
         /2jodEWotJOGw/5lH5JhI8en0NxEJofBHN7AYxJxaPeAdQnrg8Wd6XZrJzC5j+RhMOUf
         WiTDy9gjVL8y1LSCLoC2Vcd0lMv/ITOU9hEqiD5d1/AJYqaB+5snHdtzHCxsToPPQTAL
         7wEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772983133; x=1773587933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YxXeNt2CQ3TG4EfUk36B0Jqxz24fdl+qGq7DVkkXee0=;
        b=Q5WrX7/3TgcqE+CLxjwX5ttRVWMBJcc0uwtvOwma+woXXKHZfLrb7z0bn6bA9Cqvyr
         KjC1vfgYRMnuajdb3bVfgW0rJGcSKBPiw1WK3d4EoyM0sdRVUwsvar9YVhfWrzHueEIJ
         3+vrT+OIbYnjBHGD8rkgAvJZj3WzMqP7f2Lt9thCxILGaODUoD+3X4c3/6wwElrCUt/w
         kkVrn8KWc3ZygZMDuj59pnvCbJ57oWEdHGU2v+6zZoAhwxPYQj8KaKTeKpq+t1zAxod0
         pCbD33FY0NABC83gt8jcd1qHLxBxo7peg0pYrKeJh1PiE0OF9MAA23wmSP2sHn8bFLpc
         MWOQ==
X-Gm-Message-State: AOJu0YxE5W282L4yNFpInpH8bR/uqRzA6hYFt/mCG6G48oQQYQElT1Tj
	HzsIqOAfpQv4TJ7OZ8kuT40Kuzdehxa2ex7l9AjLf4DI5myacwigUXZKaj33j/OmkDE=
X-Gm-Gg: ATEYQzztUyYTBf73HI7pr7inRBMKEKJTjyB1WoQwSJkcKzcPCeliLCAOXjJK1JfwiBV
	PNRDlrVvt92nP2SgtzkijBY0AsH3k9MFhTwbTO3FyM0/3BqigLlaMkW6tImWV+wWwBdS616CfvK
	lMV+AnQZ/Jcip6pj37CeHhauD+sQGeDzGfiX27PEQl7kvMLyHftFZKLulpuxgBPe3YnE7AtqkFV
	2o8LHIvVdei5ZqkuS/wUxRh9bqe0A/6pv6fAfvfIznuqf21+ppozpDkc71KBO92MG8h+HSNuei7
	RaEY186BR/sURNDCRtQzW7xF+qw2HvJvTtz7x8tvJ0AF5EH1avzmY226/eq9OQWgDy7lBLk5kkq
	Lg6NyQHITKFbyrRbecXIJNgpfxOFIU1VBBNig77kB89UOtHphS7u3ozXdfZFMaJaLeaYKt1wjLI
	d+q55xV6EWc0mzfw==
X-Received: by 2002:a05:6a00:3a1c:b0:829:737e:7d77 with SMTP id d2e1a72fcca58-829a30d131dmr7845818b3a.66.1772983133366;
        Sun, 08 Mar 2026 08:18:53 -0700 (PDT)
Received: from px13 ([218.155.71.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48ddd18sm7432513b3a.56.2026.03.08.08.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 08:18:52 -0700 (PDT)
From: hasunpark@gmail.com
To: linux-sound@vger.kernel.org
Cc: Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	Hasun Park <hasunpark@gmail.com>
Subject: [PATCH 1/3] ASoC: amd: acp: add DMI override for ACP70 flag
Date: Mon,  9 Mar 2026 00:16:52 +0900
Message-ID: <20260308151654.29059-2-hasunpark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260308151654.29059-1-hasunpark@gmail.com>
References: <20260308151654.29059-1-hasunpark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hasun Park <hasunpark@gmail.com>

Some ASUS ProArt PX13 systems expose ACP ACPI config flags that can
select a non-working fallback path.

Add a DMI override in snd_amd_acp_find_config() for ACP70+ boards and
return 0 so ACP ACPI flag-based selection is skipped on this platform.

This keeps machine driver selection on the intended SoundWire path.

Signed-off-by: Hasun Park <hasunpark@gmail.com>
---
 sound/soc/amd/acp-config.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 365209ea53f3..1604ed679224 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -23,6 +23,16 @@
 
 static int acp_quirk_data;
 
+static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HN7306EA"),
+		},
+	},
+	{}
+};
+
 static const struct config_entry config_table[] = {
 	{
 		.flags = FLAG_AMD_SOF,
@@ -186,8 +196,11 @@ int snd_amd_acp_find_config(struct pci_dev *pci)
 	 */
 	if (!pci->revision)
 		return 0;
-	else if (pci->revision >= ACP_7_0_REV)
+	else if (pci->revision >= ACP_7_0_REV) {
+		if (dmi_check_system(acp70_acpi_flag_override_table))
+			return 0;
 		return snd_amd_acp_acpi_find_config(pci);
+	}
 
 	for (i = 0; i < ARRAY_SIZE(config_table); i++, table++) {
 		if (table->device != device)
-- 
2.53.0

