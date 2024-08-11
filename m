Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9BB14A4EB
	for <linux-sound@vger.kernel.org>; Sun, 11 Aug 2024 18:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723400245; cv=none; b=LLbxq+p83Vcz99Mm67donpC5pi7oFAS1sGZxrq5QsNIA0cHMyhQQte3G+rxnaGwryEfDWB07+s1L6XLx0de07LodPO0/1LOfLb1mUKbnq25NL+4Cn+0oGSMFhxuTAsIccDOUr1pYWT+PGLXwW4nDpOOpTZIboWrTxNmiYMKAecQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723400245; c=relaxed/simple;
	bh=o1Pg+WYSU+1aP3K7rSMBYgVoWMnaQYMrTTQy4scWqrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=its1uU4AP8SmwZHcGQnyKCetbbJTuAPuMzWc5HGGgbD6Zi6XQj1wn6E0lDmxBAGJUDopcsxB5EXJLcivtQtrSNMyE658x7LlGLSDmjEgIWubgqYz8WASj/DJe6TSKGf6AlexhkCmwdlXpcwINJE41Zo0IniW3MYQDvgeCnUgA+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t6uwhrTD; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t6uwhrTD"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52ed741fe46so3849298e87.0
        for <linux-sound@vger.kernel.org>; Sun, 11 Aug 2024 11:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723400240; x=1724005040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IeggRLrefKS4NRHp55eXF+21fQVTmgaEKucAb/25uG8=;
        b=t6uwhrTDMO8gHNCvxlFhlwTPxa84Jcj37DpHSFLojyQUwGD/HCrJKzKWCHgtudxopP
         q4Jfso+0IkCSZk8V6QWcrxKG2ctwu99R5rhWzNIWkmS7q/ezXW/k+v1w5ozs2XAaqb7z
         oHpZWjKp37vI/wboffofJpeEtQDfDPxQMpoTM4x4Ss1C8lq0mRwCA/l3TfM+wy3wbL7L
         RQ7XeqnKi9oWJvvzBfTgYZYwg24uydJEDywFBrMd648B7CMwkl+uMQpBtJ0OBd+KwWjk
         El8tQpzM2WCfX5DhpbI1kMLOyYRN38MEXPbYtCP63P7jmvCQz+TU38AEd6QTMoV4+ntV
         Sz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723400240; x=1724005040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IeggRLrefKS4NRHp55eXF+21fQVTmgaEKucAb/25uG8=;
        b=jO0uRCjgh69Dqc4fmtQHjDHsUNPQ8aa15OFDYS8eqk1SF82Jj2GO0CH4FrBrXQ9BeI
         7x3ErEOiV5UXrg5nUx9omtiQZ1DdB8gXjD3iOD3k/B4IeURtmZwTpT85nNfn9O/4gO+K
         ZOtBStWi559d39WHgwHwTDspNGr9plUpvtX6NbBRbW/w4u/ZtArTolNpa030z2YJHRQO
         PQJps8ehUQsOBRC2t+QzRjjcGIUGDVxXPQRD8laYm7sfFA9hWNF6b9VW5tASYAxzFbuy
         HbEBU8lZwO/TCz6VVfPRKxTCeAHT4DplZ3T3D6TqaOARQpQAgjs2yvNdY9Pqkjz68HVm
         oe7g==
X-Forwarded-Encrypted: i=1; AJvYcCWz1Vo6WmUuKHWZScToFZeqJwE5BjAcHVKey42TqloSEiusvVQiW2KWMK4oPMBnVmtASADBYnSmy5KjHIvpEv1BZ8PB3NLbnCbO1Kk=
X-Gm-Message-State: AOJu0Yw2WrPK+7RnU40/x2H3cUQEJwIMdewV3w4n/DjIgoFcAnW7JaBS
	vHhZ+Uokmw7l8HX/xH2kNMAbYxir4RhIN3teyAC0Qx9fD+9R72fh4MjhgctNYo8=
