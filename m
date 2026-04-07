Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F32536DA0E;
	Tue,  7 Apr 2026 15:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575250; cv=none; b=oc5lVe7EcAJwEADnf5KDPyoUFTzZ14O0h6MsGJ4sZx5sruCMHGRmI039b8S//+SdWPIYxjEWMNfIolwy7pyLbp778poK1ahQxNsLTUV3Qn/dqgzAJIIwRkFcYl79PvIlZPB+s98bPjDW17/qK+rcltRzQ96zK20wcT44fROgOlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575250; c=relaxed/simple;
	bh=X0Qk+UCVz9SDLs72GPkLwlqwwTiOepSUr8edYNrhXxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BxNFtqUEzUKMFaPG6cYfjPhtRT4txdTH9O3WsO36xc75acd0teIpkP5SNYc/q7He9qOcZqCLZzlsSlTK0DgSBDfaYz7I37GTEel5ayVzxzi89lE4F6eanesjOL4htc54xSop6OaMlgQ2LOvHHOqfeo/I6rVbdm1GShyrnvXq7B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz19t1775575233t10419500
X-QQ-Originating-IP: FBf+c357Usd9zf5sh9XO5QfG2hXXp/glqc352Gjqxpk=
Received: from [192.168.30.32] ( [116.234.14.100])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 07 Apr 2026 23:20:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11940775239744383813
EX-QQ-RecipientCnt: 16
From: Xilin Wu <sophon@radxa.com>
Date: Tue, 07 Apr 2026 23:20:00 +0800
Subject: [PATCH 08/12] arm64: dts: qcom: kodiak: Mark secondary USB
 controller as wakeup source
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-dragon-q6a-feat-fixes-v1-8-14aca49dde3d@radxa.com>
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
 linux-sound@vger.kernel.org, Xilin Wu <sophon@radxa.com>, 
 Stephen Chen <stephen@radxa.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=733; i=sophon@radxa.com;
 h=from:subject:message-id; bh=Gu+uC97SGYs6OqppTTTbCFpDl31QQdXxSVr+QHDlilU=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJlXFZaebL/T6shX+FhZt3aF4uqU5qhTJ/h54rkeTf+r5
 qsUfIito5SFQYyLQVZMkUUhnmEue2XutadipXowc1iZQIYwcHEKwETKNjMy/NbvVdyi+lnlH59z
 9aWlh67wzOKWkkg/lpQectz8q8/BvQz/MzRs319osZ5e07XhTvF6y7eKR5VT1q69vlFo24JFh3M
 esgAA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OWAyBQUmjFVP56qjSzahB6AkXuaCH2ReBXLhfDCbnsjgP7Txn5/xElbe
	VrPOuYEX0xKlO5hFT/7Zgbx1tvOsC36dfmRf8GDsdxv9wl6geCUMxu86kEAtaw9uY2t1o1M
	iw1YEN9sqST63QNoDEvwF2TjzUdTT7Wn4/LKykXtjtGqERbw8UKL4BdDwmwr+bWCCBMI9CD
	cewSgD/Dj3r0uN8GRixly7N8K2/s+JYRSbwF7ZxwJJFE03kuoh3J5Q8Pe9+L6EizgbEU7es
	VxTjnbhfnzIwSGRk13cueg5RFX0XC3dcn+kJfueyn1c9mJfL+imJG+AzRh+Hbw0jwMuVpCQ
	Qy4p9tyPZk7+mjDv69Xmc2BoUtOMUzLw8uab30TU0cQNxG3wqYrGBPUozRN2kc+zEZQ7WXl
	CGDfIR4IAB/pmAncSW91+oUh6j/fXKZd5DQ45CigrVgsr0c0Tic+TOx3fEZW/QlSoY4MuOZ
	Jwp3S9CGaalcvOpaKoNxViyc/DUB2Itl6B4UvjNlhvhm2rBPwOh0uWkxmauhfyayI1NgNjx
	4al/m0A7PJ2CO24c+gJytlbz62QxTYKIrJVgQ8BaHewqyiQH3CUd8SdGC0AKG+Xsht/fWPs
	ToFLbFF+bNaohVit4sLlKLpjC6Ap+zDO6VIF4ozxb/GlV3S28V7IQOXet4iCCIzoKt8ATUT
	V1pj9ChpWQJaMH/UwtYrSkaAMkI/7AcyICY+Z4TnM2LgqgC1JApvA4OE0jlDXPpxa/UbsMT
	AvB20dXtPUsMh5I/ltgrqBnQEUAtm0x0uJAm5u5WwxpsuhFvKbAVDdl0rUqbjhcNLQgkQfS
	ij6LMTFiC3Zf//VyUqRuOdCdFq/ajZg+CaVb0fDQ40jhs9zLCVr90Arcz4uAhxIHSkJIrSE
	xhN+UWZJRzDCBTgP9+Al5aQ0JsQ7KUBO2c/cZ9HQT144gXWibxU+9lfrBNo6AotniYd5n8P
	A3Q7zjbL7p6zLgGhYDTZXM+TOWxv5MCQryI/0jLbR03JvF2AlIkuzXiAk7/nV9TLPz6s4+c
	D/MrDCjUikyG23FoLz0dzW9DLJl5Z5XMpEqKo0k2Ie5XYPwMmUHAmIRuigPGZdg3L/E91V5
	w==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

From: Stephen Chen <stephen@radxa.com>

Mark the secondary USB controller (usb_2) as a wakeup source so that it
can be used to wake the system from suspend.

Signed-off-by: Stephen Chen <stephen@radxa.com>
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 3a30126af3d4..940ec799e905 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4404,6 +4404,7 @@ usb_2: usb@8c00000 {
 			phy-names = "usb2-phy";
 			maximum-speed = "high-speed";
 			usb-role-switch;
+			wakeup-source;
 
 			port {
 				usb2_role_switch: endpoint {

-- 
2.53.0

