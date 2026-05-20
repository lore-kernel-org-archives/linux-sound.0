Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA8E3E173D
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 12:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281300; cv=none; b=k3uPqlwR9jRcDFb4Jx7lo3K8NfgqKJHShE5GrV0MTZ/H44eXGjq5JB0eNqNJ23EUOZSYVrejHLLpAMrFf5BKeSkUsxYCxNxho7+IJhXClTbeHLKZF1qEPooAcF+dYj4y1PXRW8sB/dXJRmLh4HlIiHuKYO0boqbQiW2n+MBiAZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281300; c=relaxed/simple;
	bh=pzF0og71GCMqa1o7+nozJoEdON5VIbd9T9osgpd0uKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UZuDTvFhjbg97Ev5hDhAB/wyyDWG2dR2VJrp6f/0d8lkPwcKOJFk1w/WSX6AjeR3udLbojIEegL1k+gIJsw6rEOORFVN5iZiUzj3k4okGfbwKTPmrwrpKuR1aNMg+LIJZCho8BEPD6rxQGptHMUZVDpohWtPzusn+wlYgjO/PdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qnxAEFk2; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qnxAEFk2"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-303f2fb7225so2972021eec.1
        for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 05:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779281298; x=1779886098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=55N8gJPbgFI+xmT9kNqqCzucTvZ42KxOQy3IwLLODuA=;
        b=qnxAEFk2Yx2YwmYXwVqPGAyiUtmjZXXy0wm9C+rpwc5HPiH63thtC9exGxNMY5UkJU
         lwjRUd7myRj8i9OoGvr7+BdYJ6jx0hiElRR2JzhEFuT3CSXVBbrdu2mpU1pzd5eN7umb
         C82sNSURZLo4ckA2+yECRJ23fRww+QcmZ7hiWKTGzaQ6Z83Z/khJJk6/A19VI9ABHF/x
         OKfhwqtIgY7bP8QFIvK9I/JguHU7VYurcphTIcQuDT9WrNOnXm++QRcmkJSZFfymuYWP
         W9Fg7+bAOrQDFRwi9CVlvZRsyh8bKRzrV8whxO65n+hPS7V/Dok8Mezy9yAZ8GuAsjOC
         FR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779281298; x=1779886098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=55N8gJPbgFI+xmT9kNqqCzucTvZ42KxOQy3IwLLODuA=;
        b=lmzdR0i0aBX+DYo39SVkrmS5/BA4X0XR4BckFCh2B0PZERfnKBU/KSRC0csjjW6mAv
         62FEjY0gIA+QuRL6rpeLL0alRyyJeqoEG7BunzCgVnXj9XAoSzTnAU67Mr7hGOtQaVd6
         4lrpWCwQG2pMzV6MMhDJyeOvVXYDEyryZ5tQZC7Pl3+gPNb8umWV2lvCpKbS8ZKt+9oE
         ZHEismk46zeNJhi4mQY8g8VLdbfXkLasvmYwjzV0nYrCdUeZ+eyx8kAtURqyuedKM1b6
         Af9Oj2EHILqn7o0JtFdP85Yp0LQEonkwrk1dbMTwO2aQVZX+cmTpX6SZdTBJ0ZAKnJfz
         Ycbg==
X-Gm-Message-State: AOJu0YwXLXD1ZYPWUk6/evfb0LKDmiiQx5wIgV2/AM1GBpYf//QxD0FJ
	S2xKM8wtk+M8j5V5p3+vHJmeOY6g/dON+lcaoDMU7M1qAAVR1m8lg/eO
X-Gm-Gg: Acq92OECV5S3d6yJ6Rhv6KHxTa4U4BCb273BKUiDpbvoqCsMbtNHDm5kpRy+wel80OP
	0/ujm/mnPo8UaaG0glaZ6qBQ7c3ZC/UJuXwmAbsRCELHj+Dm+MqdAalhlOzOom2T3sI9Clo8GzB
	Efox6nb5iAAzaL2NwhZPgq8+sh3OqfKtR2FLa8a+UzBTrzhzxUFVMRakr0jH8JY6FQHQh+Ws8/z
	hirVu5WvYVX0T+FKUwezFbNtwj1mKhIY9Bvw8v+bqS/b+51qAVOqeeZypwsY49SqESZGp5r4uOh
	fX8pbzaKL7jwbe35IHQjrpprL53mwfO1RNWkorviLy9UkYwAwJwUPCLxT/Qma2A3ClAvkyocoZt
	MgLpOmqomVT1OxvJOECEF1JeEjClBo4WhbRrUV3i3+diJs7AkveA2Y84myeXyplIdFKLDdg763E
	2bPnXDeiJtAR7xgbFTs0pBOkiPqppVULk6MMnFMkyKKuwOJg1x0ldpauXCVEVsifRL7yhcmVoQh
	Q==
