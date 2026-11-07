Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794088053;
	b=g4lcJttIVVfEtULijtQdXT/ne8HLmjOxE2qJrgKaQ42zDbJv59XMFQ0n7qTOt+uyurFO
	 HHwQAy7sg9/rtd7j4IxgU9cw89aT384AONu0K/zBreWGgIqz3d+9fE1+x0YNei8aJYh7u
	 G1gvmKIou+7ewZHbCbkV0u/sIrFeHap4MjBasE/JW/zyFpyyuR+8uMLiOZFhgG/BYC4s0
	 JGgdEWBebHFHbi2a0UY8YH7bb3yVJxtJLFSimAqHmdX99WtZveqj0JOlpTCtjvQnnuSqK
	 XgVkZOIiM77YAUZMqzg9uYnb0mmR8ZMzkDzgVv+uoF+ndGk/4UdV67jET8o9k2jDYSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794088053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BQnpxO6DVLd27PFbl6y8/Ftx0QGbzoZxrHPyWBBZYek=;
	b=rpa/xvEggqKUTS3Tv8KmVdWtaqqpHJSmyw634BR8rMCuoTAz/gd8d34rO+AZQJen3FcL
	 HA8obevkq5Pk3S+juPzku5ZBQtecy6qgdsxelivRDdwwTFwVYXB6U9+zxAwfeRVLhd/Hd
	 1Q9gaFesUi1nB2IXQFWCbhGOCTmpTpVITeE/Ig3gx9fKn9y+ShyjEIg618OZTridCta9R
	 6bXNKr93gS1Y6MHrAO3eH+JP7Tgj9xtm14jt+zQiUyEGX/p2uOOmMYJmg2jlwmtkL8cuq
	 q1/GnGzB+RDoBzVT9rSbuLGJ9AlpuWn+HfFITMp2T/024BMWGh+5yQlHGxNE09So8nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S+kcoilc;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFA7606A331
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 21:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CFA7606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S+kcoilc
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8490a7d6696so11406a34.3
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 13:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794088052; x=1794692852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQnpxO6DVLd27PFbl6y8/Ftx0QGbzoZxrHPyWBBZYek=;
        b=S+kcoilcKGFI0280YFMRk+NQ2H7HI7WepacwDABzTKVl0SCqQrkm99ya71pdu+lRlr
         UqTxZPXWL2VjtUpEt3CLt+5AdbhOvEdNlhXgu61aN0wAoLzTHvlGhFSLXuGjJXUedKma
         kJ1xVmbKAIJAZaLxl2jNxWn8/srgesDT7Pcg+2+TLHWfaqBexUrR7P8EOBh81qEiTB7j
         7qyeWHYw6fCP1yGJOLuL3CA94xzdpEDyMriJeRsjmzuCWS8BzLvFbLDxDYWSJhG95Top
         YbKvY7tuSIZYVRoOEd0x6vsdc5cw6x0Xh+gWOx7O8fiI8yUdweQYveOX8ziTWsJoeKDL
         w82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794088052; x=1794692852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BQnpxO6DVLd27PFbl6y8/Ftx0QGbzoZxrHPyWBBZYek=;
        b=k9j/+T2kOzBHFuV7eBA7oYK3S9d7vP8kLoefOFEYEQC3jp54h5Qqx7X7CovNnFEq+V
         JalR43A0lzMWwuE3z23teRqmGUsg9Yl0VKLYl8Tnx16twN2zRln6JwWgrXseNpt0xYao
         xXT4B03wvqj5vx8Nn/ku0xuxRNXqmAZ2vPFdeWPP7/Aws9TcU4vyWGiIEmEK2QPI/+oX
         +9Z8qWaoBoXe2hzne463gAPNaj2cqkjKPDgucrWva/8qASHPM+QHkK7fYRYX5Ousg1i0
         0C05YFjYSWTcrnYhjdXN9R9Qx+96JA76aYF5pYKFcbcw/cQ9Zii//oJwS32iCE3s56Uv
         IGdg==
X-Forwarded-Encrypted: i=1; AKwUvBz5T9oY6PWW4f05qAu6SoSjCh90PiaUk/mbnapTT6VTenFVhlbXHcnM9bDqIMuWuGfTGGRcZRtmhmIjPA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/wGhs0762PgWQ/NBSBAGaVpvsseNTRL76hXyJMMOQLaCd9p6z1
	N9I+Tv6TkmUzHIV7bjOKRrpIdsN7YETbTj95NjpXN4llYWB9xpU2UGqn9MxH1REG
X-Gm-Gg: AYBFou0xCTxYEl6BtIsfMNRetHhTwAc/e52uuExhX4KSPRWgsCRjCNGwSVXtHnLQTsJ
	7u6bh7S4gTDUX9OLqRtQaiwmcrRqeu3ZqGLqNB7++nzDiJGnfVKMKwTr5V+4n3MYbtdVkCCWtBP
	7WZeBNrfzPEKdPTnn0xBJbN9fakkbPo0nHXEQkpSoetm+z327K4HgoCHBxEUFICllaiKG395e1W
	xBeOdudrkg5Aji4NWmSIC6y2zKeMSwRRtvrdLq2LFSdK+O/RSwVs22BMprsqaGsdegc6dlu00yK
	m4O7kP2JnYCWeDZRBFpHAYS/Lria6AqIogHp2Hqi7qgwmT7Vh3EPuYdGSUEcGU0Up7dyd/HGn7N
	iUQn5o1V2BPRQWRVjDAy8xtt45bppOoqN9N2c7WK18BBOyxpy45uXGeHGKMgbUpCOdZPKCn6HgT
	bC8ExpNn8joromqqNdDRf5WnXjWrTryMnFPMKQLuIeE1Ftu/CuvCuLFHnHGjEAryZ45aQqIu6yg
	qzngK49PJiO0OV60GxEgINlN71K868uHGR3Onds548RhGJh4jZxKKJaucSV2z3+Tw+dyqVv+/+/
	iPdG3o85IiLyhjKA07XCf1lDc4BaWNhq
X-Received: by 2002:a05:6830:25d1:b0:805:9b38:6f7c with SMTP id 46e09a7af769-85f507d8052mr76511a34.29.1794088052220;
        Sat, 07 Nov 2026 13:47:32 -0800 (PST)
Received: from huawei-d14 ([2806:104e:25:b43e::1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fb70ab1sm159512a34.14.2026.11.07.13.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 13:47:31 -0800 (PST)
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
Subject: [PATCH 1/2] ASoC: amd: acp: Add DMI quirk for Huawei MateBook D 14 (NBM-WXX9)
Date: Sat,  7 Nov 2026 15:47:13 -0600
Message-ID: <20261107214714.11392-2-samuelslg03idk@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107214714.11392-1-samuelslg03idk@gmail.com>
References: <20261107214714.11392-1-samuelslg03idk@gmail.com>
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

