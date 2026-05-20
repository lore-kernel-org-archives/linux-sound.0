Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA013EA94E
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 14:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288667; cv=none; b=OqGC007I8HUeLtQ+IfI7AjZ6lPYsxpAo05nMxsNf8uRPeno6gCvsJey2HF1medoUcybraFAGr62Knw+x95zAW7OORqC35eNBWlqYmgB3z9Cd1mGFkxXhAWleYfBnPpq6iPJK0DGxchn27T6bJhumEgWG56fltHSxQh4BCSMKREU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288667; c=relaxed/simple;
	bh=e2XahwLfjgnbGHXH0VP8xhIvz7Nouf4bBUNY3er2lmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qPWXCQmdJOa6Cnki5fcZR4zFspta2FSnOnFKH3Zg+triPI2cZjbxvs5y3PKGDQAWDb8zNZCaQgPVf0dzLpPvWA/07dwRiCt/MKt4+3ml6kdsc6fO9rJSWX3T6StgD06rEiAo/7TFmWVm/eaqP8qqNP7NOE7IEe2DV6vqQqc42xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNsM4N8u; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNsM4N8u"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12db2e415a7so2365100c88.1
        for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 07:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779288665; x=1779893465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdQkYsR4QLAUHGmj1zuNkkqwdRGcQivkMOHXJMo1kLw=;
        b=UNsM4N8u1hCiM5BtDWvNH9ekVXaUvo7oKtzkKJZPwjqFmCL4HHPMVxwiXfn9KGHlJs
         rDDBNKCLrMsnU0R5oH7xc/qX0PIL2k+QF1zqDgWlwuzwa8JTrCHyxUGOlCHZTDMeVAxe
         PGFeVLwW5xfIsHEH+E6n1lAyEzWEzt8GiNwvj4uth3mNh/XuWZ6aNbFiUmE048y2APO3
         onCi/fUq2qf8LLBkjeDkMla02c8bSzxU7vAjNLmLv02TFZI7GsUnUKwyD3yOw1KT8ukG
         23ia2aPoGvhNStNt6tPCPjO+DQdSCUnDWOKk8/IsDbtK5ff5uH62zGW49XKU4xJBkmXJ
         Q79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288665; x=1779893465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wdQkYsR4QLAUHGmj1zuNkkqwdRGcQivkMOHXJMo1kLw=;
        b=LRM35xMamWQT14bjF6BVcaa2M20oVICu5hDpepLV7kzzRo6hfDZyKdyCPFiolhQbun
         /E7djzv7JnIRQE1S8JTMqb1lMVLkW2bX5y5IKNDmDK5l9o9ARl1QR/Ub8tjPQhcKzj6h
         soB8SnTCIcyI87SMkYV8sycaMBCz3Lrqm53Sr+teaPu9h4Yufq3PY69HnDEIuHCSzGRg
         HuY82yU2+15XKEsCSH55gNZGk5Cncu43B+n6me4WwJwJiRJkKle3iWhyABgk71jetHll
         P5RLWlOxJSzcxPOjE/Gd5w+z3j0pG3FOS8q/X+NPbtasN6l3OWK6lzLaZkx7ml9mJ49Y
         r66w==
X-Gm-Message-State: AOJu0YzKPwob4Omelfkgmm1dVJ658wcSfDjORO17N+hQKnFnRgwoIcBG
	XZ5Y1GQzOb6yti9Owc5IbXO7WWbY6i0vwJGaTTy/1RAXvB3sClHlagWM
X-Gm-Gg: Acq92OGNOJgUCrqvioekYgIsRSOGcvAytGSeBH4T6uMtB2T6vH7Jgat0gCBOYKiEFYI
	aQ1DLF6juVMcQlK4OksN68cXROGspXsEYrk3eth+IYcoF0M2UkN3NMaK9XLJ70kADXf2VyyRxoJ
	UDD+o8zK9qoNo/fIkG9h8akXrA5qzDwr7Vd43VQ2hRPuzbMgUYlG7RJd2g7C2OxjucenmwYcfJc
	KanFjBG7Vl/+HipwbikzCWNCjN3aM3wqSSnOEiqp+cvOQAJxYMJR5YSjBlHc8eSRZ5G5Qhjtstn
	xhPNQ43sfbyuMbEE7kDzm4R+DZOj3SrSvwOecVIBzFVCJ7y6SIg0DLsYp4IOKW/MEJPfbp09MYN
	UQnlihD45J9U5Dom0Klo6JLLzLngDvgumqeDwGT6X9Z/n8e9Yz3EmW8txKvZS2BAaYPukKUXCBE
	L8rZfube4o9c/Uzr8YTMpLsPFcKe6dWoWvMRR+DMh/SlDUDEcfHt6B4vjCDI+hOS2+wU/nXLRAS
	6Ga8To+D//u
