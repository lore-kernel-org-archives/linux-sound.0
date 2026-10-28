Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184132;
	b=cY2JZW3zsXRG4LrRTuFiyGBknFkMvotBGD538R9xYYLftdE7PfAdgoVPwyD1qcWROs2X
	 QW6t5w9t/IvHT2dvkyqf1HulfrUwWINfqnodz+M6W/sH+wbbR5WoPGUD6TJLbaPmAB+ik
	 Rvn0WE4XrYYnkGxArK7/AuGBNidUDAqhrgLdXl9g0/eHZvjwaqUgAHniKr9TWPAfdF8js
	 ItaTPWoGH0C3TjCwKaEJpw45taHkpD8KnTG3PxWDJnUc7h+uyizliCcNMeQFlWcLj7AER
	 Lnzv4z+0vSZnPj02ZeEnovBnK3L36uBYkVTzj4O59wY41bVrxNiVushs+6idC/KDt5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cjsCnXQG//ZZRkvM1fxbdTU4TNbSSVMoiWVOYZPqnMA=;
	b=39JDOXpNf5RQwf4u9OAEg8sBAaG4Kfzt1op/P3FWZwUCafeYjc1NigdojDSkH+LF4CUh
	 mxU+xXXHPSyMxgfvt0vLcrt8fss+FIzcAMnnAOCXP+k1IsgkYSdrBSAYaA30JxzA8m6vF
	 SvVcX0b1qGplOjgzS6PUCzxHe3ojAZDxl2axKKzHHBrpNtueH82duf4Jj0CyHpIxQ67rk
	 ljARZZoHRFok0Jl2QNV1TsF68ryQDI8dhoSx39B27VQZ7s/DpfS70AWjCTF0IAprqvrgn
	 YwMG8DcyA9yTnfASWLeL6epv2sJBX+P7A2HOpgZOPYXP8eA9LGylZ7sAZEfBWLeA+uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eo7o4w8Q;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0095D606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 10:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0095D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eo7o4w8Q
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1421833eec.0
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793184130; x=1793788930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cjsCnXQG//ZZRkvM1fxbdTU4TNbSSVMoiWVOYZPqnMA=;
        b=Eo7o4w8QpzUWMiuEDfFJXwZNoS5fj2JVLvIFGD0d3ckpdymIPIQQiXCNfuAIa2lKhs
         qblYC/UEviTgrFzfDiqraLmxvjr0GiTu5qUPXt9mrbeEsOeuTarNl3zg7AsHsxX6g+VW
         ycH5tk8RiTt3aFtqSoloVYXphT/8RK9X8NJ8qCJ0h8tUMO5kwZtZ92qLJ5uqr8P5LQRJ
         r84z8b+gCmPGLX2Nl17pVznluQJRTxSa6dxpkk8LQ9fIdViIHUIlfxEZJO9w7yEhZgf9
         CVZZpTL8RL8XUVgsgOXlU83e/ul1TMtb6epnDSJn/h1g5XuqYGDTQ344Gui8AnHmdyqh
         J2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184130; x=1793788930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cjsCnXQG//ZZRkvM1fxbdTU4TNbSSVMoiWVOYZPqnMA=;
        b=PNTF+E51mUz+uU8PIyy4JSX3gYtOkTTl5oMYl+dabAiYnhBWcLrGZR9HKDYKTVafnK
         6EOr4IUsJQm77YHRnm0iIFzIOQiMfL6CUD7fX64ZZAf3PrsuNIBHrEHRG89mKZZcj4aQ
         Mt0huM7vf2pPQM31ZKU1NkDqEUd6E+Kowy0dAecAs14ZhIDkQC+KhnbsPu5f/cmxVG22
         khC2e1T68NINAaQ2+eBXdX2d4w/XQC4VSo2rNuQpao2qgkBefm6KZlmpHcFp/ctFanrt
         gUR2xo8UC/v+tMHhjdiwEUuw9maANRzKNRrwPz/AwaucNnFPBgyONOdbnbvp1g7cWefd
         UwfA==
X-Forwarded-Encrypted: i=1; AKwUvBxOcUA0O5e2GdF9ynTI4/GWrSzqvVfNQewNwUjafh0mFB/3/by1075+S8CQTpKOwQDmSvHFL2oFa75iUg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKymhdJucxjQdQOoba+5hWtwq6X7lNvKbbxZJ/NlU15XTBImSM9
	mxpXUclYTgzzxPTVunSTik9tZvyJHSqyHUz1OFuCwrUOvhbTlHAUNDFE
