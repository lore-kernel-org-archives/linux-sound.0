Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3529A47A895
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 09:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934599; cv=none; b=M+p3DzmUkmwBUlHS/rydGfnuTIIFMMsyo7pLipvPJ26zVHZvD86XIC0rK2+m9fYJ4wlSRKJmhekAMXonF97OEY4g2STbJWPt141l4peaEZrDAk22v3quSM8dtF0pabplIKF13mnAhuMLtH2fvEs0txoijDE+toADQxsTCuSx4Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934599; c=relaxed/simple;
	bh=3lOlktFAqnyOdTTnxV1RDi3COlBrsI3NZw3sXEpqQYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SJZCj6TL7Wx1r13YRuSV5RHobDgol1UtM1R1Tam0AdzcK7Lb9gH1/PZCukbPI7AmwG9cy64A3EcJhXsTSw1AB8VA0BioqZ8Dep5PNuYaC0jBRFZkEK4ouH78wSTu4f7yNOIzqm1BwK4YItBe0HaL8tSHabzpKqvUU7vf0sTNOOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=p1tlOw1+; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="p1tlOw1+"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b059eae96so1730466f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 02 Oct 2026 02:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790934588; x=1791539388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zwpDabsocINC12W3N5eBh0bHuZzo2UoIUzRt8IiGg6Q=;
        b=p1tlOw1+jSEtCEh3ol9yZdBWpUt0lygal/yA4Dbyivo3/sU8/UmEDahI7OPt0yIq2n
         0h+mo3Ff0RuFwfAZ/MXeDdMmJY3Ufzybkw4skpe8fAf6S4NiRJKTnJdKg03otGkwSM41
         cM4hlMhGlR/50SOFlVBTnYry4QkthrOry1jlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934588; x=1791539388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zwpDabsocINC12W3N5eBh0bHuZzo2UoIUzRt8IiGg6Q=;
        b=naG0vB91d39zdsckui0Y70a0Q24dIaZG4mZdaYRGhefU+k60fL7pDd8B7eRMZphWcp
         Z/rCbVrLDqbV2ufJsZPdUWXQdcnGjufNtc5CWKcGB3w03Kt+2BFIvY78ox5tXgL7jmyc
         KrjFlxKB/pRBTr6dkYzX312T7JiMDLh2+fUF4OgW5yuFWI1zB4KMMuBJbmC2d3mMfEtu
         +BdUKoJbwzMHYn5OFveMSwb9vjPSWKII9UVon0oSpJ/RGNH1SYdG12y8cqz6T1RyYvWS
         g2vtCKaWVii4B5q4j13cJVAG7PTUe1JKldmmiMmwO2HGSRn3eKHNr6n1cU8g0AE1EF4T
         9p6A==
X-Forwarded-Encrypted: i=1; AKwUvBxH9WP00Z6xYaYOUK8meeco8Q4G/63jIXEeV7olClrUHsDPvr+sDBR6v18tFy0ltkxlSZ83I8f55QqLsA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLn9yGqvFQM+DsnLThv53tRRLEPCbIGS22C2RqCqujT+MxAyu1u
	xMrwTXm2hf1LiYZEq2ltAm9ex+lhBZXO5BpmiRpvnqpFLsAzyiF1ZDQp/Xrsz4UwPwQ=
X-Gm-Gg: AYBFou1MTRjmYx5zaQhB9OITCDR+MDm/bB/5WCP81iKfoqAsXq86IBxscKTKNFnmIlu
	A7jevA62AwDJAShwYLs81KuuyOOx/yj1SwkUYIF4vUaA91TV1jz0wZK5e5jJuB6PHw75W6KM3HF
	xBBEC8oYWoidto7RMopAXGlHQc04WVH/W7Uo66lued9ZOpnC3NHW6/5Tdtn/JubStYrzf1k0IlF
	zFUWnuY+7hToSOiVRPh83a0vbWtdmP918II80qvgUEhxda+ATkZ9nBRleFJOBzIUW+25uiD4V8m
	jur2m3T4WoeOz+TgHJak+85pJdsj4xJqSTgBBZb33Ir0j5FqrnjLgP1PLgfqrHG+yiqxhvCGqjE
	AVaF2oyWztHzJp4/Njax/+AH/082uVppVUD+xoCn5g/RCu1eCR7xdr1ACAYCeuFOoKx/LXuxPJl
	sTSWrlBCECtEAna1fAowUXu41oOq8L1Mk5SDunjwlZPK7mxnj+PGyU05Z+TESvGh9ibyb8ar7g9
	JxCekrizJjsDA==
X-Received: by 2002:a5d:5f8e:0:b0:487:bcc:2c08 with SMTP id ffacd0b85a97d-48b1271cd1dmr3972478f8f.14.1790934588564;
        Fri, 02 Oct 2026 02:49:48 -0700 (PDT)
Received: from localhost ([93.90.163.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f89c3sm4149829f8f.34.2026.10.02.02.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:49:48 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Date: Fri, 02 Oct 2026 11:49:32 +0200
Subject: [PATCH 3/5] ASoC: pcm179x: Add left-justified formats for pcm1792a
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261002-work-v1-3-f0e53bc7331f@amarulasolutions.com>
References: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
In-Reply-To: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Peter Rosin <peda@lysator.liu.se>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 asahi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>, 
 linux-amarula@amarulasolutions.com
X-Mailer: b4 0.15.2

The left-justified format is supported per the datasheet, but was
missing in the table.

Signed-off-by: Roman Smrž <roman@amarulasolutions.com>
---
 sound/soc/codecs/pcm179x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/pcm179x.c b/sound/soc/codecs/pcm179x.c
index 61b87dab3266..c059e410cbbe 100644
--- a/sound/soc/codecs/pcm179x.c
+++ b/sound/soc/codecs/pcm179x.c
@@ -75,6 +75,8 @@ static const struct pcm179x_fmt_table pcm1792a_fmt[] = {
 	{ SND_SOC_DAIFMT_RIGHT_J, 16, 0 },
 	{ SND_SOC_DAIFMT_RIGHT_J, 24, 2 },
 	{ SND_SOC_DAIFMT_RIGHT_J, 32, 2 },
+	{ SND_SOC_DAIFMT_LEFT_J,  24, 3 },
+	{ SND_SOC_DAIFMT_LEFT_J,  32, 3 },
 	{ SND_SOC_DAIFMT_I2S,     16, 4 },
 	{ SND_SOC_DAIFMT_I2S,     24, 5 },
 	{ SND_SOC_DAIFMT_I2S,     32, 5 },

-- 
2.55.0

