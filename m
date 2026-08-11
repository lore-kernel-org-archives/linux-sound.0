Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C593C41D203
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 09:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786439175; cv=none; b=VH20rU20tUrn1yOmtvGkRwKyAliD9u+fdYdL9QbXj0/bO5MrgRSp5rKHm6+8UQT5WHeaMg6AYcS/nTC9pKq5Yz2+emhWmyPw9qODany5FVtaNIOU9Xa/sR6DecxVaqJQquU/vpS4tnJM/R3D49V7HEE56Tmq8q+c0h+6Mzeq/6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786439175; c=relaxed/simple;
	bh=PuTYmgJrEnQxPveBP59x89dzsHEHg9UMpTyG/rFkWVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rjOJz6D6Moojk2/6txAUxG46dJgp2g7Ogtin+JYpg4f+O9yHupgod5eHbsSveVuSaro2dN1Lf0Efl/7X5gnl3GHn7G8BLBFrjLNTdlw40Isgu8OJMxvsklbxuKLG8aHwRzDcQjtSrMoWl9RkvDdAlrhC1zwgyDQAnUPrJLXC5uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXiuiAwE; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXiuiAwE"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d01663d816so24698135ad.1
        for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 02:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786439174; x=1787043974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ve/AxYf9jmTt+HISjsfKMmply9MP5YI1a9fhUjibAHI=;
        b=FXiuiAwEtu7XdqjRt64MUcACrqBOdSWaHGU7cVeM+E8Kj37WEUBWfNWv6/bHEIUZFU
         px7xda2O/I+yACLPfL4HUlNtA28mZBqc/ejwNPH9myqPW238jAsApdaOk7KBEKmup12p
         fkzmRxOL5WdZMsBJgPvBBLVu/PgktnNISg2sCekCwKrJHivJahP1UtoaRXwP+3VCfLv4
         BS4AseRHMfICVPvhQNb/biWCYEvIiPccQFDqan+KMRnAQp6cOocZlRjUe+yQReZRpIEI
         38VDhQAGYKmsHIBjK2zdkcEv3J7kjdg6zFmAqh+zse2cQAIYCijwDEPyJNeV60htqV/k
         Yxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786439174; x=1787043974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ve/AxYf9jmTt+HISjsfKMmply9MP5YI1a9fhUjibAHI=;
        b=rMaVZ5V3WPMRjXQs9h+NamJXLlQ+vA+pYjnPdBq8wg1hHb+0vTmbvNetYXkvRQd3cR
         vjVfMGZw1/24z/i7vl+pM2L53NphEArdW5qKfTNds6n4q0ZOQemuTTV/cjnrn6ecLlFU
         Nainicgc1J5JXJZnZuNde4pTd3fQF+G4I5RuCPWmBEVtBpl74FqjP+mp1oCD7AzbzC0i
         2f9HYfyMbSeuu5djzPFj5mIWJOCvM8IRUxKUpz1A/fHIM0Qc7rMhblB4+U9Ja0SwJggj
         6TOFCqu8xWTWEdAIi1iUCtsJ0HZ8uMAA3eM0Z1rZ6u3BKRhcXE1FhVMRWZZtK1dSt6Rt
         0OJg==
X-Gm-Message-State: AOJu0YyW6y/j3qeiFFZMLcC3LLqjJN4yVhlYFbAznvwDU/oD0NDnJwu7
	Ms+zLeW/MCPnqPDLIWkVWF2YeZR2UiSopHl2+ATdEfBXDw23pPH7owxwDIrxKw==
X-Gm-Gg: AR+sD10Ri/Q4+4KhbMoJ0/2JJXAB4XWOjJQJHduo2pkFxOtMnD8DcTV/N7hbwH5Xzeg
	xmPLa3sp0lafWqsrftZLQszC7d/L1xSpiy8rYTIxBOPlpjNgFZcdduvlFXg8xm4ciIb8FO7+b7T
	gEBqS8leuUzb2WsLEdXbbqY5C8jJGZMtUSJ7Kh5PoQJ5oxNOJtzlcrxNssD5JR3xSS495J2HpWV
	O+OFhbZEMUqtdAH3RdT4T0hZvwJszUdSqsM/5zG3xFRCv1+DX+Dty3OvZpjl5+w23mTF/gSQ/Ct
	T1u1Vb/u6iUAbi2vYe4fL65zv8/bxtoSWacFUb0MbDBhqsqaLBV3xDpw3wByfMHyE3uqfGAfQ+V
	IIg9cQn7ygONDKEzP5NVDU3fSt5ZYJGg5Zx7CWQ6yuly52r6ZtiM0k+bQCV4mQzVewIwL1llPQ2
	QMcqd+3+yrUwOWE8NS2nq85zELq1AjKEcNTJ2p/FepB1KsvK152/PeIegVq2QkSBTyFHs5VNLxf
	kv2jT8ZNO9z1sxb4NauTU9kJ9D6CTTNOTa51N+GMaxmvxyPhxkCpjIJ8fv0zJwPiazNf7ih0B0e
	q5szWMxltq6aN64=
X-Received: by 2002:a17:90b:280d:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-392ec393372mr2078382a91.2.1786439174023;
        Tue, 11 Aug 2026 02:06:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392ee41936asm1128999a91.14.2026.08.11.02.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:06:13 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/6] ASoC: samsung: aries_wm8994: Preserve gpiod_to_irq() error codes
Date: Tue, 11 Aug 2026 16:05:45 +0700
Message-ID: <20260811090550.38930-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811090550.38930-1-phucduc.bui@gmail.com>
References: <20260811090550.38930-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

gpiod_to_irq() can currently return several error codes, including
-ENXIO, -ENODEV, -EPROBE_DEFER, and -EINVAL.

Return the original error code instead of overwriting it with -EINVAL,
so that the actual failure reason is preserved.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/samsung/aries_wm8994.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
index 6db91b73f25c..58e3e08225de 100644
--- a/sound/soc/samsung/aries_wm8994.c
+++ b/sound/soc/samsung/aries_wm8994.c
@@ -374,7 +374,7 @@ static int aries_late_probe(struct snd_soc_card *card)
 	irq = gpiod_to_irq(priv->gpio_headset_detect);
 	if (irq < 0) {
 		dev_err(card->dev, "Failed to map headset detect gpio to irq");
-		return -EINVAL;
+		return irq;
 	}
 
 	ret = devm_request_threaded_irq(card->dev, irq, NULL,
-- 
2.43.0

