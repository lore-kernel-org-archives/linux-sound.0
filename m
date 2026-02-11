Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8ED366DB6
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 10:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770805670; cv=none; b=TDEPboDzO1b8X9isHqkdyDaCGcAowgVdeIGn5FGA9b7NqoHph6U+zUEt4rWpl88QiXqiD0wjHhP3ei0uBBZF+/xAdkyg59UPVdCJx16+LsVmYypQR790gJELlhnl3SbFWjgWA4nwZlWrTZhcCjApscFCi/qfkS0ejY2gApA+TV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770805670; c=relaxed/simple;
	bh=EEdEa3IUnYRnCSJujp56yp6HpXcw4IsB31pVJk5oyWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ql0OyUbY3GRMJfVfr7QHvrvyFqmG31axF8zFCWVYvwB9qJdVqKCMX50bB1TA/DS+VXbThRUxNOoJ7zrJ6tGijbNgJ7BZRd9rNncJIvAnHsj2yPdQQUh2Lbf1tcm5kH/xJnbyTnLuMkQenyVAcW/G5U7vATXFvSE8zUEwcK85Qsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=eBNWvaPj; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="eBNWvaPj"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so263521466b.2
        for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 02:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770805668; x=1771410468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=roAcgFRbH54UQCdhIFxSyx+KQ1p/KfSb2O/TanFU0qU=;
        b=eBNWvaPjb0JiecfddRXAc7G5d3raSV7PeD98Gyn2iVple2RkA/GQQcXYinN9U3ZK60
         uH26uaBXPUTT5LLUa3sKELJpA70xqTSgp5MgiGXd/Jf7BFrtmVTspBdASVlvJ7TzqBw4
         QtP4pgFD7pPsXn0GPkkyKbenHKzjKZ4Yhzd7wNKyfrrfFJyMpb/jsbvyGC9zWKprlwK+
         qG7fvrNPFV6aFuBALLokaZ01ighXCBnMilUGcXcGFg/FAs6BQeNbK9+tkhqB1a4Nj98+
         zZqlRx3uHQEEHwFzhepX850Qv1qVnZKpOZD5hCs7Wvav9RiiSfsplVW9XuRNwzdAnEWt
         aloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770805668; x=1771410468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=roAcgFRbH54UQCdhIFxSyx+KQ1p/KfSb2O/TanFU0qU=;
        b=KPXX3fVl8b+MsD0gZY2wA/s71TQWgbIhtCSxgVtiVQUzbmLlfri5L9st67wyrMuP5C
         nTdmkuqfwW1v9gOv2xGLCLq58IfPHxiFG3ImKk5jkSkjM42u4bqCpJGeddaERWCLTnH3
         pB4eVwKoWBL3JUEFVIRe6WHL2vjMb+Lg5GXBPbefFEPopxTeAyxrN522ZnaD3fabxyeI
         wkBLh9jtiRvZ+qQgs939IuHkWKO2Z3P4POSn8OJLY6h5aPASxwTJc1bYsXTpQSV+4dw1
         k2Ni3KdGZOZaEFErJZ3ejjx5gWgOv9xHi3FazpRU0g3h1Oeufc+gXGnuCFVzeodwF5hE
         BEIw==
X-Forwarded-Encrypted: i=1; AJvYcCVYtMvmnAF3qoRaFYRhKUNeCtpnY2H5vjT4nRjffz0dvCJXHc6FoHihsmeQA6w9oYip+RnGTT+VkiXxkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuSex3KngLPjsaN55vJaP8IFUpNpTg43v/sPTVJr+V7nXG3exc
	UuWrOYZWDU4hsr7r/TfBeHz0BefMCVothzNohxZZA2pz1o67uDwk80ho3WU7qZo8P4M=
