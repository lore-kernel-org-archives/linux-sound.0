Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7211C31715F
	for <linux-sound@vger.kernel.org>; Wed,  1 Apr 2026 22:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775081148; cv=none; b=j9nIB/6lyGJf9Qfr2uy/uIApzif2hswKvBG3DFy2KOAW95yM3sM3RtpqPBm0Cv/0eP+w58B6aLogvJ/00HDveySeK8Cg1CfgqSfJQwvaXlSCCbc9LsVR2aY3A8rfD+/OGD9QSVf7ivGFJibxxq+P2Kr8zNeCEVJh7k2T8mrPyPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775081148; c=relaxed/simple;
	bh=zUJJDAbtzvpDcOqcmqp+NA8QwnTq2SC+9EAGZ/+/Jt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IyP2tVx7OZdwt9uGQeaa1KlYnZLyPtFPLtOcBuCduBR7qV4l2wt2i3d3VKo3+hm++nQnKtWY+cA5s0mKzLHSbHeL5gcumLahb6GMxNhE0hYP0mYvo+9bz9WMQr1aH5e1k1RGogOSJuzCG+rOoGsU5do7rdFi8VSFgZwUqVeQAKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXwT7KVE; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXwT7KVE"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso911755ad.1
        for <linux-sound@vger.kernel.org>; Wed, 01 Apr 2026 15:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775081147; x=1775685947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1oyC8Cvd6AWK012n2/G1MqbD1mUbk8DUkYVolymW+Q=;
        b=NXwT7KVEQPlzUnDSNDokSy8OFX1CKp0wLINV6CjiIE6I+nWcpJOnRq28oUCjdInvBV
         xau9VP+UUZtEfdXFDoO84W5CMShHVHRXhzQm7DeJrNn2B1lSXXyX7oi/lV52OdFp3D86
         6HcDTHv9DfyTRfemwXhe9sEyKIuhSfGSSOdKGsaQ1MyeYdY89eJzl1bI43h5A9rar1/2
         sGuu40JuoLc0Uxg5U0daTCwDR2zUD6llOnegid9uOkPHBQVcK6nQV3r4pdjy3mPzWM0W
         3FY/1nYpp1SHJZxNRWUnyU6EUpjY61opa99xv1/iZkFUrSfCmTnYEXdv2B9rkNui6Ddg
         HhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775081147; x=1775685947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I1oyC8Cvd6AWK012n2/G1MqbD1mUbk8DUkYVolymW+Q=;
        b=V2/PsGNd0YlLJmsL4en+OlC6x3OvskJGTXalrRuZyK5wErPYfbEoiI3x8qtE7rLotN
         etrUwGqPXWpe7eEz1p1C1I3y4gvyFBngOW7OwrjLoZ0VTR7BOvc1cMr+tMxTrFPNi75L
         yMfwYijNCMc2j6H7dqr5Jihv5sBT8Hn6kILsXWMCBt2S89MVes2CrAuKUI4WfjkZy6kR
         gl/JHMyDNzCxgS0swuCZoOjTALzbmY15g4giJEQKKeYiBWAetwLQbsocdk4vuJ7ehq7w
         qZRwKBp+MUshHO0c8j3BRBg/x6bEHtiEl6MwX/KUR2Y26pGKz++DuWvxXdnS7yOxSEL2
         zPuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMWUPvO5/tZR3uFLX8hF48OAq3iqvXIjWJQXvYbNyTH16Poncrlvsa4RTudXSbvS+GyB/L0ks+9/gzkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOBWcKJ1papjpzO1SGpKMVIQJjkBBnB/fBzyjXtQYELlcbL0Tm
	EobTT+H7fQ+7RnmP5HZamye1zvRyBjN3CfGs2WpoK209MHoULPKnz+Dl
X-Gm-Gg: ATEYQzwVA6mjt1CJWRW/RmRB+D8czBeyssE7JRm3yL9n8NR0o8mOFvHOgb3evq1f3hk
	klpszQaMx0N0Jewe4bOa++DtWJTpJS7A3Jvj3fCdBRk1XCwTm/UhhvMvTQFJ7gZjNLLSmfT2n1e
	DIRb8p6jg+w2IJzdOAbIOamOt9ipNfYegITGOae17eVRQ0K+zEzw8xvLZ+3A/e0kIounWUdNJIZ
	S5tC93j2vCXtacVlvHjAuaobOAKuqqbeN74XhgLRL7fTxnkNgbSXOYLxOoO5Lm/xfJCiZ5JOlZC
	7IQYkz4YTcTzHhpPrnLqEJniByt5iOFLV54xUIid/C4qdiyIJ8+V4wwnJWiGmXH+sgu0CVkO9Nu
	Ci+mY6cThVXF9KLAh7Do9YlM0dJ4xXSnhGDk1ZaMyYSfNAq9hyHD8BkZ3U+raPkvkEOGoI3Z2vD
	tIXv6Zo8AKsT8vw6onVLI3tCnpiDC881ngMvQ6zqPzthjp
X-Received: by 2002:a17:902:f54f:b0:2b2:54c1:2067 with SMTP id d9443c01a7336-2b269aca7admr50478125ad.21.1775081146838;
        Wed, 01 Apr 2026 15:05:46 -0700 (PDT)
Received: from debian.killsync.com ([45.116.230.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af47sm9050815ad.42.2026.04.01.15.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 15:05:46 -0700 (PDT)
From: aravindanilraj0702@gmail.com
To: cezary.rojewski@intel.com,
	broonie@kernel.org
Cc: liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aravind Anilraj <aravindanilraj0702@gmail.com>
Subject: [PATCH v6 3/4] ASoC: Intel: cht_bsw_rt5672: Fix MCLK leak on platform_clock_control error
Date: Wed,  1 Apr 2026 18:05:06 -0400
Message-ID: <20260401220507.23557-4-aravindanilraj0702@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401220507.23557-1-aravindanilraj0702@gmail.com>
References: <20260401220507.23557-1-aravindanilraj0702@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aravind Anilraj <aravindanilraj0702@gmail.com>

If snd_soc_dai_set_pll() or snd_soc_dai_set_sysclk() fail inside the
EVENT_ON path, the function returns without calling
clk_disable_unprepare() on ctx->mclk, which was already enabled earlier
in the same code path. Add the missing clk_disable_unprepare() calls
before returning the error.

Signed-off-by: Aravind Anilraj <aravindanilraj0702@gmail.com>
---
 sound/soc/intel/boards/cht_bsw_rt5672.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index 359723f2700e..57d6997eb12f 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -77,6 +77,8 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 				CHT_PLAT_CLK_3_HZ, 48000 * 512);
 		if (ret < 0) {
 			dev_err(card->dev, "can't set codec pll: %d\n", ret);
+			if (ctx->mclk)
+				clk_disable_unprepare(ctx->mclk);
 			return ret;
 		}
 
@@ -85,6 +87,8 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 			48000 * 512, SND_SOC_CLOCK_IN);
 		if (ret < 0) {
 			dev_err(card->dev, "can't set codec sysclk: %d\n", ret);
+			if (ctx->mclk)
+				clk_disable_unprepare(ctx->mclk);
 			return ret;
 		}
 	} else {
-- 
2.47.3

