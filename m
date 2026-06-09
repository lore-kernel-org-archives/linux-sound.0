Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B56407CFF
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 16:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022199; cv=none; b=qXSPw4G+KIwKpAzyLvaRDH99+dINNguVs46++Z+GcK7b8pSnYRzgIFZ88yaazbjhPuwr38J3Lf+ebFY1UQXI0on6X7hcN8XxG9w+/PqBXjF7krLdHtkHYvR64JiSlMWc22iohlfvzzn8tKCQq+67Y7eb1WlZC0wURT3RUOrFgR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022199; c=relaxed/simple;
	bh=6vUCGaF63VdoccYiTvUVMsMgGqYjEw34fYPFFOoTrN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NlrNqSC5Umf3ro2kx1l0qCST3byP+Vz/Wnt/NoJu/qjzXkeytytDTM1K0TZAkbuT6qR6KfNwdn6M6ws428NAz0ctmyPt/ODgWvzKYMGDiavLySj1gcnGS0Co6JYyz/rp17YK3Oe0LlShrznHqlckOTYF1iA5hsgnzoHcAmEYpLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sz/6mxB3; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sz/6mxB3"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8ce9df48e1bso56319306d6.1
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 09:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022197; x=1781626997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RrCuZ9cncdLFw2IWDk3WqZwfRxngglcAZOkJxY5zifM=;
        b=Sz/6mxB3/Aiwn+RWo8hr6rUsqZJ2+ZpqKinuccRffSvyPHIMkODGpCnUmjfj549Tcg
         qFF1pzATk95bQBL5qFUmspDeSvB2+PK9qnwvD974Ofb6q3JsXguSybP67nZLLPLEvrR9
         VCbSz+k5jb1ZCBzdFXWQUejsZB5F85R6d4QNtPPKjvIN8auTzmoXeBNUG8wj6vEqGgEw
         NWpU1hoRzedvFFQ55sjY6Q6cQtysVRbPTR3z/Qe8Dx8Dk/NpeTtIg7fKEQ6/KCOoOHOO
         yqodtPigILFSImSuMmTNxvuyUZLY1UyZ3UtyTN0AvgfGWvCWERATJ2+FESLm3MCqvLkx
         lgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022197; x=1781626997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RrCuZ9cncdLFw2IWDk3WqZwfRxngglcAZOkJxY5zifM=;
        b=h1KdCXpsJDRp7OwS3idVXnoc7J1ySV3NUdxak8FfOv2pArnhbLYyRq1SnisxkIFZj4
         nt90ya/SER8baDz3aaWno2Ar2xOMVB/4imSUmpobtexgs5eHcY0mfzrThBeluavY9kSl
         7jAG0HeQw4pdnrwfPsm6qmJMuy60zjgNb25DADOLQPPaqgL9YDoIXD5nGuKBt2lihfbi
         g/nfgMtt/I7GYB3NkOyfWN9W+jroJMhNGl+titD3vX2DOmzgLxpJlpk93eSfdNReZlU6
         lTbVXgxkoXtVI3PzmB0xrf5mVFEwgJHHsckr4nhZdIdJR3ofUeidpepchuY8Jdjup2Lj
         ioOw==
X-Forwarded-Encrypted: i=1; AFNElJ9uTFVr2U3oUO4ZmJRtcCi2VmgKftaQ6uV1sj/fnCBWR/r3xXMbN3bLeQq+hLMUZm0iy20KPsbdiID0TA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUTFzoOSYR8IiuCGey8f5Y5o11HOQfPY0ZGOlXUhalTQyBsJW4
	AtQNhyq51veCR3RhduPkKOnebfq74DcOcm6LE2L36BJLzmC819AoviiB
X-Gm-Gg: Acq92OFoLiMBArbXLLuOUugKmv22z1seIQwcj2dhF/GTNNrhQqGKH5HUUfMXPLhhppn
	Ui1S/HPV1l71FYukBdgMLMWtdVRGIEBLhQJDvV4Uf9d8xB+xyc4msh35waXgSUbCfDA0gtyRrMS
	0BHmDmNEEoy4NmE1D1igjFocPAOr9h3hO+TZN13ulHkwfj5xlBG3D0OkQDur4hp+ZXz3z59MGo1
	fvMimy8mZDMXRB/EN+cxBlMdHe94vPMIH5vC/gFwVPByV1Dix8f5PmEdbYUlEwmD5sat/R8m2o3
	BeAyYpp2Qo4leZCpED4PmyhugpiuDC7/C1bp7lCB51x3I1//7hEBEX//N9zCsRlARHek1DyIDzz
	NIf2fKReveAGfROabeK00p/NTb3hTFBBuvxKGTx1alV4GpkeIglNb1Qn1hKG/2RJ9EVEvGmmqx/
	pN6ejnsWABKO5DNgCehILhivg3e1vo2QFboPhF/AIPn/5hMb9P
X-Received: by 2002:a0c:fb0f:0:b0:8cc:f0b9:1f3b with SMTP id 6a1803df08f44-8cee5ff3b4emr249375006d6.20.1781022197371;
        Tue, 09 Jun 2026 09:23:17 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccda0904sm208055116d6.7.2026.06.09.09.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:16 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 12/15] ASoC: qcom: sm8250: add SDM660 compatible
Date: Tue,  9 Jun 2026 12:22:52 -0400
Message-ID: <20260609162255.31074-13-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609162255.31074-1-mailingradian@gmail.com>
References: <20260609162255.31074-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for SDM660 and SDM670 devices, which can use the
support for WCD codecs connected to internal MI2S.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 1952c599e004..76dc3a3f4a31 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -210,6 +210,7 @@ static const struct of_device_id snd_sm8250_dt_match[] = {
 	{ .compatible = "qcom,qrb2210-sndcard", .data = "qcm2290" },
 	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm4250" },
 	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
+	{ .compatible = "qcom,sdm660-sndcard", .data = "sdm660" },
 	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
 	{}
 };
-- 
2.54.0

