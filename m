Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D7D2E091B
	for <linux-sound@vger.kernel.org>; Mon, 24 Nov 2025 06:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763967038; cv=none; b=miGYlxYTY/l2Qw9GAOMb+//6ENmhuIj/6f2XEc0J4bFQ95psc8nEGVn/5Qy4CWDqg1D7CL2YloDVE9lUEojtBzBPFQljmTjSO3ZEAGNFgaKxZxCB2gmBGRSabldrfaAHQc0TWqvkKePvLrpfZtEKqFU7rHHBlK5zl+50VTRObXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763967038; c=relaxed/simple;
	bh=c+evDW9Elw7Jyi8FB04DPqmRYklgmrA1qBTttF7Xz90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CRsTMR68o/wBdKtZ0rnLeg1U+zU+asmL6aykuGAKQT/MErPg8zc0siY9SV9ALH13JqyvRpTDqxrAPNFgOAlLA8XGvk5StVoxH92j7tcHO359hMu60hoiFtbbiWtLqX/ygzKT4K4hu7lq8Rry5Z2Iu0DCDaW9lB0l9suklDQxuOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=A3xEhEF+; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="A3xEhEF+"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8b29ff9d18cso386393485a.3
        for <linux-sound@vger.kernel.org>; Sun, 23 Nov 2025 22:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763967036; x=1764571836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skch7R/1lPkeyinutaXG2JeYSmt7c1u7ahV+p8uoSAQ=;
        b=A3xEhEF+omTdzdqkWNz6hWHQ0wnvhSm6xIJm8qDK1vDrsRmiRF4yRuNyOEW7mFwMuy
         3xYrGFsz7VzRGs73pLmSW94ncSEN8ht5CgzYC8K/CayyY9WUxnK8Mmt1f/pWZzws/fKT
         s7voHp0FQWwqSFCOVfh2dsePSW7/8j6P6vSX/rIwUsqowuotz+0plifVfzYATHZ0gOMn
         jlHFIkDxBtRjmYGgMZNXTj1wf4AiLNv5Oc0cw6/7yNrqlHQNgwHK03ZqyCdbJxc77dc0
         tp3m+OypecaeJVAwRKyFtfwGIgNaad+890fJhp+g55jNUH2yC7VgZ2FMXh4O7on28HoU
         +dbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763967036; x=1764571836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=skch7R/1lPkeyinutaXG2JeYSmt7c1u7ahV+p8uoSAQ=;
        b=sH70S3GOUVVK522iSL4Fz/leKz4IPtcCjZnr9AWgFaePw3rwBA9vlVPn0PkFJgrGEH
         5gXrsbUyzsA3WWv61tWhvrusZW7I61XRJhFqJvKfPlnzjyylMsqQAO20KnzWXOEVX8je
         ytjOm4hOCTW0+A94g0udAU1grWj2NZSGd/D1MxQU783nXMht+gICekhO2F++Dbn5UucH
         JtQi15Fd1dWm9O56YxD7pp8BpYfLTPFcMoAWD7vAzkBGvkJICKXgy810ePUlN6EuNRfY
         rJy0CgAtCuGKijgX2IjWRwkL6TemlNox1+U0DU/vm4Q9f40clsEFBcUkMJxDrhQT8da2
         skMA==
X-Forwarded-Encrypted: i=1; AJvYcCWoRDjf6JcBrUXij1aHpdIex11unEAgkS8tlHTvbsoT/5yaDknpvx3EwjYj2aaqONgQKCg3AwuwnyE8eg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyp3ObiAaxPh6SKw1haf1q9bt+jndHSUEYN7QQuvnqIAV+2u6a
	ngAKl4MQoWfo7yBIWBx+3RflssYRP9TArS0I1/ZB0WGlxNUO1g7z6qmxNZJ6QzsLn40=
X-Gm-Gg: ASbGncu92HzKzIp4sGm2R7NizDxxo6Kdopk2wp7WJEMaCCQRs3s/+CjdFyPvG92mEJ9
	9DGSsrCjFH5gEGj9gpwT++QD1hyadyFBn4LflmurWf3LbmQhUTleeAg6x7FCKuu1hCAxK09yxMN
	zFgQU0NfDRxdMs1lgIbzPh6ouF+B6kOORtTT/QWv5hgB+gbCk7Hwy8bixus6JrXFzSkULunjKb8
	eT2Z9TRFAm1pvYg/SUk1xnXM0EOPElE3NXkG0q5FKtn2Z+7vo16p2f3tmbkaTQfisvJ/ka7ryFV
	vGHu8z6bLOCFJMoiHWAJ3DMK9AHJ5iFNfHhT4eovqU78ozr3C6MPQsoO2uTn3UEVJL8caJ6Q9Rn
	98YkIYp0OqxVF26EBVfID6ZnVF71NDqiJBWwkE0wuTgsVoyZ8XrP0vlrNwxPJ+9/oQt2WQ/0qDZ
	MO/hV05ogkv7Oe0lnI+ysFeM8MZH9IUjx1B2540ERRmyTmUAFCbp1GESWpn/LeppZRHQ==
X-Google-Smtp-Source: AGHT+IHhRRyQV5IXdiBdHoXPIY1Kec5ywogEhdJKq7fTD97tVKBwhIq12TY3XSAEWfkk2ZC6mRZpSA==
X-Received: by 2002:a05:620a:31a6:b0:8b2:dd5b:fe80 with SMTP id af79cd13be357-8b33d48706amr1402951785a.79.1763967035481;
        Sun, 23 Nov 2025 22:50:35 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295db8b1sm889075185a.40.2025.11.23.22.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 22:50:34 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/6] ASoC: codecs: wsa883x: remove mute_unmute_on_trigger
Date: Mon, 24 Nov 2025 01:45:55 -0500
Message-ID: <20251124064850.15419-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251124064850.15419-1-jonathan@marek.ca>
References: <20251124064850.15419-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

trigger is atomic (non-schedulable), and soundwire register writes are not
safe to run in an atomic context. (bus is locked with a mutex, and qcom
driver's callback can also sleep if the FIFO is full).

The important part of fixing the click/pop issue was removing the PA_EN
writes from the dapm events, AFAICT this flag doesn't help anyway.

Note I only tested the equivalent wsa884x change.

Fixes: 805ce81826c8 ("ASoC: codecs: wsa883x: make use of new mute_unmute_on_trigger flag")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/wsa883x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index ca4520ade79aa..06e963b5e853e 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1396,7 +1396,6 @@ static const struct snd_soc_dai_ops wsa883x_dai_ops = {
 	.hw_free = wsa883x_hw_free,
 	.mute_stream = wsa883x_digital_mute,
 	.set_stream = wsa883x_set_sdw_stream,
-	.mute_unmute_on_trigger = true,
 };
 
 static struct snd_soc_dai_driver wsa883x_dais[] = {
-- 
2.51.0

