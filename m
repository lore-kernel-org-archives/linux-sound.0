Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB94D49F115
	for <linux-sound@vger.kernel.org>; Sat,  3 Oct 2026 17:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050231; cv=none; b=kwl8PLkcNouW5EVWkREO9Y6DeTllBh52B8yCKRytsqmhdC7LCEgOICsgVgqcxXXg7ihKTJyWn+l2U3aU9Je2Rfmys9gvnSxntifAHy/YfDZvjTvaA7W5V7qjFO91XtpPWYTMoP5R5ouLu7wtPHP8NI5BzRSAN20Iiela2XtC1JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050231; c=relaxed/simple;
	bh=E3tyehOB9W9Nl5Yzv6CfUNAfqt/mgkcRmqeKsC2PjQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fnDmtkUGB1HQdkOJw0RLIJFX/DIANZ4CtFwoIssJmKGiqEtnD6LILm7ZBhKDuwXyweVDS8oSQp0qFp/tryRYiTKgVvIf09rApyhg4S6VdFVabC4RRJS7o/XgOreLsCQOOFK/mCBuTFbCYJbmHlDR6cvdENylshtNsw4Q9Aao1Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kEZGQzCT; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kEZGQzCT"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93e635220caso1017585a.3
        for <linux-sound@vger.kernel.org>; Sat, 03 Oct 2026 10:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050227; x=1791655027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vL3sTY3IXitdlnsmUfvR9Xp3a/Fbw5FtYRtALDNoULo=;
        b=kEZGQzCTESpYFJNvGfSXIZ/wqWtxmC/VgLMeAN4s9F2TQIEacrwlkc1rxANW3aU7W7
         bcO5wEz74ImnfjtCOhlElEy9QDyATLOP0H4YR3cUSz1zaCx3nnEcT9WALApMfvE2XevM
         6Zqe3bX1ogA0ppM1s0FkpwT7R4KHoTN1zCSewGrtGBuPK/1OCl13zgus3brDiiY7Duct
         koNLDlmbk6idk2lGnXol8gIKuDxdbb9347pQx3KWowt3WmKtOUVhUCn5WHnIisp3z5th
         L9CTKhvliu4CF3FY8XFnDX+PNkWA/eQJ/I73RZgQ+u144RiVa150qjrtV8Sv1Tt0TZ1m
         q7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050227; x=1791655027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vL3sTY3IXitdlnsmUfvR9Xp3a/Fbw5FtYRtALDNoULo=;
        b=cBQenbWETjx/NQOmCmShW1+gk2dAEKBaCv9aaHWhjHDc24rOY9GDLswoE9EkkZMFpi
         8SfJ922aq8w6BtWS5HMoxLGad2LfC6vAs0RKIrYzdhXRz6sLM9yufK4JHlZMc6xz1O0y
         MAdmQgaQu4DY2NOZMuvG82alB8MNK4wy0h27VAtrFD62DlYPAw281gWatu9J4JGA2Jah
         QxVwez1qw0aUOS8DO0dHar5PnKRFyVZprQM0PI3+f/d9AX3kUl2S3dU93j0ndyK2c4Ad
         Y2mAY9/+48WZUsmLlBq3L1AYBwxqq61om2GjbhOndnvHK69WlYRooQZXDtdSrCPML03a
         JBaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfWjWc432YFirtsq1bI/aUG0MM8oyGNye33Vn5q3ZUaS76H+uiL9SULqZDvJyVqYbP+D51cn7tEJ74SQ==@vger.kernel.org
X-Gm-Message-State: AFuF++n1kQdzKrxz40GVcIsDYlzeiz8PcV2zunASv0s8CuXYwbDbN5Eq
	DBv9C/HnymUicxFN2H+DcO8ZBrM91Je7ooWNplinwyVtKZgmdsGncoL1
X-Gm-Gg: AYBFou3Vixay6k5HsdbpCMeIuiILw5mzQtLB+pdKMw0EZcav4oJg0+O4sGvcQa3uwVC
	fnbe+WX/I7aOIKYc8eUwWElL5dRRUYSQdH/X1EIIN1U0I1hZJrYzg7C70HwyeNf7zXuBFqhMdjW
	MMNAlVsHFVDCUiQgvLqfdvBH3m8JWFhDphdUuc4OoLvNCfPQQudIrds1ehxeKdaF/w5zM9UvNEu
	ygfRUiEPm9bP3OHj9LcNH8VgHFbeIk7e7l27VFEn1rg+avn3LUeKtpc12neOZo4kI5LzyedNEPC
	beg6sUJTtxzayzCjTT2lzcQmR/5mxmLDO2RAYGBYCv/S2LwhmTiMV7x4jQbN4TUAaosCn0muOUr
	V5Dw7bnEjgnfIhFVGJ+IuIWexlwvoQ7bHlwIpA4D5Q2KjtCYOez/+Hzv+YGDCBqPZ7M2jazJ3r0
	W+3A3QeQoENf3aui7NlPd2v1YCfVX8ayKbhEPs6w5nVUuH2JZQDf8YJ4wPN6H8gb1PEZugDHLeR
	Q==
X-Received: by 2002:a05:620a:28c6:b0:939:13a7:70f0 with SMTP id af79cd13be357-93e50e08351mr557059385a.5.1791050227622;
        Sat, 03 Oct 2026 10:57:07 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e4e5b8c55sm283382485a.16.2026.10.03.10.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:07 -0700 (PDT)
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
Subject: [PATCH v2 03/11] dt-bindings: soc: qcom: aoss: Add compatible for SDM670
Date: Sat,  3 Oct 2026 13:56:51 -0400
Message-ID: <20261003175659.23536-4-mailingradian@gmail.com>
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

Document the compatible for SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index d2ae2ae87a95..6672f441c20a 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -43,6 +43,7 @@ properties:
           - qcom,sc8180x-aoss-qmp
           - qcom,sc8280xp-aoss-qmp
           - qcom,sdx75-aoss-qmp
+          - qcom,sdm670-aoss-qmp
           - qcom,sdm845-aoss-qmp
           - qcom,sm6350-aoss-qmp
           - qcom,sm7150-aoss-qmp
-- 
2.56.0