X-Gm-Gg: AZuq6aJF1ei+usosbQRicyqpGeiDVBkCf2SFPVTJyfZ8gGeHSC9zyRsCu307QEYtS1A
	koSVtG6UZaETZ+v5ieKRRWhckrsl7UdSUbYy0SpDHug8nKtQj9/v40j6LuzGkvt1/T0VE+W/Eql
	aLlGRbgOft+t841q8cXixzPK9viwzPuOCzwCnPLftn6wNqCDbvUd0O+9WTObvOij5BGF6ddMHOT
	9vZTM5IAoaIR3QgHEKOq3vyuN4SAALvN6/kPijub2TnyNrx/S2OhBCjc2fBu+mAwIfnJk05up+1
	sXqWBV1LtwAtEuvfcfaLoaBvlIc3ePTt8r7QCEFnEJUn+dtx7DcSXDOYcMiL1O9uT+AuvzLZmV8
	nhfIil/YgDcoGbUWNGZU0c3yZVnf/br2kK/WmraPauXzj09J+ASeOv4uzPxRpkZPkdSRY9yuxUs
	anQrO4+K+CasVb2EWahPXsDzvcY0vnHDrHZkf0QAS6+xkY+mjWMXKtSppjnT9nZAXIgI6se/Z/e
	pJu
X-Received: by 2002:a17:907:2da3:b0:b87:117f:b6f0 with SMTP id a640c23a62f3a-b8edf34b385mr1105176666b.30.1770805668021;
        Wed, 11 Feb 2026 02:27:48 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ec54925sm44296266b.53.2026.02.11.02.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 02:27:47 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 11 Feb 2026 11:27:32 +0100
Subject: [PATCH 1/3] ASoC: codecs: aw88261: Fix erroneous bitmask logic in
 Awinic init
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-aw88261-fwname-v1-1-e24e833a019d@fairphone.com>
References: <20260211-aw88261-fwname-v1-0-e24e833a019d@fairphone.com>
In-Reply-To: <20260211-aw88261-fwname-v1-0-e24e833a019d@fairphone.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Weidong Wang <wangweidong.a@awinic.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Ferrieux <alexandre.ferrieux@orange.com>, 
 Bhushan Shah <bhushan.shah@machinesoul.in>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770805666; l=1451;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=O64Bv8tsAMjygJxOqAvbghMEW/OID2nPg5aDiw2JAmo=;
 b=l0mAytX0jWY9agCYFNdGfdJiZxt8eXnq5o9t+chjtb0Ha4Ns2Dqtmh2hsvZEVeTEU5UJMmnhX
 Uf2FjeO+lv4CgGRjzILPv7NFFMjpNQgRuysz98NogelOko4HSWnqU15
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Alexandre Ferrieux <alexandre.ferrieux@orange.com>

The aw88261_dev_reg_update() function sets the Awinic registers in a
rather nonuniform way:
  - most registers get directly overwritten from the firmware blob
  - but a handful of them need more delicate logic to preserve
    some bits from their current value, according to a register-
    specific mask
For the latter, the logic is basically
       NEW = (OLD & MASK) | (VAL & ~MASK)
However, the ~MASK value is hand-computed, and in the specific case
of the SYSCTRL register, in a buggy way.
This patch restores the proper ~MASK value.

Fixes: 028a2ae25691 ("ASoC: codecs: Add aw88261 amplifier driver")
Signed-off-by: Alexandre Ferrieux <alexandre.ferrieux@orange.com>
---
 sound/soc/codecs/aw88261.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 29b3fc8a1ea4..43c03d3cb252 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -424,9 +424,10 @@ static int aw88261_dev_reg_update(struct aw88261 *aw88261,
 			if (ret)
 				break;
 
+			/* keep all three bits from current hw status */
 			read_val &= (~AW88261_AMPPD_MASK) | (~AW88261_PWDN_MASK) |
 								(~AW88261_HMUTE_MASK);
-			reg_val &= (AW88261_AMPPD_MASK | AW88261_PWDN_MASK | AW88261_HMUTE_MASK);
+			reg_val &= (AW88261_AMPPD_MASK & AW88261_PWDN_MASK & AW88261_HMUTE_MASK);
 			reg_val |= read_val;
 
 			/* enable uls hmute */

-- 
2.53.0

