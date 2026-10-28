Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153187;
	b=kfGaivDTq0J/lZB5yE2184x5nz5Q3dt0ytkYVCJ/CyDS7xYm6rSZlACAmMaaxEnQpx25
	 Xz0R2mxgMt2ZzQCoCRh389tpv+FPWLU7uAUMpAv11Hg8xrwdj7dp+5hZPyDCEybWhAOsP
	 jU/rsiSJfqM87RSb8kePONYxBVxZ/F/ULyYGl4KGMmC1pnjz+eq1ZfRTnzcZl+XAWAfRM
	 Y7V0Msp35SjJR528Nauk4SuZqBi5yrFUdEtR1NG4IXiMKoRrbO2n/h+GCFHGLXiFpVq/k
	 HNsU7/YjKXr3qSDfiT0MQiI23eTaP5av70R6A18zwcnCtquJx7Hm2H3qEeJdip2bJFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NfUvuFByTLK/l0arryTu8RPZh9lu/cHP8y6xo8RH7s8=;
	b=AvYf1qB4C7EflyKpPTqyPk2Og8iCtDO881gcoQ6xPifLtIcCG2r+DIU/3C4cp9KJb7GM
	 aIYWfUqOXRkyHStMOaNwLdsAkeL+J+I66Jp4WNMze+JUvXqA0ag/0xlltrbdjtT0zHv7Q
	 k8R2lKv+4ydUUPWpfwVPg8K1+UZofkp7ueaJnblyY+hPUGKUTTQENz2y/UOR+k1Rxu86J
	 HnEteSh2NACpqGbo9zLF9V8t3BpZQEqPkZ0VYzq4fL4oTAk8oJoYVMvHnFBCMXZOGaBXN
	 jrQPOijs/TzUZYgEwcbkfnoiJVcfrjTu2UK6fJ5nu8IQU2a1S7ltfJzuOsDMYbqd8KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j3YmMUkX;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A3A606A320
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35A3A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j3YmMUkX
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6d68de53053so301456eaf.0
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 19:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793153186; x=1793757986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfUvuFByTLK/l0arryTu8RPZh9lu/cHP8y6xo8RH7s8=;
        b=j3YmMUkXPBhxAi9W4Xo7MUa8b+uDEXdI9/j3cVT857afq3QgmmBupSBxTZS7Bcgp/H
         2P0GqlPZrTxqE9UvkRCyDN3KbzMTWrrirjiWu3DCQOaZlmxLpmbqV0RzN05nbyZpktGP
         Z42iphkhGUZHzHcin7zuKbwvAybUfo39uctUB3xtFluBme0KKTHRtfoWU18SWp9F0SDg
         ilWE8BTuCh8z8r9JAYXlbElaMiGqS8lif0AO4jTSMU2cTD8ejixojfPb2/JvDcoJmaSO
         Nc5xHyKf5DQlhUb2npMUoF3LIYCx6cf+2xEYOgSZby/ICLu0QCKbrMTz25yrCxw+I3im
         WfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153186; x=1793757986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NfUvuFByTLK/l0arryTu8RPZh9lu/cHP8y6xo8RH7s8=;
        b=ZAaLXbGUDxTwBEs4W6nYfQnXH2aFhdn2xzyTx21TgVReWykFlZzQBqX/45hmVAbCgD
         ImGO15fHVYqTDuYjJFfWtzHMjaZpRNJRU9NZGdI6/rto7TPRRLF6UKH1MUV3OfdZOTLW
         A8oxsjlBFqQo5VoAnviGnuu3YMVrBt2PfHqF2KwJBeie9TbPXVhrPWf7WqYd/l4mq6Zo
         rH76Qlr0jf4bvzR3ZnR9P6YcYAuj7X7P8S6HpVcD4O9PtEMAfr4Sr1vAnBgpn4yoqcjh
         xJA+Aqp4hAGXnXSq4Pqz+oKhEBKP/C+8+DlB+2YXTU6kOIACR1+NxvjptVolNynDjFWG
         q3VQ==
X-Gm-Message-State: AFq9FYJdCwWZUNqFMrBdIxfFlLmKNlsCPPpU7bHbUFcvmhgsUh6FD77j
	q8aCb2k23KuuyNHr/cBWTcYb9nOE0Wt1M3qtnaSUtYs4eVee3Ad8U0Kw
X-Gm-Gg: AYBFou2TtbLO6d96ZlCck6I5VftDfLFzNAZNrKj08Nm79b/v4t7pXi9h24Jpmx67qgX
	xs5QRZMe38lCpDapDBq9sW/7a/GKONONawbdLVRq8jyFYLqLWiZE4pbPzO3raB/oFq3+71zt4ed
	XS+vbHYok6tO68Rj3cae7d7jaByOYA9pkv7prRWf0vdVwRWEPJM0pWnsfVuKaN6RG//e3vUqLuJ
	Ui1MrtL2lgRFSFjmuYeZalI6tSmSg0ZZU2WeXlh66wEzhem2J2fCLKIl2zl/lYaJ/z1HIkWfG0f
	Y5qZQVlKbAlg1tNBxNUc3fx/Q2dqbtHWPAB6ISINwoncRycsbVDR57DX/jO5PSTvEe8mcEYmlOq
	YDs2rZo345shB3ulEnEosZ2PtVzMTXOT9Nwqregc7UZUys2dfMcPu+kR8rymw8d2FtoWBfYoABj
	nhhPkK7ofAbYY/IlqKtYXB7gsk0tDxCEyLjCw6krVWqRbGKB0l3MaSPGAOjG/5cMxxPbk2tKK9U
	lfP8sumshuiKNJHMAzQhXqNJfXN/BTJRfnz2fP4xM0kpCsQB2y95MYOeNgSZV+Kz2W3npdiv4+u
	Rve02ZaId1pNqNKRRc1KY7aUqradmKM5TdCB51GX4IECIS0n
