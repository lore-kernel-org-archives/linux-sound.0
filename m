Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF11914B942
	for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 00:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733964469; cv=none; b=URCPb6Emmsxwb73hoCBBUU7iaZouLmXOhvcO7FnbNH8eMatwKjxX/UZ70JwyDRhErLDMvwx8mhaI5mi+5xgO9QO+ou1kyKjUPYKtUultFFhXPs7O0jgMiUoccWJz+xZeY2YTjU+EGDKPeua/Xlu6CwQN90P6wNw4KRVfSzrIEuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733964469; c=relaxed/simple;
	bh=g17b3O9IJFRR5zRDTOnqHhNU2ufwtjxg8brt+E441NM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sBbKkY88eriGJgtRVMplv9GQNzBMluncFGCw20nrreByk/gn/jLzEe1Lq0uscyuLEMpFtXXCyeM6wfevSqwC72S9ZltvSpmvm1BWHb1Yvcyrbx6bNSfZDxJ/KYvnErBPC6r1mNby8KE9ouTxXRxOKZDg59oqR94qakYdCegeZrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NkPNBuvd; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NkPNBuvd"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso15606f8f.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Dec 2024 16:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733964466; x=1734569266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQQpmK66T3MqtBJyloGmYZGt9Ctq4U4XpvYTcWnQiLM=;
        b=NkPNBuvdbLTxDo78CR62d4PkCVlBDmuq/swC/C4uJ+M4TkpZl0bJRBzJk+g9kXkJVf
         Ul1gquHMFYBncmaIC2o1CpPticO9a7/8Ilg1Kg5zg0z0QhieTJEzLVgyrUa3a69FsxZ1
         aqWiGk82XMRPAh3rYJORi/BRc7zFJbUFqlfLkcCcSYe/SW0jHRzS7evOf+z/YO1FKhfs
         x5Pwb+ih1gSH1Lq/E4n/kstFY2YB/Mvybbl69v0pzTAW8/iET5AynoIt4lad/AC3uZK5
         fjOzvCIdkWxOLYOyiNtLep/bfyg/B1JlGDEArtmUboN4tAghrKIDdFiMv+dmySaB3WTw
         WRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733964466; x=1734569266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQQpmK66T3MqtBJyloGmYZGt9Ctq4U4XpvYTcWnQiLM=;
        b=QDV2TnY6qlQ33GxHymzWEd6DD1idKTtlkogxVAdUDy+vRb7Eerz7ohtUVUKyHWwGOQ
         AbKsTbNgr7Rj0v8b3Hdl2bA72XYkpu3tFK8bU0lrAm7YqFjsKIOZ7r5SD0NVOpR4HeoB
         JqSTqJ/3n4uJSsMjImNuUmT8NdWNfOW0eA/TzVRFSzUcTJiYqKgIzrPU06l5Bv2hsrJl
         Vyz4psGLxKwC7/QlNVdv4oIptvzFnxjEyLa6IT9YprUdRgcudTNC4xF2TyhjMIleQdMH
         kKnWlHvAuNkQXwot2siMVw4DIXXju/r7rJZgtC8nS9tqkqSkArqPGn9OWJWlE9C6mhZZ
         fasg==
X-Forwarded-Encrypted: i=1; AJvYcCV3jLMWJhPVn1V024z6gIuSZgGddc9+Q/sRym5rRZc4fxAt4mzbFgz7EB1QlYFR2gZW7SBlREIXrVGOHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6cW2iUzrWlBwogQHM1sIycc36/jJ9T3BBCa04RkgACSB7oMo6
	uV3nfNM1+LUHEYKlBJ+2ArHN+RQZ/TOXJX2toar3qrxDBHV+QZTr8Kxx8owDG3Q=
X-Gm-Gg: ASbGncvno9VwzWk67llsGdwB6oolyiKtaLz2j0slGRZXt+28dLgTQCuD6T0dHrCEvBs
	7/Q+Kf+lG9DFhLQYIhphJe9irNgfJcGw42qKtE1ccbcHwY7Z0//2B/u55L9QJUvb5Tf1Kj6U9qE
	ZjNrXLXG2WLfEjS2+K7ga5vljcU9U9m+HVkGFwc6il6lxMk1klEdlmRQTofCZ18Uvzjf8wZWu4Z
	k3egrJcj950LGOeaQJMyzQBIA5lpzpfFgrFfZqpl4XrIYP4WhVeTu3S6WaazFKeRJnLRIpB
X-Google-Smtp-Source: AGHT+IHtzrN5lCLtEOpZ7wN6Vwiw74Jy/Nphl9EoXdDE0Dvq2P8eavVUVGJHmfyFsPMVjXn4QnbdqA==
X-Received: by 2002:a05:6000:490a:b0:385:f996:1bb9 with SMTP id ffacd0b85a97d-3878768e743mr1113391f8f.23.1733964466297;
        Wed, 11 Dec 2024 16:47:46 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4ef4sm2459660f8f.39.2024.12.11.16.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 16:47:45 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: broonie@kernel.org,
	konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/14] dt-bindings: arm: qcom-soc: extend pattern matching to support qcom,wsa881x
Date: Thu, 12 Dec 2024 00:47:21 +0000
Message-ID: <20241212004727.2903846-9-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241212004727.2903846-1-alexey.klimov@linaro.org>
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for qcom,wsa8815 and qcom,wsa8810 names to be recognised
as a valid compatibles.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 2ea6d3f65478..ebccafeb13e3 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -23,7 +23,7 @@ description: |
 select:
   properties:
     compatible:
-      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1e)[0-9]+.*$"
+      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|wsa|x1e)[0-9]+.*$"
   required:
     - compatible
 
@@ -34,6 +34,7 @@ properties:
       - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1e)[0-9]+(pro)?-.*$"
       - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
       - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
+      - pattern: "^qcom,wsa[0-9]+.*$"
 
       # Legacy namings - variations of existing patterns/compatibles are OK,
       # but do not add completely new entries to these:
-- 
2.45.2

