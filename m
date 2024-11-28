Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611281C2432
	for <linux-sound@vger.kernel.org>; Thu, 28 Nov 2024 20:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732827170; cv=none; b=aVKTzdJekYTmppZnztLWDCu1Ckg8ItnAvJgdv2U292l2X3Pc60kePaWVgqJ+nChme7RMzi8A/sm2hxGhR0eY4x3ZvJkc2oq+SfEEQuKrMjCB/nOWbgbLfi/tQ2m6c8Rda91ZUR1M+Jas6WjAbi8zdftYTCK/75/pzhcBTHlytpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732827170; c=relaxed/simple;
	bh=I5YCLO6EscYmRHuFv26CuhdZFgeTmhHZGaOy61Yx4H4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=CcfjF+Z/Ft8wTRnTGLQKezlKyX5cnez92lI3lt+sNi7YBLuk9Xl0ciioxgQvv+CMqVAhHir0Uf8FEw0zDQszE4B7wfboP6Pqwxd+ZuBF8AaeS0iPud9gqH40b8e3t0xctoS/n5agGjIzOiUojaKSvhVxBXY5qnKWO3yDHbxT1kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d6mqlZ5w; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d6mqlZ5w"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-aa52ec07bcbso62002066b.2
        for <linux-sound@vger.kernel.org>; Thu, 28 Nov 2024 12:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732827165; x=1733431965; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qob0FBpsUU/sx2eCBfCzGQ8cEgowX6VKZMzDfM9xuIE=;
        b=d6mqlZ5w4+yY9RWcRKAtZnx1M5s3HumL0HXiZuI/4QZbUkVSG8MU53OgCwJr5R3eJL
         nZ5zQzLqRrh/i8rYa1hiHYLnyI1OTOrGMdDTc3BUGzeWQM7jBsMgnnsrIH5HsnMBmi3h
         0TMSPjctG2AMD7i5FAC+VUqZPE4RE70tP5egjKb0uay1xZEL0QGLMAfVHHr7W4Wlheb8
         Xm50xlwt2uuQ2Q2iR3KAgUDHfFs5+4ZhZniDYI1hp9RdSPBXtGJMPiP6E1PmoinJptMj
         gzQKoAK/6xx3LVrLkh1j0HangPrOqzcFuFrdgTTjbm6MYvB+qdUhirtvWeDm24qz67BU
         /ZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732827165; x=1733431965;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qob0FBpsUU/sx2eCBfCzGQ8cEgowX6VKZMzDfM9xuIE=;
        b=pyW6/LVyT4A80Tr+mFdz/BxBoHjG9zJyyPGDkkXgckF4O1r0HbLrdAGzvmleg3ruxh
         EEPTkYR5KsjJg1vy4sF4QPRngpf/qL8lQDsmGSbaMqedNaafp9glnzVZyxL859uQ7fY+
         Pua9QiEl9jQK/qz8YqewdTSPk5w3pjtyrbyO3HaaR+pqQS2LFGx3G0hccKXzG++WzIbP
         UzatJxwPT546IDCGyMTC/HHJ83wUf3aL1s5qoLFf0iu07+lnSPWqWzbGVfluDqwGtuFz
         6NdZeSL//9Ze5qUY4KnftUfIBycJ05snVSIXVJBMIojDJcUkZzNfJK2gorpZHVwoBInn
         C/lg==
X-Forwarded-Encrypted: i=1; AJvYcCXUygUHOaMMxzlRQgoOlZsnGJTG2MMxmz8EtIlxPyaXeXHvh38fz1hoe2BPgSvS+7JN4nYftNHDa9eODg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6RLV0WJyDS1n3WEg25f63ZFBT5cvqPBLA5zpoz2pVzAp551LS
	ZKXe6vbABoafbEWnhPTFNm7Ya3fTUc6ZzHvqWSVmwXU59irHnZQKsSwZAzbeTkZLqjAqGaxd7Zd
	z1mSLRry3Z7KBBQ==
X-Google-Smtp-Source: AGHT+IHBgsLr3pLJH/ACZefffdWeb80QzhCBRqY4vhCfqkMxxEok2tAWW+nYrVbcV0Ijh3nfSJvgonr+4y2YvgM=
X-Received: from ejct1.prod.google.com ([2002:a17:906:2681:b0:a9a:bf43:6c33])
 (user=mmaslanka job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:b392:b0:a9a:f82:7712 with SMTP id a640c23a62f3a-aa5810664dfmr643677466b.52.1732827165635;
 Thu, 28 Nov 2024 12:52:45 -0800 (PST)
Date: Thu, 28 Nov 2024 20:52:09 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128205215.2435485-1-mmaslanka@google.com>
Subject: [PATCH v4] ASoC: Intel: avs: da7219: Remove suspend_pre() and resume_post()
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
Changes in v4:
 - Remove redundant spaces from the commit message
 - Link to v3: https://lore.kernel.org/all/20241128155926.1774625-1-mmaslanka@google.com/
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

