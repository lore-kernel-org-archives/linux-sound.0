Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFE544C94
	for <linux-sound@vger.kernel.org>; Wed,  2 Oct 2024 02:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727835636; cv=none; b=e2MdB8Au/uEFz4bB4qwvAZqmWo8aS0Ln9NNR133dYa2ufqIEYJPtWWKVtWrOpkBBTByQGF7j+blO9WZfnk0Lzlueyfl7Jav3IsIACkXPo2NvRWgPK7RsjWL12TDqfyq6dwW6UleJl4+1Nn3yHthG1n0alO7V2lInh3yvd1M+N/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727835636; c=relaxed/simple;
	bh=VK3mA+AhP1mrvIRSe3pu3j8qw4QKvKCuPM781iHQdpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R1Udn2MUh96v9LLtEDujUrfi1LFBMM/J9QtBKy6SKApxGKQeW3OI2chdYt0Aulo9GXc8sWuNeBDS3JasYRpIiTp43daDVwV581dF47C4KAceRTU8izSP/s1L3g56znMEOwTHdXGS2IQRRa71Q0D8EZ1LihSHxYK9p29itxRtrZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tMYFWKyw; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tMYFWKyw"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a8a789c4fc5so66674866b.0
        for <linux-sound@vger.kernel.org>; Tue, 01 Oct 2024 19:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727835633; x=1728440433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzwSX8KKGAPRaj5lljRiy6wNpS+zMVuqbW0wkWepzfk=;
        b=tMYFWKyw5wmya+LnJOsoHqAh/vcol7XpGytOcGhF/s1j4yUtRsjaCbGuRaPVEWCivD
         5BgHg17UfBpvyvm9bJ8Ca4EhYx4YyRSxztLl5EOMyDHWb9QXd4zjwvO2Crm5XLBj+JTZ
         FWCvD0m9g4Oa5RZ0tegH+xQXYJje2eLYNF8Hn9AjxTQntGIQ5ykNsVMkJN2I+2QbBQPy
         dY8pb20DEp6FxPLCKYJ+5hFHmoqKXtaskrFx15Tq39arzGAbD+zfm/tErz2OifCdOs+d
         olkQsQ89SYKOwLnpX/f9gns1XK4adRHQ4LmCdkorAfmyEpZlFTtwKBuEeD8qWkV8I2MK
         lGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727835633; x=1728440433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzwSX8KKGAPRaj5lljRiy6wNpS+zMVuqbW0wkWepzfk=;
        b=uHU5EnMepDb/eM2j61l+umF3j8kybeDrJQGthiYBshM1xzUocpaIRw91aUeSm2QSGH
         mzP/SGPr28FvjfbL87Uz4PfzAUYq/6Zkfb2I99W/ETlTfo5/v5wSeUsyi2zgTlyNmjqB
         oWfWk36doa5dxFI2y2T8hzp+6C1UNI/6WeFMXUJyYDPcLuV0zyhne6r0Dmocr4HOg0HL
         0lhawKCndX630hbnMYVbVUDcpUw5Y8Ucg2t9w7ofLbi4zzb9vsafsRmfkjKuBwfpMnX/
         zPlv6kdq/pAxkGZxSm11duO1vwRXsGGE2Bzx87ApoVOWUa4HfrDjhsHuOSL0WaBXRBLL
         dVZA==
X-Gm-Message-State: AOJu0Yx2RRLa4O8nRv4MjSQiX/PsTceFrBgMo2RnVjTmynNo2ECcTyzw
	/KOSKLS1lF25FnULIubheHaYI4a83FPKVjTHmcbc30UBNwZP6yuW1QmtI5IobD1Klqv8NPpVdZK
	8Sig=
X-Google-Smtp-Source: AGHT+IGZ5ivi7b3Y/1bXAvJ8gbbuRZ08q/qwpCO5zK4rpaNumj2OK1NNdOIgEbMH7T44U5eW8iMtBQ==
X-Received: by 2002:a17:907:3ea8:b0:a8d:2bc7:6331 with SMTP id a640c23a62f3a-a967c0b46bemr535600666b.27.1727835632904;
        Tue, 01 Oct 2024 19:20:32 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2945f2esm787518866b.117.2024.10.01.19.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 19:20:31 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	elder@linaro.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	linux-kernel@vger.kernel.org,
	a39.skl@gmail.com,
	alexey.klimov@linaro.org
Subject: [PATCH v2 6/7] arm64: dts: qcom: qrb4210-rb2: add description of lpi_i2s2 pins
Date: Wed,  2 Oct 2024 03:20:14 +0100
Message-ID: <20241002022015.867031-7-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002022015.867031-1-alexey.klimov@linaro.org>
References: <20241002022015.867031-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is required to enable to HDMI audio playback on
QRB4210 RB2 board.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 36 ++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 1888d99d398b..7731681688d5 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -634,6 +634,42 @@ sdc2_card_det_n: sd-card-det-n-state {
 	};
 };
 
+&lpass_tlmm {
+	lpi_i2s2_active: lpi-i2s2-active-state {
+		sck-pin {
+			pins = "gpio10";
+			function = "i2s2_clk";
+			bias-disable;
+			drive-strength = <8>;
+			output-high;
+		};
+
+		ws-pins {
+			pins = "gpio11";
+			function = "i2s2_ws";
+			bias-disable;
+			drive-strength = <8>;
+			output-high;
+		};
+
+		data-pins {
+			pins = "gpio12";
+			function = "i2s2_data";
+			bias-disable;
+			drive-strength = <8>;
+			output-high;
+		};
+
+		ext-mclk1 {
+			pins = "gpio18";
+			function = "ext_mclk1_a";
+			bias-disable;
+			drive-strength = <16>;
+			output-high;
+		};
+	};
+};
+
 &uart3 {
 	interrupts-extended = <&intc GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
 			      <&tlmm 11 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.45.2

