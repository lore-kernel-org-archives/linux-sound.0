Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF5E35F172
	for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 08:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402629; cv=none; b=FmH49MHQeD4SSWFxuzwfnHkIPDbuZRMXxmzpPTnW8rGkxjHwJmllPVF6BY7BMp2Xqjbhr0Msa+Ggp+iT8j1n59nkAFWa4cZAqWK3sGPE3HtexP9vB5r/dO+jIBDxXpemPYKd6QEP8NwDwL2/4WJ+YfqAw7X8q2wqwwzaWj6hyNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402629; c=relaxed/simple;
	bh=NAsOp5VWFgwKRWRvG20Z6BUZo2fk8Rg0gpq73L+RkcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wuih/iE82xG3xeSKLb4MCD3m8YITZHgETaDKKl4nvO7RUvFmWLeVJwPMHw1wmX/OgtFq1VkzJZp0iiXectiT0ICc9eXdFLB8eddMfSmEYwQPRwrQATnpeNSR1QAgsTo8a5k8zzLxy8JU6pZ//QArgpxHha5TGN7RSuoi6ldRXbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BabbIQR7; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BabbIQR7"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b7d3ecc10dso32897145ad.2
        for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 01:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402626; x=1779007426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGdYxWBckVTlaOvEXVR7slFeLhH3KDi23p9+cqpYQPI=;
        b=BabbIQR7xhCmEJKtexEwxCTrP24KGY49wU1qj3eqRCDALVhw4auZbr6zeADdro6QpF
         28BNoevIa+FNuXdHGF6P6SBSNsiGH51Fa8PQtc6KGPWtkXhyWXX94UK0TVqsG36eIgwK
         O6eXp6nAKZzw0mJm44YkATCOOHCNuRYVJ6AuF87HchxLqVyq95T+4IlnPTd82VSVuxnF
         B2HfGkrb5Z1qi5Zy+rg4vJQNaE+O6aB/0R8yEPPrbnFaj7t4XRxHrDexyyAnr2qnU86H
         RH3jiaTlfHsdbloaUlgRSsdM5c+0QnKFeLRGyOexIbzFRS0/6j6+L2r22PIehYqeX43Z
         CMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402626; x=1779007426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MGdYxWBckVTlaOvEXVR7slFeLhH3KDi23p9+cqpYQPI=;
        b=Pg54euae4AaMvin9s0Km7DFg65dg5nR322t5eaiGho9ukHGgEvivSramBGkM5WQobi
         U0LYOU06JUl6+HssDJbdlZnbOcDcWo6lgfRNyAN3gVvkW8wBrhSMlrnBGvFBayYjZ+yA
         XWA7tYqE6Bx7OCjIBt9PtWqRbtiQaly61wxOwVyYIpFaJVXscrINO7XWTsTKKPXNIPf7
         VkxgFtSu46TVU8FOsdacD7PAw5otvX1bRFasMFuLVzyFwWhNrIKI9j65e3KqwJq6S/IE
         jYhlXefqsGc2deswipA9T54cEvaJTEx8VmYGJS6Q6KdawMDxelqGZouj/uCOaognXYrU
         5QoA==
X-Forwarded-Encrypted: i=1; AFNElJ/3snupBYQKSDco/Sob4HTGxGVCCf9Ds4RePcLynNGshUF7hmbLjdqVMUE24Byzj0Ns3x0cUum8kyurWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPDUrvomTOERBWW+yDsmezckSUNE+RsbVIXzgT6LOphd8pDFkz
	EWfSeh6+S5BAL5j/uM5TaKLIp2REdDmF8i1eXtUJk0hSh+PTuoGgLQeD
X-Gm-Gg: Acq92OFqRLkJt6aTJbaJcR0e34OcB7zmPgpHApparDRZ7XwVOjL+zRx6KJR/X/nbR/M
	C/03l7ar/+ogOqMz088aIE4HQKc3F1qo57Me8FrRYmLch8mxHRtlNALJMRxRxzWFckd0OhJnJww
	37QGOHrghUVwbYyqWARrf6IuBNoFydec6z7lzufDbD8WlbzsayEjSopzEOSuGUlnWfKHEQaqZof
	hcfD75k85eGWSxJActMV1ZmUIy+0VyDuvuR4mVtYMpwTj5RmI254ySeYUDplmuckh8deE2zDn8c
	4hOg0DQm6+fEZR2Bkj+3OSirt6OLNmbDKFwTP/fkNRcNbccqlvxVn/N/8YIyrhIz/RJYwvxy5YO
	aaa7OMbS0UKudml4nO3VlSAT4J9QB4iOyF9Dbcu9njLe9CPY9B6G75kT6teodzjxJGYIQX7GQFs
	7lW/zS4T80oUcvv8bsmso4TBHMYJqF3Zic0UjrsTtlHlPAO53fcUNXvIMG0MFy92dJcMk/I5Sor
	u5DS9U=
X-Received: by 2002:a17:902:ebca:b0:2ba:6518:a6d4 with SMTP id d9443c01a7336-2bc7aa1356fmr59329735ad.20.1778402626428;
        Sun, 10 May 2026 01:43:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ffa0sm70471005ad.25.2026.05.10.01.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:43:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	tiwai@suse.com,
	bui duc phuc <phucduc.bui@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3 01/10] ASoC: dt-bindings: renesas,fsi: add support multiple clocks
Date: Sun, 10 May 2026 15:42:54 +0700
Message-ID: <20260510084303.122426-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510084303.122426-1-phucduc.bui@gmail.com>
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The FSI on r8a7740 requires the SPU bus/bridge clock to be enabled before
accessing its registers. Without this clock, any register access leads to
a system hang as the FSI block sits behind the SPU bus.
Update the binding to support multiple clocks to properly describe the
hardware clock tree, including:
  - SPU bus/bridge clock (spu) for register access.
  - CPG DIV6 clocks (icka/b) as functional clock parents.
  - FSI internal dividers (diva/b) for audio clock generation.
  - External clock inputs (xcka/b) provided by the board.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 .../bindings/sound/renesas,fsi.yaml           | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
index df91991699a7..c50e7115b21a 100644
--- a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
@@ -38,7 +38,32 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Main FSI module clock
+      - description: |
+          SPU bus/bridge clock. On R8A7740, this clock must be enabled to allow
+          register access as the FSI block is connected behind the SPU bus.
+      - description: CPG DIV6 functional clocks for FSI port A
+      - description: CPG DIV6 functional clocks for FSI port B
+      - description: Internal FSI dividers for port A used for audio clock generation
+      - description: Internal FSI dividers for port B used for audio clock generation
+      - description: External clock inputs for FSI port A provided by the board
+      - description: External clock inputs for FSI port B provided by the board
+
+  clock-names:
+    minItems: 1
+    maxItems: 8
+    items:
+      enum:
+        - fck  # Main FSI module clock
+        - spu  # optional SPU bus/bridge clock
+        - icka # optional CPG DIV6 functional clocks for FSI port A
+        - ickb # optional CPG DIV6 functional clocks for FSI port B
+        - diva # optional Internal FSI dividers for port A used for audio clock generation
+        - divb # optional Internal FSI dividers for port B used for audio clock generation
+        - xcka # optional External clock inputs for FSI port A provided by the board
+        - xckb # optional External clock inputs for FSI port B provided by the board
 
   power-domains:
     maxItems: 1
-- 
2.43.0

