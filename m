Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672E0358387
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 19:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772654314; cv=none; b=neqCEUXerSVYvz7HYZ9cZcTefcRiPCptD2PyylaScMyQLaoKZk6q9SImI9oqc9A2Jy1SKUchp5vC269iKx4ksqFKrn3F1bMqf9EzMSzS0eoHIlDyrFbBiAwN1r4bTkGkz+IrjPKiunQxxqcaSVRaABJv0JcGIyHE7L/6f7kCBmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772654314; c=relaxed/simple;
	bh=lR1IVDRMJkZXoDslp4/dph1T2GakLoRbrBddRQrqVXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hjgmiNhLWF+I7yceO46YIKlvc/Cj/1EDJ0Fo45INrBNBRcSkTMzq1b7qJVBSrfE4nALPoxpy0B021ChsYsZB32BVk3QXozbGEcfgGH2O78qTbmYRm3nv22ufMDmwOICfW3Rhbf1HzqNbzfL55hyOsNnjpl98MhFOLFA5Rz8+63A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdnBhTxP; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdnBhTxP"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cb49f63238so402967785a.0
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 11:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772654312; x=1773259112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnPc8TBTfWgiuHY5fV7Z5G19bPt1vmYlz98f9MexdKc=;
        b=cdnBhTxPCJBXnwuCRxUefZS95lD/mleI3WbAJWQWAe9GYoccK5AWzhtdYXvxH7bqpz
         L69EXRMPuA8XjVUSV7GpuiCwAP69cgBwnJx27Fok7aoHspSCekeydoficMZZNv7Sllvz
         gC6IdSOvv9JbjNd2Z4xHCJ35gkqkuWSdkCE0t1662eIDz/zqPUaI6oe4e7uSak4u2csA
         TpjKoVqAEcaRMVJ3bv0k3FjeqgOWrV/eHAk5ZHIZGOZ4rrw7wJqXt14Fs4jSGYiMtoBg
         reWbiOZKNNxKdqhfMlFCZg8W1T0+YF1YThWriEU7eaj/kO3FdqZ6qecgQCPP+tMd4I5Y
         cDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772654312; x=1773259112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wnPc8TBTfWgiuHY5fV7Z5G19bPt1vmYlz98f9MexdKc=;
        b=X5DjhhFE7x2HCWx5223uvep+3YWGsalbVMRbrJLrKbxk7qxym+sNP8axBBb3BUPJvI
         UQ3BMUAkd8/V3z1ApWHrz4iCBOK+9wmdZbaTzvTjAPk4jWYSTQJge19NyUFsTmTrlJWs
         oOsFpLgtFQq0szAQbor4vrmcRdnlVM4ERG2s4JuOxyj1beAAXw+JAKes42sT7bVpYvcG
         XcBYa2L5kcjkmnK3nbuQ8INMYyhhdsFKREXUB6f7D5fG37dlm48ie0rvQxezC7LEFhWG
         /a7z0/nf2gRg5BMCfxTgN5kR/9b8uJcNtzHU1w7GrG/BlcVCFuWhkxrXfolUG6rlro1l
         YXbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwjGE2JKU6IkUYmkVJbaK9JOoGe8bVbQE/IrsYLgYk15QErgzwAhjSlqyr7hM93yfLgoWaLHe/mF9x+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTe5XRfVTH8XCy5k8fDXEkPnnk0Z8nNBaoknr+saKwdlW+m7Zc
	X7w3Kj/nIdr7xZ3YLHKjkmSx5tTyP19gkpYK4pac6Uh25+Td2dJiGZNp
X-Gm-Gg: ATEYQzzb+HLhvaodBsJzpSWBQAD51J/jW6Wu7G3v2Ybamc+sjm6G3KUFaRWeNfjHXB6
	MacQoqU/WoBY93E5ustitAob3Jilf+ID4QaMRpfWbmD7F9sVUW0RYAEPPNLatndzfiEYzeuBhCk
	aq+DBHE15liUw42jWo7bVXHyuD7vlwUclkElSH4LX1JrdCb8FlmQ2peeM/Iu0NmSU/1DUKqFqys
	q5gKkAW+GnMBBIy/R8GBBm+6bPr/Vr8MB+nxMlJn7A9S5mqn6AKEpO/gS66IvF5cHvxXyKosEb4
	rXdqGPfWjWtJkCnETFb3q85lNZ8H7SGC9+xW7zd4E6R0kTY7dGkv+cytayewkI0FJ5iPGuGs7Uq
	48zaYwsJq9vLbD2zJEE18mYLof/X81KvgHqoQ4MGkpN5V2/Ldu/wwSc/X8ceJtPcKY5qp+idn8M
	qHIOUSFyInIzGYpqAHZCrSHCXshw==
X-Received: by 2002:a05:622a:1647:b0:506:217e:b0e5 with SMTP id d75a77b69052e-508dae11dc3mr45067131cf.0.1772654312337;
        Wed, 04 Mar 2026 11:58:32 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6534f3sm1678845585a.5.2026.03.04.11.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:58:31 -0800 (PST)
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
Subject: [PATCH v2 04/11] ASoC: dt-bindings: msm8916-digital-codec: Add SDM660 compatible
Date: Wed,  4 Mar 2026 14:58:08 -0500
Message-ID: <20260304195815.52347-5-mailingradian@gmail.com>
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

The MSM8916 digital codec is also found on SDM660, typically connected to
the SDM660 internal sound card. Provide a space
for specific compatibles and add the compatible for SDM660.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/sound/qcom,msm8916-wcd-digital-codec.yaml    | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
index a899c4e7c1c9..33bc23b6176a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
@@ -14,7 +14,13 @@ description:
 
 properties:
   compatible:
-    const: qcom,msm8916-wcd-digital-codec
+    oneOf:
+      - items:
+          - enum:
+              - qcom,sdm660-wcd-digital-codec
+          - const: qcom,msm8916-wcd-digital-codec
+
+      - const: qcom,msm8916-wcd-digital-codec
 
   reg:
     maxItems: 1
-- 
2.53.0

