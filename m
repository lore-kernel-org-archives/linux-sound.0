Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527E41E9906;
	Mon, 15 Jun 2026 06:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781505924; cv=none; b=Xeut86XP9+nUWCoUfMTjPjqnAzBTLrP2GOKnK1A1O1H9moacVBHCQAl2zSeDsTATFrkx/klXIo4f7KsxAt42hlHeDcKUA/dXNxWacub41b8945paLY6BSesbuJ73SvtFm+K4flGzncSvnD1l0vfVLxJJ82QW6OFPz7uM3Y9BJzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781505924; c=relaxed/simple;
	bh=62tSpHVq6Ujs40FQsX/eNczDZpNhpiZwilrC8zBEA6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tTedqVHApiCqZyKT4MOG1U6p/E9/L17vgUCvkY/JROMy8t4KTDlM/JKTTcz2LDvNyhdKks+2x+Nv91BwpeRhtUTDPnv5FNRJJQIL1LmEULx0iX32Hw8QhnXBXWARCWUOt8smbvDF2H8lYa2/16+4l9KH2WtJXuRyH4LRmGe2fPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABHk8Z8ny9qucCTEw--.24645S2;
	Mon, 15 Jun 2026 14:45:16 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Kiseok Jo <kiseok.jo@irondevice.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: pengpeng@iscas.ac.cn
Subject: [PATCH] ASoC: sma1303: remove fault-check sysfs group on remove
Date: Mon, 15 Jun 2026 14:44:56 +0800
Message-ID: <20260615064456.28615-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABHk8Z8ny9qucCTEw--.24645S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gr43Gr47Ar1fWw4xGF13XFb_yoWkXwc_Ja
	4rXasYgFWrGr9xXa9xKryYyFW8Za9xGF1DKFs8tr45Aay3Grn5WF4UCrs3uF1j9397Cas3
	Wrsavas8A34xAjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbknY7UUUU
	U==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

sma1303_i2c_probe() creates a sysfs group that exposes the fault-check
controls. The check_fault_status store callback can queue
check_fault_work.

sma1303_i2c_remove() only cancels the delayed work. It does not remove
the sysfs group, so the controls can remain published after remove while
their callbacks still use the driver data and can queue the work again.

Remove the sysfs group before cancelling the delayed work.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/sma1303.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index 06de2b4fce5e..15435c7f2e12 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -1778,6 +1778,8 @@ static void sma1303_i2c_remove(struct i2c_client *client)
 	struct sma1303_priv *sma1303 =
 		(struct sma1303_priv *) i2c_get_clientdata(client);
 
+	if (sma1303->attr_grp)
+		sysfs_remove_group(sma1303->kobj, sma1303->attr_grp);
 	cancel_delayed_work_sync(&sma1303->check_fault_work);
 }
 
-- 
2.50.1 (Apple Git-155)

