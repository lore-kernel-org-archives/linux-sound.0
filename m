Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E8B394497
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 09:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908590; cv=none; b=S7H8NqmBJZibRFZwn/xNLa3IPAiEuXm+vcT/N8B8nOxkA4dtsIzLD69nVnM9vZv9NhOug2VNNz0i96r5O5WzNeah8vK2m6iQKU3wCTwNVMvNO11DyRDcNsApBUhrLW94kOK35fIc3RN3EzEmvIU4BVm8ydS3AxNw/2GiYENdFj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908590; c=relaxed/simple;
	bh=UHO3oH2Sj6WWxyXwm9+QaU7CNkpCUF4jRBx0s2y56hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cf5INa+QKOVBnJ5FJpm/rhd1lK+uoZzV+gCjp1118cyAJGMJ+wJhbUUX3suxhm86oIcJdJYozDTJt+/mAjPU46CTZ5k6F1GPSmUiB7ukY6jc8H6eU84JwhRif8i8jVO3EZrTq7WcNEtkRsEClEsbW4AR+WpPdivOmHtGYeGOffk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdEPUuOZ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdEPUuOZ"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8485b358552so704813b3a.2
        for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 02:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908588; x=1788513388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrW30Al+vmkO4YXsfGyVaS6XNDTUobyD5Gl2CjSaQLg=;
        b=QdEPUuOZ8EXqaa9fVEzt9/s/bV44Q3IXTWQ9HP1bs2yWApZZ+fgdK1/WDSw3I1V72w
         PQf5SCOlNv1ZLLay1iNG5XUWMz9u/6lfAgv0jFJDPrrB/HbDZ/GOdDjFLQk7/3bOEoLq
         of1vwSjwBF4sZbi2aCgsafkOzJm03av+YGpjnZhhw0M0ag48WWVYPBr+RoerKlDZvK5C
         KHlANj1Fke6SS3zaXxxcwdUbnSVTI+X9Zgorly2ggDy5qf2cWqr5wv6Zuoq1vG9hMCzV
         zkNLTCQ3v7QkahDCqF2vL0Dk6cFWpxUwLyZgJATd/R7thuAWfHOFt5vl8so3XsWekHfv
         udvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908588; x=1788513388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jrW30Al+vmkO4YXsfGyVaS6XNDTUobyD5Gl2CjSaQLg=;
        b=iUbFw/uWEHRIRVqavp5m2qnDtUkKI95tTNBFZ/pftwjLxZknlCkI7n1j0uEFzM5yi5
         gPXR2XsBRnMrL/iFjUoqRl/0E814CfGidt1mS99CP7bplukcQnEgmL3GBrQ9uNEEoa7K
         2zj3z31Op3xAMfsRhXLSIdkNNUmnslPZr6+OXcKt8byWoruApEXTwA0HPuiP3a5t7Bo+
         0CE9uJ6hhu60bk+WOciP0xMdCzZ32RTYAYGmo5rin7IIo4iB2LmFEL67dOLDsiOCVaD5
         jvacUv9oc5h3/bNihTJxogglQdkmy+QiAYP+bvDr3X5y15LkBrDafKu6neVi3FXZGu7n
         x+0Q==
X-Forwarded-Encrypted: i=1; AHgh+RqTUVH80RrjHOB54tWEXfRYiFqchaiKsNMhISHmgNVWLCdq1Am6E1KmTtdDV+gO1Fq9sYrcUb9wZXXLAg==@vger.kernel.org
X-Gm-Message-State: AFuF++mwPDyQjAaQcifT/vlCJ6LsdhCXrjVq5/dUytKgc8kNX2ubxbYn
	ohRhAgxq2kBH9CXAfgHGwZcSwBgji1aKH/rx2bQNztIoPJ92cbf2U250
X-Gm-Gg: AR+sD12yqxtS2FvQJiCEfITKr0obSdOOi9SRBIPtXA32tRq2ahjuas8iea2SS6yZNie
	w4sU528xBB+kcWSx4jtxNaYOTX3UfopGasV/yYbpq+zA2PsJHg21WTDzloaXVT4hInv3hne3geZ
	XZ4YJ2/gG4HA4aN7+T5L1/YNjZek4XVMLef1WfST/hCBMRo8VD2Tx7m6Fzfz8hI5//dZClc1i93
	qsTU74Duv8RFYV0wfKo6AXZ8UfWjljXpEJrgMj5+/uY8/QhcdJqtW9qCBTnVdC7LxOM62XBcxWL
	a0IT6y+GVvnqOXI9tY0ij2E8D8rXrXnT2NyImfMlxcrWLKIenj84YZ5+7vZQmgTSZVkJ2kgLDK9
	dvQjw9hIMdG+lIQmfDyYocggwITmVTAtWDzma1BDvzb/0yfZFhGhky8Yy07JfgN3wG/Q64ZACup
	GO4+mj78OvFXSORe1GhCuobX4Ct4B0HqhWpA0kmATiMn/IxW6TLV8E9Iv1jqQiNpmkDYnBbf2V6
	eUh2g2YMHayGer5AftXwMl96nmuuu6YdK8wRaJ4/64xE2oQi1Z6TGqEU79RbLj7PHRTl7RCKhsP
	amBN
X-Received: by 2002:a05:6a00:4c0f:b0:84e:d5e6:a085 with SMTP id d2e1a72fcca58-856252523ebmr12427267b3a.0.1787908588234;
        Fri, 28 Aug 2026 02:16:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:16:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 7/8] ASoC: mediatek: mt8186: Handle regcache sync failure
Date: Fri, 28 Aug 2026 16:15:31 +0700
Message-ID: <20260828091532.600047-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828091532.600047-1-phucduc.bui@gmail.com>
References: <20260828091532.600047-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Check the return value of regcache_sync() and restore cache-only mode
if synchronization fails.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 44a521c3a610..143386c54dd7 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2743,7 +2743,11 @@ static int mt8186_afe_runtime_resume(struct device *dev)
 		goto skip_regmap;
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret) {
+		regcache_cache_only(afe->regmap, true);
+		return ret;
+	}
 
 	/* enable audio sys DCM for power saving */
 	regmap_update_bits(afe_priv->infracfg, PERI_BUS_DCM_CTRL, BIT(29), BIT(29));
-- 
2.43.0

