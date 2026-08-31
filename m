Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF5E33B6F4
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 11:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176013; cv=none; b=cbMGhSTKxaqcas/CYpgxjNyTrlx/G8/Cf7kri3eaINOgu/JbLmLlzHiydzUKcOjXiAmxQsqpPa0iz20rTp512EapuGqd7ScAnxr2LLK6bwuQduZRPO2n8ZwiFHsvOcRi4I7Xabw3osDEih2oYvDuuOZHG/JJizW8wTPDUDknLVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176013; c=relaxed/simple;
	bh=iTXhJnYnvUyhcSvEeSQQcBq1TiwCB1jc+QCIXDOLjsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WJNLF19Ttu6x+kKPlQcPASzyGBp2Iu+R8ceCnTinbPnRTrYm9Es94ocNsvIFtwqHNr1QHqAR+GOI7S58VPYXCm5rDbmPvHn0xM2CuWL4/0wlxv78/A3Yx9ceFiocdl61t6A1W4dTspfVodra62I+9Gt90D/Ls+xaPuAyaDUCyPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJ/PGBCn; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJ/PGBCn"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e041ea211so3190380a91.0
        for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 04:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788176012; x=1788780812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0V+6zXu1ZixQJ8ktO5+SKn8z2jHgggq58T5gsH9x6kw=;
        b=YJ/PGBCncuwkFmT2dw/SMdaLEdiTnWr1hQkYh0AAmVXNiC0KJb443983Rgr9aPDxfC
         RUIk9lLCM2Z+dxMrbPGEB9wbLzn3lcdHrLelVfOaFqn/iEHRS4ecVDrAPBqLhLsyVfGg
         5xltS8B5iUk3scWzCkwkwWRLZr+AzltZevUz7qtCua/wyIbNbN8zHz5xcDROJSoIA4m2
         ETZoWeVaR2KUC65x34/liMg2JivQ/UU8lT950o6hyS+2wUKSurx5NmxOVzduETfidcB7
         m10aobhaZ+j6ANrkNPXvS5G7KqXGSYd6T5ZCvanLAd/55wFwpza88WdlKPCJAIJGHUSd
         dIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788176012; x=1788780812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0V+6zXu1ZixQJ8ktO5+SKn8z2jHgggq58T5gsH9x6kw=;
        b=msUAs3wI2Au3R+Uz+u3Q/WXVRWJihXJJn+MiKT/4A7aigQZ2MAitiPVhBxsPotAXmf
         Bj5XJ9tqJIGJEpoiMDcuSbsCJMKxUqamAqhH/+do4A3VbwhjxDwe+XLDLNu5sbeRv8T3
         3Rw08z0wVpX07Kkhy2Ie3sYpRf6bT7EzmyryZ7dLywDjVLQBB8chEnvarOjXNXL7xDtJ
         vCHPRptj05W/35SkmejSlUku8cHV3Zmbque5O3ziFVaEhDeLWVcPltkIxLclJs8I0zA1
         7FnoFr5RuWFo3b5IkoDUwcgRbLTT65ZuX8v05wdglX5rfmlTApqQYXmvu4zxrm+LsxRa
         7f7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxw1f3tZFt8X2BAE56txO2xj25NDXbi0o3UwrVTwE83RJQ2F94hb4QIAz9/n+3GeePGsamWHOvVUzlNAQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mliWnzTRWyrREBRrMQd07ah0XUG8+lgBOu+AiG2VW19RNx0IPb
	JlI1waf/JXXvV5JUisW6BYbrI8ObThXa7DyTRrIfZDAvEr//3BDlAfbUxoyY0w==
X-Gm-Gg: AYBFou36NhQ+DGtSGza94r6EIeWbHG9tkHJyc+rneIo7rOOsaNDHYAyykMSLTYjliI9
	YJLpb2h4RySLcRlidNTgibjw8NNYhAjk6pSsKrNvvBnMJmTZfdLFadcYJmgLG5CJlY1I0tTIh5J
	mIO60AL1dIhsKiU308V9fAZfCZ4FpwL0CcJVxBMPYgt1FhKlGzkzGLg2njjhFo+CvK8+RXxUdJh
	rqIkLt+2NpsIcelfYGVIszHJ0bNBsblxZjpSeG3XjvO7LOcQcDKeSI6v+R2NdWSdQMd2SAcyIn4
	XzMOwcqg6WVb3ZiTP1CnMyC6PvJV/hRZpVOVjb4RZKlf08suWfpFUJFp4KBBwxAuXb2+MycSn5X
	DN0BSm0wAV8C56gKcFO0E1thrlBHpBcrAfvltzeOFnRxT1EHvFfl+XtTr/ClhSRDsPJysp+Vq7Y
	+WIqoVbFV2fGtxm84CoI6S9d1BR3TcTjODzpsT/y1Siz/zmxPlUo77CXTva057/jdaSBvV+TjXO
	kTGJrBRGPR9tzdGXMBNzWCqOPP+qqBha2n4TaG63WqUQl29BZ0OAEdlWqOPPIhoL6miNVeoWLij
	pfknh8JtpBc5Hsid7D+05Y3IlBskt2X4xWbZ
X-Received: by 2002:a17:90a:d646:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39907231958mr322558a91.0.1788176011913;
        Mon, 31 Aug 2026 04:33:31 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm34111826eec.9.2026.08.31.04.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:33:31 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 31 Aug 2026 21:32:41 +1000
Subject: [PATCH 3/3] ASoC: tas2770: Initialise SDZ GPIO low
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-apple-shared-gpio-v1-3-e855b12e18ce@gmail.com>
References: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
In-Reply-To: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1552;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=iTXhJnYnvUyhcSvEeSQQcBq1TiwCB1jc+QCIXDOLjsM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlT04p0ojMTfJ47b7SRnZUfffPPzFsJ2mILz5YKajz7v
 DCFiZO9YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNX7BBj+2Tuf7OX2/MlUtqT1y8kYbgfvZ2sehv49cGLzGy4/i/pnZYwME77mzdr
 ycp8ic9rElYYiz4IcBZ6ZaqXve/UiTX3N7LlBnAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

On Apple Silicon machines integrating TAS2770, the SDZ pin of all
codecs is connected to a shared GPIO line. The kernel's shared
GPIO infrastructure relies on the first change of the GPIO state
being marked as its "default" state, and allows any consumer of the
shared line to assert that state without consensus from other
consumers.

If the pin is initialised high, the shared GPIO core does not
allow the line to be asserted without consensus. This breaks
resuming from suspend on Apple Silicon machines; the driver attempts
to restore the codec's register state and fails because other
codecs are still holding the line low.

Initialise the SDZ GPIO low so that the first state change on probe
asserts it high, allowing any codec to pull the line up when
it needs to.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index e79754edac5c..ecc37d4ac00b 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -886,7 +886,7 @@ static int tas2770_parse_dt(struct device *dev, struct tas2770_priv *tas2770)
 	if (rc)
 		tas2770->pdm_slot = -1;
 
-	tas2770->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
+	tas2770->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_LOW);
 	if (IS_ERR(tas2770->sdz_gpio)) {
 		if (PTR_ERR(tas2770->sdz_gpio) == -EPROBE_DEFER)
 			return -EPROBE_DEFER;

-- 
2.55.0

