Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6BA18FA02
	for <linux-sound@vger.kernel.org>; Wed, 10 Jul 2024 11:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720611584; cv=none; b=G8T8WuxPhu+TL7pW404R1QnxMrMR0PSjCPrMhpNxmPxYVdHkPkAd+AW0+MDrI5w3AlngeXr8DTWEr8NlG7LnvslGrOs5Jof9KrCNpvt43spYbbtUDtXaTs0f6PSzuPeFqcbKd6AIh5rZUbWXy87N+e9l6SSV1ucM+ZElBd+9kOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720611584; c=relaxed/simple;
	bh=Zi1bu+0mhBf3Hk6tKFUnpbpzDHk75+uCDG1w0Ixbnr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LhNVpgXmNpjvLXhBzSSCsV0NwAE3Q7tFMAQUCm6GpT6S5MlsWCPFXSDoWB+PUKDp2qPdtiCamJW3pNoak7PCwwgpxjBgyQaL2qltM/eyVmh4YBQpuJrByhBiYZUiXVoMntE5REtxSH8BF/rNE9NwxVWITMbqnSm0b98W90TJL2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bf3zF0lr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bf3zF0lr"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42579b60af1so42918195e9.2
        for <linux-sound@vger.kernel.org>; Wed, 10 Jul 2024 04:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720611579; x=1721216379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MHKc6WWhLmwAuWzJd0ksrdeT5LunJAc73Qa62Pmp84o=;
        b=bf3zF0lrAjMZG1XAs24vtGv3b9bZuWMLPwMKZuSrq1Xxr36q1+GbV78eKuKr++b2Mg
         QBgfvn2JAEXRvZYwpARsYzalMtzoXYw/i7fJOuGc6heO7IZhiX1zZs398a2yUNIVpp06
         BttZdjuSQxBKg/u1YGsxbTwO3yAv5Jj3j8B0IT2qQk49z1mzAVBSO8PPdkkkWvZe+jmw
         HKoMBbUk8Q1fwu0lc8DFwDHhxCLYNA49dDswu83OGjre98U7jcEFe3SSR5s2zxcfmWAC
         Vu8ISbLWif/FBJZiqBq4LAfQXGyuE55G0Dcpi1tmTi5zHCy5vODxjNgqzWDuP7Ff76iF
         PQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720611579; x=1721216379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MHKc6WWhLmwAuWzJd0ksrdeT5LunJAc73Qa62Pmp84o=;
        b=lNyxq6dzak2dwKeM/yP55CAwzx/ZJNwpU6pkhyQL34LUEJTIXmBb/aRJGFYr9MrDQM
         mgj+F+lJVh5fADahky1+5h+D8evMIIioB9T119spUBgT7QXYTr1rp0kJFc4+8Lq4M96l
         T27kbc1joZxs/uRIGK7DqFyU+MLJojCMJUtOoe54ZD6tooQqfno/7pJ+tyFf+XnmEh0M
         JJUWTIyUiSi08M+kyOWbPAd8oDUYTSCn/QKjAnaOhToeKp6gctUPcLtN8Tu1aBCgbMGd
         OEJr77AWA4+ARS4anVi+F93n3uvQwc2e6pb0+ypP+h8u4lOF72fC9W1Kn6y55v5gHohh
         tkmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLL4v62btIasK/cID93DSNRbt5i6JHdiRdGhzkCy2bYoanXCXg19r/NyYB2elxYadwCc511Iwjqnjd+LWvp9SoZmNnjkPio4LL1mg=
X-Gm-Message-State: AOJu0Yx8zdGGITSv66TjvewREajfrTqHyVH5pl4m70Z3pWHtEAbFHHn5
	SkVdfsS8YLmY3j2szcd8dEzK9wNNqxsbiaS7myeGNs13LWiXFB8uG9zj+RUvPXNlR5/r0HLPtpc
	a
X-Google-Smtp-Source: AGHT+IFHYPwe6yZ9R+JtpGuu8hlP3VMdv3GZsmSGlWY6ENZv3HqEopDNWzX5jjb+nxuJh9OPTx/xuw==
X-Received: by 2002:a05:600c:22d3:b0:426:5f09:cf57 with SMTP id 5b1f17b1804b1-426707e3445mr33231125e9.19.1720611579201;
        Wed, 10 Jul 2024 04:39:39 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f7361b5sm78602875e9.29.2024.07.10.04.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 04:39:38 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: devicetree@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	alsa-devel@alsa-project.org,
	Banajit Goswami <bgoswami@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 0/2] ASoC: dt-bindings: convert qcom sound bindings to yaml
Date: Wed, 10 Jul 2024 12:36:05 +0100
Message-ID: <20240710113833.39859-1-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,
These patches convert the remaining plain text bindings for Qualcomm
sound drivers to dt schema, so device trees can be validated against
them.

v1: https://lore.kernel.org/all/20240709152808.155405-1-rayyan.ansari@linaro.org/

Thanks,
Rayyan

Rayyan Ansari (2):
  ASoC: dt-bindings: qcom,msm8916-wcd-digital-codec: convert to dtschema
  ASoC: dt-bindings: qcom,apq8096-sndcard: use dtschema

 .../bindings/sound/qcom,apq8096.txt           | 128 ------------------
 .../sound/qcom,msm8916-wcd-digital-codec.yaml |  55 ++++++++
 .../sound/qcom,msm8916-wcd-digital.txt        |  20 ---
 .../bindings/sound/qcom,sm8250.yaml           |   1 +
 4 files changed, 56 insertions(+), 148 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,apq8096.txt
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital.txt

-- 
2.45.2

