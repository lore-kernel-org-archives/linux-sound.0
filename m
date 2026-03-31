Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FE438F941
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 19:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985946; cv=none; b=kifM1e3t8dAAivcgPiXipuU9Pf/Ar3XbfIgrkMzynDi8tKhjLtNJyhwkJqG2jIk/17XGpCIP/qZYVTZ21kYixpmfYUCNiF9T17/KxtSzFWOQi9zTEwE3Naqv3eQSJn/vlZwZbwWxqMsMYTQs9R/OieiSLXU0n1uD3Yzr6xinKrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985946; c=relaxed/simple;
	bh=huc+C2J5/ogSFYxxpwIAQP0C2iLi2Nk80fvhtK14SKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H9qnomF3yKcJtfe0x6kdMrYeOHCtKccnTJtBF04T2EMhSswnuoaB2Y6ypbRDLsLa78TFMc9VduJkU+DGkFZmP3+OxNquQ5iZIsgC9FqCG1donP8WsrXjqG+/IrqNSz1wAFdX2o3eMUfQg1b059qkym12OgQloHU0bIVa85t7jBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sfUatkp2; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sfUatkp2"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cb40149037so669066985a.2
        for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 12:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985944; x=1775590744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DMgcX8uhy5oeABb4B4dx47WI1aVkZ3HwLZ7cgpkUvM=;
        b=sfUatkp26WZhvIh99lLoXUC69K699gUeFo9Z7qSL1fOR8br1o8cmb1z8T3LEWs7Ue2
         GOgl7v0Ca3/+ZLzXlidhx3xF6W515XLlDUM4Se8J/tHcVhYVf1CMS2eyGgKHfIalHSNN
         QxOGvd54tIGgJkoKeIpQn4F0/gvcaqOWNl/5+1UZ2P8ruXnRXbb/nbkdMoN+rrsJQaHf
         lu0k9SwRkq4+1mO5aQCxJjMNzk3j6ts4Sseuz1KK3lawoUH3mwp+udCxlW7+Q66+cAJI
         50yLhS219yDkp7vQqwtL9gYG7N6Tcxo96YUZSA7ujvI2jiJruJWOWcwizwfsSASEweuc
         16fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985944; x=1775590744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2DMgcX8uhy5oeABb4B4dx47WI1aVkZ3HwLZ7cgpkUvM=;
        b=c//Q+b4++BgJDUF5xPcw27mgZs8mLaQ1uh04o29N0bTCcBFkjc7fl78sAnsK/yhe7V
         8g2nN0VPhMOqHDnpI3gSm/JvvAo4rjLOLS6842y2+Y80PfVPJzZKDRwOWRw/zoQZMzU/
         KqKFkEEKvZIKGKpaOTgcsSyvbXi3vJ54ke1MDImbzyEuX99IVpgqD1C4TVLu+R55IPmg
         yF0KdEJCHvqg5C3OwIqTeOLBAlP0lnQXRYv0AMJIdoyhvKg44dPoZoLgv/+lVP5FmEWi
         BG3F4T52km+SOEvQY/eMy2IsueZiT18WvJ3tqMg4vZNYMjYOZ+dGyKPC27WJKULRA8OJ
         1cVw==
X-Forwarded-Encrypted: i=1; AJvYcCX/gKtqmaz4fnmelocln9Zr2L+g2HKbMMzJ3s03vUZV6eoeGiuGJbK9onzZuNzMx89Nnm2BzuO87r/MCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCYc8ciwGm4wKG1voWT9kiAm3Pg1xwOWdezGfl/6RZCico6SF9
	+6y04p0T2ACbg3noH9NcumX/DH39/+isYb47DY+a1zbJ64e6ozokzgLD
X-Gm-Gg: ATEYQzyTcJYgkOhj94hVVs83RV8obrs8Gfq5LWPL389iFtoLkwGVvW5BMiJ3THcDYTH
	QC+UidhChw8mNJWtIf2+ShJ+9HQbIQIT1CKMeczWeTBE/QfEA8YRMwoeKDgGHN4C//ETAnjjlCK
	Mv1GoJ3VoBKlZZgQbe8HmUXy02CTEcxEteGoiUT32Verj7SgAsfYab1pUpc2sNsu0W88TvzEd5Y
	FwI9O6KdJHJwQNxQ4MeBiDDDOGJWLZonyCYbPGpsVWo+9aXS6vZA92uvS7FppIqiDZ9fNS92fEx
	82WLH56LgK6ntyFJn8MH72k8lz0kZ1k89uS1yCIkeLedVQXD33gqHLzsa9b8WEYFWlmv9XM+a8u
	v9bxT/mmDjFSZiocZ2TNc8nmBocyO77K0C41fq1MIZA+e9T4qbJ0y2u2t8F3uHm5n9y8loGMAxG
	utucJlP7HV5fcyu/V0AgRuzlvr
X-Received: by 2002:a05:620a:46a5:b0:8cf:d3f2:9f4f with SMTP id af79cd13be357-8d1b5c369fcmr151944585a.55.1774985943871;
        Tue, 31 Mar 2026 12:39:03 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ed02364e2sm98172316d6.45.2026.03.31.12.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:39:03 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 02/15] ASoC: dt-bindings: qcom: q6dsp: add internal mi2s support
Date: Tue, 31 Mar 2026 15:39:26 -0400
Message-ID: <20260331193939.40636-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331193939.40636-1-mailingradian@gmail.com>
References: <20260331193939.40636-1-mailingradian@gmail.com>
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
 .../bindings/sound/qcom,q6dsp-lpass-ports.yaml     |  4 ++--
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 14 ++++++++++++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index 2b27d6c8f58f..d8271f1d9a34 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -127,7 +127,7 @@ patternProperties:
               contains:
                 # MI2S DAI ID range PRIMARY_MI2S_RX - QUATERNARY_MI2S_TX and
                 # QUINARY_MI2S_RX - QUINARY_MI2S_TX and
-                # LPI_MI2S_RX_0 - SENARY_MI2S_TX
+                # LPI_MI2S_RX_0 - INT6_MI2S_TX
                 items:
                   oneOf:
                     - minimum: 16
@@ -135,7 +135,7 @@ patternProperties:
                     - minimum: 127
                       maximum: 128
                     - minimum: 137
-                      maximum: 148
+                      maximum: 162
         then:
           required:
             - qcom,sd-lines
diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 45850f2d4342..059f2ea1bd23 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -152,6 +152,20 @@
 #define LPI_MI2S_TX_4		146
 #define SENARY_MI2S_RX		147
 #define SENARY_MI2S_TX		148
+#define INT0_MI2S_RX		149
+#define INT0_MI2S_TX		150
+#define INT1_MI2S_RX		151
+#define INT1_MI2S_TX		152
+#define INT2_MI2S_RX		153
+#define INT2_MI2S_TX		154
+#define INT3_MI2S_RX		155
+#define INT3_MI2S_TX		156
+#define INT4_MI2S_RX		157
+#define INT4_MI2S_TX		158
+#define INT5_MI2S_RX		159
+#define INT5_MI2S_TX		160
+#define INT6_MI2S_RX		161
+#define INT6_MI2S_TX		162
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
-- 
2.53.0

