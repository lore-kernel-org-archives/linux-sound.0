Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B55B249EB
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 03:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783222715; cv=none; b=BliSzLLgrKk8MQdOeUkQ2HM5sZImYreZNLQVjbRoJQQb2LYJbUweRWYqNwshXxGGjxGyb3OLKuAcmlrjmENZViGUGgg3/aaCu8oWYswvIW4nLuTD8/dR27USn42W9tnfa+iaoAtkzo5A32mAyB0RBPF6sZb6BLDdy25sL8iX7dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783222715; c=relaxed/simple;
	bh=+2zfy9xq1aeQoP0qTkCTVoXz/akpPRJUOmi4fBQNTvw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oWKNvSaAE0XeCNHe+Fbut85rwiUgpdkiQS0mk4xw+Owovm7OvU020pxPB+fHuew/tM6Xo+NiVOUbg8tRDleU4Rb4dQcPKSjaGmYJhzB5anykJ6xtLZggf9dgnRMvfsKQiiV3UDL8UZo65iMSdXHwMyd1lUE5+4pRuU3DNnbPkZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ye2HM6Jp; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ye2HM6Jp"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c96bfabc8d4so900126a12.3
        for <linux-sound@vger.kernel.org>; Sat, 04 Jul 2026 20:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783222713; x=1783827513; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2bSaAgXz2vnEVHwr4g3ugEAGdhW+11p6q+FhFBdwcqQ=;
        b=Ye2HM6JpAE9N6GfW/4qnT5OhVJrIhsx2Pr7lUGrZMI5o353LcNfL4a2lO+l3ZsFYrT
         yEu0a8pOWq9MM/jRxZoy51mL9qbmUXpg+GJeyHAIHHcDPVTEW7lPs9SCiKbd6SEU6E8P
         Z4qjmeMJ4mmyUEARq9M8xSF4njIFIaEJqIzjjKUNps+1ofagq+kjtQnxHPA6PlBvwI3P
         gTHY2inNCMD4eRbjoqC71cNHTdzmhjzMedflWvqIa+hnlOu60ha8s96KgC5GeSdX6lcV
         9Jd8acdco/oOEK/0D+xB7+Cs5SZLn8tYm2sK1nl1yIs+53GeLS1wk5/Htz6zkafG8zY/
         pSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783222713; x=1783827513;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bSaAgXz2vnEVHwr4g3ugEAGdhW+11p6q+FhFBdwcqQ=;
        b=iZ32Y9onWTWlv0D3aVcXb8vp99D4J2Qs6JsPq2u8eytCkXq8t5Zr4ZiUFwePC74RjF
         g1IKBI4VWIlQvOMZOq6PZ+kJq0CBWjnqBnGG4RKqgk7//F2hp05TZWgqSGEkT0krOBSJ
         69lUfYzEV8Q5w/wG+TyMapusx+zJbowDvtBEdfXE+Q/QhzCdpBjYEupZw3QaZWNaZRn3
         Qqh4Mipci9Uysv3iP3rfFTGfHATm94g3BakYfBNhyYXiX+rzr3yuVF9yf6cZPTsmfMyG
         MqNfwbR69SYpsB/aSRxLixQYkV44nScn5FuCaVAukjeMC+dJks/5L1Fm8Vck04YGcqY8
         BK9A==
X-Forwarded-Encrypted: i=1; AFNElJ+CjKptIKuBYTZYih0R2RjxTUYRSq+1TSxci90f2JPMexdg6uJnwf8kHjkkU8vFh/m8hsWhewSFyaGt5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAzC8Vs6PqlmpioLVNSI4yGLO1zmfUhPXwWcgKPONCkGdex0W+
	KVMRMVvB9zCWJN1gJh/QuY69rEeq2lcdfUSbRWRZBLwU6bK1xSmGHsCR
