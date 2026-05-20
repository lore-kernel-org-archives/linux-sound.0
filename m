Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8FE3DCD9A
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 12:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281297; cv=none; b=X64LP/88Se0xQWDxk+/tjdAdoNKeEhqgPb8EVnaaN+S50g6eAsavwdZBvhG4WNHt4g1hfJgkOALp4I2wYAqzfIOvvd4pZVgbPQArWcaA2eEczG9IeAhOl9rDp7kZiO3kXmdtjnj3QRojiaxb7Co4hfzMEOcwTj5kWaYyGH+X3g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281297; c=relaxed/simple;
	bh=/Cpye/85l5+5VoNE3PMGOJW8jg0H/AvFn+bL41MROzw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dCjioQAqpirmxLSx6GU3HxFXN6R4YRcEJMA/Mp493UrcIKaEHugoUiOzU9zTCmYruWqyMjmUbhkGMBr+m6vQwbu4/FKFst8wLYEKS7FUDBL7hlcdfhWiTjyq23izyuKVexjIusUhbkvOn9VpIuSruTEGu9W+n9jCBvALnYrJVWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PiO3yHAa; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PiO3yHAa"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2f0ad52830cso6050039eec.1
        for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 05:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779281295; x=1779886095; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IsPKxbuXp8bIHXw7mrMUt84IPLQf4nAluOd1bRhe8z0=;
        b=PiO3yHAa5OSR9lAKYGYwGyzZwhACOqFINiimkduMh2VMoCaHm7eJhhVo5+U/oXGK0F
         CofytsPHlkm7KRG+zbzDPOonqAxHJr/P6NRYg5rnj2JsJ3HzHf/eqfPkPbRsRZdX7oMK
         Llb0g2ihKQ+KPlA0k5J7K4Njxz8Kj3dINUvQYSdVNe15oIm4lyzJIdG76XBHgppHF7Rg
         /RpNrn/dNvZzLmq8baLyLVASs8ADAWrWPA+0UOGtvEZS9JoQ72YpX5G36OBuYfYza0fE
         nhXFoe+uQEM1HkBhv/GxdjjLqXRqYxS3zSF4XBwB6CdYObMVlFKCS1/ohJPOf4JCB03z
         XrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779281295; x=1779886095;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsPKxbuXp8bIHXw7mrMUt84IPLQf4nAluOd1bRhe8z0=;
        b=dlz/hYzu1Yqe8Q6JI0DDDoME9e0LO4zMh3o+ZNuHyQM3W6Q/ha7sKK/voLtVBbD4yq
         6TjzUBNBJo5Av3MU78mJT1l5/c+ly1t4JaeZz41GEmoXr15mRQmjjHsidHAKTaGa1jVJ
         xgaVrgZakGtgbVWkvWUNpen9Z3hfQCYfm/any0CxNpxmQOCeM6nuiRyfCoiBpSdsx95f
         HgsXZWXAhvbltCdhnYTsu4oT3EDvAdHCVOtF/sYYK8785xam4fzaDTkNdd+vWPxhA7Vw
         Jrr6gHTwtTdrWud8xnrssCziVCWy3jVI0VGCpjqOqucq7WnA3rv7vQh11NLriYDQvMFe
         auLg==
X-Gm-Message-State: AOJu0Ywk7Ve46/wSAc/u/kMpz0wsJB2vxd4/HaOeg+FEjnIyfg/NV88X
	S1USE7P9qj+jugC62SL3+7mbp2RsFbjYG1uQOdVLQbl2r/8iXFqAMZ35
X-Gm-Gg: Acq92OFe3+RlraqkAfdxCHdXJD4m1ZrMr2Y8R6HbP/RvS3LkZPgnKo4Y3ojpBu+Ia94
	vC2NSweOp0E5/3LcGlVCHUVKQxaOcV2Uw5kHlKFpA/zh6fE4oatnqq84SGtOdGhpa5FrtruCJgh
	ixyJzndd5LA2UL9Rz1yTKYDvuNLLicaHnEjZ+soyKwX464y/6o+s+E7x+tCExtkDOwGhJbZPSo9
	ydnytS8GO8Fhrkzc/ehxxJxzR4n9UfxcUAokVlVfkYzCfNZniCdPKgogLzVB/eMDtG50a/p0S2I
	J64pBGO4g4J3FkpH/UAKQLHDw6s32hwMPMOFZijgzfaD0WfnMowPJ34FHnfTGmk6CVDkqYB1km1
	pLXN2cuNxHaQ2AZI1bPqDE1FHjGFOW5q48OFePNUsKqzP58vPjPyfwmJL7yaJMR8EHzACN0eI5+
	e4zmiCiI+Qdwv/K0FIZL4gvirZN+MLVB42NOSIplvqq/fkFgfMcKaAaeTae6toubhFsDmnx7hYK
	w==
X-Received: by 2002:a05:7301:644c:b0:2ed:e12:376b with SMTP id 5a478bee46e88-303986b14d3mr11733461eec.33.1779281294824;
        Wed, 20 May 2026 05:48:14 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302944ffb85sm19114045eec.7.2026.05.20.05.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:48:14 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH 0/2] ALSA: hda: cs35l56: fix system name leaks
Date: Wed, 20 May 2026 09:47:59 -0300
Message-Id: <20260520-alsa-cs35l56-system-name-leak-v1-0-d13b54423198@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAwA0F8hPdtkg4wFf8V4qKNodUyzgtEQ/
 t0Jx3d5CyhnYYVjtUDmt6g8U4E9VBBulK6M0hdDberWOGORohIGbVx0LepXJx4x0cgYmR7oh97
 7jik0nYVyvDIP8tn+03m3zpc7h+mfwrr+AB0GUveBAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=907;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=/Cpye/85l5+5VoNE3PMGOJW8jg0H/AvFn+bL41MROzw=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFm8a1sf7dz+8VdLVKfSwWcz5CSP5ZTt5F63ZW/67LWb1
 fe2L369p6OUhUGMi0FWTJFlddIiyz1dD67Wx63wgJnDygQyhIGLUwAmsvccI8OJjPOq9584KHlb
 blo/4ZT7deGGtvWZXye1Ll7yublAVucUw/94v6OJjk+1uued22kaxh4pFf9wgeqOc5n/XERe9wl
 P52ICAA==
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

cs35l56_hda_read_acpi() reads an allocated ACPI _SUB string to build
the firmware system name. Current error paths can return after _SUB has
been allocated, or after it has been transferred to cs35l56->system_name,
without releasing that memory.

Fix the local read_acpi() unwind paths first, then release the stored
system name from the common probe error path.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Cássio Gabriel (2):
      ALSA: hda: cs35l56: Free ACPI _SUB string on errors
      ALSA: hda: cs35l56: Free system name on probe errors

 sound/hda/codecs/side-codecs/cs35l56_hda.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)
---
base-commit: 38c607c673155d6335591cdbd9c785fb2b7550e5
change-id: 20260501-alsa-cs35l56-system-name-leak-7fd779eac391

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

