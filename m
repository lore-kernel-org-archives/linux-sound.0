Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29C72F12D4
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 02:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775360; cv=none; b=FeGEiWioae52W7tR5hBXL5+aQiF5E30U9Uux88kGhnXIHIoHIBi6WExJOehlzk0Tue1L3TFSrwurWt97/wPeNAPF5KaKCPJfuOmlHKupD6zvewUCTm64qobY/YQr+uaKOppPEdrq1Dt5nyjFVTIKrG5H0NgwlI6abxN+zVLSNnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775360; c=relaxed/simple;
	bh=7qSLRPQU7D7s9zMby+yRBewosfp6zldKthQykZjW0Lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UD301JtMP0ltwPQJXO6KSUXHPoJYQTOj8eiUJkd+P2JCB84D/XF5FbF0ZnzYfRh56kmk+s2mnEcuHn4u792f9lJ1/oPBQTZfd4/7rf0YuiI2+lRvAfLpdu7w4JogF+CNQv8nLAIVVumD+N7tkHQhAJ7PHuxTM+p8rkIwqdHzO/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jv1kR6N3; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jv1kR6N3"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8cb1c4679ebso209794085a.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 18:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770775358; x=1771380158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyuqweM7CIcr8tGUpS73TaJBp2mA+Iw0vgZfHt4KGyk=;
        b=jv1kR6N3zT8CGB7/JPnSkIM9wcKymrmcBlOA7xZzzO6wd3cNA9AyqeZgydsvO6r0PJ
         SJZLVmVO5DdNRX7ntu665qkT6py3UVHC8lpcC/xvoPJE/ww7+GVM7sDyapBUKhFdwqoS
         lM3dYC4WjOcki5UphmOIEkCI4rfVUAeNKeQK0fsoW4E+llpf11cJW/b4ZElSZrSMNkJd
         +Qiflcd6/lDNDCi31ALRJ7YVJts0S5wZbrvjCQ7Pg/xuxe7KaMK5QngcCJTJwKUOOGlP
         fyY2E+2Q1I4VQye18Itm6EdrRWDzVzVrwwjuNLTUmTjpGlP7WnjkUfIqjJW8YUHejDuc
         fRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770775358; x=1771380158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iyuqweM7CIcr8tGUpS73TaJBp2mA+Iw0vgZfHt4KGyk=;
        b=D76C5UBUeww/K7V9cr/Xzm57+MKxe/5SOJgNU0RwqjV1Zu1AeOkkZ8z8L+ZKFY+Ctj
         Yap9mfAdBi1V+kgcHpZQBE3FkIoPR1IAadG8/paSbXVppMtCLVrQkULJOJRJ/2JR7A/Q
         EJufstHN8/4kf5wLfNsZ7P/ScSqjIxlNkEuSM+oLOF9d7g98JWv0OGqD8fQwoRCoAvmh
         yFcUTwgL1b8Frpl9yHxhGtHsF+hEyOB2rQMsuqm/WZToTlb4RYJ5omT2zPB7vm/LdHy+
         x791lqJJugs78VOYgaGi4VrRSGDJxLQXy1mqDV6Py1no2Wl1P62Z5HIZhcKNcWbFSwyk
         SeKA==
X-Forwarded-Encrypted: i=1; AJvYcCWSGvoIAcuO9l46a1g0FWLai2+weZDpefx5wicPxERFlIm9YzzX2B7RK5BRhFCgPl3riHTlH8dZuCaOWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFy9q0Nk7NqEW++I6wv82QZILad6KrRTpfdyOd/pPG35T+grIa
	xXcovANQZVTNgOOuIM6ieB2FyUwMogYnxGOMRWQ7LcpER0z5tgqDZ7Fu
X-Gm-Gg: AZuq6aLyFp6o5yn2naXGHN4mdTUPs9wdCUyhSal3TLjQ77JtXEKvodv4nM//T5ddylV
	H2ln7RMbs7oeTSA6YYdqHp9AOaoDasqrzcSFv8wfxKSMXOyEshLN/X0ailiNWkjUBuU7woeASe5
	MmeqX1djv/okIjaVI50lN7dRUN4KAh7gNKNlNp38LvKmHE55/WAywaAFeSZhZFsmRlpueaM1z/0
	el4fH/vF0s+YnBAvWBC+BL428yLIur1ytlF/fIgW6TeUa1IuqsPHHogpPWwniGjyVKM9wjLbSDO
	QGAvhsoyB+ikRg/MbUbgnrTOVmxPpdT8JjE7Ql2APLLbpwbvXYvdTi9b3sG0i2pem/uvXka2LT7
	dLeYFAVV6vaMOBu+jdWcrvnlsOre/eT9CZ26NPqYqwXgKcwgVgz4JjpAStDIRhRtbqsffqQapYr
	e/lv5c5GVn11O6VyVP5bsRP2CkPFLbGWBj1ICSr7hfRoy1eE99ZnINkTwafB3EKQr+6cGTqr4UJ
	00r3iKfLVOpLD4=
X-Received: by 2002:a05:620a:1a1d:b0:8c7:fdc:e86c with SMTP id af79cd13be357-8cb1f64d2f7mr544508685a.11.1770775357740;
        Tue, 10 Feb 2026 18:02:37 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0bc8f5sm12002985a.6.2026.02.10.18.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 18:02:37 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 01/10] ASoC: dt-bindings: qcom,sm8250: add compatible for sdm660-internal
Date: Tue, 10 Feb 2026 21:02:53 -0500
Message-ID: <20260211020302.2674-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211020302.2674-1-mailingradian@gmail.com>
References: <20260211020302.2674-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nickolay Goppen <setotau@mainlining.org>

Add compatibles for sdm660-internal based soundcards.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 15f38622b98b..ad5add422c4d 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -44,6 +44,7 @@ properties:
           - qcom,qrb5165-rb5-sndcard
           - qcom,sc7180-qdsp6-sndcard
           - qcom,sc8280xp-sndcard
+          - qcom,sdm660-internal-sndcard
           - qcom,sdm845-sndcard
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
-- 
2.53.0

