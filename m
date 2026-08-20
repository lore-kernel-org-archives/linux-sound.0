Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAA03AAF4F
	for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 06:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787207202; cv=none; b=VKgG5yrnyOtkZ8qIBUnzS4+RLUAg8t0YULsJc8fBk5D/JXcHxgSdyLHdOUqowwJVdwOcpncaQK8a2bnbb3uw+TN7Hp/Yk7c3q/yHf6k63WHaqLjaLbWHgwKn+TcSPw1RJVo/1/z95T8clyE+V2OgwL1pCjiE2pN/As3tiFPVNY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787207202; c=relaxed/simple;
	bh=A/JEzo4oku0tiBbjsBGAehAa5pJ0pwG0ReCbeYNLryg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pRzyUARgDhSM+Moy+nBvYwt2OC036M/FD8FeNy64S6HQABKAYlEkjTZ/3G4NJsUjCN5uBS6yeeqh37CkVjYhQrkqIU1grZhyDk5IUBDsI/NqgG89q5J7eEghmsl4BOfoYgbIKJ6TTbP7r5bIr+oCbHuYqUSNwf9VOi2Nf6pnR34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=X8XI9sOc; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="X8XI9sOc"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47fecbb7000so953878f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 19 Aug 2026 23:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1787207199; x=1787811999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qm7SmvZPsHEoC38JCT2btEmORYaih81ZkIr23Ib+H7c=;
        b=X8XI9sOcw1QdcAQKeCmby5tWDhM0h8ZKfEO0V0aRPlso5iknCYijaFzskh/XQMy9YG
         h6wPOTAH1JsUi/GiGdr0+39qI9SoeQWgiQfoILUIXuHfniqA9az/shPVpmO6AR9fz+nO
         jTQqp8wFoYCCwl4bfLmq3KkoygRspW0NBh9pOzniZ7spp9LJMqOqvTJyYE18n620UG44
         ywfkx//0eIVawNO78WUBzsF3RZExA9x76RoBGWNIHMRgbNtDPoV2fZ1cB/cER2kU+5Bk
         36w3CwN7rCp8CdKegngdTx3gMVWhS+XwUBbOJKjG57GK4HqZlpdBKeUeV+uAkJYkFfbo
         E0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787207199; x=1787811999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qm7SmvZPsHEoC38JCT2btEmORYaih81ZkIr23Ib+H7c=;
        b=LkBeV9fjr0D6h50JF+CfojkFS9SnjMfHrf7d7Y74OfAjjGXEuJ1zNSO13FhtX3+nXG
         UirL4pswKGNpnnt1gVp7gd9ELq7LFd0WM2mnp9QHHbWDXKVXxnJ3V/KJber6d+gUGhxj
         SMLmkr3kGZRZsG5SdOY+gDVLBrs9meXtksbljU5rxcKnT3BVifeRGuptdU9QaF1IyJ8j
         u40PsSgr2/H0+hEhNcDvVBia+fPLc9c8vfj04jtYJhefA3mLll40pGaVjWTyX0Iolvti
         kqoY/tHvj7KXiS2wp3+lqnFvo5873LmSA5AUDx8UMOI3aGvzdHzkHeOiTP/Hz+WmrmRp
         JrTA==
X-Gm-Message-State: AFuF++nX3x+OdEkynmmWYoeHhy7t4nj+CiDxoQzJ3DQM2GHUqqQVHDuA
	/U+Nb7HjcuwLQKeow7ryjg6hGAwRUXeTyYtHCEru3BQAqZBtL6fQXC0OozqREkIm5FY=
X-Gm-Gg: AR+sD12QeJcI4yZ8bFjMvgHmneu6FbPxyRsGJFMXi9XPdktpUFa8mwAea8j2KMUX+V8
	n0gBh/c5AZxbOWfl9iAWmFeUsdogEuGa71GFMRF0dEJxEAL2F1U/X8cUdOUknLH846C7PtWB1iG
	p+QCCJQZyu8dsGEGetGcWYEuN4pE3FD1SiaDO9ZyJL8/sfvzMMfMdnG9NJpbKKFRX03YEPcbY8s
	S9ghjCqbl3E+HBalGzOKKCn4tGCdqKtu8znkMrj6APZeMaeTEKV1wuVaJYNdrVDw/Z2M9CAgn8W
	rnMvJjQf3mR4CZifhlBnaLysKirAkz4LtbxJ5Txcz0rimTOtr5hHNJWJALVaoZ/vdCv9Kq8iOXc
	IgIMbTSmcf44b3eL1TEhJDaX32WHFV6Sch7DRXpU1gK5r6vhNjsmLOsswsC/ruA57d0717H3g4X
	rMNCT+p8yzVKgleeqAh4PIvdbX9P6xoynjdKTb3uS2qT8crvblDpnLCs2XS1jlBulgfQAOfrR3g
	ps=
X-Received: by 2002:a05:6000:468c:b0:482:b813:8315 with SMTP id ffacd0b85a97d-482b8138536mr3858488f8f.21.1787207199212;
        Wed, 19 Aug 2026 23:26:39 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.23.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1441725sm9980054f8f.3.2026.08.19.23.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 23:26:38 -0700 (PDT)
From: Karl Asseily <karl@asseily.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Asseily <karl@asseily.com>
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: add ESS Technology
Date: Thu, 20 Aug 2026 09:26:23 +0300
Message-Id: <20260820062626.39218-2-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820062626.39218-1-karl@asseily.com>
References: <20260820062626.39218-1-karl@asseily.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the vendor prefix for ESS Technology, Inc., maker of the SABRE family
of audio DACs.

Signed-off-by: Karl Asseily <karl@asseily.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e..b3cc100388a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -549,6 +549,8 @@ patternProperties:
     description: Seiko Epson Corp.
   "^esp,.*":
     description: Espressif Systems Co. Ltd.
+  "^ess,.*":
+    description: ESS Technology, Inc.
   "^est,.*":
     description: ESTeem Wireless Modems
   "^eswin,.*":
-- 
2.34.1

