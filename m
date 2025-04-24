Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAA322F765
	for <linux-sound@vger.kernel.org>; Thu, 24 Apr 2025 10:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490335; cv=none; b=IHtXH6i0E1sQXtFp3mImBahgZ2xBBma9jcUKGhMv73D/dMy7GeWKo6OIstw4Hzuc0CAowcSYMQh8PoBAsz/CLM85fe3f2xRyDaggoTzSih/mOaXkYaalQTp70YFU6f1PqgpVaRRFIOwSjDV6LdCzJFNTsktaraBnxbDRjxGZCKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490335; c=relaxed/simple;
	bh=AlCqzDQhKXab0Q+3deb0PZcdtOSYBmwa2tfmkwAzIoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qQY2cTX9LO2h/oakk9HOwKNaFlbQnLPtUbtiuAEpBSL5YEZq2mSfFNieffUM3UXN7LnmJiU+Q6LkCB4fSLtPDAZK/qMLtFwZriRRVd1tcXq8la4Fyzq2+qV35ipFVfH3gJ0Jxxa0XbgM4df3vRyyAv48f2gh3+wmjY8lDkUtxE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KyYlE942; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KyYlE942"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22c3407a87aso13018815ad.3
        for <linux-sound@vger.kernel.org>; Thu, 24 Apr 2025 03:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490333; x=1746095133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOVuiI+8mSRH7O/02K1BDgrIMTx/XasOhwMXr41vKIE=;
        b=KyYlE9426zqbjnZj9SOQq6PvJisAaYgguFQmhsuuMUiRbFPdaWo7dv7cmZz5lm9ZMe
         I8BZ9biHtYRlTll9tZqHgKfnhMIFB+LOT3zx21MjiUM9D+sKElf4rkbm9G1+8f2dG3Gj
         +M7SLlHzyUXWkiJXWKpkhpIbsZG7MJ5EMs6+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490333; x=1746095133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOVuiI+8mSRH7O/02K1BDgrIMTx/XasOhwMXr41vKIE=;
        b=XXFx8qHOY/zmTKrxpY005kM1zaazurb4TiaERCxX+53mf6icL+pLjygj7j/s7M8DcV
         gCIDAZ/2RzxULYXskoOsSoxbynbWE/1fPgZL0moN81j3iVAYtFsgr2xBBfpcPG8GP2iF
         KsnQKhkUragZa7G/22WQgUoQnp397GNajtwdRiofB7obM9/7ssn7pUJs91vRbacrTjjg
         yXO1VAFvmnESZb8EekMFgSklQtxBXdBam3No7qLHZj7LvSgLFfbo1B+h0lCCqbMDUNHL
         uGFRG+W72ybrAHNqoowmY5lZU+i0R+fGzbuZ19PzdGAPaZlnXrlrjjBtfgp3hkMYUdxx
         FI/g==
X-Forwarded-Encrypted: i=1; AJvYcCVKbuDClVs1pOgQ4DWV7+ci90sV0SNsP1fueDXulH/IhaSw4cwu2cnIvcPA0R5tm78NkKgi8obH9v1AYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtjDBMpAOEa+zyx6QIiMPiBaUlssRuLpSdLToGUryWMaVk6o4r
	fUksgHWj+LNoSLqsTVcm6H+aFh0XDIPyYKB75j/xhKxPOfNCwdaRYtr/1QijEA==
X-Gm-Gg: ASbGnctMjvH42DRUpA0+grdh5NrxH//QTHrrTKU+0p8RD2Ojd0Zo9FI6KTBhbzoazXe
	OcIMMoYmYt6OgvumZwiSe39drKdcJ+EOrwQPvUaI0Dp4uSYkcrfVMAnNXhd3R6ydF6xFOc6PvuS
	0OVSBHBeGUxlX78Ha49o9kF4hO1ar7+92THtkK8Wh1AH7udX0hH4DkgGvJ2tZOCxu25DDZw5Tmd
	ptSadRUPRL+GWGfnqdc46NF2hOO5eTQeKs0Y0ylt3ugwbOcAQx+QTitlBrA6wrEBWvd+hHMu5DX
	DTICNnpvzDTsUiUU9DfQ+GkAKh+EvgWHm3IG9llfFqdImsNdGHKJ/LOPCw==
X-Google-Smtp-Source: AGHT+IGD0vIug8Nt9qcP/TU1PZMvFZmtESOf6amtEN+pO0sojtfEbRYqEQc7zpWOQxTNCIuHa8wc2g==
X-Received: by 2002:a17:903:24f:b0:220:e655:d77 with SMTP id d9443c01a7336-22db3db14ecmr31506645ad.36.1745490332983;
        Thu, 24 Apr 2025 03:25:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:32 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/13] ASoC: dt-bindings: mt8186-afe-pcm: Allow specifying reserved memory region
Date: Thu, 24 Apr 2025 18:24:58 +0800
Message-ID: <20250424102509.1083185-5-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is desirable to reserve memory for the audio frontend.

Allow the "memory-region" property, to be used to point to a reserved
memory region.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
index 7fe85b08f9df..f5af2cf18158 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
@@ -25,6 +25,10 @@ properties:
   reset-names:
     const: audiosys
 
+  memory-region:
+    description: memory region for audio DMA buffers
+    maxItems: 1
+
   mediatek,apmixedsys:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of the mediatek apmixedsys controller
@@ -170,6 +174,7 @@ examples:
                       "top_apll12_div_tdm",
                       "top_mux_audio_h",
                       "top_clk26m_clk";
+        memory-region = <&afe_dma_mem>;
     };
 
 ...
-- 
2.49.0.805.g082f7c87e0-goog

