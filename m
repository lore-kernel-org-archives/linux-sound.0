Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA29F2727EF
	for <linux-sound@vger.kernel.org>; Fri, 13 Jun 2025 08:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749804695; cv=none; b=NDSB1jwlXDCILto9UQlhBy0n3iGE/2PHsPCVhEAiPoYFwgefH9enU9bgJCe+gB+v0Vbn/Y28oZ3piZFzL3stKGa/Z6ynyEkuN0QWrRV+z+XCq9MQhvPR2WXZgaPJhY9UQiLtSQDMApV9E+yVJDzsuD6akVBBAqdtixY58O5D9Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749804695; c=relaxed/simple;
	bh=ue1V2fMlHFxjzWDa7ywds9gbO56VeSoCDkL1sUWu9lI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hBoFQXa18fzesCpjPySpmJdArniAAEHZCjcxjT1gRkrU3znMoI1pnAbsBIBnChvAAB6w83itkIFsAnStGrVl++FkDvgMYj0OKB4drmUljgB5EDnKz0HQvnv29rYIhf1yxhL/QTojaI2bfyXvCX/X+8GvCiSvxDe+wb0cDkATqE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Vk+RyFkP; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Vk+RyFkP"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-73972a54919so1743190b3a.3
        for <linux-sound@vger.kernel.org>; Fri, 13 Jun 2025 01:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749804693; x=1750409493; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ra+cpBxpnqunFQ4OV0qpDstT9OVa7F5M+0LYQ6+T/Pk=;
        b=Vk+RyFkPfsKDz9H8vL9zUnNbxgif+YWg+5F2GR5B7w9ZmBDKFr03ds2eDlVBYjH+oi
         Q1ZHrs9Ag2cclFvOX8IuDuHXhd+g5Qng5yG78feKQ9nKKN/Livg/1R/614VrYLg+4/Wq
         I7bbbvFOfbbMYTuORd1rCBKXn6xrHH9IH6/wY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749804693; x=1750409493;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ra+cpBxpnqunFQ4OV0qpDstT9OVa7F5M+0LYQ6+T/Pk=;
        b=PIL0YG0C477AONx1vkhWNqT9B84N2+2ajekJWvZpzOLJDsm8QpHFFjf7Fkt8YadBdz
         3uQh2bUAhLsymv8ktQL8OR0mSuqEcOk5p7S3fjM5CWUL2E+lCIK0pfJJANfVo12gHTID
         /VFulm80+YK3oxm5yaymOiAoL5Xtn3s7zGln6INU1PWWSqj047OX1/quOSXQKMigEV++
         O34V9WPuffEzdxjKzEWfzbhL+5QkZZJJgpmv/ERqY1FfCNSIxfHGi72AmBE8m/8qqlYf
         upi5RUnZMfuTAU3Z0k+4k/eolQtp/AseK7Tr9J/B8zwYUnM6hoCnfEEP9tKp0rCsZhQ3
         d/4Q==
X-Gm-Message-State: AOJu0YxXYqD0+jUA72jHMLLRZr2dBlZv91nqihiQfuRa/rrqQ9zRh/Ii
	zvoFMpxr+PhHnja0ABZt7gmAC0mV3z9V9wwH8aW3YfyefLqd5kdQYHtKM+Bt6J+RmA==
X-Gm-Gg: ASbGnctPEJO3JR9UfS+v9pWfg5t9k1hxNGuN4KL9Gj7BVkabYizUL7G7wUyEQsKprGV
	oodVgqsJONpE+Axh6ueZfCdcAGuWV3bIS50n091rZsQS/scVMuVnN9d6alO1k4mzgZ5mhTK6Btb
	LNSYXP6RXDXVjDHuCfFXOJDF2opeGqseQUxlWazHH+U1z2yFUIVIgurM8Bhu/jKFym/VXohm+c2
	YwkWqFxZKgKvzUalpIJq9H6pmHBg3uqEFb7MotLkJZHzWlLdREP6ILqHrFEKdQbsxaSjamyKbUa
	fvkwLYfoa/yelbKw6wuQmaXWTLQ5F/Je9+KzBo6UnfgXfhjFFc3+AglIFxAJl9KcGi8/IeBW8y2
	dvC2PLR8TehhpMTMTZMZl0Fo=
