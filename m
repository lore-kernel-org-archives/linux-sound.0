Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691742;
	b=yntIIP9VJHegsPFPy4/se/ePwgEjMjCcJxETLqiQXzVXofGEHzDdbH8oFGaEuT6f+oeg
	 /AI0veJXXuVtvRfosWS35b4EI0FpS44EW7Ccac0g09kZCPzW0I4FnmZvcEe3Bw8cJMj5V
	 ckQwWuiF4p38FIbgPoKiaFo3xSCEncep7UMJQJO/l82Zbd5RqfYtI51KhfbJZX5IQHlfx
	 CAebu1fAZ3kXPV6K3ZmlyKwW2keggw5rhgy8F8p7k5H1HnGe+/rK0zZ2HdGGsIJbWIIvL
	 stBXusCXD9ZKWm9reBbPcy4edIs5pLCeCvpuHEdC7wnNkWL3rbW39sEAHusJHeXYlwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=vHOHvCSXEoTo46NVws8vPtdQYLdsjWLGfWtQNeT/eIs=;
	b=oHSCTTTSMBpnUzV1JFfguMwmm4zXblSuQ/aOshQutnl+Kioz+ib2PwTpgpLFJv83r9Dr
	 AnbLj/pr9+tJN7SDaSHQn65k4PasjeUKOz25iabivr0r1g974PQlE54I4WrVqjYgzwRbt
	 eWD6Syko2eREuNSjWUgZ2JqY8+eFLpAmsEgMw98WSv+zf2dUKJLaW8mPAnmFJmrQ4Uk+D
	 Qz+PCxQ8x53aoZys91GlGrRHAcD6T9b473hNHvYRk1TSnZaP/1LdepG76f59wqUZVkVap
	 LKYG2W1lsSFSNKpw9pFXTu85aNuwfpJJWOhHyGYx2TL1EUKhcUHdZ26SPuECDaddOfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yThAhWW0;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35FB606A32E
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 07:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A35FB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yThAhWW0
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so996660a12.2
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 23:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691741; x=1794296541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHOHvCSXEoTo46NVws8vPtdQYLdsjWLGfWtQNeT/eIs=;
        b=yThAhWW0dRG8CWkEVUNCoiDTPtmkgzZstfnG+kQOYR4G5uwPhW5fsUw+rKUiQcbqaE
         rUkdNIJ2vrFDrIKp7o/OQtdcBifdiCnOIJkbSRHLKMGFi29uPp1jyVQqDHVUWbNK1XTZ
         uWrzQTZqRUrWBeNEL4s8ThToNqCwx3WE/w3ynamG2d6Mtli98IwwLtKPUXFlTT0KCy++
         4Lr9SYM2kVxGHm6LSQq/IdXy3kwnSShMlerd5xEo49BA4rgbsDB2zvdQYJx+hpipwYyX
         7wJveVDTWHZlTharPfK6lzHgyfBVWeL9bq8q7b2YDGx212amOK35Hp3uLbwB+Gj1eBN6
         mwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691741; x=1794296541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHOHvCSXEoTo46NVws8vPtdQYLdsjWLGfWtQNeT/eIs=;
        b=SL3cXuThRwcLlyAGqiZcZAYjS5JGH6FSU2MhRv2M2GNN9N4G04S0cvNog5oplztqQD
         BzOcBbTN4z5c0BT+2jUqoYOxdVltQGmNMQjLgEoklLPe7q5vs5V6v8slAv0r5p8JCuA2
         ZMEF5XYhq1mVdjZS04jxR3uIBM2dv+zUyMrGp83q5MTS+k7jKUldjMOQDJGOWktY7AR/
         9AhF6hOWPVb9iPl0BjuiAcgxMjpZAj52LBpnra0Y5ig5/rlS/xueXxEEEKVIyDCOT3Hq
         dxTjGxj8u4POjvFFgn7agvqF9cy9jdjpyIQb1uwfbxY/sz2k7/qL1VJ6FIFftTaiNhY8
         772Q==
