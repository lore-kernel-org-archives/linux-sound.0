Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C082459ED
	for <linux-sound@vger.kernel.org>; Mon, 17 Nov 2025 05:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763356634; cv=none; b=ASrxYanSKYhrwcS6AMNfr63dk/Fr4BGc5upiVfyI9QDBthmaOFBDeBs/YUorwbkhzZKFgdwlzVZKI/GOFdK9+BW+dcG6SITAUkSYvgoG9NWKNM2+IQ3Ptu/sG8EyEsa+dL5Omb/rGJZ7CA1nhaYv6q4T9SGkOAtC6pSEJUJ4FfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763356634; c=relaxed/simple;
	bh=F9bqyjnaY9vppou7CJ4Gw0zGAfIlpIs/l3kwYRqX2f0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rafehWGOEpMjdB7FkFO4oo1++pYWvFUrjjGzc8vfo4cUFqg+RkdjSBa1h72/kfh7k8neEsgkhCWPZDUib3Dj70JpM9G8Mz/47mXpBPIJPW142339V/om9whAV3VLHDGEqvJIDn5A7MLuk1MgMziHTJRqv74gkylAl7tQvy2PM6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=DoIe6IgK; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="DoIe6IgK"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b2148ca40eso553846085a.1
        for <linux-sound@vger.kernel.org>; Sun, 16 Nov 2025 21:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763356631; x=1763961431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bjJ6mSMUDnT9EfLt8zTUS1krbqS5uLTDvq+DfAEIIKg=;
        b=DoIe6IgKQkFDV/ASs+fELUoY3hxmEcmypwbN04GaD92XkZCXA28a1K+IGWAHM8xeVJ
         lHJyaUnxAhXmgjC/hMfOXXbtuLs/e3W0Y0ZR4g3W90M9kEVH76h4qPBWOKkpkypLSJu4
         QTDRFTJ9FsUNbTrZMUlHJCtakV8necsA7FXcIvcDKzriR/wZkHJoXpdaElPrVfAtRhw4
         9Q3HBcrnILfO2EbWq6SACBEFImu2paPzjmAmoWNaImUrg5TQhcTPKkiS5m5Ulv/9/MlP
         2wRjW/G+/LJuouffkE6RKPEoNltR4ahHFw0D0c7Iwmn9MeuYIJ7mtHDSdN4Dry1gndC9
         CFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763356631; x=1763961431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjJ6mSMUDnT9EfLt8zTUS1krbqS5uLTDvq+DfAEIIKg=;
        b=OZ98eiHgglyAPF6ATVudjRrfn+EjcbDItN5dWBsV2VxBIJK4YgfgnmXdjmmQ6DS7sl
         srDvQlV/uha12P6yDuWiemBgMJzG0XGOG5CDY8KQQgqFL39Gtz+HEZraZ4dJ+tZYikYE
         fL0lCMW4R2L6nrYAdvv4TUlGEDviyeMoTESKcItAo6rrEnD7gXpsKfq0giILhnagFj1E
         Ji92aX9v6c+wCf3V92Vc9uEeww1zSPUje57URBxaJFQ5eeTswQ1PXDBp38K5sXZfUDU4
         DYRNbSm+4SGxpKjd8zxwyv2JY6g8Y4bW8UZaJGA3FZmNfru7X8XhoxWEZH8gPsLxX6ki
         heJg==
X-Forwarded-Encrypted: i=1; AJvYcCWg5/40aQ9m23R23ZYSUkPnx0vk8kymgvEvYL1nvGqRKx2ioIhKd6RrzimtYB+oJf0xMEJ0b3crwhLT4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy94Xv1bHVt5gmpr3HlcUpzODr1PmyDbcE6+D4oVvYqZqUAVrRr
	pE+zxJidRXkJD8BeIJGT12Gk3taoCwoVNZ/N2pUt4gmbzuhZcLE2TpybG2xs3RQYaMY=
