Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03154312803
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 13:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783690474; cv=none; b=YeOn+yPLm1EVL+8sYsA8bSCFWRJ7Ts4Y8vHRLgGdj/FkVAe+QE3AKqlPxF2je/3zspVZqMtvJqcpQhAMdA62sRi/n6jxI2cIfTuJmSyjKPRJpSvugIiTDalMy2EjnnorxuEk2iMjP/Apr+3iN7pQzZ0kJAmiTU5GktuPJvgTVas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783690474; c=relaxed/simple;
	bh=LvPjzFsedN434UCB4A5TrA78lY278R8K7SGr9bAhIwA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ny3kQZnuCOytligU9F1ozStyRvT5Uuo/WKgmlDRJj35cagbDhFGJN3k9Nvgey8iGYzgO70jhjlPQ8NU5q88+KeDJQeuLlb1NmCZekApXXlmy9oz8M4loAHJQiT9hj415hxetaKp8P0P7Cy/KpuOCYwAl36aD0f742nnViHsu34E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Msmzz+wW; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Msmzz+wW"
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2cb3f5bb19aso2963495ad.1
        for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 06:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783690472; x=1784295272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N6aF6JJy2BT8ugCrzwqVD8vsmLg8UrrwBH9MiDodmnM=;
        b=Msmzz+wW0eb99IXh8d8u1DsJEbBeN4XgRrSzH76aSscJgGMDZJGPe1dPxnErfVnaDJ
         0e3pGE+YyshcjleEfINTWk4LVWr2V3S9PH8spfR0CkzwUKn8IU4oMbhSmYj9rtVayJcF
         hoIwg35erF4m7WAT4EVOH2LfipJFZJnLikfv28BSqJanruu7iudMazaHc/vOH7WbOANI
         qxSOng+OiQXcEXNHDDRIFDmZxk3NRpfk5kHcnim0fHZY/4wK/IzhkwUtSKJywpW9oC2z
         etkzQUraGVo9C07cLpoI00euBMEWXc4Yk+GRCbwYCzzRjeGKmmz+LkpANgLW8nYeORgy
         Gilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783690472; x=1784295272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6aF6JJy2BT8ugCrzwqVD8vsmLg8UrrwBH9MiDodmnM=;
        b=O0F53inZ+jC7cJv38okBvQK0dbQPx8i8aldgTAQOhpe9zJMCJvWK9WtwTvRLs5ozRG
         yxrHBCfhHhQPQhx4wi2UNMRCQcUusDf9JcxF801mDPhpqKlIZJFrhESSFEPwbjK6HHbn
         Ki7uiTfLoD0dg9FC0ToC7gK//ObRFNiYlbtjo4QKL5kBKcHT0fZMqEmrKg2A8Qvb2iq3
         TnZxqfvF6FBc1T9IBcI1QpOmV+l/1yNWzjYC85cni8zgl5ZX7RfYviETjWcq7v9Gyyo1
         loe9eKSmnBPVP77rq+VgvK/4kLWzI4mH2amiuBIukveMO9NwFChxN6isHz1fpAxh7O58
         jTQg==
X-Forwarded-Encrypted: i=1; AHgh+Rqi0xBiFKxL/3nspJlPAvCyAEixquUnKsuZNc106dUoLtNnOxq51Dcr7lET+88mn+BVYzZd5dXTWOsqaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHyolJtOVa578w+BrsSnA2S5fuWL9/wBs/a2IR3S9uDJ+/f8l8
	c4NK5BcIUT4PDqEV9YMMssy2wzPRmfBr2ODZcHaYcippxo/rEEldjxk=
