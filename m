Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3423FF88D
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 08:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786524754; cv=none; b=X5mN1c4UIq5dseAaEWDW2rmATJvfyQgRcKxr+mrUSSvhjUlPccvRNyAkNengayebg0Z5o9cumaIvkFWIVPFdMoGwdAhLqPt+ySKbUyV/wSwRMON9VHOcHPPEuA5F1cf4T8KCDykfo0v8Psa0ZM2ZhOX7FlPf52bc7EeH+ZXEFJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786524754; c=relaxed/simple;
	bh=vIVW2eGB4yvQ3yXCBBoo8CWBHiNsNWXoJi4ZAZ887rQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=arkQsZMMYTkrptSnpQyPcfvP32kgtrn8gasX+i2KruiSzFUM2PhPU0eJkpZ65OUUfkNV593qCjXZ9IZsJ1+I5VlI63d/UfDeUX/HuTOvTobCe2gpIxeVB4Joj/CF0m+JWLut3jZK4JRDGLXFcvr6G5uRH0f8R336w9iS5aMHxF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e47HFYO+; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e47HFYO+"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so617642a91.0
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 01:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786524753; x=1787129553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pC+uMvMckRUJDqA3cMZLmR5d05+IX1EKa1AZw7dJ7+w=;
        b=e47HFYO+vSuEL3IKqnGb+Hi8NmWfuOIGEMThSiJT0tiOPOt5ruLHdrV1Y5o7XP/Mgx
         lqf8/DMHiznPb8kDqUUQtMcxXIKlKmeJ4tJPsSHF2aNIJVRT2e3lG632KsVcdxUeh68n
         ZwQCULp7ZgHFgiUcZMzJ9MCOjpjdJo/1bLAepERW4yZ8gMq8cG8IpK5Y7fety0qRqgoN
         UUhSouyMqDsTtoNSLojDnfBjFQ8vdsxAs/yDekRqGQj8J79WqPnUuyHqczctLWzgErOq
         eIUdVhxEzgt2g9sJfJ3giYQkAPGqsrnVooaI8bDECbB0lHivOMfhDglbkaTPbs0AohtW
         ZdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786524753; x=1787129553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pC+uMvMckRUJDqA3cMZLmR5d05+IX1EKa1AZw7dJ7+w=;
        b=OsdEWtjngjjlsDtW+ygvV1TZDrMXJOrBKwgovn6fi3OxrMODLz05O532pMyNlNJ9IW
         tGxWHL6dFjNRuw0/uYCTbG6APU2XV8r6zoffcCQC2ATcwYP3PkjNSH8ve/IOTAwvBS0P
         3z1pgxAZmdxYkzAMkEnhjqw599ada9Do07gxz0hwP17bIlm5Dbqc7uYjvjsfFEuU8+dO
         MDlCh5kBXZDw+5QGBe1xw3whnNHi3sqMtFWKuMx3dvIFOxLGOSm3mSFlZ49i2wnoFCF8
         S2gllYFIJZdepMgqB/Zc6o+0HaW4fF/wsKyLLXlCT4YJw83M/al1nIiV7vsXzYtHLnvJ
         z8Xw==
X-Gm-Message-State: AOJu0Yxec4i/GqlgvU/KRZuPKfCl6GkeDg36Iy2JZ1/Y+FUMfkFBMwrb
	oTFCa9JxwetGfVDEuxuI4jzXhxp0CyKAMtH5sRbMjyWgr85UKTCOFjy8
X-Gm-Gg: AR+sD12vpzMKd/7CdAi2bg3X95dD9f0F3wIvbzW2ZXOBeeIeySiEK/ZrAJf8I78C/Mt
	0TdlAk8RySOiNI0QpDiazRbYT8GCcim71ueVI/NAOkbxzTZXrjeEm430xISci3hGXtJKrtGTWXB
	oBhJYiQASW7Z50ZNTNz8kYMFLvCdm8iif3uXcFYWMlaH20ASUIzPhQfRwFwR1tOy7r1HuNwZzxA
	vqq2YCQvxXeFdsOyJJ7rOy4nI+f31qoDlFyU+GQFVhVR0u2rGHOVvRe6scInYpf59aCWVMUr+21
	UlhClmSfapx2HN85aYIvFRusBAvdGERBeDAqrQR9tXrUs9758u9ZifDJj0uo8D3z4Jumf0Zl0HG
	1mG7wztgM6lA8McuclLr8aMzFlcCkfj95abczi19LEr9ua4MRw6R+BlsfhpnjLvl2QBO7jJ9+oy
	Nxm3QCT4jdvu+MF5QfiBF8f+2gSElyD6TeK6d+N6yjrk/emCVErFfKMIWKpAW75HNaFWVJz58Ex
	l3klKCpKOPvtFdFiZY0CWs/3tqA4CHuwI3/UAE4wYlyPD/5f8eAWPSNaeaAJllIzsVhF/7G78DZ
	Mizx
X-Received: by 2002:a17:90b:39cc:b0:38f:1a2e:6e56 with SMTP id 98e67ed59e1d1-393012af83dmr3484825a91.9.1786524752961;
        Wed, 12 Aug 2026 01:52:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f94d30f4sm2916303a91.14.2026.08.12.01.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 01:52:32 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 6/6] ASoC: samsung: tm2_wm5110: Drop redundant probe error messages
Date: Wed, 12 Aug 2026 15:51:33 +0700
Message-ID: <20260812085133.29658-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812085133.29658-1-phucduc.bui@gmail.com>
References: <20260812085133.29658-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the commit message.

 sound/soc/samsung/tm2_wm5110.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index f1f59e059f5d..f4912826dfd4 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -518,19 +518,15 @@ static int tm2_probe(struct platform_device *pdev)
 	}
 
 	ret = snd_soc_of_parse_card_name(card, "model");
-	if (ret < 0) {
-		dev_err(dev, "Card name is not specified\n");
+	if (ret < 0)
 		return ret;
-	}
 
 	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
 	if (ret < 0) {
 		/* Backwards compatible way */
 		ret = snd_soc_of_parse_audio_routing(card, "samsung,audio-routing");
-		if (ret < 0) {
-			dev_err(dev, "Audio routing is not specified or invalid\n");
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	card->aux_dev[0].dlc.of_node = of_parse_phandle(dev->of_node,
@@ -609,10 +605,8 @@ static int tm2_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_component(dev, &tm2_component,
 				tm2_ext_dai, ARRAY_SIZE(tm2_ext_dai));
-	if (ret < 0) {
-		dev_err(dev, "Failed to register component: %d\n", ret);
+	if (ret < 0)
 		goto dai_node_put;
-	}
 
 	ret = devm_snd_soc_register_card(dev, card);
 	if (ret < 0) {
-- 
2.43.0

