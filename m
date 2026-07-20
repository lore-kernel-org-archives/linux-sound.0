Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276EC397AFF;
	Mon, 20 Jul 2026 08:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535432; cv=none; b=fvXg/AwxOyEo9BUE9QdJKLN9Q32hH6xfg+iy9H72kyF4q0bG10ifTgkcxQD9uk2FzXkEQ7HBas/YNhwodI6pOm41lUxgAv5Qu7FR3Bdh99h5bMO/NDEKkLvTASOVkM38DpxPCiNz9RZD13qngkTvSdkfK0wMrfb68y/Wg1+DXBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535432; c=relaxed/simple;
	bh=YQZMSk3A3qFzF2G+m3yaR9eGD7IxvZ6SLifMK+s0d5I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XkHSt/ozowrPsadsXqtvPJW4U4/Pd54UiIFVY9PrkIHDe/kKvSkQqXu7tWTcd7UQ8MEvEvBygGSPet5j+wiHDjnuoBM1MaElo8MqraTWKIxobVcL7F+R1GpYOsgehfCa/Xjj7+kM7Ry55HfeO6I8uu7BhlFgDvb0oNqC2C1TpPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=AQIGWBQh; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="AQIGWBQh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ky
	VYIIldOfsGh1dLRJRpJr32JPedGYx4IG+0KNpE3G8=; b=AQIGWBQhnNV8mJPt+R
	ynRlv+A3yPBIDE/6OiS84EbxrYGHxzxhlv+nN/IYFyFspLWn+mpzRt1qOGpTp1Mg
	r/CPfszwYKR2d7PIYrJsYTGmU9XgqNoc67YldX6Qtpec2/sMeDlJWES1ttRk6cSK
	5Q2he/A1r9uW1ZSW1pI9TMKgA=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3nwJm2V1qBNmrKw--.61455S2;
	Mon, 20 Jul 2026 16:16:40 +0800 (CST)
From: wangdich9700@163.com
To: tiwai@suse.com,
	broonie@kernel.org,
	wangdich9700@163.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] ASoC: tas2781: Use correct calibration data for SINEGAIN2 register
Date: Mon, 20 Jul 2026 16:16:16 +0800
Message-Id: <20260720081616.631413-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3nwJm2V1qBNmrKw--.61455S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr45uw4xKF1UWF4Dtw1DKFg_yoWkurXEkF
	43W34DZr1UWFn7u3yrCr15ZFs2va13Ca4xC34vyryDAryUXr45WFyvyr1UCrn8WFWxCay5
	WFn8Wa4Iy3yY9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sREWlytUUUUU==
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC6AiC0Wpd2WgNMwAA3L

From: wangdicheng <wangdicheng@kylinos.cn>

The SINEGAIN2_REG case in cali_reg_update() references t->sin_gn[]
rather than t->sin_gn2[], causing the second pilot tone gain
calibration to be programmed with the wrong register address.

These are distinct fields in struct fct_param_address and are
populated from separate firmware parameters by the parser in
tas2781-fmwlib.c.

Fixes: 84d6a465f211 ("ASoC: tas2781: Support dsp firmware Alpha and Beta seaies")
Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/soc/codecs/tas2781-i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 9e6f0ad5f05d..209067e98e1f 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -1310,8 +1310,8 @@ static void cali_reg_update(struct bulk_reg_val *p,
 				t->sin_gn[2]);
 			break;
 		case TAS2781_PRM_SINEGAIN2_REG:
-			reg = TASDEVICE_REG(t->sin_gn[0], t->sin_gn[1],
-				t->sin_gn[2]);
+			reg = TASDEVICE_REG(t->sin_gn2[0], t->sin_gn2[1],
+				t->sin_gn2[2]);
 			break;
 		default:
 			reg = 0;
-- 
2.25.1

