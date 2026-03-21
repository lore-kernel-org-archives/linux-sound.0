Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E76175A80
	for <linux-sound@vger.kernel.org>; Sat, 21 Mar 2026 01:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774056039; cv=none; b=TalSlVZGhoRiBhr2y94IZhi1FJs4lrP/Fk028kL3eMwTL9qk3UCsnoxtnzmGJKzcS/JVFzz4mJjVO3tjNulR+qZcAhWpC+rOmLufGPlTvWHT6amXZKA9H8Z4YQRWjEnYLaQ6g81CSPqFQgxCec8IqPt3nG7CI/arbKuY4IIIldQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774056039; c=relaxed/simple;
	bh=7GrLjUidNUXQd+M+rjH7w+U5i+fbFzoPONRrEBEyly4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tHzSgeFwjZHBZfMyf78VtTQtkJQVq+Bvd+LbGniVPHdtMGJcqRvMD++OX28o1gyo84G8SfmPIXiPuyVVzK6V/f/ps2pBufFvf6RyxdrFK8pL5SwPj9Bfb7brnWOYVyYOmUBrywxXrjwqmRFK4vnNX9gqDZBCAZ9ghgYkfg/X9Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DiFNXBSf; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DiFNXBSf"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439b7c2788dso704486f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 18:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774056035; x=1774660835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t13zBT/T6/lDXSt7yrtbcb88tX0zdjCe4g/9CVLLbBg=;
        b=DiFNXBSfdeJRuu1hxeB9Hpu4/1fZwjNN9CfvW5mVkd0BlQBKB3UsJNoe552ss9jKD/
         hM6pyq3LQD7NwT5SvCUNXxfoTcJ8xT827+xhPzEdMy1TcSiJySy+2+/jaB8WFxH+zT+U
         ISogz0pnPtiV7bCuQd4soQXdVEbBIug7UByhiO1krZGNMJqISVdLBgNCEAjwy5II9qvj
         YphV7brtTVDdJZnLP2u77O8z15NNVP4VtNFNohSjxopkanf6pmPUrbbkhw8LlPldGe0+
         dodXxgbd1955GinPTxZRLJZ8lZiRlPyNBV6RJ3+J2h6on92UBv4h5jc+21hnjS6xbOQl
         BLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774056035; x=1774660835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t13zBT/T6/lDXSt7yrtbcb88tX0zdjCe4g/9CVLLbBg=;
        b=KbiQS4FfFhWvELQjCbc9XmwE1NpABJRrCOnplSVYDh22p1Lnb765Jw1bODUPiY+l2p
         l31tGSZZ5Z7Tu7GMp2VWOZuTWmYl35hI/+eUsRkfGRvXCJsN0uIzKL3TCSDDZkJUCuzf
         dyyBeDREUs3CNY6kSdxUobz81x8TNZL4n8DkAh2s8AwjC1xS5zzI6Crdy41TXj1+c99j
         IEnoX134/R2fMKXU/5wQLKRZsLE8zyDEbyH4sFTEaNXKo1UwW2IwbW44NFNo7fPDKjSd
         8ZZt5Ywx3OV9Tr2whL3fuTJkZEnngaX0GHGUA7OFMZW/xvRzecj7SCxEorIeIavUhGgi
         ydpw==
X-Forwarded-Encrypted: i=1; AJvYcCXdHZXwt4yobWuq46yZb5AAIryEqvQIi5vNNesnFch6JhQfPQMfNbKFM6RE3yEZPzL/CnYIGmGuFPJmWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3POzZ3IgWxq9LaTwmCYzb3q3cePeHZanfTsPiEu4cbZ7VI/bv
	okBz6WjphCH2cQSKoXBNBqwyDtEBP0gTvmjQFjxMJL9Buoz82wFusJc=
X-Gm-Gg: ATEYQzzmy6HZo6VB84XtLb11vP5VL0mUOWZCh6BsTpoFY9K29pPZut+7ReSToIF31di
	7UyD7p6AEdmfQzF6urHz/f3Wuh3ePI2/9wA31k7ud30rcDZkjkD93vqZTl9F82dxPlVvH6YJN/c
	dJROhh3JHmdeiGt/4Op8EsHfM6y24Wa5LejMMVyA3udBGjtq4h/EKHf/HU6M2SnSl40Y1Jja0oC
	rMvTcC9XCSlSMAE7uOcjJZLBsstOF/3zAUmFb4gNEcEi7AyU6LG1md9HJngjJVzXlBCP4obko7E
	P+1KGnrbk46q5kz7wvftMZr6Gwj9dFoElC4CW9PNJYxushJGqd7Dzi28AmXVtsKgecuy9p63Cg8
	opHqDhoLWtffTgyybJNzI2kmh812rm1gFA9MA5tdgrW004gYQzeZdfEhIWFyFI5z80RYEapQ3Q8
	JTexDZiwxyRyYhEz0SZm79wBhrXIqpE7OBolTGmfIB
X-Received: by 2002:a05:6000:2dc2:b0:43b:6352:a262 with SMTP id ffacd0b85a97d-43b64286a5amr8476539f8f.41.1774056035153;
        Fri, 20 Mar 2026 18:20:35 -0700 (PDT)
Received: from localhost.localdomain ([37.166.81.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b647036e0sm11091605f8f.21.2026.03.20.18.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 18:20:32 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: olivier.moysan@foss.st.com,
	arnaud.pouliquen@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH] ASoC: dt-bindings: stm32: Fix incorrect compatible string in stm32h7-sai match
Date: Sat, 21 Mar 2026 02:20:11 +0100
Message-ID: <20260321012011.125791-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The conditional block that defines clock constraints for the stm32h7-sai
variant references "st,stm32mph7-sai", which does not match any compatible
string in the enum. As a result, clock validation for the h7 variant is
silently skipped. Correct the compatible string to "st,stm32h7-sai".

Fixes: 8509bb1f11a1f ("ASoC: dt-bindings: add stm32mp25 support for sai")
Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 Documentation/devicetree/bindings/sound/st,stm32-sai.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
index 4a7129d0b157..551edf39e766 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
+++ b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
@@ -164,7 +164,7 @@ allOf:
       properties:
         compatible:
           contains:
-            const: st,stm32mph7-sai
+            const: st,stm32h7-sai
     then:
       properties:
         clocks:
-- 
2.47.3

