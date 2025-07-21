Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37EA28F937
	for <linux-sound@vger.kernel.org>; Mon, 21 Jul 2025 10:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753094368; cv=none; b=nQqOuZb13j/xGok+gQyXuFmzY1xGP4VXhobjQIT4Req6EgOx4hStqdP8zUMeOsWan4jTlL6ZS08RD77+Mn7cEEl67EQOfSg3jRodOR6/0tr1mKSiDdM9PWnfZMABPDGKF6xkLYUWMzuP0+U/oifHz3Zqj88rqw0iccwtGG+JRXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753094368; c=relaxed/simple;
	bh=PM1VPsrdjO0YYhZC6Dej1QyKtXiLbfGG2zKsH8vSHdQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=loFl2/EXVYE/NCxvR2QrESCQ5oHSPKp16aYKtY+yMx+C3++pepv7kz2ENJRhYJy5/r/wQietYB8Sa9KIW/iwbkNK/uqK3+4oaNSuGhX0FDmxBtMFSlJBtMg38Aa2LYvu3/MdqHnvsX4i5KR7jWpMjsoA+rKude/AMz8GfdJK5/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foursemi.com; spf=pass smtp.mailfrom=foursemi.com; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foursemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foursemi.com
X-QQ-mid: zesmtpgz7t1753094351t4cd420b2
X-QQ-Originating-IP: O5GI00GzIPKUFNV7bY3KUhaypjVvPaBFabvA01mdUxo=
Received: from localhost.localdomain ( [113.89.235.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 21 Jul 2025 18:39:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12390014289647281348
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
Subject: [PATCH v4 1/4] dt-bindings: vendor-prefixes: Add Shanghai FourSemi Semiconductor Co.,Ltd
Date: Mon, 21 Jul 2025 18:38:02 +0800
Message-Id: <20250721103805.531758-2-nick.li@foursemi.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250721103805.531758-1-nick.li@foursemi.com>
References: <20250721103805.531758-1-nick.li@foursemi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:foursemi.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MdTuaOGnZwiPp7SPi5sij3fE2yU3QT+P4g2KboDeK3gpAz8zjfBwInHh
	2E0U4iB+zG9iwNMXRmCPU1whDkRB98e2ef9758OkbAtWsr+nuDWWqK+5IoZBPjY+p/StFcj
	t2aILjfjL1WJqS1RnPpWQLLW7v5XAWcWbURIlLZ5DcYCY2O+Q6didHKPf1m6E5gNJ/yy5xV
	ljKROQjf0AwRRZtqGLb08Myp1UdwmxfKtj8MXEYkSV/H5moFWkRzNe8q1b1lX2F1dfZ9pMT
	RNVjokKTXoMdKTOtN7Wd1zGE2Y/3BgeIQ5tbcJmFCSWRpv6VGwbpVn85UxCKPSE5mQKWQwk
	PZINUjGOpjb8J/H9q9jypY5XHA+GUoj3d8qxVQW2Xe6dS34RbD5EDai6GLCx/4YKIH51cqD
	GIJVuVpPZnv0i+oJZvyEIV1KJZNe8FQ18oXLtyb0DDiQbIXJlYYkPUiNAKjpksUe1LLudWT
	sMF7jSU0/nnJ6hsuXSO6Y0ad10tpnfRvLjW8CklAw7LQpj2VTXMnBIgz4zLXPtkiJDrPcMO
	FPJL3zB4aJI0VvfdHivW1m3g73AP1GhF7kvbZrSPsczu+8K4JrSV3+siobi2FF9GCtgXvFu
	pk3oE5o9TOqkihOaF06LLlXnBFMBhFQwAbC9FViZy3Z+/Pgu2wy5ELeeq/uaOORKcvTUCb5
	CA9idlDZY90My6oNXCMNV9+N4uy9TyprLtWBNP8bDyv55uYSAS4bR5XPvJAnOGt3gX1byEM
	go7aMtcYms/SCpiQilN9PQfVv/HpIkxgZg5NvFMln6F/Te+5v5fFvjM0QN53E43VqyvddpR
	zJkldeHD59YUxo9sotfhvoM+BmLK5W/MVrrqqJ9aRlZNkP7Y7S5Z9WVkR001Q8hcCXaIco+
	m1m36OEQkl8prsbRaOgjxCx6MNIi6R+Kuh8WQwkIyGo9oSLT/UL3ZirSz/uqx2a89TOXd+y
	rRxAt3ggYEThRLByDiCZnxHP82tfQWL1taQEY0bCONJoh1O9+3bBligsTLBeKQ1ZAoOz6jG
	FasIgUn0+cI3vP9JeIhC/SF/tNFlAjh3jYQHauyBqIBkAiSMhcl0VIH90mk6RuqNDara7Ku
	5VKwNOmLkLJ
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
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

