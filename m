Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691759;
	b=3OBiXOv5NjhznVYBpvnmsRvd2FHjcFnSIAEvwmxkr+woe2WccxJB/8roViXO2gYPt1bj
	 w8/bba9B+H7NmnYJr2LqfHhL2yW9vSOH7wcmbCkK5uI5PJq5FY55JtKqbQbSR1EHDj8Bq
	 3D+li0g7FoycrH9be78SjRgieZvEqnNAlnVdTG93x0Sm/6PhInjAe7kDny/AicXb1FW4S
	 uYyfhNNuZJBiEpXLb5NMPf01aYBJdLiZ+Vhq2e+WR9xCWz4heq7o0jRX8t2uTQw9BX4Tk
	 UCl2p0pzZMV0S64FZ49nNUWJEsFZvIyJ/Dow2Jzq4hJjUDiEQiG7mr2Y5rAqbvqSy9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=uB7Zr8fjFw4qUXECHUjQ+xk9xZP2bxklv1w4UlXmhmk=;
	b=fj1S1DPwlMiC6eSJDnAjuoowitz7H1CgeJAndpQMIfKkYELlPcOCSf9Hc0xGKNcQGQ9G
	 p27ItW2w/N2hoXGmrktWbK0JYylTuF+fDx67LjikrYPQvoGcg7xoX6yiqhFgRgmrd59do
	 S56TVeRGM8VN5w9E600m92ag+nXL13Y622CBmGTn+23ruKGvmJbmL/g1FeU4yxEgVJ3gJ
	 hZbEVaKsJlVyrJHCAdOZ7ZSb9JUY9Ee6YsCBX88+ShWOvtRUGHGvrTBb7Ozcv+S9H+k8V
	 viwtSeDxNLIHUIXYkQGZd5PiHsxJ0slTlEywnQhLS0fqLkf4EQebR0THOwG8RyHU5Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iuunEE49;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF183606A330
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 07:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF183606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iuunEE49
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ad787b79ffso2315541a91.1
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 23:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691758; x=1794296558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uB7Zr8fjFw4qUXECHUjQ+xk9xZP2bxklv1w4UlXmhmk=;
        b=iuunEE49RrUD7Hpbjb2aUZpMRRiSomZtYuMEEtERJOZbiR8kxx+YH+vYOgQ+YsCWbt
         RsF5/PphdWanvJKIjgCMNn4vM9DbkCJKhZtZ9hAP2PKwsN6RQB3LyzjOTJN9Uz12zspn
         wQKnLLHKrUnZI9+WVFKGNdXV68ubmPNmgnrIpClrPBHHe71Mc3eYtnTRYAFI+SBMVsVE
         eoCi+ADQcSzmgeidNnoJee61DeNBSqPhDcI+waf46+C9jdmMY+2y/q7HHlrHbOtDYKgp
         fOW9O5KtKB3aOtgcG9FG0vIWslBcbeyGNqxA7aaXqTVouumvhsScGaKv+vE0rzIVoqeA
         8/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691758; x=1794296558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uB7Zr8fjFw4qUXECHUjQ+xk9xZP2bxklv1w4UlXmhmk=;
        b=0Jaems4A00BtV0fF/DSVaOCb4nzUSUqEVSv23QqBYRt+65vM2PMnaGlT0cDNkMkDu4
         HPa5Uoe7eKPYv+0JC5t8sDOKFZffMxn2PliAKGi8Oy/R6C0Dqq7eNAhX+MU4wtOOdOSF
         CwyCfKeCxFpXuqSmhxXUrtFfvJdy8aOPE0jSmKEHvmg2g6GVy8RmbS6Hm3YFunf1R8lL
         p0DZPf3ZwHzx9NTp+2qU9TX4Ee5INzpBjivHCJmQ4BKfJn16AlVtcIBo26mjuignHT8M
         NgSBtDbo4BciGkrJNCan8ogGJw3XkZZh+3/WvYwuWuHwkiX+aTkyJhVNXTQkBCDt8CQY
         oIZA==
