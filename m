Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59E6356773
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 01:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028966; cv=none; b=qQgIH2WdW1aYZDbYIZr+7/5Idlubxk7wdT+qlHXH+6CYH2Th+8KfAHycnI9Q2iKUc6mhMeNaRR2eZ8p/Yx/DtU8TxZhPvrZ5XqxZKDXAm+ME+ZzBRTrEiPbdL3oMDp/Y3HiiiuTRyHoKrCw5x3Gu4U40tstBxXB3zbI1oDPRt1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028966; c=relaxed/simple;
	bh=wpmHgU/SVIYOTBhjMxKFXWaiqOI+cwOYjPVM8h1oB/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=El8BvLiAU7pWHdN4bCKDQT+CTs2ONKQP31/F6dnmFIw3bW04t6yCwMeAMO3j7yjDePurIxvjdGxJUEsk11RHbrnmM5ziIWYCubmZF5yPzJGdNBr1Iok6SujdiHnX2DelPtXvZjWVtICARqJ7QjJIRrxN/KwoLUmWYFIiImhSQgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r5O8gUOR; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r5O8gUOR"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e942864693so5066235ad.1
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 18:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028964; x=1792633764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uRhw/DGZE60v7F2bKWHVZMO73GmaBC+Vm8KSgOideNk=;
        b=r5O8gUORSlU2vLVAogybqf0jb2URV9XRYQ78gmG1pQExcpsFq5gsdRwLsjWCY1p9QT
         VPbjGAF4qRqntWBf3/Drxl5XkZODSTa5eFnr7xkJ5+oN6KReMrDrRKl9swE8lvRto0Vu
         cCUZVE7sgaoZWaSi8Eglx0cGl4l3XO+2isdhvTiLxVYZ3SXC05xQxKDgZzPW6w0OE8K3
         xeyev3Da2aqSKrjxWy5ZI1Da0vTtYs3n4AIpuO57ibPmYn5cZLuV9it0gq0TljmuQZLQ
         yhd6h79lhaJnMVbdmcXWP6DrzvFsOqO4bI4KNgON43jvHS87WBC/i0606YVzJ3yog7Ts
         8gGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028964; x=1792633764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uRhw/DGZE60v7F2bKWHVZMO73GmaBC+Vm8KSgOideNk=;
        b=bSQXRk/nDxNOFRYkV5aTwMUbzQ/L2kwG/cJntTrHzBSw4XH5cNUQ4yuCNiFJ1NW3hS
         8KlUZRE7Yjk0i5rm1TggDw/zw5dzPiSpw61L81KBkydIEywkWo9+F1+QlX3yOGM2UimV
         JNaTsMKLHAUXj1//CQiMpGS+fATFKOhhKqHkrR46LtMi1FRKt/VXU5czl0uVDX5N8BcN
         nVXyjA8UKBYbee8R7uA5+u1VQnvmT1oQ7MuDRHkYSoUewqjvhYjVeZMqKIByFCe86RvC
         pUl/DJZbb2B4hGzlkM+O4baE+OCaGuBYjd5IYTtf3BPRm/CYKbMpJWroLDl7+EyhEHxc
         j1/g==
X-Forwarded-Encrypted: i=1; AKwUvBwCQtVF4x5+AYGZGtg7t0CLx4xPKheYqiAhDZEPD09675BTOK+CS7dkPcosqd/iYgossfEW6IjLbgUE4w==@vger.kernel.org
X-Gm-Message-State: AFq9FYLa1RcAudVMUJFVOAAAqXEsV2nYT4WQkIf9uQji7bqma/SkWzCk
	fDAex3E3c0hOCELXr8LIPflVgm5EMfnGehJHY1qiFE98rwiWpr6vtvE2
X-Gm-Gg: AYBFou1bU1KAWnt0myh0s//rjl8CXE1lxESeT9eOctA6V0qW2TzzZ8NomyVz2DH1vre
	WUdbwTfvQNPzjL20HkO/Ql7OM8fk2kqv9dbF1Wo64r89w/VYsQg9q0f/BhdzaWR+Y+2kpCL25sW
	FpZ6ygoEVDy5vijvoGjyNMOo6Nj4RT/gKCPRq6055+7TP+PcdlxlPRwKngmFy28zx6V6bBIyb15
	o1gxsf+dsnzy8SVO/2AV+b2RbSZouaGGypa7jDhxdUs38ZHy19OEw9J3Ryf+nBJVtPDfzZ5zqAu
	zHHN6ngT4AhsKj14bSbcO5snbahIcV1o7jNFdzjco1u0na3SsrcoX8MHBmhX5CeMrZZK1hi2TY4
	Ek/46DwLPbJ9zgc5A/NqkwFLzMOqpgohfMwEea+WXar8aqk/9UMcdNcgB2UatwJE5tA+CErADF/
	t57/bGWIbLmH1SUhPb7ART335SUsSopodFldb+c4lB9PyY8deHrKl/fbiGKwjsLbYk7VRETgBoo
	4xR2AXbgDc8A8wkrLNvbp5OVTLA2JD2lZbAEKfSsN3/QD2EQhoRWqeDUN/t5OgpnaKhMZxtQFyI
	Oc8D4p6iRLFHiA==
X-Received: by 2002:a17:902:e548:b0:2e5:54c6:e5a2 with SMTP id d9443c01a7336-2e842820581mr176747665ad.6.1792028964152;
        Wed, 14 Oct 2026 18:49:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:49:22 -0700 (PDT)
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
Subject: [PATCH v2 19/25] ASoC: intel: atom: Fix .shutdown() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:18 +0700
Message-ID: <20261015014324.5569-20-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015014324.5569-1-phucduc.bui@gmail.com>
References: <20261015014324.5569-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from sst_media_open(). ASoC only marks the DAI as started when
.startup() returns 0, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 4889a8a73f65 ("ASoC: intel: atom: Use __free(kfree) for stream pointer")
Fixes: 6cc0f4e63994 ("ASoC: Intel: mfld_pcm: move stream handling to dai_ops")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index a4c8cbfba096..58681e007abf 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -341,7 +341,12 @@ static int sst_media_open(struct snd_pcm_substream *substream,
 
 	stream = NULL;
 
-	return ret_val;
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .shutdown() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static void sst_media_close(struct snd_pcm_substream *substream,
-- 
2.43.0

