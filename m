Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D055F1F4C92
	for <linux-sound@vger.kernel.org>; Mon, 21 Jul 2025 02:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753065987; cv=none; b=gsDYAD4gptAEf1Bf/Mpzs1WhyLFy0d0JbvjM6D8us1jsipyDXHirslMOjLhT/BRyx8mUmRXwZT2HQYugfEb0ikBAO4rJQIffdvlSpbkax+JrTJof9ZxQZ9XpGxKWtyf2RlUpSHySm+fTKKQyGKF6W8odhJsfK5Hctvy/IqDSh8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753065987; c=relaxed/simple;
	bh=yEaZ8omWU34qtXA8WYSSXx2Rt/5TLskqije7RZ1uaW8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=d7s5x1SmTQqT8U9yX+IlCM7p8P1gbwZONzMambvHJxQT5xIoBSFLcbusDmEtNXhKAf8EU60EpLwHEE4W7SPNnVIa+OjjeCcasQQl2krHFwBuMHczad4IpNJQGA9BN9LZdut4I0O1fNxxO357RSIky3NckhF/Y06c1DfwbACXw7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=px38nA0L; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="px38nA0L"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250721024613epoutp02e75fb31541bf007704142df079213234~UJDcUqgZu1103611036epoutp02m
	for <linux-sound@vger.kernel.org>; Mon, 21 Jul 2025 02:46:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250721024613epoutp02e75fb31541bf007704142df079213234~UJDcUqgZu1103611036epoutp02m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753065973;
	bh=kYU5OCc+V3vtBHft5oB9RQBUA5vxCkrWFAxrhWuIKY8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=px38nA0L9/Jdec3K65U1ncabUDu/K5ko7/Xz9swY8Y3tN8uXj5I5wW9y/KWuV/jxl
	 uZ6dEincPF7/wQb6bhqGSpUlCYk+7zuZ9gxnuS47wKeD+rCpWzSq4nLckj16FPs+io
	 gpM3SBDYyWIF1vmJGFDfpeXUHS1daCqiW9+MdH5w=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250721024613epcas2p13c65dd9daeb11c4cd758510423b3f170~UJDbndxm81507915079epcas2p1m;
	Mon, 21 Jul 2025 02:46:13 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.100]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bllC82jHGz6B9m5; Mon, 21 Jul
	2025 02:46:12 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250721024611epcas2p375cd5e4b53fcff3b69a39ef19c0825a4~UJDaNgK2g2776427764epcas2p3o;
	Mon, 21 Jul 2025 02:46:11 +0000 (GMT)
Received: from AProject.dsn.sec.samsung.com (unknown [10.229.9.52]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250721024611epsmtip28165857b4fff549682123371d52b7574~UJDaI8wbD1347413474epsmtip2j;
	Mon, 21 Jul 2025 02:46:11 +0000 (GMT)
From: ew kim <ew.kim@samsung.com>
To: broonie@kernel.org, s.nawrocki@samsung.com, robh@kernel.org,
	krzk+dt@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, ew kim
	<ew.kim@samsung.com>
Subject: [PATCH 5/9] arm64: dts: exynosautov920: Add ABOX IPC Generic device
 node
Date: Mon, 21 Jul 2025 11:30:48 +0900
Message-Id: <20250721023052.3586000-6-ew.kim@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250721023052.3586000-1-ew.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250721024611epcas2p375cd5e4b53fcff3b69a39ef19c0825a4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250721024611epcas2p375cd5e4b53fcff3b69a39ef19c0825a4
References: <20250721023052.3586000-1-ew.kim@samsung.com>
	<CGME20250721024611epcas2p375cd5e4b53fcff3b69a39ef19c0825a4@epcas2p3.samsung.com>

This patch adds a new child node `abox_ipc_generic` under the
`abox_generic` node for ExynosAuto v920. The ABOX IPC Generic
driver handles inter-processor communication (IPC) between
the ABOX DSP and host SoC using IRQs.

The node includes configuration for the number of IRQ channels
used for IPC routing. This allows SoC-specific subsystems to
send and receive messages through the ABOX generic audio stack.

Signed-off-by: ew kim <ew.kim@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts |  6 +++++-
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     | 10 ++++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
index a870c0b6847f..2f4cf112675a 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
@@ -89,4 +89,8 @@ &xtcxo {
 
 &abox_generic {
 	status = "okay";
-};
\ No newline at end of file
+};
+
+&abox_ipc_generic {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 4f086a7a79c8..21bcbcf7e2b6 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1133,8 +1133,14 @@ abox_generic: abox_generic {
 		samsung,num-pcm-capture = <32>;
 		samsung,num-i2s-dummy-backend = <5>;
 		status = "disabled";
-		#address-cells = <2>;
-		#size-cells = <1>;
+		/* #address-cells = <2>; */
+		/* #size-cells = <1>; */
+
+		abox_ipc_generic: abox_ipc_generic {
+			compatible = "samsung,abox_ipc_generic";
+			samsung,num-irq = <64>;
+			status = "disabled";
+		};
 	};
 };
 
-- 
2.25.1

