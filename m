Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A521D29406
	for <linux-sound@vger.kernel.org>; Thu, 28 Nov 2024 16:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732809627; cv=none; b=JplGH7pSMIb46zcOuX6Ioa98AvP6SpyL4hJlKmvCk77V6vEkabndEjVKzv9D1cJfqV5AYJ4O+F7Jw+d2b3YsIUV+VVvaUGDn5IZETJPGtXMws07eZJoULtsdIBOINAiu+O0y3YXLmzM/IDD7Fa6OUIbrPJ3pL1YDcwh7/xhcjrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732809627; c=relaxed/simple;
	bh=CEPCLyGcP+5TlVcrY9sskKx8WTDeCpweS8+NStxhbuw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=BbAmXbrOY3k8F4qajelnlfpPgAjn6x+sXicqTC7cA/s30ZYN6DiPmQroIyIyOp3uKyy+S3odiBEA7hFXAOgdd1deynL9Z1dX9eqauy5EhEvYKWzcgf15mGLgBDWJ1L92C/pEzGB6qOc7YvgsZgXlC+lut0k55rsospBoS6qIIvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VjrDBsu4; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VjrDBsu4"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-5cfae4d1f2cso674799a12.1
        for <linux-sound@vger.kernel.org>; Thu, 28 Nov 2024 08:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732809624; x=1733414424; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HCg1Km73Sbp4/xSTNme8D+2Uw46vaSy0dpia+RIb3WE=;
        b=VjrDBsu4UMXfwI2w7VJHCPDTNjl2Isq9XJYFX6K/ZOygu8fXUTkYwMSyIXdcAaqe5I
         TXUxJGcDGxU/D08eatGJDMp0UxD29VHKDi4qBrNvfc97k76XEajBOTO8ENTRaQY3x9PO
         LmbCybEVz8j6fe7wrC3V5uHgkLW0JcaWYUIyXDkRCOhkg1IDFxfZKD33Tc+KNKDMfJrx
         6jFZZFAVuPDYk6BOuhR5fSmS3mdF4+92+XAJ/ES4SE86PLDW/7svqq0aGA04o2zW/GBv
         NUKcY2yXx9z6JOU6EJYLjuBbUZ0fgW3c4daHfFfOHNwF6I4RbYDmgfJ2ut+Pz2n6LxP+
         o5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732809624; x=1733414424;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HCg1Km73Sbp4/xSTNme8D+2Uw46vaSy0dpia+RIb3WE=;
        b=mlt6Zyep7mDp3TiooLw+zK+CAymPwaRXyuoJOd7l1tWaR/ns0zgFjXE3uZuHb2jUTN
         NezjrM9TmV3dhs1XkQ7eg1RbncwmcAy4/PBwuHb2yRnqKYI31mpt9XiymAoov1G6k3jF
         S4n8x2AEDsG2A2ddxDn0GXdIDAHXYeZW1CwLZIVl6P5/xGr0Fvyy5m+pFIQIVnO3mhk6
         t/S4zeSr5L981E1kLfaDV318T9PwBNe/NpJJxRruWP+7lTL3lhcJSLOHrGugFTtGDMLR
         PEOFlYvFfvgu4yDPQ/PvIr55S6aGR99HwnMILtQr7eidJhM/D68nuaPNjjB7vdzxd6bJ
         EtYA==
X-Forwarded-Encrypted: i=1; AJvYcCXN5LecqornYLVYykRDtZt1JFYMYg7FwohoHGPAOdNsw1JJnxu5HJ7KI+8MQB0jK0l78mHbPpg6Qg/3QA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsGwdG1PcgXOH9A6YVu25AN85BEYgermIJQgZiKwCdlIjT1pCi
	BpD8C5YflDyVOlSDoujhFK7bbFFSNJwXc0NquVimLb2faxAKBKPbRS94On1I3iV7hGm3V60heVH
	E9lbSCNLcMA9dcQ==
X-Google-Smtp-Source: AGHT+IH7O2F88sy1YkGak+ZTUuWwKlxn8SdhOmaY7RlKSth26WNlQQxcOCfxKgSD/+8oTPB23XqZRw9oivubtks=
X-Received: from edal21.prod.google.com ([2002:a05:6402:2315:b0:5d0:83b1:b8ab])
 (user=mmaslanka job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1e93:b0:5d0:8f29:73b9 with SMTP id 4fb4d7f45d1cf-5d08f2974b0mr4346712a12.28.1732809624031;
 Thu, 28 Nov 2024 08:00:24 -0800 (PST)
Date: Thu, 28 Nov 2024 15:59:20 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128155926.1774625-1-mmaslanka@google.com>
Subject: [PATCH v3] ASoC: Intel: avs: da7219: Remove suspend_pre() and resume_post()
From: Marek Maslanka <mmaslanka@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Marek Maslanka <mmaslanka@google.com>, Cezary Rojewski <cezary.rojewski@intel.com>, 
	Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	"=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=" <amadeuszx.slawinski@linux.intel.com>, alsa-devel@alsa-project.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The presence of a plugged jack is not detected after resuming the device
if the jack was plugged before the device was suspended. This problem is
 caused by calling the
 sound/soc/codecs/da7219-aad.c:da7219_aad_jack_det() function on resume,
 which forces the jack insertion state to be unplugged.

Signed-off-by: Marek Maslanka <mmaslanka@google.com>
---
Changes in v3:
 - Fix line breaks in commit message
 - Link to v2: https://lore.kernel.org/all/20241128151239.1666582-1-mmaslanka@google.com/
Changes in v2:
 - Rephrase commit title and message as suggested in v1
 - Link to v1: https://lore.kernel.org/all/20241128122732.1205732-1-mmaslanka@google.com/
---
---
 sound/soc/intel/avs/boards/da7219.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 80c0a1a956542..daf53ca490a14 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -211,21 +211,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	return 0;
 }
 
-static int avs_card_suspend_pre(struct snd_soc_card *card)
-{
-	struct snd_soc_dai *codec_dai = snd_soc_card_get_codec_dai(card, DA7219_DAI_NAME);
-
-	return snd_soc_component_set_jack(codec_dai->component, NULL, NULL);
-}
-
-static int avs_card_resume_post(struct snd_soc_card *card)
-{
-	struct snd_soc_dai *codec_dai = snd_soc_card_get_codec_dai(card, DA7219_DAI_NAME);
-	struct snd_soc_jack *jack = snd_soc_card_get_drvdata(card);
-
-	return snd_soc_component_set_jack(codec_dai->component, jack, NULL);
-}
-
 static int avs_da7219_probe(struct platform_device *pdev)
 {
 	struct snd_soc_dai_link *dai_link;
@@ -257,8 +242,6 @@ static int avs_da7219_probe(struct platform_device *pdev)
 	card->name = "avs_da7219";
 	card->dev = dev;
 	card->owner = THIS_MODULE;
-	card->suspend_pre = avs_card_suspend_pre;
-	card->resume_post = avs_card_resume_post;
 	card->dai_link = dai_link;
 	card->num_links = 1;
 	card->controls = card_controls;
-- 
2.47.0.338.g60cca15819-goog

