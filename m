Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12471552E4
	for <linux-sound@vger.kernel.org>; Fri,  1 Nov 2024 05:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730439133; cv=none; b=abeyRSrJb8V5Tbu2MzCoGshploxnZur0PHEtz+xCnb8tAwRJcPraXou7IA7qrmKPqBt3uDXzbXYfmnM6cqi7eVHB63veS0HLoOy3kfpy4KARCiK0i7vdtsu+XFoDOZM7B3sCbrT0ObwfagGiK4ZBFEzi3kU6oobsnd0oeB4gtIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730439133; c=relaxed/simple;
	bh=Y4jlBxobgZ/gAL13FnyC93S0e2H24YRzN7cgVpg9BhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qBwbdxvfdKxbm3RjlpLV2oSPI4vqj434p2a8irD9M9eQSkQaID34pZ1r/oapMpAHTV9VWVFYW4smKWAdHupAlXEIQWjZQxgUxRwKCpw/q4c8XhrbmIABCSe1uy5ilxFY4Oy4mHln7VAjk1muokB4VJOU7XFRZJUUFZT5g4T0c1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tXXDuyQf; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tXXDuyQf"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d50fad249so1156513f8f.1
        for <linux-sound@vger.kernel.org>; Thu, 31 Oct 2024 22:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730439129; x=1731043929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbg+pJFmpRdFZF0TehbUXHrYJrGTuopKyk0KMeO4zqs=;
        b=tXXDuyQfGcrTG3JDXRDQbkkPfWouf0z97AuXc9rdtvo2MtRNUig8LchcvUKaa86G9T
         cEx+U7iEi3MH093xG/yBe5/x1OFpTyPjWql19a5qCeNBodo4j/xXeW2C3A4VeM9fZkSR
         BIKszv7X4sY8fY/qJAcbcc+btz1OS8ptEv5DFioeFr3BqPu3W91Di5tNsKWmenTn8hN2
         F0a204hJEnxI4nsV7CPrZRsML98M0Q/M3HI9EpQ3VQ+zNO68jNIiCJxnjOviNRk//9uT
         UGJ9WCb1OQEgAgqlNuPzbGOy/hoKXWhaYSrFf9j0rENzVXT3z2h9wOSXws5LKN6OUHBK
         vmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730439129; x=1731043929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dbg+pJFmpRdFZF0TehbUXHrYJrGTuopKyk0KMeO4zqs=;
        b=RqRUGa93yXl+DaEbp8op8NLEW1ZFv1agrA6cVWHRTBioyGdUiJvVDJLDYRaCNo6b+P
         9/LnfioE6N8gbhrcY7Vt5ViX86xA/ZKfY8rUwpNR5ExgA+664qHmNJ/KjEVwSJGF5oAX
         u35w33MyKUaDscJzxBgCMYVk5n6PvAJ4QAjQjOE4aSplF2g3O8G8MtqyZqHrQZxHyOih
         pF/7WKlKk4/RAFThWh5NNSYVaFP8P7jFPdnVCJmXdBiH5yKwllyYvVFBuNwSIzlBlTem
         yHAEjLsrWanukc36u1FjdN3usRn003+JYZTvcoZ206JZanwrzrZEYdRMFIip2hh0WVpp
         RNAg==
X-Forwarded-Encrypted: i=1; AJvYcCX+ngpWodAHoWGEnomiqFazkVYLlguiaHxIXHG1vBO3knZEtzKX6iSY0pQNeauJrkoyxyLbbCJD85220Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyY2/LUHQ5Jx90VbvEzuwekiR3rqA6AoKtpmyS2hYvUno/JioM4
	KUvZY1c5jdoCZumzftvtly3rZhF+VZIa3ejZoYHtmYVoyej4D3I18f198RVEhzM=
X-Google-Smtp-Source: AGHT+IEq5IoKLZyO0QI95FVwn+mkHbo9Odfy10oRy4ZnfNGbpFsQaTmT20kzgJVE6OtilB7Tb3vjlg==
X-Received: by 2002:a05:6000:e0d:b0:37d:3def:2a82 with SMTP id ffacd0b85a97d-380611e48d8mr5890214f8f.36.1730439129020;
        Thu, 31 Oct 2024 22:32:09 -0700 (PDT)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d6852fdsm46960505e9.34.2024.10.31.22.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 22:32:08 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: broonie@kernel.org,
	konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 09/10] arm64: dts: qcom: qrb4210-rb2: add WSA audio playback support
Date: Fri,  1 Nov 2024 05:31:53 +0000
Message-ID: <20241101053154.497550-10-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101053154.497550-1-alexey.klimov@linaro.org>
References: <20241101053154.497550-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for audio playback via WCD937X/WSA881X. From DSP
and rxmacro the sound stream goes into AUX port of wcd codec.
wcd codec decodes digital audio into analog and outputs it to
single wsa amplifier hence only the mono configuration.

The audio playback is verified using the following commands:

amixer -c0 cset iface=MIXER,name='AUX_RDAC Switch' 1
amixer -c0 cset iface=MIXER,name='RX_RX2 Digital Volume' 80
amixer -c0 cset iface=MIXER,name='RX INT2_1 MIX1 INP0' 'RX2'
amixer -c0 cset iface=MIXER,name='RX_CODEC_DMA_RX_1 Audio Mixer MultiMedia1' 1
amixer -c0 cset iface=MIXER,name='RX_MACRO RX2 MUX' 'AIF2_PB'
amixer -c0 cset iface=MIXER,name='SpkrMono WSA_RDAC' 1
amixer -c0 cset iface=MIXER,name='LO Switch' 1

aplay -D hw:0,0 /usr/share/sounds/alsa/Front_Center.wav

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 76b9ae1b0ebc..b37b872f1a89 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -121,7 +121,9 @@ sound {
 		pinctrl-0 = <&lpi_i2s2_active>;
 		pinctrl-names = "default";
 		model = "Qualcomm-RB2-WSA8815-Speakers-DMIC0";
-		audio-routing = "MM_DL1", "MultiMedia1 Playback",
+		audio-routing = "IN3_AUX", "AUX_OUT",
+				"SpkrMono WSA_IN", "AUX",
+				"MM_DL1", "MultiMedia1 Playback",
 				"MM_DL2", "MultiMedia2 Playback";
 
 		mm1-dai-link {
@@ -163,6 +165,22 @@ codec {
 				sound-dai = <&lt9611_codec 0>;
 			};
 		};
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			cpu {
+				sound-dai = <&q6afedai RX_CODEC_DMA_RX_1>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&wsa881x>, <&wcd937x 0>, <&swr1 3>, <&rxmacro 1>;
+			};
+		};
 	};
 
 	wcd937x: codec {
-- 
2.45.2

