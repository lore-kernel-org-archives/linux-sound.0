Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDE63E51F5
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 07:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370957; cv=none; b=XGZ+SmjD+ztjWkxbRT1paYALF8NW/fR18ejrywgwmTCyBkycGIJ7z8heiZZHlieSaktVtbjEnBe9jQ7vjchDVRYDPwZZfEHLsmXpTsAffrTxbJRfxmZPO9KJQ6pfjD1peZBrqQ/7odo96oCnUDa3cbOuMcSXbmd8ODiykyrCm8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370957; c=relaxed/simple;
	bh=PMrTYt044OfF3pY6fLcQIplcKVJDKCIn9Rne/SIU1Eo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fTzsrndtZjuNnSMmX3T3YV0FLyLTxXZIycBciL3LunuiJPm10iyfSTxcuFGqIuKp7DI5rmUlN9aab7JqZ5d/7rZkSJIcfa4zz/kGJRf8hH6Pz13KkUN+Uap+PnjsUNFyt8eNJTsXcXENfFhR0TMvxAqZ7zm0uGUZN/O9P8TH4W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhtvZ6cA; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhtvZ6cA"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so1647081a91.2
        for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 00:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370956; x=1789975756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJYLAFpdT1QOF/hJAkr/62fvY6NkBt3I3B5rin4YsLo=;
        b=OhtvZ6cA8HlICKsueQfBz4aS1QtNwnuts55w3r3k58B62OpOGmeOPnflTogoVI5MDU
         YxdLBEay8qJtNStBhHRaYREZgY92TGnZDI2/lz6J81LHEFpqVYJCa5wcsaMEzL1sQX4R
         lYwisNCQxCmmAyoE1NqnGJk33lcDOSjkfzl3WlJNKrw/OX6skKEfImLAJeiEnuDAqvrd
         FKZk66LMBC+nKg8A2EFRvMm8GdrCrwdI7S03e7WzyK8fWjTt9T/D1VbNs5EY2Q3prHvX
         geAGy2bKxkLz0gK4A304fnrdhUawdUV6asgTfQTzc76jiBBAtX9Ih+HLyNa3a5Sq1pKB
         bohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370956; x=1789975756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJYLAFpdT1QOF/hJAkr/62fvY6NkBt3I3B5rin4YsLo=;
        b=h422GTuscNQu0YYehSf31wOfyjgm2FUUeF/C0eteNsnxL+GHMWxmIuFcYLgOfYw/hG
         IXTRrKh59ohrxIAI6dR2jamvKXf1T6a3OIhOZWvAmUh2m9E1BFDHVYPRPBgOxEKAVZa9
         Cfx4DIGYWZV4e3I0GW30yxutzPcWFuGi/WTItBSRG+MAv2qYUxdx/EacL3qkg/ku41Es
         EySrO1MdeJ9yZv7zL4RqPF91FeFK8BauF7TFqZubr789OpJ+dyhKTc6fxJN+lFJnvx5e
         TPXJq92wybftuWs5nN0pS8rfXLFTNZt7Bsp7yxBzW8LdTUCrs3tcbwEInHEGI/tGjKJQ
         Oczw==
X-Forwarded-Encrypted: i=1; AKwUvBwFPgtC3qMUp6fIwJpW5TJOCgz/5dREfQsJLkm0YxNfDUxr6wxjixZ8p1fW78ZWYi8PglautAVHWjzoWw==@vger.kernel.org
X-Gm-Message-State: AFuF++n4banzK0TKaLp+IYM3415ph+/aImSb5n54dWU5+JjWA3DxP4gw
	wVEtN1IWAhk0JKDBZWJyYP1zo7kZPbAawB588Dd1wuHZE2Hcmg+zs985SwDiqA==
X-Gm-Gg: AYBFou3xRv/bniPIs97wQjRAUkdX9jPthwTc06SqF+vFcixJ37LUc6deza+Ip8sNVmg
	Yb67ZVj0CWTUJ4HBRl//vtJvbwIFMnloEGUfNOUAGIXBYZYXqTfa7H+uyvvaUyilYBACLW35+64
	0GOfagH1BHRQjPVvpL6R9XA1k+vRrYuUjFIm2VmVmG6xKiG+KxS4h4KwN9sxflg4umcmGxo1U6d
	AZgSrBffv9G+t7xDcuJ+8MAQcD3tkx3L0AFbe2XIjf9GxPxKEgIlHmG8cpXQD1GX93FsgecZqjw
	byaYKxCyBPWbIFvqnm0oqNOD+rRBFDhur1AufjjaDup3pO6VcxwREaHGRXKYQJ9G7eR/wvHyxdW
	v89Y7DFXbuQW12dm3151VzvYluY3VTGfHGaNgnEC4shoxXKr3jWXK/nph5bN+cM0Gj7U4+FRsup
	0i2F0Smv8UtX2eDP69HFYSE0UVFikl0FJox7fizW1AYKC7s1AUM9c/VD28wvL/M4/zCGvUH6umt
	Spk1dBoHdX00hJjQPqEzGLh/9xSG3tJ3MI91xiindHyMz/4cnWMqeXBCLNsSaFu1qbm8sAKxSm3
	Es4mVnY8YDUyY5M=
X-Received: by 2002:a17:90b:2885:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39dec0849e5mr3489837a91.18.1789370955702;
        Mon, 14 Sep 2026 00:29:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:15 -0700 (PDT)
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
Subject: [PATCH v2 04/13] ASoC: mediatek: mt8189: Validate MCK ID
Date: Mon, 14 Sep 2026 14:28:33 +0700
Message-ID: <20260914072842.24420-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
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
index 8f6241d47a65..69aa3715c19e 100644
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

