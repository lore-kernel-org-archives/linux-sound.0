Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEF03890F8
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 04:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123924; cv=none; b=fWaiBqkmrAAmANX1KY9IoM/RuFECVzxdNb/iFvykGJcZeIluJXKhXTa6oiT3cCD0yvm982SV6yE8ywckR2OJusYYIfYFL3YLBc5ZXTh7FQGJJDF1AstLHgV1zHW+9zxxvK2ZDhN8XKVTq7HcQQODz8OExvjOQEmZ0is9EwVjZqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123924; c=relaxed/simple;
	bh=J+EeYnRsgcM/YnSU55c+lLcyk00OoD5ti7bbsMzTw18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZrUpoUapRf0lMXlAhPcn/fvl/KGSCwS+uPegeMEq770LuuSMHjBtc7on2a9oY/7OLQxcv3gmJVH4/asak8vbnwpHDDPT06ciV8LCaQ+kaZOs9qa9OSaxNK3GYyiAHYZ/pvyxfmAIYLUcu4dDUY51JRTzFF1zkdQxNY8rC5QNnJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lONT4Bgi; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lONT4Bgi"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e5d0ee1951so38758025ad.0
        for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 21:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123922; x=1792728722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7rWy1nSOU2shSy9HWS2JIxQi3sc/L3puAcABYmBjXjQ=;
        b=lONT4BgiWQl5XSv07ELHJR2qKO+JCC+TsHxbDPRauFqyS6u+wSSfT4JuqZaFe4q+Um
         +MDF32oLLtvfn01i6qtcPnlG108ZmHgfjxN6ym3+X4WPvhcx8+EjwN0ew0GCxhlYOHXR
         e9knWEQcCsFhCpuZKSicUaOsyFHhC11hLtzeHn/yNZjvEe1GqP4pf+0ph1RZP1R23HBm
         4Gzb9DNvfedUG7gm99vuTlVtVwZeC9/jnCsPM4+ucX1gT7SQ1xdiSGywWmMOfB6Tx4Jf
         oPeOa8E8Jh5ckliCB7dnTblQhXWz2BENY3PSnBjQmzKTW1QuOlcawSR5PHY8/jSiowVM
         Hj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123922; x=1792728722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7rWy1nSOU2shSy9HWS2JIxQi3sc/L3puAcABYmBjXjQ=;
        b=aoXnecyoWkh9AZFQXKFxshg2PeUZYhRZR0jl2FtGRc0t40MkC1zNOnbGstA8bkfPg2
         vr9tGK/x2UP6rXQ0JfdyVC9N51o6KM+1teaof1eB5Gh5F6qnNMz6jx9d4egvS2XcpYL7
         q9hIIcksdFE1pJVkEV9zCIfYYYZyTUBWZoAlZvnNrkSd9YmYmoV/uSGkos5v+UowZq2k
         oHejfydWThmiruY8DLD9TqzqC9SKDprkd8AT0bymymGFYxuD1AadDPPShYTnfvcQgFS+
         y5jlv6ZFEAKLl06IFigjsnRnkdPl38L0CAQX+3M0VZ97hfhdKadW8W/13ebFwYkfG4xZ
         uPuA==
X-Forwarded-Encrypted: i=1; AKwUvBwgjo/o/8Yut+zE5AxWx4f2iqmm0xbl3V11w+oHSGpB+ZkOqLZH/XifpTGbLmYe5yFCsd0KTASt5Tr+Qw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJS8wVrOVev0WXix+bfIabSIDppYKBtWFWmqU/BE8vrq4GMNEqc
	QqKCW3wWRf60eoCiNbOokI5n+tQi1M4RRklSW1PypjM6ki2Dr3+oa6/q
X-Gm-Gg: AYBFou1DFuPJXPfKSJNY704LK2h0kqF1QDfTzt7bl3gIvMXxcTEu0/DrlRK/lrQ6orB
	+fQ8U9BEwNRpr2LJ0IlZc93d/w0rP9KuqtBLqdiI4LPLUQATy83X3tbMs4+fESMKQseqGOTMNgl
	Aiku+13CROKPMZViHytBW3VBE8FcBerhc17W/nOTJq9OpV4XoHYqA9gXuMSMysp0IOJEp6mrDKo
	UaAq+GTwM3UVoZk9GoaG5aKsAWI8o93YaOX2FXZVvshvjacCn1GnlPKSEx/J2qxdBku176GvWou
	NEi76VpwXt3zdwHJPBV1yCqz43Sg+i3JLB8St13ClGF/7J7NYNvR+tYUG2U/LXkPljDzATAjKws
	V/mxdkzYqxo/CzSUE0U/TqtiVwp/I8XzqyetJ10kJs+Ao8JZ5y6w7rRWiU66iu8VsHw+A/mN+Ln
	uy+RSu6Dphg+CHpwYffV4yTunfL4lR2ywdnIHfsnzSgXWYVD1i9+YF116u2ujjD9I2plv01RId0
	k7OGrf/Vn+aIEeo4VUS/x848MgK+o99IE8ISII5QCLiw1/oEDuZ7YaL+dr25y+1Pl4QJbYCm9cs
	sBiShGiO8lFTSQ==
X-Received: by 2002:a17:903:4b4c:b0:2e9:66c4:1717 with SMTP id d9443c01a7336-2e966c41865mr35460075ad.61.1792123922489;
        Thu, 15 Oct 2026 21:12:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:12:02 -0700 (PDT)
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
Subject: [PATCH 09/11] ASoC: renesas: rz-ssi: Explain component open return value handling
Date: Fri, 16 Oct 2026 11:09:44 +0700
Message-ID: <20261016040946.521195-10-phucduc.bui@gmail.com>
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

Add a comment explaining why .open() must return 0 on success
to ensure the component is correctly marked as opened and
prevent future changes from reintroducing the issue.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/rz-ssi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 2e297f721bb6..9f36fe2c16d2 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -946,6 +946,11 @@ static int rz_ssi_pcm_open_pio(struct snd_soc_component *component,
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure the component is correctly marked as opened.
+	 */
 	return 0;
 }
 
-- 
2.43.0