X-Gm-Gg: ASbGncuqJ5XRYlq8+sqgzGLISqLQxGGp8+OSliCpGzyhmPmRVMIE3Z7ZAZRZfPAw6nL
	BJLIzEeaj7znuMHZ/7ZM0Ew/xSsKtjbqDZhhYbkG3/KSZFB/crN/nYYp4AhEfpicaYuos9htP+E
	mIHUL6oXJ19rkEGyJh9gte22XGbO2RRvvlpvecNBtiSa5Ko120A5kCIxANSzH9bYYxq30AtUq2w
	29WYaq/J9c6nIfLdZV1JtLx2lxWE6x3YaQFQD1ei8+O8eVD5rPwR2cq9lELBzfJELVuLn05YcYg
	GYoVg4OAGqQdKeRRtUBJiVgPdSIeZYvVb2syngXDz0o5llrBfGMSj4EzJsD53PVGYnmIM6jtYFd
	13Z/m7TszW15shHlgTITNcaJdEcSS41jrcwYTrt429HB06+IYVhvdqype/4BO4I9JRijbm65XQ6
	V1W0ddHShMBYELqvdD0ek2bZjTrQeEXO9HMIlWoSP6lu0bPHMkMMLpTkY=
X-Google-Smtp-Source: AGHT+IGrDovZ5uxWtzBZ6cBDHkf6F2Vnyg9egsBJUFuZL+TRXg+091tfkXP78NpeMOOq85KHO9Ko6Q==
X-Received: by 2002:a05:620a:2683:b0:8b2:ea5a:4146 with SMTP id af79cd13be357-8b2ea5a454bmr366248985a.89.1763356630970;
        Sun, 16 Nov 2025 21:17:10 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2aef2f936sm906417185a.29.2025.11.16.21.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 21:17:10 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/9] ASoC: codecs: lpass-wsa-macro: remove unnecessary bounds check
Date: Mon, 17 Nov 2025 00:15:13 -0500
Message-ID: <20251117051523.16462-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WSA_MACRO_RX0 is 0 and WSA_MACRO_RX_MIX1 is (WSA_MACRO_RX_MAX-1), which
means it is not possible for the bounds check to fail.

Removing the WSA_MACRO_RX_MIX1 limit is needed to add support for other
ports (RX4, RX5, etc.), in which case the valid range depends on the HW
version: rely on the driver only setting valid ports in active_ch_mask
instead (already the case).

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/lpass-wsa-macro.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 38faa9074ca3e..6e54c1beac8f9 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1168,12 +1168,6 @@ static int wsa_macro_set_prim_interpolator_rate(struct snd_soc_dai *dai,
 
 	for_each_set_bit(port, &wsa->active_ch_mask[dai->id], WSA_MACRO_RX_MAX) {
 		int_1_mix1_inp = port;
-		if ((int_1_mix1_inp < WSA_MACRO_RX0) || (int_1_mix1_inp > WSA_MACRO_RX_MIX1)) {
-			dev_err(component->dev,	"%s: Invalid RX port, Dai ID is %d\n",
-				__func__, dai->id);
-			return -EINVAL;
-		}
-
 		int_mux_cfg0 = CDC_WSA_RX_INP_MUX_RX_INT0_CFG0;
 
 		/*
@@ -1220,11 +1214,6 @@ static int wsa_macro_set_mix_interpolator_rate(struct snd_soc_dai *dai,
 
 	for_each_set_bit(port, &wsa->active_ch_mask[dai->id], WSA_MACRO_RX_MAX) {
 		int_2_inp = port;
-		if ((int_2_inp < WSA_MACRO_RX0) || (int_2_inp > WSA_MACRO_RX_MIX1)) {
-			dev_err(component->dev,	"%s: Invalid RX port, Dai ID is %d\n",
-				__func__, dai->id);
-			return -EINVAL;
-		}
 
 		int_mux_cfg1 = CDC_WSA_RX_INP_MUX_RX_INT0_CFG1;
 		for (j = 0; j < NUM_INTERPOLATORS; j++) {
-- 
2.51.0

