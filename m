Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B314973B0
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 10:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456236; cv=none; b=LOPy4bzvdZVGf0fuYEZKyscg0gpx+8oZqkGH8hTMeSHekDZs/jU+J9pB+IjuHOuQg+Knpng4smYyeScWOwmSTRWTdEC9jIksv89Y4Nd4HiwkcA6Kp+YSJPrwukuLbMW8D1z9lzkHotvKUkzTs8ae84KM8jUCjE4C7A9zHyP/5Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456236; c=relaxed/simple;
	bh=vvcbfnXGCnf5gP2K0RdApQU8Qozupvn7TgtW31CYdg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E+uG1JSHzgN6RFr6A3O8HzeYGPlIcx2DAbrDOPYE32eofcPu3GGfExBtZzlvZFV3e0+uR+YkCA20MxCVq3DTx8/hK38QnQS8yXnHwiNdLe9WtpDVsmE8pUVJPql2e2j1fRLZ2OHCFWQic0kAO3b52GoeqJ1h/kY8QfuC9bOqq3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxzTUXDc; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxzTUXDc"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35115b52125so3690897eec.1
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 03:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456235; x=1792061035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YXFN+txE8KZkOhxhM5jNUs8Hv1tuj3AnGefbY7UN1PM=;
        b=mxzTUXDcYksji9YSWkTAVlf70Zui5XA/DMqQVF7s5nvV26WxTIkE77uDz1NGNmNAcl
         6Lx5trTHZkMo2/T0mytIpLlnmaBC2mHPlJNORAJVmIjHr2aDEao+uF5Nu65SPM7PixEH
         d9UzYAOmE2YDfn6oYXbxJeWb9C5+sieuTXz1h5fP89dfTTdABrI1aOTvCsMhaSVrQOqr
         SYlhYadt99wruXItrKKg+H0XKhXAsyXzMHu4zHm0KZRQKNWmxblWrWDlzr0CyJHo+XmI
         VL5AMMUPbhqoNmUwCWGphWVxocNlEBFNomymmMlG43vIoQ7ghMCRsL4flXSgmmg/bWDD
         auYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456235; x=1792061035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YXFN+txE8KZkOhxhM5jNUs8Hv1tuj3AnGefbY7UN1PM=;
        b=LLwe7BuaywSzizA16urQk9XrbYya+J9MZTrHMJ+pLjx6zT3oVOFWzySK5GGkTXhIzJ
         cGyEKpingpEsM2TV2+/jLd6fTWbO1uJiScFy1y22AqQ0cVNLspWRxrOTYv+R0epfTsBn
         bdcKssQlJAdSkD/qTcE2kXj+F8MxUxrA9ysXxrpEMZfwsMoWYKPlKhMEOW1abQd2GSUd
         2LHfYv24V6sA1414Y9cgrvGXgO/7RGD6gWPWcfRUdodiPsXBMcYAEZg7Oa+rXk9pbqI4
         P5O4rvgL0TPtfDfTa7lNWCTHL9vzFAjf9e2NJdYPz87yyjS+wsKWBRm5mO4tk4x+z8Jh
         Mjfg==
X-Forwarded-Encrypted: i=1; AKwUvBxAg0dZJizPt3wljMhx7T6ojgwHE/FAs59ss9S8hcOAyWicE5eZnaSbRQafJJiXonvAMnFqMmWXqBPfVQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLbDZ1jX/SYWHp2UP9FTdQALZHhC90hgLwn0kRfVjkCYNig9r6+
	Kom2mcTMGxi4AH1SsdFrXq2hcF3cUSLVyaRbOiuCWaR9oP2kKS/wzi7I
X-Gm-Gg: AYBFou2MHKlVC1B7/ScbEz8CgJttgYAJHFGs96VDTLPkuCooaf3hFVZV5kGSkyh50Yl
	avwOgGScLNaMHuLxk7HUPxocVZrZKVvP2AJQ6VPn66GfrWMDChpT4mG+Trt4tXw11ZjmzGtgG45
	RpuiezgiXAw4VrN3JVyp03NPDJp8JvL2FRdbmyt+vo9QztV+B5TCDp3xeJfuavuzRW1MV2cbcwk
	ncQLRknjbjuNBVyL/zzHbtGiwESXDhi+pIQI02aGNU4RKVeUd59ujFSVII4hnk/vfAjsqj323Mp
	+lZRw9LsQooGv6jfAKtwgo4zhrYBvzEl5kIsavsHfyvEXJKHP3wJDOmCxSfS0cMe/jt+RGSJGpH
	nsfcoU+lLIzbGmEbMi9T1hVsI5WHRBeb+ll28YCK2kVy5DKMeqAgM0s491bEgLIdz8SMOdse5wF
	U2aNLjEtUq9EEV9DNy6krliOVAfD6hvECgCz2OYOMPS/Oz6P0tHwbcb985XO2aIL1njKFB+ZGvK
	MfH0FWwzS7Q0+BDPEeASqXgeD6wip47mdIpvYGOGAWOdJV21sYqSyZwm5MOQ8kslSxHICMQb7RV
	VzsDvl2g3se28TGQ+iZ+i4+pVQ==
X-Received: by 2002:a05:7300:fd0e:b0:352:3bdd:423b with SMTP id 5a478bee46e88-3523bdd4437mr1444746eec.21.1791456234716;
        Thu, 08 Oct 2026 03:43:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:43:54 -0700 (PDT)
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
Subject: [PATCH 19/24] ASoC: intel: atom: Fix .shutdown() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:26 +0700
Message-ID: <20261008103831.542533-20-phucduc.bui@gmail.com>
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
from sst_media_open(). ASoC only marks the DAI as started when
.startup() returns 0, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 4889a8a73f65 ("ASoC: intel: atom: Use __free(kfree) for stream pointer")
Fixes: 6cc0f4e63994 ("ASoC: Intel: mfld_pcm: move stream handling to dai_ops")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index a4c8cbfba096..db1fb3b26909 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -341,7 +341,7 @@ static int sst_media_open(struct snd_pcm_substream *substream,
 
 	stream = NULL;
 
-	return ret_val;
+	return 0;
 }
 
 static void sst_media_close(struct snd_pcm_substream *substream,
-- 
2.43.0

