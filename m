Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A388C1EB5F8
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 02:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776738783; cv=none; b=CQnSSXCXlOedoEpiFez54tN9ShlC9HtvQGWivZcXMzAVCc5nxf8XCksBJ5/uxRvOXTToeAUT5P/7x8niavt0NGtnpGSXBuIbJiaeBXC/7TDKlbF5f6Zd7xy26+2y8L/EyvGV4/DFKAAB9j7Rl+NpmOZSvF0/pQaqnSZ77Wn0w8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776738783; c=relaxed/simple;
	bh=wFQg19914jtz2XwP2opdWcSfU1TUAdgxAKkGDk7LU18=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=gT5G4hRBOBNJJ2hWHho8fF2nNOcEXljL1XO4BmannvJNdyyb5DoIg5kKXG+oQtxVQBv6/UvPKWfHcOJSbhW3siXr0fzVpb3iRbveUtBUTxkgbEl28JMQ8GUGe06f2RRSimEXj8iB1m0SbRd0M4on0kxInKhiU8DpHW6cP3M+WLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qOQuwzbM; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qOQuwzbM"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a2c7427ad9so3670806e87.1
        for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 19:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776738781; x=1777343581; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ABWs0bWcgbon1Lem/Qfu4QEzbH5Ol1AP1e/CcPVA28g=;
        b=qOQuwzbMlR5h/X524RQUQ/TiaCHN4bwY/9OluG7isCwbdL32ejLOV6AYGu2SA7rch6
         TRXh15sPSqqa1KRB50c2IT2y75aaxp9JexYQ/UBAuvg8l8fVhUB2XoZrs8v4pU2YWtXq
         upcmqyiNSYkyLf3rDlk+Fy6W2ue9BuQ+LMEmKE1+eAQbaE1cb+ETy1BJ2We6RvrksXsd
         /6DVzXUv3yE6nDERlFbFL4n8euhbRRncvfwDig5XpHj9OP5gV1QnDi8paWzMLSMgvvMM
         +t60NaBSSOGmIRrInlLae1aj6M0E735VWmP3OHQNrHlrQ+bTVxFrU0us0BSY9d7nsqhC
         Ezbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776738781; x=1777343581;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ABWs0bWcgbon1Lem/Qfu4QEzbH5Ol1AP1e/CcPVA28g=;
        b=WVlWz26CU2gZwrkKfdyOMd3LlXBqnG4Cl7fuMwLZ8ypQ+7HCmyYkInkVMIKLlnr8ny
         dTXAdWpQVa911eaiWUuI6yCngYWrKongYu2sEwdn0tx8BXLOfnAZMTgzLO9nLU8I4QJV
         oe3BDG0vgGP/ezkKvZ5qnHg5/vpgf1omJasa1DRjObbCc3a7KmNadsWMN88ODXK0oTOY
         SLqmzXzDRbP6PUtURKDdbK/5kLTfuVLpui7hXasJN6rkEhXnqjFjdneXrMSK784OLqzT
         PHbIf2knGi8LCvMhTtxG4xCqxzwhFCTyVo5iq21UZql/Mv84x+63U2qAdLtZIH9maLzI
         8usA==
X-Forwarded-Encrypted: i=1; AFNElJ/F2hfp5BAAI8NyF80qbt929+wHT2ayGQ0HTyyh7pfeXT4FMiuAtJ39VWoIM7OaP+ln+nggzxdYAs+4kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPmzZsN3MPGa0J2NQ2quhXj/bz4PCA51qgYu1QGSigTz3AclWM
	wwOFrdNxLHXfluXeQu2PZgcmY1LrZ/eGLi8Jfxh3ys0bm+IT1iPrDxBf
X-Gm-Gg: AeBDievLOgtly0p0Z42cr5ybAhV3KrEHt9jjidnFp5ha52gMal0E7/1qjvVC0alyZw9
	wbHuOvzvW7ZzsFtvGusyTlrtXC9ihg32zPIIveMelglugMrsWekoK2nsQZ1oe9M8YuftVgnKTi6
	o5xgjXgqpdWnfvf8f04a6tm71pff+OLEjDSzadK1YIdaH2WVoNLtHs7wSvVeX9lnNVvLns96dex
	tBqATX+xn2s+ardvNblhgxdYwRwjrSpU3zxjXG02/M6I6D5Ee96unXHLzI7hp47V25Ef2qBOWe0
	jT8xODqPajOm8JndljLL/OLfNxjNobEtJmvS5EFVImWOB1gNt19Ezrw/4jHkdv8LUDXq0yAaynd
	XZbsmqT6D+jmAVBqy+GOUVI82zJj8FGDJZ3BrsJLmcrIR3n20EYRsYmDIC7kFGiW+oxvOUqrSmS
	HQMsv0u9cEwJHyIDW/NTKdjZHOnjb41zqRmHq9TmmXFepuzZdA1XQpOvB/U+8x+jZuKeRVy0E6C
	JarIzviDOy7Qt6l
X-Received: by 2002:a05:6512:3e05:b0:5a3:fcb2:c6aa with SMTP id 2adb3069b0e04-5a4172bfee7mr5120903e87.13.1776738780573;
        Mon, 20 Apr 2026 19:33:00 -0700 (PDT)
Received: from ?IPV6:2a02:2698:242a:1c71:d5e3:307:560c:a869? ([2a02:2698:242a:1c71:d5e3:307:560c:a869])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ebf9bsm3348415e87.81.2026.04.20.19.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 19:32:58 -0700 (PDT)
Message-ID: <93f16046-ebab-47c0-bf71-fcb4cae147c8@gmail.com>
Date: Tue, 21 Apr 2026 05:32:56 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] dt-bindings: sound: cs35l35: fix typo 'overide' ->
 'override'
From: IRRatium <majnkraftiigry7@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, david.rhodes@cirrus.com, rf@opensource.cirrus.com,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <5ba3d073-c5fd-431e-afb9-0a0911300aa7@gmail.com>
Content-Language: en-US
In-Reply-To: <5ba3d073-c5fd-431e-afb9-0a0911300aa7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Fix typo in property name 'cirrus,classh-bst-overide',
should be 'cirrus,classh-bst-override'.

Signed-off-by: IRRatium <majnkraftiigry7@gmail.com>
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
