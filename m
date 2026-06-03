Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5520437DE84;
	Wed,  3 Jun 2026 09:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477916; cv=none; b=goroYiX+dEB/aEA8qlNO+9Kgc+Hdp/fqmTncw/UtBT5sbFrSH6Pb5+4RXdGHQIDd1ORgcG9ModTLBBSy+kygWZ8MgdmZYKRUDXp+3XMbyhTv2zGWKmbkCHR7taaGSkcE5RUJRSYDTT4lug1hmHczGvmJKquv6zfhIP/KV8xyXZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477916; c=relaxed/simple;
	bh=CNWuBB8dpCv6mXoWPiacYfCydx9Dk4FcSVwTgXNwvlw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y4vhlS99CV2dpnqslyUv9GhnNbfXX72iFKRkoOO8kSPLwSj97guKdMGbpx8S2dhx+EW+nQNikw/XS68xXQahq3jxZrPxXc+Znq7X6L6GJ1QNmZQA7K1p9/zQeg//iBn+DGXIMrr7elTnGBx/QOZCPXyVeu/iwVzChR6KzwvXkAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=lAK6eif4; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="lAK6eif4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=By
	Q6wfq1uLi5ZtuRnF7k8BOyEp4CDZqCFTIvL9hGPV4=; b=lAK6eif4cOHVovCkJ3
	Fc/EZ1SE9gploUlvETPG3sPXWvf4O6Tz/8hS/MTj9oPNnOuh6/8iQypw8wqTa3V5
	4fTQ0bUh760FwnEYbH9G+G6u/yTIPtQhWbejjyXr4ZANWz0qxtRDWIfWgp+GcCZy
	wL+6q9u9WVOkujs+mNER8baMI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wB3Vqao7x9qFpvVBA--.45986S5;
	Wed, 03 Jun 2026 17:11:34 +0800 (CST)
From: wangdich9700@163.com
To: tiwai@suse.com,
	perex@perex.cz,
	wangdicheng@kylinos.cn,
	wangdich9700@163.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] ALSA: usb-audio: qcom: Use PAGE_ALIGN macro for buffer size calculation
Date: Wed,  3 Jun 2026 17:11:02 +0800
Message-Id: <20260603091102.231370-4-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260603091102.231370-1-wangdich9700@163.com>
References: <20260603091102.231370-1-wangdich9700@163.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wB3Vqao7x9qFpvVBA--.45986S5
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr45AF18Aw4Uur4UWr1UGFg_yoWkWrb_Ca
	1xCrsxGF10yr1aqw17KF1Fyr9rt3W7ZFyxuFZYgFy7WFyjv34fZr1qqFZ5JF4kCFs7WrZa
	qFsrWrW3K392kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU0tC7UUUUU==
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCwAaP3mof78ax+AAA3C

From: wangdicheng <wangdicheng@kylinos.cn>

Use the kernel's PAGE_ALIGN() macro instead of open-coding the page
alignment calculation. This improves code readability and follows
kernel coding style.

The manual calculation:
  mult = len / PAGE_SIZE;
  remainder = len % PAGE_SIZE;
  len = mult * PAGE_SIZE;
  len += remainder ? PAGE_SIZE : 0;

is equivalent to:
  len = PAGE_ALIGN(len);

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/usb/qcom/qc_audio_offload.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index fa7ee61d6934..32982318fbed 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1052,10 +1052,7 @@ static int uaudio_transfer_buffer_setup(struct snd_usb_substream *subs,
 	if (!len)
 		len = PAGE_SIZE;
 
-	mult = len / PAGE_SIZE;
-	remainder = len % PAGE_SIZE;
-	len = mult * PAGE_SIZE;
-	len += remainder ? PAGE_SIZE : 0;
+	len = PAGE_ALIGN(len);
 
 	if (len > MAX_XFER_BUFF_LEN) {
 		dev_err(uaudio_qdev->data->dev,
-- 
2.25.1

