Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94524324B3D;
	Wed, 19 Nov 2025 07:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763537124; cv=none; b=rnwBJsTne/Og3Q6ax/6O/oRZCpzP8j1i93iGH/DvwdzPSokGogW/wIO5/AcGCdv6KnmZep/OuiZs8erTPJl1VyWtSIdiLYov/c+F5o4/ioB2NF1o7eo4stEU4X0X2tcD3GzfQP2Kr1Aw+0scEzqosllxlOnI4X9pz7xmZSWcdzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763537124; c=relaxed/simple;
	bh=f11XPehRaRs3X7hHgpc8CfcKsu3urXqGbp+duvCCUss=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iH4x4HvinCyQGY91ah0JwTcWEuNQx80ZoEaLkzIp/1J1UF7ZfXnl7e039lWKQjSpSlK74VggcPE7au/a0lHPeP0rxBiQJ4HlOEqQlJ/a6vaKqp+9oPg1/f1LpxF0N5vLY18ZVPYoNg9CzCbUOCT8oauyToG9x3ZbvjnKYOtIA18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=YvAwswcm; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="YvAwswcm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=M7
	XLp2eIjfByT8SPnlgh7fwfD6c69I13Q5MqiJNl2mA=; b=YvAwswcmkavbPVtdB/
	lXcIVth1EClDlBMowqpWFrqnAOdTArSmN5Ze62v9G1AW2aX+DRQcp9sIdHiULhX6
	tWIm2Wm49dGjiJljt6yFFb0IyVTSNDHQnXk+fgoACSaGd5pljIBn1V/WSjczP8yj
	TTOzd52sJ7e9aeQhBpEw7Oyw0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wBHl66icB1pGZ3VBA--.257S2;
	Wed, 19 Nov 2025 15:24:20 +0800 (CST)
From: wangdich9700@163.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	cezary.rojewski@intel.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] ALSA: hda/conexant: Implement resume function
Date: Wed, 19 Nov 2025 15:24:16 +0800
Message-Id: <20251119072416.120937-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBHl66icB1pGZ3VBA--.257S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr47Gr4kGF4DWF1rurWruFg_yoWkJFg_Gw
	n29rW0yFyDGFsrCr4DJw1Fy34I9rW8uFyjgryktFy2k3s5Gw4Fyr4YvF1Y9rWDWr97AFy5
	ZFnIq347CryUujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbSksJUUUUU==
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCvwTmNmkdcKQCuQAA3w

From: wangdicheng <wangdicheng@kylinos.cn>

During S3 sleep state, if headphones are unplugged, we need to re-report
their status during the wake phase to ensure proper headphone presence
detection after system resume.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/hda/codecs/conexant.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 5fcbc1312c69..146ff65ccc30 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -264,6 +264,13 @@ static int cx_suspend(struct hda_codec *codec)
 	return 0;
 }
 
+static int cx_resume(struct hda_codec *codec)
+{
+	cx_init(codec);
+	snd_hda_jack_report_sync(codec);
+	return 0;
+}
+
 /*
  * pin fix-up
  */
@@ -1277,6 +1284,7 @@ static const struct hda_codec_ops cx_codec_ops = {
 	.init = cx_init,
 	.unsol_event = snd_hda_jack_unsol_event,
 	.suspend = cx_suspend,
+	.resume = cx_resume,
 	.check_power_status = snd_hda_gen_check_power_status,
 	.stream_pm = snd_hda_gen_stream_pm,
 };
-- 
2.25.1

