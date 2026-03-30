Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2301240DFB4;
	Mon, 30 Mar 2026 05:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774849342; cv=none; b=cTD6HezJKIuPJmiOQWaRPu3eQdoW95B60C11MyGrXbESzzswXwy0dXkOl4D+5M7dGtgDeKj+E9e99TEcxq5DSC0owNM3CpB9GODPybYfkyZh1Ol21NUfrxOzklfaSklvKLY/c1UEqCdObtTOBu4IZpnhsKB9RBANzvHu54hc3Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774849342; c=relaxed/simple;
	bh=0oX8jjY1u0OQhr8OMtzn7SolDIMjakfEuwOMI/WosOU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h5RzEvbYKxIa/d4e+wNITk4vIt7IS8nDlGEoEtP2FFsZ54101KPKeJoB/m8FhTzHKjTYgtBLXGLkcMuiimL0UbAHwMdt1TYdGDyCuY4hWn7dz+9dtx3KK8S76cgqBb8w1dmKUgr85iFhMmWBwvyvX/aJ7w4GH7L6GPrEh119dTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=XgdqM6Qy; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="XgdqM6Qy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=5G
	iscfhA7noZD4LhWjW3H+E2Ce9yLQ8EKeucqrZOaCs=; b=XgdqM6Qy4qaNuxXoQl
	J9BkmfKg7n0SfbMP18Z6oDUzy+1f7dMT8Tc+cdS/+4vhdy1g5ANb5NxZoUK911lV
	t5P1+OHNXgwOGJQAPXxlEmQg7YHW2GAKtMFiAWa5kbTy0//6nc+nDIMplq0MIGAC
	VK9SGntXyvizlERt8AwjFEXBM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgBHsF8ODcppYaQiUg--.137S2;
	Mon, 30 Mar 2026 13:41:37 +0800 (CST)
From: wangdich9700@163.com
To: perex@perex.cz,
	tiwai@suse.com,
	rf@opensource.cirrus.com,
	wangdich9700@163.com,
	simont@opensource.cirrus.com
Cc: kees@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] ALSA: hda/cs8409: Fix error message in cs8409_i2c_bulk_read()
Date: Mon, 30 Mar 2026 13:41:31 +0800
Message-Id: <20260330054131.434994-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgBHsF8ODcppYaQiUg--.137S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr4rZry7WrykXF43GryDJrb_yoWfCFX_Gr
	4jgw40vFZ0vrsrJayxJr9YyrWSvrn3CrWS9r9xtryDta47Cw17ZryUZr1avrZ7Xr93KFy5
	JFnrXa1UC3s5CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRZDGY3UUUUU==
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCvxFUo2nKDRFZOAAA3H

From: wangdicheng <wangdicheng@kylinos.cn>

The error message in cs8409_i2c_bulk_read() incorrectly says "I2C Bulk
Write Failed" when it should say "I2C Bulk Read Failed". This is a
copy-paste error from cs8409_i2c_bulk_write().

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/hda/codecs/cirrus/cs8409.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/cirrus/cs8409.c b/sound/hda/codecs/cirrus/cs8409.c
index fad705092777..2d8f482e6474 100644
--- a/sound/hda/codecs/cirrus/cs8409.c
+++ b/sound/hda/codecs/cirrus/cs8409.c
@@ -268,7 +268,7 @@ static int cs8409_i2c_bulk_read(struct sub_codec *scodec, struct cs8409_i2c_para
 	return 0;
 
 error:
-	codec_err(codec, "I2C Bulk Write Failed 0x%02x\n", scodec->addr);
+	codec_err(codec, "I2C Bulk Read Failed 0x%02x\n", scodec->addr);
 	return -EIO;
 }
 
-- 
2.25.1

