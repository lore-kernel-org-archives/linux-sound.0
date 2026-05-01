Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EE63CFF5A
	for <linux-sound@vger.kernel.org>; Fri,  1 May 2026 15:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649570; cv=none; b=OxCG7d8WPrBF+ZcnUDDGfKDXxhUT1bpLkNxx8uqG7p3NSvj3wMVFXzd2x4Cm3iGLecek4rrpMKX303dtyuHL4YNVf0pwN/gh92UsKivbBPvsqmUZvc222Z4Eg0VpAN6cA/ok/1rj0cA/teN5nPRx0jW3hJIyT9z64Bh1qqLImRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649570; c=relaxed/simple;
	bh=TalITnoTVgN8hqSEly4krP0OENxfJ38rWqsEvppux40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Whm0HaYVvOOQgiwlXluAA8PCeWl91GA+RHC1RKEUNGGifiOPefxddY2LTX4I2Rh7JvYmYmAxBtbJ2A0EMo4NhHRVZM1MRG+IbRWo/NKcK8I2TLrCmj7wdne88KH3Uh6vW01iQxYu/W4VQsn3svWCv+4n/w6PZlRhB1/41UyN5MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qVFS7W5Z; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qVFS7W5Z"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8d67a483d3eso230282785a.1
        for <linux-sound@vger.kernel.org>; Fri, 01 May 2026 08:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649569; x=1778254369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EEuToxfj2xtrYU96bpcfJV42FkeZzgzuAg8mxxCUfw=;
        b=qVFS7W5Z0k/2wzxDPfDGo+paXlOv+BT5UgU07oavsmgzhEjw93fM4xnuyPQRm8hslU
         /eu4EVFkU1zosXlC6SyckfvYDCy2QcxEJJvCX6mdxtH3e/O0ZlnsrV89y01ogx6BFvb6
         a9EhzYUxsPsPLOlVT8ooT6ewvDRxUqRUCx3fCKk1VVy7aN5y+L0O4mEj5bcjG+1u4UAt
         F1xr/d7ohLO+3hwqB/JgIUze+oVua9nbGy2rbJCGoSxFIjY9emKtKkz3PS5KKIIBNYGA
         /IvWGbLBEhcy9kO6xYS+W6D4h7QJAyhGhOtrNmK05Fqn8McgXFfJpOWsbH+bF7TPVvR6
         QtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649569; x=1778254369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/EEuToxfj2xtrYU96bpcfJV42FkeZzgzuAg8mxxCUfw=;
        b=QKZXOj8UbfFVnQlTSr/hRbTGLCY7pPfLcGMwePb/aZE7CDV/M9OV0vKSYnLRxQmuPi
         CoGDdJ5atXrde26NeAOngwq8M2SFt5xgGRKVRsUF5DlzSOUrBMnpH7zOnMhy2s2i3bGY
         Vnm01xD9f+RheDpxj8FZ2zJ3w2pNr9ZOba99XavpavuUMD4s8w++qhl9554Hyr05lGwJ
         oUM0qktR3T7I8N6BEinsSBbmeaVycZ/XQ0VaY306YF6LciYpTKma3nXlxa1CqfaX6FQ6
         q5ywO0eqr3r5ihKEp98WDApJrCUgmM/d8uJXFpAn2xqC0dKH+5tig4xU4Vvl+I4jTKxX
         B1vA==
X-Forwarded-Encrypted: i=1; AFNElJ/98/3d1fLjVbz1qy7kCUh3wdJvKpLnE4oa+wwgglxGKSTl3oCtiuBK5/M2ou0xprcUKkugwjNqh1kXFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPJWnLbKq8tqq7jJg6r/ZhkIy2wwKVr4fKTROvP5QpPhygaWOS
	fgQKE/FLXHEeeIJiHgWzA0jXaFyDw3Y+kbWO5QDujWLEvWQ+9crFDJxv
X-Gm-Gg: AeBDietRSR6x+/S4qJ0Ij5geqZM//mnOeDaRxvBtPkuDh1AUBsH59oF6mnBr7vEPl/B
	3qDIL/bGuFBteTOyA3j7IsIWKY7JkC2ttk8FIhGWHU64OcBQKlFMW0gdyecPR85rcb8dh/Jc1oU
	s9/6dnq5t1Kgp95lTboRdfrx25qZlGFyCuONUTZhmlc/69pFS1Kc6EJIkmExyEDUEXYzPslUpr+
	1Qi9xZ9cRefR9yjMtJ3o+484iZfFDT8p5ICNSUjKinAICX2B6mNiCL6/JVRftqcXDWfiVsO0psr
	hpDeysOPMJtBa0Ge8iyIv9pSOSRMxJDAgtB7jmeHXqifrcmXr+2Yz9O3INm80IUecwNO3Nk/MuE
	gn6wI3FHrO6MPginOjcioQ/TkNyyfW6AM1jH3YdO7xTbi7LYcTUj3ldgBfs4qTEknPbtewfrT3f
	4c8lTsomod06zpQEDR023JzGfXlEiq6NQyDVU3XYgnE3i+ET0=
X-Received: by 2002:a05:620a:4551:b0:8cd:8a55:510d with SMTP id af79cd13be357-8fab1c4ef7bmr1029971885a.48.1777649568576;
        Fri, 01 May 2026 08:32:48 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c34a0d4sm186890585a.25.2026.05.01.08.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:32:48 -0700 (PDT)
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
Subject: [PATCH v4 12/15] ASoC: qcom: sm8250: add SDM660 compatible
Date: Fri,  1 May 2026 11:31:25 -0400
Message-ID: <20260501153128.8152-13-mailingradian@gmail.com>
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

Add the compatible for SDM660 and SDM670 devices, which can use the
support for WCD codecs connected to internal MI2S.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index b8f1c91725df..84898bfff7d8 100644
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

