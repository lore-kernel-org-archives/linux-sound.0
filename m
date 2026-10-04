Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362EB40F731
	for <linux-sound@vger.kernel.org>; Sun,  4 Oct 2026 06:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093963; cv=none; b=dlEUb0K2npXPhRabxjCYta5phwo9rH2fuqPZcnLMwpvrfxBMM2Sod8q8oa8PeXHisYmd+7ScO07vZgp4nGc/nmHp1RxXC4I3VLn/43f7yXtzlk90Du1ZBY+72cDlG2ovSiWq8pXm0ye0ErEBWC7sArQkyGZPg2TcLcHdIlqJnQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093963; c=relaxed/simple;
	bh=mJddJwm7KZ1uNbWRbS6abM2+DhqXtUFRofNbxKEJICc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LWl0pNoXUEsykYhk2geUnUALk+bZFSrUbOgK4JX3IEah7XDhnTQWcOVP2/QL98PWYnzIZ6a+hYK1NOPsyIBc83v2wvlJ/76KKTKX9/qOzbkSOY3IzqVj8CqPWGPV18RomQ//s1SuGtLLbSlCKOSBCCiZycIyOkvckJZej/edtdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGvybf6y; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGvybf6y"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e2e064b932so3939715ad.0
        for <linux-sound@vger.kernel.org>; Sat, 03 Oct 2026 23:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093960; x=1791698760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCPGuiYL0vLRXDDm6MOp5xoRgl7DVlYqvCMkReNNZVo=;
        b=CGvybf6y60eU2/i5nmuyJ+QMBSKPrGVu7OoTix7ZC0LkbkqcLRKFk1xwonxAHv7rvY
         8t1NGKKs1mHxreqnmH6m9jZL3EIgQF7ZcrPpm+rzvgMCCU2On5D/PerNPdLh9jo+43nF
         mw3K396WPfP6ydmzWDs+0uPUoOEZtENT3hzvg2Wn+oJNC6Shb5lXjMMcuUcozpFBsiYY
         PpsBRPmGhigOUTr8Gvh5fNg3clftbkG142VxjD2bb4oc9c993lTh9vaH9aFTuBnCOuIK
         s69oi8jW/pxyEls+glx7VNZ7pCtL8yHMimWBhmPHFSyoNdNoxO4r8lHwJfAEjS8hokE0
         9PPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093960; x=1791698760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCPGuiYL0vLRXDDm6MOp5xoRgl7DVlYqvCMkReNNZVo=;
        b=PAOCya/01unOfnJ9ERnL7SDJeG9Qa/66XNQ3pYZxcZnaFn7LVS9mfHeyCMsaaqGfEg
         qLQn5QAop+oEVXuorSrxivIOJlxme+HOh5isoYp6Vj1QpKFh3VHStWWdUyzo/D1cV/sw
         WzNo/xjf8kjCmN4jR7pnoXV1jDRPrQ7cabq+6tkhKx+sJLSsoYoRgmtozKXqDPumOhbM
         08KegCgm9RsXk2Tk9VIGqWNPTZwryy5m9UZbn/6b18rCwSdg/ekGxBk7YsOIkBMgNBeK
         s0hBeHbq1v+J1C/nnrLP8XLwzug7k0fgrwijdC3P6xq/IYFBndGxVKFLRaa5hHFDoMoa
         THYw==
X-Forwarded-Encrypted: i=1; AKwUvBwOYm4BS9GwChWL32GGu7x8iqf5P/0+AzOgp4AGpPfS+lXLoBnF5M3J5EXeD2Z+y0CQsHyZDlbiFJ/EkA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLpTHSGiQctsPd0Ybswljzen/R1B29PCrngiTS5kgr5GtkH7Yeq
	pvAmYAni4pN1a5m4SHriBZOTHk6mDQY6wSwMRDjCqPHJq2nofDBL89Jy
X-Gm-Gg: AYBFou2F9726d/a9ZnV+dETsRTPlG7GszeY7a7xW6OTS8T4rBuZS6Hz/xDTL+7x3za4
	YyfrY5Wdzzzj1m5DdCUdXcW6FYIp57sOKgEVLXNOqN897PrxWzm806fL4pD9g4ixQqoIrXw6kK4
	qW+4n+CnOjbPS8ho44Zixyh0MC9yYIZTwXLQo0GgDQusyytOh+u8OKxomCOQgm8mUjdQ8tzMjmx
	mMfk1WV+ZMQpSBHBD1rUU7Fiic25ea23n3EP6diXNBjma7c2Qwva3s12EmLVvN+vP4fhrMGC7ZV
	ws4mSoJ/Y3sR7BIyTJSbCp+DFI+xJU+VJLSvW2Kwu1C1wM0TxWZBSk3kRI9qANoXyJ0AwFWA7x1
	lAeC/mDHmYT4bKHDDTI/shkjf4Wvs1rPf2uKQth05AjwAwZfqjeWWklhuUf9o3QTYQndie9RtQ1
	SLd8qT6otpbp5lfA+yzSl3RXbcQp53NlbrQ86dTi+S4kwzjPf5asYF6ezB8rLJHXGRnsHPPW33O
	AonIWFJbmA4mZik4bSuuAANneYYzd/QX6TXcBx0u0NamMOcUbBlFUdEQYsK9l4UCX4j8dA6xMvS
	Q9szf6Z1l2FKauixGOBkKPAEmdSWLhVwrPK6/Y7PnHwQ+4U=
X-Received: by 2002:a17:90b:5345:b0:3a7:1339:c454 with SMTP id 98e67ed59e1d1-3a78750ccdamr3295837a91.47.1791093960302;
        Sat, 03 Oct 2026 23:06:00 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:06:00 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:38 +1000
Subject: [PATCH v2 11/21] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-11-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2368;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=mJddJwm7KZ1uNbWRbS6abM2+DhqXtUFRofNbxKEJICc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+Ty8flGpH+8zah85ePzDT7f9z23WbqmeWefwPw0b
 e/0s5crOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFN9/iLDX+nXfjbNp7y3RS+TkE1IixG9Xb0+mrPL1rbCq7zroWmjG8P/GF2xxj6
 2/x8j8oJjHA7z5xTVMWwJWZyd5fDw08aS6hJmAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 MacBook Air integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j313.dts | 82 +++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index f8b2b1637b9d..cdda63ca8b34 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -55,4 +55,86 @@ &typec1 {
 	label = "USB-C Left-front";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right: codec@34 {
+		compatible = "ti,tas5770l";
+		reg = <0x34>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	jack_codec: codec@48 {
+		compatible = "cirrus,cs42l83";
+		reg = <0x48>;
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j313-macaudio";
+		model = "MacBook Air J313";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-1 = "zero";
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left>, <&speaker_right>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>, <&mca 1>;
+			};
+		};
+
+		dai-link@1 {
+			reg = <1>;
+
+			link-name = "Headphone Jack";
+
+			codec {
+				sound-dai = <&jack_codec>;
+			};
+
+			cpu {
+				sound-dai = <&mca 2>;
+			};
+		};
+	};
+};
+
 #include "hwmon-laptop.dtsi"

-- 
2.55.0

