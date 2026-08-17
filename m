Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F2E403AE9
	for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 11:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786966410; cv=none; b=S43IaLVr6lIzwzP1DAAygWFVJLLR3HD4hEadliTI1xXivc0umysYdrgITn9yZijMut6BbJWKJz+leCdMXilKlDIpKjYlZSJggkffBsf4Diq52wykYjLYdUWJSa3Ejm7elKlSYGYw8nn4YbzypjiExKLtiUr9kIro/v7p0ObrJZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786966410; c=relaxed/simple;
	bh=72OhJbn7ckcKZW74co4duZG8fWOdc+WwYXFeX4PAns8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZZpADk9SYsu5U/RSqtdVL81/Y8Sn2fYXBT/J95WZdMsUyeHQ8iE95jATZ8iJGW7mqfxaPX+Z2/YJUiIMDm3xBAl/sA1dN19NDwqQDgEcbfR3eW+1WTgkjxcs4u4hmlYtiPx22WMOGqnsK+q7CqyoYKPnavqkMY2+7Pk4noxWyAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oT5VEotb; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oT5VEotb"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so3272624a91.0
        for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 04:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786966395; x=1787571195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZQj+ONDwpbh4PJ71wQ7JZ+LMR8i+c4jITqEqjly3CM=;
        b=oT5VEotbHzZ4ClQSNQUzJ/Azg5kRucIhNctcSuvdZcyFC/o4+wRDwgobdOGkX3TcHR
         w+BHNqcTmpXmpTGDRwRDp5mNq+VWS3gtA7okzCHvTXravtU+oUoCcWIRs2QfmDxGW1fT
         3Yz7t16MkeH8ZksX70+oTayyDW2sjlBfETpNzA7xNxKbh58YO7GQbU/fTpsLafZUcpBn
         Tf3WfVE/Qc9doUutBdiCk2M3yw7hmD7ms26FC3mpO6plz3zkatYPrw61WIZBAxl1iO39
         CbB8PgJTPnvZSpTG8WPecJ6w/TQy7gIjdtH7tJUQNYWFcQAlfppzZGcc4kDIPz3YDIfX
         IlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786966395; x=1787571195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZQj+ONDwpbh4PJ71wQ7JZ+LMR8i+c4jITqEqjly3CM=;
        b=ievlwINoWi8dPDpio6tV+15SuMhXU2HTTJohyLWMXHmqqqSLssC7ux1sAoVDJ37VYs
         S7vraqI1eCYq0e4O8gn1fA4YqWbw5NgnUBI9NnFVC6svqp216GAzPcClnXDHAJJS/xNx
         mYx71+hdM7/L86tCHyYXSvpg9kXTLki47gJTQqZI0U6LWMq/eA5ilO1IlMAaVVI/5dd8
         5wu44/9quRpGpjnZ51/H0AkmY9vX2anoWeyKFhI0chRnmsi94FoCcQnAR4E74pW2Jdfw
         gi/i5jMYWyZh/ZWb4DPENc6Kpo78h8R1PdXDnVA31uuz2oqp5kdwoU8maohBxwW4t1ra
         m8Tg==
X-Forwarded-Encrypted: i=1; AHgh+RqhTRIKskAGYuCuLM1cYtz4YscAt3s5sohz42c46+eu24hUbAg251pzTh1h42TkPGXAxl082kT2fTuswg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIMtraG6X0/llOECez0PLLGTEgz1laOirwKUYoC96zBP1kO0G+
	R1S8bClenP8ZwxUg+8HbqPR/r+hI/ncWmgjIddhBroFBI2yTF2VC5t4V
X-Gm-Gg: AR+sD11r8ag9D1NAGLykUG8Zj75w+a4JGgfSxU7ITIfGzLeZhz0/DS6vEiDDCVjaJy5
	IrJnPhqKJ+Nk01xsjUNqUsO/vOvWkxygVc8T4kIYBr3M/eEVKjZohoBdQl2uZfqeLVCKLLfYxoK
	3LXpiCUJipq4xCB9kXCI32P6HQKfxOOx4L8++H5hp2uaucC8zRc9b+TCTYbd7RLmIVKCCPwsKpw
	A5YJdCI+E7Dx5qOkfHnnmrPVNm+Pcp4Z9wbOyNNO00YtxHysVuL/PKz6mCfJxupWat3jZrCOyfT
	WSqwPQfx3eSPBmD0P9YxUq6rOCXeV5eQOJqZKkCxCXtXbImlosUeW6cNU7rSmC0TI3s+4kSHl31
	XW2aJE7ajftd6hW9TGjd18CQXq866bGtNCuNQj99B/HXrdBw6xt8YdJJI6vQ1oIrOhOIskEKEMW
	M7W7cSfSg+3R7VJNnhVyznk2rIIt0gLDMEY4DWu77zbEniIsRyf/DjwY87vkKOOZAIBj87QN0MV
	wFO4MO2YAeq/kzUgRTBUuMhPYJ8hzTxtWbH8XiEttF7SrPSYU/4YQ0T1qst2SE+exA8DmqEvmyZ
	IejeCEMQAgQGW8g=
X-Received: by 2002:a17:90b:1d45:b0:37c:6130:7a5b with SMTP id 98e67ed59e1d1-3933b7ff941mr24717362a91.8.1786966395038;
        Mon, 17 Aug 2026 04:33:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d3b3b91sm2071705a91.13.2026.08.17.04.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:33:14 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] ASoC: mt6797: Drop redundant probe error messages
Date: Mon, 17 Aug 2026 18:32:49 +0700
Message-ID: <20260817113249.69252-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817113249.69252-1-phucduc.bui@gmail.com>
References: <20260817113249.69252-1-phucduc.bui@gmail.com>
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
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index f62a32f2f2b6..dfe67727fe47 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -754,10 +754,8 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* initial audio related clock */
 	ret = mt6797_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error\n");
+	if (ret)
 		return ret;
-	}
 
 	/* regmap init */
 	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
@@ -800,10 +798,8 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt6797_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for asys-isr\n");
+	if (ret)
 		return ret;
-	}
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
-- 
2.43.0

