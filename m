Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7F2374E4E
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 12:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779454185; cv=none; b=l8ccVsXR2vOcVDzErCXJK8UZ5UJ+ZKwGdTj7I2a/zG0MCnVCxK6sP0keRZnA7jktABPPX3v6yJe2PpWUC7H3AWd1ynYV5UPYiwZr0c/NU5XWZjM9hMoorZ+e1aLeiN8cXAfDwLkOnS3J+rmzcLPTdMoGvv1C76HhRYCw7tOIVLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779454185; c=relaxed/simple;
	bh=txvR/MSiTpf9NorbW6/gmSUwVrOklO38SeSFp2Hr+uM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OvCo+/ph3LFRNPkE3G2UaxN+6Fg5ANKB6rVGcOUF3+WVyUlgXsBJ+f1utTavJ4PscVqE2Ka+CoH356K+iSeydz7gLJbsP1pcYJIJUvPPLGoHR7TWYiW/PjQLwUqEfk8CV4dRd3L4Vc2Tc5E8xc7mNLJRehjOGrvDG6Oc9KOu4+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4Eep36w; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4Eep36w"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3045c195251so21778eec.1
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 05:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779454183; x=1780058983; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rZlYIto97MmzQySh5rb4+w1RJlukSriFG/8QM8SYO3c=;
        b=d4Eep36wljA4e/X+bfnIG4Gfe7BeAl2c7kvNy4Bho+WsMaHOCq7B9iyCI6nFtimtjY
         +RsBy7GMru5kbKIQkhsAfZWhiyunw/1bFpNPurwOr57bFfry8DJfaNCwyz27yhrHy3ow
         AF/uCSQBD4jr5ujYnPDuNoZS7B38wVhVjyJZArVs2D4EaXUY4Q9KOct8GPTdM+7QB0Zj
         q4QKmdZIJA0a5UCCWELY/82GBH95BOtuyg7iQ2BT5uje8PvSerXW6Ek5irOS9GG2vwFF
         geG+ANahmyvaKYRVmtMug763xvcETxYesQxBIS/HhfZkgbaeayV1XmIx2o9U9wrNdMbz
         ZiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779454183; x=1780058983;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZlYIto97MmzQySh5rb4+w1RJlukSriFG/8QM8SYO3c=;
        b=mIcDy2q4z/zKRn5TKsgf+oqCg/NOrn7NTZOXsFS6rKHWr4iDG4+bUTj8R45OxmOLtB
         VchrHmLvJhiGYp6Q3okTY3Yf24n2iGDcaxBuaTPZ6Tb2ZZe46KJA/Mgif2tqm9aDV9Bk
         O5YCWgh45do32gYLPVK5nUeCxAdPCtI94moyKYWkq03QU0Nk7H2KUyzgsAdSk6rHUmgf
         d48P7s7TiFtOizTXuxQQ+/o8a7RqDdPsiQaIK5ZJdDx5WHizzwDzanFIBk/OKDk519fN
         tbhfAGSnxbEDRGgjSGJwmWgi70/Q+f2x8X70L7jjJmdzQnBZDr//W/6Dc7v/hV/29Ikd
         ULiA==
X-Gm-Message-State: AOJu0Yy98eYwvOt0QJJmBVbp3RwiapkmpyWduhgxmGtfVU3FupMyq3ql
	4NJ2yf4P1ehI3QHgdkorqFY0SUovlPaZsz2GaFZDqAtW9gqOSpD6Uv52
X-Gm-Gg: Acq92OEiCc/cFVybbN/IFbq7EY7qG2Lpr2k5Eqd7JxaNPydfNdFU6/fudAGV26LXgzt
	jRA+v+kGbQDwphjYPFigfElUpGr+E7GRxNCX07kDpClA1AA4/k/Oyi/sUoqGlAfYHzLjlZUF4IY
	nhAaxZZA2covVtbjbT1d1Dqy5H3mqHhEn1w7u2lYsCnUXGv/eYEGGUrlxTv5FhE3cpeF2puus40
	UuYp92C+kMUi4PXF62DW4iw8ZF4bCb8RT1go33xgpbbIsSBqRyHz+CYINX89LTY62rml3WEnQPs
	ux6j4I8tQuoInXeLbMQUI9YLBF/4op4oLbEMqR2Fjmvg+6UHiczJ7le9GefvF+Dr/kupnjkZ06C
	wLgYmDKjEYKqcK8rCpQ9KxkvNOCaokgJt3ISIhnmm31xF70BOoTtyrdWhabBBt7IQNBZcWtmT3S
	ge/nekgWe66dD6Dp2dlAXQZFBPmpt+leXYU1F8qBoWLDjnSaixaFwhu71Ua2akwnQBoj5aa7+7D
	Q==
X-Received: by 2002:a05:7301:fa0a:b0:2ea:c085:44b1 with SMTP id 5a478bee46e88-304491037b5mr1762157eec.19.1779454182961;
        Fri, 22 May 2026 05:49:42 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30452230f1bsm903987eec.14.2026.05.22.05.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 05:49:41 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 22 May 2026 09:49:30 -0300
Subject: [PATCH v4] ALSA: hda: cs35l56: Fix system name string leaks
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260522-alsa-cs35l56-system-name-leak-v4-1-a6154dd09cd9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XQTW7CMBAF4Ksgr5nKHtsJZsU9qi4cewKG/KBMa
 hWh3L0J7QLYIJZPevreaK6CaUjEYru6ioFy4tR3czDrlQgH3+0JUpyzQImFtFKBb9hDYG0bWwB
 feKQWOt8SNORPUNaxLB35oJ0Ss3EeqE4/N//z6y/zd3WkMC7o0jgkHvvhcjsgq6X3v4XyxVZWI
 CEqXVljUCu32e1bn5qP0Ldi2cr4loazVsgai6Csk6ifNX2vvfpD1qDAxWgIY6hM+aBN0/QLXwO
 GDXgBAAA=
