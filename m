Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B751224AF9
	for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 08:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785226387; cv=none; b=u94pZeTR5Xf5g5eLcro1OxkBqRDhJHxThyjfqLtRQVo42rIzmKDwYlqT6PaQZVd2Q6wtEUF8CCopuCOA30cX7qngZgSndhoVvSclhFQupXpNzSlX2iU1Xt/UQV09+c5cfzLp56ym6/G4AGOeBbQ2HXQxNN2oWT4ehXACA26Syok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785226387; c=relaxed/simple;
	bh=cKx68UWa5FspeSfm8ASYYf9j/ZRB+UhXqtT7rmCFtGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ADCmfPoL9rdvJzRpWJLkixmyqa6qy+iI+lvwXHcx3wv53+HGHm5guRuZsFU1MkNuorEN171Gm+dfwJTQpC3+gM4UjuEVybJGMEbCCHJKbIEaOlnT3MV69LP+hLbCraZ8pYCxBYjBX/XAC2EaMpesycKDklrBxXYQriJ8Qkt1e4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGrAXLtU; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGrAXLtU"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84847482584so526451b3a.0
        for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 01:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785226385; x=1785831185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YnIf050MpYvj8A16jl2/xBo/BIv6LuNs9ZOKEYr8xmI=;
        b=lGrAXLtU/IQFEH0Y0KYo3egZh2VhscZfd5HlAV0BOj/GhemmMEa3g0ErCWx8FG5MsA
         vHp+szNtCkr0yW09GTEeKO7at8ZN1PliF6Ny4PnFZ0pgMc3rcjZ1hQ5dkXn2nDi4rcLC
         pWY1gQwIns5L/kmCXH2r4AYyuoJ3Vx7Nfd1VfPlmd9/6fGE9mjsaKXpPWb03NXoRmk6t
         aKjXYecqMg7rD3JI8M8i2TdmWDUp0wdC5I0Y194yHlohF9+Xx7zu0RAFsaFYiESvKclI
         aIfMrilU+gkwmqLeNpJr2xanEBj3a/CRm5t911BvRBkdN4n7aqRwVX89vyv2lE4YmdCt
         EZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785226385; x=1785831185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YnIf050MpYvj8A16jl2/xBo/BIv6LuNs9ZOKEYr8xmI=;
        b=kHS2FV0Ae7yAvH8thCW+B190ty7nVVFuVeSN6Ls0Z+x/fKsoSJc1hr1Er4ZLgNyk4S
         hglL8w1w0VPHz+txfuTg1asyurD26pwgiqYn1PqMS1GuqBusx4vVe87W55l5ve56uJL/
         qjkmJ9MyWF702zd/c1Df7xtWXfUsLSd/ZJ1rzu5gDoKF5dzhGFuux1epGexzLJa/eKLL
         D/pa1C+ovLH43AjDpEKhxO8kApCmPbTLJdVWIOlHAViI9NfrmFBGA34y8GYMt2rlbtSm
         Iwq0R39ObqSpUVyouIr5DSKWIs45b61PsW2oxNMX0+/TzRHaKQJ48Cz7Qr6woPrtDEKK
         sJZQ==
X-Gm-Message-State: AOJu0Yyr8xOHmXdTDf3p7ho9J7q2+o5MsTTKkayPx83e5ySEQr4na6OT
	xTVhWY+US6G91XADNGjo0reOpc2gMihXxRbbPvyUoV0fzK2FkWFmpkaq
X-Gm-Gg: AR+sD13DSmvIdVDsfxVFWiLK20eC3psyAo2S+vFkI189IJtFyoqus8o7IUXFuF37Tmq
	/YBlI+7PAe3l3U/tbPaaiDAhS496PrabcIMmimXyvSBkanXExqXimj1u3mJHQOEGrTuRZw4TJiF
	7LuGsKUlYoWzuZHLW+uQEdoy751cZWo5goh5mTfF03Wd/vqTNTcdKTIop0kL++RP0bFOYaCzRaS
	YyTeVmRI4dRGvemIGCPBO4CuqKtBPwQkX/qgvgDN3hs0283jsLfmSGL2TkcM+UTI1HwB3EHjkxT
	GK84fc7cNCF4wVMa4AMBJISMHVARWSJ5nlFjKXPgNEmA8nvkOK4XX7KNLxr9UgdsZlMOTCwkT1/
	YnhWM2peYgoFZTYRonJHvYasdJNfqKhJlMuEupEGLJe/Le/LDtny+ayVmObwN6Jxlm7ZGzs1mnl
	NNs976umU4R+kikNNrGyYpjU0z7tpYA/aymBKcdf6myRAKqDFncDnbRaUHMY+Wjsihl5t25SrQ7
	/bo58i6OwG6slEUFG1g7vVngI8k6pV9
X-Received: by 2002:aa7:8896:0:b0:848:3576:3204 with SMTP id d2e1a72fcca58-84e932afca1mr1312135b3a.34.1785226385489;
        Tue, 28 Jul 2026 01:13:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5344c88bsm4197747b3a.53.2026.07.28.01.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:13:04 -0700 (PDT)
From: phucduc.bui@gmail.com
To: cassiogabrielcontato@gmail.com,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Kees Cook <kees@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ALSA: core: Update snd_card_new() documentation
Date: Tue, 28 Jul 2026 15:12:51 +0700
Message-ID: <20260728081251.23783-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The implementation of snd_card_new() now uses kzalloc_flex() instead
of kzalloc(). Update the kernel-doc to match the implementation and
fix the function parameter indentation.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/init.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index 56dde5bd73c4..f3fa795ab932 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -162,15 +162,15 @@ static void release_card_device(struct device *dev)
  *  @extra_size: allocate this extra size after the main soundcard structure
  *  @card_ret: the pointer to store the created card instance
  *
- *  The function allocates snd_card instance via kzalloc with the given
+ *  The function allocates snd_card instance via kzalloc_flex with the given
  *  space for the driver to use freely.  The allocated struct is stored
  *  in the given card_ret pointer.
  *
  *  Return: Zero if successful or a negative error code.
  */
 int snd_card_new(struct device *parent, int idx, const char *xid,
-		    struct module *module, int extra_size,
-		    struct snd_card **card_ret)
+		 struct module *module, int extra_size,
+		 struct snd_card **card_ret)
 {
 	struct snd_card *card;
 	int err;
-- 
2.43.0

