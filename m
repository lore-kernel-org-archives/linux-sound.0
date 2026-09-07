Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DEC30EF8F
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 03:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788751061; cv=none; b=tPF+WgSZvBuzP1k0rta1DxHryhLayYA8fGjy9aevJT4y+y+0Ev0ZpIBbaA1egik48cWVLQyX5AOokP4XrdVNZB+vEYZK1NQFg+ZXxptKVaQNQlZdc4WwhkXQ+9VJ6jXqFAMN/7uRTbhoMI4SUtVpPg7eKv2AGYM5oRihveS6VEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788751061; c=relaxed/simple;
	bh=GOgl2AuYHF4o6a4Lhc4SJicPmu0YSPNh3S5k/cExEnc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WTnYMNCaTFkFn5uoQlvGQSHLiTt9FFXWVjrEPvjRFeeHoziu4y2heexNRXUvki1spAcunNrAJfamWqxP9lqqr0Mfxg/wi+1Ty6T7VktSvPtrnKQ3yIQVnH35qt83oO+5VXiQi+onnCed+i5758+1mSjNRZeg87mv+J0kuS/VvbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q/lEizuR; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q/lEizuR"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so3380242a91.0
        for <linux-sound@vger.kernel.org>; Sun, 06 Sep 2026 20:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788751060; x=1789355860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O/1O+V3m/DlTGUY8KpefTzcFfj5+Q1Ib789WR1OBDhI=;
        b=q/lEizuRs5HIzA0qEYhkSxIVIj42h464vhe3+mSED80dO4gn9Ol1IqM6GCI8EYNme5
         LLKdRg9V8WEl0Y4POoHJlmOXi9GZtGRbBpk9GiTBs3Z9LjUB+9WyOL0NodDALI2JrLrj
         2wJyFOGgn4qqY9QahZqbKvrmHDWKV+JYvjhYx4opqKs4gDLAyXYpmWX4FeMwiWyZJSUe
         LDePuF+9t+IbaZ57ORsS4IKgH/otbbOfSTgsLb3cAeVeObPugIMd8p+jOXySUtMs1AYa
         kDVeAdM7NKnmOnMS+p4+zOHQiAIIXew4EToCqePjXI0UToUXrLw88Cmf19aM5nZbjh75
         EaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788751060; x=1789355860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/1O+V3m/DlTGUY8KpefTzcFfj5+Q1Ib789WR1OBDhI=;
        b=AgYhp53lwska1nIhEf18VTXDA4WJSrN38uQImcbbXsvWPK2GqV6eDBwbNTioAmbItX
         iMmB/GFdvEDxX21nbi1iTsz6eqorKwsqdM1Yvh3JTVJa7jspQz8mNpwybErBXVmRVdD9
         BL4WEcLadQP+bCarb7zKcEI/j+MUfaDXgIebBdDz6+7ZbjVcdbbQF08sbOUdaNqqKvoY
         ouiKRMJ/Q3mE69bWg45yHJ0o8SnahVL0hR2dQxMXkZDnCty4MIeT9DgoAo0VM7533kuH
         wMubU54ab6XroAIYezpmPaw8KzcCG9Sq2O89UgTvzgrQlF1thsEWmp+YvPfJWHq3Q9qy
         8liQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsKm1hK9rpsezKgvOGneAfeNRPolabddl4I6rbhN3TM31mrFYBbpUZsUfPQioDqkcknPLM1+mo6gj8Qg==@vger.kernel.org
X-Gm-Message-State: AFuF++nwIC9MvC5FGxVCljzcGEGx8u1OFeifmPujqxfx8qVnTDGpzxUY
	x31beEY2rFviycBLMzWDm19G9o3zkwddKWfdzxSovs6M5h/xrC5OME8=
X-Gm-Gg: AYBFou0WlJkaA6PB/ocyj+m0sg0elXFGPZttT1kE+TKmo5SAxaxP0NvWbui3OAnYSGr
	9GtyMd6HoBRh5XLJRVN1Sdecr7Lch42aiLy9B0i2RHzUoBYay86t1tOTk+mqGs5dVmRyCudmJ6r
	edBE4OJuMCPIsIQHX2RMLzXHmmGm9vi3vFG1F2027iviWkM3GwfaUaLwV6pPhMO7Yf9rQANGmH4
	V+ROo+Up4ITCJmk8EIClj5ig/Mh72XALvGmCXJfaA7HWhETAmBDwzwZ4HhT6+ppAHhF1VyKlR+v
	ILMGDZwHe6SnEkP3adNIqritxFFfcqYWosa1j+49qFFQQV+VPcw7y4AV2a+/ves1nAt7833bf6d
	JG7ObfAYsZWKoKMroZuWY/Onpl1ISKugu0VId+8PXLwveGJRWlDgWPhFnq/lQSNVaFITMBuuZzW
	Ozd/W7wnFCglt/qAo/DGEyTP8Dxk3Hb6zfnlgwAEdb2o9ORTSxxo5jO/IFGPbwcyoB873T3wcDX
	brcubN6nIOC7B1+
X-Received: by 2002:a17:90b:2ccd:b0:398:baa7:4c2f with SMTP id 98e67ed59e1d1-39b27c442f8mr16208923a91.5.1788751059655;
        Sun, 06 Sep 2026 20:17:39 -0700 (PDT)
Received: from Nitro17 (S010660cf843d99e8.mh.shawcable.net. [70.75.72.188])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2a6cb7c8sm5206120a91.1.2026.09.06.20.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 20:17:39 -0700 (PDT)
From: Aaron Welwood <abwelwood@gmail.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Aaron Welwood <abwelwood@gmail.com>
Subject: [PATCH] ASoC: amd: yc: add quirk for Acer Nitro AN17-41 internal mic
Date: Sun,  6 Sep 2026 21:17:38 -0600
Message-ID: <20260907031738.17257-1-abwelwood@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Acer Nitro AN17-41 uses "RB" as its board vendor and has no entry
in yc_acp_quirk_table, so acp6x_probe() finds no DMI match, registers
no card, and the internal digital microphone records only silence.

Add a quirk entry for it so the DMIC is enabled.

Signed-off-by: Aaron Welwood <abwelwood@gmail.com>
---
Tested on an Acer Nitro AN17-41 (board Spacia_PEH, BIOS V1.26).
Without this entry acp6x_probe() returns -ENODEV and the internal
DMIC records silence; with it the acp6x card registers and the
microphone captures normally.

 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 21d7ec0..65c4d13 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -388,6 +388,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro ANV15-41"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "RB"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN17-41"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.55.0

