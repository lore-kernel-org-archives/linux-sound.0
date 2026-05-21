Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA61E3DC875
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 13:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779370462; cv=none; b=XuXzWk8o2CR0KNnRce69mydMALBmq98L+S1/69MZWXYcZzGEPg8xZIPi5b5dRmV73JBL7YKOfNv5B5A3EZsCoIz9RmQKa1yH4yj/3U27Meq5XUIx8LRRybTLq1x7CRrxdakwdnYk2iQw+wj+8dSd+tg+XEM4O7AzBhYAUUN4FWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779370462; c=relaxed/simple;
	bh=gK5vRG3AhdnrAyb29uC9wmyCZlRnTbvlVjdqCKc94bA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Bs64AsG+12TzVCju47d6MeOFpOW4gOrIO1em0SZJ95GB+t0qpPDg+OM7dmKZCM4LUPwYWu7DrD9HM8LcmRuoykTKVq1cjcaTJEXoafyy/3ea7Put+ca1A37I+glYbxH7WnqjA5pB3lVv3QlVfUfNzQeEdF/8bi375Wh5P4Rr3BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZ9rEpf1; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZ9rEpf1"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2f0ad52830cso7858389eec.1
        for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 06:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779370459; x=1779975259; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hzI/Ekgy0+pONVfm0czhGsoJW62Z+1OSx3Ehru5Xq6A=;
        b=JZ9rEpf1dIFr0qdNtIufqr8PjNT4vBxEuqi45gGMdQ9TQfy+8RoGBc47oF4CwbxPRY
         25G7w6Ngp0KxTTOPsobN1Pz42CbkXKg3+w/I9Cat+HTb5ORmtonekKFVYWQpWBU4Q5qJ
         mbnMqLi+rCdT/o2ZGXY9myTzhx3akPk+j0hSH0VDSHGNn/H6v2HQKI3h0ZWMyONAHBBU
         AOu3mMrSSYrGntKBytN1WShoJLrr+p3vtFRGcNMETmjaebhzWPvoqDFu5B6TjK+8VyIq
         1oTygVPz+zheNVyQmLmfpDi6pZzZyXz+MhxgEb02t592dDEbflETpbbR/NiCVTzphjPH
         RXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779370459; x=1779975259;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzI/Ekgy0+pONVfm0czhGsoJW62Z+1OSx3Ehru5Xq6A=;
        b=Tlwverz1twKeLlbOtkO87w6Iw6PUK/HoLlNXiurJZkWjho7gSay9R2VPCML9MiGH3H
         rkHWL8wdgcOrleZ8N3mP383hvU4LEHwNcKyHWPbGgL6OHrglzxAAfffkPm1yejUQP2Ju
         nrwn7sNaq/l0PvS0j6bRzRIcIxSuFCRTa3JOV/vhMLUvnP8LNouXjd93AyxJ61+XINyO
         iPq4DotSCNsoU77t9ZJ860Hutmoo1+ZKvxST8u/h6K+ubIS0nd4uS/dya4ohyEbygZAy
         FSAgIjsx9Mn08lrku1mmVu7xU48/mFJ/NIiV4FYhmfG3pDwLFOK38rsoapzc0O0TZBFK
         f4yg==
X-Gm-Message-State: AOJu0Yykk1NDM9KS8CHjTwMAHbVcW4+UpUzPykVeuS5y+5vxb2mnZ8qi
	vvsBx32nLdJQ0D3NklI4d0vQM/fm4wz/A4CkI/grMZSd+cJCg5Dyg2qp
