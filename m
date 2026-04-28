Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0243921ED
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 02:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777343932; cv=none; b=aqs0t/Y92W/7sBbU6MFeM13BTHd14Cj+TsCNs88y6296Cxhn+gyFdPnjdN4Z3+eRfpbUlpzV9GAughtfeedhVIZ1l2Fw68FxnLq2klzB6GJl2x7uXE3tWxdOOvcs+QocHq9Q2YkfzpJJjdLvJTGPvXiFnKB/qZxYD7ZgEy4487c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777343932; c=relaxed/simple;
	bh=HOcm4qkDWglYvDINF7knSwgT+XKsrEoWBufD27DaLn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SONtvd9g2KntPR/Ux3CI+VSupDgfl9k/6/Io1wsR8BrPjh/YuUBLOBLB77RKkU6NGKgFS+0YqDVAOF4luaxyaosEXNPMZhrFe02gpvs+3VLUHSOLKwwYTEYraBXIN/88OlCmVH56T9zjI0dZQ4OnSZN/fOeLBQUrY2uPTYf/TA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kgB4FoWG; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kgB4FoWG"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6563f83ae9fso4983282d50.1
        for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 19:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777343929; x=1777948729; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GmbWusNrp2+62MHdadegYDv0GRGbm1Yqlz33D4lYo60=;
        b=kgB4FoWG6nEoI6bfCMt6yj+v2FdTWdQJ+iUM55CMSPioVRi9gv+vQOXnPLJfwLwutY
         D7Be0Pshx+Lu7SqF91X6i8+koDaEQWgyVhwY3VRf6BavuD5vC92VnDntFkEPXdyqLPoC
         C0XpMyJwXUVhtezeS4jykoAr/Fnz0GqXLctk5AYTCOuoaOSLJUmfu3MYNN6+V3Ba1yV+
         J/IUbaHIkoSMJBImtemFtoCtHV8p8kptjoP2MhMB3CiluvX9IKEtA/CueRyMBgYM03ld
         LPcB7iTmHp2DgizSDSH4W9Mfp6j5ZC6Ua8QekrXFPUX9YkpXpXbpq8F76tK630z+Wc5Z
         Av6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777343929; x=1777948729;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmbWusNrp2+62MHdadegYDv0GRGbm1Yqlz33D4lYo60=;
        b=pVzVEaPtGHLA9Bcj980viLFNE+baFWYldDPTuX2pw8BWG8COIOqLalu1p9CmJEzyYZ
         r0W3OigSoHoyHSJM16bh07/xXZMY5Cd8jyYuByBVvjPG10hl+J3/Vx+yr5YjDT7jiuRN
         2fIbHkkBxkuwJza5FSjA5ZvgbZthdUPJeNJT03Jhu5HH3nmAfKdkYHRzlz3zeVxVdk37
         Cbk+O+TnPVMshiysJfbMCyB4xaF/L1qqNjh6lsyCjUVZPwbsDfTZ6fjS4dJ/Xvh58QiW
         mM/r/2amhI1NFF+J1LZrVTmOro+XDQLMlLl6PVXXkkzVJlEOAGGMUi+hxG0EpqjP+GgK
         0SFg==
X-Gm-Message-State: AOJu0YzHPDcjjtoR8Ew957Jgyk81WWNSFtgwZHLv3Mi2dA0JIkINkxQS
	z0xwyG7r3I4e+yiydhdAmxAzYuMUA43Kg5ba2h92+Nm/MOdu5sUU0OJG
X-Gm-Gg: AeBDiet7QtbfVyp7FR2kcTPkwvz2uNNFHK7ReIf01kLPVjIKgQ89vD2OBqwZz74Klx0
	nWOLNc3+HiNHPZRAneettYNGQdp3tqD/MHu5Jc/8pBrpKmdzkolNVwibjFL9wOZGoqAKTYj8oDl
	vJelTuMoNCNLI6BwYpQeWGBPejdQB/aWIRrFnQxWsQZoQRssTCBJtUS32NSLq6VjWGSwaReYm7R
	dHFWWU9rTfdW0JWE1AqOy54pkATI97N8PSOeWl4vHZdxSYS/lHGPJR0pPYva68y0kKYY8WsdkEN
	UqG94ypgfktP2uROO7etQyxrs1+jAxWdqa5tG7rNZVq2KCTvYREMc+XtSa4O8Lakh6y4SDIfYY8
	dbXoycu0qo7VOzo3RVaEiFruvETdwcHs5uHcxghepQuWuONV1fsSgiNOZtPNQgAGH4LGMP9/3b5
	XTkDmymCmaKfkpST0eZs4ny3CcrQFWliAc3XkQCaEVy6e7ptY58cJYYgO6xRQQWaptmfx8CQovL
	yfH3Rf1bQCc
X-Received: by 2002:a05:690e:1289:b0:651:b7e7:eff3 with SMTP id 956f58d0204a3-65beed93be7mr976664d50.19.1777343929142;
        Mon, 27 Apr 2026 19:38:49 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65bee2afb03sm710987d50.8.2026.04.27.19.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 19:38:48 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 27 Apr 2026 23:38:41 -0300
Subject: [PATCH] ASoC: Intel: bytcr_wm5102: Fix MCLK leak on
 platform_clock_control error
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260427-bytcr-wm5102-mclk-leak-v1-1-02b96d08e99c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CQAxA4auQrm3SqToQr2JcDLVq5Ucyg4Ih3
 N1Rl9/ivQWSRtMEh2KBqC9L9ugz3KYAuYX+qmjnbGBiTzsusX6PEnHq9o4YO2kbbDU0WFXkPJU
 c/FYgx0PUi82/8fH0d3rWd5Xxe4N1/QCEw0s+egAAAA==
X-Change-ID: 20260427-bytcr-wm5102-mclk-leak-88016072a63c
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Hans de Goede <hansg@kernel.org>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1394;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=HOcm4qkDWglYvDINF7knSwgT+XKsrEoWBufD27DaLn0=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJkfZDe/Su9pc417zDl/mqKizyx9MRHVP5eEPq3YlcV4c
 9uOh7t8O0pZGMS4GGTFFFlWJy2y3NP14Gp93AoPmDmsTCBDGLg4BWAi628xMiwXin4fry7OrWWd
 //97TNlxo8cHzm4VcRFKLjrSfGmOsyIjw09xvehKlZn6h7n9n9aKXTyczv7c47XO3HuhzR6Vk1x
 +sAAA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

If byt_wm5102_prepare_and_enable_pll1() fails in the
SND_SOC_DAPM_EVENT_ON() path, platform_clock_control() returns after
clk_prepare_enable(priv->mclk) without disabling the clock again.

This leaks an MCLK enable reference on failed power-up attempts. Add the
missing clk_disable_unprepare() on the error path, matching the unwind
used by the other Intel platform_clock_control() implementations.

Fixes: 9a87fc1e0619 ("ASoC: Intel: bytcr_wm5102: Add machine driver for BYT/WM5102")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/intel/boards/bytcr_wm5102.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index 4879f79aef29..4aa0cf49b033 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -170,6 +170,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 		ret = byt_wm5102_prepare_and_enable_pll1(codec_dai, 48000);
 		if (ret) {
 			dev_err(card->dev, "Error setting codec sysclk: %d\n", ret);
+			clk_disable_unprepare(priv->mclk);
 			return ret;
 		}
 	} else {

---
base-commit: 98421d94a1a6dcc3e8582eb62bedeccecda93339
change-id: 20260427-bytcr-wm5102-mclk-leak-88016072a63c

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

