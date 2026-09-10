Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D04648A2CC
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 12:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045101; cv=none; b=r2HDI3+a6ltXvl6qVdTmbpDaMmukesU5MXYdbOZpJYD3nFPKzb9ouzZI5TKssXGSfNeeLZF3AqVY9p7izwobNpEnmqCF2BD/3q4qDRXW1tzN2h4CEqsKcx2wNI2UJAeXf2l2/QScgaGoWZtCi6wNj+JxOoC/fG5vUU+JyoeILcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045101; c=relaxed/simple;
	bh=eDB4A6Lwo/gDz5Acpsb0IJtqQRbTmROpMeCy9cYBs8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hCZCodIMepz40t7mj9SZ4iWJ4N6/1krevTcAEao/Ue2mlSjqePbwqvybjYlrd7dpfaeHT7XqZHWhfV//RcZPJg2oZ7q57xQAEUjLPUsGi9xYKTM85n38+XdbyPXT9Kssx9YEV79x7KpM0KYXBtCkN2IAm35jQ9HaWJTQ6WayPNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b42YW58x; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b42YW58x"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc891373e0so72985295ad.2
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 05:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045099; x=1789649899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bKdmUJYxYgq8tpbG7VT9pIxvv5zd6VcFqq2QVmbg6wI=;
        b=b42YW58x+HwpXj9HrjuINZrpfkM7gk+mWkUTLKKyibsb/LfTGZyvZBYilVGWBhzwuf
         CeBxxlAjyx53aVTQlfXHPMcRUzrQdu+KZTIkNh98Lb3dMFgIrmlht+apgpRpu9I6dwtB
         U3xTJaHblh4iJGZSgVkIAMRvNHF7JEMdSYz2g1GFYwu1SDuMIl9B5x5zIslNePNk7x14
         cfbj6w0MM7DOV3K0GY47oHmHJrPT0NmFj3aF7zxprKMPhGRK7RuqYZSqyYkNHI9i7Bm6
         +EKZQsNumdOhwNhu+1PpOinO0Phs9YeD4AREmkPLE55Ufg7jeeCRUor5qlGH2rafRk/8
         IY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045099; x=1789649899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bKdmUJYxYgq8tpbG7VT9pIxvv5zd6VcFqq2QVmbg6wI=;
        b=cfjxAk3fS4awqhhtPXy0uXG0oy6aQEOhs2KvU9zSienWC6hsc4U/FF3xvW3FJgHIlJ
         zQLridt+0Ojc2+JHkqW/+sGRLeNpqXT1yRho978p0mlhNlTeT0bfgAXro0xDWUPZNy3q
         1Oyr17CXG5BwT933aN4xV1mm+Ow46TAcFprSiS7PDFs/X5pOCBL8NwkeOdTWmNxhRFso
         5jpkOPSfmEp9sSHo4GDrP9uWIvmqgRV/D9mAPZL1J+01kDdFkf+1xt7Qnh5hImyida6U
         BzaxF1n87Uf5KoqUEczHPZP8Azfv8l1AGJnz2pK/XKWfNYn5DFThlnmwdoM8gW6YrotQ
         eqtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwy9G9xkryhTgGZTi4i6OzufVBHRMtWM0y1Mckk6h96Gm4mpVE1Zydl96dPwLyOnqOOcwlaAzAocbqHig==@vger.kernel.org
X-Gm-Message-State: AFuF++nwmOM3LlRVyic7ka9oIMqQESuQAnoNmC+Ur3lt2FrjrY5TQhZ0
	k8o48L+RJ5vOglNlQMJiED7ZIDxzN6ZLHttV+52IXlYp8WOzsnqjDxG/
X-Gm-Gg: AYBFou3ugRi0rOkwUhSgxqsSRDsF2kh1tXPSOuMPaUF2Xew/LCFpQcHU6iH6MU6+g9I
	UvmfWvi8Oi7AYcxU6XWmul3OMhxSjDZyN6KomaPt2I0Ts70jqZFSmEuEWtRipdxX/n86d16HpF6
	EBlyxDzf9B4GhQlWsq+NjfzFBhMqPVMA+dQzXYCcShrDz2NK0p1qWWZKsHgkJmokuX4xvUU79UQ
	Xtf4RSnozSPRfOyI4KlTaSXgNmI1SIkP4po+V9EO74bek+ZOl0RO9uOqp064fNVjwnL8f3vHW5M
	gK/kei5ZOsJh1X6PvIZF651daJFFz2KaRQJGJIgRzQ5QOAFozITzUOX5L0qzMsgGnV1iyJd7OeS
	fHyvhTOWyfrEb044pI95hlUclWIjvXdxykSR8YQafmG6dwd43SUWIbbVIXdjlGd2HGqSYOn5drz
	u37koWeuY9H4TxS+vMYHJ0NNtmfMxZGn8iJuiJ5jmO4hYFVnZIDwSMxNhv+l7CrnSpef4BPOJ+3
	36EUFUUcLL82aevrncZFkGFa0kqqZ007DfA3vss2ztoWsM3TZmaH6Whbsw0VnriI6j2A7hQaDbJ
	iifFj0wi87/laF8=
X-Received: by 2002:a17:90a:fc47:b0:398:9c0c:7c72 with SMTP id 98e67ed59e1d1-39b2627fe24mr58655781a91.25.1789045099266;
        Thu, 10 Sep 2026 05:58:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:18 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 04/13] ASoC: mediatek: mt8189: Validate MCK ID
Date: Thu, 10 Sep 2026 19:57:33 +0700
Message-ID: <20260910125742.150902-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mt8189_mck_disable() only checks for negative MCK IDs.
Reject IDs outside the valid MCK range as well.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 933179f2a5ba..88f15a9c2513 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -675,8 +675,8 @@ int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
 
 	dev_dbg(afe->dev, "mck_id: %d.\n", mck_id);
 
-	if (mck_id < 0) {
-		dev_err(afe->dev, "mck_id = %d < 0\n", mck_id);
+	if (mck_id >= MT8189_MCK_NUM || mck_id < 0) {
+		dev_err(afe->dev, "mck_id = %d\n", mck_id);
 		return -EINVAL;
 	}
 
-- 
2.43.0

