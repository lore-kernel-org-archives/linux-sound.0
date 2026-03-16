Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9A73DA5C8;
	Mon, 16 Mar 2026 18:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773685395; cv=none; b=MFgfpHHWMqJ7uopOVtgnXIhibIzHk81kV9K79KpB5cYUvRnb+qB7HBpBoABkn2ZpiiZN9KGqwZDvezTdsyhOaumO1n6jH/TVHxPDI1uPqmATWLszn2aEI8q35nEm7b1RWpaCBxOMrgJHjBgPrq+HFEJeR/2gqTlOisK+8vs8AXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773685395; c=relaxed/simple;
	bh=HGO3OOLu11jOTIotRzoqHyXFhbc0NsvCC6OCQWzZChM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mKEOfLtbaKBX/e9dYHENRjpkdYNlEKbWOU9MuT7MBuMQ0NnKeWHCQy+7WCIQP/LeRfInqrPBCWcx2MKbFgGpk3++TxtPdbG5JCqEefjRxEPJEhyPiej1T9NicTkWeBHUdaMKmciNaYwVJvVnVkljaMdgbJCtyFEx/JRduakENmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QpQDV7/2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QpQDV7/2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773685391;
	bh=HGO3OOLu11jOTIotRzoqHyXFhbc0NsvCC6OCQWzZChM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QpQDV7/2fsFiMtihFTpTRLVAW1f3hxfAV1aesAQKuWWoOvLtTCeuy9TeuWdK7tb4Z
	 7RjxxbGX3dcg8+CREfnTaRJAat0fkn440Us7HgCMcN64eefxfbn9XegwirgE5LRl8A
	 cjYMSZ6kf+t2C76l/nBg2XAJE6FwkJBlG24VPKBE2Y011MvaTF7A3D8XCHyh/qLbZr
	 SYveTBSPzkIxSPwHSlJyQgzRQQ4InqxgkBTSDKrJUbCZsBFWHQosC/Oj/8225rd+hi
	 vv4WbcfSgHa0doNT1+fgpyzZ8EuTQNKQD43zan8u/lSl8oynBQgiuzOjoidYQilV8p
	 MabzMFnt+1JOA==
Received: from jupiter.universe (dyndsl-091-248-189-119.ewe-ip-backbone.de [91.248.189.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5C48917E0EFE;
	Mon, 16 Mar 2026 19:23:11 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 12BFF48002C; Mon, 16 Mar 2026 19:23:11 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 16 Mar 2026 19:23:00 +0100
Subject: [PATCH 1/2] dt-bindings: ASoC: rockchip: Add compatible for RK3576
 SPDIF
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-rk3576-spdif-v1-1-acb75088b560@collabora.com>
References: <20260316-rk3576-spdif-v1-0-acb75088b560@collabora.com>
In-Reply-To: <20260316-rk3576-spdif-v1-0-acb75088b560@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=827;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=HGO3OOLu11jOTIotRzoqHyXFhbc0NsvCC6OCQWzZChM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGm4So5g1+1/DpTsSGBarerila7iw/g9lPMiB
 JbgHvXhFgbqnokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpuEqOAAoJENju1/PI
 O/qaedIP/22o0FoajFUdurX76u/vT3Pk1FbtUsSFOcHzSIhQzW3HtmPD2j0nB2imDa0/w6mmH/3
 hEZS85aKTEtsMHdqnHwNTR2pKpUL8qKWKQ5XSW7pAUcs2l9baNE1wYfTvQumwuTMkJNXT0OQXCB
 y9k0rDpyX4IoScOwSO9eHpBT7/mdmnVDTZVbdwLCW7THxywpWbMyQmurvp29z3SlCzIQzsQe5Eb
 nYMtJ7rMoY7Y9J9i2potyUfldf6Z2dFl/E6y81LYBd3YV11L4WihpkyW8iEeHsYbW0FwFtFhjR5
 7XP4Y6fMgVsgR/9UUS7rCR1XePy4qImpCKwvxA2oPm3AAA1QEstSv1ndZwCCzQJIBvHc6pJKa5R
 XEtpN3EEFQtTKwO41yAHfdyxuIMkEU4DBYqAHjLPpowFCnunzAQx+CcXcDWVQ77ywWBLRBrprIs
 hmGp2Wz7fOHH7g8HhjQJ73URqJmOxYK6/5vSPLnRilF4JkPSPafG3Ig7Bl5ZR1rQGVR1M6H/GGT
 Rk1EwOQ15j4EoW5K4H6cVt0WBf4HQxFZ8bfKdWVWWAxVV4cdRT5hGkE5NdO8zDP0MTExeEbYiYZ
 9QOZNCa/TShELiEqImQyk5zRSTvUezI7EviutH2qEYdfPadof369hdKY87LqZlPerVo6NyVgFVo
 waryQ7tXvsrW2J/K6fdoumA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add a compatible string for SPDIF on RK3576, which is similar to the
one on RK3568.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
index 56c755c22945..502907dd28b3 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
@@ -33,6 +33,7 @@ properties:
           - const: rockchip,rk3066-spdif
       - items:
           - enum:
+              - rockchip,rk3576-spdif
               - rockchip,rk3588-spdif
           - const: rockchip,rk3568-spdif
 

-- 
2.51.0

