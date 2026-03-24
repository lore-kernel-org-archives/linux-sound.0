Received: from out203-205-221-210.mail.qq.com (out203-205-221-210.mail.qq.com [203.205.221.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6F033B96B;
	Tue, 24 Mar 2026 08:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774341395; cv=none; b=m5+t0PVTkwV5SkrWtrOSRC/KGVv8MUNpFf3fR/Q6bM7sZbNiozEWFMlf1nWuneE9N6aoT0VXMgEkOkToOuopX+MI3ZEpFqIj9Lwz+R1Jwnhgc1eGOFvpdLFLa3hXlsFN7HmxKcPo7JO9f7gcc9sWn+H/sSe8wPFzh3JOJyIweus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774341395; c=relaxed/simple;
	bh=9gQxxKIxhrU4r7fFGMjBhYJwHathxBIRINAQ8gctbAg=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=touevlY/xIOLcVzcBr7ZqUSb9p+TuFJ8B+wqJCUmkpOINgjsRsKKAidq/2laF/7C3iXgswv+OCXA5UQS1CDp153LobK0xV7hRWZHcth+te66DQ1+ocro7mDQolD9PPKP54LIoBRg1Jd+xxMDefaVcX29yjQ7NdpBlSXnkTPUFIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=YKBdi79p; arc=none smtp.client-ip=203.205.221.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="YKBdi79p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774341375; bh=z+jl7E9AU+yhKkXHHdNJU1EmnLX1gYWpvH100gmUni0=;
	h=From:To:Cc:Subject:Date;
	b=YKBdi79purbmV9CnxPSDX+QcogHw6fiWUBRk9BMzADKoDCIwhh2NBk6ULZv90v/dL
	 sdH4PjDHTHO7TUmYPCbQAMDQGRvBbIozxBCAqBcXa22XaN4polpNlpZvQ1R3WEj4py
	 MZqAbG+dSuO6GdPyIp7p1NOH4gSnyjnypOSaysr0=
Received: from LAPTOP-KQCD4QBN.localdomain ([183.242.199.70])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 908A4EED; Tue, 24 Mar 2026 16:36:08 +0800
X-QQ-mid: xmsmtpt1774341368tasrx1xdn
Message-ID: <tencent_579D057AC557914CF739A2D9EAD045CE7306@qq.com>
X-QQ-XMAILINFO: NwU6Bou9okj/MvaAUCOozfhheNp9cj1GDoe/EkJHYdHAi5hwGn8fKnVr+htOM5
	 13a+JgXnYL1fRzncIUhsPaGZOnuRHVC12bHBw8PvuOuGWwGEbFI21Dny4KX3ny0hZPbD/Bh3UJPA
	 0ahC7qdHEA8iHco5v0MuOpnvPsdVoCF98Xs4/guF3gUWjRPRv0nCL0sLH6MTE61HOYstli86staX
	 NEyNKFF18VXFZQtUJEpFgAzMCPnLdTaOvbqmajTfvyDehZf6AkcceUOyHCq0K4m1n7RHURHKoDEF
	 Oi1RQb0T3xZSxejY5QaqcEv0JK/MAg8Q+DmFAoVoeuzvy0ykfaj3vshioAd27XEOfXkqmWisU8wG
	 CXYe9ar3IoaGQ/RLitpPWdudH6dqtJz/s7GLSuJ1HoYIfr4kdBCEPw+a/pm+5FCvHV80xi1eWwWI
	 Pa77W8BseHXBrJLxPLFplgTFmDMwMn0YWEC+SPJYHflKGVLeCNE+bC/F8JtoQw5foncS0sJD9quH
	 2++X9qg03q3banLiakHeIEgUbbwyv/+OnS8UVJrRSaDoJZW6cGVfD/jCDhqFbCsEDZIv9FJm36hj
	 jjvlgugHkvIMfF9cPzyhxGyDx5EWbGjp6rFjDlh0Kd35PLL8Bv0PkvkOzX4gqU52hbDTWhSdP5Jh
	 EzPsaAdBRtuxfN/tj2v42OLoGOSlQiyWWxRyktqORucy3fu47s8JeS2VKlw6R8CusGnw6ScWdLJr
	 DKRuUGuX9e8n4WDx37hVoBKJNN/kZwhV82j7OAjrms4+XgEPFTzPEIl9ms1l1nMd4ouM+pQAtbnF
	 Fto4X5pPAgs+ew59wcFba0vPXv7gqrRZ4W6gnopBd7rI+tJ3qMeRnGqxit4+PMmoiSCOZfGkcMri
	 8bsENbtKNe9DZ240ne4P7MSWl5nOHXH2XyY8uqjqE/XAH31fov04MUeAa4aR0Wc5pKTnwKCYu4Ss
	 4lcueg1oRr3SxRUWRt+BIUGvfYUcKJihDc7h5LCoAucrkUJ+cNDNdFvGk9BbzMNdvA+feorXNzZl
	 QFg2r3/HZfbrhMVO71AddEOj7aYW9fZjh7R3FnIg==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
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
Subject: [PATCH v2 1/2] ASoC: uda1380: fix missing return value checks for I2C operations The driver currently ignores the return values of several I2C operations during register writes, which could lead to silent failures and inconsistent device state.
Date: Tue, 24 Mar 2026 16:36:05 +0800
X-OQ-MSGID: <20260324083607.6914-1-2063309626@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix this by:
- Moving variable declarations to the beginning of the function (C90).
- Checking the return value of every i2c_master_send() and recv() call.
- Returning the actual error code if it's negative, or -EIO if the
  transfer was incomplete.

Signed-off-by: Wenyuan Li <2063309626@qq.com>
---
 sound/soc/codecs/uda1380.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/uda1380.c b/sound/soc/codecs/uda1380.c
index 9e9c540a45ca..55b03d1ac8d2 100644
--- a/sound/soc/codecs/uda1380.c
+++ b/sound/soc/codecs/uda1380.c
@@ -95,6 +95,8 @@ static int uda1380_write(struct snd_soc_component *component, unsigned int reg,
 {
 	struct uda1380_priv *uda1380 = snd_soc_component_get_drvdata(component);
 	u8 data[3];
+	unsigned int val;
+	int ret;
 
 	/* data is
 	 *   data[0] is register offset
@@ -113,21 +115,27 @@ static int uda1380_write(struct snd_soc_component *component, unsigned int reg,
 	if (!snd_soc_component_active(component) && (reg >= UDA1380_MVOL))
 		return 0;
 	pr_debug("uda1380: hw write %x val %x\n", reg, value);
-	if (i2c_master_send(uda1380->i2c, data, 3) == 3) {
-		unsigned int val;
-		i2c_master_send(uda1380->i2c, data, 1);
-		i2c_master_recv(uda1380->i2c, data, 2);
-		val = (data[0]<<8) | data[1];
-		if (val != value) {
-			pr_debug("uda1380: READ BACK VAL %x\n",
-					(data[0]<<8) | data[1]);
-			return -EIO;
-		}
-		if (reg >= 0x10)
-			clear_bit(reg - 0x10, &uda1380_cache_dirty);
-		return 0;
-	} else
+
+	ret = i2c_master_send(uda1380->i2c, data, 3);
+	if (ret != 3)
+		return ret < 0 ? ret : -EIO;
+
+	ret = i2c_master_send(uda1380->i2c, data, 1);
+	if (ret != 1)
+		return ret < 0 ? ret : -EIO;
+
+	ret = i2c_master_recv(uda1380->i2c, data, 2);
+	if (ret != 2)
+		return ret < 0 ? ret : -EIO;
+
+	val = (data[0] << 8) | data[1];
+	if (val != value)
 		return -EIO;
+
+	if (reg >= 0x10)
+		clear_bit(reg - 0x10, &uda1380_cache_dirty);
+
+	return 0;
 }
 
 static void uda1380_sync_cache(struct snd_soc_component *component)
-- 
2.43.0

