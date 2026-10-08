Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEC443F085
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 13:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465013; cv=none; b=bMj6neRPJciv4vCjjef5YlTLGqIevHJ4+P/dX/co1lnxvyEA5K4OSZI33+44+6fnHWTP5RGoKaKhMnQu8HiS9WWL9NP7WgBVly4+1tmd07j7zOTbxTsPQ2OObiQDk1kauAshs/VBKluivwdGlWIkgHH86lKHwizAEpKN7CyRUNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465013; c=relaxed/simple;
	bh=PPO9NfSp85pn54ziFmszdGwes//WPVFfsMsaCovl1ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=scGQjWe+cHKPBfNcWxmj8l35rpbkKccFCykOSzj7v3P2briFCaWSaPwM3f20MMZvoekBuRgZ6QDwxPLzB5eWoKVxP4L2WJ1kllQFnSlaEU1o/w6EOEnjiZHolKQ9dYOrKVaIbn9BX5jsq2KsO2FyPkYm0tIMTgsZyZbrIBoVqsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUk4MzK7; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUk4MzK7"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd1e069cb19so492614a12.0
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 06:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791465011; x=1792069811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=obZMvcMMDB2/jxIEyX2ryM7+bivQFfQutFGpYAMTjEw=;
        b=eUk4MzK7aHbKgw4H7FgJAgbxMLxUFx06wf4riCzzGJGJjr8MraQbGGKhGOxk4stkNA
         Oym7DzDfBcqGLtayjqZpAefkDwIFOaCnzCxJB4uJaZezNGYxdkniuh0TIeFiY56UKny/
         ehXhB5RuHscooiAk4+ziepXORQyL3Ff2ACZWTVyo3G5utN4CntajECrKsEtXoGTxX9t1
         6bKcxbEtzc9cLoqBzoslp2OKIG418TxXR5g48CL5pr7TcpBXu0tMLuROvBmEwCcBR/Fm
         l4Z/FGjPUkhaPCmzeid5X/pUQw8gWo5fuwan7G990RwJSkmcAc1QpfTrl3rTBCmJBMu8
         rIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465011; x=1792069811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=obZMvcMMDB2/jxIEyX2ryM7+bivQFfQutFGpYAMTjEw=;
        b=JV6LvE0F0adZ3hEJw4rPODPEQ3Z2J/QXSXZYbZDCNCF6SNtqAh5VdQk6Xxng9GFIbj
         IOwJkKUMQO4hN3LkEBe5jecbTch78z2908EaLBgW/+1GqAvYc2p0y42weXEQ3DIwV3+9
         8FF2PhWxxo04KQTlZjiBHXh8l/dDw5sU0UpWOoo7XsUTkyeO+FXcSuDcKpWloHXq0cov
         dwwEHsSVaMFot8NMCO80VVqCaV6If4lD/MUG2uuPjbralrMjHgU7p+Q9u8GwIfxRHZ5t
         35zsjZfSO4dfYwHVa7BAjvj4aJjOwdVWnSMsFj4VsOzVEcBLXdATF4a5Xx44k3d5p7Aa
         2ZXw==
X-Forwarded-Encrypted: i=1; AKwUvBzcUTlBKKpR8I7CKl/cJIceKfq6AYUTv0UgqCzK0B04lO6v4K2M/yMRtzMtaNM1YTsm8D4FEipKolxUZA==@vger.kernel.org
X-Gm-Message-State: AFuF++na/S9+SCShI0fslG4DhC/WieOsqIiR9r6dTWEecZj2AcsdCNZl
	AIQe9p6pPuz6xAK8X8BxSEr9rg9uE6bU0wpB+uocH4l0Xg2OVytJTnGG
X-Gm-Gg: AYBFou18EVkpEjNYI37XTVcr1Alzpog0014jcRmvYo+BEwKeD9HSxBMAabyueghnJkW
	yw/wjitVUXZy8dq+fPv2Z04UykykxNBMSCC/Ih01rUaeWqff8jSZWoDx99gTXjtwTV6OjTisx8c
	qk2PahlSBc/LKD24+nB83DPh4BFwE9rZ5QYc1ZlVsCw3OzlsPuHXv5mMM2HowYVbjf8OEcTx9W0
	JWgRWDx88giOFjgjtXmoiD2iLGqcYJ5LjXQ0jPyue2rQlCsedDErBbR5jvbuVw8cHwmEV9IeXCz
	tccci3KHYwu+WWoBgNPyZlOln1pFvCk6W7I85Xkh8TBuR7x5Cj+1nh2N5FhId1OUMcfCYTgAbB+
	cYQ/8SArzSGAZ5RoeaSY1Mf3MlXfE+jSzuLtzxVXqao01sfnafrrN9aphzcbNfoDxCPDU+ly6kw
	UebgA8mMspP1DoQ86suiaM1ITYUFTUPRUE5QstSuDKi4FlLAYXeKiF9etO7hlXwpF0h+P3HPoZm
	g3pllZP4juBp0ltAazII+e3RyKiyPFwp7ZRnvKUrcSDkk3XMhawbSTmMCMOtbQdnRPqZVYXBIaT
	/VGFSh8cZw==
X-Received: by 2002:a05:6a20:d530:b0:3df:62f3:9f4b with SMTP id adf61e73a8af0-3e1340ac6aamr4297840637.31.1791465011309;
        Thu, 08 Oct 2026 06:10:11 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-893143368a7sm870761b3a.48.2026.10.08.06.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:10:10 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com
Subject: [PATCH 2/6] ASoC: cs42l52: Fix the NG Type Switch bit
Date: Thu,  8 Oct 2026 22:09:48 +0900
Message-ID: <20261008130953.2446692-3-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008130953.2446692-1-sammiee5311@gmail.com>
References: <20261008130953.2446692-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NG Type Switch enum selects between "Apply Specific" and "Apply
All", which is the NGALL bit. The datasheet puts NGALL at bit 7 of the
Noise Gate Control register. The enum uses bit 6, which is NG, the
noise gate enable owned by the NG Enable Switch. cs42l52.h names it
CS42L52_NG_ENABLE_SHIFT. cs42l56 has the same Noise Gate register and
puts its NG All Switch at bit 7.

So changing the noise gate type turns the noise gate on or off, and
NGALL cannot be set.

Use bit 7.

Fixes: dfe0f98b8d2e ("ASoC: Add support for CS42L52 Codec")
Link: https://statics.cirrus.com/pubs/proDatasheet/CS42L52_F2.pdf
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/cs42l52.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l52.c b/sound/soc/codecs/cs42l52.c
index 5f033556099a..1d3334886402 100644
--- a/sound/soc/codecs/cs42l52.c
+++ b/sound/soc/codecs/cs42l52.c
@@ -290,7 +290,7 @@ static const char * const cs42l52_ng_type_text[] = {
 };
 
 static SOC_ENUM_SINGLE_DECL(ng_type_enum,
-			    CS42L52_NOISE_GATE_CTL, 6,
+			    CS42L52_NOISE_GATE_CTL, 7,
 			    cs42l52_ng_type_text);
 
 static const char * const left_swap_text[] = {
-- 
2.43.0

