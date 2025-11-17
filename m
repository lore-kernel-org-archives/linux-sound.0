Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256E0313E38
	for <linux-sound@vger.kernel.org>; Mon, 17 Nov 2025 05:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763356638; cv=none; b=N8TGryJGHzTjdxW/fkuM28pLYXKaZz10DM2gVUWRMlokip55SZjxvYHIsVSrwj1zxv82oO6JBcKnhxCzeLR445RT6BygeJyqRXlTpavSao4oBBml+fAMw4HPxx+CeuKuhdWDM5+zJqff4S1WAlEozeKzR29bNMz477u6eT1Nsns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763356638; c=relaxed/simple;
	bh=nxfCsocaK0cFweuyt80/qsHaaKO8U7Cv6z1iAWrdcgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iCvCVSA7IhtOvhesVpj9eAg4gKvrPwdZFeV/G7DNgo1KFwf8Xn7F1xjJ52j0TAespkEQPMDGIkSX9ZQz9oE84r3C3iILMoF9fcCe9XlIosieCjC2ZcDU4wXoMEI5ZA3pSFFPBIJOoy8aCVlYTT5hT9mFY3qaEyMiz+1FxymtHII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=CK3hVbv3; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="CK3hVbv3"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8b2f2c5ec36so35462285a.1
        for <linux-sound@vger.kernel.org>; Sun, 16 Nov 2025 21:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763356636; x=1763961436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhu/xwE3akCLuvlVIvCt12pssctwOpgKAURZZ/wZRw4=;
        b=CK3hVbv3qRcHEXQxGd5g0lfeqsVXtRCkIKIbyDCZlrQ4neZlweaHo7Tx+TU7ZBNkrA
         hBVeHtMeikqHdCl62LvW7M67tsdfm6J7lrpy/7+E/UoPN791/x2DJPt4jH21Wuh3Lc5a
         w4Fgjj8ld9epHKhTSsaEw7uyT/+BbbBlRXyx4nkmRhi4K/XEAyRDbOM8qIJEqe5fbZvg
         6JUbAoTWVWQbvEXh94eSUokMRMNHPXr8pGo+WbqNBZq0NSBkwsWlVrAF+MgpINOYtOMA
         g+Fnnr6ZdtzDGOfQp2ujdpReIvZCBdq0TIwjF7CNFmk1f6NMeLzWJMWYAzRFV6J6iCpx
         DERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763356636; x=1763961436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xhu/xwE3akCLuvlVIvCt12pssctwOpgKAURZZ/wZRw4=;
        b=TQsJ6xSIVOZdOuttzzgT9eidGCv5QPDMfXoXOA+UqwYddatSKWtMZaQ45UdFRTERI7
         WorsZ8NkSJ+JqPZIkUfchtyAbTFegKlpUnml6Hu3Lv0j1NR53HGGvogYkt6Qu7IdkTD/
         IU0z8TZwyUoINdJ+zaptSNiqk7jz2B2L2MvAAoVyhwEglUmXkwXYHl8nX5l2TP+C7zA7
         pWSMRGc6r/pzJ90xUpSz5mBUkKwulDbS3v9W/ZJncz6pga8zuzDVcW4lHV+MM+IwnrtU
         q5Wr2DiOPYTYrrWA1HvO77SAMYXxW38Iuk05GdCYjXhw77+oYrgXTtoDrh9r+vXEsZ8m
         f18Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqjNQTBQyXYgBLc60q4nKYC+UdppA8jpZXDliUL/wvwtJtOFOxtPNmFRmJlM8GxXt+Rv9CyXlJCPxbDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJKb7MGyxfXiXDjnH3aH26arWYNCP1snPBIiqd8FD6Zuio1TCE
	NL754N2pbKrSh12dkxK733G/CRkEKXRpARRx6q3xcI51dC40/w9jbMwr0Sr0p2pfUD0=
X-Gm-Gg: ASbGncs9BSndl7MkPZVtRAws4436xapy7plXPYiUyp9xacXh5FuQ3y2AHP7laLG+iH1
	U31SGUKr15kHyKbyq9ckqmoKmTyeb4XgEOGYb5bLvA4sh1wYfpSKgT95k3y4f2axt421QRgX+cW
	41uQSnPAG9IuG3qopGO/Um6PqMhpSGAvzaVhjVv1OgoWFHBaKKPQx5j8OMqUnyZnPVNLcMXLQlc
	hwoJk6jQuXgHggg2sKPVP+JxbvRQEV2szNRIAwI8+oP8p8l0/1qF0KPn5txEaM8euuWCCgLtn7n
	qAC63Anl+t6BD5xq95ftEsTUQ8oCOQVVmMNz2jlGNtQ1qkOUY3bLB8cYgq6zNsbg/+dTrTV70Jg
	tUERBELxFjt0OKfTeS9pJj7e7Ki1afTqfnpL1SjTo0sh6WIWEH+6Qd41iCCsAM5H2EdCSa5YmpE
	xd4VEH/82PXdC3INLSoW6ZAXxvL+UNB/Rufr4POfpsDRI4feEShlOaLwg=