X-Forwarded-Encrypted: i=1; AKwUvBwn/syfSruuAKqHgyENUFbyu5cShiKE/VTkGI3A93zMc8vDiu3XZZuwqR0vp0B7E8dJnP2H+DvL9El7DQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ToV8ZnmaG0znpw1mpyiV8B2Nr95uiDxt7MMfcpgx/ppORB8UN
	+Kn3n62UHwFjiUaymOraY/oBvNxBB7zOCzWB1r4ULgUNxClmYM8v6WlF
X-Gm-Gg: AYBFou1Cx97sDazAm3OKthGHaH2JykWj2toc4lMhg+Heae0yhBfE4vkcvBwjRa26M2I
	xYzWE7H9ZHdG5KEATvhKhXo9mas5WDd76vMRaBrscOfcME9SQbw/Sq+Nh6BWvQufd8azY9kaXOG
	Nq0ht/YDdfqOSuKoc1hLB8SxDzImFYyoyMywYO8y3sH6zgGOII8CYAziDi57hCPCrcgSdDFbCJ7
	AO9N+h3jzwK5LPwXp0Sz6Drq5SyTjf7G6N9kWitZCEQ3Vvtdx5DDxF/7+q03cvq+0KT7KZR6cwT
	BHmHVnDVnntUdJlIkkQ6AnlmB1ZIeBXdj8jfDnVAQ7p6OKNINCXjQk9xQYMgkGIvz0leS5WS6WM
	h1ijo/UgSjMTtIUjSquLqgsv6gJqzUYVU92He6UUWLN07NVT1zqvaZkW/Al3IaVrfu1n9wwzFbo
	vAHeQ+3QPd7Qvi+inhLVDti7jXkdtfKIEwPij3RmQZ/hPXIMcgc75RvUHPj1sI47Hkg7byQo7Cr
	ZUvbSudajY9oOwycqok8WqhcZlDbunT3yWUN4EsxSWkISpXQFch45nsHgmWZpXX0FyeOCgvdiGn
	M8CHBsTvg/C4yG2FrxSZ/58PVdpMzfNs6k/C1ZrpcxEs7pEjR5K/bNLTUZ2KBdv1ZSl7yH9F0Qo
	tOzBtNX7h7qaoiTKvh3jOstk1yqI946jLvfrKht5b27iKKve269XZKP0GxYIyomYjCUsBfxhAFL
	YdZ7A=
X-Received: by 2002:a17:90b:3d4b:b0:3a8:1a1a:7895 with SMTP id 98e67ed59e1d1-3ae8977640fmr7907935a91.18.1793691740953;
        Mon, 02 Nov 2026 23:42:20 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:20 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:03 +1000
Subject: [PATCH v4 15/22] arm64: dts: apple: t8112-j413: Add
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
Message-Id: <20261103-macaudio-v4-15-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3189;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5tHHgqd9nLG6wvk38A1iPKU89o+NzJ9eWA6n+JZ0CHs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/Pa69X5b1ifPf+kakJCX7iN8Vffb5ssE2q83HJ0
 4tNhRcfdkxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKZa7hUjw/urKYw7es/HfhY599g8qmftTo4Td0T+bLPsjPq249yxI52MDCeFOBU
 D4tbsWsB3Wb7g7/biiTveJS1QmXeMk/2J6nxWLlYA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Air integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j413.dts | 104 +++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 7ccfceb08093..62aba7a4d3c6 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -92,4 +92,108 @@ &fpwm1 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	speaker_left_tweet: codec@39 {
+		compatible = "ti,sn012776";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Tweeter";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_woof: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	speaker_right_tweet: codec@3c {
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Tweeter";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
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
+		compatible = "apple,j413-macaudio";
+		model = "MacBook Air J413";
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
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-2 = "zero";
+			dai-tdm-slot-tx-idle-mask-0 = <0xf0f0>;
+			dai-tdm-slot-tx-idle-mask-2 = <0x0f0f>;
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left_woof>,
+					    <&speaker_left_tweet>,
+					    <&speaker_right_woof>,
+					    <&speaker_right_tweet>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>, <&mca 1>;
+			};
+		};
+	};
+};
+
 #include "hwmon-laptop.dtsi"

-- 
2.56.0

