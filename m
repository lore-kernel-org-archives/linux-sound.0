Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0CF442FBE
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 06:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959596; cv=none; b=rpOWkvy4xe+p/ezAI8FDF5uRw/Bm9V+gtUe4gTj58Q1Uv7N9dHuv1zNMEhNLt8UkPDywaSb7dQ+NPAlfdFTP7nZD5Yif9hZR3izoogOArzxRTp3kTF+Fw51mc7wse/qOste+ngQB8NvAqTGfNA4iHLmoO6llDciDSM2OnGls8L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959596; c=relaxed/simple;
	bh=X1TteCYW0C81h/9+ov86nKEnPSCdPAB7NOw8djpzd3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RvCF+FMqDkfolwXPBXdS465rTK8aruLgXqj7iyPrmzNR6Nq9IaRA5eb7WaUgSCz5Wr2hvJo9sDjs+TvJ2XeSPVTS1bOY/JlLdqQdlYfIe7q9hwyCYz7N0cXloBAN3ojc+mL19Rz9g3jSbY+YvcbBdHhT0VuTzOvq1zm/NVomKhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnRLK+VS; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnRLK+VS"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so22072a91.2
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 23:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959589; x=1792564389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RH+iY7dhDDJlwpXHf+WzAFlV2oF689XdVCD3sH8jSnE=;
        b=BnRLK+VSGo4QfKUCEYK3+48uXxH+EctDQwhnGKLIXcKjlrnimGgxWvFvNmTJSPZs+X
         kHr8cXKAdv98BAlt9HLG3kUq21eDl7YmGo4BKPLjeX21n5BpiqugqM3kZF6qALcxRQ0f
         moCK99VPGE8QzbChhyBwMO59mj1jGOGgGfevDqSO5FmnMhpny6tj0PxvzGIgphUlUOmB
         OkOsqpjrrcDkm4LPnuG2qENDDtEakeYGu546tU8WsGURehWKV3Pf+ovFVIrOMFv+CR8Q
         3ZC6rZ/fPSZFJ+QbswqN6zpYB2tV+E47S9Tvu/qQttKTJEsaAi8kQkI8X5qIDnFBNg6b
         nN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959589; x=1792564389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RH+iY7dhDDJlwpXHf+WzAFlV2oF689XdVCD3sH8jSnE=;
        b=vWXQa17V67LhzuoLARq3EO7w4lsaHXUVjyA3b8pdB0MgOq+oPR4Yz4IIM4MjZsaUQj
         qqEPAOyQx1/jA/k7zGGAblCgLMF7AmMd//sA1Wg+o/GNMv7bQXj75OkuDo59asyEtxC1
         BGcv+IFodI+7sZrY6ifOprhe/wiNPInfkpS/CN+yq3RRihPWiRqE5H56ffVwKS4tQ9nD
         bI1nsZSaV+vIyPsJ2r7GBxY6iTihxj4Wms4eLaMoXDNLVlaOBMva5HTkOiwDGxIK+8vW
         IjYK04vpG1mizo4n8NgS4TT/jTU9nlS1fk/6jmGftjOP72hn5p+RlmCW2Hw8dAmxCrtg
         8JwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPmPt6PGBO3Q5olLyila3LPgtaUIAvtKGNeBqqfjqW2iO5qi+tpUDtn+J3zXsLzRItVj9/z4s/g5ikjw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKo6nxdDETyZLRPg9V8NnqlFxqVgB6dI9dcCh91+1Nt0r3+CLMr
	UxRkERi/gqlHM7rTyMIsjpfWCJDXWGY7+9UunpPoohBLdRE7zm1SHN4i
X-Gm-Gg: AYBFou2aJ1rFzEQ4Pv/LQRwv656irCUeAAjbrEvi0LppkqM5JmuR3tqqjwaKB0JePcB
	PczFszdtaUVLKzAnwow6zP7jE5o9NaEcA62yK82qhK437YWLg6OfXL0QbhZGRY1Xbm4NQQb1T5Z
	W5zh91TE5OmfEhdGr+H4yepzkMHu+xejpeOUq6jGSUPSFE5EBAHhZXRMlIJDB0uitHaOjuBYp7e
	Rh0p/CwiS++l9UQCyAnPWmEIUsIWl8kVcYbe7HV/4lJ2cHExWFJqKQaHrr+15Co0iiyX6vyALGN
	xrovUyBRuw7dEGyjxVIbIpkVzwqRZ1dBrqBC0dfJP43DGrwJgMxlQwUho4O6bQZ0WWlOktosKP2
	Fw2N4wkSO4naJuENDhoZdN/XzCgvy+nCPxfdrW2IZYzfjG26/mFeElG9a0r0zGo98qriubsvP1G
	+F2KT3vS55IJ9zVTR4Cv5IpUbrTeA9cJnzjjdrdGDsrSpDtnDRrF+OviDvll/de3yVUqUoQKoN8
	+6LoPC5AjxAJoD06eJCJjj7b8mltkBxmvlx/RBRWOz7FQUL/dDYYOX1jYHARvSrXclOtykJs3Xs
	G0qZ+6y23Q==
X-Received: by 2002:a17:90a:d2ce:b0:3a9:9f13:e960 with SMTP id 98e67ed59e1d1-3ab3a98f4e3mr12647903a91.60.1791959589183;
        Tue, 13 Oct 2026 23:33:09 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:33:08 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/13] ASoC: codecs: wm_hubs: Fix definition of MIXINR to MIXOUTR volume control
Date: Wed, 14 Oct 2026 15:32:36 +0900
Message-ID: <1ea1d115cea5b183dd51bba5cd9e38157b3482ee.1791959026.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791959026.git.sammiee5311@gmail.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Right Output Mixer Right Input Volume (MIXINR_MIXOUTR_VOL) is at
bits 2:0 of Output Mixer6, not at bits 8:6, which hold the IN2LN volume
(IN2LN_MIXOUTR_VOL).

Fixes: 942c435ba79f ("ASoC: Add WM8993 CODEC driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm_hubs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_hubs.c b/sound/soc/codecs/wm_hubs.c
index f80dfc488e3c..ce16f2750979 100644
--- a/sound/soc/codecs/wm_hubs.c
+++ b/sound/soc/codecs/wm_hubs.c
@@ -427,7 +427,7 @@ SOC_SINGLE_TLV("Right Output Mixer IN2RP Volume",
 SOC_SINGLE_TLV("Right Output Mixer Left Input Volume",
 	       WM8993_OUTPUT_MIXER6, 3, 7, 1, outmix_tlv),
 SOC_SINGLE_TLV("Right Output Mixer Right Input Volume",
-	       WM8993_OUTPUT_MIXER6, 6, 7, 1, outmix_tlv),
+	       WM8993_OUTPUT_MIXER6, 0, 7, 1, outmix_tlv),
 SOC_SINGLE_TLV("Right Output Mixer DAC Volume",
 	       WM8993_OUTPUT_MIXER6, 9, 7, 1, outmix_tlv),
 
-- 
2.43.0