X-Google-Smtp-Source: AGHT+IEgJnqQ0EhhsbG4Q0ct0bfnX4ZHO7Bu8ZyywX9Vj3w0sULS5OMvdnUpE3L4eiQGjIBhYG/pUQ==
X-Received: by 2002:a05:620a:199c:b0:8b2:f145:7f28 with SMTP id af79cd13be357-8b2f1458d4bmr183844885a.33.1763356635974;
        Sun, 16 Nov 2025 21:17:15 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2aef2f936sm906417185a.29.2025.11.16.21.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 21:17:14 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/9] ASoC: codecs: lpass-wsa-macro: fix path clock dependencies
Date: Mon, 17 Nov 2025 00:15:16 -0500
Message-ID: <20251117051523.16462-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117051523.16462-1-jonathan@marek.ca>
References: <20251117051523.16462-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"WSA_RX0_CLK",etc. are path clocks, but "WSA RX0",etc. are ports, and there
isn't a correspondence between the ports and paths.
For example "WSA RX0" port could be used by the "RX1 MIX" path.
The problem becomes obvious when RX4,etc. ports are added.

Enabling the path clocks should depend on the path being enabled.

With this fix, the main path clock will be enabled whenever the path is
active: previously using the mix ports only would only activate the mix
path clock and no audio would play.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/lpass-wsa-macro.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 06570e474c850..27c8c060cab19 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2496,10 +2496,8 @@ static const struct snd_soc_dapm_route wsa_audio_map[] = {
 	{"WSA RX_MIX0", NULL, "WSA RX_MIX0 MUX"},
 	{"WSA RX_MIX1", NULL, "WSA RX_MIX1 MUX"},
 
-	{"WSA RX0", NULL, "WSA_RX0_CLK"},
-	{"WSA RX1", NULL, "WSA_RX1_CLK"},
-	{"WSA RX_MIX0", NULL, "WSA_RX_MIX0_CLK"},
-	{"WSA RX_MIX1", NULL, "WSA_RX_MIX1_CLK"},
+	{"WSA_RX INT0 MIX", NULL, "WSA_RX0_CLK"},
+	{"WSA_RX INT1 MIX", NULL, "WSA_RX1_CLK"},
 
 	{"WSA_RX0 INP0", "RX0", "WSA RX0"},
 	{"WSA_RX0 INP0", "RX1", "WSA RX1"},
@@ -2529,6 +2527,8 @@ static const struct snd_soc_dapm_route wsa_audio_map[] = {
 	{"WSA_RX0 MIX INP", "RX1", "WSA RX1"},
 	{"WSA_RX0 MIX INP", "RX_MIX0", "WSA RX_MIX0"},
 	{"WSA_RX0 MIX INP", "RX_MIX1", "WSA RX_MIX1"},
+	{"WSA_RX0 MIX INP", NULL, "WSA_RX0_CLK"},
+	{"WSA_RX0 MIX INP", NULL, "WSA_RX_MIX0_CLK"},
 	{"WSA_RX INT0 SEC MIX", NULL, "WSA_RX0 MIX INP"},
 
 	{"WSA_RX INT0 SEC MIX", NULL, "WSA_RX INT0 MIX"},
@@ -2568,6 +2568,8 @@ static const struct snd_soc_dapm_route wsa_audio_map[] = {
 	{"WSA_RX1 MIX INP", "RX1", "WSA RX1"},
 	{"WSA_RX1 MIX INP", "RX_MIX0", "WSA RX_MIX0"},
 	{"WSA_RX1 MIX INP", "RX_MIX1", "WSA RX_MIX1"},
+	{"WSA_RX1 MIX INP", NULL, "WSA_RX1_CLK"},
+	{"WSA_RX1 MIX INP", NULL, "WSA_RX_MIX1_CLK"},
 	{"WSA_RX INT1 SEC MIX", NULL, "WSA_RX1 MIX INP"},
 
 	{"WSA_RX INT1 SEC MIX", NULL, "WSA_RX INT1 MIX"},
-- 
2.51.0

