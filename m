Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE48FDF76;
	Mon, 26 Jan 2026 01:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769390354; cv=none; b=T+WPuqV8h5EX9qiTI1qaFktpfV1htL2/W0QaYAVEY39E2uZOhs4peVptvD4CPbum4ESX10Fpnn/f3k2KazBnq7h/lRfKHWlrVUnzZ7GEHVCB405iXqoSO0qXUkZK/XdkFR+X6J9J3ewPRtxU7p7wMhd6ahETFR6LppDjt/Q/xxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769390354; c=relaxed/simple;
	bh=2Hy6AZb53c+QGXxLPsebuT3HhgqTXhULx/Rk4QRGnsA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G231ziSX+24P1c3V72oM8NTvDtFSiOo+nyYt2EPqLYnzgohS9lL6iOtvyLuEh7+MVcX3FuK3Xdo7ew9QktDOf2xhLACU0xiZ2xRyq9YeoGz3bm1/qxVixrGwTevsUKeNw4DtksaSJLvw2K05NcvLTfDwcXORYt9WGQ+k/Rm21Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from localhost.localdomain (unknown [36.112.3.223])
	by APP-01 (Coremail) with SMTP id qwCowABH8Wz_wHZp1Jg+Bg--.35563S2;
	Mon, 26 Jan 2026 09:18:55 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: perex@perex.cz,
	tiwai@suse.com,
	andriy.shevchenko@linux.intel.com,
	phasta@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Subject: [PATCH] ALSA: lx6464es: fix a error handling in lx_hardware_open()
Date: Mon, 26 Jan 2026 09:18:54 +0800
Message-Id: <20260126011854.2447350-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABH8Wz_wHZp1Jg+Bg--.35563S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GF18Kw4fCr4xArWUGrWruFg_yoWxtrb_Gr
	48Wr45Xw47JwsrKa4rtF15Zr4ft3s7uw4UGFnavF4Uta1agrW5XrWjyr4DXF97Wr4UGrn3
	Ww1DZrWava4xCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbSfO7UUUU
	U==
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiBwsSE2l2MU9KcgABsV

In lx_hardware_open(), if lx_set_granularity() fails,
call lx_pipe_release() to release the resoueces.

Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
 sound/pci/lx6464es/lx6464es.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/lx6464es/lx6464es.c b/sound/pci/lx6464es/lx6464es.c
index 96df00db51d5..af8d614381b5 100644
--- a/sound/pci/lx6464es/lx6464es.c
+++ b/sound/pci/lx6464es/lx6464es.c
@@ -113,6 +113,7 @@ static int lx_hardware_open(struct lx6464es *chip,
 	if (err < 0) {
 		dev_err(chip->card->dev, "setting granularity to %ld failed\n",
 			   period_size);
+		lx_pipe_release(chip, 0, is_capture);
 		return err;
 	}
 
-- 
2.25.1

