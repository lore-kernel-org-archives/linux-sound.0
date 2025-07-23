Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4193223C51B
	for <linux-sound@vger.kernel.org>; Wed, 23 Jul 2025 09:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753261793; cv=none; b=B/Y0SAy2UMSyjfazubDUKP7B7tYnZA3uK7y587MuDCUAp+N2GsswIhtiK6dRAJPdRaAqWeQs7zILenU06ykbpWKEUIwbZfichLPMRpSkvElNeE007IjAh9jFoiApnaUiHYaknxEu7cBD3ievBFXIWDziue2xzAjkspaKA4ib9pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753261793; c=relaxed/simple;
	bh=PM1VPsrdjO0YYhZC6Dej1QyKtXiLbfGG2zKsH8vSHdQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZSSh1kJRplYCOaI7fSdfOrc/Aky7RxaYRzf5F0e6YJ/3AM10tPh9rQmKT7zkUfFrJMEerehIBk6RD+deyfq6xvf3iEm+1uOJ4c8/24xzmxzcEajHVbFuYk0SpK3nUo71xShGR7K7Q7b8sgsE9qmV1sj+nhBVikMk+TqN2AqWRdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foursemi.com; spf=pass smtp.mailfrom=foursemi.com; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foursemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foursemi.com
X-QQ-mid: zesmtpsz5t1753261782t33bb06d1
X-QQ-Originating-IP: 87V1k3nUNlWghQC7T6XSvNSIAYjIn2dp964L5xBjvjI=
Received: from localhost.localdomain ( [183.17.231.145])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 23 Jul 2025 17:09:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2544636101494092667
EX-QQ-RecipientCnt: 15
From: Nick <nick.li@foursemi.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	nick.li@foursemi.com
Cc: xiaoming.yang@foursemi.com,
	danyang.zheng@foursemi.com,
	like.xy@foxmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/5] dt-bindings: vendor-prefixes: Add Shanghai FourSemi Semiconductor Co.,Ltd
Date: Wed, 23 Jul 2025 17:09:30 +0800
Message-Id: <20250723090934.480055-2-nick.li@foursemi.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250723090934.480055-1-nick.li@foursemi.com>
References: <20250723090934.480055-1-nick.li@foursemi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:foursemi.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MSxnj+21UW7cjDYFa2FEK3XXOVgIk9f1CaikOzF0M1380imTKqKqsbiz
	VsNq2E48udJOldmgiGU6Ag2VcKNPDrPjKmuYDL2fXNEjJlz6tIvzjA3veKRbJcXPqeMMTEg
	EP1tZ3ryyAgywkpdpFgZBBeqyFRyxeWqyUKECh3T6zRRatEckX2NOgnQGLFyA51fZEIo3HT
	bUznLPYH44KrWQuNF9CSMR5zVi7NmKd09zjCBwDXNL/XP8chqFzWfQPAWEJjZsj7bLGqkst
	x7TvvFUvLMFy7UnwJ1CHY3OZNWZJZ3ZoFRIWCCwAh54m6hAerpN2Wf59AkMEapeiX0F/U3a
	Z1HYx/s2HvIqeewIgWxSOr9iF+5iBbytPejJe+Zgih4NKpWewN1VtYRv0fu+SfSB+JyWcbT
	Arh7jfnFsbKu4OIcAFZyVA733TTQgX1pK8izTJ8AxyLpPCOv6DzG5ECHCbH284jFAao7k+1
	7Sl9tqNHI8uvY7w4mz9fO0bRkDB2+q1jzYvk1syenNoWCHmMfvuIfWrCyWV1CPrp0gOKtRZ
	l71mJljpaQHl7TOVLqBlkutAFIFH66U7uyvzWGwD/67qOcMYfnOq3Kcs/f2nKkjVfImMgxa
	CuiFIKa9wsNuqK3SOxZK1eAkywKKGEbtXJMm+6R9aGwXuBzNPRFvhiZkIlnu8vdFssgD/Sf
	LMbghsjYlmJkdzE4N3xJATIVmsRhSEYW6B24IClc//9Si13xe3yWyXi0HK3QSV0hVCR7w23
	kVwlW7V7UIV2RoMdmQJVlOUg96yg79IXnihN3e8EPfNEnbF9/zF15YOrrdzAAtvlIqA6YuL
	6K12w1m+E3bW0cX7ynodN/Yyb/vxOKWEQ/HgUlBXC5aj3YHQNgRw/9hAWRqkGyqnX0LV57H
	oYHb9e6Ay/tYAqbII+ArLrEFQhNuBeFmKogU7f9EPhavnEuZQgbdUidyjNo9uxWtrbGsTBE
	5B0Z5rcD7DVdr0cjGEBL6KeQ2hSuhw5n8zf6hqy9r83mM0zZNKhy2e7n6ZqMcG+vxcOH/RU
	FWK56IrY34MV0eHzUXBejac0oDnesjemKOOHENrP6J+LwZuyT3gCMdNgGfkRlIEdwnlfe/X
	g==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

From: Nick Li <nick.li@foursemi.com>

Add vendor prefix for Shanghai FourSemi Semiconductor Co.,Ltd
Link: https://en.foursemi.com/

Signed-off-by: Nick Li <nick.li@foursemi.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 99e86271c..f692e3b29 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -547,6 +547,8 @@ patternProperties:
     description: FocalTech Systems Co.,Ltd
   "^forlinx,.*":
     description: Baoding Forlinx Embedded Technology Co., Ltd.
+  "^foursemi,.*":
+    description: Shanghai FourSemi Semiconductor Co.,Ltd.
   "^freebox,.*":
     description: Freebox SAS
   "^freecom,.*":
-- 
2.39.5

