Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AAF23BCED
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.155.80.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909344; cv=none; b=gJJxsBOdQxZdwZsx2ENp4j1ccDiVgEOZhZqwhk9RsBJIjnBfFczzRvlGanPn/u59x/LVmzJXuys0n6pRlFgABqyG4vMu467cUFbrq2pQTHpF2Q+huWFvIBNjE+h2FNgD9QADd4g9TBSKNBTzLzyyWSfuTTHH2si5PgctDRDRMU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909344; c=relaxed/simple;
	bh=bC/aBLp9v8VH3ZgOnnxRfjjLifBJw3enHrNi4K90M9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pmTnufM7y02nsFwmxk6pWmfFJJS5QfQiJEoKMnjWG485bfiX5YYOz3I83vp7MWsqd90Vi/u66v+cV3wwzWNeAoB7w+bhxjDLBbXFJOaA7iKZJkXBk42n9RXfaczH83d61Taog0UXPwsCWBFGc7fedZ6w/Lnn6cov6tzUOVBbsDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foursemi.com; spf=pass smtp.mailfrom=foursemi.com; arc=none smtp.client-ip=43.155.80.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foursemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foursemi.com
X-QQ-mid: zesmtpsz6t1754909176t641e0f49
X-QQ-Originating-IP: BXnYFSWbq5XIKjPfePvkrFtvlAywx0UdrWpiOze9Rt0=
Received: from buildhost ( [183.17.229.251])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 11 Aug 2025 18:46:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13167854891472909437
EX-QQ-RecipientCnt: 15
From: Nick Li <nick.li@foursemi.com>
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
Subject: [PATCH v6 1/5] dt-bindings: vendor-prefixes: Add Shanghai FourSemi Semiconductor Co.,Ltd
Date: Mon, 11 Aug 2025 18:46:06 +0800
Message-ID: <EA25BCF08F8BA128+20250811104610.8993-2-nick.li@foursemi.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811104610.8993-1-nick.li@foursemi.com>
References: <20250811104610.8993-1-nick.li@foursemi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:foursemi.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OBXxk6hyguNiQWCYRld6P0lS/8uThrhOW/KVDiYNEJ/zAZ82FJWOt28v
	i1jMeX4rcNTqM3Tk8hKffN5T2m1YRYzl6nqRMUpDyu4AcH4scfpU4GxLE6oD+kuTqkdt9g5
	gGgwgeN/xvtlwQCHfj5Fqm0C1gMzcpYAvgoVu5Y6J4EtA2g9wAy35baPCh+OMNQ0Xuw6WuC
	1kE8sIAxgB+f5qCEEnTJEvhSWsI1LTFgzCtBF4JWFcz/PHJ0nIxsRaGZ854e4OUxcAR58UJ
	t0vVJjOvse9Uw0QhKUXeWmjoeAE2mn8qb2O71g1MC2deLaMQvambTBmcFzbtSZ/41CswSQY
	0g+gy/97INA6OirxaqZAk4K43KsHFVB8ztTwNVuoEOQ6I9jagrKVDzpX9Fg5N+l2XLGk09/
	ezGgG/aPKnigym7TPKKxsZnl7Dcp0exvaF4EJB7k8NmzKN9EeWIsETGi0KDzMGsaYCMqZUd
	1b694ZO8NfUVpwucjUgFi43P1r7feV7LrvdW6Yr9N7UnuEsvwtwRls+hV1puYYAN066AhWR
	5xo2JuRIXHTjPSbaVD/Hq5Y4xIQS0j0td30zjPuc7KUMH2Ez0/C4U9yWAn6E6COkGGfF+yN
	XZRwSmnYCQRC2EWzrE7P/cKpbS4bPsD4X4hYrtn6ND9ySqUCPEEpV2cKdHrQ7jKIs2GWv4T
	ACrDNS2yG5dLTLHGdwxvJXqXBxcJcS+hCdCN9LN+Zv8n50nd3Psdr7bNl4FFiw43j7HSWU5
	vXCyEWidx9Hav6pUoOnMz6pHsore6SGeaad6iqwzaD/tF1hbVU3gI+J8wwpbbzUdka+Veke
	sO/4uKIBjuzPtDjNfP0r5ID97fWHFNai/F7rgkF/0ydrNqLUJ66wcWzgfUzlRydyb2934Qc
	1N8uptmTri73fKXBFDSGCQkcgpZ6c4bbOJmI+Jm5d4lWYY9KKpgS9cQYab84JFzAB8vus5n
	cnTAgMBV0FqMtDE5rsbC4ByeVAi2cxkykVAJmdBzyjXkzzc1OmIwkVX0I7acirX9zTOiS6E
	77oDGqPwikRbTiyNPw0SvhJO0PWCyhx1OpYDGPy1WwAzeCf+vtjeTp3bh6yX5+4+K9Bjyxm
	HYMxCoovcHlQ0FCgUjE36uioq291PR5vPM4CeoW1HwShJYLwnTZ/VgjsTWopGLbYThMwku/
	x/y9
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

Add vendor prefix for Shanghai FourSemi Semiconductor Co.,Ltd
Link: https://en.foursemi.com/

Signed-off-by: Nick Li <nick.li@foursemi.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 77160cd47..a92261b10 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -552,6 +552,8 @@ patternProperties:
     description: FocalTech Systems Co.,Ltd
   "^forlinx,.*":
     description: Baoding Forlinx Embedded Technology Co., Ltd.
+  "^foursemi,.*":
+    description: Shanghai FourSemi Semiconductor Co.,Ltd.
   "^freebox,.*":
     description: Freebox SAS
   "^freecom,.*":
-- 
2.50.1

