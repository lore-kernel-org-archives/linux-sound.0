Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618CC23C8A3
	for <linux-sound@vger.kernel.org>; Thu,  3 Jul 2025 03:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751515020; cv=none; b=LZnqa4XxGhLWllA1MkxuVDWEEJFxr7j7IgOHbmeEFwEvTIroioGUiaOKz5F4nmRf/aA6A7DHtwmHw7co8CZkY6wV0gMdr8rsZsAK3+4QS5Vpn7inPpPV4lpqX9cf3vndv9ujRRmpwdsxZnpm1h8449QrRRhZ63HczGuKoJNQStI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751515020; c=relaxed/simple;
	bh=rs0Jrxz0vRepAeCwsVCMO/UiEo/apDCQ/z41u/EWCXc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pn5GAl9en4wmdCgymSJu4i9gT5zkRN56hYVd2+Pia5XFftwCOSmgba0xVXkmKbRJJK75t6wECDjn3vIjJ0Lhl7juIvOA2lPKKNKbcf5qJLxQ3Uwu3vTf3EwhyGD0pJvtyOTFAigtDsVPKZkUqJP45BVSa3sbhkq2CWIzEU67Wo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foursemi.com; spf=none smtp.mailfrom=foursemi.com; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foursemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foursemi.com
X-QQ-mid: zesmtpsz3t1751515011t63cdaf04
X-QQ-Originating-IP: McRyShDlbg/mNUeXIK/4cz7fRy/HcXqXTgY3hs7UI00=
Received: from localhost.localdomain ( [183.17.231.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 03 Jul 2025 11:56:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4261929876903516706
EX-QQ-RecipientCnt: 14
From: Nick <nick.li@foursemi.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	nick.li@foursemi.com
Cc: like.sin@gmail.com,
	xiaoming.yang@foursemi.com,
	danyang.zheng@foursemi.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/4] dt-bindings: vendor-prefixes: Add Shanghai FourSemi Semiconductor Co.,Ltd
Date: Thu,  3 Jul 2025 11:56:39 +0800
Message-Id: <20250703035639.7252-5-nick.li@foursemi.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250703035639.7252-1-nick.li@foursemi.com>
References: <20250703035639.7252-1-nick.li@foursemi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:foursemi.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NP8oR1QdQdtAWz7oky6WF8oTeE5zpyZIUtTHbi++8VJkJVD8fnkERzF+
	C1XHcrRbl/NBJcuMH1RcWF1jxwfGrZRmS20Q7uwue3VbpPYCA/MRpq3VN/XDM3Y1YrxWrBt
	dsNHPgJQKhN+iWoewqNU/L2crfCOuu6e2SNfV7dVPfE+1Wp0bDCVYWbRHEP70ygrSiiPaIV
	xEk4mVxL4moiTqwSE7pRhkm3GPn9xV5DUBzlzXG/+HJRiU/ax6TInM6aTM0WM0QM6dryMxC
	Rcl7oC7RigowePJTX+QdjF5l4UTEHP7DC39tmnVeN5c7Yt0xZxoZj907StCmLR0FAM1Ifz1
	yvC4GAlcbew4AmIJCb9dGp89YFVygiaIyMJpAnwrPFHltVTTeLAjHP+DnWg6b0XwEkjMUdC
	6kybcacZYKJWkqLMSu6H/HLs727NeegCviykQiwc5nKzusghJtwfj+v0OMnVy4QLFZGOvaK
	El276/X2nnimmnx/TmlcO2V9QOwEHa1genrfqL83RBQJtdubcj9uFbrlh6BnE8U7s7Pydco
	N64Ki9MBRJjjsyE9H9+Ma9wkdm/aLJqEhWYDiMvu2cHbfzpSMb0nMRB+E5EKbvVHgY9p22l
	LsWL1wgrK0u3816gwCRVMOgzI29hJcshzv8Ejo7R/oQ1Rag++jx9v6b6i9/7Xt+AYPXYuFM
	UJ4zFpedcWdXYGgR0KTSPAl19xjyrINSd4r/28Yku+4HYoeXDYTQ/SpKoK/iIgDSMPk+yzV
	xqETImcXLJqA0oazTu3Ior/SkJ5jiPDU2qyB2/LT4X0iyd7onGJ5QU0jrOOigSGb6OxVtnK
	8mEzRPOphyPZymEgm/M9Iq2gAwKyfALdSGlE/f5uJG19VXwhpSmoQdmRoxwKbHhA0pjThWX
	bJ+1WutuyLQstk/V/UoM0+hdmZVYiloG/oQTNu9thERJvv4W9rHSqCJSqo5IHS3iD9PQTX7
	RSdHzXHHjtB3YKWVjk3fcSCzVVg7W0ZtDvMqpnGcKdPZ4HBK0DnULbUS4rgqxhQSAZvk5js
	ZKVquVw5MfdNZWiZxt+ESOsAp84fKBNC8/i5edfvGS7ZNKkyqCQxy5gDTfGzclDEXaU8rwn
	lhnT8sj90c3tFBo//oTcaZM631Mp3pg3Q==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

From: Nick Li <nick.li@foursemi.com>

Add vendor prefix for Shanghai FourSemi Semiconductor Co.,Ltd
Link: https://en.foursemi.com/

Signed-off-by: Nick Li <nick.li@foursemi.com>
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

