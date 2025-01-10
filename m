Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEDE1CDFD4;
	Fri, 10 Jan 2025 10:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736504422; cv=none; b=R0lPON+581IRuyIVcaFd2RRB15WU96yLJwQEKos+YWM9ZqOnCXMFbJUOOUhaLQcogkWoD+pTTHKy7Z61AseekBHPofE2+P3tnhaD9lHxhTnThLhfDr1xeBZQCohk4mUJZ3s8gSPpKms6/mkvgHDGO/St6Ytni9S5aRi1EjPdurY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736504422; c=relaxed/simple;
	bh=S38K2cymcmc43p9xsoWCeOZ4rLP+6KJFfXEl7fXhA3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YPTctff0d+9HHFEE82zQQ1r08TA14qcRWF4GnTvIlaf3LodJekfjLeL/YROWL1eDyQm+X60WMUYbl/QdN9z1qXCUtYj4jkNKiNBm+hWze3cqJmLOzpKg/sulF7Cd7/t3TDYcO3KIF8sBOtq4o+WgcPBMmxk2g+cbLm0ABAzl2fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 7a1f2102cf3c11efa216b1d71e6e1362-20250110
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:ff9dc92b-982e-47d0-b79c-1dce32179f90,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:c0838444284fdc6a6fdc967029895c4e,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:nil,UR
	L:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 7a1f2102cf3c11efa216b1d71e6e1362-20250110
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 466538018; Fri, 10 Jan 2025 18:20:12 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 5778BE003509;
	Fri, 10 Jan 2025 18:20:12 +0800 (CST)
X-ns-mid: postfix-6780F45C-971251556
Received: from kylin-pc.. (unknown [172.25.130.133])
	by mail.kylinos.cn (NSMail) with ESMTPA id C813DE003507;
	Fri, 10 Jan 2025 18:20:10 +0800 (CST)
From: Zhang Heng <zhangheng@kylinos.cn>
To: shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH] ASoC: tas2781: Use strscpy instead of strcpy.
Date: Fri, 10 Jan 2025 18:20:07 +0800
Message-ID: <20250110102007.2695452-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

strcpy() performs no bounds checking on the destination buffer. This
could result in linear overflows beyond the end of the buffer, leading
to all kinds of misbehaviors.[1]

[1]: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcp=
y

Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/soc/codecs/tas2781-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2=
c.c
index fb8cd2284fe8..03d07ab8b41a 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -1658,7 +1658,7 @@ static void tasdevice_parse_dt(struct tasdevice_pri=
v *tas_priv)
 		dev_err(tas_priv->dev, "%s Can't get reset GPIO\n",
 			__func__);
=20
-	strcpy(tas_priv->dev_name, tasdevice_id[tas_priv->chip_id].name);
+	strscpy(tas_priv->dev_name, tasdevice_id[tas_priv->chip_id].name);
 }
=20
 static int tasdevice_i2c_probe(struct i2c_client *i2c)
--=20
2.45.2