X-Received: by 2002:a05:7301:7c0b:b0:2ed:e14:42e5 with SMTP id 5a478bee46e88-303986ba6e1mr9711834eec.30.1779281298257;
        Wed, 20 May 2026 05:48:18 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302944ffb85sm19114045eec.7.2026.05.20.05.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:48:17 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 20 May 2026 09:48:00 -0300
Subject: [PATCH 1/2] ALSA: hda: cs35l56: Free ACPI _SUB string on errors
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260520-alsa-cs35l56-system-name-leak-v1-1-d13b54423198@gmail.com>
References: <20260520-alsa-cs35l56-system-name-leak-v1-0-d13b54423198@gmail.com>
In-Reply-To: <20260520-alsa-cs35l56-system-name-leak-v1-0-d13b54423198@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Simon Trimmer <simont@opensource.cirrus.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2859;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=pzF0og71GCMqa1o7+nozJoEdON5VIbd9T9osgpd0uKQ=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFm8a7s735i2c21lPW5pWnDxZHjp3NqHp4PLFvPLsizqk
 1z0vrKjo5SFQYyLQVZMkWV10iLLPV0PrtbHrfCAmcPKBDKEgYtTACbyt5WR4ZL1VVNP7rNlz0sb
 Vnft6Y60nvU0WGfDPe+FlzOig60+hDL80zvlx2OQnp+tNiOh3W/3MrXJryKU/kke2Cfu1r3owSs
 BDgA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

cs35l56_hda_read_acpi() gets an allocated ACPI _SUB string from
acpi_get_subsystem_id(). On success, that string is either transferred
to cs35l56->system_name or freed after constructing a speaker-ID-specific
firmware name.

Several error paths after the _SUB lookup return without releasing the
allocated string. This includes speaker ID lookup errors other than
-ENOENT, and errors after _SUB is read but before ownership is
transferred to cs35l56->system_name.

Free the temporary _SUB string on those error paths. If ownership has
already been transferred to cs35l56->system_name, free that member and
clear it before returning the error.

Fixes: 6f03b446cbae ("ALSA: hda: cs35l56: Add support for speaker id")
Fixes: 40b1c2f9b299 ("ALSA: hda/cs35l56: Workaround bad dev-index on Lenovo Yoga Book 9i GenX")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/hda/codecs/side-codecs/cs35l56_hda.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
index cdbc576569ef..7b5fc63eeaa8 100644
--- a/sound/hda/codecs/side-codecs/cs35l56_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l56_hda.c
@@ -1050,7 +1050,7 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int hid, int id)
 	sub = acpi_get_subsystem_id(ACPI_HANDLE(cs35l56->base.dev));
 	ret = cs35l56_hda_apply_platform_fixups(cs35l56, sub, &id);
 	if (ret)
-		return ret;
+		goto err_free_sub;
 
 	if (cs35l56->index == -1) {
 		property = "cirrus,dev-index";
@@ -1102,7 +1102,7 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int hid, int id)
 			if (!cs35l56->system_name)
 				return -ENOMEM;
 		} else {
-			return ret;
+			goto err_free_sub;
 		}
 	}
 
@@ -1117,8 +1117,11 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int hid, int id)
 		 * If RESET is shared the first amp to probe will grab the reset
 		 * line and reset all the amps
 		 */
-		if (ret != -EBUSY)
-			return dev_err_probe(cs35l56->base.dev, ret, "Failed to get reset GPIO\n");
+		if (ret != -EBUSY) {
+			ret = dev_err_probe(cs35l56->base.dev, ret,
+					    "Failed to get reset GPIO\n");
+			goto err_free_system_name;
+		}
 
 		dev_info(cs35l56->base.dev, "Reset GPIO busy, assume shared reset\n");
 		cs35l56->base.reset_gpio = NULL;
@@ -1126,10 +1129,20 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int hid, int id)
 
 	return 0;
 
+err_free_system_name:
+	kfree(cs35l56->system_name);
+	cs35l56->system_name = NULL;
+
+	return ret;
+
 err:
 	if (ret != -ENODEV)
 		dev_err(cs35l56->base.dev, "Failed property %s: %d\n", property, ret);
 
+err_free_sub:
+	if (!IS_ERR(sub))
+		kfree(sub);
+
 	return ret;
 }
 

-- 
2.54.0

