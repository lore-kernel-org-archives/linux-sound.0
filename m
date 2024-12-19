Received: from out28-125.mail.aliyun.com (out28-125.mail.aliyun.com [115.124.28.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7A3224888;
	Thu, 19 Dec 2024 12:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734611472; cv=none; b=dlyzZGmnAyq3+JLnWMlzFgmA4HyuHHrXp7ZkaubvR1JR9OxLpph6lNhdfQbcsL3MQKoL26nUatyfeGTy+7zaxBs7G9uZbjMjEnvuBQwMLpoSNCmem2aRWsR1htpwyHWF8d+uBpai5G6DPaEun1a8ejCza/Q6soESAzB0TLtbG0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734611472; c=relaxed/simple;
	bh=AiwyJH3F7xFqdpOh3+7secJHibxrjCi4Mo557SWasw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SzGllhiJpcIm8MySzMkp3tKg+7HZ3nQTJeeUiztacSkOn/1NtEWjdAmkH3tpqOjWF+Zr2kPFD1Ik9Ft1xYqGKyenJvDF/ZRctqn8jeMSyY1TkFAbUEYL6IyBuOSoFnOJhQhES71tVTygnH8QH9StucLx96Me9b9aNVYeva3oATA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=115.124.28.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com fp:SMTPD_---.ai3.2sk_1734611456 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 19 Dec 2024 20:31:02 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	ivprusov@salutedevices.com,
	neil.armstrong@linaro.org,
	jack.yu@realtek.com,
	rf@opensource.cirrus.com,
	zhoubinbin@loongson.cn,
	quic_pkumpatl@quicinc.com,
	herve.codina@bootlin.com,
	masahiroy@kernel.org,
	nuno.sa@analog.com,
	wangweidong.a@awinic.com,
	yesanishhere@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: yijiangtao@awinic.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V2 1/2] ASoC: dt-bindings: Add schema for "awinic,aw88083"
Date: Thu, 19 Dec 2024 20:30:45 +0800
Message-ID: <20241219123047.33330-2-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241219123047.33330-1-wangweidong.a@awinic.com>
References: <20241219123047.33330-1-wangweidong.a@awinic.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Weidong Wang <wangweidong.a@awinic.com>

Add the awinic,aw88083 property to support the aw88083 chip.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
---
 Documentation/devicetree/bindings/sound/awinic,aw88395.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
index 3b0b743e49c4..6676406bf2de 100644
--- a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
+++ b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - awinic,aw88081
+      - awinic,aw88083
       - awinic,aw88261
       - awinic,aw88395
       - awinic,aw88399
@@ -58,6 +59,7 @@ allOf:
           contains:
             enum:
               - awinic,aw88081
+              - awinic,aw88083
               - awinic,aw88261
     then:
       properties:
-- 
2.47.0

