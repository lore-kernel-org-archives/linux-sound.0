Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581D3364042;
	Tue,  7 Apr 2026 15:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575232; cv=none; b=SOLYDoMHINd51jsaVAPBfmcgWGsFi4RY60y32m8OMP1VVPG3oQBwszgJwRCKSqH3e6+6VtEhIblSLnucwTsdkNgYdpA8mt+fhS0T83cYOO7Br60O35h1hhyqqXF69FL8cZ0jXX+5OAvk0kprgQxcVArBrswSOdinmShfOKmXNNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575232; c=relaxed/simple;
	bh=3J7HlkaNSppOHglQhRRih8iS2zdT6ETbXMPztWIA5KE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V9psH7ifcmYK8oRz6qVZjMin9yX2C+K1lmNh79uALygiCxn9EJ3g0wvc/4uTn3iB1/uFUcSrjpLfnlQm3geoK0noWHdefB8qfp7j71GS27ehZps5qDz4sVYqipsM7zDP+roxRccwxh7MV5nBh1RxfKj8fIgZL1bsYd4PLnOjKz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz19t1775575214t05a945ca
X-QQ-Originating-IP: iPsDdYAklBv7ydbyqaqD9yjsOwdL41B3JXDi5K6xcGQ=
Received: from [192.168.30.32] ( [116.234.14.100])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 07 Apr 2026 23:20:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5970734436179505529
EX-QQ-RecipientCnt: 15
From: Xilin Wu <sophon@radxa.com>
Date: Tue, 07 Apr 2026 23:19:54 +0800
Subject: [PATCH 02/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable
 UFS controller
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-dragon-q6a-feat-fixes-v1-2-14aca49dde3d@radxa.com>
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1313; i=sophon@radxa.com;
 h=from:subject:message-id; bh=3J7HlkaNSppOHglQhRRih8iS2zdT6ETbXMPztWIA5KE=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJlXFZY0s5zNTTbvmvFr3+e08i+ZU4Qf39COM/OYwd0Xk
 vDgyIwPHaUsDGJcDLJiiiwK8Qxz2Stzrz0VK9WDmcPKBDKEgYtTACZicoHhf2RRX+PxT2eqWU7G
 xJ3J0xa683vXI6HHHS/fHJfJ2P06PouR4fHeYlGnmGJxp6rgdTIORcwtDcZnWbMnzj9ZuU6vLUS
 XDQA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MgRO26CFjEybBwd/wb6YOxOGPiY4zJHeK0mv+Xm5+1c17O9+itYnlfty
	s9Y2FGqIOKpJ4moTdacRlhEEyAAgW+HZszQ6QHb6yF/gmSCGGzJjgvwMfFyCa4zJijWm5xZ
	Ouv7qmmKA96JaypVDBluMKf8RtB9gYI5hayM0RUzyAIfPLkHfMgbqp+T3kW5hs9OHT2dCz8
	sXkOF6KtUllC0BEQvmuCjUBd73uRod9LGz7YhPXmGsIS9du/0fH73kzV09PPS3gox2MTPTF
	JGR09hAQwpy52XqHHr63MWhr8BB9sLl6I3bI7NGHhU4/piNzWCSiBb0eVpV8Vsx9gngf+Bi
	/kvL8XTeYB80ZgbOcIHYsicXdLZjF30eu8MrfPeGx4Ob+8GteEDh6ul5k9tEdglUEi1QZmL
	VuCkdYO0d+Nk7VxFFX3hRdaLcAAGxhEcDVLM5iMjSnxs9KwcV21uCKBFD8abb5bI5sOUaL8
	Aca7dx3kmJwbFm7/cep34/nbqXAb8KDTlWgaM9+TyKfx+p62TyvQQRn4xuT6ORwKqourmwh
	vJ3VVEqhESJMLrY7uPVN3wSDa6DeCkWYPWUsCMHKDC53mLaZRSiVTUkb/LxBH6rzETgQYIp
	C5DKr/DBD8dqnhnEBUdirmi7jUtaKR/CyrVt4xi8r1NrEwjB8PoLVTjW2axnp9jRrKq3MpM
	oDp1FL2YG8TtaWJDSdGZUL04I1yRpuZEbSsTZJopH93VwhryKK48Y8qxCzfZubIRZzyJkm3
	1ozNU3EnzcPEmBQoh5TTJF/4jypxvZTpfVnnRv2NWUQOmshvGn9/TtCR8YV9W8oMPXdoPSd
	js+6XwUxbflOWGahykPMBWax1uiF0D91FVKkt5Oap9ZV/HBzBI2cgU8F0/bLCK8JASjY74D
	gRm7RjldThvmYfLJcuPAnWFyKfTUUglQIuFIU5A9umBVQBsaLeh3fXEpaJmAsZhy202h5f/
	3qE6BbIbhtoZAW8s4WRTWsYdlDNkCde7mK+glnkhKwa/aUm1PShn+nfL1AgRghs9XYPcvnw
	fCTtlZyBAkX5bSx+dx
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

Add and enable UFS related nodes for this board.

Note that UFS Gear-4 Rate-B is unstable due to board and UFS module design
limitations. UFS on this board is stable when working at Gear-4 Rate-A.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index bb5a42b038f1..c961d3ec625f 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -959,6 +959,29 @@ &uart5 {
 	status = "okay";
 };
 
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l7b_2p96>;
+	vcc-max-microamp = <800000>;
+	vccq-supply = <&vreg_l9b_1p2>;
+	vccq-max-microamp = <900000>;
+	vccq2-supply = <&vreg_l9b_1p2>;
+	vccq2-max-microamp = <1300000>;
+
+	/* Gear-4 Rate-B is unstable due to board */
+	/* and UFS module design limitations */
+	limit-gear-rate = "rate-a";
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l10c_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+
+	status = "okay";
+};
+
 &usb_2 {
 	dr_mode = "host";
 

-- 
2.53.0

