Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758461;
	b=gS2JXf3NUH2vTYlBIQK6kjntFPMxFPBX0kmUSaxf/JUpIy/ucqGtB0or/iJRiZBhoEFs
	 isTtwC/K1nQ+zgDML6eyZWS7hJ98K5vGSpB5ZzV1msEaFuHhSQuWD65Wql6HlB1Uz18D7
	 McXdUMVKi2yBaSb1XZx/yOb/DpTcl2t/zvu+tpehlx0Ksdkp8R8D3xSzIm8tTgcXXyPGO
	 wzzNfZIzyAL8FhFWtK1dBXBl/ee+Z/DYvqzUo7ESQYFqgG+0TjG3VxiO405Q25s6FtXoX
	 WnBZ5EcVrNYnEB0nHF8/U+YqY6N9xSbqQckzZ/tS9PGLWx5U904+Kw2SUqBcMZLjGTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758461;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=sQMTdW7wPKj6QoGszGrBV9vRe2nzNB5kXAWg6mqZW3A=;
	b=fVB+iyCJl2p/Nd6SECucjp/a9xkI36dTORYuRVsqAgEZwzQyblTM6CSft5SvbUEGKyRt
	 mgkw8bbd6wJiYYNfqYwRM752ldvRqCj4w3EiuJ0YSrdqQrLEUSKxv5zHGed48aG78P6p2
	 bIULwDnlztK1AG+IpkvS4p1T3/6zY9ObPv23d8X4tHrRe5CjdwZ4rZXowh6u5AUNGw9+L
	 IdZeT5QT3BbXnvgtNYOieP+nLWfJqAUZkzFgRxKDhZ6s/K2lmUz6Qg7Amzi7zBM2/8TnB
	 Ak8gNYnn3Xk7hJpQJCkiTjdC1Qew2/HiPY7EXGW0rqhi3zH3ntp0CFIq692vX8xMXfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412D0606A31B;
	Wed,  4 Nov 2026 02:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 412D0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowACHsvz6lOpq5XQ+AA--.5026S2;
	Wed, 04 Nov 2026 10:14:18 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] slimbus: qcom-ngd-ctrl: put the child platform device on unregister
Date: Wed,  4 Nov 2026 02:14:27 +0000
Message-Id: <20261104021427.1468218-1-vulab@iscas.ac.cn>
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
X-CM-TRANSID:qwCowACHsvz6lOpq5XQ+AA--.5026S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF45ZF1rCFyDWw4DCryxAFb_yoW8Jw15pa
	15Wa4Skan0gF4j9a1jq3s2vFy5Ca42g3yrKr95JFyak395ury7tFyF9a48XFs3ArW8G3W5
	JrnIq3WruF45ur7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkab7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
	6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07be3ktUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAMBA2rqY+S5bwABsd

qcom_slim_ngd_unregister() only takes the child device out of the device
hierarchy with platform_device_del().  That leaves the reference taken
by platform_device_alloc() in of_qcom_slim_ngd_register() behind, so the
child platform device, the resources attached to it and the reference it
holds on its parent leak on every controller removal and on the probe
error path.

Use platform_device_unregister(), which also puts the reference.

Fixes: 8663e8334d7b ("slimbus: qcom-ngd-ctrl: Fix up platform_driver registration")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 9bee4b376877..9f24fcc5f0e0 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1641,7 +1641,7 @@ static void qcom_slim_ngd_unregister(struct qcom_slim_ngd_ctrl *ctrl)
 {
 	struct qcom_slim_ngd *ngd = ctrl->ngd;
 
-	platform_device_del(ngd->pdev);
+	platform_device_unregister(ngd->pdev);
 }
 
 static int qcom_slim_ngd_probe(struct platform_device *pdev)
-- 
2.34.1