X-Gm-Gg: AfdE7ckfaN2EogWe5XcwfhCBBGrsU2jdbZGfryfyg7XALltBNTxX0SYqWlEiohN/pmi
	4mFpR8/nSG9YKO2HWqQQW7exQ3pPj5hSgPsLPyiREO6lKsC5KjvHO9J1YGAf5kLoJ8k21qRiyue
	KJ7oVoAhqwsV4SMawPyFt+AOTFcNq3FLdf+EikEE1Uje6M2W0vE6N5yyleBjGCZ3W0u+0bhj8B/
	W2/mVQZXFyC7pDF8WXyElSzcbGozz6nkz5IVSmA+h6whe95ZLA19pu2FDpKuEqEazGXvSBPXgXL
	XJV7vpJ9Xg1ZybVj1cf46fBJSezLFeDMXcUHj6Qkm2y7R2ZfZ6ZOtLAFz8AgP0TbuBhV2CzsCv/
	OXHpyjAUM2zJ1sx1cut4MwjLDXAl5c8CwM5SLjpM2Pufsu2XAfOmuBEJnk/Y49utqU3uq1+HcX7
	egjx9kb3KG5k8Eo75IfoZ/78ZteeXTzvbSekPN
X-Received: by 2002:a17:902:f68d:b0:2c9:c517:d078 with SMTP id d9443c01a7336-2ccea42e1efmr113080885ad.36.1783690472236;
        Fri, 10 Jul 2026 06:34:32 -0700 (PDT)
Received: from laptop-arch.localdomain ([125.122.235.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9c1fdb5sm59762055ad.33.2026.07.10.06.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:34:31 -0700 (PDT)
From: Chen Bowen <hicbowen@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Zhang Heng <zhangheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Bowen <hicbowen@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix speakers on MECHREVO WUJIE Series
Date: Fri, 10 Jul 2026 21:34:09 +0800
Message-ID: <20260710133409.16641-1-hicbowen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The internal speakers on the MECHREVO WUJIE Series are silent,
while the headphone output works correctly.

The BIOS reports NID 0x1b on the Realtek ALC233 codec as
unconnected with pin configuration 0x411111f0. However, the pin
is connected to an internal speaker.

Overriding NID 0x1b with 0x90170150 makes the HDA generic parser
detect both 0x14 and 0x1b as speaker outputs and restores internal
speaker playback.

Add a pin configuration fixup for the affected PCI SSID c011:1d05.

Tested on a MECHREVO WUJIE Series laptop with board
WUJIE Series-Lark4-LNL and firmware EM_LNL326_V1.0.23.

Signed-off-by: Chen Bowen <hicbowen@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index f7700713dc62..ef868c3d090a 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3942,6 +3942,7 @@ enum {
 	ALC275_FIXUP_DELL_XPS,
 	ALC293_FIXUP_LENOVO_SPK_NOISE,
 	ALC233_FIXUP_LENOVO_LINE2_MIC_HOTKEY,
+	ALC233_FIXUP_WUJIE_SPEAKERS,
 	ALC233_FIXUP_LENOVO_L2MH_LOW_ENLED,
 	ALC255_FIXUP_DELL_SPK_NOISE,
 	ALC225_FIXUP_DISABLE_MIC_VREF,
@@ -4206,6 +4207,13 @@ static void alc287_fixup_lenovo_yoga_book_9i(struct hda_codec *codec,
 }
 
 static const struct hda_fixup alc269_fixups[] = {
+	[ALC233_FIXUP_WUJIE_SPEAKERS] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x1b, 0x90170150 }, /* internal speaker */
+			{ }
+		},
+	},
 	[ALC269_FIXUP_GPIO2] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_gpio2,
@@ -7915,6 +7923,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x8086, 0x2080, "Intel NUC 8 Rugged", ALC256_FIXUP_INTEL_NUC8_RUGGED),
 	SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", ALC256_FIXUP_INTEL_NUC10),
 	SND_PCI_QUIRK(0x8086, 0x3038, "Intel NUC 13", ALC295_FIXUP_CHROME_BOOK),
+	SND_PCI_QUIRK(0xc011, 0x1d05, "MECHREVO WUJIE Series", ALC233_FIXUP_WUJIE_SPEAKERS),
 	SND_PCI_QUIRK(0xf111, 0x0001, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0xf111, 0x0006, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0xf111, 0x0009, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
-- 
2.55.0