X-Google-Smtp-Source: AGHT+IGo96lPHtsUXjiRmEnFORtSb+OG6u30XA7cbQkXT2T8/BFuRGLG4MYUDVs7QheieToXGlwKTg==
X-Received: by 2002:a05:6512:110d:b0:52e:f2a6:8e1a with SMTP id 2adb3069b0e04-530ee9d0b5bmr5672768e87.29.1723400240286;
        Sun, 11 Aug 2024 11:17:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd1a6032c1sm1610593a12.92.2024.08.11.11.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 11:17:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 11 Aug 2024 20:17:04 +0200
Subject: [PATCH 1/6] dt-bindings: serial: add missing
 "additionalProperties" on child nodes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240811-dt-bindings-serial-peripheral-props-v1-1-1dba258b7492@linaro.org>
References: <20240811-dt-bindings-serial-peripheral-props-v1-0-1dba258b7492@linaro.org>
In-Reply-To: <20240811-dt-bindings-serial-peripheral-props-v1-0-1dba258b7492@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Johan Hovold <johan@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Daniel Kaehn <kaehndan@gmail.com>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=o1Pg+WYSU+1aP3K7rSMBYgVoWMnaQYMrTTQy4scWqrU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmuQAnOXoFWzTi2CdjfGUgn4ZzAkWR4980rKV/3
 sazBXuxtKyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrkAJwAKCRDBN2bmhouD
 17SED/4rdw923+Og8fvQ6box0oI2553Pq0Sy01E56fmyMW37SSXn72uzCc9LccCaq9xWSZsUpHa
 fGKKaRzDCArQZlxv+37ArKnHQZudrzWpvF5hU+PvVS0BwhaFdmcnay3X8u4D7HjbtY1zPl74MYE
 1vRbFIUvuomlKIgnkGtyqnS/qxhaKBSQhoo7QSy/c+1c7fYcBV1TWDfcN62O0mLPjfxxV2N3wMS
 IQsPCaUDtnDA4QxaORdzjUMrOVv0EsSdrlpn3cQBzG8GMyXM1bl9h5B5RU2lEa7dbiB1CdzuP5e
 Db1y2CN4fVQ77UFUoNz+YIfkmAKYkzLm6wcYRz9kxPiWu/ES6e0LhDOJl0EOQsixs4Yb3SF5oou
 MMemYJSH84VgCdaiQZNh/HpJq7awc5PDpD9NAxYNMvFE/UqWL70OGKBNNhuNRHtCQs96M2ibMNi
 IlmSDrBR6KXRWEnQJ8QJKXLoY0NL8wMR65VencMz1CZ5uV3N4PWs/UW0iPRJ4HTHYKn3HyJtsJb
 uY8ebPIDItug1xo4oUts4fmciO/Q4JKhli8C6ouFJvAfD2Fzc4RmphNm1Rc7jLwhUGtNfW4dbX7
 IVTs0ibDN/ne8F1QHDvrBcwq/2d+TGFLdn6+20WnjvTwRKkHqlDRnIQrtUXpaRkrPQLKlA8kXpn
 meevMgUeFiHveug==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

All nodes need an explicit additionalProperties or unevaluatedProperties
unless a $ref has one that's false.  Add missing additionalProperties
for serial-attached devices.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This patch should probably go via Rob's Devicetree tree.
The context of the next patch depends on this one.
---
 Documentation/devicetree/bindings/serial/serial.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/serial.yaml b/Documentation/devicetree/bindings/serial/serial.yaml
index ffc9198ae214..40e05dd37826 100644
--- a/Documentation/devicetree/bindings/serial/serial.yaml
+++ b/Documentation/devicetree/bindings/serial/serial.yaml
@@ -92,6 +92,7 @@ patternProperties:
     if:
       type: object
     then:
+      additionalProperties: true
       description:
         Serial attached devices shall be a child node of the host UART device
         the slave device is attached to. It is expected that the attached

-- 
2.43.0

