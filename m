Received: from mail-qk2-f38.google.com (mail-qk2-f38.google.com [74.125.230.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0037F4A4998
	for <linux-sound@vger.kernel.org>; Sat,  3 Oct 2026 17:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050240; cv=none; b=aMgBVUMxbdaOhq241Y03zD/b/Xv3GI6lPVWwGzbJZtK8cGitubpK0LDz9cOgDb0hWWCWEIPqz6J7fZF8KSrsU98HEAjpFEMUsL7LgZXd2vXHkSlpiY3YH1iCbsUAH/jCPCV559CjUktEFDvT2RMHLuswFAvRDWsW3E0x+SXqki0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050240; c=relaxed/simple;
	bh=2V0qBXWkQWaJIHJgjhlGvc3Gd47a7McRdg7biTgETbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Li6x0OJtYoi1Xgkm6WYt7TKPnUdkPwhFCGJgAyMkbUbwtK5LWZ0TzmbRyctWXsYXK0TDd8k+zI65THWxoh3nJZQ2cEXpKlyTy/bLXf8HFXRu/wX5kHbjyiMnrRwQbP9oEiAzpmCNS/GMr6abqo3v4Sw3feFKqCHoBWyb7wX4By0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpIl5tr7; arc=none smtp.client-ip=74.125.230.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpIl5tr7"
Received: by mail-qk2-f38.google.com with SMTP id d75a77b69052e-5337ecb5b48so5118011cf.3
        for <linux-sound@vger.kernel.org>; Sat, 03 Oct 2026 10:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050238; x=1791655038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/zOvoPnwXNPf5C8d03bW80XrbdlIDkEOSYK24yCMxA=;
        b=EpIl5tr7xAhCJ9UR2LO3Oz4s+9aY0bS2nH3LmJ/y7ryAU4rEGclI2X7hkVDxRL2x0y
         IrfRL3wnNTl1ZLThdQJIqGVxt890SgUZrUxKFA3xI+ZcnXVlyS2HQpE4KdFBUmCxrxcQ
         zQG/PO97YlfaK3gA1D19QZ+Yuf0N0XxcT1ONXkcNj5Ppj92TIvMUxHf1WKJb9JRInmcn
         9jOF47Rc3TFMbbVnGhhpJ1pfJuODdNId7/3x1DwVNTJArYFtrlaprkGNAy3vu/u3Xgkk
         Rp1N1lc9r3JZuZTSv353TQqN/rSZSewwE4igJOETAkmGIVmAGoev0M+KWBr7eOiN4uQB
         td3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050238; x=1791655038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4/zOvoPnwXNPf5C8d03bW80XrbdlIDkEOSYK24yCMxA=;
        b=g4jmEjlFkx8C1342L2/XDjuUA5Zto9p4K3IycSVTSIufA+PQANN2Kk/ahbgcKFKi/l
         RyMemk/T1T7IE/yDvFlrlpZ2nc7q2pBGAMmxWtDDbYhlkT/b91A2ZHE1XKOzJP94Ez/c
         nPOCGhxIB16m3aiKEADqxjCdH4uQ3NuaJ0u1pVne6PWksaXNmaOIwDKhM2yOXTdmBv0X
         1stErRia/+fWrgMX3nuBymNMb23jofdFrcT3qfPfavWL69eF3dbyARsM2zUCOYH3rTTu
         tplykpWokjCLz7jCIZO6nsv6f7Vx7Hn1qVggMt3txUUJnsTQUnBpbrNhW62AN27i9DWE
         xC+g==
X-Forwarded-Encrypted: i=1; AKwUvBw0H1avbV6y4XyuX8eOpeya4WlZXw70H8vkpPFNAZ4CGcWJCHoY1CXfo23ikVpqVZwoOnwIoFiaoAfgeg==@vger.kernel.org
X-Gm-Message-State: AFuF++mmWWv1GQYiCeSAPJMnUD3n/jjlpE5qq+wt1Nf+DeynCrow6Rxl
	rpKBrCQ+WGB5aY+kx605idb6T19fNkpdVuznI/lelovzyvaHk07nybaM
X-Gm-Gg: AYBFou17o+Q+QEMwy7XpZpN+oyhhtW8yiFp01OFgO+xPsXEirr8uTq+gZTNwmOfNvQf
	s09QYBucgLBpBGlHpc9M9Rbo2QGVbHb26X0pBJfnpNnNnu1rcLauXO07ayMqBjDHmYnGc6jbUuv
	kS5awiL5/jjUBKzLcStTvVON5dmPcuHaQbkzX6pvPZHMZnFQC2U9GULDXWUSWv2mWYu258tfMSb
	VoLYhISUWPl8FSUYXd690aEJbo5chL+9hi+2C2QQ3zYicYoUQ+fVxkKysTRBbTzCFAw6P/+cJxg
	2dTj0BmV8dk7+QC4jS8xldGumWB7j4D+WPA/KprRszB23Qq/0oxGl2DXT4ElSc6Ipa9EW4x1aiL
	5vnc2zsdSbHGdT5ZKQ+v2HRxhiEdgyNdoJegWkS0LuHACdXMs1EEcsIGhnci23TiFU4HaNMUNFf
	vs8qQyDF/yQx3oTWt1g+TB1gBGMgb9/sk9VIQw0fND1a16EnGQ14Lcq8SgkRVzqAaj38vqGZVVN
	aRLVMSu/rMc
X-Received: by 2002:ac8:7fd1:0:b0:535:753:4b08 with SMTP id d75a77b69052e-5350753550amr92217291cf.17.1791050237877;
        Sat, 03 Oct 2026 10:57:17 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-918f748c54bsm43302276d6.9.2026.10.03.10.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:17 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 08/11] arm64: dts: qcom: sdm670-google: enable adsp
Date: Sat,  3 Oct 2026 13:56:56 -0400
Message-ID: <20261003175659.23536-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003175659.23536-1-mailingradian@gmail.com>
References: <20261003175659.23536-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the ADSP on the Pixel 3a in anticipation of audio support.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index b4854801a5f5..73639b0271e9 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -196,6 +196,12 @@ cam_vio_ldo: cam-vio-ldo-regulator {
 	};
 };
 
+&adsp_pas {
+	firmware-name = "qcom/sdm670/sargo/adsp.mbn";
+
+	status = "okay";
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm660-rpmh-regulators";
-- 
2.56.0

