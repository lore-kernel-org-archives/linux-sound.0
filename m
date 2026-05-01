Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EB140DFBD
	for <linux-sound@vger.kernel.org>; Fri,  1 May 2026 15:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649450; cv=none; b=QI+4rsBhSkaXgzJRrzwveoQVV3AxUiCwqLDSdQVV0QJpIfYBMl1cgt7bNbJ6sgfZqTUxy8nwCUsrnJRid9fTrzhkOkRqBCsNkCHMhneQbnHMHTZZHVxlo3iGCL8P0bUvT3Jtep5DXF/iHK5AsnvMpwG/1AY0noYqrDbMwI7p6mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649450; c=relaxed/simple;
	bh=lihiiTwPifUcAtDxUq5btFnr9qjxR7ME5vy/TYYPh8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N8PTAqNOwtdz+Xg0JOV/7b/JF5yPGUSmfyInefSJgx13Keql+oNZR/44zCekbyT3O3SAr9+gKrHMX+TOgzzncIEzuhi67wA8SaH9cDxYXzDj5MQYJ4qeqhCbitEqTLN5qJft6R24WIdQKOAn2+noNm8vs2VaIUomN0pSJ1fqPjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrxZ3reh; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrxZ3reh"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50e594413c2so12728201cf.0
        for <linux-sound@vger.kernel.org>; Fri, 01 May 2026 08:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649448; x=1778254248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSbjpL7+FS6L/5F7be2H7D2Bc6xGNNobMjYaVOSt09w=;
        b=IrxZ3rehaIOyFYFYa1HkvWu6k1YGC+z+JopwK6654nUFZbS3WlhWRsgAu5IW3OEolH
         KD4RULZO1vIxm06jm8FBG0VqieeXQxWxBXEDOYNEWx65Mbodl6No0huvmh9r7djPMeUC
         CzFshOjSvEm6g7dazL7vV7zJe5S1VMNVA79taD2of5W1w1lM5NPntZNtJWKNJ3xvsrVI
         XE+UjsfFXqLWanMU8t6Zq+JSRij55CqvnqeL3j80JZibA5Gq5CVZtPNJ/WhOuv1EPl+p
         pUBUC5azI3DnGmPk7u/lu8tIa1Q4Rcj9Vs1erlfAzxZsUUHpbBykEN4CXmKkkRBEIzZp
         YHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649448; x=1778254248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VSbjpL7+FS6L/5F7be2H7D2Bc6xGNNobMjYaVOSt09w=;
        b=m2omgoF7H7PLOQizizTqggw2376yHZgJTE6W8jh0xRqCoFRkRH1Lbe0R9iCE3gYwYi
         oraAVT9BQCg7eC2speevEM+FVk2KiaMB9s9hugn+HYnlA7vKGIKLRTiw086Yg/j7pQGr
         NQEfnZatQ5DM+DtWiX9eJlxqvkliDcgS1QeyBZDyzOxede5aM0TGyfwMzAMkqPnrfqj1
         yb12y1WGwAnsQL0++So+7YfS1LDBrmdzicKE4sxRjVEtweoTBKoOL4MJ3YppyhQ3cly5
         T31LO1JUBS030ONG/dpoHBvL3Gd2567n/e/UKbUDJy3bs6NerYq+6DuCnecng0TWB/UM
         DqvQ==
X-Forwarded-Encrypted: i=1; AFNElJ8H/ePVB2E2wIdlEtq4MMyR4IjMxLDr0Qb4Fqrp5cyDqb7ztfN4A3xDoKsBIF+Vk1PTHG+cMTOuIW62Gw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyct6wBqWMaHULfTDHl+fNhFeR1mtaYZZMyZHNCXKXwFxRyZqiU
	I54Va7YkG+m0Kg8PK0VBJ/Iz1FkVelGCX45c1xemORL8fHDOl8Fgt3jG
X-Gm-Gg: AeBDiet1S+r/+e3+y8X3biTCngMpdQYlRq2l6XWLlv8JuJNUiXQ2uC4A7zkrTiWae5E
	vcG6Kk8/PwYgqS9lLAmxttk+93DxQYBAFGXmz2R/a7J7m8EfJQabCqdlLu0Ozk+lkcMCaEx0sW/
	MwP5bk1AE5sUH5V3zEJG0lJ67atGaP56xNSNTQmm1rDtQVnfBXqPLCdQsDvKhuQhjavhjdJyXQj
	T7pZuuw1x3nvrqmviqIli7AAIUhKg90qPqnot9r9r3Yyc6/voP16FVChP83YcxeHhdVQYjOpb1x
	J7LMucy+O9xzU81o6FixhUeBxBKphLQsrDz+iu1N/YdUKfApnowkhy/mS4D/0wMiPb2ohlMDmo+
	49tZwbXyarmkVveHNrSz30rVNgp/tRD1zh0I2zCWUb5LQyThFMH7uNv+xgCFQnn02Gz0UtfSDy/
	3Z0j9OuSYnO5bMmLWIzPjlyejJeijCLSQIOZbw
X-Received: by 2002:a05:622a:5d11:b0:50b:2dd5:2be with SMTP id d75a77b69052e-5102d0f99bfmr68786081cf.13.1777649447924;
        Fri, 01 May 2026 08:30:47 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51043c1b8fdsm11833831cf.6.2026.05.01.08.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:30:47 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 01/15] ASoC: dt-bindings: qcom,sm8250: add compatible for sdm660
Date: Fri,  1 May 2026 11:31:14 -0400
Message-ID: <20260501153128.8152-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501153128.8152-1-mailingradian@gmail.com>
References: <20260501153128.8152-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nickolay Goppen <setotau@mainlining.org>

Add compatibles for sdm660 based soundcards.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 15f38622b98b..63c744524e01 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -44,6 +44,7 @@ properties:
           - qcom,qrb5165-rb5-sndcard
           - qcom,sc7180-qdsp6-sndcard
           - qcom,sc8280xp-sndcard
+          - qcom,sdm660-sndcard
           - qcom,sdm845-sndcard
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
-- 
2.54.0

