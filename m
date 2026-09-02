Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1941B377A94
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 17:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788371403; cv=none; b=eudKDvvqvqhVePIAAlsSCX592O6vB3EEBIqphz+2PndJ+90ny/2whumS+FSm4JOtMkhDknZlUmlk+7CBAmoKu1IBuT9UHSNlC2Y02aiI0IEx9p7s/gYYgMFAgZIRAe4r4hqQDjQvl2dGG47DyGzsKFuy8obyHbwqCopLn/fSGQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788371403; c=relaxed/simple;
	bh=1pAy6kKMkATvkj+AU3EcJaBus59hBYFwa7SSmE3+JAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y51DJdysx8sEFVJwO6Bt9WWtrs1BzrLtr+S22lYmawSxYvES0cJ+EDmXR1/ErSQA9Gs/6Dtd/rQMUOOW5cH/7KrX5CP10dvNWo7K1qvOSpqVbFpzoFIodC46mmYugXsw8XPtV/G7eCbzbI0LSODr/7JxIydxlqPlaeeXURQueHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HioRwMIO; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HioRwMIO"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49cdc81f40eso9800895e9.2
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 10:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788371400; x=1788976200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JFmVCM/E9QWkXdxb1N7Xv4jQDK8JhocN0d9+kOjKq0g=;
        b=HioRwMIOfxItzS2QqjfGWfqJAEwjqwyCuw/qTuiTA96re9vB8KynZwYq2kVlawWP5P
         OZebXvvYzmzkQLqKWOVVKKBdD2zg4y6/Z+oGIjbZS7vC1OItZ8tR7TXCA7Q2y5MdRqSV
         jBq7YEoRVwjRP14dylWMGz5XEz9k76XR5gKz9RHJxXJsXTNd9JW9aA1HhDmI1ipQRWbs
         1qp7baaFdshs54QY3SeEdkNTYQ1Rfo3rcR7vjB6McqZen4MaX30XJ+YwqL5aUoW+dYU0
         GptmjQWHHHuOZRCdgKVh3fiN8LbrOJAqMrhapA7iOWkqYlSsjLHFpsO4AVWdWquJkjMM
         dM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788371400; x=1788976200;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JFmVCM/E9QWkXdxb1N7Xv4jQDK8JhocN0d9+kOjKq0g=;
        b=KYKXIMpjsNgzvRv/6T+G0+oIkzxITseMR7Yp+bEq1g2JYEUtJL7tcOIiXzKERpSKHV
         Jqbk+ppftPiJQjRoNwGGEVue+rvVKaM9nRJu53a2nj5OwuRoQPhIe3Mq4ReD8UE80e2k
         ga56hJ61lECg37Fv/MaD7BrHwnvuoAo3cHu/vu6sFGBPyCG5ylcjDsjpyGCqA9LLMoHu
         OHGV8EgCV3HCHGHzJy99gHDPWseyqGXIqWg7UxMkhrkabSyuqg9mvtc+99HBZYIdxg00
         NAl+tpCGyWoEShcK4EERoAroMmUVrQJ3iH3EoWtq6IKOF5knSPp//G4S9dYUHMO/XEu1
         zsVg==
X-Forwarded-Encrypted: i=1; AHgh+RryEulgGeYVoG5u790hkFWIjwvsgWVvv492rtkM1KZmUgWYQC6bNW+EbxiKy2OQL2g2w5fsJXjNDQIi8Q==@vger.kernel.org
X-Gm-Message-State: AFuF++m4nH2PHga7vkA0GabzkA4z1SToBwa3M1kvtv+fESqNiyRSNRUy
	FDh312qlTTg8eiOtduQwCCyQUzwJB74rmaF+AcFzP7ed24UT7sra98oE
X-Gm-Gg: AR+sD10J8/X/o6sdTA8g4Cu9GubH1cuekETAkV+t0oc5WZIW6m9G/If7JOi6jzAINIw
	HttYBMorRMf+bLvpan/QI8zn/1hwFXStvmKPHj1maFh2eoyZD0IfhLdGGblbtpLUwOCG+sobHo0
	gHFhDG7DEDH5SwKImgsfsvf8l432JzUSa87fHqwwqqGXvgYPpgtIJZlAUYStI33dcvtQZuqVw/I
	3wBfvDXX0m0Jd7NhV+KU4p/UAEnpKXQjt7Jc3cUOQ78Z6v2ToArBRnluG/lHu2/SeERELdA3b1a
	50sJ4z5xJ+lZAU6x/i0P9xc8r4MEll0NwOy1INuRsi8TgD5EyKxavu2Sual7GEZpiq65TRUxoJi
	YlMD5+NA0KmxUuPDwb7zVFxDsexppwYMpzpCqVhyJalvSEiF/Ca9bNN/ZvCD8KnS6ahdVCwqzf9
	2r1GYcFuMo9ILL2lFgJGMHyvnJZ1nTXavqRBs0IsceCywh15ofKoU4Fz3tb6kYNQmB/xOmQbb3B
	nWwpKRF4VOYKE/ZCwCcYy111/t9UOWOTOsecK6WM6oK2WzTN/VrD7AXO4llwZT+PijznieSofZc
	sAeIifqON2lJ4RYdnBHsNunlUmf3BQBPoJ1CUzljlW/0HCzgt9dicN87HbUpkoJketMSFRvvOct
	2t/RCFQ==
X-Received: by 2002:a05:600c:83c8:b0:49c:d52e:d0ea with SMTP id 5b1f17b1804b1-49ce581779dmr127859415e9.4.1788371399822;
        Wed, 02 Sep 2026 10:49:59 -0700 (PDT)
Received: from workstation ([85.186.165.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm141698465e9.0.2026.09.02.10.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:49:59 -0700 (PDT)
From: =?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
To: lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	daniel.baluta@nxp.com,
	broonie@kernel.org
Cc: kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	tiwai@suse.com,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Subject: [PATCH] ASoC: SOF: imx8: remove unused regmap field from imx8m_chip_data
Date: Wed,  2 Sep 2026 20:49:55 +0300
Message-ID: <20260902174955.207878-1-stefanghetu9@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The regmap member of struct imx8m_chip_data became unused in
commit a71b261c19a4 ("ASoC: SOF: imx8m: Use reset controller API to control the DSP"),
which converted the runstall handling to the reset controller API and
removed all accesses to it. The struct member was left behind.

imx8m_probe() only assigns dap and run_stall, and the imx8ulp path
stores its regmap directly in common->chip_pdata rather than in this
struct.

Signed-off-by: Ștefan Ghețu <stefanghetu9@gmail.com>
---
 sound/soc/sof/imx/imx8.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 7e9eab2e30347..c2b4d379a3a3a 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -36,7 +36,6 @@
 
 struct imx8m_chip_data {
 	void __iomem *dap;
-	struct regmap *regmap;
 	struct reset_control *run_stall;
 };
 
-- 
2.53.0

