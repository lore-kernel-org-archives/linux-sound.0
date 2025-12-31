Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228A430F948
	for <linux-sound@vger.kernel.org>; Wed, 31 Dec 2025 08:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767170761; cv=none; b=TuxbLfLXspzXlE7BJXwKEm0LWJPMnQPVIAC4lOxtBlon7s4jySs1FlzdF0piOolv5zbxaBtcgCBuHSImxtkKIdt2raFvwK9BuKXPAjEdzSecD20GLrjjacxqYzYL1/vyQu1Xpi2b7EJU3tmaJP0E3RTOEZStGEIaX3JOXGVAhrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767170761; c=relaxed/simple;
	bh=GiTyjIvowYnJ4ioRw6n0bBlGgtTqbPVCW2VD7eHeDg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JKcIe+lXiI2ViJkpK8Vw5DuSVfNSiRbWJHsLujqE6a+qyBM+i/m8nwMjZZNUbPeufjNZDOGILWD6sgo/x9mfINdL6/iz8MMl6cHN4kyWwvDod4l4Jqc7+GnfFtkzm+YHLSWEMo/cGsV8f+0+v4CxUPkdedytAM1+5KL3TvqmZwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6wkjwPR; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6wkjwPR"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a2ea96930cso122636235ad.2
        for <linux-sound@vger.kernel.org>; Wed, 31 Dec 2025 00:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767170759; x=1767775559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AwE5QVXu1woitLle5ffYZh0hqvo2R+OSx/5OsuziCAQ=;
        b=e6wkjwPRzL8zufAlg6jH/+wK9ge/qMbVDn7M9WKUjzt8y4fMq81reqXzb0HaC2Cdel
         Yu2Au0F62DOdSwa8qo2s1j11WtaO8QL1J/GXnSaF73TG8p22GU6D6F4VEiSX1xlPyQy0
         3n3t7BYf51FmGs2dcc9BB79/dT3RgZA4N+EKFcQZd3Z1+tzL8xXJAjQcNsILPKLxSApE
         U33eOOAIUrqcvgShHnVetVzqddipV56kKgEIbrEVgDlvcFyjRGHw5hLlpWG11veeJMkh
         lM0+PVVSIULnzO8VDYdY4Hw1xek96Sp1WRihzucjfCiEBmtdWXYLTMgtlzhY/VBLnzTk
         8I0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767170759; x=1767775559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwE5QVXu1woitLle5ffYZh0hqvo2R+OSx/5OsuziCAQ=;
        b=cA9/BfteqGPdmN6qb03kQ3/7Bbf6rNZOagQG3qpopxfX1VsT0XJ4g5NjXBRa3maJBn
         v8M9zSawfBq24HQ49RL3fgIG9pqsxq02iPbH9bp0DpB32V7WsgGJ6aDNnWaKToJHATsa
         yOQzpozK+sNHb4NubxhVBenOHCnY/+0p8ChvwFN4AK1h/27In3kz9xcRGqA17w3bhUrm
         8wWc4Xh+t9rt+qpGtLLbRr5jUyCXJJTY7wjcdjayBfGght5865JxlvhUQ3PWgViRV1ST
         VD0IQunagSlVtQfnJ+PJ1OK2+M2YI5NQmmEXwk9kN/7Q+Pw22XB6oNjk/AuO/p9REv76
         BiuA==
X-Forwarded-Encrypted: i=1; AJvYcCWvkbRjL7OfEOUsUnx1VberMGJYXJq0pAFzUlfSLwTofRPtNEAdHRuOR3WoiHAQ42T2zmTfKdzoN1Y5XQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwttBM/Fv/3fmnheAI+Bi+oWSY1/ndHAx9jCaDND+KtbZHUwVMm
	oFILTXqeAY8Uh2bsxj/V+Hr/0Rl9VnF+Y7C0+/VjgX1EPDPiwAavMyP5
