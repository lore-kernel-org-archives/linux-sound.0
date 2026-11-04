Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796080;
	b=XZRO0jth36NfgKV0vzlhYYmXHSlRQ6EaxTlhYKP08QEokFI8NPEyQYIIao7j49pZR4fc
	 fO6XW84WZ3gVXYnQXg1xLHFplD+7RdCDIsfABzhaoX1wuEYJMoSan59vb6MtUu5ystqYo
	 4Vwwa/tRBgoFFjD7F2xfguM4OlixYJQ8ONPRrsUkzbpG+mlQ0uG7Y/wsP+K3CJoqvTy1D
	 ZoMG4Y24PIR26SdMTtDTRm/FRtBl01FAQ8I/Cc5FlmJ0DB8r/GYtuaHoDNRNri0gfERZL
	 OKowjLbAKoehbtmCE06we97kS8THgFCDUD094w3xwZh4nSScUpalIRcjJFfAogCdjPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L7Qs5HGELo2q692xBpNFNDpHNpDtILl/fMMlm1q9CCM=;
	b=4H60ZPg5qP2T6fMDX0tfV5NyCKUUc2JGsvBLAW4R5+4GH9SU6I+UR+tO5swKHAfN64wc
	 n8c0ZKl8kncxUuz4N81B8Qk7rSK6VIuxjYXf3NL2Bpw4t4gWct4Z8sFqJbWLH5xePabTD
	 Pd4XKq7da2SEqR2RH+5VkbJMmsoOCZ5yH3epQLaoyQyyMvYXL3UgAVfab8HHzapnvFjuL
	 ccYR1uA40A+53XG9omoNW7M3tyZnaKZKivUKthbh8vOxW82DzuVWZkWQrPn3uNKJMJLij
	 jZb3x2vmdbvUnxQj7e1EDnjgy4b1WXZi42d74x/D2U1eqoERq2b57VepQCYFxtx/1pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S2L77hlY;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AD4606A336
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 12:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27AD4606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S2L77hlY
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so4793705e9.3
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 04:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796078; x=1794400878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7Qs5HGELo2q692xBpNFNDpHNpDtILl/fMMlm1q9CCM=;
        b=S2L77hlY3JFmZzFsMAsKB/5Efv9vC9OzccoH9cJ7Ezw2jZ0jFCFaXti/iQHmqhbrcW
         nwAbU3Z6Cajg92RSkOV9yVzNpWY7QjttNPQjhLfeYb9XmRWyI8o9rWoAfoqV7Ky3qT5j
         +L5QuHt5sijyOSKLYfjfCJaRJwL/a5oKRZT9vvpJgTrfSU9A8gaQHB1KMezWl2jFd6KG
         TxKMIM9S5L+b1lVdRcoiJ+yllC2IzK5JdCnngoGsRHLK+CJeBE2Pq9XCipPJ9oF1KlQH
         2lgc9lVTswJs+yPhXLyxyTTy/YfvbXh3EEpU2o6SFewPxwqAoWY61yFGHDIFLvHz+r2n
         /jhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796078; x=1794400878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7Qs5HGELo2q692xBpNFNDpHNpDtILl/fMMlm1q9CCM=;
        b=Jz9t6JV3tm82OHyszP1HSpmnNfLDpBETmVpTry/HlCZ61dhmWXSkx8Hl7k4kcCP/uN
         utFCTP+vZip8oVAP7YHXcbhEg0Ikdnc2VfTID0VCkTCMHmuaV9FKpH591m6vuMCNiTYL
         dwgue+L/TAjUWwJ32HeNoyxfmrF8WQ8xZxYeFeTO7F/QlV2G1VXlatZ2pGbKxdsT+4RW
         1wxx5RTybBCB6a2T7ORMEroBcrSPEWO65u36oMo4T1IKafD7tvGIOCi63yXfWItLGcNg
         LE/2jasi0HZA2IJfyx9shoIT33VrOUuZcoROs2oMTwEUY21NxqxI3nF132E99ymEZJvQ
         NJpg==
X-Forwarded-Encrypted: i=1; AKwUvBwrPrRWAC+z9tGLAfrPIQ1BWy9Qjztxj2MuNrTuGb1nZON4lqWCTeamyi268IipN7s9Mscda4XfYRLbmA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/BOHemCq7jbkahIiwQEMFQu17SqiaAoTJjcFfN8bz3uLtwlr1m
	sEc8RoQ3aPHL9DBxlLf0NbYplEtXlOA9+6y4oBXIOsiBQd0BtH7arqob
X-Gm-Gg: AYBFou1A0LitUp9tUfX1gRrdTxUtW49iTtTQWK8zwpI7/hUhtx7uJrZIq0R2o/HfLsB
	2jFpQP5ao275FXu+/r8xUGC3rT6Wj8iqcY1HXeK9bEYp8070eGWK8iCQ1o7TrDfZ9hQEWeB4vjV
	zYXFGCWlxa97FczxVMvFSxTcC1OBGz/7HoLcVnL4urKUWHikFphz95yXRfF6ynDqQ8XP7GTnzxS
	GcFkBvtI+6eXdQDf/tOiZB3oIRsac24cr2g1ErCy0PUc+PFEnm6TKIg2boSuU/GNwAlS6xxxKQ8
	ZGrKaG86mZLqsz3BomsKQ2ROUeWsnBICu6Rfv1+I3V4DGMzNmmViP3HtbrTPa481/WKBPtd2nUv
	uCXN9jP8ZFPsf/bK3SJNwXxVRfM1AuIciYeaZ89vkOB6nwQgCcqLsKH1T5XGv8XpnTnu4RFppF+
	SDeLktJE7N09zttl+P+47h2pRnkaT7Vg3L3VBvNNePvFsq5YtGiQ4TD1O5Trot7M60k7VkkaYRr
	YL1r6rHeI9mfkLXJYnd3+dGPU2ESONziB7jGzJa0hpRk6jkp4NxsQVCYC+XfFk1HYvfWwF3KRXe
	vxcwOHH5l0QFeUD1ebyGW7IxgNXw+2d97LQVYKvicEa4VOfqQw==
X-Received: by 2002:a05:600c:5246:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4ac1889c7bdmr363754215e9.24.1793796078321;
        Wed, 04 Nov 2026 04:41:18 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:17 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 5/7] ASoC: dt-bindings: wlf,wm8994: Update #sound-dai-cells property
Date: Wed,  4 Nov 2026 14:40:55 +0200
Message-ID: <20261104124057.240288-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104124057.240288-1-clamor95@gmail.com>
References: <20261104124057.240288-1-clamor95@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Wolfson Microelectronics WM8994 codec provides three DAI cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/sound/wlf,wm8994.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
index 0db04a90ac6b3..f367c1ee0a947 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8994.yaml
@@ -69,7 +69,7 @@ properties:
   SPKVDD2-supply: true
 
   '#sound-dai-cells':
-    const: 0
+    enum: [0, 1]
 
   wlf,gpio-cfg:
     $ref: /schemas/types.yaml#/definitions/uint32-array
-- 
2.53.0

