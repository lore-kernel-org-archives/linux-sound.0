Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697ED382383
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 04:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123887; cv=none; b=Osn0pSLW1hdqXLOZ8GJBHXyiYqC2rT4k1mIQIo3ArF2S7EtieFQFQP0lIRO9rEAndm4fIfMNOZd1iJLBSxXmw03FkJ88wydURDsQThEFGnGul8rLLnCQznPYGDpAYHQYAzC0AQ6WqGHSnIARbY4DCzhlooi202U1CV5HiTTvcic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123887; c=relaxed/simple;
	bh=8jX29D2gDGlcFjhAzB8ItddONnlX6s2Irul3cotnAzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eL8Wh1GUmkPAnRACLCAF32XxJtGZk2bLst+a6qzfIawzMVZSvBoPEgZElDw2er5TEUaVFhr8Zc8I9bhwlU2l6F6MumeUuOlbm6hLTokrY05cyyNbosottw8NfLdjmtrDciJkCZdKbqlQSTAdSxbYBPOUjMV+UQ20ZFqW0X0NcC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J52/XoIy; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J52/XoIy"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e608cd460eso33153135ad.3
        for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 21:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123886; x=1792728686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dFZz4n9YWSVULVEw1Vk7UW4bxuXJ2XFPuy179wpDhwk=;
        b=J52/XoIyUsku4lGTywabafWXjd6d7yYCdKd1xaJ9iocA+dCoTDCbb7WjF8Aeiljt2z
         xlo1qh2bRSPnY1tURj74frmVpZvzcBD6jLCiEz5/zq40q5lZ+6esFy1LPNuKm/jjhPdo
         K2cza0icSlU+1nVU+6jcOpPgyMVLwX9i/ltW40icm5ctxXV1p1LYgAv6shvsYamMwwHo
         06pTjCR2sVDmoPvukpNojAt9BDlUbqYneQnAYwbKGxmfCyVaZwH0EsBIeI+D+MVd/1QO
         nF2fsHU8VtVDy5/AfohP0taypfgStFwmXg3PXCXzGRZmDgCs13nzUWxJBJAhBRqSvnwo
         xy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123886; x=1792728686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dFZz4n9YWSVULVEw1Vk7UW4bxuXJ2XFPuy179wpDhwk=;
        b=zUxnFTeyq6ttiIQV3ptUV2/7wCYAL+A2iPvwF7VnIGAmP73oaL7CZWopl4XnOZDVzH
         bc9aPuYxMCqGsIdl+JjtNJMI3D4ucex88UkIlTjLtlI/4NDdZHLhJ+EJ8J8OBRv8kEIv
         NAhlK16CoOeqBePtwJjPrA+LXP6QiU4G42P8j0aLwJhsS1mNkm973U9arcLfxBAozOLJ
         8x1s4oIzenoXZKXrn0KjO2VDNPTmfuMNARhMrshWh4aLlsILzgpNgesKo21STGfihWoK
         ZJJqPkidSrH/A1TUvLTm4beoRxSc4diVUkNSbiZ211i0weokeA2tCIRF2kp9kluLuzhZ
         H2nA==
X-Forwarded-Encrypted: i=1; AKwUvByHPg6f+rbSYPGAesOZG+NiTXaIJZCndxiILxLHqg7kYLFqnRO7st9yEzOyEw5osi7fjlKXAc0xGeo0LA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKo2yNa8GrmpFYujFKbsv53Awiz0uBj94J36zkgOfW8xEpchnqp
	nAy2uF2unwl5JFfgKI+qIUMr7xA06Xp8cCk3Yuc8I1HAFs5QHoExyRcZ
X-Gm-Gg: AYBFou0IL0pQtf0OLXI93L76l8i6nkWAG93ON8N2mfVC72iJF0Wijy2+YWgPoK6s5BQ
	WSu6T3vijUQRNm9TQFSwNboOfugzVYRquFui0ykyJNmolOF0fLlPRwqoMyBRm839b6T+WdUDcfv
	msTaDlY9dqI/CzNbDTB2lRvI21UuBMl23QZhNYoGBARGYdhzjIzdIPvjSGaGCbuLRxH/zb9eluF
	8a+U7odXH1mFebEv6Kw9yCVijulL0DcKXG93yY/rLds3VVzORbe0TXmIgtvhuQ8o3TTtfrTVRFs
	gSFOLfXcEC94ejY40e7EKqn+nQCbbQkwYOQhcV5Uwk/jeMQkMEDFVZiMVd9xuLQ+hgLmVTKBqvU
	nIVAQso8IYlgE63FGk02Tngw5FC5/7CWiIWjXHN4L0LTwIV9xc+obdPTWztOA5VcBd5a/qYPrAT
	ygJhdEgxZRG1dwHEcPkaccNzquuYX+5hNjIlW+aitB4kfhO3TB614FfbnGQEdQ4+w3xFGPGmKiQ
	tltdtWv79bS7W+V9PoKjlP9wYBkC6W+DF2I9uA6ldoDe1uj8Ujcj4qsX2VcTjrrDVXcLMP/Skj4
	v2rFQnCJkbm9Ag==
X-Received: by 2002:a17:902:ebca:b0:2e9:401f:f0f4 with SMTP id d9443c01a7336-2e9401ffb38mr56691775ad.16.1792123885664;
        Thu, 15 Oct 2026 21:11:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:11:25 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	povik+lin@cutebit.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>,
	Syed Saba Kareem <syed.sabakareem@amd.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Neo Chang <YLCHANG2@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	u.kleine-koenig@baylibre.com,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Md Shofiqul Islam <shofiqtest@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Zain Aboobacker <zainaboobacker33@gmail.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Bo Shen <voice.shen@atmel.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-sound@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 06/11] ASoC: intel: atom: Explain DAI startup return value handling
Date: Fri, 16 Oct 2026 11:09:41 +0700
Message-ID: <20261016040946.521195-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016040946.521195-1-phucduc.bui@gmail.com>
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Add a comment explaining why .startup() must return 0 on success
to ensure proper rollback handling and prevent future changes
from reintroducing the issue.

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index db1fb3b26909..58681e007abf 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -341,6 +341,11 @@ static int sst_media_open(struct snd_pcm_substream *substream,
 
 	stream = NULL;
 
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .shutdown() is not skipped on rollback.
+	 */
 	return 0;
 }
 
-- 
2.43.0

