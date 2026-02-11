Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0FF2F0C62
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 02:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775376; cv=none; b=dzfT0sd5bXWgaQFPffWXlg3q7vk1HCnBFBoAy4A/IYX4wSuNEA3D7e7QgYrEtqit2bonvt29F6+rLv4d3yTCR0D7rn18RgU8X4m2Go32gx6aYkkBkRK6gGDew0IRTShGKSjErid+i2TVgwJkNI0AkhPVNdER4q0A2PiGNTsHbmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775376; c=relaxed/simple;
	bh=h0ABrlF6gXld0vBhklJE1jW9snkjCyGzWm+4OIIUAdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kCaQZiE2bS8LsxQuLd2GXFIHCafGoxy50mtxJMoIBz0cWNt8cIrX7u5TmLsZsARmmjPtzwaZ7gLYhf1melSYBEygpwdQZt0B9Oy53UpI99xPPEDEYowaCMEpWgTe5wDk+hqNL94ogluiNfil9VaAVXp/Fy3EVQh83nhcotmP58s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxSQoqiJ; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxSQoqiJ"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8947ddce09fso17512136d6.3
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 18:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770775374; x=1771380174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTZ5v6TZwH0D3KMaa2Z1A6g64aCTgmwvmVrwpuBxytU=;
        b=BxSQoqiJbFrLWuQQ2513t7tkKGHrxADcJpGDb6G52NANFFAwZlqBj/JydHHKPQxO+4
         T288yuLRTAtnKtLTqWUTWvwehfIlklCiG6pIvz/L7tDu2q/LddZFaDt+2kHe7cCQFDqt
         lw0Fvokz+b7O1MbcLNZj6Fybvj6fZkFdVzEbty6FB1hYKxApUPUYCP3wl8TyXvTYBSsJ
         U20cQzFGLJVJBop8qt6n8OAyJXqQHCJHPvSGE168PHAMkPG362Rr4m+gfrGYmiQRoq/y
         qpVILU0NLZFjMFhOOZIR/zkhRvpRKrVtaTS5wZQOJ9TWQhucncjFTSlJf9TmU7oK4D5c
         ztZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770775374; x=1771380174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YTZ5v6TZwH0D3KMaa2Z1A6g64aCTgmwvmVrwpuBxytU=;
        b=IHRZ/jTe8KYCO+hHqAXWJflzq5/nxGJBDkklX7wQmkzvHEq3IL9dr3idyBAto081lp
         Ap3Vv7FZkZ+M+emOollviwjC4pyeBWCHnywUlh0cDzSi7g2nvuTpl9CJX2a7z6GqA2T7
         +vr/R4/FiO6krhLYFFjapV1/CSDaTHu/70HrlAhMHicOBXP+YaaiCiq+mV43H+nv+DOg
         vdtajzE81oKDLWXNgeSu2GvpLMktBSj1TZuRwe7y4V81LHpwbYe7SyPlpa8rl2Y9kle6
         +6XoZPpGIWxfu/UFDFNBgOmzdKcavAOqazyo4YhkHL3x9W4yrt+7zgw4hunvev3k7JPr
         XLNg==
X-Forwarded-Encrypted: i=1; AJvYcCUTIt69Giy6qaEgqmLFLWdBDudVQ0l+wzLGWl+YnYsRPrcBN0OUFxDxnbaFb+P2p7lhj5w6P2+qXUBDAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyO/XRBJD3UV8aMV2ai4D+49EUXK7qfWG1opinx6WqvLem3xKPd
	fmqTgregHlzs3qgT/7XhUdV7KEarLPmEUU0yDz/tlafonD9V8igkhq9u
X-Gm-Gg: AZuq6aLPyFmK0kqZcOSY3HZmeUua7d9o1a1h0f5459PaREwXZGTllz2SiR+vV1YmUWc
	kQZ1AItxXiZZ8VBGCz4mWv+ogGcUQ8ggdyWMOiizNJ06AwtnnaSQTd40CM48LM5gk3hOEYv+jsQ
	YOY6MDvcTEAjzcAQVOQZsI1zLizTHyZ5XrT/LIwXFA6X9ky6isT/2c88bAM0p5TlHkKOPNm1MCQ
	LEKEO5ToqSh87SxPLLnlGlcfwVeSlNPQDRezEM38gzk5CU5HuN1QznGvydm9T4VWNnO9UATyN5G
	XKdDQQxHt1saeOaXujFfjsbVRfBtKWgCK3KbIgnndaQnVjLZb0tr0buuwFDL4/cSt+LODhPU8nj
	tInUTHhSFTOpdrrJDBr61Q9J/JnrJWClLoHr6+Vc0xzZIX4Gws9wyrevhasKtd8d3pSF7MnHDqS
	YqQCMvzWDEPbb1nJyen3HQIjRr1A==
X-Received: by 2002:a05:6214:c2a:b0:88a:2500:7d45 with SMTP id 6a1803df08f44-8953d09f207mr278373536d6.46.1770775374245;
        Tue, 10 Feb 2026 18:02:54 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cc94dffsm3676866d6.14.2026.02.10.18.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 18:02:53 -0800 (PST)
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
Subject: [PATCH 04/10] ASoC: dt-bindings: msm8916-digital-codec: Add SDM660 compatible
Date: Tue, 10 Feb 2026 21:02:56 -0500
Message-ID: <20260211020302.2674-5-mailingradian@gmail.com>
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

The MSM8916 digital codec is also found on SDM660, typically connected to
the SDM660 internal sound card. Provide a space
for specific compatibles and add the compatible for SDM660.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
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

