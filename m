Received: from out198-14.us.a.mail.aliyun.com (out198-14.us.a.mail.aliyun.com [47.90.198.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D1128EB;
	Tue, 24 Dec 2024 03:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735010376; cv=none; b=OLm/k1Yq5bzsnHm61jdIlihfPC2/Wx4PciEb+EjxBEYM98ueowfGVc9phWBwMzofBjBVeJXqyEedO6muK7+1XdnHZhs8bAJ0TRBAzTPvYBL2f0No6vdUvovGXB792HXKdCLXpRTZklnfUppGs5b/oY9Qg2o9WnKnJdWdx4C3qUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735010376; c=relaxed/simple;
	bh=AiwyJH3F7xFqdpOh3+7secJHibxrjCi4Mo557SWasw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kxlMbXa9AqKxgRkHf6Kxo/mb4HLmdE1beHafkPoXCkIROPjMlQ9aZ3DFpq5r2UFkuL0wqUaIH6HHBR52oS9EQI7jq9F/T2bPEAwZRnFNAbNhMqljzCzbiUCJOue0LSnqfyZn586bLPeoMKyNNmc0y9S+hcJi7CKMFMbx5IFnlwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=47.90.198.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com fp:SMTPD_---.alWruKJ_1735010345 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 24 Dec 2024 11:19:11 +0800
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
	luca.ceresoli@bootlin.com,
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
Subject: [PATCH V3 1/2] ASoC: dt-bindings: Add schema for "awinic,aw88083"
Date: Tue, 24 Dec 2024 11:18:22 +0800
Message-ID: <20241224031823.363777-2-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241224031823.363777-1-wangweidong.a@awinic.com>
References: <20241224031823.363777-1-wangweidong.a@awinic.com>
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