X-Google-Smtp-Source: AGHT+IH9vwPEaPkVV6IKS2ERa3AkzSRnik4hPp/d8F3OsHuqwJVSjrz2eaWzpBszwWSFt7ME9aFmZQ==
X-Received: by 2002:a05:6a00:984:b0:739:50c0:b3fe with SMTP id d2e1a72fcca58-7488f6cb9b2mr3944526b3a.8.1749804693085;
        Fri, 13 Jun 2025 01:51:33 -0700 (PDT)
Received: from htcheong-p620.tpe.corp.google.com ([2401:fa00:1:17:6b54:d556:d2c0:44d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900affa1sm1064510b3a.118.2025.06.13.01.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 01:51:32 -0700 (PDT)
From: Terry Cheong <htcheong@chromium.org>
Date: Fri, 13 Jun 2025 16:51:27 +0800
Subject: [PATCH] ASoC: hdmi-codec: use SND_JACK_AVOUT as jack status
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-hdmi-v1-1-665ba7ecd5e7@chromium.org>
X-B4-Tracking: v=1; b=H4sIAI7mS2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0Nj3YyU3ExdS3PTtBQT46SU1OQkJaDSgqLUtMwKsDHRsbW1AJu54AB
 WAAAA
X-Change-ID: 20250613-hdmi-975fd43bdecb
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bailideng@google.com, judyhsiao@google.com, yuhsuan@google.com, 
 Terry Cheong <htcheong@chromium.org>
X-Mailer: b4 0.14.2

Use SND_JACK_AVOUT as the mask to align with hdac_hdmi driver so that we
can determine HDMI/DP devices from event type.

Most drivers that uses hdmi-codec driver will not be affected since they
are creating jacks with SND_JACK_LINEOUT mask. They will still report
SND_JACK_LINEOUT when the jack status is updated with
snd_soc_jack_report.

Signed-off-by: Terry Cheong <htcheong@chromium.org>
---
 sound/soc/codecs/hdmi-codec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 31121f9c18c91a7444420c7ad2a10fd5ea406dc3..e1933f733af1032bc6f8fef1de4356a346aabcfa 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -943,7 +943,7 @@ static void hdmi_codec_jack_report(struct hdmi_codec_priv *hcp,
 {
 	if (jack_status != hcp->jack_status) {
 		if (hcp->jack)
-			snd_soc_jack_report(hcp->jack, jack_status, SND_JACK_LINEOUT);
+			snd_soc_jack_report(hcp->jack, jack_status, SND_JACK_AVOUT);
 		hcp->jack_status = jack_status;
 	}
 }
@@ -964,7 +964,7 @@ static void plugged_cb(struct device *dev, bool plugged)
 			else
 				snd_show_eld(dev, &hcp->eld_parsed);
 		}
-		hdmi_codec_jack_report(hcp, SND_JACK_LINEOUT);
+		hdmi_codec_jack_report(hcp, SND_JACK_AVOUT);
 	} else {
 		hdmi_codec_jack_report(hcp, 0);
 		memset(hcp->eld, 0, sizeof(hcp->eld));
@@ -984,7 +984,7 @@ static int hdmi_codec_set_jack(struct snd_soc_component *component,
 		 * Report the initial jack status which may have been provided
 		 * by the parent hdmi driver while the hpd hook was registered.
 		 */
-		snd_soc_jack_report(jack, hcp->jack_status, SND_JACK_LINEOUT);
+		snd_soc_jack_report(jack, hcp->jack_status, SND_JACK_AVOUT);
 
 		return 0;
 	}

---
base-commit: 27605c8c0f69e319df156b471974e4e223035378
change-id: 20250613-hdmi-975fd43bdecb

Best regards,
-- 
Terry Cheong <htcheong@chromium.org>

