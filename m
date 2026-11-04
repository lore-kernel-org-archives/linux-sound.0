Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758458;
	b=xolJSniTOZMWvdgUf5DqpIJIcOL6E8PvUPdWiMb0rkr/AW9aMoF4nmC3VnArk5fO7uN0
	 GXAVMeYtiA6k0mJJ1KFnFGxG3TDVYgitGhEzycANLxMj4YKOlD7FIqbU+8/D55sdjoQ0E
	 LDR2bbia1Y4lL76OsUmW8jNbT+dxGwHa3QpaY1ZbOrTrRgSxxMgx/mpcrHS14EtTX1k+z
	 UUo//BcVug6aAGEBh5zmpbF8z3y5LW4j5Jlm1137Ozoc45d/mTEdU3Z2NtdgEvZrpEfg7
	 pOfqOX70+6aLQyD7CIxtDR+pb8l1f347y6GW9IarJvDTnmn3TAcZkXiP2YnGOc0ZVOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758458;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=NsQOfhmEJsYI9NgpqbZnKdoQEGz3y26t5RU5pHQFQGk=;
	b=QWUDJShh3Ma8iMPqbYzVQ8cTUW787mhtLnKBLctKRwOsK+8SPHTcF906DFh3VnRlygUB
	 4Z425f0xfa1rOaiVbij+2IBYXk2c1LhjloRlJTZvSdu/eMu1wFMcr2g8MuMnB47hFTuZb
	 bwi1m9JhNefJqp3lLXVcuwMzsArKRZN1uCwOrF/s+9PyE8Zbbof5Im9uXqgzilYsKBdBi
	 Why6ak9FV3l+jux+XPMwtV1XlwKjZRLebwGm6bzn2PYl64jZivWHex/fbmrSRyTK9wTbQ
	 1coP+ctVZO/XhUY2MGPO66Uozujk0jz5yeMKv6X2MgGuOl0QpHANmfSN7+FEuxtJt6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6A6606A329;
	Wed,  4 Nov 2026 02:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C6A6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowABXg_33lOpqzXQ+AA--.27416S2;
	Wed, 04 Nov 2026 10:14:15 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] slimbus: qcom-ngd-ctrl: drop the PM runtime reference after a sync transfer
Date: Wed,  4 Nov 2026 02:14:24 +0000
Message-Id: <20261104021424.1468172-1-vulab@iscas.ac.cn>
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
X-CM-TRANSID:qwCowABXg_33lOpqzXQ+AA--.27416S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GrW3tryxCrW3tw1DWrWxWFg_yoWDAFXEkr
	yfWF92yFy5CFnrAwnFqrs8ZrWfZF1kWFy0gwsIva43GFWqvF4DXF4avFZ5Cr1UJw4ayw1U
	J3Z8tFWrArn7WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb2kYjsxI4VWkCwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
	kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
	Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI
	0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4
	AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIE
	Y20_Gr43Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2
	z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU82LvtUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAMBA2rqY+S5bwAAsc

qcom_slim_ngd_xfer_msg_sync() takes a runtime PM reference with
pm_runtime_get_sync() and only releases it on the error paths.  On a
successful transfer the function returns 0 with the usage counter still
elevated, so the controller can never runtime-suspend again.

Drop the reference on the success path as well.

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index eb983b6d1815..9bee4b376877 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -942,6 +942,9 @@ static int qcom_slim_ngd_xfer_msg_sync(struct slim_controller *ctrl,
 		ret = -ETIMEDOUT;
 		goto pm_put;
 	}
+
+	pm_runtime_put(ctrl->dev);
+
 	return 0;
 
 pm_put:
-- 
2.34.1

