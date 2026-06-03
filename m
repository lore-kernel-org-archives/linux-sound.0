Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A976940B6FB;
	Wed,  3 Jun 2026 09:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477926; cv=none; b=h5dgbtPJzhiWccD3CxUhxZmAuuTHYvBVzHwERYoxFTInkLRziMlQ0o6TYQZXB7UPZZazNOsx5JIHzCo+SkiB29Ur+aPmTn4zxd9+dxJfvLuI2VXXsLNfXtzdYggozcSV3LlVlkM1e7oVxwagIr/9dIMbEWTz5U1k83pFLHKnVII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477926; c=relaxed/simple;
	bh=0CUez8WKvMl9qtOPQRSG21vHQvDj28/7PdpkhkPTeNw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d7EFmqsC2FkCdaHGr7tkb1HKtW18fxFOuKzAJYSEXz03pMV98/VYquoTtd8moJiPugeKiNBoHYxiJ15nBU5P8328SFLuAy0JQU1UGxm/xE4ht9FXB42pNkqxQH5IA3jd7bTF4+1LZBuYs+NGSI+652rIh3tiC+q+LVCT8F+T8Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=oasx7A1F; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="oasx7A1F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=9/
	EsCGKky3Go5B4Dw/qiVRrRJIhHZqAOQ/+DOdYhBDw=; b=oasx7A1FIXLdvB7Bvu
	NdMlCRIYW4ct42P72cMIOdshXfd6rSSDWviIR75xCla2+lsf2GJL22AZPMS6NZXs
	O93v19JMm5PRvZA7VkUlMUedZdTwpvI3dCAKot1khh/xm4osbF0TEPUMfD6FSiNz
	PD5wz5YZ618wmn8A6HXGwfdcE=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wB3Vqao7x9qFpvVBA--.45986S4;
	Wed, 03 Jun 2026 17:11:32 +0800 (CST)
From: wangdich9700@163.com
To: tiwai@suse.com,
	perex@perex.cz,
	wangdicheng@kylinos.cn,
	wangdich9700@163.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] ALSA: usb-audio: qcom: Fix return value in qc_usb_audio_offload_fill_avail_pcms
Date: Wed,  3 Jun 2026 17:11:01 +0800
Message-Id: <20260603091102.231370-3-wangdich9700@163.com>
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
X-CM-TRANSID:_____wB3Vqao7x9qFpvVBA--.45986S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr47Zw1UArWUAw4fCFW3KFg_yoWftFX_Ga
	1fuws7Xr48Ary3Xw45t34Fy34ayw17uFWqkF4Yqwn7Ga4jyw1Yqr1UK3Z3CFZ5GFWxWr9x
	XFs8try7K34vkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREU73PUUUUU==
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC5wWP3mof78WQhgAA36

From: wangdicheng <wangdicheng@kylinos.cn>

The function qc_usb_audio_offload_fill_avail_pcms() always returns -1
regardless of how many PCM devices were successfully filled. This makes
it impossible for callers to know the actual number of available PCMs.

Return the actual count of filled PCM devices instead, which allows
callers to verify that all expected PCMs were properly enumerated.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/usb/qcom/qc_audio_offload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index f99f8bddb237..fa7ee61d6934 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1753,7 +1753,7 @@ static int qc_usb_audio_offload_fill_avail_pcms(struct snd_usb_audio *chip,
 			break;
 	}
 
-	return -1;
+	return idx;
 }
 
 /**
-- 
2.25.1

