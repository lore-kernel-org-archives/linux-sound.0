Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5009A2571C7
	for <linux-sound@vger.kernel.org>; Sun, 19 Jul 2026 22:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784499325; cv=none; b=d6GPrJg7x9BzyzTMzVEmgINFRvKLXaxRzJmD3g9hAVgORFQJTpLb/iCtJJMBQ+gJc7bEidH+ZAP3cyiZXbMkYfr1iYivNdV/GSnmMUxtdcQFvY2olo1sZBOLkhxIZTpoWTTY4VklPgZSlrEgrOke16fuijqoX0Js6AFTgKyPfa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784499325; c=relaxed/simple;
	bh=K5QLJBlVZlJyzuK6tiOxRWSGYuM0Ur1hPF23qB26eII=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e8geutgE/YJYNqvF+vydtGOCjjqYS4REnbIio+NPWgHQ4nIxe3VtJQH56i048NkJjFnOEeKfHAPtSk6AY9HV9jzwSTXHkd/F577WGsh1bahWn2vGLNM8lSQ6HDWbqDZ+cUxEUfBqLAVgRQW3Oo5nugxRBmoWrRbvaMbBB5s5zNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAbymmqz; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAbymmqz"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-81e9f7491ffso118035737b3.0
        for <linux-sound@vger.kernel.org>; Sun, 19 Jul 2026 15:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784499323; x=1785104123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EW0EmOFlm0QORbcGUQp3/4dTd1faoV2ZpKSk/ONJWP8=;
        b=EAbymmqzIC1Jt93ImcyzFGquJNgyn9pvyQLEG+YBCWSe2aWOlB/Q2+OOw1lwW55buE
         UC9/aO2B0OJqUmvhGg5jFlytodp4AVt+QUMbu4/iDeFCPufFdEbe5PtP8otU3gx9y1d1
         g0UKZiG9jleYcl5fGGnCIFoJR/ZBPIxn0g61BjWxau+ag1dv8sXbwJ+3I6NJRt4XjQuO
         39LrOD9PO6BHiKLSdstSdyQYzssuIB/IglhPYLTMr2a4e8fsf31eC6hqFn+CVoZR1pK9
         fHB/Afkwh2kUtl/AvXojTjQ3VVqS2jXyWT3obueR7s0+Y4sLxMM6FKqAdkRAJ15AcEB4
         QtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784499323; x=1785104123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EW0EmOFlm0QORbcGUQp3/4dTd1faoV2ZpKSk/ONJWP8=;
        b=BfkauONRB8iJANwx1yioiCrhNFYTiwq3gCxd2v+wdbE3qKK8mD4PBbbcZhQ+AWt83+
         ggCHQvNsfNcxDHaWuLPM9kFdASwu/x3BCH9K8U5GrCpTj/zwlvt6yHy6CJe2bWHLZevQ
         Axl9lPVXMzU8nf0zKfWbiwO1mSeDyVfnnkj55sKyFKZdiVocpYNW+EMW875el5EiCamj
         6BbvwoHg4nbTVH0RAeHjQ110YjPS5KIpHmJ3ZcBF3YkA33yOEsVqjMC3+WBbkADkEDfS
         p8NeCn4gwO8rbICjNEUwPEh4pZtoApL92S0O9sXoiqcPw0yBD58pwd08ACZ88iduZj85
         d/wQ==
X-Forwarded-Encrypted: i=1; AHgh+RqIiXsM9+Io3gvm4dub8y5bGsrTItyeBmxOPieoLNFe7YYgVOQNjt59Lm2etAQSW+ipLFbxgfgHHO09sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwnPGVqeGNA0ouyN7OPFvn6Js2hvFBHWNzoONBD+4KtpIpfzEu
	e1Aw2iXBZgr++vboWiXMvVfFRRoyqqvdrNFbTcOtpy8UTHGuPUVoWXr0
X-Gm-Gg: AfdE7clkoNXl4xCBNHzwmdD447pa09yb2Pn6+spEmvTzZ6q9yivCgkhyU3ES6RRod7W
	fnx9VyYe+wF6EVBqbVAaQx6R+P3CHOKORP/MwLrP4stJWmiqKLYnfMLFL0NRUnSB3SGPoPP0M37
	PibXaV4FE2HK9HmFZmriTiCwdt0/1eyQJ01cuHUfj6vYheJYtV3cb0nxIM2mrXc7C3eM2XOt91q
	JQZa/q6auPbECSCoRGEQ5x34sB4SNhfPiGqC53cAEDaXVwTD9j9yEL+sMZbVNeTAPS2ue+Azs/t
	pjCn6qrCRD1/rh9bGM8kL3VuLRF9chJgCk4/IuDZkdlCA4Adb2NmtJ5u6C2wJk5W46X/aWaf7uR
	73onTvFkQETBeFDn98nSgsy8BwnQ95LDv9e7s54CgX3Dzp6M/a+g45WInkvHOYj0Tb3aibxz/Fj
	TAv5rVn9FrB1dg3xsW9u4AoCwh81u06PLZSX/X0PSAdhOxdFiTCWd0UY+4JpPrQNt2A9F/wHg5T
	d1FHAFHfjB89hlCe7dmlRdTIeDCx5My
X-Received: by 2002:a05:690c:e091:b0:81e:f8ca:110e with SMTP id 00721157ae682-81ef8ca142amr27852247b3.31.1784499323320;
        Sun, 19 Jul 2026 15:15:23 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360:d412:6d5d:4bc3:48b2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81ef42c5c84sm44027997b3.41.2026.07.19.15.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 15:15:23 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: zhangyi@everest-semi.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: ckeepax@opensource.cirrus.com,
	linusw@kernel.org,
	u.kleine-koenig@baylibre.com,
	lazycat-xiao@foxmail.com,
	kuninori.morimoto.gx@renesas.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] ASoC: codecs: ES8389: Remove redundant comparison
Date: Sun, 19 Jul 2026 17:15:02 -0500
Message-ID: <20260719221502.536804-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comparison (target_hz < 0) will always be false because the variable
'target_hz' is of the u32 type.

Remove redundant comparison and simply code around it.

Fixes: 87592da1a490a ("ASoC: codecs: ES8389: Add private members about HPF")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 sound/soc/codecs/es8389.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index 0c7567e2ffc2..80efce3e0a22 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -106,7 +106,7 @@ static bool find_best_hpf_freq(u32 target_hz, u8 *hpf1, u8 *hpf2, u32 *out)
 	u32 f, diff;
 	int i, j;
 
-	if ((target_hz > 1020) | (target_hz < 0))
+	if (target_hz > 1020)
 		return false;
 
 	for (i = 0; i < 10; i++) {
-- 
Thanks,
ET
https://github.com/sponsors/ethantidmore

