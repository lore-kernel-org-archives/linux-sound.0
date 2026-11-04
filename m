Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760815;
	b=WlZmH9eU3QAi6W2xsyJV5p0t3U6/eZbE4sEgyvXGuR2GJJteqNT7SJ8JSOozzhVCHVyX
	 yyYtxhYvbHdpAkXWRB9XVZhdNeHGpwnw3k3KpPTHG9tMGhbhxAnNtBH1OtZUESQP7FKdj
	 gvFRzO/cegazvDITB+EXmwXTDUl9uieWaTMHgFaNUY564gZj8nBGmSP/EvfmolrFfB1zm
	 YgsPD+UMIH4XEwsHNg4nhK62DlBjbzpnoUBYuLXCQa4nv5chxVm4fPXzsjg0Sn6W3GFw9
	 BCEyCJFWIV0vQoOcZTCfmK61TtcKXMKFotEOGRwTcdMPmfR4j+yiQ7BeIGLPMisI8sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760815;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=P4OEdOQa0oh5Oei1pCzbd6LADH7gtlJv62ngQJAj3oA=;
	b=0WzRODd3tHs3lbusUeYNR4SA7GuG9cz0uGpjBP1s5Q+pwvgjDebtQQhXj0S/v7cPrfl2
	 Pk0As8CWjyjbVc3aQjQoCIQLZV8Jr6AZyUCwdiTRuYPyThZMVfDjawo4CfLom8VdOf7TV
	 hTyh3q4n676ycM5fElPnu0kU7hGBjHINSEZfPGx6ei+wNHMafX60/gjn6ugXaNRkJVWV9
	 YpvN+OKC/aGinVBpGafryYPDfM6b0RIxje+QftHHBlNSNrp5jdkyx12YkBLigJajcLxHs
	 DnBdlwBubVl+9hmZ5/8mRqn+Bib+fkeXYihkZohmNnGAL/Okn3iRg1gw32dguBQs7jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44713606A31B
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 02:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44713606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAAXP_ksnupq3OQ+AA--.10061S2;
	Wed, 04 Nov 2026 10:53:32 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Daniel Mack <zonque@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: caiaq: free the EP4 URB when input setup fails
Date: Wed,  4 Nov 2026 02:53:41 +0000
Message-Id: <20261104025341.1527407-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAXP_ksnupq3OQ+AA--.10061S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZF4kXFWxurW5WFWrGw43trb_yoWkuFb_Wr
	W5ZF97XFy5AF1Utw1Dtr1Fqr1DKFWIva4jvr13tryxJryrZa12vw17ZrykGryUu3yxur98
	G3Wq9w4fuw1S9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbc8YjsxI4VWkKwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
	kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
	Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI
	0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4
	AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIE
	Y20_Gr43Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY
	6I8E87Iv6xkF7I0E14v26F4UJVW0obIYCTnIWIevJa73UjIFyTuYvjxUyZmRDUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwUBA2rqZFjiPgAAsg

The three controllers that use the EP4 input URB allocate it before
checking the endpoint type and before registering the input device. On
failure they jump to exit_free_idev, which clears cdev->input_dev but
leaves cdev->ep4_in_urb set. The card teardown then calls
snd_usb_caiaq_input_free(), which returns early because input_dev is
NULL, so the URB is never freed.

Release the URB before dropping the input device on the error path.

Fixes: 6da7a2aa899f ("ALSA: usb/caiaq: Add support for Traktor Kontrol X1")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 sound/usb/caiaq/input.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/caiaq/input.c b/sound/usb/caiaq/input.c
index 2830a1da067d..5a415d1acca4 100644
--- a/sound/usb/caiaq/input.c
+++ b/sound/usb/caiaq/input.c
@@ -863,6 +863,8 @@ int snd_usb_caiaq_input_init(struct snd_usb_caiaqdev *cdev)
 	return 0;
 
 exit_free_idev:
+	usb_free_urb(cdev->ep4_in_urb);
+	cdev->ep4_in_urb = NULL;
 	input_free_device(input);
 	cdev->input_dev = NULL;
 	return ret;
-- 
2.34.1

