Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23A027A90A
	for <linux-sound@vger.kernel.org>; Tue, 22 Jul 2025 17:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753204964; cv=none; b=uyKV7e8DfEe1YN926G6MfpnzlkXNaK7kWno94x++FrVfBf9OV1jV8NQWsMBeMN0YfmSZF/WXva6URce0GMsEsDHHB1PsdWOtAL/LRZh2YkxB72KpQcY3hawgpY6w3xoZ8Rq/JBpw6Qihl4RnOX/LKUbJepqdci2yfHhgnGBJt8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753204964; c=relaxed/simple;
	bh=wcT4BTXCVy+gImjxhQAPJYxIv6AHHeRgWxcuzOb7Spc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hB0QJnkflJMKPXUvPYG6ruBliTxfTivbu4E7BjnVFj21TcTWap2nmi5nnUPV79VVINnm+PsLYS16rtLqZIJQmZLtl7St3ht+wLrNwGBWUM6UraGwVzGeWecHO2xwIb/ccRH5zJLXMvdZC0GYerBVJZvzhDibdpLCpIxEa+RIrPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGzPsvAt; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGzPsvAt"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-235f9ea8d08so49645375ad.1
        for <linux-sound@vger.kernel.org>; Tue, 22 Jul 2025 10:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753204962; x=1753809762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sUjIqOjL4jMQyoaVNA+gO8Rm4wSu8uvVux01Qe2Mv1c=;
        b=nGzPsvAty2Odf2dfXnn+xaWUsDxl9mnyakrnadqTnfD4woYZnslcFFXFHgYk7g0qjo
         jfIsEh/XT0BR+26H90JZWSbqU0ljtGGn3Hp/akz5gzVpxXbSmnPfcpAvNQUnrVAcmHyc
         BHVafmq5P0RyG4J+fVvsF5FRgzmZtaoscq2UZVhvcf5Z1kYJ5VNTJWgdIZdb6iiEtaHC
         eSVCcCRT/RNSgRjhgHHPSaC7zz/Df8TTQ7ZyC2ub894mZAH5ATNL5cU5NE29b7I1nxl6
         k3ZL1D33xgtSJ2l57brLej0f3WAYazeyUnRBgVkRjRw6nIzU6g04uzEyV7xdlF36JGKa
         b/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753204962; x=1753809762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUjIqOjL4jMQyoaVNA+gO8Rm4wSu8uvVux01Qe2Mv1c=;
        b=WG7pAwY9+K20wnV26GI0jWCAtDiLO6yB2S/SGbr5GFZzuL76QylcY+pqa9ucXSzlTS
         ktqWztsaZiK1LPj74pzf+pwwDcQEkQU53B8eF7+lxe40Jr6PdKYy+qHlrbYaOloW+GMt
         W56uj3aKuOpPL7GpZHI52BUW005Tyo2xhxg9P6IX8HSSg4zQqLdBla4HkugbFW8LhhNq
         kofLFdhWs/PlJDKy/6Pn3yJfkzGKtO4xqyR7Nff6UXzVYENzMOo6iqPm9jYJ3M1FsmsO
         XtPlcWdLnvx01JdcpTLxZdPGIVLj7YRVEbanu6CQla1L/lZ6p0QJN2uDZuYpCHF9RXJK
         BBPA==
X-Gm-Message-State: AOJu0YzCsNeQwoZaBYK3dzKFZSP2BNfAptgQrEQYWKkV+wsK/3QjDsG0
	t7WA2Ug/flCeInhWqptEVk4ZPDc8ydWgeNuCgmvyd1UQmNbZrZg4sZrs
X-Gm-Gg: ASbGncuTjetOvHdBMY4ZivImINftPopv+cW7FH6WdhGTqbvGf8uTZQj902aJzQo2+3S
	7LQbo/vax2Du5RwNAhKP6WmQBqSm94HJwABZdGCfT0WdL1OvA/KGmatBtuXS6Rq5nt2SsiEImct
	cXgmkOHEJkAe+NTfjIWsIphS4YAN5PebB7++AgEINwbNVhDhUMLxq7nY7kxdaHUAsUZhjL0Y/HV
	tAVUDsL5cEUMG2CiHrxnoQ0W+YeKC6kd0EpVKSc8DDsV21q+cdy0Hc5ho1DLMwqBN7CQPIArtQc
	4wmIWR56+wQWMDZPAHnZpipKsdKlDUKiD3MySybG13bPlFnKUPeCOx08p1sbbMcPs6DL2T/PQ2H
	+Sfdq3xOMmQtx44UZHMje+qxC5dpe
X-Google-Smtp-Source: AGHT+IEUwvYHADS4hz3QCzG2QCJ0ZxuETiJYfXZkPaqmlX57+QN4R0bUXX7kUDbuiajplxZRVw8Vrg==
X-Received: by 2002:a17:903:19e7:b0:234:ed31:fc94 with SMTP id d9443c01a7336-23e24f4af16mr367002275ad.26.1753204962171;
        Tue, 22 Jul 2025 10:22:42 -0700 (PDT)
Received: from localhost ([2401:4900:628c:e664:976:aaa8:96f6:1864])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23e3b5e2d06sm80035745ad.43.2025.07.22.10.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 10:22:41 -0700 (PDT)
From: SHARAN KUMAR M <sharweshraajan@gmail.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	sharweshraajan@gmail.com
Subject: [PATCH] ALSA: hda/realtek: Fix mute LED mask on HP OMEN 16 laptop
Date: Tue, 22 Jul 2025 22:52:24 +0530
Message-ID: <20250722172224.15359-1-sharweshraajan@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this patch is to fix my previous Commit <e5182305a519> i have fixed mute 
led but for by This patch corrects the coefficient mask value introduced
in commit <e5182305a519>, which was intended to enable the mute LED 
functionality. During testing, multiple values were evaluated, and 
an incorrect value was mistakenly included in the final commit. 
This update fixes that error by applying the correct 
mask value for proper mute LED behavior.

Tested on 6.15.5-arch1-1

Signed-off-by: SHARAN KUMAR M<sharweshraajan@gmail.com>

---
 sound/pci/hda/patch_realtek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index d91aac06adde..82eae89f579f 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -4753,7 +4753,7 @@ static void alc245_fixup_hp_mute_led_v1_coefbit(struct hda_codec *codec,
 	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
 		spec->mute_led_polarity = 0;
 		spec->mute_led_coef.idx = 0x0b;
-		spec->mute_led_coef.mask = 1 << 3;
+		spec->mute_led_coef.mask = 3 << 2;
 		spec->mute_led_coef.on = 1 << 3;
 		spec->mute_led_coef.off = 0;
 		snd_hda_gen_add_mute_led_cdev(codec, coef_mute_led_set);
-- 
2.50.1

