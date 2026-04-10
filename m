Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A386F3E275C
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 17:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775840520; cv=none; b=Sf9tOJ2TXfRpOsnyvZkHOv+x/WxsVUrwrAbyAesi+CCHKqdPqi16ZQoxhE4kXF4uK2MatSpE8yfwH7Yqb7fmrQ8shnCRYqwgg5pNOl1n6wp8kiRmxUe8OHAvvST2QSptCrnC2GXUxEdFVuIiR7TN+r9CD2/ptZkuq++AfC8k/r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775840520; c=relaxed/simple;
	bh=9YqfgFv1PhPidCW3i1Pygi54f7bI8kkQeIl1pXSmkDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DXt21qAqAjEAwp8YxkQkqk/yzYh64VxNgnMC31PzKgRXyEMLa6DfPSx1Q3kZNaFk5bgW7gugNVvGFRMqBiOGooCWvW+4dlT6fHfinBw2I3nn7GVw5Ako2lqzYf6Oke3k7QDO7pp2Tumt9syreXVcln1JMYTNCekcweUu+SPpcbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JyeL+csg; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JyeL+csg"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2adff872068so12936235ad.1
        for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 10:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775840517; x=1776445317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3L7O35D875EHY14/m8XMqoDd7xdrCaUKzSeCEUqhBTg=;
        b=JyeL+csg5frQgOlQC15nnXfs5EDQ4aebOLxcujkAAPpPyxhRD9+iAcOyC3CCTUMVyn
         ak3HlebG9O+NHxldCBlDveHGpKkYZajpOE+PiIxpqYwcs8tAjsgisbVhKPsmFsc67TJD
         sbuI9jHJPzpe3/9IV8o2ogUKvZ81VPx4dGK6KIxq/rB6GqSpHvOOvoy359CogXtlrMOU
         BKuocFkwzdGIpbTewdO4FNh1Tg1SX2qE/skpXMSD90yrUlOYAQRSzHVDxF8oEbgVE7C9
         ZXKvzPly+dHG3kAzKSRkIJHw9FTXSJaMDJfmzqIOn1kjONDtD+Fjr+FCJ0rJxK1cPj7/
         BLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775840517; x=1776445317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3L7O35D875EHY14/m8XMqoDd7xdrCaUKzSeCEUqhBTg=;
        b=pptEW3QMlJ+oCHNvypKd84UuqwjK8N6ha1PwW4Bdo2oxt2NU2rXc0c2TLP4oeXNMlR
         UwZ/NVB+0RBSDNEFkZE1XCpB3XnQR8NKmmhx5yOJ14SkTp8y7iKs+QkLb7h/rK9I3qhJ
         Cy7twjFTjdeg//8QBG/sX8mAhLJywRwKLvtfFjL//vgh9yhL4MdPG/UuC7K1whrv1/d8
         +vNB9/CIpqqP+868ZW+KkZz3NgV26xfnZcrCs7pE8DvhJWA762LNnIt2BARLwUoW4W6B
         aj6vlVEVlcMemuS+NCsxWBRajmrsJqF1+bx+2pZigUCIxgZl/l2NcP6dM2sm0RX/ZarH
         sGjw==
X-Gm-Message-State: AOJu0Yw+ocW14AvWxswmiYnSTDENJhIiPf3z9eVrPxNWcFIy4hJBPt+S
	crBOh2E2obHKfmWZdPdHO74VlIuGZPOFQwtaKq+sACF4QcHUXyYtPvIlGuSAtg==
X-Gm-Gg: AeBDiesKnYukITozYOV+qWpaaUtFgB/600Axp1wqW4L31+0ON91ENsmlD3gEKRVT2Y6
	7A6py3Z3L2k6lMEptACMuVMaD3P1mFVfjexHj7f83rbajFCcHJqF6YTIkhcpNv4RYc3KXkMu9BC
	TP35+sPRVfEJcWGRudupjNLuZGb7D8i5Yd6hkBmmOm5raY5RP+s8bIeW4uaSRtNMid8PBmI259K
	AT63DO6jnL1Ww/PshM37Tl6oDzmekiEbbUlpps/ppA3VT2i+OmbPiCIiykjrsDv20KjPXnWj7Sa
	lvcqWx4E1wf7BWsdaUqiy6OZvC/FVg9BYgYA3z/ex+69qmIk+zRP/uSaeZKzLGr+ZJkQsnHrbyy
	hyDva856NVVkqn0dXY4LtVcDPSx8ghxnmOxqJQbwggJMoU64byvSUFNUV8mDSq/ri7mHEl0LB+2
	sNO1/R9e6cvUgu7D9KTe6mgjup/TAN0ixyKkOH
X-Received: by 2002:a17:902:be07:b0:2b2:57f3:8d07 with SMTP id d9443c01a7336-2b2d597681amr30709515ad.7.1775840516627;
        Fri, 10 Apr 2026 10:01:56 -0700 (PDT)
Received: from localhost ([2405:9800:b901:5415:2f16:250b:594b:2afe])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4dd7faasm35445755ad.26.2026.04.10.10.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 10:01:56 -0700 (PDT)
From: Neal Starkie <nealstarkie@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Neal Starkie <nealstarkie@gmail.com>
Subject: [PATCH] ALSA: tas2783-sdw: add Playback to volume controls name
Date: Sat, 11 Apr 2026 00:01:49 +0700
Message-ID: <20260410170149.238916-1-nealstarkie@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added Playback to volume controls to match the Standard ALSA Control Names
https://docs.kernel.org/sound/designs/control-names.html

Signed-off-by: Neal Starkie <nealstarkie@gmail.com>
---
 sound/soc/codecs/tas2783-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 90008d2d06e..8eb793a126a 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -552,10 +552,10 @@ static s32 tas2783_amp_putvol(struct snd_kcontrol *kcontrol,
 }
 
 static const struct snd_kcontrol_new tas2783_snd_controls[] = {
-	SOC_SINGLE_RANGE_EXT_TLV("Amp Volume", TAS2783_AMP_LEVEL,
+	SOC_SINGLE_RANGE_EXT_TLV("Amp Playback Volume", TAS2783_AMP_LEVEL,
 				 1, 0, 20, 0, tas2783_amp_getvol,
 				 tas2783_amp_putvol, tas2781_amp_tlv),
-	SOC_SINGLE_RANGE_EXT_TLV("Speaker Volume", TAS2783_DVC_LVL,
+	SOC_SINGLE_RANGE_EXT_TLV("Speaker Playback Volume", TAS2783_DVC_LVL,
 				 0, 0, 200, 1, tas2783_digital_getvol,
 				 tas2783_digital_putvol, tas2781_dvc_tlv),
 };
-- 
2.53.0

