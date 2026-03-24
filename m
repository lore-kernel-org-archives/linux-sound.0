Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475FE224AF2;
	Tue, 24 Mar 2026 08:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774341468; cv=none; b=uyY+FzanwO9qV2KTIkJluAclkxrerl/KQ+cTyh2gSep1cTCEKEM3G2QVphPH+QabIJZHPVudnSdqV9w2xDgNNVmr+sdHyLhrl+5KXfKiDjmA1etWBrWXXOK5pUSK/FHiTOlp77I5fTkb+YrQ9ivfGxDdVBwQv2DQIrJcPea0eh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774341468; c=relaxed/simple;
	bh=ZP8y5non0bncziTAdyjdS33m/j0zQZYGGEi+xPBinIw=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=hWuAISE7sGMdoC1fRIw2pbJamaveOMIzlcTBHWWn0EeHKJeq51JrA9tRHPKgFS3ZDvriq/Z4//6Z4cp3G2LNyXr91H/pfpMloR09BhX08iva9FRi7JNXtrdr5fcXVjxv9SHiTbX89Bbo7DF1AEQOvcZdA6zueclEgLoTnE2Xhs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=zJPfLspE; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="zJPfLspE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774341451; bh=5Zc1qA/+UqU8zaBObWplElZ5xsJ2rU0T9AOSiG6h6LU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=zJPfLspEbQ1oAxIPZyODwEQM8ceRs+OIdLyXv1reBebj7tUb38AAQo+x5ShtAKuyP
	 +VBrEFhOVtKYTMzx55GHCD39rhvSATkh2XHX/jWrPilZouCJXfsuAPg6NSA5YGOtsW
	 G4MRN+gg5rIxv/198ZyHDyR5Z4cbY/jAC+7xbrtc=
Received: from LAPTOP-KQCD4QBN.localdomain ([183.242.199.70])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 908A4EED; Tue, 24 Mar 2026 16:36:08 +0800
X-QQ-mid: xmsmtpt1774341374t9nu8g8z0
Message-ID: <tencent_A26B55F062F2B9C282A142BFC8BCDB1B9105@qq.com>
X-QQ-XMAILINFO: OIPiZ4jSkGWAAay1hI6nObGK1hBK9p/FgH/hT422+3d0XvQd1+uP/wjmjiKBYf
	 1q5wCHY4Y3i1/FGKsS6RdiRTYXajg0f/wS0wDOP06GzCUAmbDdJySaRfl/RZmzOYr5iKxU20voOV
	 Lcq4z/QGwnwyPuAp9Ce2yZUmKAiwOhhQ7tTL4LfazvcYstHwVi33QFfqIkXL5/KhiPXk0C8XUFLZ
	 xh0bdkrTvRCePz3MJB6lroe8VcfWH3/lTkfbrzlAxH1isX2qd0q7RXFSRkXhADLRHRvA3YsapFEZ
	 UUJ74w48mcib6fRGJfl0Oz1hRhbvt/oY8hr4QIMfCawzxXyIy7MRFPRBCpB0nThOGQ9x/cTKE+rJ
	 hmglIRdApZNZh8bsClnmkckNXThch06dlD98UlCqjiam50uryLH1Qt7ybq9MVyuJVkk9P3VuWEOC
	 31mH0GKJlnQVEcNlvmG5mGUt5lZFUwiS6iil2BjcN9i5w4Fny+dOJIfcLLqh00BFGvROIv5yOk1L
	 U9R9tyOjOUwzlmoBN2jH9vOKoqGF4gs15ffGs5mCXXV5YukTY5WO1i6pJaOVcNjQEk1JllZVLAwT
	 9Ti+AnhNoFHtQ1IiCNGHsiM2RGDLQwqxnQ/PG+kAGj0OJ4pumGv9A1DcsdJuvTzVCHH26UaBDU5Z
	 ALX0Nydf9mNTISxvDB/FywwkgAVYkp5CD+OR0MbHbaMM1JlS/S8buFT/2Pt979WRzOaosKnVzK9X
	 ynWX2/538+a9JFIXuvBVXinl1cvD0M3SLby9+ovQhMi9pbf+SVMID6QGItZYgMZujuJ8OXdZSm4B
	 /Uq9GNtwWIoMyAV3zoYtn1+i51+65DyB/0ren3352On2yK7d9BDmzseCIdJKof4FV/ZSKWKoJjTg
	 pKbunLO8SWUgHKvYw1VBfyA9h3wiBZdtDRX85NFjuhhZQ8yd5TJG8WiMnfcsfQVc7KrTBgeEPZES
	 Eh/M68SmYefHSQIvX9dkys7o996/v9xNBU+i9UN7+5C0EUuTC4dfs5x8bZhHxCMfRSlVnDfct4k9
	 NUbnB1VKDnAFMX0vXnNCNQS6+3b9sFe21nhcBMbIYJP3DmON3wypE7I0yj3bH6Z0DtJ1HsKM79nN
	 iaPGFk
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Wenyuan Li <2063309626@qq.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	gszhai@bjtu.edu.cn,
	25125332@bjtu.edu.cn,
	25125283@bjtu.edu.cn,
	23120469@bjtu.edu.cn,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wenyuan Li <2063309626@qq.com>
Subject: [PATCH v2 2/2] ASoC: uda1380: use dev_err() and %pe for better error reporting
Date: Tue, 24 Mar 2026 16:36:06 +0800
X-OQ-MSGID: <20260324083607.6914-2-2063309626@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324083607.6914-1-2063309626@qq.com>
References: <20260324083607.6914-1-2063309626@qq.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert existing debug and error prints to dev_err() to provide better
diagnostic information. Use the %pe format specifier to print
human-readable error strings for I2C failures.

Signed-off-by: Wenyuan Li <2063309626@qq.com>
---
 sound/soc/codecs/uda1380.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/uda1380.c b/sound/soc/codecs/uda1380.c
index 55b03d1ac8d2..63c3ea878fcf 100644
--- a/sound/soc/codecs/uda1380.c
+++ b/sound/soc/codecs/uda1380.c
@@ -117,20 +117,31 @@ static int uda1380_write(struct snd_soc_component *component, unsigned int reg,
 	pr_debug("uda1380: hw write %x val %x\n", reg, value);
 
 	ret = i2c_master_send(uda1380->i2c, data, 3);
-	if (ret != 3)
-		return ret < 0 ? ret : -EIO;
+	if (ret != 3) {
+		int err = ret < 0 ? ret : -EIO;
+		dev_err(component->dev, "write failed: %pe\n", ERR_PTR(err));
+		return err;
+	}
 
 	ret = i2c_master_send(uda1380->i2c, data, 1);
-	if (ret != 1)
-		return ret < 0 ? ret : -EIO;
+	if (ret != 1) {
+		int err = ret < 0 ? ret : -EIO;
+		dev_err(component->dev, "send address failed: %pe\n", ERR_PTR(err));
+		return err;
+}
 
 	ret = i2c_master_recv(uda1380->i2c, data, 2);
-	if (ret != 2)
-		return ret < 0 ? ret : -EIO;
+	if (ret != 2) {
+		int err = ret < 0 ? ret : -EIO;
+		dev_err(component->dev, "read failed: %pe\n", ERR_PTR(err));
+		return err;
+	}
 
 	val = (data[0] << 8) | data[1];
-	if (val != value)
+	if (val != value) {
+		dev_err(component->dev, "read back val %x (expected %x)\n", val, value);
 		return -EIO;
+	}
 
 	if (reg >= 0x10)
 		clear_bit(reg - 0x10, &uda1380_cache_dirty);
-- 
2.43.0

