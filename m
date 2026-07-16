Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0FF19E7F7
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 10:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784197048; cv=none; b=EdX9R4ZkHn0+2dLm1uwop8MNu2KbqDkQC/clhwjXf6/omVdEIMARFtVDiiLD9qGeu/aMB1nvWQ5IGj5Gju4FTsVnsqE1gRsuqZhLehp1jz1p+zuJa/wPsGpextr0MmqW8UNntCgCF1t9snjKLtbiPGaAFmTdGP3VVj8zpJibMgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784197048; c=relaxed/simple;
	bh=r4GsFiu1B3MCdIPDEcn2b4Y+/u7ll78qtKpheeu4Rw8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T0GBMSLo16r9dqyia8dufDg9vXe/OtVA2dJbZ+2zDIetqoF4un6ST5lP5v6aJ8SQxQpRp1wFH25Nmm1VbbciyTkTgdttqYb/v+0CQuwbABDydldhEPW7TvT9pnxQpUvbI8HnOu2n+YvGjSl/Dk4lmFVK9Jw/KksjbR80KUdPWDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cO9846z3; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cO9846z3"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-caf5fee4196so1157703a12.0
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 03:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784197044; x=1784801844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ZK1cMz8AWmiks7Osu+EKy3oURGgR9HGDz0uwvDH5IE=;
        b=cO9846z3vF29waqM646mijFZEgkfqd7kvFWTdhLMlomKSVphCV63Hb8TzI/3HoSeZi
         Uwpr67qySlcXgLDL+HE/NcigOTaUfp2ainAO6VZZyAAE1WgngtFjs2Z4YWfIf/8PWUrw
         uMhO2i1cQbPzfqSGZGRuzaH4A1wz+nMTrUlDKxrmHY2Uxycaay+N8Ushe8ingoeDnt+p
         pvWg6H83xGzDta+Ed/h+sGZ931py42Y+d2pkEsPYyvMjxhODnxcRZME63edz2gwMvZVk
         7hGG8ngPkNBH7//+HWjklUMP+CNj3l6pLFqVTdayC88toy1AJhcdIXBI3KC3UBVgqgqN
         WiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784197044; x=1784801844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ZK1cMz8AWmiks7Osu+EKy3oURGgR9HGDz0uwvDH5IE=;
        b=CkK1fvYGukyl+xXnYYr8z3zZTwcoMby5NAH5zPlmQIzQ9Rl5v/WHEsYYrVXJ23vcgP
         lfbPkgn7mXBo5K05FcxVQJ+LxVDNHCIlHNz4qidxr718GUzgoTd2tjZT5HW7HXun/0jY
         m2Fw4x6FxMnDMl8OfqiKtUqM/pN7JF9/oJNZlDIOW7PIZL8ZTIvYwgx/sheQcCd0C2At
         g0KlQqfMNuKGrIvNBpe/fKazbjfjBPRYbU9vOuTq7H6oGRUq2yumINcTeOmy2c2AKeGD
         K9KVfrd2QRFGW0LKnmVS02QD1ibYbgziytU/FCFF9mblvGsS4Q5yzbH6N2rcHlRdk/et
         9YnQ==
X-Gm-Message-State: AOJu0YwXl1PvozWWQMIC3KMJNDDcaldZBlCyAtcKGPdThfTdjCaF+vkV
	6eBnIbhwTWKUaBrBsltwYAY/ZKCQ6LDeQ7iwCOH6QrtNNxUfS5wwSbSLgPuB9N/dPzM2jQ==
X-Gm-Gg: AfdE7cmJkdQnsx43b2Wu6En/diPX/zsvwY2p/Iq9tIRFA8IAigL7jbBTrM760b96wx/
	jli8r5+TKvzpqNXzBG2HcgtK6iEXTOVZBgRCe2tuoDMAsBpx/4DMbPTUBgwGTy+wpje8fAJfTeO
	oQlu9v0yMwChNigsBnGm2wQdaLTAHtqdc5H9PbUSa0Z87C9qTwsZr6wRo0g/1jUKZB+e17pquQD
	VoE+S5mTeqvfhhA9r8f47jowLvHbXVZFBWXTf5vzH0wbBR1DZNgkacH63YCTbOqxc5KQ+OvpCUW
	kjzScgWBEMn+ep2zRmlB+ojlvGWzdlSEmFGFo2YuAJYCK00iNeJWGYcrEFo0ZtcXXquPcVSbrf0
	aTevQJnnzSBbgUtubUW13Cq0lmg5GodWvlZ4mbPxUUWj7ePmbN7D+vL2AqCvgRpEw1Mkq4zUgIJ
	nqk2yfu2Mv1tCvWwHm8kc=
X-Received: by 2002:a05:6a00:2e93:b0:848:30c3:45dd with SMTP id d2e1a72fcca58-848895db4edmr18921232b3a.11.1784197044068;
        Thu, 16 Jul 2026 03:17:24 -0700 (PDT)
Received: from kuangyufan-EndeavourOS ([113.73.176.212])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f7dadcfsm4541465b3a.48.2026.07.16.03.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:17:23 -0700 (PDT)
From: Yufan <kuangfan955@gmail.com>
To: linux-sound@vger.kernel.org,
	tiwai@suse.com
Cc: david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	perex@perex.cz,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	Yufan Kuang <kuangfan955@gmail.com>
Subject: [PATCH] ALSA: hda: cs35l41: Fix Speakers on HP OmniBook 7 16-bh0xxx
Date: Thu, 16 Jul 2026 18:17:08 +0800
Message-ID: <20260716101708.86725-1-kuangfan955@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yufan Kuang <kuangfan955@gmail.com>

The HP OmniBook 7 Laptop 16-bh0xxx (SSID 103C8E60) has two CS35L41
amplifiers connected via I2C with internal boost, but its _DSD
provides cirrus,dev-index as a Package while the driver expects
per-device scalar values, causing the probe to fail with -EINVAL,
leaving only the left speaker working.

Add the SSID to the configuration and prop-model override tables.

Tested on a HP OmniBook 7 Laptop 16-bh0xxx (BIOS F.12) with
CachyOS 7.1.3-2; speaker-test confirms both channels work correctly.

Signed-off-by: Yufan Kuang <kuangfan955@gmail.com>
Assisted-by: Copilot:DeepSeek-V4-Pro
---
 sound/hda/codecs/side-codecs/cs35l41_hda_property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
index 416d7bf3e289..e14a87336478 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
@@ -85,6 +85,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "103C8C51", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8CDD", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8CDE", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 3900, 24 },
+	{ "103C8E60", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "104312AF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10431433", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "10431463", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
@@ -511,6 +512,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "103C8C6A", hp_i2c_int_2amp_dual_spkid },
 	{ "CSC3551", "103C8CDD", generic_dsd_config },
 	{ "CSC3551", "103C8CDE", generic_dsd_config },
+	{ "CSC3551", "103C8E60", generic_dsd_config },
 	{ "CSC3551", "104312AF", generic_dsd_config },
 	{ "CSC3551", "10431433", generic_dsd_config },
 	{ "CSC3551", "10431463", generic_dsd_config },
-- 
2.55.0

