Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0706631DDBB
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 04:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123838; cv=none; b=L8J392Mk1wPR0SE6HA2fAk2QqI5XAVQOblyNkrws95Q9/aqjPiN260ZOhPPLal728Rc8LorUFi1nq9DGHc53bQVVQxN+JZ7GO6Upx6G77TJ5zCSfVKPnGBaeutVn1hQJVKkRuV63GpIIWbTEP8N1MCbeE4qGid5H0xbwkp/swtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123838; c=relaxed/simple;
	bh=6DbU/lmMa56vZUldhssy3WWvEn6fSDga+TC7sPaI04Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BB2Lf8FddwC9mrZH9uNbJsmtpwlCgqiDIOqmMupUVWwtyP8g6DPE3el+/ioCWRmXXT5LR/0roDRCnUTGo0fwGfTJSosj1TWJs6D8jsoCSsIJEwKtkNSly/L5l4DkjwGP6fz0E+M5W30fJoaM7IUJQb4AaqgQqja7AVNPNriaqqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/mtWPSq; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/mtWPSq"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e812e2b31bso34989585ad.3
        for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 21:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123836; x=1792728636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QFH69Gbmd4pLwYRTdAmCw0agJokE4nomqHT+KuDYM2c=;
        b=O/mtWPSqVqkqW2KAaz0BD7lHiozjm5O8Xhd3n2ZaXt2C4y1QqMgYoinNz0LNblv0zm
         H4ny7/WzbEmreH3/52WzTofJeVUNnSOVexPg6GnEnI+wyMzYuu0pErvkBPRBzlLH72/l
         D/I71YKL8HHxregDpZWntCtdWrE2PJ1qkwvbkAv9zukfELyDG6GNacFJXHgkuj4TR/6i
         Wo/0dDIhv1NykhMFNN6pglBbPSGnVO5dtdcEggyQXcKZdEPg0AtWrRLXCnLuvs+WpRRR
         sKzFN8wyp44xHzBdIEtty3F7J+MVlGUxa5WDZioMJBLvtpWiNgGEFjWgzY9mdKLdjSYT
         ZDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123836; x=1792728636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QFH69Gbmd4pLwYRTdAmCw0agJokE4nomqHT+KuDYM2c=;
        b=SKqJy8KjzwwhfxVF/BKJcTj9hbXLUowUvf7Ak752TiKfhRC4bUQrjpq0y2ri5Wm6A7
         GNFRjHcILYLGx/19H1Cao0LwB6tOvpy8GmpQkVNT9rEUstH+s9gIO3zFdLJFJD/LWEjx
         cwISI8brUAVQovK48UXUt+Dr/v+YNmkMdsV/jz/nAHs5sy4SYg7puiwOZo/NbFUDWSRr
         w9Cm7UYPoKWlQChfGSlfpF/BZJXIxCaJ5r17HoLSrLcsdHQgZJWOKeJmv+JuuHKTZl88
         FGlqwuGq5bmdJja7GGYdMhlctDLDGYCDyC5a5yAv/LsRveuq6JWw+4pYUdJyECz2wIGo
         xGcQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2OCSwqQ8zIuZlsbW/L0g5c/cliqj8OT7Nq63n3toyqj7IrzuSSJDWB5jR267KWktaPvj0PSfVQkkpjg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJTw04y++DbDJRtB+tJACRNvFDWb/uzJ31seqTn93qBGVHHGLku
	j89yIUJfZUjyHTed6tTaJYPA8AbaXOp/AlNu6ZOtAs03qMKH3sz/+h7q
X-Gm-Gg: AYBFou0gP6l7kLJ9zWq1xx52Wyfn9u9tG7oiY+PGtYRKJhj/5qHVevSVv1UaxcWOnF5
	n9jJtOnrPZ2//mTQrTJS9yUIwtMuz+4q/flYq7mB8nFpITVI4DIJKDLGalGeW81nxRnSyKAwnQm
	a1RMe/jEDXIWW4WXcCDhVD7L6usAjghPIFz0Ks5QcbtGLLbHmjrSWwvFU+6jgA9m/cNubdh5fMB
	kwVy2ej1XWPOgrID21ByEbZg8abjnQadyqq2By6Cqf4W7w2MlSjnHQuwGlkyrxbapbniib7QeDh
	lSpJBL2bOkJM3+y2QpLXz6yXruHm1CJWOKAWG+cvRK1S5F+OA12kZ6/A/hZQBCi1r9X31bw0w9e
	l6OFGgZlAWlREr7PU7VIvCJOtOYkpkLW0a0ivBJGaJUvqKpv3PDIBLbqk0+salvwTprDJjPD5S5
	qVvEcfywEhe/JUMtkvvxWmafpHq37ZeBHZyOlc/Yc7e9npSBU6om9ZMDmeXewipwYnOLXdqjm2y
	a3CWR+bFyFbxtxmV/hY0Rv9uixLolKmG6Jm0MU883lDokDnxex5sXrLq/9BMrpEVRSC/jOZpD57
	9x4GRoMZ4o/maXqjmrp0/zKY
X-Received: by 2002:a17:902:db0b:b0:2db:3b35:1ac6 with SMTP id d9443c01a7336-2e8427efd9dmr210035865ad.5.1792123836136;
        Thu, 15 Oct 2026 21:10:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:10:35 -0700 (PDT)
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
Subject: [PATCH 02/11] ASoC: apple: Explain DAI startup return value handling
Date: Fri, 16 Oct 2026 11:09:37 +0700
Message-ID: <20261016040946.521195-3-phucduc.bui@gmail.com>
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
to ensure the DAI is correctly marked as started and prevent
future changes from reintroducing the issue.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/apple/mca.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 3585432ad49b..26022a42a95e 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -535,6 +535,11 @@ static int mca_fe_startup(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked as started.
+	 */
 	return 0;
 }
 
-- 
2.43.0

