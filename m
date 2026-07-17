Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464DC3D3D02;
	Fri, 17 Jul 2026 07:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784271810; cv=none; b=bj3OoeDRdDsThiGw7fJvLANUbHONzS1QWLFaC7QLL8C0yZDKFdrnCym3PGoUZ35zKBn3oFGjx4t6TtdFXCHyyLwSX9MCDuOMWRCIrSxFzdUZpVHn/AO0v8KU4+upZjRG/DfVLlbY4/MM7kQSPguW5NUYBjVcN+IzTYTPxdXJTGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784271810; c=relaxed/simple;
	bh=xdvhUl3fj3vEiBXcstZ+fMXyE6rnuAmvayHvcz1W3Ag=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CASGLOfjb6rxHrAiE9VcYMfKWUCGK4NT0f0R5R9LexTPJusZAFUzdN3hsNS97uzmfblAAZTNkOFLzzM3cgC9ibHk4CyWatBUlWKXStPwBkBIqc44/CyQxmZjbcRE/e2yLw8iXKt28c4cmeSxlHlBIJVujo3HRPGnXBNEcMewjj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=atWq+t7m; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="atWq+t7m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=S0
	B2VIO/6GVhMCL+cF6jfDnuUFJWU0nTzUHZodUQqxI=; b=atWq+t7mDXgUFe4MID
	XhOHn4vQqq/Batv6JubJxQ0LUZJUsqabQ+9QSk2/aSHhrOa/bpuYXCpnewME2jtK
	tp/alyLlyQIQtys3zaBMVy4nuJXre0uBJoWugK6UL6MgAqYQERFKmJhYOUXVFWUU
	sQEh/f4fIMwdSYfdz8MMTJ2kU=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wA3tYmk01lq70RfKQ--.38418S3;
	Fri, 17 Jul 2026 15:03:03 +0800 (CST)
From: wangdich9700@163.com
To: tiwai@suse.de,
	wangdich9700@163.com,
	broonie@kernel.org
Cc: wangdicheng@kylinos.cn,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] ASoC: mediatek: mt8189: Remove redundant else-if branch with identical body
Date: Fri, 17 Jul 2026 15:02:49 +0800
Message-Id: <20260717070252.525545-2-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260717070252.525545-1-wangdich9700@163.com>
References: <20260717070252.525545-1-wangdich9700@163.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wA3tYmk01lq70RfKQ--.38418S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww4kXrW5XF17GFyDWr45Wrg_yoW8JFWfpr
	s0kFZrAFW3Jr4rJF4ktw10kF1Utr1fZF98C34fXw1jy3s8Jr4IgFZ0v342krW8tF9rKF95
	Wr1qg34DGry5ta7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_GQDDUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC5wgQX2pZ06j6YAAA3y

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