X-Forwarded-Encrypted: i=1; AKwUvBz6jItwBALj8v8fBJfg95KzYOOGzQ66QkwpQ1/LpSa6SO5XNyy+g8NqIdhzp2GkcPrJVD5BoUyrlMWGzQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+yH+uaWR5NPgBi/55zU3jIvrYpKD9Ygs5CfRQSTK9LkZDTd0qJ
	l2CMwMeEirXUbrH+PUuR2qskxicg34DXX8OtCtt6KdJetahpPE9vps/X
X-Gm-Gg: AYBFou1wjUFccBxryvaynmDH+sLxw6ZYsK1ZI5N/vXbyV2wUCmIqf9gtDqdaHPmYLYE
	htwbiWcaMER4uAO5kLdEnadiE0TBDwKAYebj7ZSUP2h895mhI9lCaE/jaaUMCbf7UJg13SYB09J
	A3XuOJaJuwa3ciwnmpR4drQ4hscN97bHRLi2vWayzEa6Mnu7JGK3XfyZkwRpAxNoaj0DoNE6pCT
	0NIKatWDzehAEjNWESEMwIi1q351n6OMc7rKWQMZuz1z+GhHvjn9Lda9T0s3SAFgw8oD+w96G4R
	b+6eMJw0kihRuhxV8JrBDLLImV7g7I/krHrNQtQQioYxelZ3EM3uwZhWGpNs4WRe5rOikoi1JhV
	XT6Ge/sFx9OAwTSBdE5yVIzP3EmFrsPt76nMRkAo2Fc5K67bf22J01l6xMEn81WoaPNl9ZWB95J
	VyRnEmqpS9Cg3zP+F6kpa2IF78yQgWzoUyp8MzcSnW5pIc0dY9XLa9/yb4acqTqy8fOyxuhc4F3
	9//zw7NILRP1kyDphaCGjdbP5pCWSAc7lMt9GZ5w3q4BhEbLMVubVzqvDY8ZEojsWt3cxYoZfM3
	dq0xOlSOvIyMX4sPAHBdqhIuvis0UHwApOk4FRJj9Vmy61tPx65g17FHDG8iNsfmprkDs+WNEQc
	ep8106gvTkqDRfmwfdcXeEDll7StYvxE9ed5tolE4wJzR2gVBfykhHWaRGWETGK9NxRgTQH/Xjx
	tvVI0=
X-Received: by 2002:a17:90b:4483:b0:3ac:9259:1234 with SMTP id 98e67ed59e1d1-3ae8979ba8emr10104416a91.39.1793691758138;
        Mon, 02 Nov 2026 23:42:38 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:37 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:05 +1000
Subject: [PATCH v4 17/22] arm64: dts: apple: t8112-j473: Add
 speaker/headset jack nodes
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-17-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=KxdvsBHCHsOgUdKIYNQ3yP4bIh+4Vy0Oz8XtoAQOVeo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+89Xx62O3jC1V+SyUKnljuUFkfUzbs2NS1jV+n2zh
 uF0wYv7OyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFO97DIjw47K7990qu8sXTpV40lwXnSeuuYVy6OzqzYf1q1SUq3je8Pwz9zvc/D
 7CTr8d4OP+Apqzq+on+4kU1LvfPuwfrGark0hHwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Mac mini integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j473.dts | 58 ++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 105a9d118980..6d79164cea89 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -85,4 +85,62 @@ &typec1 {
 	label = "USB-C Back-right";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 149 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 12 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j473-macaudio";
+		model = "Mac mini J473";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		headphone-dai-link {
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
+
+		speaker-dai-link {
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>;
+			};
+		};
+	};
+};
+
 #include "hwmon-mini.dtsi"

-- 
2.56.0