X-Gm-Gg: AY/fxX6oela3avNcRD57nEOXHbC557ELpGt7uOq6QkegnwcAKqqiuGd2qtihhsokbhO
	fKJU5JPA4T9DKiDhxUSR8wS4vMakzBs+Fi29mGNevzjr3py4s/lxF0Nxz2eqvKH/VrVrcKZo+yq
	asW/pl3IaDoePBvJ0a2+QdJXl/AFtAgx3WASsrHx95PTssFQCopFK0Kxz7mYggshUPqFbliRTuQ
	djZlDi3ofeUmA+q7IaF+8+Z+N1vxf4eWV+7mvFCTqcxK8apGDj5WYuREmCfIVMQyrIP6yHImCY8
	ChBCE1nPGJqiJ47ZWu1mM559xQ7VC7oK7xkB8BnUKqPBDv2OnMTIu9krG2KMOyRIxJPZpRJAudK
	3MsdTnqivTX6rjZIAwpA6HUmLxmirH365nOzWeiMPxyLzXfkv47FeDEdV8qjTNiyIH7dJIEqYur
	NOW5xj4byh2SDVWvpgFUc8QQkDG03Xdv0j/mxeDvsJ65bHJ6FYRVOO4uRQq0RLYxMd+6cGJY+1S
	gqELHCqP9VvK6Rmn7lX0AzJjFHuWBxCJnSUWnQHWQ==
X-Google-Smtp-Source: AGHT+IEeKNNPDjk4NE4b7jRduQvdwkR9Ph9FJeJK5jwBdc5eIEoa0/3bjxpafnq242JHWq1NLWjhmg==
X-Received: by 2002:a17:902:d54d:b0:2a2:f2e5:dc92 with SMTP id d9443c01a7336-2a2f2e5df60mr379216365ad.29.1767170759365;
        Wed, 31 Dec 2025 00:45:59 -0800 (PST)
Received: from jhtrd-HP-EliteDesk-800-G6-Small-Form-Factor-PC.jhtgroup.com (118-163-192-109.hinet-ip.hinet.net. [118.163.192.109])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83961sm322524385ad.38.2025.12.31.00.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 00:45:59 -0800 (PST)
From: Hsieh Hung-En <hungen3108@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hsieh Hung-En <hungen3108@gmail.com>
Subject: [PATCH] ASoC: es8328: Remove duplicate DAPM routes
Date: Wed, 31 Dec 2025 16:45:54 +0800
Message-ID: <20251231084554.265916-1-hungen3108@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DAPM routes for "Left Line Mux" and "Right Line Mux" are defined
twice in es8328_dapm_routes[]. The redundant entries appear after
the "Mic Bias" route and duplicate the definitions found earlier in
the array.

Remove the duplicate entries to clean up the code.

Tested on Rockchip RK3588 with ES8328 codec. Verified that removing
the duplicate routes does not alter the DAPM graph or the mixer
controls. Both 'tinymix' output and DAPM widget lists remain
identical to the baseline.

Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
---
 sound/soc/codecs/es8328.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index 1e11175cfbbb..bd74e896d602 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -406,16 +406,6 @@ static const struct snd_soc_dapm_route es8328_dapm_routes[] = {
 
 	{ "Mic Bias", NULL, "Mic Bias Gen" },
 
-	{ "Left Line Mux", "Line 1", "LINPUT1" },
-	{ "Left Line Mux", "Line 2", "LINPUT2" },
-	{ "Left Line Mux", "PGA", "Left PGA Mux" },
-	{ "Left Line Mux", "Differential", "Differential Mux" },
-
-	{ "Right Line Mux", "Line 1", "RINPUT1" },
-	{ "Right Line Mux", "Line 2", "RINPUT2" },
-	{ "Right Line Mux", "PGA", "Right PGA Mux" },
-	{ "Right Line Mux", "Differential", "Differential Mux" },
-
 	{ "Left Mixer", NULL, "Left DAC" },
 	{ "Left Mixer", "Left Bypass Switch", "Left Line Mux" },
 	{ "Left Mixer", "Right Playback Switch", "Right DAC" },
-- 
2.43.0

