Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF22497B62
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 10:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456082; cv=none; b=dPnNgUGzWQnHMPgHHDwqL9bnUCo4Fk8UbOtKy0jAniZ+GjkNyqGO4j0uK9UekKagTxBGbJsjYwLCRPiHxtXjDMImcN72z3ZsqIGgHwecM4Da6Bu+/jBr9N87I9CT6sTE7GYAUlSn809uSgPWeuS4iDaKraVrqOPQGwVjy4PXhIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456082; c=relaxed/simple;
	bh=jX20kt7q2qTPB7R7+kU+hL/352znpJ6GWnJmAMBJbuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mCb1BxjFp9Xltzxsr4rkfwt0rAjXQBaSewbevOb6BevhwcfLHUF3WIuXDjyHIwG5id2PqAoPOcXQmL6pfNkW4pSKGoXXcJz4rU7PpK5tkh1aK/408D3da/WrUyP/TIvJcTL33vnACZ3LbZPkOtFXIEv8AAGdFAypABZ/nsX3j7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXWCpqUe; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXWCpqUe"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3514e7cbbbaso5822010eec.1
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 03:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456080; x=1792060880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K47qRPAQ198u1Fkbi+cWvMQCeIpB3dQGzP07geOfbJw=;
        b=QXWCpqUeaNvjOPhdzkVCMniE6VaYNVOr4k4JbZ+hht4apWxz907kT4HAluZ8JyCSXH
         9Jdi51LBXBHJuDGKKaoVOwbg2ENHvE0xkcs+FbXWGl9wGsZTxFIQHtG1fnvnq6Ap76T7
         /kCkEEtlMR2MwIT6/I8N53vN/Q6PCuRkN0C1B03o+k3BM6YQaoo3COs7DqzflLChZTeO
         QHZKfhaTvUzS5YgmOwnYVq6oCsWyRW1Yci+kV+ax6qQ7I4JzDmkOsG8MDAfMBL0mfoFY
         ECqqsnNMKa4Bn/aQ19M6Cip5Hdlw75jUK4zJ0uUk4b6zG72/gJ+j8rlUtqALyekAA5il
         J9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456080; x=1792060880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K47qRPAQ198u1Fkbi+cWvMQCeIpB3dQGzP07geOfbJw=;
        b=E1ibgR2ta3ma+bEhscOEBQ7pnJIbF4Ri3IbkkrTTaaMkAso8F5FdPhYgNma72R3kX1
         OQ0CiPhu+YuLUsaSkJWB7kNIQtgnzO3TndBTrgQz/tXhq9eUPYpfRVI4Aor0t8W3eqnb
         gXMkWk9ku3T6Pje6nLVO3gq4zb37W+nikUMBoiyolJLbiAhykDbM6arGRYokpkRjEfRF
         Ys4fEmwBb9oXJAMxWWBG7gvnvn/i5L/Ly/7mhZc5gTSuk+tH0fGOUgh4JhjUBy9m4XxI
         bQOPRSerMDXlcgFKrd5dprA17EygfzFnVjZNe6bQMR2pkF15DaeU7oTo0/xmh41zh5gO
         /Z3A==
X-Forwarded-Encrypted: i=1; AKwUvBwJ4t8JmC21hhSIkez35CyxSYRO6f2KZK2WcIyu/LszAKY6Wof3kn0t0gb5rg2fB/WErH+4Ehz2XSiiow==@vger.kernel.org
X-Gm-Message-State: AFq9FYIjBhNH6FGCF7Ho3bAItq5ocWGx1zAkFVOQtj9IaoEq/FlW28jC
	T4ybldeE0zpJf6nrZvTkDbFUKg1dxoxJyCdnZNW6LO4lXtF5RJFqdz+M
X-Gm-Gg: AYBFou2BcNozgzYq3si8N6bImMaYzpNToFtbHj2OxYMv7hqRwYi8/WQ31GEPFEtbbLp
	cFK2XuysBI4vfOxRAS4De8n0fbsOdIrkSrkX30ST+amH4u9T3VrVFQJW9qFmpLrgFD+5hCCTzng
	JwunBN81UkETtL4b2huzDXDnzYo9cxu8zZY5qAhECfMv2PcEBuJuaZ3BHjIOieoyipWtcVQGbIq
	zR1pV1vLC/KcHJnvRniYGZQoSM8GdUcCWPMtNMsNR8qtCwY6xmyaDEQTIGDM1A5VAZMRTb5tTqt
	xPYkpe+RzBCTRMKcHsdiY7EkUpdEB0RRXo2HU/wM06vjxy9Ky5F6/zMZ47GQCGKDezNcFfpzILl
	speZY7jQ4WqXYQFRORxDMz+e2s6xyz/EPDL3F/CeOw+0B+cuIOmghfd1OOH/YXOIKTjk6n81JpG
	+ZkpqNVgX/A+wWzQzazh1iWE/oPLd5tlQhNad0s6n9dTE/fXN+OWf1Hw3mlET1CarLFUwQoJd97
	7qT6j/6SZJ6+iFuQrBrdHsyJaYF1kUSGhx2YpimvUUVPNFKhJFdQksjVSgrk98jx0d5V3IhS9Jf
	9osYX4/N0c0cjA==
X-Received: by 2002:a05:7300:6ca1:b0:351:4d2d:af26 with SMTP id 5a478bee46e88-3515d86f0aemr8805338eec.2.1791456079525;
        Thu, 08 Oct 2026 03:41:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:41:18 -0700 (PDT)
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
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
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
Subject: [PATCH 09/24] ASoC: atmel: atmel-pcm-pdc: Fix atmel_pcm_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:16 +0700
Message-ID: <20261008103831.542533-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008103831.542533-1-phucduc.bui@gmail.com>
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from atmel_pcm_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 92dfa6198623 ("ASoC: atmel-pcm: split into two file")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-pcm-pdc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/atmel/atmel-pcm-pdc.c b/sound/soc/atmel/atmel-pcm-pdc.c
index 374f93fa6e0b..552bfa30d4ba 100644
--- a/sound/soc/atmel/atmel-pcm-pdc.c
+++ b/sound/soc/atmel/atmel-pcm-pdc.c
@@ -295,6 +295,8 @@ static int atmel_pcm_open(struct snd_soc_component *component,
 	}
 	runtime->private_data = prtd;
 
+	return 0;
+
  out:
 	return ret;
 }
-- 
2.43.0