X-Change-ID: 20260501-alsa-cs35l56-system-name-leak-7fd779eac391
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Simon Trimmer <simont@opensource.cirrus.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4116;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=txvR/MSiTpf9NorbW6/gmSUwVrOklO38SeSFp2Hr+uM=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFkCAfc2dsTuXXZ8tlvc3fezpV8E/jvln6nzvqE5boL9p
 x1P/t980FHKwiDGxSArpsiyOmmR5Z6uB1fr41Z4wMxhZQIZwsDFKQATmazG8IfriXJhwJm9b7ji
 P0Wxa89gOBcfu2/N1Fn7OWabz78aw5rKyPBJ9vDmiZf/fNd5mtU94+nJaMkzGloybiZmW5WnS+x
 fNo8HAA==
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

cs35l56_hda_read_acpi() gets an allocated ACPI _SUB string from
acpi_get_subsystem_id(). On success, that string is used to create the
firmware system name.

Several error paths after the _SUB lookup can return without releasing
the allocated string. This includes speaker ID lookup errors other than
-ENOENT, and errors after a firmware system name has been allocated.

Use scoped cleanup for the temporary _SUB string and make
cs35l56->system_name device-managed. This releases the temporary _SUB
string on every error path and lets devres release the firmware system
name on probe failure and device removal.

Fixes: 6f03b446cbae ("ALSA: hda: cs35l56: Add support for speaker id")
Fixes: 40b1c2f9b299 ("ALSA: hda/cs35l56: Workaround bad dev-index on Lenovo Yoga Book 9i GenX")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Changes in v4:
- Drop unrelated line-wrap change in reset GPIO error path.
- Link to v3: https://patch.msgid.link/20260521-alsa-cs35l56-system-name-leak-v3-1-9dd4e2dcb473@gmail.com

Changes in v3:
- Make cs35l56->system_name devm-managed.
- Keep __free(kfree) only for the temporary ACPI _SUB string.
- Remove the local cleanup-managed system_name variable.
- Drop the probe-error cleanup patch; devres now owns system_name.
- Remove the manual remove-time kfree for system_name.
- Link to v2: https://patch.msgid.link/20260520-alsa-cs35l56-system-name-leak-v2-0-60f26c159023@gmail.com

Changes in v2:
- Use __free(kfree) for the temporary ACPI _SUB string.
- Keep the derived system name local until read_acpi() succeeds.
- Transfer ownership with no_free_ptr() only on successful paths.
- Link to v1: https://patch.msgid.link/20260520-alsa-cs35l56-system-name-leak-v1-0-d13b54423198@gmail.com
---
 sound/hda/codecs/side-codecs/cs35l56_hda.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
index cdbc576569ef..a0ea08eb96a9 100644
--- a/sound/hda/codecs/side-codecs/cs35l56_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l56_hda.c
@@ -1025,7 +1025,7 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int hid, int id)
 	u32 values[HDA_MAX_COMPONENTS];
 	char hid_string[8];
 	struct acpi_device *adev;
-	const char *property, *sub;
+	const char *property;
 	int i, ret;
 
 	/*
@@ -1047,7 +1047,8 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int hid, int id)
 	/* Initialize things that could be overwritten by a fixup */
 	cs35l56->index = -1;
 
-	sub = acpi_get_subsystem_id(ACPI_HANDLE(cs35l56->base.dev));
+	const char *sub __free(kfree) = acpi_get_subsystem_id(ACPI_HANDLE(cs35l56->base.dev));
+
 	ret = cs35l56_hda_apply_platform_fixups(cs35l56, sub, &id);
 	if (ret)
 		return ret;
@@ -1095,15 +1096,16 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int hid, int id)
 		ret = cirrus_scodec_get_speaker_id(cs35l56->base.dev, cs35l56->index,
 						   cs35l56->num_amps, -1);
 		if (ret == -ENOENT) {
-			cs35l56->system_name = sub;
+			cs35l56->system_name = devm_kstrdup(cs35l56->base.dev, sub, GFP_KERNEL);
 		} else if (ret >= 0) {
-			cs35l56->system_name = kasprintf(GFP_KERNEL, "%s-spkid%d", sub, ret);
-			kfree(sub);
-			if (!cs35l56->system_name)
-				return -ENOMEM;
+			cs35l56->system_name = devm_kasprintf(cs35l56->base.dev, GFP_KERNEL,
+							      "%s-spkid%d", sub, ret);
 		} else {
 			return ret;
 		}
+
+		if (!cs35l56->system_name)
+			return -ENOMEM;
 	}
 
 	cs35l56->base.reset_gpio = devm_gpiod_get_index_optional(cs35l56->base.dev,
@@ -1254,7 +1256,6 @@ void cs35l56_hda_remove(struct device *dev)
 
 	cs_dsp_remove(&cs35l56->cs_dsp);
 
-	kfree(cs35l56->system_name);
 	pm_runtime_put_noidle(cs35l56->base.dev);
 
 	gpiod_set_value_cansleep(cs35l56->base.reset_gpio, 0);

---
base-commit: ef807cc07dec16edc7863d437e9250e20cb73741
change-id: 20260501-alsa-cs35l56-system-name-leak-7fd779eac391

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

