Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA48389E1A
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 05:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534859; cv=none; b=Tg1SwFt6nl70dOd9xILsNDFlFOaE9wRfmT8jhIGZtVLR4rd9DL87RFUdm3Lh+XLZTStmG9vrpqFqeQFxQxu8ShgtEc994ExO2N3DJjNO/FtMDlErbmYaWG8UzLKV5CvYTtPrksA80FpvoA1rG8bzV/QqQLLUP8g/rJET0uP3sVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534859; c=relaxed/simple;
	bh=86gBoh26nC94bjujUtZG3l5WFFuaeyV07o+eqxx+8JE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=urkfKnd8hqy14Ol8HinkMu5l96B7Z5GooCNZHnaX3CNgz9bGlV6IifeqAG1gWD8Ggw/xwwnT8phF8oug2Q1nCNl2UqfdvOLCKv5EQ2YbglpPjfwEt4jg/JxTNEtkCy8hKxFlkcxzi31XhtEAY8HeXGCZHikCGHovzVadHEZipRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDYSLVww; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDYSLVww"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-868b2e5be4eso217165b3a.3
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 22:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534857; x=1790139657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O5PNRO0CdJEhOq1jWeluVyLPq+PGbJMv3Lvj1R4ejMk=;
        b=SDYSLVwwiMTyOO/pi336uFr2ceS6OvQggpmrOtjRplvsNJnLhH9CleeOekRXIsTmL5
         INyLEuvmlGOaOOxkT6itlIVD0zBBLM0IoahojcpkUN0SYzIC41jKZKqdK+cairhzuljN
         DVJPkr1pl2qeSzj34RRCYcC+o2BPjAkKe8jarMCnllWNY7jRE3Ljlv9moQv3Xyz8Z1Th
         OSyoCAogohrn82Z4m1orVEdnTrtA8VEDL4JMOY7REOOPKgVP2tfTDzvYmEA78qJZvRRD
         /fswG6FMlbKdIqmLXoXxrx8kxJ3SdPC/qpfFSAGJ4PrB9mlxV3Cwki3Km1GrFW+7WyPZ
         fRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534857; x=1790139657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O5PNRO0CdJEhOq1jWeluVyLPq+PGbJMv3Lvj1R4ejMk=;
        b=HL3l/NtdihDvHF9LYiZuJ2myw94O3t/HvTaz0W0BJrPz/wwxvJOV/oS5mVuD/URQgu
         QtxbMfIdBL5Mo7Kh62pFWt8jUJivcP+zHl2qSpg9Q5m/fL6C6Ehid5EROwdFTnLRb276
         3EAlrMLdpPtr6DqKJBsu6naas1WoC/ZMwL4yExW/uIRGiI0WA5V0DH7OScIeju2vx1qw
         n1j9TqIgVOUWrdb3IvNaGcSWCwz7VSRUfkRqQ/SnRsLw43Xyj3EH7GJLStth1CSPaoK1
         iDW8bQCZAGFTe9QT/QxjnrBx2HX8E03YunBI0AJtiq1c3iqntugrXm1mmUgy81JA7bvK
         c+sw==
X-Forwarded-Encrypted: i=1; AKwUvBwH2gWbhTSGfrcKvfN08N2CHE/HbgpseNBN3Ubc8dWmsZz69O5y0s4w6kq763ta/o8WK1gU5pNQk0W9Xg==@vger.kernel.org
X-Gm-Message-State: AFuF++mo/LeWu2HXxQg/E1oKU0IDh/+6jtK/zexaizDXSzlruWhsKq/l
	xH5OUlLYUsf6EOERFbgoVzd6JPcDm4MWkOx5Bz8oqeK3mzcZWD3cNlMe
X-Gm-Gg: AYBFou3xnfJ0XOHz4TwJxrdI/4EFE7Cr9plVNRZrSFDQ88N99WsFTu7vnoBWyYMOjSY
	e3eJU3OQB7Y7TIjlTuzZYUI+2BQtVIy/AjJ8CNKC/FW4NQscHLXiPLaq8nqSPSO9y/dY8SFBIXi
	bYsuwoSB40Wd+v2iRVo1XdkcQx1b4XxoU2ewA2eTCbXV1zRq8Ix4z+KoUS+W6Rb9TDXezXzhr9h
	SYEkn8WQOKot5cYuUqdnPoegMQNxcqxd3xphP6Q3G8VmnijZVzP6x6mXal6se8fEmZVRFUNRFPQ
	XFGrNdvjVJakczf3pfA3ZfRI9PoWS8gi2WrOKCVwzY+ZUORyYjvylb8ufPCdL2i6qNiuUhelSPK
	GMaMMo5OFYSGL9tpfIcOLAIZcQ6vcLnQhbb0U71AdHF1Otnd1niVC0OzR4WmpE5CxAqKvH4EOw2
	13ryfnsTv2repZ+W2t5PiFNVrYcCTPZY8EIjobgyYBUDbkquZ431fwQhrT+Twmn+9NNTejddq1E
	7B3zLJiFXcZa3Dxpzz8peeY+kxhtaaedrNC/wtflsvEYmv+D2vGJURHXDeWZbgJOarydWFVVP/W
	yrtWWNMc4vtlNqk=
X-Received: by 2002:a05:6a00:908f:b0:864:cbc5:b8dc with SMTP id d2e1a72fcca58-872378bbb6bmr2333682b3a.10.1789534853419;
        Tue, 15 Sep 2026 22:00:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:00:53 -0700 (PDT)
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
Subject: [PATCH v3 03/12] ASoC: mediatek: mt8189: Validate MCK ID
Date: Wed, 16 Sep 2026 12:00:10 +0700
Message-ID: <20260916050020.14575-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add Angelo's Reviewed-by tag.

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 56362c4756c9..7fe9d01006d5 100644
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

