Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7EE37CD2B;
	Wed,  1 Apr 2026 08:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775032042; cv=none; b=eJcIuHW98fkaQT4tQ1IGng3QZ37P67bi16U7sSkOmja5sECPmx7H4IH1IarIpjOgK6y9yWqsC4q3EAtFn6/nu09KglnX1PX0XT7c4Ug9Moxe2ZjXxC1IsCvrdeOalQkJsO1TPnQ7vsomDiKIWL0+a5gir3gCumFhXUn7ITSdMu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775032042; c=relaxed/simple;
	bh=j42QuRJD7TrcyX2jEHsErAYkxOE3qtd7z+9afWWvbqQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oa/hCUhlE/Olve81943iefBtPf6F8tMaNg+U8rvBmVZ/mIImhHx8TFt2s0O793InHP/o3o6bBD//lJnrucmlrKlBsgWtZRKEBl8aqqm2doW7W+dWBbeIpmXjj9X1L+AAlSf4QgfznHI3MRNrjwr2BXPqj/+1ppZ2viJOZPIUlVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=kqyNx4NZ; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="kqyNx4NZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=IW
	c2s01wRWtaUx3xyT3BmfGeDzMCo2WjeriOHgdHCEE=; b=kqyNx4NZwcEQ13VuaR
	d17s6jzOeCCTxzmcZCUPeFAqLP4vZY7qeIHlVyQ7Rk5m5cXAsBFxF/yr7pJDiiSU
	Ujv2u/37uMkXy9RU9wyVd2Reordf8iB91Orgxt3NNKee17UV6UQ1ks7GL3pnCF0r
	eGp9T427c9hIpRE0D31p6eC3o=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wCn5nu91sxpCnRBCg--.3069S2;
	Wed, 01 Apr 2026 16:26:38 +0800 (CST)
From: wangdich9700@163.com
To: perex@perex.cz,
	tiwai@suse.com,
	wangdich9700@163.com,
	rf@opensource.cirrus.com
Cc: kees@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] ALSA: hda/cmedia: Remove duplicate pin configuration parsing
Date: Wed,  1 Apr 2026 16:26:25 +0800
Message-Id: <20260401082625.157868-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCn5nu91sxpCnRBCg--.3069S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr47Zw45KFyxGF4xGr45KFg_yoWfuFc_A3
	WFvrWxW3W8GrsrJr4jq3W0yry8ur1xCFy5Wr9xtr98G34DXw4jyrn0yF4Svr1qgr97tF9x
	XFsxZF47Ca4UCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRGFAdJUUUUU==
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCwB9ywWnM1r9Y4gAA3a

From: wangdicheng <wangdicheng@kylinos.cn>

The cmedia_probe() function calls snd_hda_parse_pin_defcfg() and
snd_hda_gen_parse_auto_config() twice unnecessarily. Remove The
duplicate code.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/hda/codecs/cmedia.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/sound/hda/codecs/cmedia.c b/sound/hda/codecs/cmedia.c
index e6e12c01339f..88dd80d987d4 100644
--- a/sound/hda/codecs/cmedia.c
+++ b/sound/hda/codecs/cmedia.c
@@ -39,13 +39,6 @@ static int cmedia_probe(struct hda_codec *codec, const struct hda_device_id *id)
 		spec->out_vol_mask = (1ULL << 0x10);
 	}
 
-	err = snd_hda_parse_pin_defcfg(codec, cfg, NULL, 0);
-	if (err < 0)
-		goto error;
-	err = snd_hda_gen_parse_auto_config(codec, cfg);
-	if (err < 0)
-		goto error;
-
 	err = snd_hda_parse_pin_defcfg(codec, cfg, NULL, 0);
 	if (err < 0)
 		goto error;
-- 
2.25.1

