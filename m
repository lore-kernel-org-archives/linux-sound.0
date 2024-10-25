Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86A81F81A9
	for <linux-sound@vger.kernel.org>; Fri, 25 Oct 2024 10:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729853167; cv=none; b=F5VadM/mnIapV/w7+J8JB/uc+/PnZ1Mu1S2NQEHIf8M0tNp8VuSE8WJCsPx9XyifU4r3r3vpUpXzAVE3LYgxvD0YJ0CK3NyHTWZp7UONlg+i+H2whAtmjWAyWmPqpnCF4BJanlCwEZXvqigVjj+TheWf8HsLuoOJdHwiuhskTl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729853167; c=relaxed/simple;
	bh=J+g1Im0eNTXVrmX/47x2f2dXUENmYhSVLhNDAC3QZt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZxwM+LNTtxVKtKt8TxRHoZXLtw68nQ8jG1+8wuNWWdqyUokuShAm+Er2/FapmGHuCUPuNtZrtoIwaRdcYxIpMXDsy+pahgnDfTrk0M2V2UxmHXbxszDI0TnmHRk/0Di5MmbiLoIxcjjJy8a+q+b7IJTe7fsHcDjJgCD4w29yRqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Plfse1oj; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Plfse1oj"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7e6ed072cdaso1296218a12.0
        for <linux-sound@vger.kernel.org>; Fri, 25 Oct 2024 03:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729853165; x=1730457965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHjnlTjdt8BtFp7CiIXNRB6RKGW6gDEeynV8EXeDZt0=;
        b=Plfse1oj5vetJYzMFj0g8mhd8XWi3vUnO+uoaw/GREF561AVrvV8sUP5Bg9MBi52ui
         v5W6R05dxC7EJ0Fv1vR4BtdkRQBy75I4mCWluLQBytOpyYuUiSiU01ooCyQws4n38LFo
         AAXHh5ZDkJW0qHqOhKb5NqpLvugEpvqHwtyEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729853165; x=1730457965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHjnlTjdt8BtFp7CiIXNRB6RKGW6gDEeynV8EXeDZt0=;
        b=gOzxSGOSBMMb9xHt9SyXSblqKkeSsE5+7gKNgjFCSMQ9GTqHhoxflepCykhGc0MBz2
         NiEIMQnzCinrW8XpzL+NKgcOHlKZCeMxBeyctIXHKaVpf+IxGt2yCGpMdPc3O1XhVAX6
         h2fV2WMtnpYfVrWwHK+5JxNOuQmTBuhpgKfYynDzqxUY+xEc1v2OS6pLjB7RYIUD7kN3
         WsAN3uIRH/0zSoDhz+XVgUncNI5M2B+gRC8dfFIcQVhWe25wTwfBVi+diDZTAYtwz5dX
         1T/53scOZxcLBoQ9TKolScK2O5HXeoPwrPH3rOJDwEaQ9/1nw+4s1JBOeyP3DxPF4VkD
         xLkA==
X-Forwarded-Encrypted: i=1; AJvYcCVIbCDnoURg9++E5L/W1+nFYRLcnxpn+gVbi6kN1JAEbpeO85fx2uucLFSwVJTyqRn412anyixMATIdqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5xLEA8CzOEGGrPdDwe1sPxDvQeAAnNUFxCnx/KA8pOzh+klhB
	/u5USL62MwJV+XIc2ZGABSynL8OJ3wsoeKJJO8xILZv9DXXZxyg3kjaU8XhR4A==
X-Google-Smtp-Source: AGHT+IFS0h0JqPw1ebmNNkhQOl9Ys/JQ1lPG9I77D6EUM2T3OpCnZPEttx0nxdHn7SemMJj6wUzG/w==
X-Received: by 2002:a05:6a21:3a82:b0:1d2:f124:a1cb with SMTP id adf61e73a8af0-1d978aeacccmr9904743637.9.1729853165012;
        Fri, 25 Oct 2024 03:46:05 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:ebe1:dd63:343d:8a4c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0d089sm829548b3a.99.2024.10.25.03.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:46:04 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Trevor Wu <trevor.wu@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 2/4] ASoC: dt-bindings: mediatek,mt8188-mt6359: Update DAI link node pattern
Date: Fri, 25 Oct 2024 18:44:42 +0800
Message-ID: <20241025104548.1220076-3-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025104548.1220076-1-fshao@chromium.org>
References: <20241025104548.1220076-1-fshao@chromium.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The associated machine driver is not dependent on the format of DAI link
node names. This means we are allowed to use more descriptive names
instead of indices without impacting functionality.

Update the binding to accept arbitrary DAI link names with a "-dai-link"
suffix. This is the common pattern used by the target (MT8188) and other
(MT8195, MT8186 etc.) MediaTek-based Chromebooks.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 701cedfa38d2..2da34b66818f 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -40,7 +40,7 @@ properties:
       name defined in the machine driver.
 
 patternProperties:
-  "^dai-link-[0-9]+$":
+  ".*-dai-link$":
     type: object
     description:
       Container for dai-link level properties and CODEC sub-nodes.
@@ -112,7 +112,7 @@ examples:
             "Headphone", "Headphone L",
             "Headphone", "Headphone R",
             "AIN1", "Headset Mic";
-        dai-link-0 {
+        hdmi-dai-link {
             link-name = "ETDM3_OUT_BE";
             dai-format = "i2s";
             mediatek,clk-provider = "cpu";
-- 
2.47.0.163.g1226f6d8fa-goog