X-Received: by 2002:a05:7022:6621:b0:134:a710:d908 with SMTP id a92af1059eb24-1350451887emr9291142c88.13.1779288664871;
        Wed, 20 May 2026 07:51:04 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm27334864c88.3.2026.05.20.07.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:51:04 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 20 May 2026 11:50:55 -0300
Subject: [PATCH v2 1/2] ALSA: hda: cs35l56: Free ACPI _SUB string on errors
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260520-alsa-cs35l56-system-name-leak-v2-1-60f26c159023@gmail.com>
References: <20260520-alsa-cs35l56-system-name-leak-v2-0-60f26c159023@gmail.com>
In-Reply-To: <20260520-alsa-cs35l56-system-name-leak-v2-0-60f26c159023@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Simon Trimmer <simont@opensource.cirrus.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3244;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=e2XahwLfjgnbGHXH0VP8xhIvz7Nouf4bBUNY3er2lmg=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFm8pwJZ7ndtEu6RPsw+rTtLsvXHF0GTJw7PX3ApHdsTe
 X7Wsg79jlIWBjEuBlkxRZbVSYss93Q9uFoft8IDZg4rE8gQBi5OAZjI+QUMf6Usfs/0e3BCwje8
 +daSq4t/P3O8qzb9wx+1Bs329WIXDrgxMhzlN7LZ4ZP6snL6Vf0aNQ3V6qdLv66e3+4kZxz0YL/
 yHAYA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

cs35l56_hda_read_acpi() gets an allocated ACPI _SUB string from
acpi_get_subsystem_id(). On success, that string is either used directly
as the firmware system name or used to construct a speaker-ID-specific
firmware system name.

Several error paths after the _SUB lookup can return without releasing
the allocated string. This includes speaker ID lookup errors other than
-ENOENT, and errors after a firmware system name has been derived but
before ownership is transferred to cs35l56->system_name.

Use scoped cleanup for the temporary _SUB string and the derived system
name, and transfer ownership to cs35l56->system_name only after the
remaining failure paths in cs35l56_hda_read_acpi() have completed.

Fixes: 6f03b446cbae ("ALSA: hda: cs35l56: Add support for speaker id")
Fixes: 40b1c2f9b299 ("ALSA: hda/cs35l56: Workaround bad dev-index on Lenovo Yoga Book 9i GenX")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/hda/codecs/side-codecs/cs35l56_hda.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
index cdbc576569ef..7c9c98436757 100644
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
@@ -1047,7 +1047,9 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int hid, int id)
 	/* Initialize things that could be overwritten by a fixup */
 	cs35l56->index = -1;
 
-	sub = acpi_get_subsystem_id(ACPI_HANDLE(cs35l56->base.dev));
+	const char *sub __free(kfree) = acpi_get_subsystem_id(ACPI_HANDLE(cs35l56->base.dev));
+	const char *system_name __free(kfree) = NULL;
+
 	ret = cs35l56_hda_apply_platform_fixups(cs35l56, sub, &id);
 	if (ret)
 		return ret;
@@ -1095,11 +1097,10 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int hid, int id)
 		ret = cirrus_scodec_get_speaker_id(cs35l56->base.dev, cs35l56->index,
 						   cs35l56->num_amps, -1);
 		if (ret == -ENOENT) {
-			cs35l56->system_name = sub;
+			system_name = no_free_ptr(sub);
 		} else if (ret >= 0) {
-			cs35l56->system_name = kasprintf(GFP_KERNEL, "%s-spkid%d", sub, ret);
-			kfree(sub);
-			if (!cs35l56->system_name)
+			system_name = kasprintf(GFP_KERNEL, "%s-spkid%d", sub, ret);
+			if (!system_name)
 				return -ENOMEM;
 		} else {
 			return ret;
@@ -1118,12 +1119,14 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int hid, int id)
 		 * line and reset all the amps
 		 */
 		if (ret != -EBUSY)
-			return dev_err_probe(cs35l56->base.dev, ret, "Failed to get reset GPIO\n");
+			return dev_err_probe(cs35l56->base.dev, ret,
+					     "Failed to get reset GPIO\n");
 
 		dev_info(cs35l56->base.dev, "Reset GPIO busy, assume shared reset\n");
 		cs35l56->base.reset_gpio = NULL;
 	}
 
+	cs35l56->system_name = no_free_ptr(system_name);
 	return 0;
 
 err:

-- 
2.54.0

