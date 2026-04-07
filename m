Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF53364EAA;
	Tue,  7 Apr 2026 15:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575243; cv=none; b=eVGHqz7hh4UL5/SoNwa9vJYnEmd4Exn9Tgs2FAUcdje2FbMjPtQBi23hyPXBmyd/elWMTgcHHVm7j3HWSvcxqWM7DrKQh/WfuWc3yj+2Xe2Zx46elvKJHyT1KdBIvl9iWiegJohN25H1DbMAvsZAyf5uv/uemN2nX5ni/2946I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575243; c=relaxed/simple;
	bh=xISTmDXyLFXv3V5ZmZd2Mj6pfE0l9tV0d/hNSpGmA1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QXHsXDl9Cgg4Mi8vGAkXA7JCl1NfpTsT4G9Mi6K/Cg3V+ex3tAxg4wr4S7Pe5dUv4+zMFnYw5myWKl9b+L9cf9u8+UFnuLTZl0K2tAZ1rjlNEQ112hHIGvDIQ7dUkHJTW3gL3GCGSQtKMbqaROznosXS5W/tzlN5b18fTQMR67U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz19t1775575221t0f9cf910
X-QQ-Originating-IP: 9hGLbmpVplimc9GDcOvLDHc6iafonfMgsd9SfPYjBtM=
Received: from [192.168.30.32] ( [116.234.14.100])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 07 Apr 2026 23:20:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 243773147179780458
EX-QQ-RecipientCnt: 16
From: Xilin Wu <sophon@radxa.com>
Date: Tue, 07 Apr 2026 23:19:56 +0800
Subject: [PATCH 04/12] arm64: dts: qcom: kodiak: Add I2C aliases for CCI
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-dragon-q6a-feat-fixes-v1-4-14aca49dde3d@radxa.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=820; i=sophon@radxa.com;
 h=from:subject:message-id; bh=VKzq6jfME1q3HY6Bw6XndjSkzd5/qThWM1czKf0dqTc=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJlXFZb8aXoxIfrxlX8TT73m9L4U05DGE7XqwTs7hp+sZ
 s9q5/zd2FHKwiDGxSArpsiiEM8wl70y99pTsVI9mDmsTCBDGLg4BWAiDusY/krUPVG7/LHx7KOj
 O5eXL78pxswxhaN6rb3kYccbh3xLNkozMiywnP5EkOntzc/1JvqmolKx6TPMfgqzzsi/z9Hy+KX
 sdD4A
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MdAgt/VblnZYCMxpJ8Jfu2u/+zzmDqADMnJWbVXR5mI91qyA2nFTPGwF
	vv4S3GgmKCfPbZl0CSFt/2qAaCXZwjMoC8+VhcXGY2HbE1X1oR/v3Vh5SB6f+iRB/cgHNrc
	DHIPQVOKDGGRKQfAEUBkRFKbkzMDX/llsqqEHGmYja0+7JCnb078TdWdSXoHxXU/jA33SFm
	AsIpNnnrgnqaaIPgCRDmvCHx0N10ueCecCmg9n3Fr0yw4lD1GXYJkhVIC2d/iyfaHOK/mbb
	VYtuKgEngJ5NyerBaqhAMiIfPp3SHqwYy0mArwRriGqDS26Y2eDowBo2ttPwiz09as4lfld
	fHPtPSIEsrm05QwXEz1kxhAO994FXX4fphToktiDQ0BmbmeKtR0pwb4vwcu9UKJSG4qGhDX
	eSq+ywbb84nm8Iwmj3zs3+df27ESj/dEagDqnmPwtRd50boGJV03EVon6wBWdLykUCy+SgH
	VrNFHvD63HsnSUwqpG6DgEtWoZZB+gH2QarMFMtoMrTv9JmiMj12OVcve1KgRZYHZSqWlf+
	/OZXbNnWcTWZQvbSGZ0LrZ+VUEbOtZWicp0hzb9h/tUZU5Sy30OV/0mmq0y+q0+YjNbLeoh
	ycbL0e4FQecseatii8IuF8E81EHMB2CLZjpZeqqAO9DqHn5uG1JGDuJZq7VF8lOzMx6SgR1
	0w4mXBbxHwjFbtGyB0gv1JCkwfix9VN2quUbRup94tHGklPos+D3XLC7legJYv+m5BmEPGv
	3YJwzY1HfhIJy7uHNMW9CTLImVh6BtC5Db31aWIWSCMHR2HGyZfe7Hx0w6NDXcJn7v3aBUh
	KKYhHY0A/XkGFf/GhTETEYT0dgdKxaWadmc5lfuGCw7/EPLCFks9X8PdOLA0NOtfAh59sp3
	upzAeMY6KDo37YwP9px37kwM6CtIhVB7HpzOQN91zgXhu9ARWcAAnyO0j54BK3WuBJnTEHv
	eSV1z/W/B0vNDlfHtNYWTAnOEreZy3/1GF3cWSBx5vcZMxJILLXjjDDFiKODlVE3LECSWAG
	f2o+764egI/LMLGvDjKQibndACiVZblS4KLFVc5AoTQMN11yvxTqNyO74UMlRZ+vt+9D+Sn
	w==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

From: Stephen Chen <stephen@radxa.com>

Add I2C bus aliases (i2c16-i2c19) for the CCI (Camera Control Interface)
I2C buses, allowing a stable numbering of these buses independent of
probe order.

Signed-off-by: Stephen Chen <stephen@radxa.com>
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 988ca5f7c8a0..3a30126af3d4 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -57,6 +57,10 @@ aliases {
 		i2c13 = &i2c13;
 		i2c14 = &i2c14;
 		i2c15 = &i2c15;
+		i2c16 = &cci0_i2c0;
+		i2c17 = &cci0_i2c1;
+		i2c18 = &cci1_i2c0;
+		i2c19 = &cci1_i2c1;
 		mmc1 = &sdhc_1;
 		mmc2 = &sdhc_2;
 		spi0 = &spi0;

-- 
2.53.0

