Received: from out28-196.mail.aliyun.com (out28-196.mail.aliyun.com [115.124.28.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A67C1990DE;
	Tue, 31 Dec 2024 12:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735649798; cv=none; b=HblCxTi3wYVV+p8UfOg/22EwXjFieHYXp4dAz7TJ5xXhSg7oIC/2XXjLvmDJczyqBmBPSK56RGVdGIIMNtkHq2BH2uxUyILwlgsVgw6RiJPJsv3koYcCumMWql72WoW3jGmveNyHpcnzzp+AEOvKhAcLx/uC83/u7CE15CjNp1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735649798; c=relaxed/simple;
	bh=AiwyJH3F7xFqdpOh3+7secJHibxrjCi4Mo557SWasw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lkuitgbj/XrZ1d7rjiuTcHz95jujJCkdXXr3RyYqdnw1MjEoe0aWVsc4lQZthAJt/qpYOz6lXzmbbHgQ/7rEEivAOEP2aVahMa3OcEwipOrAMBQH1PnYKssu3Cv808QAcDTwswq4QZrg3eUd+amajVrlLnLq0jlFzvCzPUyBZiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=115.124.28.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com fp:SMTPD_---.asDhTmW_1735649778 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 31 Dec 2024 20:56:24 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	jack.yu@realtek.com,
	rf@opensource.cirrus.com,
	neil.armstrong@linaro.org,
	ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
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
Subject: [PATCH V4 1/2] ASoC: dt-bindings: Add schema for "awinic,aw88083"
Date: Tue, 31 Dec 2024 20:56:09 +0800
Message-ID: <20241231125610.465614-2-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241231125610.465614-1-wangweidong.a@awinic.com>
References: <20241231125610.465614-1-wangweidong.a@awinic.com>
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