X-Gm-Gg: Acq92OGvfyPSNX4Y4Qd+NoRoZTdPDt1SjE+h5Du4kXw5de08bfLELhbs8U0yykXzFSe
	GwPNRjc/SyhNUSY1GTJc3E2BS47+JUfOzIRXoSYw+H6CL+ttVRVAFx8xOF6z2L5mqddVBCpwmNx
	y3cGkrpEslUBEKtb2haDqrsGjKOnxQxTzDwgsXBwBuSYzafWmXTaSLLfLsdE3nGIe6XVSNrE25u
	Wqtzr759lptZUn90ZDDEIHEIDsxyeyXCXhGmayyMWpzXEDxG1ciTZoycSNTn50+Nq9G0ilVqV6V
	IMewuPCS997tu8KGX5FclN6Te5bOivQXmiYqBH5bTT/2jNaJ5/jEPwfQoR5SP8xmL7zS8b97pIf
	AEt08FA9OcG2Fa0hy1EjPt3v4W740xJf7ovIJ08nLhLIzRAcNi/qLHEGDFCHPRtuheEyY2/5R+T
	DXt/QQGdxO6m3uqC9XC3dblcwseHOMbF7VO/GaqEnuZid0RAW+SbXzl1CYtin5D8DWAQG+h3HWs
	Q==
X-Received: by 2002:a05:7301:e8e:b0:2c1:6cfd:73ee with SMTP id 5a478bee46e88-3042f94d9femr1639663eec.24.1779370458794;
        Thu, 21 May 2026 06:34:18 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3044330894fsm505067eec.8.2026.05.21.06.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:34:18 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 21 May 2026 10:34:07 -0300
Subject: [PATCH v3] ALSA: hda: cs35l56: Fix system name string leaks
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260521-alsa-cs35l56-system-name-leak-v3-1-9dd4e2dcb473@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOyw6CMBBFf4V07Zg+aBFX/odxUcoAVR6GQSIh/
 LsUXbgzLk9yc86dGWHvkdgxmlmPoyfftSuoXcRcZdsSwecrM8ml4ZoLsDVZcKR0rQ3QRAM20No
 GoUZ7g6TIkyRF61Qq2Oq491j45+Y/X95Mj+yKbgjSsKg8DV0/bQdGEXafluQ/WqMADrlQmY5jq
 UR6OJWN9fXedQ0LrVH+ZZOrzfBCGid0yqX6ti3L8gLHgSYVKgEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4391;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=gK5vRG3AhdnrAyb29uC9wmyCZlRnTbvlVjdqCKc94bA=;
 b=kA0DAAoW0F0/Glr/7oMByyZiAGoPCdeiUfJq9+kVn0I3/6JjlrLXc1t+76whcEziO5bMLfEL6
 Ih1BAAWCgAdFiEEq2KiObyK4NV/XqhI0F0/Glr/7oMFAmoPCdcACgkQ0F0/Glr/7oPwFQD+KaM4
 tBApR8UvvWxZUyfYd3tVYBllbroa0n4VIAokbf0BAJe5/pP2IYmaW4BZRrbm8BZ1mFy7ecbUu8S
 HDX6A/UIK
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
 sound/hda/codecs/side-codecs/cs35l56_hda.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
index cdbc576569ef..8213d62ad74b 100644
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
@@ -1118,7 +1120,8 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int hid, int id)
 		 * line and reset all the amps
 		 */
 		if (ret != -EBUSY)
-			return dev_err_probe(cs35l56->base.dev, ret, "Failed to get reset GPIO\n");
+			return dev_err_probe(cs35l56->base.dev, ret,
+					     "Failed to get reset GPIO\n");
 
 		dev_info(cs35l56->base.dev, "Reset GPIO busy, assume shared reset\n");
 		cs35l56->base.reset_gpio = NULL;
@@ -1254,7 +1257,6 @@ void cs35l56_hda_remove(struct device *dev)
 
 	cs_dsp_remove(&cs35l56->cs_dsp);
 
-	kfree(cs35l56->system_name);
 	pm_runtime_put_noidle(cs35l56->base.dev);
 
 	gpiod_set_value_cansleep(cs35l56->base.reset_gpio, 0);

---
base-commit: 38c607c673155d6335591cdbd9c785fb2b7550e5
change-id: 20260501-alsa-cs35l56-system-name-leak-7fd779eac391

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

