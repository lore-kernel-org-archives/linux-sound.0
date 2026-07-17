Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD3939C006;
	Fri, 17 Jul 2026 09:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784279765; cv=none; b=S26tL6fsZRRMlsQgyPg4thTlEeRhXBoysOFhFPgukqmmeC/93WLG+w9eIfl9lqFQt7PMw4iHH5lvSECWcbIPFZJDczjPwbhO3vch5FlWsiGLzGVGYy7zzLR3NCFGItGt+Jb/9K7x3h79BfjqYDY+ei4tmamTkcFSn5Ehv5h//fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784279765; c=relaxed/simple;
	bh=xdvhUl3fj3vEiBXcstZ+fMXyE6rnuAmvayHvcz1W3Ag=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qqixcUyMsTsDX6zCvEIEv1gpU15eaGHxIBiSOGd7oY7WgHaP9lNzDiKw1uozhwrDyux5jALHZVsCxafCVpIad5P6BmoIDUX87a+bjU3puUxSVaTzUWJg20kl1muYCCTUxtDYZUurcjd4yfReR36B+6j/nwggSlCOnJGl2hk/VTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=lB6zBQc0; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="lB6zBQc0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=S0
	B2VIO/6GVhMCL+cF6jfDnuUFJWU0nTzUHZodUQqxI=; b=lB6zBQc0s8pWP4aBAN
	D+M8t9nzK+RjySrqoaO8RTCzAGvCACNOKw3W3v6UTUrYyeKRzqhfS7nWCrOkrSsx
	f4KEJKA7432pGlt9QyC9oFn/LyHVZlRmNJO9R6GdtvDk2uM26zlnVSwp55UHQBxm
	GLLOxa5Rds8Ahc/VIQk7fYn+g=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3jTm_8llqT1CgJA--.17062S3;
	Fri, 17 Jul 2026 17:15:46 +0800 (CST)
From: wangdich9700@163.com
To: tiwai@suse.de,
	david.laight.linux@gmail.com,
	wangdich9700@163.com
Cc: wangdicheng@kylinos.cn,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] ASoC: mediatek: mt8189: Remove redundant else-if branch with identical body
Date: Fri, 17 Jul 2026 17:15:40 +0800
Message-Id: <20260717091542.721877-2-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260717091542.721877-1-wangdich9700@163.com>
References: <20260717091542.721877-1-wangdich9700@163.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3jTm_8llqT1CgJA--.17062S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww4kXrW5XF17GFyDWr45Wrg_yoW8JFWfpr
	s0kFZrAFW3Jr4rJF4ktw10kF1Utr1fZF98C34fXw1jy3s8Jr4IgFZ0v342krW8tF9rKF95
	Wr1qg34DGry5ta7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEjXd7UUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCvwLdLWpZ8sL2bwAA3X

From: wangdicheng <wangdicheng@kylinos.cn>

Fix a compiler warning about a condition with no effect:

sound/mediatek/mt8189/mt8189-dai-adda.c:388:7-9: WARNING: possible condition with no effect (if == else)

The MTKAIF_PROTOCOL_2 branch and the else branch both write the same
value 0xB0 to AFE_AUD_PAD_TOP_CFG0, making the else-if condition
meaningless. Remove the redundant branch.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/soc/mediatek/mt8189/mt8189-dai-adda.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-adda.c b/sound/soc/mediatek/mt8189/mt8189-dai-adda.c
index ad5b9546ff63..5c41a6386204 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-adda.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-adda.c
@@ -385,8 +385,6 @@ static int mtk_adda_pad_top_event(struct snd_soc_dapm_widget *w,
 	if (event == SND_SOC_DAPM_PRE_PMU) {
 		if (afe_priv->mtkaif_protocol == MTKAIF_PROTOCOL_2_CLK_P2)
 			regmap_write(afe->regmap, AFE_AUD_PAD_TOP_CFG0, 0xB8);
-		else if (afe_priv->mtkaif_protocol == MTKAIF_PROTOCOL_2)
-			regmap_write(afe->regmap, AFE_AUD_PAD_TOP_CFG0, 0xB0);
 		else
 			regmap_write(afe->regmap, AFE_AUD_PAD_TOP_CFG0, 0xB0);
 	}
-- 
2.25.1

