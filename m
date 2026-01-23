Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8192459C5
	for <linux-sound@vger.kernel.org>; Fri, 23 Jan 2026 15:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769183397; cv=none; b=Z5+0zyujNbS5xi42/kWLeG13LbCPDAHHcxXuEhYrPcNKSxRykXyCEUH+nykppGDB8/4/76yyc1/K5a6en5lDWVrwyGRlhRu6EkQYg4rkM3TLZIOGqKwbsOT8hzho9BdQcad5cNswLOizOv3T6EM5QLg9/cnBWHyVs2mqKo+m9lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769183397; c=relaxed/simple;
	bh=81EDE6zANSkm7jjtzly7Hfy4SkGwEuzWgjcqJ0BHYUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oEgFi+QC0SqxBM5BW7m75B0a55h2jspOkHRfC9qOR7xd1mopTXu/aFsUh5U44dWDegVxaKstFfbycV9G/HPz0TRUk8UABl66PZyTY+a2vuTL/lT6SwNcCSiBjLxU0z46UkZZTDm21LMobJSVZ6+t13x4o3ggPKuTj9dXcUhlLQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0YHSsOU; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0YHSsOU"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d148db5fdcso850785a34.3
        for <linux-sound@vger.kernel.org>; Fri, 23 Jan 2026 07:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769183395; x=1769788195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7yKtZk161f45HUB/bUq94UEthH6CcvyZMfBkMmlIuRQ=;
        b=L0YHSsOUdJG00mFqkVKZyrQ8HAnnvZKPdxwk6G+hZHmI3uYDS1BIeUWafL0xyuZNUe
         MLSJptqd2Gg+jomW2eShdfuwl4b7FjcfLluJQ1gdWou+/c+ZlVKl2YckaNkcWU2pYaIB
         uYmz35RLAFmuoXP8on5NqO+W5JYzDz40bmivT/AnCkfeWoo8xi1TY2OqiMPybVWL5O/z
         /baZhk5kylCbQIpZrLSMcl8hwNnyVG79c+Y7UBMvmJwgO8DFeuqLSdVqizRwy6Xx6wky
         5UjjknB3+dfyHyhEBp94G4NyS6g5TYp8lSYauHc986sTZsmB0LVGmZpvK2J97RDPuvBD
         TMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769183395; x=1769788195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7yKtZk161f45HUB/bUq94UEthH6CcvyZMfBkMmlIuRQ=;
        b=Q72jsQoPLoLCm3Zzi/HPzSDmVd/j2rUTSrq1CYbgG1yDKOG4kJDajiqvU/GVS+nuTD
         IgB54M9zdJZw/mmhH7JHc234T1YeNBJpAWNQtp412TPYAePhIidL1770LqAuXOEIoBXk
         Ykb+2VjM6YuASvof90rjacEqTKZ9giNcvXacBfB6pV54NYwbGSgo3hixqzyIHD5CRVGu
         3K0+BP1PzPhpxd2k1dh1JAJ5bV5zOjO/hIhL/G6NxQ6FqF8ItgV5DkuUWVERAo9Jls61
         SBOIPPy6A8zpK7b5lt/HuVskP7Qri+xFWt14tkwF/owTMAf+rsWCutOoc3I3o7TostlW
         1YPg==
X-Gm-Message-State: AOJu0YzmZtDsMRSXHGn0cJvAMACbfBH2GeqOQb3STXV7I1Ocgbr1cfAw
	4RAfqpMl6JgsuNmTQ7n70qMW8B3nYVnqdqPWZxs/GDgoIq6cKJru8MGp6MMPaA==
X-Gm-Gg: AZuq6aIjmWTweOS9YIRjjRtj86n9BvMAtwvyB6HJmF8xIgTkfBTQrA5YNleavW6gj1W
	BwkWNbd6knXhnvh1EApd1Yf/EHIE7/kXeNeRtf3PFxFnXNMEBF9W9Tj8Ygh5qtkLwFAW7nRMmnP
	yZnd47ULwpAdxmuBhzfS9PRjsC9EhmHM2offrXyIdOHvyTYyReIrCtGmGb9f352iIQpmghxtk48
	Ya077Mv3Jjzomt5t+DGxZZCQ3EeF/Q0qk2pm3Q6i8/Xu0DXB2E1BFvkxg1UFYxK38vzvATi6qcA
	I0XXeylRfAU1me6cQLdcVxlX0leMze8HyrcJX9llADoUJzwEdheS2Z+phTJ5Gd72XicnDoIrjVb
	21ZKEG4cYU9OSIkmLoML8jb/xyQ6qpNJgPfD5Nh8+ZSLafCnEmjUYhAZYAxakmrKYuyED4114R0
	fyYwXXjCDluQ==
X-Received: by 2002:a05:6830:6112:b0:7c7:5d8e:8b40 with SMTP id 46e09a7af769-7d15a5d7d6cmr2311298a34.5.1769183395270;
        Fri, 23 Jan 2026 07:49:55 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::ffa])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d15b3e2789sm2074327a34.27.2026.01.23.07.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 07:49:54 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sound@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	wangweidong.a@awinic.com,
	tiwai@suse.com,
	perex@perex.cz,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/2] ASoC: dt-bindings: aw87390: Add Anbernic RG-DS Amplifier
Date: Fri, 23 Jan 2026 09:47:30 -0600
Message-ID: <20260123154731.130649-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123154731.130649-1-macroalpha82@gmail.com>
References: <20260123154731.130649-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add a binding for the Anbernic RG-DS Amplifier, which is an Awinic
aw87391 audio amplifier. This manufacturer did not provide firmware
so we have to use a list of init commands instead, requiring device
specific functionality rather than generic aw87391 functionality.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../bindings/sound/awinic,aw87390.yaml        | 34 ++++++++++++++++---
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/awinic,aw87390.yaml b/Documentation/devicetree/bindings/sound/awinic,aw87390.yaml
index ba9d8767c5d5..9c1baae767c4 100644
--- a/Documentation/devicetree/bindings/sound/awinic,aw87390.yaml
+++ b/Documentation/devicetree/bindings/sound/awinic,aw87390.yaml
@@ -15,12 +15,15 @@ description:
   sound quallity, which is a new high efficiency, low
   noise, constant large volume, 6th Smart K audio amplifier.
 
-allOf:
-  - $ref: dai-common.yaml#
-
 properties:
   compatible:
-    const: awinic,aw87390
+    oneOf:
+      - enum:
+          - awinic,aw87390
+      - items:
+          - enum:
+              - anbernic,rgds-amp
+          - const: awinic,aw87391
 
   reg:
     maxItems: 1
@@ -40,10 +43,31 @@ required:
   - compatible
   - reg
   - "#sound-dai-cells"
-  - awinic,audio-channel
 
 unevaluatedProperties: false
 
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - awinic,aw87390
+    then:
+      required:
+        - awinic,audio-channel
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - anbernic,rgds-amp
+    then:
+      properties:
+        vdd-supply: true
+
 examples:
   - |
     i2c {
-- 
2.43.0

