Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E1E377A85
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 20:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787602805; cv=none; b=SHBsVzv5TSfohmut/CQo9hvqOO+EuRFHJmkEz6/W98xsTg/UtVNZ72FjBa8CEtJ1q/hOw9Maz7hSrjIv5+Kkl4tmQm2p1D14y09L/+0D16kwZ4i9rbCw7x3pqs68HMFGJTSGdrrkXZVLb84uIq46y7L6dGnbilnnt/FpT+kHTLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787602805; c=relaxed/simple;
	bh=1x/8fcBOBGwQhPNEF75nOw7LbFJkmoN2c84cmfv3ius=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s3MCKA71/4eQdnx/N9T3sLdaUw/PRpZCFZH0323Yj8Zi7WudwNONqyTcncLQYuG9RfC4FEOwVtbQmBCKH64Q37LumNl+Np3BWO0JmDyFloBuBLeyx5jUpYGYQh2FxxGG8iBJoEhsJ3AdxyBdLAJ/OMLjsG0our3Q298/1vLB5J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pCsIBIBD; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pCsIBIBD"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-934944f2d22so223422885a.0
        for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 13:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787602802; x=1788207602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vOLy1+a9YXmFraELoFIR4gVacZ4F6tH0XUrBNuPXgmE=;
        b=pCsIBIBDLwx10+YaO9sEpmdmW7rB6v6lwzISt6NjuaoSTRn7ZjO+fZifskQZ6Xtj5/
         mcleid+a5NMx5Sw5mCNMWtyivu7lJslQ5jnhIv/FrWr0nGWmquQBrK5T3EZvIoRfAkQe
         UjtVXt95VwsnmgbZ3FhP0c68Wvj9Yyi0ywvHGVi2F+MT9wnDfy78LbmWfaG4D2aL+CK/
         fpV7IBKRlmkCpdmczfxF2570cnfi9UAeEHfUo9ooYWCy82VUlLqjzPTAJs2g2EeZCR8u
         b3OaHdjTct8QLW7ADTTy2RLxPS5VbI8Kf4hEAhWS9Fj3lEjktGRUtaSRxvl7bF1EWtad
         j1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787602802; x=1788207602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vOLy1+a9YXmFraELoFIR4gVacZ4F6tH0XUrBNuPXgmE=;
        b=jEWpUcH3REYkW0VnO4Ry+aqkkoGpWtcJu5eVKVkcSaoNkjQn1mmmT8JKKXAj398Q9Q
         nBVbjByFPXhu4peXO9jzYt7F4vW11p34F3QBMAM31H0tP1m8nfvX66gMVfAmgGcQWOuD
         uLT4Jin+2L9FblDO+csnhljEoqMREG6yYmnoEtGhIzeG7GQcNKTD48/GPbKfD5J5L641
         l95fFxPzPVxireYOoRH85nhjMm1QaV37WvnY6w1iIhGjblym2N121VL/AE48WLf39bt+
         vAvIuCZQHdJAeSLao8A5kAO27OohFaZDB0vKSk/ZnEyScq5q346mcGjMaiChNjwxXjub
         cKuw==
X-Forwarded-Encrypted: i=1; AHgh+RplzvGVKZhISPrDhXL0T2em3MgT/kVOFlRFXSRsxHysSjk7yPkmgjcSuf4UxtQYvJKrJ5yqwN3LmV4rqg==@vger.kernel.org
X-Gm-Message-State: AFuF++k7JmmIjOHcdPj2JR4pCs8PUzKU3rE17+7SXbnM51fVTcDZW/Zb
	LPEdWa4I/xjGhghXlyD58RArUHSFDh1fGwgKFOgk0iQuyHsYeN1pScSu
X-Gm-Gg: AR+sD10b1KGzdCBLoMHOUu1+GeVIWbH+SPA+FzU+bsHprpYUpUM+gA2JpxzCsKgpCWi
	p0AHpDRDYDXuRh022LA4+kxnSF9A1OOzUeYsTZ4tn/g6rTHE++3zvtmcTDeFFWWP9EAThDsZmtx
	btluA1UwlBHEAkafEP1e0mo2jq3Rm5hHde2ir2gg7X96d173z0rDKz/l9FIr+z97/Lj8yY/8ngn
	R/iUENqqZvlMlRWon1js/Z5qlzIgpXrzzu9nwUXQ7IDY6zbZ21UeeXHG8ejGoA4mTmRfJ5gSgn4
	sVpDGkS8cHLdC+s5ix7AsgGxw2ZlsQUIXVts7vTjNMEk6wbTxl0El7A29Qs4JLzpqAXPnMqyXc9
	2c9mYxHH8efCGCF0HtDlJZcyLwetYtyytryMMKtrmaZ/q3G4smCBMb1npQ9Usak5mHUI98PtXpp
	4hNSnVxr/CX232ouQ305RDzy/+MzILNmNEvmOoEclstcSU931X6WnngL6DgwagZq2dug+V/r53K
	fszKTuh96h0Us/riSAgRJPF2KP8XudZXw/obsycONheTGAqj03kXKXHliryceqNda1vQiw5clyl
	sOUwALxU1xHQ75SxhyTiBoru
X-Received: by 2002:a05:620a:4809:b0:92e:8a84:7041 with SMTP id af79cd13be357-93739542819mr2709922585a.8.1787602801988;
        Mon, 24 Aug 2026 13:20:01 -0700 (PDT)
Received: from zaina.mynetworksettings.com (pool-173-48-203-201.bstnma.fios.verizon.net. [173.48.203.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749d91ec0sm579356185a.26.2026.08.24.13.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:20:01 -0700 (PDT)
From: Zain Aboobacker <zainaboobacker33@gmail.com>
To: Nick Li <nick.li@foursemi.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zain Aboobacker <zainaboobacker33@gmail.com>
Subject: [PATCH] ASoC: dt-bindings: foursemi,fs2105s: Fix typo
Date: Mon, 24 Aug 2026 16:19:51 -0400
Message-ID: <20260824201951.3116-1-zainaboobacker33@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the misspelling of "generated" in the FS2105S binding.

Signed-off-by: Zain Aboobacker <zainaboobacker33@gmail.com>
---
 Documentation/devicetree/bindings/sound/foursemi,fs2105s.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/foursemi,fs2105s.yaml b/Documentation/devicetree/bindings/sound/foursemi,fs2105s.yaml
index 4da735317e0f..17c938a565e5 100644
--- a/Documentation/devicetree/bindings/sound/foursemi,fs2105s.yaml
+++ b/Documentation/devicetree/bindings/sound/foursemi,fs2105s.yaml
@@ -63,7 +63,7 @@ properties:
       a. Register initialization settings
       b. DSP effect parameters
       c. Multi-scene sound effect configurations(optional)
-      It's gernerated by FourSemi's tuning tool.
+      It's generated by FourSemi's tuning tool.
 
 required:
   - compatible
-- 
2.53.0

