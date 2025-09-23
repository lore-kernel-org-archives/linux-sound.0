Received: from mail-m3273.qiye.163.com (mail-m3273.qiye.163.com [220.197.32.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C471487F6
	for <linux-sound@vger.kernel.org>; Tue, 23 Sep 2025 07:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758614335; cv=none; b=OtlXGEdtTKeZKUDfuiKcp8PdRWeCMums7+1DEu+96XRlhXkLpQ7SMDTnfEOBf+b3sRLwgAfBuo9dpmR3eXOv4RMejw+lrX7I2BUy82WI5yBqk+A+UwRKo5fPmJe5XKqeC7RNrUUpcA7P1qMiQtf6/gJKJqpjNBfoBjMjuOdJWdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758614335; c=relaxed/simple;
	bh=qExylSAfAWJ0xIQPx7a7P+hk21qFgwDKs282S5wArxc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=osOmAWbQpCz9RLZa5lJXXnNzdgxGh64YZCrRbj/3jqKgGl/5a91zOYhqvVGYS6rHX7B59Mg85v4GWdD2tey51VHaWo7Z6wYXacYDzDlnH2eFGzmELjqnfI64BSDQO/hEN/5sOWmYMFKnydPciYnPmzkAnqTs3PlsnuSbDBqMkQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=220.197.32.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 109a44bca;
	Tue, 23 Sep 2025 11:22:51 +0800 (GMT+08:00)
From: Zhen Ni <zhen.ni@easystack.cn>
To: lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	daniel.baluta@nxp.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	Zhen Ni <zhen.ni@easystack.cn>
Subject: [PATCH] ASoC: SOF: Intel: hda-stream: Fix hext_stream dereferenced before check
Date: Tue, 23 Sep 2025 11:22:41 +0800
Message-Id: <20250923032241.1112260-1-zhen.ni@easystack.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99749870190229kunm6b4c4c0f94668
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTRlIVkxMGUodS01NSEIYGFYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+

hext_stream dereferenced before check:
int hda_dsp_iccmax_stream_hw_params(...,
				struct hdac_ext_stream *hext_stream,...)
{
        struct hdac_stream *hstream = &hext_stream->hstream;
				       ^^^^^^^^^^^^^^^^^^^^
Dereferenced
	...

        if (!hext_stream) {
	    ^^^^^^^^^^^^
Checked too late.
                dev_err(sdev->dev, "error: no stream available\n");
                return -ENODEV;
        }
	...
}
The caller hda_cl_prepare() guarantees that the parameter hext_stream
passed to hda_dsp_iccmax_stream_hw_params() is non-NULL. Finally, we
don't need to check the hext_stream and it should be valid. Removes the
hext_stream check.

Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>
---
 sound/soc/sof/intel/hda-stream.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index a34f472ef175..6bcaed86e403 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -450,11 +450,6 @@ int hda_dsp_iccmax_stream_hw_params(struct snd_sof_dev *sdev, struct hdac_ext_st
 	int ret;
 	u32 mask = 0x1 << hstream->index;
 
-	if (!hext_stream) {
-		dev_err(sdev->dev, "error: no stream available\n");
-		return -ENODEV;
-	}
-
 	if (!dmab) {
 		dev_err(sdev->dev, "error: no dma buffer allocated!\n");
 		return -ENODEV;
-- 
2.20.1

