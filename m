Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE043D1AAC
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 11:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212735; cv=none; b=jFkuygEh1Q+uuKEJlP3fkwbD78nlWyp+ViggcreoUNx+3rir211B5FgfnSbJEI6zJ8d+/vc1pNRrK+AaBiVbhOE/3knc+zxdjkfDCeVkvNvmYiyLq0Jdqq15oP0jNQVysCHKZfAvjHEM+gcIAt16SsG9yFu0oI4qMuF4grqmJ8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212735; c=relaxed/simple;
	bh=tDUnpbPFt+P+NFhZqhtvvPsCEj+cRwFtPU04aN+0Iz4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GvGRR3MHIaVQ6sgjOZkVo/3GxDOpgjOmdL+VvvrPV4axoNWXfRVedNc4Z4U3am1GHks3tdiKLACTKEtot2rn4Gheh/jrZtq6Ujgva8XzZs0hAYSClLNQuI0DcN7oUGFrQFMYB6Y/6FB7CI9ahR0Ox4SYXPUVm+g4b3WYzZcijxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WpeuPjxI; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WpeuPjxI"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84594492c26so618502b3a.2
        for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 04:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782212734; x=1782817534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=srWPNx6RSAy8iTw3xY7l8eauiqNmXu1er/DpOYIpYdk=;
        b=WpeuPjxI2JrpO4HEtF5ojTI2JpQYjHLXIgVkbCb1e90yi78VcYjx+cX5fpjTDk0VUT
         va5LSeXvrl9Z/m2+9R0G2Hd75gRB6urjGAowZHZ9le0IBsy325DZ1X4P9FKr0DIIJqkD
         D5FGhjLTkz0F16XyFLdiyCowf4yk4NOU+ITYs6H2dkks2fvl8MMdkam5rdwlfFm+6kbV
         W8DSLUhB4ekNWP/E9Mq/ZOnOieFKnGx62SLpeHNhpeOH508G9WVQYD+lQYJlST0SDB08
         UrJ+Z6K+3YvPxce0dlTpBqVv0WgV8WhKp4+cj+FBJra/06GLclQcO64w1/bLBU4cIMNT
         cAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212734; x=1782817534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srWPNx6RSAy8iTw3xY7l8eauiqNmXu1er/DpOYIpYdk=;
        b=VDNrtvnKmMdGvPZFlaz0fq/x7GTb28WrnRbJEwZCjYCloz9ojrizuOC6YNinHUMFOc
         s/kB7fdpWCHwSjlxsuHRzbPg6FDsO8H0sKD2sHEP9vbrpYCCF8+d5/XYmVob0t18whai
         yYnQq36bh/v2DGgnMLR1vSVkm9GMBUdQGXT1Sz+qGUtD4ZWuqmcpjAPpLNOih6Hep5A1
         ZU69zBqnZ8wkrq/TNfnhnzBbAsSo1JGTBlAtgUMw6ZsqTVpf3zOaSdnsDpCzEF6r6jMF
         /JjlzpEWheIMvd8PM1MqLv7yFI3cYQuou1UAZnAxy7sishaxPRJYy7GMZ9xf5KB6kiSt
         G5mQ==
X-Forwarded-Encrypted: i=1; AFNElJ9oanFFKeILNZ0FTiDVf58BZxfIlEMRs0AO/1Er0wd8hAdF72mdv9swTCzzbtpvtEpxye920tierbjOVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFM9fx7W9nrXoYjZOIWwyAQsFF1eZ10eNYc89bzQgOrTGiHV6Y
	lfTTXThceV6k+k15cPdpu97Y6LWyTzfmZsRppsEoZXrSUUBBJ3FEAyfb
X-Gm-Gg: AfdE7clgTAWT3J8LUXSsu27kfwHuCBwe6mz8if/D4ds6hstj/btUzdvGa6sFAtm3swD
	tFXDYK7goWzfVLeLH7ktHI2o+Msp+xUHBRYlxNk0BQOFB5Gp/r69TD/J483ULRNZhXTmHBJRXFJ
	0O73+977LmOmT75z9eP04DUm950xE57cCBKVnOZObecU8VnAHVUWssfs5C9ijx7+yYbRN4Udeb+
	AXrlm7xkHZA1Zw3d17rMGlLsyc4S24sdkiKiAicAjOj/RFhfCPWOOtahTiRIgTICEw5CBprU/dt
	SgiK5w8b3o5f6QBKBc1hnhMlMZMzT7lFac73BcmcUlChf7+qZ91T5QeOpWzRZhVHPYdgBMIqdvY
	SkRddxsafr5fACqsdO6yXq2GPtHqZedL2ctRUM4hEp8fIp/4LPOUDEuDJhdwLrC2DM7MTcQXsEw
	PL+dolAUu8jVo7vBcQ3lCdNQdkn1A06G/0COuYzKIVs378sb/KjZOD0x3wuYIaE9iE+n0rIxz45
	R738g==
X-Received: by 2002:a05:6a00:1388:b0:845:4fec:3f8f with SMTP id d2e1a72fcca58-845952fa7ecmr2814925b3a.40.1782212733484;
        Tue, 23 Jun 2026 04:05:33 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d8a7f0sm10762831b3a.13.2026.06.23.04.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 04:05:32 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] ASoC: SDCA: Validate written enum value in ge_put_enum_double()
Date: Tue, 23 Jun 2026 20:05:26 +0900
Message-ID: <20260623110526.813217-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ge_put_enum_double() passes the user-supplied enumeration index
item[0] to snd_soc_enum_item_to_val() without checking it against the
number of items in the enum:

	ret = snd_soc_enum_item_to_val(e, item[0]);

snd_soc_enum_item_to_val() indexes the heap-allocated e->values[] array
with that index (e->values is set from a devm_kcalloc() of e->items
entries), so a control write with an out-of-range item[0] reads past the
end of the values buffer.  The bounds check in
snd_soc_dapm_put_enum_double() only runs afterwards, so it does not
prevent the read here.

Reject an out-of-range item before using it, matching the other enum put
handlers.

This issue was pointed out by the Sashiko AI review bot while reviewing a
related enum-validation series:
https://lore.kernel.org/all/20260609125735.CEB651F00893@smtp.kernel.org/

Fixes: 812ff1baa764 ("ASoC: SDCA: Limit values user can write to Selected Mode")
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/sdca/sdca_asoc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index e76afa396b0a..b4dedba719dc 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -160,6 +160,9 @@ static int ge_put_enum_double(struct snd_kcontrol *kcontrol,
 	unsigned int reg = e->reg;
 	int ret;
 
+	if (item[0] >= e->items)
+		return -EINVAL;
+
 	reg &= ~SDW_SDCA_CTL_CSEL(0x3F);
 	reg |= SDW_SDCA_CTL_CSEL(SDCA_CTL_GE_DETECTED_MODE);
 
-- 
2.43.0