X-Gm-Gg: AfdE7ckcFYkCGNES8gmNc8lGecxI+UWYYxGBM+0lYLgHribjIZZZhbDK9rwkHBSbBnG
	DJAf4DKm8Vx89pJpFGwRjBQBoSYRmi3yY3rDSXHqH2zPifLywDW3oycTVpjdIxFFrXa34AVPDfM
	HktiS/VkZTTGlwuhiz9EwmWB3JYzZQAREuxdyXenAOIGe5VnYNBTL3Er7aMuuGOn7voaRqP/PLP
	IqN5qmzHRq/Mr3OwC2tSF+e0gpq8pKsfqUKUT2v3Nm0aDCa6TVqRSf6SxcgVwAOPGKhT+F3bX0k
	ldxdw9BaGMqoxcn/CSzPmyLWbhm1T01cS9zebFlBwu0jeSw2UbLxaQyeaxrqmQXUOsbomGuxjTv
	BsDm5keBK1QDgG5SIHfXWxGC1/czyrSIkCZd/EPFUGl7Au2Hhrz7HMLTEshMaZ/NeE3LRWE3h+5
	ChIgMW/pUgftyqZfeVkgZBRQf7vyDer5mqYuJjVIG9wtSTEV1ScnmHJ/cDiy5MKBBhRT+qhgeq7
	mdX7fOBtA7AJUWGLMNUO2I6OYl9j/i5oAXsExej5TWOkaCBAEqkP6rNtTGBuJ8r
X-Received: by 2002:a05:6a21:6f12:b0:3bf:6d96:ac40 with SMTP id adf61e73a8af0-3c03e1eeabdmr5540287637.12.1783222713528;
        Sat, 04 Jul 2026 20:38:33 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b41c364d5sm35463845c88.14.2026.07.04.20.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 20:38:33 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v3 0/7] ASoC: apple: mca: support simultaneous I2S capture
 on the frontend
Date: Sun, 05 Jul 2026 13:37:49 +1000
Message-Id: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0K6dkwz1QquvIdhUdoBxgAlLRAM4
 e4Cxp3Ll7z//iIiBaYo7skiAk0c2XcbqFMibG26ioDdxgIlaqlRgen7hsCMjj0EcuMMxa24KJd
 ZiaYU264PVPJ8NJ/5l+NYvMgOe2g3ao6DD+/jdMLd+/XTP/0JQYJWmKLObKav+Khaw83Z+lbk6
 7p+AJTXFNjEAAAA
X-Change-ID: 20260623-apple-audio-redux-b7b43d9c02af
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2352;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=+2zfy9xq1aeQoP0qTkCTVoXz/akpPRJUOmi4fBQNTvw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmeF7d0fvlgtS9byPC5R998Dv6Vz15dWyfkVHhAp6N5l
 /Xsv0yiHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKkueM3wV+jfghf+u9b3PT85c1pLUm2f99dS743fA7Nef9PdML/wexIjw3K2qtm
 rbC4UvX/1pPdm44SuNHe96nlXvuc0bzufrnPiIjsA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi folks,

This series introduces a number of changes to the ASoC driver
for the Apple MCA peripheral to enable support for bidirectional
I2S. This is achieved by allowing frontends to act as clock consumers
and logically ORing data input lines when multiple backends are linked
to a frontend.

This allows the Texas Instruments speaker amps used on Apple Silicon Macs
(Apple-specific revisions of TAS2764 and TAS2770) to send their IVSENSE
data back to the SoC. Since these amps do not have any sort of integrated
speaker protection logic, we must use the IVSENSE data and the Thiele/Small
Parameters of the attached speaker(s) to implement our own in software.

---
Changes in v3:
- Changed magic number write in fe prepare to BIT(port)
- Link to v2: https://patch.msgid.link/20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com

Changes in v2:
- Drop readx_poll_timeout use. It ended up being unreliable. Fall back
  to just bumping up the delay on SERDES reset :/
- Rebase on asoc/for-next
- Drop the one patch that was applied
- Drop clock shutdown relocation patch. This was not actually required
  and the incorrect thing to do anyway.
---

Link to v1: https://lore.kernel.org/asahi/20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com/

Regards,
James

To: Martin Povišer <povik+lin@cutebit.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Hector Martin (2):
      ASoC: apple: mca: Do not mark clocks in use for non-providers
      ASoC: apple: mca: Add delay after configuring clock

James Calligeros (1):
      ASoC: apple: mca: increase SERDES reset delay

Martin Povišer (4):
      ASoC: apple: mca: Separate data & clock port setup
      ASoC: apple: mca: Factor out mca_be_get_fe
      ASoC: apple: mca: Support FEs being clock consumers
      ASoC: apple: mca: Support capture on multiples BEs

 sound/soc/apple/mca.c | 300 +++++++++++++++++--------
 1 file changed, 207 insertions(+), 93 deletions(-)
---
base-commit: e67251245f42eb4479636d4c082cdbe60b23f5b3
change-id: 20260623-apple-audio-redux-b7b43d9c02af

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>

