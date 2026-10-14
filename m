Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB35420E89
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 06:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959586; cv=none; b=dVlrrHcBAnqwfTh6pmuI+6eKECHj8w9H8HW1BFwh5oRhWlQkRpZI4bf7CXvLK0+FXP8haoJ0qSBI22ZFKqih0DfLO23tx2ecxKVcI1JMGymwVUhcd0zFOj7Pw5aaAGaeO5ZlheZjbEEhLY2FKkmAUkH7wVXroqCJdWDYgdt/iPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959586; c=relaxed/simple;
	bh=BU6CWfcv6QXI3AU+/mD2JVAE7fbItnDAw/RRU1VTZIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZlCnBHlR8M3G/Xkpw9JSz/BVVBF9xpstptWta+a+PFWRPnwrifHFkLnnDxvr0LWpDvD0qO7dfYV95U6v4vm+vFkCDebhA5UMoUNI/24om0DMxJkwTlRahyhCmwipUZ8JotjzozxGbEEcKaZUWGtEA1dhRI0Ngo4E+ysAKnSxRmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJnXM/VF; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJnXM/VF"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3a8adb68d8bso2654662a91.1
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 23:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959579; x=1792564379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+6hR4pI3uVUfiEl+bUNCAmL21z73/9mDvuME3Iv3GqU=;
        b=jJnXM/VFPhxBuGDz26RqdFlFKWFlLWIfV2DkUb6Hkz72CEO7W5HCWSMPLknI1ZAnHf
         pZOiyshkomgnLJ4y/Zd43xSdhcbbK+aafdhr7mMUkE//eQZhUuU6qZdStaxYGH6Tl5+k
         ebeJ1DiZUnIIjbPR8aH1ZepmvsipJQ/pM5sH2d3R0Cbh2LGzY8nKEA0KU7J6VJ1pExVo
         9dzgZG9PmDGrCWjjoOQ9HywC2Qv59sgYWFRvguVfjxvW76uxwAdmPlk+dh06zLfmxFPi
         yKtSSQfj3Q2I4xlYsaQxjlD32HKmIqw2KV87TMKq+D/dV4AUi/VpP8s1edtuTdw90iC8
         A4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959579; x=1792564379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+6hR4pI3uVUfiEl+bUNCAmL21z73/9mDvuME3Iv3GqU=;
        b=IYJOPQqFSCWZUqgivjBlTyZ3cPmVFLZ73XR/afj97p1jlyNOT/ffsjtbSD2FDamUIJ
         ljft0j/Pxmjj/nIRNeRuL4A8Qu+/qq5WhMuHHL/eUeVZsQjlxDAU7oNG6r/8I68grOUa
         iZvAxD1jo86Nc3txS19i3u7gYFrkeOKpMFKG1BMpInVFYCcxZpo7R24Sm0ZAkoTZG3ql
         5S9dNGsoYZDM/QjVuZJuEouxb54AGy8xUua/GfPcKylkxPlCnHLWeLCo94HTTy2g3W3/
         xaOm7Ldgq1Gn35ahCjonqYrpX+aOkOf8ZnTXSQfnWYvdH3qjP2IOtyaOx4BgiORg6HuO
         PEdw==
X-Forwarded-Encrypted: i=1; AKwUvBwAx8+SVHExTzLp+PuDyhC9tQb6Vk7haVewyD9TC5xm6sOy4RIsQcvN7AZa4ZXWh5ZcqKgKIeIEAMP0/Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYIbly8PAswDPKKEsuQR4Gy1IaGs6JMwkF/wOxQkpMq5OqM+Bceh
	mfooXZteINQx+dXFDLuIyqS+rsyDMOvF+cj6sDRa1X000vk/0cQS47vT
X-Gm-Gg: AYBFou3WrF6NQGwNzKkx238LiTMyG5Y9NB9Lyj98DQRVoZcJHSzqX98rDe8R+q8rRdt
	v14PkiVYE96cZFu4XIlwicKOwDXjySChNPeRpJYNRicxfETai+XycRVqNZpi73Ud4tni3Ueey9q
	mq+J16zpbBq/+iIQtwScqFitdNOC0Ul58JBxtjMppUJj25f3c33NFKqDoNWzhM5/elPn51aQzjI
	aPSZe00q3ualMnM+CXu5a1smCdM0xV5+MTNuetrmyvT8ksJUyKQZ2QVpd+QToBgKU1YeSjbVVkz
	TD1WPFTVVmTJqC8JiP2D+PkeNGUHQ9+oK5+1pnWEb95SNtjrzsVd+e4dEr0p5EbeQeMcYSckl9l
	EaNpL+F/M95JjK/QdmFIekOEynBhC3nTt5ArMtDklqv8Juy+2DDKhNzsn/p8vhyCrLpCSn618xY
	I/K2+LF8betNQCU9Q98Ot790IMqkoCYcmLJy9kye5oQgyCen6a+mzA+qDUTrCl+pBHiVe7HYuuU
	2LDdTZPsdpcAdLjA/+T78LqPqCARMLrI/ZJeLUC+kqLKSnpr9Lslmh+peo0Lmm9wO7Kx4hvcx0=
X-Received: by 2002:a17:90b:4a0c:b0:3ac:762d:79ae with SMTP id 98e67ed59e1d1-3ac762d7ca1mr683645a91.2.1791959579079;
        Tue, 13 Oct 2026 23:32:59 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:32:58 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/13] ASoC: codecs: wm8983: Fix definition of ADC 128x Oversampling control
Date: Wed, 14 Oct 2026 15:32:32 +0900
Message-ID: <d6a5bbab35e1fd2bec5b13d30951546080d493a8.1791959026.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791959026.git.sammiee5311@gmail.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ADC 128x oversampling (ADCOSR128) is at bit 3 of ADC Control, not at
bit 8, which is the high pass filter enable (HPFEN).

Fixes: 6b3860b0a20a ("ASoC: WM8983: Initial driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm8983.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8983.c b/sound/soc/codecs/wm8983.c
index fab25f35fd14..5639dad90405 100644
--- a/sound/soc/codecs/wm8983.c
+++ b/sound/soc/codecs/wm8983.c
@@ -234,7 +234,7 @@ static const struct snd_kcontrol_new wm8983_snd_controls[] = {
 			 8, 1, 0, pga_boost_tlv),
 
 	SOC_DOUBLE("ADC Inversion Switch", WM8983_ADC_CONTROL, 0, 1, 1, 0),
-	SOC_SINGLE("ADC 128x Oversampling Switch", WM8983_ADC_CONTROL, 8, 1, 0),
+	SOC_SINGLE("ADC 128x Oversampling Switch", WM8983_ADC_CONTROL, 3, 1, 0),
 
 	SOC_DOUBLE_R_TLV("Playback Volume", WM8983_LEFT_DAC_DIGITAL_VOL,
 			 WM8983_RIGHT_DAC_DIGITAL_VOL, 0, 255, 0, dac_tlv),
-- 
2.43.0