X-Received: by 2002:a05:6820:1caa:b0:713:da3b:9052 with SMTP id 006d021491bc7-713ee766d1bmr540817eaf.31.1793153186177;
        Tue, 27 Oct 2026 19:06:26 -0700 (PDT)
Received: from localhost.localdomain (162-233-222-157.lightspeed.livnmi.sbcglobal.net. [162.233.222.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b1d363390sm355217a34.1.2026.10.27.19.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:06:25 -0700 (PDT)
From: Corey Smith <corsmith@gmail.com>
To: corsmith@gmail.com,
	Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 5/11] ASoC: amd: acp: add ACP6x (Rembrandt) SoundWire machine table
Date: Tue, 27 Oct 2026 22:05:46 -0400
Message-ID: <20261028020552.35278-6-corsmith@gmail.com>
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

Add an ACPI machine table for ACP6x platforms using two RT1316 SDCA
speaker amplifiers as an aggregated stereo pair on SoundWire link 0.
The HP Dragonfly Pro ONE (board 8A7F) exposes them as
_ADR 0x000030025D131601 (left) and 0x000031025D131601 (right).

Assisted-by: LLM
Signed-off-by: Corey Smith <corsmith@gmail.com>
---
 sound/soc/amd/acp/Makefile             |  2 +-
 sound/soc/amd/acp/amd-rmb-acpi-match.c | 63 ++++++++++++++++++++++++++
 sound/soc/amd/mach-config.h            |  1 +
 3 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/amd/acp/amd-rmb-acpi-match.c

diff --git a/sound/soc/amd/acp/Makefile b/sound/soc/amd/acp/Makefile
index ab5f9dc..0b9954b 100644
--- a/sound/soc/amd/acp/Makefile
+++ b/sound/soc/amd/acp/Makefile
@@ -23,7 +23,7 @@ snd-acp70-y := acp70.o
 snd-acp-mach-y     := acp-mach-common.o
 snd-acp-legacy-mach-y     := acp-legacy-mach.o acp3x-es83xx/acp3x-es83xx.o
 snd-acp-sof-mach-y     := acp-sof-mach.o
-snd-soc-acpi-amd-match-y := amd-acp63-acpi-match.o amd-acp70-acpi-match.o
+snd-soc-acpi-amd-match-y := amd-rmb-acpi-match.o amd-acp63-acpi-match.o amd-acp70-acpi-match.o
 snd-soc-acpi-amd-match-$(CONFIG_SND_SOC_ACPI_AMD_SDCA_QUIRKS) += soc-acpi-amd-sdca-quirks.o
 snd-acp-sdw-mach-y     := acp-sdw-mach-common.o
 snd-acp-sdw-sof-mach-y += acp-sdw-sof-mach.o
diff --git a/sound/soc/amd/acp/amd-rmb-acpi-match.c b/sound/soc/amd/acp/amd-rmb-acpi-match.c
new file mode 100644
index 0000000..9802efc
--- /dev/null
+++ b/sound/soc/amd/acp/amd-rmb-acpi-match.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * amd-rmb-acpi-match.c - tables and support for ACP6.x (Rembrandt)
+ * platform ACPI enumeration.
+ *
+ * The RT1316 endpoints and the single-link layout follow the ACP6.3
+ * tables in amd-acp63-acpi-match.c.
+ */
+
+#include <sound/soc-acpi.h>
+#include "../mach-config.h"
+
+static const struct snd_soc_acpi_endpoint spk_l_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 0,
+	.group_id = 1
+};
+
+static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 1,
+	.group_id = 1
+};
+
+static const struct snd_soc_acpi_adr_device rt1316x2_adr[] = {
+	{
+		.adr = 0x000030025D131601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "rt1316-1"
+	},
+	{
+		.adr = 0x000031025D131601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1316-2"
+	},
+};
+
+static const struct snd_soc_acpi_link_adr rmb_rt1316x2_l0u01[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt1316x2_adr),
+		.adr_d = rt1316x2_adr,
+	},
+	{}
+};
+
+struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_sdw_machines[] = {
+	{
+		.link_mask = BIT(0),
+		.links = rmb_rt1316x2_l0u01,
+		.drv_name = "amd_sdw",
+	},
+	{},
+};
+EXPORT_SYMBOL(snd_soc_acpi_amd_rmb_sdw_machines);
+
+MODULE_DESCRIPTION("AMD ACP6.x (Rembrandt) tables and support for ACPI enumeration");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Corey Smith <corsmith@gmail.com>");
diff --git a/sound/soc/amd/mach-config.h b/sound/soc/amd/mach-config.h
index b602a98..150bab8 100644
--- a/sound/soc/amd/mach-config.h
+++ b/sound/soc/amd/mach-config.h
@@ -22,6 +22,7 @@
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_sof_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_sof_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_vangogh_sof_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sof_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sof_sdw_machines[];