X-Gm-Gg: AYBFou3IEaxywtRNGkEEECJU0Fhp2VvSPxLPCefsKigrqIdtp99a8C9KWOc4XmYDI6O
	T4Cf+BxREVU540BsUkvw5F1KQlPCxsRe4Kqe0VLMC9X4sSmJNlQ3ChfGjgbDFZtyIdV15p29RBr
	dkETXWn6KY2k65DuGyThfgRvCtSaCoOEv+Ckf3mWi6CUxvAoPlf3SrDxrzdWSeVR/LFKyLP9v76
	B40revu3BLwsszQZhfp2YzBXLUZcV25r7KxQezRaucXkg+NyRu9h21jmOjBw+hQa/KjHg/oYj9t
	8OvF6WtBSh9grnapby6xEYZj8Re6kN3FeaTpxj80npRAquKGafp/uxooASo9luXJggANKg2QP5p
	D/XTFn0FZSuSpNNPY6Y27Xi8hJR/Car36SHUiTYtgaP7FA34AeldhwHvbOxUB6W+DcMedZ+IyIK
	TASasXijYIJQ2+z2kx4BU39mxphSxILcZPGyyYDzyCp5bZ0LwMqga1GvEZTMRyTvQ5Dt43RYyIh
	NRm1F9qKAFlhxDTdNl3oTlwWyBuBaQOj41/eEy+CXwncMOtPpMd1ROonAbHalUbTgWnkj4WW+pN
	D7jb34mbeMLNz0A5FwNAz8JnNhbghpHd0c55tRjVRqMIKnLEvTXdHlt8jsQnb6/MWYgRPd7WYkT
	fDJFmECVEQca/mGIH/9kyAIH+L6WTztwh7N8SJdp1YajD
X-Received: by 2002:a05:693c:894b:10b0:36a:1b23:a1cd with SMTP id 5a478bee46e88-36a20112454mr2703372eec.9.1793184129977;
        Wed, 28 Oct 2026 03:42:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238da3e1sm7521881eec.8.2026.10.28.03.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:42:09 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yingkun Meng <mengyingkun@loongson.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 3/3] ASoC: loongson: Handle clock enable errors in set_fmt
Date: Wed, 28 Oct 2026 17:41:38 +0700
Message-ID: <20261028104138.26973-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028104138.26973-1-phucduc.bui@gmail.com>
References: <20261028104138.26973-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

loongson_i2s_set_fmt() treats all clock enable errors as timeouts,
warns, and returns success. This hides errors other than -ETIMEDOUT.

Preserve the existing behaviour for -ETIMEDOUT, but propagate other
errors. Also clear MASTER, MCLK_EN and MSB on the error path to
clean up the controller state, including when the clock provider
format is invalid.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/loongson/loongson_i2s.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loongson_i2s.c
index 0d5278203024..438bbae0888f 100644
--- a/sound/soc/loongson/loongson_i2s.c
+++ b/sound/soc/loongson/loongson_i2s.c
@@ -185,34 +185,50 @@ static int loongson_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_MASTER,
 				   I2S_CTRL_MASTER);
 		ret = loongson_i2s_enable_bclk(i2s);
-		if (ret < 0)
+		if (ret == -ETIMEDOUT)
 			dev_warn(dai->dev, "wait BCLK ready timeout\n");
+		else if (ret)
+			goto err;
 		break;
 	case SND_SOC_DAIFMT_BC_FP:
 		/* Enable MCLK */
 		ret = loongson_i2s_enable_mclk(i2s);
-		if (ret < 0)
+		if (ret == -ETIMEDOUT)
 			dev_warn(dai->dev, "wait MCLK ready timeout\n");
+		else if (ret)
+			goto err;
 		break;
 	case SND_SOC_DAIFMT_BP_FP:
 		/* Enable MCLK */
 		ret = loongson_i2s_enable_mclk(i2s);
-		if (ret < 0)
+		if (ret == -ETIMEDOUT)
 			dev_warn(dai->dev, "wait MCLK ready timeout\n");
+		else if (ret)
+			goto err;
 
 		/* Enable master mode */
 		regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_MASTER,
 				   I2S_CTRL_MASTER);
 
 		ret = loongson_i2s_enable_bclk(i2s);
-		if (ret < 0)
+		if (ret == -ETIMEDOUT)
 			dev_warn(dai->dev, "wait BCLK ready timeout\n");
+		else if (ret)
+			goto err;
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err;
 	}
 
 	return 0;
+
+err:
+	regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_MASTER, 0);
+	regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_MCLK_EN, 0);
+	regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_MSB, 0);
+
+	return ret;
 }
 
 static int loongson_i2s_dai_probe(struct snd_soc_dai *cpu_dai)
-- 
2.43.0

