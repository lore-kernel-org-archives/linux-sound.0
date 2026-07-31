Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D3C36895D
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 08:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785487314; cv=none; b=TPvLG5AoE3Tn0V8fvMvR237GOkd7Xxb/N/MhGQUjPXB07ggvajSPc4kiXPytuP8iI9yWqFDYIJ1ICkdIo9bz8b0ULaoDSm3aAyPcu8ecDFe3xgyYuDPJdo4vZDoELzPn91nJI+I1jOd/f1uY31MnWDOBUoif+l4EXVa3w9hHsc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785487314; c=relaxed/simple;
	bh=Uc7TP6I40GuIDDCFwr669EqEFMU4jzr6PAOxncf9iEQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OslrB7HpBVFdzqOdtXTGiFRlZ/Ux90bdTvJu5LsS3GOESHYOsyH8ZXcmrngHrIlcUUDbGjmiIptPFqmp9rHbyEuKQvHJaqUA6va9nZOMXwJBu+KJgG0oKcpMgid8ZnylDgDVTKzSbe1BoZaXCv0Q3P2QlyeIWZYWaWacyTdB/SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=L9/lHQqc; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="L9/lHQqc"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66V8fJ1M11767968, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1785487280; bh=ozFNFfiXZag/eLema1YlArEC9D2KXBlgKwoj1tvF/78=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=L9/lHQqcCdqUHH50uILLWp1fBeDt3oF1zPeL4MDJCP3ImQT96bqZ8aUHej93yV9ME
	 CWob4flWxXQ9m5qgD73rXhz3sKfOnJF3uTlF1JkjxbTQNI3zQwCB9YQ96+RGX+9FtI
	 HZaxfAtXx5lrgRxhBzGlXXLmhAfzpJtp5A4DXwLbntGk4heODbF8JTmShasChN2HWu
	 KNxWOKyOfbbWTtUBga0V76HCMHa7elKVnVl4y34p1P4AHqHXgGY5NN6aGKWNi7AuCf
	 WOZ4YMzdtfnCfpLizo6Gd7xUiRRPwEDIu7lSFfjnhCwLPPczp8IVOCx6TzTWNtoU8R
	 LixlsaJrFRE/g==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66V8fJ1M11767968
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 Jul 2026 16:41:19 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 31 Jul 2026 16:41:20 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server id
 15.2.2562.17 via Frontend Transport; Fri, 31 Jul 2026 16:41:19 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: rt722: reinitialize rt722_sdca_jack_init() after reset
Date: Fri, 31 Jul 2026 16:41:14 +0800
Message-ID: <20260731084114.4142106-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shuming Fan <shumingf@realtek.com>

Check whether the .set_jack callback has already been invoked before the reset.
If so, call rt722_sdca_jack_init() again to restore the jack settings.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt722-sdca.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index a26253864d48..27bb0eb1ece7 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -1906,6 +1906,9 @@ int rt722_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 	rt722_sdca_amp_preset(rt722);
 	rt722_sdca_jack_preset(rt722);
 
+	if (rt722->hs_jack && (!rt722->first_hw_init))
+		rt722_sdca_jack_init(rt722);
+
 	if (rt722->first_hw_init) {
 		regcache_cache_bypass(rt722->regmap, false);
 		regcache_mark_dirty(rt722->regmap);
-- 
2.54.0

