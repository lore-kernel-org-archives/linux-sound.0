Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5444A49DBB6
	for <linux-sound@vger.kernel.org>; Sat,  3 Oct 2026 17:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050227; cv=none; b=pC88Kz3tlEOB1wFTzH3kjGnBzPhX0bmNa0rhMB+XAsoL9n4Agw6ogQVWZl9zVoknSS4bR4ogHCi/jCyhou1smX9YjxmhfPr8rtlai/SVj9SMysbX6CYsTUC/vVcgVo5u6t/5xB1RXZxran/jsPFBHRvg4c2wrY3lDoFJF6XO41k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050227; c=relaxed/simple;
	bh=oAVOptHgaHYJzEuPIUaZrEgs391cInOfG4C/drncIwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TPTcoLQ+gHDzCHTqDRpOoAOOrs8qHpwa7BXPvYp7oijWM777XJL7EQ5j2I+1s5qqQQFbwgin5Ir2Hhd5qbsiD4UgBfFHXO6ULIQVZj268BNG8576Lo8cyjr9/FALhiB4xUJ1EqZGxb/rDTmfYEDX7ZbgUmQXqrXJeeKEcfRL74w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKtpTJik; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKtpTJik"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53397554beaso5879961cf.3
        for <linux-sound@vger.kernel.org>; Sat, 03 Oct 2026 10:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050224; x=1791655024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6go1USvOBSIXKpmuAnNG1AZzXz6zYvVdjETf+wNZy/I=;
        b=mKtpTJiktUBc0mx5QzWhphZ+vVetoYebj7DoWo/I6rEEY522kwGxP7mSjmII+flx5F
         WyYSNF+Y5VNYU7YNVSjUsraNGEP06vP87xQreacrEUcJaD/+P6y2oC6TrF41d0q7ug5b
         iJW+CM13321Sehhc1N0oYthJG5TygZ2yyIxSQMLNFdcAriLHhwTeUX58ubxb+bR5gqPK
         wvUc3HFGHJo5/hT9lgbCSq9+mCb2kZFh41Th35Xx3olq3uNjp7KIgE8HrHbaSgwedct/
         Zu7YJisSuD4A3UlM66fz04ruAYzDmXKVwL6oGHCtjucjS1dKtTztvuQ2CgHLvkz+V8KB
         wnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050224; x=1791655024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6go1USvOBSIXKpmuAnNG1AZzXz6zYvVdjETf+wNZy/I=;
        b=K/8V75b40aOvcMqKQ+IpMt2fe27mWkvSD9pEpwzlg78AamWFz2FHkA67hzdijdz5BE
         7MGjYoGjLeRdUEgCbnoM4HnSJz+cf728O68auKM0z/w1ndQGLBdtENs8obVHkok6bkra
         iP482e4W0+nm/7+MOn6h/k3TvIT2VfkiHRw6OUZsitbikbm+V/EeoVc/faLfF7qOMB5n
         jeVIPVudPmDha2GRA5/oQfbVZBrkOQdpnNB19BZg7F8s8RLP3RayxnwtRHlAvTl6DPYt
         e9wgoG8rnlHKeR+Fsa5yM9i0ZHT52B7i0S2o8mjfM44Upby5JPun5Y2kDT+vVKpAv4NL
         cGhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwa/lccUIBqjsjC470kC61bLCCRpjY7z5Ad7wDMExMivNUcNzezglu+KN6dMFwIjMMiz4guctmOSWLP0g==@vger.kernel.org
X-Gm-Message-State: AFuF++mLfUOvBY4MOuUl2wixd+arg3RLEtvUDnAN2RUO0XM0kbpo0gqR
	IKxqTkg25c9K31/HJD50skTgQ2Su2escVn5zjQsTWt4Fu8nLoNc6mD+d
X-Gm-Gg: AYBFou3q3p55iI3kKnGGIF7r7vZMKnFSm626KGxNlXBxTeGlJRsk3+GC+lYpfT+hCbZ
	Aa3XfMdBRgBHkfxMFCYuRs7BE/sSGvQUQgmtSTVk42yXGbOcVs8dDoxnmhT3lpfDfBTysowIO/Y
	uH2gCZFHwWGqRuN8jzErcjyaTGRblUSOdnjzbFBG4KiuGMzmW8lB64MTxMJDd/783l+R442uHih
	PPcUMTRftPwBCEfRVz3/vDsxDs2GufRDNCOMZ5Nhhe/ilJe4QC4Tsa585ahPwQ1GxYBugkv+XKj
	tZuMossRoQ+Elv58edkqCaR6iQXrY/76YwMJKaEPYv+672y/NdA2LedCPZQyO9uob9fPE3GZ0uc
	77ZVEObZz0SMZs3R/V6yQTSrz11hJyoLj0zvrDgI4fuok/FKIoqOHnGagVnHbUbHbdMc8Jk3BwX
	kT686yuiWCk3nAzJEpTeZY/Ef7VhLvErdFZ/5lpTr6ZCkpoJrbg0aAn0s+ZD1sS0E+U/Br7sAjb
	W3j0aAyc2VOoA==
X-Received: by 2002:ac8:5cc1:0:b0:533:3d83:c20c with SMTP id d75a77b69052e-53511e44037mr55541301cf.23.1791050224165;
        Sat, 03 Oct 2026 10:57:04 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398d59747sm57605361cf.31.2026.10.03.10.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:03 -0700 (PDT)
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
Subject: [PATCH v2 01/11] dt-bindings: soc: qcom,smp2p: add sleepstate support
Date: Sat,  3 Oct 2026 13:56:49 -0400
Message-ID: <20261003175659.23536-2-mailingradian@gmail.com>
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

The sleepstate entry is used by Qualcomm sensor DSPs to control
suspend/resume operations. Even though there is no full support for
sleep states, initialization of the entry is still necessary for some
DSPs, notably the sensors-bearing ADSP on the Pixel 3a (SDM670 SoC).
Allow sleepstates to be declared in the device tree so they can be
initialized.

Link: https://android.googlesource.com/kernel/msm/+/91edfe5385f2640a338e2ad230d0fc03c73b77f8/drivers/soc/qcom/smp2p_sleepstate.c
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
index f91276822858..7862d68c9678 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml
@@ -60,7 +60,7 @@ properties:
       Two identifiers of the inbound and outbound smem items used for this edge.
 
 patternProperties:
-  "^master-kernel|slave-kernel|ipa-ap-to-modem|ipa-modem-to-ap|wlan-ap-to-wpss|wlan-wpss-to-ap$":
+  "^master-kernel|slave-kernel|ipa-ap-to-modem|ipa-modem-to-ap|sleepstate|wlan-ap-to-wpss|wlan-wpss-to-ap$":
     type: object
     description:
       Each SMP2P pair contain a set of inbound and outbound entries, these are
-- 
2.56.0

