Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB53346E46
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 12:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776773339; cv=none; b=GEbMKd57JlRHYTwC/7ejb4/CMUTq912fKKY/wLpqHebRRYL4TksgUnvCQSxBzWokvYhl4MOEIV9rYkVQtRGrvfLwdN96rkseAJ6IPwhqDVBucTzFm2UleiAGE4IH7x4UrKbMvdgvXYHma1jfqBKNq0bxIIm1DuLLUW6pbLq7iKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776773339; c=relaxed/simple;
	bh=aiFLynpjYl5lQ5FEQIq2RBZ9sUwzrdzIDcRmvW305tE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:Cc:
	 In-Reply-To:Content-Type; b=bhiz1qob1QTqIMgC0Dn/xGRvvQgT67URE9PgXjPjpgxjpGofJ9vKvPZWG1w0ECQ00NOaGZBQwwYrlSYD5GQ1CWMWD+2/0dCeaJx4wOGhuTTLjHD+lHn7OuEtf04oTiXlyfaEtEwbIqAkx1T5XV+pwNlef6mLqgSANCf2r5pfy8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PiQOGwyS; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PiQOGwyS"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a2c9c5ff87so4903527e87.0
        for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 05:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776773336; x=1777378136; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GrSOOzfY6QMDP4CMCrmM7To+FW0olg4dJIBSyC0pMd4=;
        b=PiQOGwySKkL02lkLiVwlnvJ12lYuKeCUliLKNR8yw2UDcSIzw/Qmo4YqmH0b7pHQMm
         ANNYUntIqxoyLaj7nwvnWHNPsQC7ZaN8WoJjS5tduobd8dX3Eet91NF8f4TWLwojADTK
         mMWdRUrpRRXtQBXp9YSAC9vN32drBMPgKSYTFlIrb2rsMpPB6XXdtPmmA6/5mKJrmUuI
         X6PLAT6AdUEqxdWRa4DaaD8r0uxfh4Qds3mcNzgtshA7DAH0FPjfAcb+nvgexryXMGjT
         TpLSybDsBIK0/VDqx/xe0Bf2opyGiMX4VYSvMckFYoQSrHeBAzAfOj8KCP9pxTN4FImK
         +xCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776773336; x=1777378136;
        h=content-transfer-encoding:in-reply-to:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GrSOOzfY6QMDP4CMCrmM7To+FW0olg4dJIBSyC0pMd4=;
        b=ePqegiou8qQ8ZE959wvuwfYGaW1/MjKlLOPfaingWuOQi3N2SegLC3oOkjxtiAks+D
         xPMvOj6+97509jiFD5K7LqibQEivb6/DiwNQbGL6ZTt2Ldwpx4s8nm3HpITUfc2HfQLm
         GcGvsel900k8AyZlmfRL1jZS1oJCfWPbCCR3v4GUu7qr34Ig88uF26CXSxE0XruFRITL
         wPrivWkBARurb9Pnjgd/m37IAfiYNd4LtFNSJH1XEP6GwmeWEVeG8Skz2K7fbhZAMpIL
         uEDg5csHUdlbMARACHxxDSEvvfbmUof0NUOwRu/2uPs+L/o5KVlQPGcEB0Ky/geHtyIU
         g8Kg==
X-Forwarded-Encrypted: i=1; AFNElJ8aZkqXLemwvWQKMds1dBdfC6Cmwwm9tTUYecm0hKWWTLQA+rGK7Atu4fuQ6n3vPpl+i4UHbejUCIWPzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxRExZi9NBWoClXjQD6c3stbFCJXFMnfNWwczJJWd0877y9CJH
	gcJckvEnVb0vYyXbEQvpYGW74CppYR3gtScJY8IVYkVshStr1OMJzn/8
X-Gm-Gg: AeBDieuyvcWfEtpW6Mw9PClus1JKH+V8PWlgraIuPoJUSO9xXNBHg3vndEbOwsFp05g
	Uo4SKccuotWUkmYmET864zXDwRVZzsy7DcPHQFXqgv8CpvNX7/n/eG8q/k8YrUmrvM5KYGhqGzp
	dSqSDKFB8yp/UtZEHbwqE48apxNKqTTzjEFL9hmtLWyznH9bLju2hJXTuqPvF7fowQZvHJy9bmM
	OtTK0Uhc+1cAGWubmv/cKDiWe3wWk7wY52CKGSzRADBNMwXMa2kwrXmksnEOy4F20Lpaqf0yk1R
	/Of/BEQwi0rhhzS0aQLTFwX/zGwIu94VmYjmsj8jkDLnnwNmndKwJDtz8VQMivfJTHIaf530pV4
	k13jNC1udvUs5+OP4mgLoFGKbqOuzX2r0it6x7M5MSult7eAjZBQxYxEMNJcOpLL5OFePyDkoFE
	XG5rtO9uDtIeyaIWSUt3iiOrGhE79dN+STU8AjUszsITElePKoEtAftk54DKscNvFSWHnmkXgcY
	KVBVMmOqG8X++rX4Sj0+6Ym6Oc=
X-Received: by 2002:a05:6512:33c8:b0:5a4:8b:a075 with SMTP id 2adb3069b0e04-5a4172cc5e7mr5514712e87.16.1776773334265;
        Tue, 21 Apr 2026 05:08:54 -0700 (PDT)
Received: from ?IPV6:2a02:2698:242a:1c71:d5e3:307:560c:a869? ([2a02:2698:242a:1c71:d5e3:307:560c:a869])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad343sm3621482e87.2.2026.04.21.05.08.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 05:08:52 -0700 (PDT)
Message-ID: <979224ba-eead-475a-b299-d8572d7cbaf5@gmail.com>
Date: Tue, 21 Apr 2026 15:08:50 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/2] dt-bindings: sound: cs35l35: fix typo 'overide' ->
 'override'
From: IRRatium <majnkraftiigry7@gmail.com>
To: broonie@kernel.org
References: <8ff364cc-c735-4e42-9d5d-775b76621e48@gmail.com>
Content-Language: en-US
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, david.rhodes@cirrus.com, rf@opensource.cirrus.com,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <8ff364cc-c735-4e42-9d5d-775b76621e48@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Fix typo in property name, should be 'cirrus,classh-bst-override'.
The driver now accepts both spellings for backward compatibility.

Signed-off-by: Sergey Shatkov <majnkraftiigry7@gmail.com>
---
  Documentation/devicetree/bindings/sound/cs35l35.txt | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/cs35l35.txt 
b/Documentation/devicetree/bindings/sound/cs35l35.txt
index e84f30c5c..1d364b3d3 100644
--- a/Documentation/devicetree/bindings/sound/cs35l35.txt
+++ b/Documentation/devicetree/bindings/sound/cs35l35.txt
@@ -82,7 +82,7 @@ Optional H/G Algorithm sub-node:
  Optional properties for the "cirrus,classh-internal-algo" Sub-node

    Section 7.29 Class H Control
-  - cirrus,classh-bst-overide : Boolean
+  - cirrus,classh-bst-override : Boolean
    - cirrus,classh-bst-max-limit
    - cirrus,classh-mem-depth

@@ -155,7 +155,7 @@ cs35l35: cs35l35@20 {
      cirrus,shared-boost;

      cirrus,classh-internal-algo {
-        cirrus,classh-bst-overide;
+        cirrus,classh-bst-override;
          cirrus,classh-bst-max-limit = <0x01>;
          cirrus,classh-mem-depth = <0x01>;
          cirrus,classh-release-rate = <0x08>;
-- 
2.53.0
