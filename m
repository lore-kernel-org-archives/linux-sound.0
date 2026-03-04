Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64F733D6F9
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 19:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772654290; cv=none; b=F1Pauhp1JoRDIuV5EffrUCBgu9OwBsdRqdfOb3jq+020Q5PVLlfsASCv9HoaedxmsGitYaEN+iHyvnzbW6Ssr0/J6C5UWUJItefUnwz1KHxEYx6v2K57/B8x1zOOfkij+VafZqKM+eMCgskO+jWQnPv+oxZCNU85jJa+OZ3tea8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772654290; c=relaxed/simple;
	bh=xR/y7Hyddrcb+jajnVZbm9d2DBLyODaE0s37WmmwLnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W+O/EbFU2tKGWT0CAzoOwe1kWD1bfCb8eotDGjm7GpcoM2ggHLv9HaNc6lrJ5LmGyHUTyYreLLbt7b6gYrY+7tutvfvGK0M9+wK1tvokjdNCiFNH/ivkGifRrP3whTUy7gUZtV8hgKo01EOfm1S+asBeF+Fo1Qbxykmnptlnikw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1JnFAuH; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1JnFAuH"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-506a3400f30so62731951cf.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 11:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772654289; x=1773259089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CwB7WHiwTdv+oP9pKXzEf1IEdmHOUqyv08rivHB76s=;
        b=l1JnFAuHWS5v4w2NtUtAkqNRlhHdPVx6PwehyKMogcPBk5HtjnumWEvMLzIK5Wt59G
         kXURJqXX/Yt81r/stXC96rvPYdgCCTEzm21IA4AYd5CPaiClhPWfQYlJF+tZOn7c/ubr
         qBacl5/3WuqglD0QK4PZT/0jkFINLGkhU1URdUctWbyMYIgUjSgWGMwLC3hY6KK3KMs9
         nZoCUPqyKOXIcUFziuwg0niLazPrtIV093jWEn8Xhuxlni7L4a3d5BzXeXD30JXctmX+
         PaoncawvlS4oAygl+Q3IEtaUKMdmgG4/F9WQA/1k6R3+LYxRXduFiET7/qdH7hI5vNxd
         JebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772654289; x=1773259089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3CwB7WHiwTdv+oP9pKXzEf1IEdmHOUqyv08rivHB76s=;
        b=R/SZSe5NB2UVVKpVTFGE9ywojxW85y1HSFDzOee7kt11NzOxPY+Ymu+b2xav7+hx6+
         50sZ9eIq+fsg946BYxf1rZpVxrwzmr7n44IKGVKOPVNbuUtMyOadMFusBFZ7slKb/G9z
         eohc6vT8HNwoBZzCRelaLwUH13+iA5pvrstTdHZHcTCuetaoDDDx0F8RdzO0VMlJGe1A
         dJs9XIEnWiMAbxp5/C3J99msEDn7d8pVw1KGx+eDiSJF47hEoL0YTJInQIqGuF7UyuPC
         Ry4JoIa9yQZqhpHxMCGEHmJwm1t5K9FnAcqa9i01w43ej22kpgIpI8GLNu3L64cwz+Mg
         PbUg==
X-Forwarded-Encrypted: i=1; AJvYcCUKzDEG3ZjtVXsk9RihI7x5SxSDi8eNdD33dC9aXsQDhUoesAHzF0VgkNGP+ccHqpkucS6nS5hexN0BdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ+gGPXFUYDPUyYWDtDnSA1I6iakAQxy5awLfppVlOEsAad0iK
	iFCCH5UL2m0NZiVj/K3gF2ztHmlsNJ10doTXLafYD8ylKwnRoH7JjsHh
X-Gm-Gg: ATEYQzy20ori+VAshyS54Mr51qeiOxo2hJh3zE0JKf1PtaYFrnun4yv6aslqRw0Di9f
	0sCH/qMRL7UcU2Nb8Z6/XYPTSyQ5EkTEr/fTeXU5XrM/VaYNeBNJITrNPUP73GmityeSNG+IuKg
	Asx4AxSFv5L29By3uhpWMlkzzx9yITJSsPhLDWsK3cHL+/zz7QVDnROR8ly686FfIbQ3XGOdFWs
	x5NyFwZPGMfFTur+CeyQtfdxGI8IiX5caqqwCS9mmHaHsVQG+b4iI5gk0Ks0PVKop8MK3nWTHCD
	qiNGQcxsrgeHAvfGncOnUMhhth8iMadr0Mqbb23lpRlq4PtQhR5OCgzPBl9aGvKlbV7gfZ5URJK
	p3EAyg2QuJtxBxZu9omzbGA1i2TtKZRmc2i7CRS6Q7mSqkmk6StDYq54PtEfaY0/dImELKUypI4
	nEDfTcMqMAbijr1wAS+YkP/KMcXQ==
X-Received: by 2002:ac8:7fc6:0:b0:501:7d6c:2d4e with SMTP id d75a77b69052e-508ceb652d0mr84601891cf.42.1772654288623;
        Wed, 04 Mar 2026 11:58:08 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899e53a0d04sm107589146d6.1.2026.03.04.11.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:58:08 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 02/11] ASoC: dt-bindings: qcom: q6dsp: add internal mi2s support
Date: Wed,  4 Mar 2026 14:58:06 -0500
Message-ID: <20260304195815.52347-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304195815.52347-1-mailingradian@gmail.com>
References: <20260304195815.52347-1-mailingradian@gmail.com>
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

