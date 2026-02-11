Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEA32F0C6A
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 02:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775362; cv=none; b=tcH1F3TbbgyadnKdyqHszDgghP5et5N+c8O54JBbwKH6VB7jsRj4cRGDA3V6sqSGjhkUR070AUMWgcJnwAJliDCYV2WiAPhzmwEopO56dENAp+jU+mGNDtBI24MdeRmewmu2ZS9O2lqZ2tjHSv/7Te6EvpX1zffNtJJRw5KCoeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775362; c=relaxed/simple;
	bh=xR/y7Hyddrcb+jajnVZbm9d2DBLyODaE0s37WmmwLnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QoN5V6A2pqub0/tGdZg5YBmxFF7bpW7IGKLwECw7D26Djk+3+bCgUVbiwKFG0SpCKUchdySpfz0LOzAJy+jJ2GZqra8NePLVcefSS8ns2VvU8WED+QWC8OdfnoFmQNMlrv6b8ieSLh+cvjnfokF4kQ8H8krQwy1Z+sZ4eiWtAH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXs2E65J; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXs2E65J"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-503354cb21aso44145631cf.2
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 18:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770775360; x=1771380160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CwB7WHiwTdv+oP9pKXzEf1IEdmHOUqyv08rivHB76s=;
        b=jXs2E65JTt95H2dVaAB118a1ivL737Je8R4ITBBtFZ6gdxyAxUywwvP54hyf7dXWvN
         VPlQaffkbLUmp966vXOhoyLOZlSTfKaiXfeWTG7fQewYJXBGWdkfxe7JBcy85nlPr5ee
         oEbDyyPRNtYFnetH4uhr/VNO7G2Gmoa83JIxLDFJcjOd+RVV7NYWzeDsAnN8/nQaQaZ3
         EDi4OIuwS+S2duFt6XBOcHR7QbKM32gjdtBvrp+rcrGyELmpks88tl/35bH27sd4InGu
         vOpMv0WjW8+gPZWmL/F7voqQz6tXg1eEChbIYu0GoiYIOXSvu69uKjNv3FM9G8dVR1ay
         990w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770775360; x=1771380160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3CwB7WHiwTdv+oP9pKXzEf1IEdmHOUqyv08rivHB76s=;
        b=qjQ342UwCnpkpFtMTsc2IYcU8jhPissjRFHh9WlBKOxxIko2CSpEkC9dy/Dmz5UIg8
         tdiYAkkUrQGIzPZgQCQr22ITHpHaTK0bsDLby2Ty8UbgRlBVDtPQlhYwnzOJ4I+VgkCs
         LGyFzrGDZAFc9e0i9Dt46nK5rB3DrNR2Gw48WG02L46xT3yia1uQ/D2W6VPJF1fkYyZm
         acHomyaj8bO1hWSppURFH/Ojj1czGUaLa+9aS+e09fBzGVtqyziaNsdYVzZ/E+btut0f
         romafii8PDUnJ0SyKmDe+/uyM07caOfcHawsDvjLYqlvGEroFE04c66d9BfhwIw7Uztw
         iwHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxBQ8GpLqQCTrqDEsBJSv3r4bMXODksyuOhDtFuq64ybKsI2e75nVomYpV/kxFltSJzxTXjOQA9LSkRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj7TIu1EboD0XCBBYqme7qtyV+qTwyrqPw1oiglr1fpP2oJDn1
	mhrW1l1vmkgrtm+ENAIAOHB5iii35/BkJcJubJ2Xw1+3S+9D8sKXINqM
X-Gm-Gg: AZuq6aKm6h2SQi3GjHDv8m8eapJFZuSvHkuLQYdIWiSbGF1PA9A6awM9HmEnCeNc+p6
	jMVajyrqn7zNrXp96w9vNGC7BkmtfIFTROD2Sek6/HeTYBUzU3ee6v4HT1y65WW+WPkQLFmefFI
	5ygQInEznaIH0xq19kucx3FjKmOFhmb0YTfnuMnv9BvcYExhhVz4fuKGwSrB/VPkTCQTTHAIT4U
	SgLo38dx0uQ1tM/BX/5req4oxkwrdIqT7KDHaTPCsu0x21S5c/y1IsXSLxKwotOviwO/22pSMKT
	f9eikhuMXH4HUQ16HJXkrF3Rg6azWQjkDcDOlSFWAeTcW6N/jimjdgpXb0Q9K2PaCj6UtF2elWQ
	gmPhvDVBDRJjELLpGmcM7WdO9oE0cM0Pi42snFpOai6agEkmyErsf6miRmvObHTmLbl6xtNyNmX
	xOZGHkUIQeI1+pLKifEGIAxXRck9FYAKy6zwQ33o4JcJClj/JdoWKFV5ZPH7UhtkKLQMsNE2k73
	1UQ4AmObNjQ7WA=
X-Received: by 2002:ac8:5a91:0:b0:505:e5ba:14ac with SMTP id d75a77b69052e-506812528famr17195711cf.72.1770775359798;
        Tue, 10 Feb 2026 18:02:39 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b1c7eb3sm10593385a.23.2026.02.10.18.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 18:02:39 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 02/10] ASoC: dt-bindings: qcom: q6dsp: add internal mi2s support
Date: Tue, 10 Feb 2026 21:02:54 -0500
Message-ID: <20260211020302.2674-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211020302.2674-1-mailingradian@gmail.com>
References: <20260211020302.2674-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The internal MI2S ports are found on devices with the internal sound
card for Snapdragon 660. Add support for them.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/sound/qcom,q6dsp-lpass-ports.yaml     |  5 ++++-
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 14 ++++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index 08c618e7e428..751913894dd4 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -126,13 +126,16 @@ patternProperties:
             reg:
               contains:
                 # MI2S DAI ID range PRIMARY_MI2S_RX - QUATERNARY_MI2S_TX and
-                # QUINARY_MI2S_RX - QUINARY_MI2S_TX
+                # QUINARY_MI2S_RX - QUINARY_MI2S_TX and
+                # INT0_MI2S_RX - INT6_MI2S_TX
                 items:
                   oneOf:
                     - minimum: 16
                       maximum: 23
                     - minimum: 127
                       maximum: 128
+                    - minimum: 137
+                      maximum: 150
         then:
           required:
             - qcom,sd-lines
diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 6d1ce7f5da51..6753f7bf004b 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -140,6 +140,20 @@
 #define DISPLAY_PORT_RX_6	134
 #define DISPLAY_PORT_RX_7	135
 #define USB_RX			136
+#define INT0_MI2S_RX		137
+#define INT0_MI2S_TX		138
+#define INT1_MI2S_RX		139
+#define INT1_MI2S_TX		140
+#define INT2_MI2S_RX		141
+#define INT2_MI2S_TX		142
+#define INT3_MI2S_RX		143
+#define INT3_MI2S_TX		144
+#define INT4_MI2S_RX		145
+#define INT4_MI2S_TX		146
+#define INT5_MI2S_RX		147
+#define INT5_MI2S_TX		148
+#define INT6_MI2S_RX		149
+#define INT6_MI2S_TX		150
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
-- 
2.53.0

